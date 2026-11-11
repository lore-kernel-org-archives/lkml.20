Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437516;
	b=HYIW0ofT/ep1C8znCALJk9VBMFcSW7QioP/SOUIjRlT7w143glfd3W9RaugmQvjwumFy
	 Nm5ncbAfwhJdXuKs7JtkxeGd/iLFPXBtxBhCTT7FcSGEwC/OnlapcUGG9wMBub94UPI0l
	 cfFJQxF6cSHsz7EgM5NP4zWhnC/dFNLalZgrjRe1AastoBdrYlWHTGMl7FJumtpzdh/ss
	 RLp1548gZEqYb5/cqKrRP8KUkxfF4IU+XPHjsfEB1riyVKEl6RpFORWiXcD7qhdDpVefC
	 ck/0EvRtZgXJMchggIXc1qLfpVFajgfHUaPX2fblbNKMRfz7lcbTap3XhKPgiRvo7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b4bZKC8l/stVb8IdDlz7ZRPG3wHaoZ3G+SCD8Xq5KG0=;
	b=EfF4M9Z/PzblRoBp5Fq99QvtJp1PBYNHGUl1ET9d/+I46HZ2RWJQJp1/oHdiRUXaqTpj
	 jMIEEhbhY5/juIHI39xu8hUtH8KXst0wgF39xJAtubUDCn3UyyqsCbHCygNcmcOlITWZr
	 6zZ+RVbql4E4J1kQNKrPV78zQEySmzYrsDWemk0GoZ/6czt0AeCn7t0gd8EjvcKu0Mqms
	 /oCtrVnOYjZInUGS48jsCZuVGOQVQAXQ5kU+OiqW+zi9hTiKvy4jeWZDAXGY0F4ctKRJb
	 tc1VrOmYTM5DrC+tUGfouSmQ2n+kfwQakhdHQ94Sy98Mfs71WlnB0uF3/tOqL2Hmi+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHKspmDp;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1FC606A8AD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1FC606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHKspmDp
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89d6bd67045so155777b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437515; x=1795042315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4bZKC8l/stVb8IdDlz7ZRPG3wHaoZ3G+SCD8Xq5KG0=;
        b=vHKspmDpUQ8KMm5L8YItAJAIwlu8eQo+5o/ptHXEIGWhUexMkRWiRpXSACYFv8wbeB
         4e/z8EDqI/afq4BLX9eVob34Wp0D7juW2pHJffzCTZqQvSySNhYHJ4WPOXU3DvX08Gb4
         MHbHefnN+YwIc4BP7rK8rfmhGuCD7Uk7h8czUGK3pjCyGn3vrQQK0qF2uXtty4h8hUhz
         yDBs7ULbKhKVo4HB6biUsKC8UTyu63jXzwD715WQVvcwBNyOIHaMZF6GpD8U4xPV6fhv
         GR8Bnbm8C8VvYwoGZ6CJMrYlwBfrZl6N95ov98VzRJRrjZx4A9vB/OGc+jpSXGEzsF+n
         acmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437515; x=1795042315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4bZKC8l/stVb8IdDlz7ZRPG3wHaoZ3G+SCD8Xq5KG0=;
        b=p2+GGhuZ3Y7inEMz8g165vGVsG42BfXPVzTINipj4Q4L0tL4H0LqkHfqWiUAiwPvRu
         bLO6PS9hHg1HlY8mkDRB6iMUUcSywO4ifNaBlJL7yRSHFQzxCsFsWocvDxTJMaUo5s2X
         tr5Tojw5LjjSXeaNbQCHkMMD+iQ0fAmhBlwecuosfRb3jIJxMQXlipt+1PF+t+lakBQH
         JRmDCtcaOXkXqfNpQ8PAFYpxLbtj7s8ZtVGSwFin9g3Xri5uLQi4jNGwnOvaWY+SPV8d
         PZ7wAoiL/IrXKK9AdYc3UtcQek822Gvp00C1sAIH0KjB8VrRsxzGyEN2VD9VSDloxpSv
         Z5RQ==
X-Forwarded-Encrypted: i=1; AL+hErFMpZZCqBowvFJAL/s+tuAoSI75yxLtODSd3VNwNtyxpACadZCXtKLZMuvMBKrxRNxYbmYJn2KqoyHo5XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NOg5pZ5ZB1/7oljhGNhynVP9KYs8VNC5eBhMUCBgChxw5xuaR
	cZYRa4y4iGgPmSNCXEgn2aeaLAW4uftEPoXeFzkfGVeWdOu6OXRun9CR
X-Gm-Gg: AYBFou29VU36HljxwJl77emLKpBItMv6cbnGpcioNXPYgp6NH8uusKgyGGs4L/1Rjjr
	q0dK1GEuVxrpbvZH+yM6SFdbJP7bPKBLk/H53sFW4CXJQdGFPn9O+9WpZ2Xmch7wibsYn8Q7dHI
	kXulS0cCS4myykRKx5loswS1Oal5NH7r70F3vSAhFbal4xDtKvvz9xNxbiD+E/ctB6T1QS17di/
	xOwSFog0g1ElvCKc9Aq9+Moc09IZlh4LzOwn6DjF/vtyYCdz8PthXJLPtuh8ksEXEciRCbl1Xe3
	QxvkN0K0lMv6/8hw2I3x5nm+R8BCYewIVuIpUoZnIxJIf2/JwNTVZugJto5Ro5dsKgPcV6B6B6i
	Gz2i8VAh5aA5kqI6bB7gCrDIV+OByV8wifWBP4A7DcBo4pKiBkwcioxFzoWFnpVhx8dQ5/vWlaa
	BjTaix5fh6IyR+WD+VA/EGNDdSsLfS/q+pBxYo91vEoh0FzhKI/MW1W5Uf47AVjksiXcbVK5ePU
	zMYapnRCb1Ivdh9t3C/wzBJx5cEPXvz8eCR5/ZuiUB+/1mnjmBKWv+uQDvMI1OwEOfsjoHOWpYG
	OFVsWI3pRd8BMLitglZl2hoV78yp7bw3Rj1F9JiMxPQzSiJumfROiBOB5HE75RMkk7bFUwU2bDk
	LA/r8O4p2E90EpYdvT6sh0qCATGjVLklNqgtDYlkKzQsjgSXwo7k2iI0DQAlBERutaHF2LsAaKD
	GJy80C7P34MDWMQ2Zp0DJinzKJ90dXNhUvqNDEEqoS
X-Received: by 2002:a05:6a00:4b54:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8bd5bbc8438mr542029b3a.3.1794437515312;
        Wed, 11 Nov 2026 14:51:55 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2471575b3a.22.2026.11.11.14.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:51:54 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v2 1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Wed, 11 Nov 2026 22:51:47 +0000
Message-ID: <20261111225148.88506-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111225148.88506-1-sidchintamaneni@gmail.com>
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a connected SOCK_DGRAM socket disconnects (e.g. via connect() with
AF_UNSPEC), reconnects to a different peer, or observes a dead peer in
unix_dgram_sendmsg(), unix_dgram_disconnected() purges all unread
datagrams from sk->sk_receive_queue via skb_queue_purge_reason().

Because skb_queue_purge_reason() frees each skb without calling
scm_stat_del(sk, skb), any SCM_RIGHTS file descriptors attached to the
purged skbs remain permanently accounted in u->scm_stat.nr_fds (reported
as scm_fds in /proc/<pid>/fdinfo/<fd>) for the remaining lifetime of the
socket.

Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected(),
splice sk->sk_receive_queue onto a local list under the queue lock, and
call scm_stat_del() before kfree_skb_reason() on each purged skb.

Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 59 +++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..990a98330d9c 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -609,6 +609,28 @@ static void unix_write_space(struct sock *sk)
 	rcu_read_unlock();
 }
 
+static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_add(fp->count, &u->scm_stat.nr_fds);
+		unix_add_edges(fp, u);
+	}
+}
+
+static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_sub(fp->count, &u->scm_stat.nr_fds);
+		unix_del_edges(fp);
+	}
+}
+
 /* When dgram socket disconnects (or changes its peer), we clear its receive
  * queue of packets arrived from previous peer. First, it allows to do
  * flow control based only on wmem_alloc; second, sk connected to peer
@@ -616,8 +638,19 @@ static void unix_write_space(struct sock *sk)
 static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
 {
 	if (!skb_queue_empty(&sk->sk_receive_queue)) {
-		skb_queue_purge_reason(&sk->sk_receive_queue,
-				       SKB_DROP_REASON_UNIX_DISCONNECT);
+		struct sk_buff_head tmp;
+		struct sk_buff *skb;
+
+		__skb_queue_head_init(&tmp);
+
+		spin_lock(&sk->sk_receive_queue.lock);
+		skb_queue_splice_init(&sk->sk_receive_queue, &tmp);
+		spin_unlock(&sk->sk_receive_queue.lock);
+
+		while ((skb = __skb_dequeue(&tmp)) != NULL) {
+			scm_stat_del(sk, skb);
+			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
+		}
 
 		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
 
@@ -2058,28 +2091,6 @@ static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
 	       unix_secdata_eq(scm, skb);
 }
 
-static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_add(fp->count, &u->scm_stat.nr_fds);
-		unix_add_edges(fp, u);
-	}
-}
-
-static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_sub(fp->count, &u->scm_stat.nr_fds);
-		unix_del_edges(fp);
-	}
-}
-
 static void unix_orphan_scm(struct sock *sk, struct sk_buff *skb)
 {
 	scm_stat_del(sk, skb);
-- 
2.43.0

