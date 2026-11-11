Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433772;
	b=Jtrz/63WHfWvfY60xgHpXiV7qfAEQXuLmMcPiavq32PVHwVyVJQn+ggR3kfW+RdVdQFj
	 OBruH4vMDwn13Zh7o9ONgPQYcLZ4JDHdN1g803+l5Ynbt50QWvqEzXvpQ9nQZIM56mh68
	 00vGkiZUzVx5WVZZexzTWuxGsQhKeddhMx3+Ucp0cinOM/j+pPWwC1sRJiyQQd+AMn5PT
	 Kz9KHXSBSvTbaF0wgLXHnlYhgaNxBEW54VghGGFvF+OAIkecos0tpRMq6+9yDoRh/PG8E
	 aoR2PX294KL7xOmo4UpMmCcreM9dW2/2k9wiqRekpEBiPgleIljVGoVo4qgPbKUOJpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ghwIfE96OI9y9XOfb0MeMDcamu6SW78slBiWypbpbcM=;
	b=5FFnSuMto+rRfvoMtFGkEXdV1fYSbkl7RTN0Y3QSOK82yWsdXLPkW0OTxi6uuFxwZAhJ
	 Y3ffcD1gV1K5HlAQRISIpdPi1m3Udowrb8eezXmkJNDuIbn5qyi1btyW8CXMCqO+QdPhz
	 5qvQBmlb+MDlAPRhvK7b7V8o7kg/nkKdkzHETnaK/ZKiph4ewduZlq4RQGowsG+HUJ2n5
	 QAmaG/+Kyw+hUKXddtu06snzcRyd8/RWjZr7iUiMk0G/I/X3ZjsSKXX4QHaJhQj47tV0w
	 x8X/2fl8GT/eTDn2nBx8V4vb5MIpBQJzZR/niScv8zYwgrk/JcPskikQabY8zupkT8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udAPqJer;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udAPqJer
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843a4ca671eso1501507a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433771; x=1795038571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghwIfE96OI9y9XOfb0MeMDcamu6SW78slBiWypbpbcM=;
        b=udAPqJern4cV9Bh6LXrHWrTixhlYTe5DhEO5f2N57XeXVF8uCvHX3eIxz3FsbGtyW/
         b8+wiGvyDwZ5yRnDkKd+4vLt9tnUp98WyhVDuDPYzBC/mVCO2VEMWpRoJl4nuVUTvRyi
         oOzgYIt3lkmmzEuTTVxHkPBnCZSHSm5k75ZG4blFcHdWdV2L40kzxBGwqTmxMDfY2Yx9
         oyl7Lmq4qbuoAazcMDvcJZKKWw2AaGyV4Wxw+sehEq1qXy2Xb7jZHHzmcdEPnvMUDVSI
         ysuvj16vQIUd7dHDJ201FrLoxGpQOIIx5BWwDyBBYc1bc5qDbes42p75NLr/p4UPPxMd
         +yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433771; x=1795038571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghwIfE96OI9y9XOfb0MeMDcamu6SW78slBiWypbpbcM=;
        b=GA8lXu1u6CKHxE6k/bwcUMXpyBoOt+1s5ELIfEukAeW20RtYN1OXGtoylWS8Yqj6Ys
         LwSyZuxTi9RFImH2jUUNbkC/zQmMKn6+d3cmoPS3k3Nta2u/IAubkOdgMUycHF3dKDtm
         MO2eCZn9uI+GgSdzXcejRVcxgMH47Vrw0RlH4SQcjHsgVkJH9LBGsmb8eFHbF8tWKQ1h
         NfHnpXogKwuJosX2fgV7vmcaEDJFyfjGMxJlYtjrV2M/dM79W3oX4fbKP53siuN3KTie
         8dF5kNcW3w4cJpxvX9EPUYwO/Pihg7o3eCexVUvpn7GTHkPVvrQagc1BWDfM88a8q966
         MxXg==
X-Forwarded-Encrypted: i=1; AL+hErHDqwjSLmmrGEtda3rf0Zv2q1V1F2dy82a6ojyU4Mdp7GDrYclnZlh+iKtDRBbTp4n9CWmWrcSJ5H13AbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tpkvB7cpiVmBlvBlUvrV+HzebpmWmTKYQF06DIxwj0Nd5in2G
	0Z2CcIW5eGcziMQwqIiHnR4IL+4Fy8tkinSzKoDwhJOZP1/25KxKMHcuMl9vzfgt
X-Gm-Gg: AYBFou17Q9hXy7GXEQyYGPfgAyJpdfN53dnxBCOTjZFCCM2lLhNlR++7wOwAy1QysJ9
	ABbCVuGLSqq4x8XYE7tOfiC0gv5la5ogcSbY8LehdNvPuRBVBufqiy/bAkncYBYpQ2knqA/p8fP
	wjXQ7ou4X+YMCIlqkeJrKbw2G1QY8HDbNRibVguyKSDd23f7K5nkT8LKLV2LVBxLy52nzTTaR3l
	OpgzK1vK+MnaadgyzXylmLZevqYTJdK8X3twq7QsH0N2VCvUwlGy30v2OQl81ENhkgHp1O3NwjV
	a+hlKfZ++23DFHi7TTnFl4/AZ830ScBYQWv/w37hq/IazE9SmfLsmp5VJVY6g+v9DYB0FowSLcp
	DVCxL4lOBREUwi959H71iMCx8osfkpicsjA8coTsgOiC58zdvBNbHW6TxH+NjM94LDZ+UsdC2RD
	V9AmPHfvusMtqS8KxKPytTyWX1NQxBxXsTTWWJEXndTtraFarinc+1n9gj7J2QY4YKSXxvmocxD
	pOn/JL/CQd/h4IKweE3XzMycqPLOoiY3k/oWufYUJDY1xu33UxAhKdr+4LWxMaoSLyrYyTVpPIy
	UyQUlPJWEXAogdc/ELgbzHrG
X-Received: by 2002:a05:6830:254a:b0:818:125c:f4d3 with SMTP id 46e09a7af769-860f28740afmr4236916a34.14.1794433770817;
        Wed, 11 Nov 2026 13:49:30 -0800 (PST)
Received: from en1.. ([204.144.167.9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbebfc6sm5124610a34.18.2026.11.11.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:49:30 -0800 (PST)
From: Amir Abudubai <amirabudubai@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	surban@surban.net,
	linux-kernel@vger.kernel.org,
	Amir Abudubai <amirabudubai@gmail.com>
Subject: [PATCH] Bluetooth: L2CAP: Fix size check for receive buffer space
Date: Wed, 11 Nov 2026 15:49:05 -0600
Message-ID: <20261111214905.518429-1-amirabudubai@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Check that available receive space covers a full MTU-sized SDU and its
overhead, rather than just the overhead. Otherwise, credits can be
exhausted before an SDU is completed. This could result in a deadlock under
some configurations and SDU combinations.

This follows the SDU-sized credit policy from commit 96cd8eaa131f
("Bluetooth: L2CAP: Derive rx credits from MTU and MPS"). Clarify the
comment by replacing "packet" with "SDU".

Fixes: ce60b9231b66 ("Bluetooth: compute LE flow credits based on recvbuf space")
Signed-off-by: Amir Abudubai <amirabudubai@gmail.com>
---
The exact SDU length that causes a deadlock depends on build and configuration.
On my machine, 13090-byte SDUs caused deadlocks and this patch fixed it.

AI assistance: OpenCode/GPT-6 Astra for testing and analysis.

 net/bluetooth/l2cap_sock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 7a2551ef7f50..8603e63defb5 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1229,11 +1229,11 @@ static void l2cap_publish_rx_avail(struct l2cap_chan *chan)
 
 	/* Correct available memory by estimated sk_buff overhead.
 	 * This is significant due to small transfer sizes. However, accept
-	 * at least one full packet if receive space is non-zero.
+	 * at least one full SDU if receive space is non-zero.
 	 */
 	expected_skbs = DIV_ROUND_UP(avail, chan->mps);
 	skb_overhead = expected_skbs * sizeof(struct sk_buff);
-	if (skb_overhead < avail)
+	if (avail - skb_overhead >= chan->imtu + L2CAP_SDULEN_SIZE)
 		l2cap_chan_rx_avail(chan, avail - skb_overhead);
 	else
 		l2cap_chan_rx_avail(chan, -1);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
