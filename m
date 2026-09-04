Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B86343D8A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557142; cv=none; b=s8+fc0GePFj3fM4oR1gMZAzSzywzdQLw+mMuvqOdALHJrjjICU0Hezaj8LNdhfxrqXAkMU9Ys14PVkFbLzMj9DKwZZPZ5TCzcRCJe2PC0OzWgmmdxs16UNrqQGsecF1TJ39wJ1BiDqsuMVrO2F62axTSyVzpQTfJA9Uv5QMfSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557142; c=relaxed/simple;
	bh=Wslx/l7V3evJ7hILTLC32m3ayC5+HML9tyYibTpzgtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6JE1SHVSuxLPOcn8mDfMhgiYe14UAT6CZBL0yWZqoIstuLR8OPI5QKCRQQZIELpLt66HJzxgHogxdOIUedaEfOSBt61/7GE1BewGYiUpRDm1vZBXHIfJYyMJIiO/kv2qAokns7zGBSqobjGerKfmr1rDAvMtpCBVxFyhpNS5oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKQKaSKn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKQKaSKn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1855273a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557140; x=1789161940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVOfg9PgU/mfeubCPPMqd+U1k0Vvj2HlWQCTwM0265E=;
        b=qKQKaSKn4XGI5OQx33eUY30mJQ4A+lAlrrhFebhO6FNdiITQvfnhqmeBy0WRZRIDbe
         dNv/7CwmsPWCMBvHFekmGR1HDyuPkpKumNoAukqxriibzOf3eCKIoBCHASHkBIdaCqIj
         CDopNSqgHruQ7Bs57AsUE6EVpczdvuNPf/iP32iiYE/Bh/Q56gQm4zUaYWBsDs/JeTH9
         pSk/iGGSGNZ1teQN0w5rIJAAW4INH/iioY2XXYxvy86hpV0q8IEA1nSWdkzjMinsSDX9
         k/fLUn3iCDZGP3gkDSPXuHKuAuBRtP65BtR0iUp/50BiGx0pEmJsPMDm3hIzlwj4jkl9
         48uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557140; x=1789161940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVOfg9PgU/mfeubCPPMqd+U1k0Vvj2HlWQCTwM0265E=;
        b=bKu3n7awmn3hewb4AGPAuv5K3HM9GxJsIK49e5fSR/2gTWfPkmwNiXVfqbYw7x7hnj
         xnG2/+/MgXGp55eFykUodyljTTzeP0xOxV4Ac3JY3zWvOJ5CfQKIDeWcc5e7UjRDOrnE
         6sdopHZo5Hmks7jN7Aah8Ok6LvY2XvpwO7dOoAGoumzwu7V7r+TVMuPMJ7P7n5FPRGXZ
         xPZnM/XkAiolsCvyK6+52qeJDdM9RnmZKYE2TSkBcNvv8hFZ9WSuzKwfJYPVZbsCAh1Z
         sJZ/n1XCSTTVWguEbvK/fAEdJwidQojzYC7ygv43gGYEWJNfwZdKTf4BalfKLxcVpnnf
         dzow==
X-Forwarded-Encrypted: i=1; AKwUvByJkgWBWFjMjPlb587csL4sxKmcmdRbxvS41lOzn/dljsQwSd0G3w6JizGFolYDKNvFYaozlVP6gDIr3oY=@vger.kernel.org
X-Gm-Message-State: AFuF++k6oBksa+2bpcaNDaT9oCAvOWFZ3BETkdwnixPdFVnBfLGdsRTn
	P5MZrBEFwCdfX2YGhhH2l4RE53lDT2rOb438op3hNHcZ3ZEYGlKYgYGe
X-Gm-Gg: AYBFou2iP3xQ7ytGj8DCRr5nhzQijJEOFKs7N+hZfhtqRJBmJM2hY4mICXqdOaxdc1h
	o4KUhUNIYQBwnfwOmpq9ydmhRfLaDmq/7oxP1SHwaltyY7XTiIbnibqMx11rWsbbK02K9uyXFrp
	BbjZhvElkqAowmwOaXZQqSM/1pxsk6Pj25tZQADlz2pZcJXBsa11crdSEuXTqN38zBmi0XPjAtC
	+vdGE2yuabEQvAOQ1tBVE6BMsTjYgt2e567X9BL4ZbWaPSN1lM0rnU1VH9+bDJqpxA5mBY0dKRP
	8IabjlLQLSV5hUSg3Qkx0Dfs5mwEJ9dSDBlCXwLi9+TaPyxJswskUlQKQCiO2f3ZDOlr7YNCBAv
	3JKW+pdbWuzPZIEwckaA35/AFBV9MYGxFRKG8G7kxUber4tp5vu+bxEQZ15HazMuJnzlYtyjIaj
	39YRp2T2sqNd1B9CfFeET1BsNzRYJ8YpCE5iUEtgljnCX9pt8BvdBYrhLbF9bdS2r2RfGjApM51
	QkV9uKAFl9XKG8VluFHdnZtIcXmfWUqpcrQusvzl3iUyCG3RPRZ7CTZ5JSaEwF/MS9HZeQb43t/
	w4N419reILRoz/zvoi5CHTgQJeMLItdluhnLmA==
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr13373795a91.6.1788557139119;
        Fri, 04 Sep 2026 14:25:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm12261984a91.10.2026.09.04.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:25:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath9k: unmap DMA and free skb for stale TX buffers on queue drain
Date: Fri,  4 Sep 2026 14:25:34 -0700
Message-ID: <20260904212534.86403-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When draining a TX queue (e.g. on device removal or reset), stale
ath_buf descriptors were returned directly to the free pool via
ath_tx_return_buffer without unmapping their DMA buffers or freeing
their associated skbs. This leaks both DMA API resources and socket
buffer memory.

Unmap the DMA buffer and free the skb before returning the buffer
to the pool.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/xmit.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/xmit.c b/drivers/net/wireless/ath/ath9k/xmit.c
index 89d8b3178784..89930eaf1fd3 100644
--- a/drivers/net/wireless/ath/ath9k/xmit.c
+++ b/drivers/net/wireless/ath/ath9k/xmit.c
@@ -1884,8 +1884,17 @@ static void ath_drain_txq_list(struct ath_softc *sc, struct ath_txq *txq,
 		bf = list_first_entry(list, struct ath_buf, list);
 
 		if (bf->bf_state.stale) {
-			list_del(&bf->list);
+			struct sk_buff *skb = bf->bf_mpdu;
 
+			list_del(&bf->list);
+			if (bf->bf_buf_addr) {
+				dma_unmap_single(sc->dev, bf->bf_buf_addr,
+						 skb ? skb->len : 0,
+						 DMA_TO_DEVICE);
+				bf->bf_buf_addr = 0;
+			}
+			bf->bf_mpdu = NULL;
+			dev_kfree_skb_any(skb);
 			ath_tx_return_buffer(sc, bf);
 			continue;
 		}
-- 
2.55.0

