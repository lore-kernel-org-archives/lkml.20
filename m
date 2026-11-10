Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316583;
	b=TqpiTEQ9XdYUgV/tWWPpXSDSpFr2hJDnG57KQMuW/M1z21/wZ5qbwWWksX1m3KMh8xqA
	 UPncMGApdm5FN+hhVJC1+1tn+N6OwOWBkIn3TL6WkLH1wXQxGA9VcZxRWcu76uwCZ7A/7
	 uzWyqSXDtufWGOiKjfOkPtrNTh3GU1p1Zo2DJehbtGB91jekTNJoB/isqt0jUFrkhXE9Y
	 BJoVkjw92yQL0yWjIxNQOCqTp038HsXp92lGhAU6Tg2riNsye9ABBCAhCLmsugbCIamKT
	 90KJ9xHY+qPDOyJpBFyBuIULuNWme1oC5K4UWSd+kVSzuBNNwc0E3G71wuC3VIObwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
	b=iKNQBufGaC3eOtrbCyVhZde0Ruo6m78mEczub2L6tEWn4N2JAtjaYWqVoJWpDvvU3RlL
	 w928Z9k8q4UIUd3+Indw/bz7pvQ3ky3HeqO82P9xc+X1cmarKNKFhePkjpCvdDGyNP6KX
	 u4vX3l4YY27lwmtgGdU9G9pO1uTnJ0XE47sZ9ki8Qy8FGN5rkNhNVN6bqY6Tu1/9I9OnN
	 SlLFYf0o3m8Hnmkao1PSvmTxvG+mWVWq8WJ2kDP9vIy117NTBHFwn6AVAfycGIhxGRUlO
	 CLoPfiXIiEg4OKbd5wMc86kJ8ngHBbOYKSho6ijGAMkkC1KZch2OMet1+T2lubsAffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uto3P2Fr;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2BB606A7CC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D2BB606A7CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uto3P2Fr
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1106762a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316583; x=1794921383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
        b=uto3P2FrRcUyUWnOnqTIDAYdUJE49YsFpMVsnZPQKj2mAhRRsf7IXwc4aZzoZHnaaY
         1SHReAuEMltlv/vxT5LifSs3Nf/Hfo3Vmk6KsNCYuDZL3ssnI4afTNX6a+ifGK36By7M
         iisInZH55a9U6uXDQwR2M14orKTvjgqmZ0Vwl8ZAxZysOb6nriyvzE2bYxlUn2Q40CIn
         frgW2uVG2HzATzoY/smOLwbwQ3rj3kNqBOyrp9NjiNhwtHdQJQsHpdKASYOVQf8qKgRT
         rghLPDlqdKMv980bDOnQ69u3IHoNGyeiItQU5uwoh46He4HU5uy5I3slp5EPtxHmNmEO
         xd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316583; x=1794921383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNHJn9+12fNEQ34eO/c7NVFW+pmN+XHfboLXouQB4y0=;
        b=ak1wZ+zPX1Kb0DBtte/14CamqX0HjkUpGRV9Vk+5X2Cm29s8lHctvjSicNRXUdJPwT
         xYcDqmo9KbOEzU/BBQUfWWszBr4Bki++ebsLRI/hGQ6rfBzTvwbt44J1UyupgP3qIXiE
         aYOSSmM3TXdwPkSqaxfyPhG5q8xxJodl7BCdJ+yJfXebUrAiDY5iwJZD6o+oqWL2dLhx
         XUrNU/ovReRmDMFlTzCLpHlQfITGl+A2iODV5U9YCUe/xTu5WOapAhHChqqOy4fJ+WIt
         7eSWvWScYGgrPeHxTxkpRpkt+7klGW+2faoqnNzFagpSmg8TWfvMtqvrMVLvl6OK6Pcx
         mJnQ==
X-Forwarded-Encrypted: i=1; AL+hErHNzUCrbMARwPsHfXRBATErq9aLvcMeGzOyCK4UdIkAvj9UEppgNo+b537gorF8tirWL4Nwhl0RqRF2JTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G3GKGjuxczK3VuO836y8rArn0LNmMuQ9e0J0GWLOD3GW5rw8Y
	5SQ3aj0pfWJKuUCSPrxnBoSlCePV+jFslqJL8HH6G0WtNLyrTpqigzI5ZxLkMA==
X-Gm-Gg: AYBFou1HyqEnXiKzfWYynU6eHRqL98yNkgt5KbeMPWu95KpLCHaqOAYhi+hMQrwUQgJ
	SvdFrlBODty66ddeMERweD0Z9wco+relUNcgmuOUbXMACRWrnt2mYmj+uV7bvSj5au672xFJInL
	J/7wvN6fI2qVPcP+4SKYv7Me86izdHKDceOjAZnOFXisX4oYUuUrDM1NaxcVRR2/AAjAHK2V4Ts
	tKXMt1j6S8OlM/a65R2HEUvmBpZxwEZkwZkuRQgAykd3sWPHK+sQ1UiNTfYpYIu03Z7vGISnpPF
	STlOtgwnTZ68CpydusedCpi9A2J74XYVbD/djcSbkUU16NTK/Kn+1hNzR8tgf242OYbKzuAa6dK
	I/olrRZLxwCatTEtwLSQ1MBWL+pfPXVXC2DPPj5K0aPdnB/HakWCJxb/6xufzlkRpMSpGdMp37t
	thMzI1W4K4X6DolFnlwYRjdxHDY/RjJrqaV37vqt9rN2MgwFSulOjqAclSRPPQVjXS1wE6Gv481
	RfP4j8M21aumNgCkzadON1lBL0BogrlFjZJrTNfZ19Duv9jK8l8n1xHVfLkIDsjw/cnif6JnePi
	o3U4N93DFGF05u/se6NCuLlnD7KQpMkGnjWu8Fm60VAZbdKCyAwX7w==
X-Received: by 2002:a17:90b:564e:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1678cf0a3mr1857467a91.3.1794316582495;
        Tue, 10 Nov 2026 05:16:22 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:22 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 11/33] dmaengine: mmp_tdma: hook completions to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:11 -0800
Message-ID: <a2c1dc1636f90da881567ff0166f32bab68e6cef.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mmp_tdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index d7dd58970060..873b383e405a 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -102,7 +102,6 @@ struct mmp_tdma_chan {
 	struct device			*dev;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 
 	struct mmp_tdma_desc		*desc_arr;
 	dma_addr_t			desc_arr_phys;
@@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, void *dev_id)
 	struct mmp_tdma_chan *tdmac = dev_id;
 
 	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
-		tasklet_schedule(&tdmac->tasklet);
+		dmaengine_schedule_bh(&tdmac->chan);
 		return IRQ_HANDLED;
 	} else
 		return IRQ_NONE;
@@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
+	struct mmp_tdma_chan *tdmac = container_of(c, struct mmp_tdma_chan, chan);
 
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
@@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->pool	   = pool;
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
-	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&tdmac->chan, dma_do_tasklet);
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
-- 
2.43.0

