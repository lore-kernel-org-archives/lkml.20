Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730655;
	b=e8GJ9mMAe3diX3jUfzp8+t6uwnu1OEH9gxcHZu5LOqZCmfE7bj5zFd/y/JXZOlJKRvVZ
	 51OSfJzOC146SgFugifEty7Ador/nehNRK0MbuMDAlw/0z1cPodDZpPr2zbQQ5oDi/qZD
	 qGNexfCWO9SctKM97ifmZifI42gqWtnVe6GqZ10Yr7qLsw3i/qfLr0/+EvanIAS20c+uD
	 0NTOpT+XpUBU0D/AZXRVHvCmP6iB1joAKtA3YntZ5K7WS+laD6zdwLTH08/ZEIBeM11rj
	 b4qudaDbBKmDNi20n1wPzzAo9nsjgh49kB0TBe7telg+JzWilpNt7zhiYboMiW7MCdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
	b=yKw+Dl6tQHG+RCfLvUg061LQegiGSRzxf5MJl93XZICUKqUcg8nzCozL5yWrrZATGO9J
	 F0QwS+FXHO6rVuIF5Al7EL7pjiBnlqOAcJBpuJNs5q7Mj/HwO4zucjoGYkBzQhBHuVF1B
	 Cm2U84W3pNHoux5Evw9qeJITJEsZctR3xU3qEsxWRmaSDbr026jdwaiLGBgXpgFHSjToL
	 OkRTaAm9mnq7tCmPekO+Sgb0iEtDzUoBEwcvXW6tqFBSrcTpoZK9tbtVGnwGL6Bvqsylp
	 /ZYRbX8ftF3YYzt1EQRAxCcR+4zJh1TOTRABwgc6MiqvElVScqoia0nNj6RAgdsi04Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GE7Hmpj9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CB606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78CB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GE7Hmpj9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so42237825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730653; x=1794335453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=GE7Hmpj9ocv1ncj+ksOvEoyAKHd1Itzoc4rYp3Oal13d+3luOnKwoBRWjwDFPI/Tec
         xzwTZiw4zOWDWRxClVcCsyblFeGM14IUyYy/p9yyigzma+Vmv2aPnjls26oq8/BZz+4I
         VBUbEXkjgmcOiI0rfYIW8a0KmWJTc+h7597tEEphaBPasEtnrsXSx+ia/scyMP1IEq6i
         puoCMaiNYIf5Rt/T79U018LOzKoVuvua5Fwg8LICnw+Dj5Oh07uN48Atnx9DnApYY2VJ
         6YPjpB5e1pHZvUE2kG7UDhiLT7QS69A70Gh+16eYaf1ZYKTGnuvjsPF7SqXQKCpHIfeI
         1FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730653; x=1794335453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=Cz+NH/P7hcYt6coz6rJZQ/oeOw+Al9JkeNSJEgb+lGxsfMKnndnAFl4alZmXEgmN2b
         ZJU0/z29xzafiEzw8h3iUa9Dhd5NLZ8MKbBSoaC+og9R6GfcrkEvAfvWfuUYPJlcDSWM
         Rf+YvuAZ8T4tB3O1FITUgzwlXgcwPrBYAZUQUu4Gm671ZSUoumZzrKtuZJrg9qJ5osZy
         FsUMJaXenjeFNAk0A48qn04v0cMsUMhx+v/keJFmIZxOy5S5uqzf/vC53fLbvmT29lcc
         WgO1uIMAPbh2Y4WpUgXNZ+V2gP/GSRTjB+h7LyJnjl/jY2RxGOw1z0B7oeR6f8JECvzG
         Z/Wg==
X-Forwarded-Encrypted: i=1; AKwUvBw3ySaWdG+aQ8A7zlrhWzN5Y9Bf7ag1GD6Yl1Vyr+rQ4q/Cmyushk3EhDc4gi2wO6QQWbNSwc6LUrUM3TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lDHIc7nt68Oz81D+eBKfsadrmtWeT3MOn4xkTN9/OKhmSG6BV
	N1XQt3YDtlHFuST0X3hUzLtvg+Kk4FLjwAH1+eNc8LK0BObeJsHw1oFJ
X-Gm-Gg: AYBFou0YqSLhQRVIjMinXFGisPwIi0WQXR3TKrNPDG+xeEH+dEqyskVfr/xJtl6jrYI
	0xRhQQDXuecUnkgSGscyPQVMKbMkMJ4S9Shw9bz1nhmtHBwAaLlZb+CMYXseO14fL9Pe98maGwI
	b/EOZEo3OR8I37GeLt1CinuF7omSsSnfMrqkGofICoSMaLgBr6bByd/UASRGNbYgeGzXOrg+zFV
	gAGvV4B45EQLq0Djg8XGkiKqEx6s0GnKW497m8NfmOS6qcZTXCeTwwyvpLVRoITv3AconfiEtME
	N08/RX1aAxESwzr6V5ph/jK76ShBPqthPVj4wThBuN4z/e0R6Oq9VrsPZp+zKJ3Syv9kEFv1gTO
	O6AmD6vUsDHiKJG288eQNsWE++aolaGEPnmdagxcQp7BwEKHn69ZyM1sbADg8ghXxnav1FnyeaZ
	6sagdKGe5X/QCpysfHBs/CKfzOc5rTBPNe6/9V9JzWSSCGz7Jh7zgmWtfZD+qTTbLO8+sXIPFJj
	RKtVAuoZuiYiIcU5gzafMLnSwa8OgTU1pfKz8/+57oWOyA4bhTolmhLIxdvgljluDAZ0ERlJgAV
	64a5rU+l2MFfsAfKwFx5mlsF807pfd2HuqvAAAFlDt+v/6NKLEJy5MaTSqFwY0Srb6QsI2fmzGN
	ngwpPN7qQ5+uy9EuFF60oTcDaFpboOq0DxbnjBj6WYctD6iv47oB6OMOHeiSq92b6hgeuwX7If5
	kABBLA38Wdln45TmP7rhWx0SxNX3sYTG+czrrpGiiLqAM0o/3x/08r6ze4InKSpYpcsz4pnREGo
	XsruVB577LH0PR8c80uzc/P6CQaq/uT4LqSoo0yxuXdEy3iqQ==
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr314385885e9.10.1793730653132;
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/4] mmc: sunxi: Set the IDMA DMA mask
Date: Tue,  3 Nov 2026 19:30:28 +0100
Message-ID: <20261103183030.81078-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
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

Controllers with a non-zero idma_des_shift (D1, A100 and H616) store
buffer and descriptor addresses shifted right by two, so they can
address 34 bits of physical memory. The driver never sets a DMA mask,
so the default 32-bit mask applies. On boards with DRAM above 4 GiB,
like H616 boards with 4 GiB of DRAM starting at 0x40000000, every
buffer above that limit is needlessly bounced through SWIOTLB.

Set the DMA mask to the range the controller can address. For the
other controllers, it stays at 32 bits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 9744b6b860ac..479420071c2d 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1385,6 +1385,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu)
-- 
2.43.0

