Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942399;
	b=nh9y76Mab++52i72Yf4U4BHZhGpzPKIpv/Wvm8A0VNozPjghNWij7zQ7vZ/UGbn1EHdj
	 39xM5YH4WncwL63HBuEDVxMZdlKhkUWrWctPfUmmKY5U0A4nnrqV9NLxDt2P9g8WFBPda
	 isZhi81fMhIwwz6tmrrcWIV8WAJb2FmsTrjPoWV1hS1wR5XPDDV9U5VoF7VLdswK9SfVF
	 JctYYm5ph0WdT2v6spHc6hI94xduv6aNRcD/JsnvdOTFUGaZQpkaBjH9JCc2oNuN7LAIj
	 q8purftSrEToFmOOcec+uqnKRtzv5Ojr3M+edgJrud0i8acdEdGvyAU+fDzlgc+oyNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
	b=oCLnEobPEjK9LHqlcB+b7RJyq/9lXM+Q/sXNI1mgO20dL6hs7JRMD1mO0i6mByI4TjHW
	 kZB40xei4cZ/+5yzMQ2/Y7YDWFDXDa9gtWCj9ZVfsUglQevZaoNXTp/NlE8qNSELgtLYC
	 Vje+BXT7eNzaw4VJ46/9AoZUc/xhZlZ4QjXnPp3AE7sv+vwqpj8a93G1vts9Bc2i6zvuG
	 krBAdqSJOQr472bT67fFuYmBWGnul4kPr8+SYftPGEPmpCzWSOY55EPHE+TvxWAgCCHN/
	 G9XkWD3dVTjBxtpj3UJ5TsxRdQB40HM21uSaDju2NqmR6k4729aFH7VpkDxKKAspJ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dN0//pmJ";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96757606D811
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96757606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN0//pmJ
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e942864693so1397955ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942398; x=1794547198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
        b=dN0//pmJEAsF076fr7W5z5BEW5z1sCCCCExDgz3ojvuzceMpBTTCMJg3SFVrge2w5E
         QIlfFUTXmg1u1F9Rx8NJo6+w8LouBjqmsSq6w2BBpHOm4PZ5/7S5SFrCpJw3JaOHl+cm
         ebF1jrw5JlBru47P2yG894K7CYnr0KgBwzWvd7Zaflq3EfYhkPDzGAMgRLANXrLXwM0k
         okjGUDtEgBC9zBCtIpbdzFK+siB7Lsv2I1bhRzgkHdem/Zff187B4YIo76S4S4y2WQlz
         /OpY1tTt/UA8/TuJNZsxnOvjrxmNVLIwWDmdIK7h/3FYou/q0CfQlCKhc/6zcxfe2vXM
         LAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942398; x=1794547198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
        b=IOioxVWirTwq56hWIKsCALZp9iIJ8PWgqGsdAaY7d+0PKCZObeENzOkgaUGK+mj0FZ
         kmMTP4kJexLZjXJ1kJJtJ6la/BcG1VZ+HGgKVSn4XTYwd6NqUDCfIZepZDV+Zo0mzKur
         EPxki6vfRkcfvCJfaq5rVCN56ZPtUKBloStot05SsP0kXuAFOV28km9gjj+aBCeLwfUl
         ZvstlnbUDpaW4yDPk00/3ZcEEqrJLVruLiYXptUs5hRRMHyl3BGA/SbUOsm1UX8e+ySk
         d0uOGRfAchR51dUhTsMLeo3NIDYtjm15jEP3FuwMq9KJxYL722BWlSewECQefMutk+GM
         EhUA==
X-Forwarded-Encrypted: i=1; AL+hErF7B6HPpLWmjfXReQvW397IBMLAUHgGZy7PiVNkdX6KvtDUghCFsgsX6WzK1R2Hqsf0xQrTLIFr0FkXjPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oVLqr9BEY9bFD9Ldw1VlL6Y2T1puFZJxsEFl7uJNmq65vugiP
	PtD0IBHGeQ/ubLuLDGRQOQdT6MViOOJ+hetwrACs6ZMdvIY2vqGHrTWo
X-Gm-Gg: AYBFou18j3LtSbr33GiOIZ4BmmqMGz9n4aFauB72XtFqJrhCnAj4NzP7ieu6zyr78jn
	9OasmWtU7+Ofyfwcj+9RQTrg8oaErDacyJlH1HmajO9zADRqQh9nVJwjz4mDJMcZUL7crFRdS06
	Zhh/tk4v4J26jMv2Svs/CAXnRlqpxxrk2Z5r1jgf6bmcZjH4F8m5XlpI1/0FJInRg8oT5VEy3v6
	83Hlen1J8yzz5eFym/8lQA14/QdatDcYBUocAqrf4Na1kFAyq8/I+iIROC5IjyW9AezIaPzopL9
	X/TPw0F6PliVNAd1iuNt81o+3wHPtadIeHi2DAgXDXwKlJxiF/Kew0yBV+5wiPM4Eb/0MLzo21d
	xpcVfeeum8pG3qXr+zmXJOHy+QSGenTnqMEiPDag6DB9RJv/i7IjgNKH7q+62t1f3KqyBfFD00+
	SWYlLafMB+Ee9bgfcKcq9gfwPpIvm+HE/L3snlP3fgKGqzVJabS2jvxzR7e658QUy2mh5KeYNIP
	RvNrReyjfbbbpUmruCTFdIykGEMCp1DirJnswltQd2MEWmNuAT6JTbXGwW6J+R5kj4bQNxsPSuJ
	r+M2rCttQqC9pbAaeuWSayDm5PECor2nqL7UJReNVLRP7wUYWtRltPhvsiPya/+mf+vC8W+l1ST
	XT7aNY0SS+y/dBkQjx9Y02EP5Cl0nNuovsxL29dlmbrhHmOdaCW2/oH58xyBZtYD8XywCo7G8An
	6IcdU208d1La2MV+tibUIKxCPKcGzWzLwsBi32IsjO
X-Received: by 2002:a17:903:1b67:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2ed40abb311mr24361185ad.18.1793942397995;
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 3/4] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Fri,  6 Nov 2026 05:19:04 +0000
Message-ID: <20261106051905.218638-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected()
and dequeue each skb in unix_dgram_disconnected() so scm_stat_del() is
called before kfree_skb_reason().

Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 52 +++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 44c0a81dd423..47120d81aca2 100644
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
@@ -616,8 +638,12 @@ static void unix_write_space(struct sock *sk)
 static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
 {
 	if (!skb_queue_empty(&sk->sk_receive_queue)) {
-		skb_queue_purge_reason(&sk->sk_receive_queue,
-				       SKB_DROP_REASON_UNIX_DISCONNECT);
+		struct sk_buff *skb;
+
+		while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
+			scm_stat_del(sk, skb);
+			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
+		}
 
 		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
 
@@ -2058,28 +2084,6 @@ static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
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

