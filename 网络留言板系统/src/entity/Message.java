/*
 * 
 * ������
 */
package entity;

public class Message {
    private int id;         // ����id
    private String message;  // ��������
    private String author;   // ����
    private String postTime; // ����ʱ��
    
    /**
     * @return id
     */
    public int getId() {
        return id;
    }
    
    /**
     * @param id Ҫ���õ� id
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return message
     */
    public String getMessage() {
        return message;
    }
    
    /**
     * @param message Ҫ���õ� message
     */
    public void setMessage(String message) {
        this.message = message;
    }
    
    /**
     * @return author
     */
    public String getAuthor() {
        return author;
    }
    
    /**
     * @param author Ҫ���õ� author
     */
    public void setAuthor(String author) {
        this.author = author;
    }
    
    /**
     * @return postTime
     */
    public String getPostTime() {
        return postTime;
    }
    
    /**
     * @param postTime Ҫ���õ� postTime
     */
    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }
}
