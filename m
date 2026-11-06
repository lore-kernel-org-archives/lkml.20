Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942398;
	b=MJekhl4s5/ZUun4RCU54xTnTEUxJNUrxDRDN8zX6o/mqUdp0TknKccg3AWuduZa+gDbD
	 kQIvemFEq81iGqsVq0xeawtA58J05oQn/ndCiuvFGviTFPcqPfbBQqEKJO9H1P/oO1F5X
	 V6ViqRn/UW35AQ9IxXoVNEDFw3gEOfzxbZRc+jvs6hch9axO69N9f19bstpXWPQP2Q6h7
	 ksBwMSweZQw7EIOd/VRfQ7OGxqX0ZvEn/4m4D0EJad7b7T7YwzyNcAs/laiHcJ0TaAnbf
	 JitvAFglPm9HivfzSJT31P7ykvZoGpqGdfuE7aidF/MM2lTp8WHgGlpjJH7A2nqUYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
	b=04DW/VlR8hG94AyvocTLUaurHGGmKAE+ZfWAdbgtSe27iJCVs0UNzYF2+g619X5rolxO
	 GdPBzR4Yq7TNQz1BuT1hFhLBeldKzsWvWm16feaIS1HY0ZKVrK4I78vxS3Y92NRKiI53T
	 m8MG7o0BQyrm9jqsJQnVC6og7QEBLdVO5JUP4/hta2ef/T5Ht/h3GUrW7oanlA0dxENC5
	 SryvSyzbi6gUC2hKqY32bhkNi4EZoiVABSILZf4vRobgvJf7fx+uVa/BhS2oiceHG99pN
	 bv5oi8KicZ+rW1fiu0BWpXARtWJsIWrznsUz6e0YvkEUhrazbpg/ZusVhGzFIAMZHug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+Uq06TZ;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA1606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DA1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+Uq06TZ
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eb18f4da15so604215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942397; x=1794547197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
        b=m+Uq06TZrgkYbYCHL9DYUhOfI7OXXGQ/XGe+HIg/Yl/9gU4OVMjrnifav3P7LJN6qS
         Ydh3IxNyIN8QcpJsKLREom6SnbM74H9Axejd87mVVSto6GLRKOgFSAtg7Q2L2yfBk6ca
         o+lC6IIyrOoopaPwo0khtwK6uvAoo54DsRs4MjNIoMx0l9bpE4GKfhIwovF/O8/qy44G
         /68V64cP57nl15tnsUw7pLcqxhNAT1e+UwpkVWEZqlez6ORks/NhMKoKfdKRtnRTTkzL
         vdQsphKoqpSkUQiv5Ox16IQajdouxkv+wRgVzwcCzlXvNKMPGzdxMuhIu2htsiGXqTSb
         C1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942397; x=1794547197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
        b=n7dSQ+x3gdpkURmnAN7BzBmll8PROpWMBdb3zuRS6BfqR6dFk/KezBMQLgqiKG/bmO
         h7K0x8VqnheSOcOJJLhLFrlcDpoiKoJMfUmxjYKwtplA7ZqoZHQVMRwGaFtt5YRZaYTG
         FPY+BIsUyJb04+MdHkJrt2rYXGCJkSg6QF0z5Hu0zyFMeoYVg2uLEQnmFjbdT316T7FD
         4W9B9QZ0K3R1EsTE6vIXxMgvXgnoaU865BOPoMIV136pqnssrqgU9p+T0SreRntyTLYi
         FJYVrv3VxmKzJ//J24328lyHAfZ6Ea8uvH++Be+9Pk4/6SxSILzioxvCYAApACY9XLNs
         985g==
X-Forwarded-Encrypted: i=1; AKwUvBzW7kexYiLGujmzSDSHApQjy5pw1HoyKKNV7cTqYYaGV7m3reQPOm+wQJAtpis2ssMvEhCMsp/wYaTA4p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jCYKJ8JIc4GVUOs3L/qIYDTjBp2a7smCFzgOADEVocse1OeQR
	ugnA4cC0UPKf/7V3fFT+EHlPnxesePKAuEGz6XgcUf8dylXMQ8jHJXr2
X-Gm-Gg: AYBFou2oq4XFVePHsBaIINSAqSno6CO5DxkBgmWadTQ8vCZDoIr8HhmDZOgeqmd7d99
	mFHoCBU2IpIOIHzoPi73rd0mcyyEG4UgzVHDnaMeZjW1ZmBBnGnmVNq2b6Aa0MjDuw82RlXB+1l
	YTHBwEXRVxlPwRG7bqVZLewjASGEZJ52ZPmI5esERrYwiQffoD5RNdgUB4Nv4U6PIaYTQk2sCyh
	JjxA69jj62NzcgQLu2xyEtaaXBwxbGor33C9nkC31gPkBiWqfICte4SayMqwQ18yjGDLvDjjopf
	/ULIAut+wf9+5se8r/YZDD+xbHpAQzB5h/CwuzC6DsG9PmY0cnRkCTnxE9+kVf0dnCmCJFwSThO
	hfr8ynIt4791v5exREAWM8Qcwfs2wYAcYCGn6i+EPmY1vx/5v7D0iXcjYw/T3fabSOGmNBYsLJp
	6hFASHgtXwC+96sQAoisjRTn/MvvD12QjXQ13cVSyNNxmz8x6dPr6qGtZEXhOj71qX3uZOrMx5Z
	//6RxoJCxTns+NLiYSJ/wQu7qaYXY00r7lRq5hGC57CClspTNKA2NmQyEaFrTnCWip7c5szwls8
	uJyGxohlGwrjQVj5PMn/gas49Mr/oTrWE9Sv0vhe8LTWH+VYbffKb8fDhkqN8uYtPF8BqQ7+01I
	ddgh4X8mz/0cGhPg+GlqwsJnYTqKBwWLcZ8SWc2wtjcmz+KPb0y666VvvIKzK5YwFBBA+MKHcYl
	qqlOMDiQAaxqTDI0904mEWd2j3wyrreNPctl9+W/6/
X-Received: by 2002:a17:902:e946:b0:2e9:4bf3:37a1 with SMTP id d9443c01a7336-2ed40dedf76mr21903265ad.63.1793942397302;
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
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
Subject: [PATCH net 2/4] af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
Date: Fri,  6 Nov 2026 05:19:03 +0000
Message-ID: <20261106051905.218638-3-sidchintamaneni@gmail.com>
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

When queue_oob() enqueues an out-of-band skb carrying SCM_RIGHTS file
descriptors, it accounts the inflight descriptors in u->scm_stat.nr_fds
via scm_stat_add().

However, the paths that later free or skip an OOB skb do not call
scm_stat_del():

1. In manage_oob(), when !sock_flag(sk, SOCK_URGINLINE) and an unconsumed
   u->oob_skb is unlinked as unread_skb and dropped via
   kfree_skb_reason().
2. In manage_oob(), when a consumed OOB skb (read_skb) is unlinked and
   freed via consume_skb().
3. In unix_stream_recv_urg(), when a consecutive MSG_OOB read unlinks and
   frees a previously consumed OOB skb (read_skb).
4. In unix_stream_read_skb() (SOCKMAP), when skb == u->oob_skb, the skb
   is unlinked and dropped via kfree_skb_reason() before reaching
   unix_orphan_scm().

Because unix_destruct_scm() has no reference to the receiving socket when
passed descriptors are not AF_UNIX sockets, u->scm_stat.nr_fds (reported
as scm_fds in /proc/<pid>/fdinfo/<fd>) remains permanently elevated.

Call scm_stat_del() before freeing read_skb or unread_skb in
unix_stream_recv_urg(), manage_oob(), and unix_stream_read_skb().

Fixes: 2aab4b969002 ("af_unix: fix struct pid leaks in OOB support")
Fixes: 32ca245464e1 ("af_unix: Don't leave consecutive consumed OOB skbs.")
Fixes: 965dc93481d1 ("af_unix: Drop all SCM attributes for SOCKMAP.")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index bfaab7c6d720..44c0a81dd423 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2807,7 +2807,10 @@ static int unix_stream_recv_urg(struct unix_stream_read_state *state)
 
 	mutex_unlock(&u->iolock);
 
-	consume_skb(read_skb);
+	if (read_skb) {
+		scm_stat_del(sk, read_skb);
+		consume_skb(read_skb);
+	}
 
 	if (chunk < 0)
 		return -EFAULT;
@@ -2867,8 +2870,14 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 unlock:
 	spin_unlock(&sk->sk_receive_queue.lock);
 
-	consume_skb(read_skb);
-	kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
+	if (read_skb) {
+		scm_stat_del(sk, read_skb);
+		consume_skb(read_skb);
+	}
+	if (unread_skb) {
+		scm_stat_del(sk, unread_skb);
+		kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
+	}
 
 	return skb;
 }
@@ -2906,6 +2915,7 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 		spin_unlock(&queue->lock);
 		mutex_unlock(&u->iolock);
 
+		scm_stat_del(sk, skb);
 		kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
 		return -EAGAIN;
 	}
-- 
2.43.0

