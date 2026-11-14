Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673607;
	b=TwHc0EcThyOWLsm2yxXp7lp3hFyej19d/ot/Vm5uyd6P/25skIQEZhdKN2iV1gTV2piU
	 aVJd6Du+/H4g2KE8HQyYUxoekYX4ro/DaIYJWJNUS0oBVx3hHbqqF1dAmDtEqThwSKoxQ
	 65wXRAk9jCIEgMMtIi/DZGHatduPOKcdYiDV/cLhc/JXyRWdD6hRrRh5yCwceRc5yYH2i
	 RhQgdlE5zgGdePERG9K0IAPXF4c/12rGURxeakTnvqk969lc1AodkB+gcjqqyxWCPypxW
	 ERcVzdAZA9NwJSKhKQ6/mcGOUumGpDSfITZV4whwcAG3dk2boNjFuhnWxoHXGIHLnNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
	b=enOEDYikLTv9RsBy2hV+gfSx5OpsGv4NU71h9aHhPNhpah7UqnKOz+Q8S9OZ4k2eTC8M
	 lgwUoZ4JgnnkC3Z75MF/1m6Z6FapNH6Ho9teV3A6NxguNvDK1YE+5DpOu5v4qfRoS5CqJ
	 YIUszZ/mT6r8NGm6UrkNT5psQhxdaDElcQB5O6ndoGV0khYY5J5NeBzeCxMlYs8lDFz93
	 G3of7saK5HtfP3t//IKQPHscc2pPeaxdBq3NNzI8YU3DLmR3pwp1VQhIt9uDtme7d7tsf
	 DJAXui6mAX/xggNPjAIIMiRBuXPzyfSXSBqelptqC0KpyWlqPLZmj+dM5x1VLvQshJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D2606A88C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888D2606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2671535a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673607; x=1795278407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=SROD+MeKwmsh80X00loselHY8b+ysQjAA2tn3WdeygoatqMviJ+WgcOJRp2EqDwW54
         McL6tvbDuQFlyDfA3R7qrDdDfxusDfoovcotXbq2LjkJfobypAfaX4/GSF3tFvNBQ7U2
         RgDArgKk3ahojSS4MYs2zVJdRbkRxr/n9Oda+0OHcloRNNZknPUXCVu3aBVtfhGsTmWh
         4lsUuWs4J/cB/CQ8iK0TWyAyeiOh+Fs0mMYVJCwiuevSUdPWhB9hvZF5qaDMRTTnCjV9
         FBx0P40XgYKtCsp1k1hZ2LmENj6+Ym8gqmZw+zKp8BPoemHMdEkoBg21YUnt3jeOM8Ui
         6Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673607; x=1795278407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=2UWg/IL7cvSJ2o8oBAoCvOzPa+XF40noPrrGk0ZwqnLnq3JYylVkwBcpKp2KaWTTG9
         IqGUBM+9dCQSAnwSuubExkOQEP7aKSuBwx0rtMDPAJVWT6dm6P6ybF4c2DWjqip01RWj
         +SRPdyRvyaGwke0oN12iNTPlWVdkAwrIrgyGVubTo2VMHHEDxWCg/3TS/n2vJRM6uogY
         EPqAdQdp+3EqpjF4y0bxV2fnwNyE4RbmsGs1mkoWRRnnyVOqSY88qKMzc/sGgtVyalzv
         bxqXRTnGRrAy36N/Uac8tXIzeMqdG2FcOHlUkzw1oPWx1OQyFAgf0TIJ81ZC+t/e1pAw
         beXQ==
X-Forwarded-Encrypted: i=1; AL+hErGtsJWR3+5PlJvmyVtjrioDYOCDnR5BCaddifKifR4n2kNGtGlYVAi52yaDkuZpXxVkyBRgM3EOZ7VCIG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jOhNKoxMsZM1pxWw1Hhh8EkBbsrqBp5kK0btOhVF2y90MN3uT
	htm/VvSmdlVVf3Aqns817bYiPKkl/FprmUz2PUMa2Y8/dyzFUrzE8ggP
X-Gm-Gg: AYBFou1R0IhidWeD5a/9bicDdg8FaG/a6Vn7QpOO/oJjZNwxhPJ4TypPqAj1ti4aJfF
	+iShmoTwYbv6Sr6pH4Ji5r6Lsb16pqWil1oo6LKmSLy24kQVtXnCwBdB49ZJYcDIY9OReONrkqB
	SXqXy4bY2mQ5JyC+Uog9JWj+lgm1jRcGjmsdvXCPpfIks18bpGPUCqiPPdOAeZs02LbGLzSl/ka
	Yw155FZXnP2Yuj2tbP0CFRv5N+tEt3X6P37XoKQ1gP064V71Wff+WYeWttyhvRpVK9tZPEtHg1f
	oLAPJ74LVA2Y+zFdnrf8x6oK5EkddNfg63OTGJUoUpxLgsKyaT5CRTYNGcHY+4bCT2f71SlYDeN
	Khhe/WSo1jnOUH6WsGE8vdD6Vfczh7kZHx7BqHOmSKsZVylVW3UqFFJUMSe7ftrvE/vaHxSprzo
	juFCh/qZMt1lX6x8UbowXLM1nWTihPn6SztrJZ5wrje4Ou70q+thfxC+ax55MDRa9MS4w1IHeH2
	NYFO/ZDDb201QhLnQT/t0jZLubwrjT6r50b2s9MsQoNygpJCMDJmBFNJIPEN8vb0N/GBZFGLpRZ
	glkmoXrEmiBWZfo+lr2PQmccqQboy1ex+oHKe/EVlT9xDXfZvq6j6rkMZv2EdYCSItmIBJCnZmw
	s/i1XdFfqiSlkrfpKBgIIfMDATxSRXUhjh0FH85Api1S/9N0zRcwXVsG37uLy/qidy2I0klQTam
	Dca0/S2QZLYvnF6X6vuOoU2t0KYzW/OYWfgWBQTkI5
X-Received: by 2002:a17:90b:3f50:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b1b0d984bcmr6359401a91.63.1794673606887;
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
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
Subject: [PATCH net v3 1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Sat, 14 Nov 2026 16:26:31 +0000
Message-ID: <20261114162632.16346-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
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

