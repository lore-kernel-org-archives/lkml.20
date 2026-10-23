Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780966;
	b=2ryisAF1nzQfo4TlPlZcNFIsnfDB1CO5YZpq+bMQjqMxoShqosMsbK0BWsbwDqDqVhxp
	 SGL4Q3K6ySkvJMW6hQBjVf8KH9GOfdVeKEELPOwSEGRJ3QMju62/bsJYwQghNQs2nuZm+
	 zMVKotkTWgRO+JBkoyztK3rPm1upbB0qIez7iqT/W6TkCtYiI202qR52GtvuReJaHuM0U
	 s9qxjHxKUYe/U+2Ww1oS+sCJk4pldjSEIA+JUG35pVhbmkIFYLvs7CHuVW+vOzD3B+KAu
	 cA0lIs76+d18346c/5SHLqyKNyR7Ip5Ot3CcalgciIVFnKJN/Agm61Nrt9xJDpOCPEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=GeEc+CcwgLi6k5Zwxm6ZdAACX/zrnfHr5dv+Ji+9x36onGs5KScdNzAyzJFPyqT1Ohk7
	 41YfV28Sv/YhOGGP9k2E+G34NApwq70GrpwcV84fIUziTUsOat7rDmEMHCdKleSIQCMLQ
	 /P38TWgotfV51RsSz0zAWT9gLDdlX8QManDq8fzRq/q4N260BX2On52mMC8nm72WoTDz4
	 6S/iJyIOHJNx4LYC+8Vrro+7T8bzss4CpHhc2bb6yxvrhT5s1Fn4rUtO4OFaD2jk4KmqI
	 AtlhUa+eBFuJweF6imeJ2HySe9LYEgBGayu5HvB6PDpNUY75KWD761R6tBnbHnXgdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGHX5hu;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B4606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6B4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGHX5hu
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de1fd5f572so601094eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780965; x=1793385765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=SLGHX5huiodZlkNq99J51FiOKv4XM9q9Xs0bDua0NtQlic9V5QXI4qE2XMSNOBPJx9
         1quJqfbceKvueqHiPAn1D5b/NZrAPzwp7oxvBw+AO+Enmia1OJeTBbl9a4F1qA2BCFxV
         yvCXLMl7GSV7ESByNrpHN8EFuFDauut2YsNzYoufCL4ViCbIE7zjLMe4bzeWcULIrnde
         6Uyk+JGtoL20FvIG8F1ltoJMlSTXO/lBKMwb3DyxlwFurfB4gNvzM9gqqwyAn6N6YF/9
         pC09r1g16TnEIRtCrG4Exl0weDRxoHR6f0jwj1XrSErOBBprwIytHhdRcSntmj/mqw3/
         aUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780965; x=1793385765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=ELCUINMIJd8jQMiMrOSBud0GJQQKmZfollO5RpvB4VCo5SJOQOsn4EWWolVPtMcUNA
         uXQ5VbAiXvoc1czcg4qWSGF7Ch16m5RYrznGdjDHlDb1LlSvZH+i9Q8GUY70GrE3Rhes
         oG+6Zk3FZnh6/1JBZjImWIabsVfTSOAOMY1gZQYoZl276IprTioRssff3Rq96PiyOApY
         UzN/cJD7/Mnoo8ApmeJDNEZbbcKe9aZuo2PMve/SQ6DzsJ1DNtG73LWfvQtlW0Q7eI9l
         BrhJi6TQ/cXtqAZodi4QeuKQ3s5auWGY0osUcje8cA88NoiuegUDd8q5cHP871UGvgu9
         Z05w==
X-Forwarded-Encrypted: i=1; AKwUvBxgNmZt4a1D0ntanVt0aFRlLUuGgauz+GYAU/Hqr3nlqNd6ntHvYnqFcH5GLql9kzucGurOL/rE3i4YzJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmA6BQLN7IU+tNnkHEX6Mbryj3UC5xhD60G0ptxlT4a/nEMdzE
	g1r9wE/rHxLmqPxdv47Vt4ba9Mp/jhC0vCHHDZyGOuz3sZWXnlV8BJ2S
X-Gm-Gg: AYBFou1g0LlFiNxuLiTYCduJ4X5wDWse6iT4tjBbPZjg3fEFuF0UgrDXWKYSamhcPXp
	vQeHQS4K64HwnwS77VOCGJALNl61H2N5exaM2vq4eEU91ivJdGCCaKpHRnC+57otg6ugW81zPKs
	B7gz8Tl5v/ollwuN+140W6yMBdsIi6Cg7WUCet/ljgo0iHshBGlIO/4PaFMJMyiFgKAnlPkA4hZ
	iDnR1EAMMdJFoJS/xTR1JLzVN2IwHMwUrVkcpEXsEIb36CQ9GqG3EqEHBr5sui1pPmtSJKBDwzG
	L2j852/AmsHHQi1Pst8BY27rkidNQmtanS7xYfepoJzWSplpGtxYnOS4tc0OtOSto7A7V4AGR4O
	nuVMW0iN0KuLyHshvHbaLXUwWRlttD4ASo0ZoACZN3A41lvq9G5XP24VDLt5dk0BUVz2TH1ozE8
	yNEHnfByzOC7vKSD3wf6FZM2wKczhY5Dpoa6PeGul+DGbLmIBl41YD1jzIFJ9WzOiTsjfTbmrEy
	cCBY6Jz7sjXJnOT5OpEqMHtvv5nTEip25plBd4DuHRDuWP2fpM7SiK2IXHs6KW188rSmALYmkB6
	Oz373GiZ97ykkuoMjaKYDXCNGQ6/3VHIz6lUP7666Vx87XvwJzKsEKscjCVTkvqoQR69l8lPvDv
	GgOJtuJ/5yUkjkC0rtc5MpTwECgSwuyADCO5iWcCiaXkLg0J1Fjath5OH1giNx9QVUPNn+XHSUF
	N/nQ==
X-Received: by 2002:a05:6808:1819:b0:539:596f:6623 with SMTP id 5614622812f47-55c0035e613mr53516b6e.64.1792780965312;
        Fri, 23 Oct 2026 11:42:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:36 -0600
Subject: [PATCH v2 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

