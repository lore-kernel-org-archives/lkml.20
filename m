Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200562;
	b=T1/uAoU+ZmfyLGPzC2RGBdwgPiZ5yOFQ0gLLIzjgCiEcUfNMrBPQTpKt+JtmMvFX2Kap
	 xpq9C1tSZ8rD9daLmjt9GpduKzh40Uhc++t5R6qYlUfihirB6KzlApr6Mt7DqGRFXFxcr
	 Y6ZUPbrDbRpcvq/+VW7Vz1VmQj5uSYgcWg2g/wSomjYlHx6D+rdA+VOClN8ThE1YE2nXn
	 sdQgAHuOGetocdkdQdI0h2OqLgtx25lzLLUVfM87BKLDz83Aa7s2sIZNT7rpzzhC1UPwS
	 ueRF6YoPyG4har8chQeOcgLx7gyDJoiWJa2oNDo+6/OgXnTbhaUFmUm+XjIwViJV82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
	b=Uk7F9KAoGe1xTnjG3kmzTyuAvUrqMXz2pZIsSxCxopwYY3cGK8EPKZQ9arcK4TCzFlkw
	 W9mZnrw+LQ+yEgBeqjSZUQ70/nxcxMifUlkFkEAs5PhMESCio9oDhMl0BFTi7D7beU9tL
	 KiScG+9bZX0Kz5gpuRMamD8YoG9et/NAxbWFTK6I1u5oqMRtm1nLxiHOGmALY6UzLLEqb
	 Hulo2Dr8KDdc1yjRR3Uajn7Sy0uS/faIx9+jQnMptmRiFLpHwg+7FcMvn4wUXYoNrgq+p
	 H6PmyAursQEEJa2+tasrbqKMZ08vtNAWSZnJ2oPTdofFjPDqIkL7MeZ/4US9l0FVK9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf0V5p0x;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8B606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA8B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf0V5p0x
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f14642adb4so233140b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200561; x=1794805361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
        b=rf0V5p0xsdWdI/wOsBFvhtUY9s0uFE3whuPcHt8ilVnsyYKdD0bIjW/L4vb+DJ2bJ2
         krE4tztoopmqnDakpTWCiG9NHV2IG3Wngxz8sY2l+Ny8wHTgtMWQcjnc1YRnWCCDizyU
         y19eh8I93hr27leJlF4TvVWNhUIxxGWEcECp2EVpj4dUHu23rxAzAJYXM2bex7rFjrbO
         O3sH0NykuccDWyNUT69XVewENnC8G1sDIktCPRXtnMBiyGHCZumvGJxNtR4aPbITi9nh
         TtUZckqStcHNHJxitiftzGF/UwkwKzHKDF1De88CT+IlnxPMzSvU0KJSza0OcD6lSV8P
         /uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200561; x=1794805361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
        b=oiO+mZ33kWIhbffh46TIOgPzDJrSuwleXxt+Gpqa2q/JcJJmQcpG4ZHluetrWmffIv
         XKU3Y5XuezjjWJyGBX4kW4/Z1lB5cD8bXKPm1OxKV2d7KQhoq+I+kvAKkESkJMESYa89
         V9bKzHrsWg/tjCFvtgjRBM2y84SJhdXr49MxM5walTBRMm58EihuL8JFffGgKnlxPpoQ
         WfLZba0hmSi1rAvhYu9hlzW/4c0FaU04mecReYYjnZ6wltqMhHo7MD8aCMYNm8jDrJVy
         uY5QTdSSMF0Ii1b4/00t36TBvucCBYyD6iuZ8NrMdPqVq6CdBOtoRFtlKjrb7uBGnKSx
         Odwg==
X-Forwarded-Encrypted: i=1; AL+hErFLrf2vXq9CTA7brU4i7taAT3B28BD0HnN9Uao4RMAkUgyDAsQ6XwqKUCie86LWA0Uv+Cs/+9hogsbHI7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P+3iXzuGvy6yRRM2ex/1+Apc2OrOaaBvPqtoV7d7p/7vbm6jf
	At+Ng2gxk469iGWymaFjPikoPtkzBWDH5dYWM9QNQodMrXzAWiY4dV5L
X-Gm-Gg: AYBFou32bhJzp9Z5+cds5wsT4Wu/efrKmeuHO3dNyASDSIcK8TOloEOvXAvhsTRCQuy
	C8D0e62cyQWI2ythYNqcC4tdzouaqCp+QUZzDeqmdHixU7KYYQSHEgMN5/pHcqb7Nw72C7kwI1R
	JnU9iCAS5E7/70mKwto6CR62s1MlQ6WQmOTsOLuhPbsryUeAhkZHU1CyCsGw0YBks2r2XSJw0S8
	sAwxK0Ah8ZJ/2sQLVKlJ5lZrZ++n6EoDLvC5WXkZdu63CjfE7QCfNAuiQkM4+lhkyyNFus4T4WH
	qC2zbgevm9ykfvn6TU2/QDHDxKRqNpuMMTntBLJ+6FkEoI+qq2i4JtDg9HjFK8asf5EsdZAcl17
	SI2PN0HgmhMMy5GWw++9VSKzivhQuIuQgQ/txuIo56JFtTA3Sca90FjWfYuQR+rvsJn5SAcwge3
	pH56ERNRiXEGOBM5g9ngMu0KRyTpA7prFq7R4POSde/aXu+Q1pZg4DNvAWMx6o+W+fEpz2GuAat
	6I8/y91z6IxDpPqEeWVTnztpkXJDlvRWtwPfeEwdn1fE3X+jGfFVyFzS85USbOB0BEmKbEPo0Ex
	ditiLfB51n5LnHVlrRd4uCg+qMmorfj4swy7XhFedy/PIxqqBXb4SlBW7qcJvUUs0ls0vlL0yNU
	YvGauSSMoIfDaFWiBBFZUNb6nt0sZUPBvwm5waq5tnemk3wUaXxgPZd6HGXn7em1+hSxHuEM+w/
	GmW20iyn06zIHjXlK0AAZOHTkNYqpMlbIWa1ZP1BHw0ilXrDnkVaJo
X-Received: by 2002:a05:6808:f14:b0:4f5:e12:b47c with SMTP id 5614622812f47-5681442c1a0mr1599763b6e.48.1794200560806;
        Sun, 08 Nov 2026 21:02:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:36 -0700
Subject: [PATCH 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..49f65486e862 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1181,16 +1181,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
+	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+				      1000, 50000, false, chan);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));

-- 
2.53.0

