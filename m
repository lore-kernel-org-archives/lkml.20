Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735195;
	b=jO39mYQEAT/cCIrgow/D5N293+PI8x5pf5fAhTI02zADGTU2av3Z+V+w321Qcnr8rKEJ
	 nGN04WfKV76aTprIWVIk4MAiQspRs4JCR3hXNi1dLTZcqKFPllPMOy0dwE+tSWj6nfkas
	 lHapljZR1cQ5+dNPqnYWwMNbkWx0TZcldZAlUoM2SSbZJoY58cVHHPHlUtKZ0fpoJZd9R
	 zoK3iKJFpmaTfwDmKgF+FntIUK5006Smjflh6quwqyjdZdgdnS3wmEFGcLNv2GCPkIuvI
	 iRUTCWypxln19TQOz3ntDqHvm2FKhucMDBnMXug0d8JWgGXhypVN21SY9INo5bfl3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
	b=R6pc9OIxCl15f2JiwONY6meFE3ByP8QXBPQn4inNK+f2IqwQfvgOh1M3ItTgOf1RA1rs
	 XgZ0QnzRX42Hx/AhUx9VTyvQcfJcMZwqHcrceamuTr28sqPwqkZUwA9KTjU0aWrCcbEG0
	 oQLMg1KdDTg3dHPyXjZdBEWynnwI0M108GCwokfSYSIwowK1cr0Ko+rWR0s4vEUAh7ZZU
	 b2OGvQZJvARVQ5ecW1Ng1P8UQa/CF3SA/Lk5WPlxBH+GVTuYWJFagvNpV/mvbc1zt21Ex
	 SPBI8l/Wuq0SWBJM8QGn90acDDLUnRtNFU0FQu5Y8Ps3AOsyBWNDM/2Bzoo9EecysOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fs/rvhwe";
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0966606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0966606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fs/rvhwe
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b19e291cc6so3368687eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735194; x=1795339994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=fs/rvhwefb3mMzLgtgmDlbzn+euuyqPVkCufyk0vazIKUe0xa7dm7d0OBBKCkgEdxD
         6kBuunuY6gtr/uoLEhtVHv3YQUOutY2hGXGAnR0A2WER43Zx55GOK5iCBeA/oUe+qHjA
         SL62uIko58yfVm5nfUXYhKkeeXv/PK/tbgbqPQQQxVTcoab2WTDU1mDzwMXjqk/atNTT
         estj09AaSWkb7Kz7KxATe0p2h/+pP89t6mzSPfG0H924LT1IEAD05pOKk2c02LynK+m8
         Cu8JFSZYqg2O2pO88MMlkbbUALW1jG/q6Y7EBBIR8Gv9UVhQFj0P2cWFOoACw4U8c6KR
         SmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735194; x=1795339994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=YcIHiYySdngtFng0oxpwotxcS2nsz5iDfJxpAaOZgV1Bx5v1n/BMItggRp66c7Ieuk
         xcP7yXdEP+2b/tyuKLMTsWcWZgnq4sVfEcOsUdZZkGTer5gpDw7WMbgOhmIf931nmhJv
         p1SEN2azdvyGqubsjo9p7owA5nsIwZ/IR926Lul2RIzaTA7upZdi5g7lTe7MyqkJzza5
         SfdJHc8FQW1qTP96VpWouKIOsJ5AN7UzE04mVQ0y/oRR+C/cPptnAn7xdyq7wKg+/kEA
         nXixjmp/CuOMPwerfZKW0Ui/BgkoHDzR0BGMP0B9jpgp8+34AfGgALOi5Ml3avvgg3Nk
         nQag==
X-Forwarded-Encrypted: i=1; AL+hErEU38i32o532H788K4tbiCgxofgpxoq7YZgGuTUtFRmnFG4L7mu1Zk0GDFBtywBXUvlD3jj6t1P6dPacQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OQtZzfO3r9cFEm5g9/OEFnNCsYE8J4A58LWXT2YXblJak3nxr
	Ys3fsb0RVUaYMBESCQGxE1ZONng3nuFh9eQlX4qlSbzlvQfsFXZDReDc
X-Gm-Gg: AYBFou0ujHQuw2z5wx8jGfQHe7eXjKlVYI9iCupC+ogUa2Cg3rJGbCRmB8QTmYnvXQU
	8ujPL1kXKpzr2GEuYX3VaoOnnHy2wIH3MqtjfqVMSPCoETuV/yisKIbWDyEO0sch4jEh/uPjrt+
	UuxNV8vGXo1ybTzgScr7QRpjHKe1NfViVdSeGAey6s9mb5Ij5k0KiHcOdhJ1nJIp1N5zB9hafvg
	u6RQsmaPU0DEAtf5RkE4Z5KrPUhMtjXry3x1gwMbFVURAwmNOq71Cogqngh68ZJB+vY1p3/OY5i
	3CRljOS873EEGpKsuUW0rdYIUbnQPPBP1izMh6PTkCWi3mTruACOaKnIIv8xK/n+3pQPlTyqAsv
	Paa/1Ka1szpyQuhOhlWM8NK0o0owHnnTqlj9Z1mMVz/feUlFlwy2j2WXZJ7BDokAvxkOYHIV/F8
	dEzCYUZfpzB/xXQRWQFUFpXemLSWq/ktIRG9vT8V5pXUShrd6/vEmlMOf3Sc4sKGcgSdtIPgXya
	q/uctubFfezBbXSJnV8icWOLX1N6yZ6UFchAZ0U93VHk38wr7GDGb4VukUdk+qh7AWlRnMaNmbe
	nyXbaskPT4DOKbaJGVMkjfoEKKagEhWWLgi1deg6NCb2OYpS/v+ZmSwnoFdbL1i0XwQjnfgbyFM
	qreRHrmuIVL2lOUYV75uU+Jg3oDzh5VZSyIzWj+8qvvg8QHlfjzta5tRo5bG/YCNfNX5FZ4cWNC
	dQlQIHt0o2O2ZVw9bu4Xe03p03jGB0QxVlAPyu8KH1Dkwpxst93WI=
X-Received: by 2002:a05:6820:c3d8:b0:717:da:ba3f with SMTP id 006d021491bc7-71ab4fa7032mr3576066eaf.18.1794735193626;
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:49 -0700
Subject: [PATCH v4 1/9] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-1-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a57f530c6f70..885cb237b2b9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -605,7 +605,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

