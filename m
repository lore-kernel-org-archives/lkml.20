Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBC2BFC85
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058595; cv=none; b=lzoW7eZlSLoGRSsS1kLZ2gWHbU6NqgkIqu1XXo6xzlLcimlPCzhHe6gaba6DnvPvTe+dZPUgZrsvfBGw+8pwb7L/8mrjXsR50vLb+7dYXSVozzeYUs4POf86iwgx+FsOkCFswNlY/yvmgFyNGL1dbAVU2LDxqec4SDtIqF/z0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058595; c=relaxed/simple;
	bh=SyKBO76ev2NriW6LktGJTb69Uo9mhcn47+zY2SXVJ5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKRtLHql5Pfy3SkVIS+DhtXSA3RpD9YfQKoGKKvnjQlZEhldrJrxskyXO+RFeFE+Wx6NsAH+4P8C0hZaiMClek3mcLi6s0Sjlh8Z4KqcjXAP+4R7XOn21ewOR448ySFBJ3kR/NJC6vZAzfjsYKAHBK63uIczkwCwlQAOEFAnxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr3qjM2S; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr3qjM2S"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16629a040so9234465e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058593; x=1791663393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSJHmcS6fdALBnPJ5e4ZZCDQp3UfYu5aUPElGXfZW+Q=;
        b=gr3qjM2SOXIDXZ4oyvPCqdDXnS8Q8BPOE8b6TG+GYQLwCmc+wWac51qM1JTRvgJQ/m
         s8qdQAe8oZxD5NsPCq7TUxSt5wKxZ+nx5VMyA8Z2aBKboSnup2FOxdFnzVfIlAzd3Tnf
         JaDv9u63AlarcYCQ7JZLp6e74T1d+nj+5ZBeacTXfDzMhrZ5yaoj6HDJPCl30Y6+1bha
         tEf3/6tKZvEKgArhWqJ2SqSfsb3yYMiak5MFJvclKK2DrlTwZvzsP0aoBZMN0bZLGjAG
         uykj6B8nWrfdMykWIFgdB2IGpMagMTrd9dVFemn/KxKp5l8tFjKbPLZWDWvIavPpyoc4
         NXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058593; x=1791663393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSJHmcS6fdALBnPJ5e4ZZCDQp3UfYu5aUPElGXfZW+Q=;
        b=JAydWq6ZC6nrykxsDXZZf8PHmG3z+LEKBSTJ3gvap55Qbp66TB5OG4YCsf3xEiXQ8Q
         v0RUWYXPob5Q/qWeA/V2H2ZSmupCDvTeOweiAI3uQHOixxQB1TXSp0QbB/TurPExQPlA
         8Rqln4Oy1qZh+N20tCHjDs8dcBaaGXtmPZNBXojVtoeuJRYrl5XZ7YcV8z4RiO0E1onc
         qt9i/LOj+1onmPXqvlHP/gocgahm098rU3TPIEtFvP8sIaG3ZdWH/soStei455BPgEYe
         VT0Z81QI7G10OOE8FSeMM1olZmqvUTVoXlNtD0GI9xE9B/pGcCOIFjldJN4j2c6IeVB8
         3lOw==
X-Forwarded-Encrypted: i=1; AKwUvBxHwFWpVn2rfAC2EM4itps7bew/dT9onIlcPolxHXw4ag9WAke2XArLnbMh3juaPzjhXagBMKnUgu5kbG0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKGmRXvIISe8yvQGWRh7a6+UqN4p4viwj2qvxRhV04mLyH1wLN
	JnieunEfKyLxPNVm4FcdU2g9Q+8oaunt5jawkd9EoYhgnPGyFVeEhYrijFUrs1RCc7I=
X-Gm-Gg: AYBFou05z5lDlcmhJCLpKzLx2sOIReyJmwb4PodLPwpGKEP6HbUMbK8dpuqmKhwYmbO
	HlJD2bG/oc5/gDAvNTNGCWNK+Od/sS4sDbeqzXJ1oArX2MvmRV8Vv97hzOXdcmKxgPM5NeX5ZaF
	i16WjOaARPy7JQzILmnlVQfllMJm/Vsy7MlADvyiGiHVlW71LaYkf4cmIkYbUtL8ZnGlWEy4ZJJ
	gy8T6lDsJ12At9CYwI5W50kawIeL7EVUmT2Izqt2lETWxxBg1kDgL1I8UCSPl2dT1ExMAxiZjM2
	68HbpBxq2hHxS0+AMMXh97lsNy3/O7nihDX9c5dpY+cHIqJJIK8LRqJ81Aa1TIYt9sBvMdmq2CC
	YfTtlz95aorUAPa5ineyE/xjSZs8zFPCDLRNxomWfwPs7u0kkE5cJ81rSR1wKE8Ji7DyQ1/GCL1
	zfjTW02XN/XhUM9gbIkmoVcdptDjVFqcsQlO9jZkfU6WBWaeak4kriAAOnetEPYPNOCS7wdCcRj
	/0=
X-Received: by 2002:a05:600c:c1d7:10b0:4a0:4f6:3dc5 with SMTP id 5b1f17b1804b1-4a1680dd4f4mr34160075e9.7.1791058592594;
        Sat, 03 Oct 2026 13:16:32 -0700 (PDT)
Received: from Mac ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm51579145e9.14.2026.10.03.13.16.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 13:16:32 -0700 (PDT)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Andrii Pasichnyk <apasichnik9@gmail.com>
Subject: [PATCH net] wireguard: peer: free packets left on the per-peer queues on removal
Date: Sat,  3 Oct 2026 23:16:25 +0300
Message-ID: <20261003201625.4572-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

peer_remove_after_dead() flushes the crypt workqueue and then disables
the peer's NAPI. Once a disable is pending, __napi_poll() completes the
instance after the poll returns even if it used its whole budget, so a
peer removed while more than one budget of decrypted packets waits on
rx_queue keeps the rest there. Each entry holds a keypair and a peer
reference, so the peer is never released; the WARN_ON in rcu_release()
that checks for leftovers is never reached either.

Free whatever is left on both per-peer queues once nothing can feed them
any more: receive entries are single packets, transmit entries lists.

Reproduced with the WireGuard selftest VM (x86 KVM, 1 vCPU, net-next):
remove a peer while a UDP flood keeps its receive queue busy, re-add it,
repeat, then run the selftest's created/destroyed object check. Over
2140 removals the unpatched kernel leaked a peer and its keypair 5
times ("wg0: Peer 27: merely created"); with this patch, 0 times in
another 2140.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Assisted-by: LLM
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a..3e08898 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,25 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each queue entry holds a keypair and a peer reference. Transmit entries
+ * are lists of packets, receive entries single packets.
+ */
+static void peer_purge_queue(struct wg_peer *peer, struct prev_queue *queue,
+			     bool lists)
+{
+	struct sk_buff *first;
+
+	while ((first = wg_prev_queue_peek(queue)) != NULL) {
+		wg_prev_queue_drop_peeked(queue);
+		wg_noise_keypair_put(PACKET_CB(first)->keypair, false);
+		wg_peer_put(peer);
+		if (lists)
+			kfree_skb_list(first);
+		else
+			dev_kfree_skb(first);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -122,6 +141,11 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI being disabled completes after at most one more poll, which
+	 * may leave packets on rx_queue that still hold references.
+	 */
+	peer_purge_queue(peer, &peer->rx_queue, false);
+	peer_purge_queue(peer, &peer->tx_queue, true);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.
-- 
2.53.0

