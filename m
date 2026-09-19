Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273A378D8D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853802; cv=none; b=jo8Btrpd5+1LTcWAP+vureWNwMki6+3YLdZ3YvFAj8ZIbREdkvqzfKEJAV9D5SX2ZSm14EhazRazgQQkPYTNxcYLb/dc9R+4HqNhPwBnvrjNWNT2XoVtt+Ai0fTwSaY67TM0gN99it0/fLyxJtSEzIlyj0B6ZlIO3ldZZsSs0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853802; c=relaxed/simple;
	bh=CuaJfRC3s8HMt44kpfIb4IYt4PN36HkZGGz+Qw7uYxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6rVFhmvr49nis7cKvvgJTbYIZA0Bu4I7dGaQyO0cjPyDX+R3Pf8k2Az9687kK26Ot+Rr0hpiAZDDJHH2HWa46d5e4btEnwSw/Ml5y/eXWnKH0d2j8BTOy4bFHG9y3Za4N4BDE3IGlRePkSyIaovdOkyNx7pwvbThkRuRPTFl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC/DqhTF; arc=none smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC/DqhTF"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso20375975ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853797; x=1790458597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVd51dSNga942NlwtDE+a/szNXscAQ4nPUGJDNwj6j0=;
        b=NC/DqhTFME6DtyNyZr4bACagogGG6UWcsjdfAMsqfxWTWzqERw86qokjvLNiUapGVV
         9DNVqdPOHT9EtEyvCCVavwyU94tbLjSgYL0fqCHfrJ/8VMbFeOgzZhnNGlPDw43njAjN
         lTpwTLrU+ZnoIZuyd3vfg7yiqLshSyegMd+kSYoVzb6hmr1Xm1J7ClhdViv3ddG7qW6S
         OXhdsKELqjVg9P+xHQDNnPqPEfb9S0eeCE6AQZDmBkoI0sAXT79tp0mUWpH09yQ9pKc4
         L483uGqQ99bN0ywLhoEfIyCKcFJfuDqZMSscBhjvJozMGJuUynytpho7YzY89tH0ZaiN
         CdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853797; x=1790458597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVd51dSNga942NlwtDE+a/szNXscAQ4nPUGJDNwj6j0=;
        b=hGNqg9HjK4uEPSbackmz6vTebcLrDicu4SVBvfOG4XcdvaZODRCR07RLXltifOJk9r
         4otYI66WPjaxdxM5aALgG7pwWPTnxyzINok14CpM7SrNTQOd7EG30fcabGl7WFa7V5sK
         mVom0RnCW2dWkKJFr6rnpfh2y4eCogiWk6tK9GrjEPyP6raEjFXsj1FhnbcABGUzZzbM
         TL8KJlPIymDfrZkb1f7Tf3fpmgDloLeKqCLxL9GnEvK2dUz1K28Zata5ARs82tr9j7CZ
         KvH1KQdnXlAvVc0Er+CQrZAT6U2NrA4h8toRMZ3uhJFt2q3NqeFEqWr3gxovAgykj0oO
         /6oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRIrpw2ssky2+hfmy/g9wPiIOQZd1luGDoBkdTcjJgM+oanwtiASewKKNII5Px0Z6eJKsQvl7ai9GGjiE=@vger.kernel.org
X-Gm-Message-State: AFuF++kkwKYZ9OEoxBJYh+umX/wftlnRhTWRVYe9iPcNlex8wvaNaqP2
	I6sctCE386sgU3Zym7FLrbagshkUTBEgKec3iMjt8rqyw+Fnylz7O8AYlKQmwQyy
X-Gm-Gg: AYBFou0uwsZoLwpX/ff35tYqKXCbAnHAFVtIbSdtgwGXB3a38fmENPvoe82ynz1S4bU
	S4ayXilKP4jSz20IS/Aag7mKXc69jRbWp157S3/JRaAw/ZB695IN6SG1gZHN8JHm9LQW4LDPeV6
	JGMpZZqkw7l8+wAXgVfDPX/KEqUuQ+Z57+gWYqEPoV1JN2TqvNMZJ833lXkOfKx/h46DCL9K7ca
	FPtb3KWk/El6o4JjBJsmsykTaFOBQrYll1LzBJaHWohYP1wqYBUsDvZl+/vG3xbHu3tbxl8/vw4
	DT9bFJxwkM04SCUlNtCudxKwQarHvRi/gPxV9JaMHCeoErunbKzjOeoEYre49V3ZEI+qmpLx1gW
	0fHYsQ+6E+dtxK/wZkD81f7Z11JdrRO8vBeAlck/NyptTfmVcsXWiSLUAmE9QV1OfqxL2DSAUcA
	A7IrvxVt0EkpDo8zQ7rd0tcYmin6LKOUeDiOKPKVRxGzWY84U89LLOSiisGGxyPpTttgIaW/8mp
	w3bLnjCImMC2iFx6ZDd2dBeN5d7UN3AX5cUZuqaa0vlOPyhOjgpdI0wVESIf7IJxm6wijn5oIcM
	m3V0WMhzqA==
X-Received: by 2002:a17:902:c941:b0:2d9:3bee:4f32 with SMTP id d9443c01a7336-2ddb1b9a350mr112593105ad.20.1789853796692;
        Sat, 19 Sep 2026 14:36:36 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm12949795ad.70.2026.09.19.14.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:36 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: llc: clean up unaccepted child sockets in llc_ui_release()
Date: Sat, 19 Sep 2026 21:36:35 +0000
Message-ID: <20260919213635.3314344-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an `AF_LLC` listening socket (`sk->sk_state == TCP_LISTEN`) accepts
an incoming connection request in `llc_conn_state_process()`, it
allocates a new child `sock` via `llc_sk_alloc()`, holds a `netdev`
reference on `child_llc->dev`, attaches `child` to `child_llc->sap`,
sets `skb->sk = child`, and queues `skb` onto the listener's
`sk->sk_receive_queue` waiting for `llc_ui_accept()`.

If the listening socket is closed without calling `accept()`,
`llc_ui_release()` calls `skb_queue_purge(&sk->sk_receive_queue)` in
`llc_sk_Component` / `llc_sk_free()`, which frees the queued `skb`s
without removing the unaccepted `child` sockets from `child_llc->sap`,
releasing `child_llc->dev`, or freeing `child`. This permanently leaks
the child `sock`, its `llc_sap` reference, and the `net_device`
reference (blocking `unregister_netdevice()`).

In `llc_ui_release()`, drain `sk->sk_receive_queue` when `sk->sk_state
== TCP_LISTEN`, and for each unaccepted child socket, orphan `skb`,
remove `child` from `child_llc->sap`, release `child_llc->dev`, and free
`child` via `llc_sk_free()`.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/llc/af_llc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index b0447c33dbf0..4bc7839127aa 100644
--- a/net/llc/af_llc.c
+++ b/net/llc/af_llc.c
@@ -204,6 +204,25 @@ static int llc_ui_release(struct socket *sock)
 	llc = llc_sk(sk);
 	dprintk("%s: closing local(%02X) remote(%02X)\n", __func__,
 		llc->laddr.lsap, llc->daddr.lsap);
+	if (sk->sk_state == TCP_LISTEN) {
+		struct sk_buff *skb;
+
+		while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
+			struct sock *child = skb->sk;
+
+			if (child) {
+				struct llc_sock *child_llc = llc_sk(child);
+
+				skb_orphan(skb);
+				if (child_llc->sap)
+					llc_sap_remove_socket(child_llc->sap, child);
+				netdev_put(child_llc->dev, &child_llc->dev_tracker);
+				sock_orphan(child);
+				llc_sk_free(child);
+			}
+			kfree_skb(skb);
+		}
+	}
 	if (!llc_send_disc(sk))
 		llc_ui_wait_for_disc(sk, READ_ONCE(sk->sk_rcvtimeo));
 	if (!sock_flag(sk, SOCK_ZAPPED)) {
