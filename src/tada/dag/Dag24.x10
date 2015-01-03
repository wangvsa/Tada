package tada.dag;

public class Dag24[T]{T haszero} extends Dag[T] {

    public def this(height:Int, width:Int) {
        super(height, width);
    }

    public def getDependencies(i:Int, j:Int):Rail[VertexId] {
        if(i==0n && j==0n)
            return new Rail[VertexId]();
        else if(i==0n)
            return [new VertexId(i, j-1n)];
        else if(j==0n)
            return [new VertexId(i-1n, j)];
        else
            return [new VertexId(i-1n, j), new VertexId(i, j-1n)];
    }

    public def getAntiDependencies(i:Int, j:Int):Rail[VertexId] {
        if(i==height-1n && j==width-1n)
            return new Rail[VertexId]();
        else if(i==height-1n)
            return [new VertexId(i, j+1n)];
        else if(j==width-1n)
            return [new VertexId(i+1n, j)];
        else
            return [new VertexId(i+1n, j), new VertexId(i, j+1n)];
    }

    public def printIndegreeMatrix() {
        Console.OUT.println("indegree matrix:");
        for(var i:Int=0n;i<height;i++) {
            for (var j:Int=0n; j<width; j++) {
                val node = getNode(i, j);
                if(!node._isFinish)
                    Console.OUT.print(node.getIndegree());
                else
                    Console.OUT.print("f");
            }
            Console.OUT.println();
        }
        Console.OUT.println();
    }
}