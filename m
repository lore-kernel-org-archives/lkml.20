Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710231;
	b=lusnkmISD+1nYlJJPW60e2iKtS3RzzSSKVwGzfz7KKwBiTeDDqdfL8SLIZJ53lEjOVIE
	 7o3mYlveCTCno6z0tIUYtDxteotXo5hifLRl7TkZzLf5Fj8A3kPUHZ0pTKa4fqLdcob0t
	 MHPWUVseDOo3vfuH05gyi1WTB4Csi7PfnVeDk1O8nowqQycA8aNXBz+ZLwmpjEIWi3mgU
	 VLeDbEEyoQdtEXdLQyyVr+5yw12awD/NkIV/fhO8LMuAol1JtyMYGXNPfojQLsoy8phCe
	 FjddgJQRvfT9zQghY0OYaeqBfUe3dg/tVo/DQ/1we7QsVfp+h3MzeQNw2RriyNpoKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qS8ztVVMIjwfG7AlBvbmWvP1WuCvhnu2ikDFy5AVT94=;
	b=fmHbEeIss23IR41qMok0abct+J3cdvHnHkgxWVeTZCly3y/y84JZ9X9biKC/QQCQWogV
	 FbSmARsLB37JmwhldQUCPvpW7srgdWbUU8gcVO1VxWlbYvUV8SLOK/9gJ0S2M7flCzNnJ
	 BWaje5yE/pvYu0zyrACvbMaohnBpFx9sMOWiP4x3048FC8i3UgKIS1s7wVuR0faLJeJyK
	 G8bMWDXxEbXI6wxIjxW9lfqnf3xK633fP+LuTYdH87awiW6IkudJaKGHkOWQC0puNZQO6
	 Gq9pvsYtadh2b9BFmmMx1TJ9BzkvzMQkqpRv419zlgFz0yn2HFnpUXg4sEF/UQJ8JqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8cxiZd;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C8606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5C8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8cxiZd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so27999565e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710229; x=1794315029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS8ztVVMIjwfG7AlBvbmWvP1WuCvhnu2ikDFy5AVT94=;
        b=Wb8cxiZdnUZ9Ddj1KcznRD60LPv1ZcjSK1WUp5d0qJJwqyVRu6WXtBE9dETR/tCQuT
         Q3Hjk/eQGTx4nZqIF28pb59MtYmEE4QO18Wr2FxBVmrczg05gS6ewrOr9hWg6aakCNjy
         dafunkpbiNLdInz/1nj4dbk2l2+M6jXj8yhbw1KxTeP5IcexXiREofeCuzPMR2g0X5en
         aeeH8FywHTRdyxaUXMeyalaAWk6AaGfFje/d9oPXac390wLtfUqBBtUmxnbZ+oYuu2zs
         PMG+e1rbnnynGujTdEjMhGX9ymJJYiBhfePDJnJeCB2a2gG4xl0+qskOnNmiKSv48+Fz
         GD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710229; x=1794315029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qS8ztVVMIjwfG7AlBvbmWvP1WuCvhnu2ikDFy5AVT94=;
        b=fXm7zWvfLaOQOo3/Rg26S5f/ZnYvFP4vcmOi/VdcmXjcj9GkOEMGSCXBN/QD4rB/wq
         AlOeyK6IYLjfJzRKQRAx2NLKwcooTl38QVLcjmPas+rLtr6S4fyoqdWQY3SSpCLh6H8n
         XcK13n4vm5zNgeON+ZDMXUf6eHvElmc8GcvDvnpnyeWHR6/2z93kFPGOLn+xvp9T9RMN
         l0Zxx0uASKgL5YnhPgy47aoAlsSzZBemwIKGBallhuTi58GwvV36z/YDGTZhO5EjsdeA
         ASbZpfGOXVfGxNiGCbOPNr//xF+zgeqf3jQO0W1SvD/w6qk5CCwuy3oMauqdDKPTpSmV
         PwLA==
X-Forwarded-Encrypted: i=1; AKwUvByhlt67BElIQ/UBg7OfBYir7FGcwBoMMysGUQR9VkacLK9ijufdwb2FjuFpYABgfa3IHEcFpErtYBLtETI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dwmTFHR763QHLhOQJnDj29bRwDt12cQIrD+JEovvZXpFU1naR
	EmIskLjabEt5K1sxZ0xRnPJhTO9BLZQL/BJTTYxEeO1Cx2C0lCkN7O08
X-Gm-Gg: AYBFou2VQCf8cp8DIjcZ1eN5HT9Fnlio/XmNmMrsClGll4Wlkis9XBH0Gs7laWlZzIM
	e/1B3dn73Fvc5fzjgTkRFVafleOjJSG4fMF4eLzbgcxSq4/ttnZ1/mYy3d+Upj082dyZ4cLBLHO
	/88VEJrw1Q0zSamSd6aBj237gmdXQ349u5mpDgXDgD7LS7IvHxhlPSEbYhhssQDCU+fO0wtOESE
	xIEvJT+gPO/pOutuXPZrVfuf+8cbjFLKPQWhq6PHZJfbfMODiEPeJokmiwe0JN1t7terleU1bmj
	jqS/DcXNIYd3omx6D/Rhu5DDriM3I7vAU9mYs/AuDHv1NAL/gZpwofAx9esLuTR+gRYp3qqqL1v
	A6PEQKEvav+fAS9LLRYD7FtMkNPwBqExCK+OEpxhr/qTub3z9Q+dUMWWPWA07LyJj0nPhaEf3nb
	qbxr9/RWX1cw22yPz6O/pjUur1vWmS5PvA0eul6HDg2KZ88eqL9FuPzyOjI7ENW9dbOVzEURNa1
	hCY+NyS5NUrxwUmmi1xWEwbqEJoilIZNL/1Qf7v87kVS8ZmNsBPPEcQ6np2Dcc15sMVLh7og14l
	PcRns6PzxtYdWR+gotzr3R/SEKn8CJq3C+DyEZ5BCsr1W9as9bVqqKSBzasYGJ6EmLZcW2XQlY2
	PLNMmSteTGyQR0oVrFa2OFhmo2fwxUMlCfoYEN66QIUbeC4d81G0cobQggBAoew8=
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr294558275e9.34.1793710229187;
        Tue, 03 Nov 2026 04:50:29 -0800 (PST)
Received: from localhost.localdomain ([2a00:102a:403b:96a2:e8a9:f4a7:ed37:36a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm61406425e9.0.2026.11.03.04.50.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 04:50:28 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/5] net: mvneta: lift the per-queue TX rate limits
Date: Tue,  3 Nov 2026 13:50:17 +0100
Message-ID: <20261103125021.70845-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
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

The per-queue rate limits set by mqprio stay in effect after the
shaper is turned off.

mvneta_disable_per_queue_rate_limit() only changes the mode bits in
MVNETA_TXQ_CMD1_REG. The token buckets keep limiting the TX queues
with that mode as well, and their refill rate still holds the old
limit.

Refill the token buckets of all TX queues at full rate when the rate
limit is disabled. Deleting the qdisc reaches this code only with the
next patch.

Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
100 Mbit/s link. When mqprio was set up again without a shaper, each
TX queue stayed at 10 Mbit/s. With this patch the link reaches
94 Mbit/s.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index ea755cf05b9e..9b9efac2846e 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
 static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 {
 	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
+	int queue;
 
 	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
 	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
+
+	/* The token buckets still limit the queues, refill them at full rate */
+	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
+	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
+	for (queue = 0; queue < txq_number; queue++)
+		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-- 
2.54.0 (Apple Git-157)

