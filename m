Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725305;
	b=imz1wCMx7jOHxBCThX33XU4QjTtspb7LnQHO4P/4kUdcD+EciLRYZ0wtwMQ14In+iu6b
	 EbDfSrvuzTHDFTRyGPG+zWKTnrTViWiGp8ZSzdbr3OF5ORYmoPoFlJ2X6IXoDlYlWWlew
	 SptEOYjdVWhk7EI4ARoF3DRRLHc6S4rxmvZaMqE8b7SHiNwrMi+d0yTaVZmowO5jP241v
	 83YKXi9ad8LbbbEkHAL+pUSBibpGjwAvITBi94Dpk2G2oYncNZMUrXC/FqqmGIVupiWlq
	 RUViOAJR96wEpj1n5jlSd/mEfr/6Hr39OtnWQPPgP2Pl2Iiz1gGabURDgocm+oGLmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=siYLO9iFltddJz5b7rkdQm150VRV81kPJiXKA01y9EPh5z4A71pxcZCJiFY1W0KAcF06
	 Nz4H8/X7eIPtKU1k5J/By/lwcTtetZc8U0xDzcTDsH3lAyRQ5dc3/etzerXX6pnKaiKRn
	 3vbMXxMxwBvccrE9d76f7aPnrhnQy/mZMGZWg9oqNN9ZWsNO/nHzwyh/WnVb0jQAipxII
	 jzFPiZdunD9ix0gBUWWCBBB3kU5CjztxyBXhVOg2cKINcH1U9iDNbpGFhrzJQTyde5oBp
	 wEJ7snQ0jXXU884sul87IBb2AAnDx8TLwlr29L8qoCbRoC467c8gdssBBaVIU0xVvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUBWWbQj;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB5606A334
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72AB5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUBWWbQj
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8451a619da7so240035a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725300; x=1793330100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=JUBWWbQjOD6+zb3S2QntWMG9Wgx65Ryuf8ExFxdR0rr+GWINn/VLk38OnXlf2DHiXD
         F30L0dasS7cG4nIaEAZTznpdlRNIvaqDjwVhVEKLOaxyTLhn19Dr0/B5ISEIC2TNuXPw
         WSUprtTTkPwm+QNgZ4ea91vBgdKY2TIjvw+w4Q9mrl22UctVk7C7dId1O9AluFxk1+Da
         FlUOcjJFbnGBAYJV6p4bVHpg9kU9II6CMx+AnDusSXwF/ysmepiexZVy5jN1iv0BWFT/
         T/rlTnydrjNEv4pZc3bd1y14QH1gcU2TUtHIxIz9RoeXgxGY9qH/n27LkglYnywVkhCV
         LCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725300; x=1793330100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=fp7H7X9jLvIxaRCX43s5i7SGWAmw0ynpalZWOkZp5eH1sPfm+XRGinw1b+hTDxA+2l
         7E9B6MJVQ7ymMDf6U9iO3B7DpzZWbpBdKt8Qfj3Z4/23cKVrwODYVeG5p/jzDiayYsbw
         4ZPLSJwoY3pvsbR3it+u78Ofkufj0WLEOZJHI85Dn4CKbEfrhC+d9W8xDH7gYF10dK0h
         pjDVfjRJbMUKwFR7enLoZ3Xk16y9kvBZHjK3rAcfIIm5Pg3u7ilMKKm6D+ZETWXMvsrQ
         Y8D29pd/BEmAI6XLqvid6Eplq3OhIL5ItupDfRu+7DNedwIG3iJIGLehvZdDbnizWBrx
         7vdw==
X-Forwarded-Encrypted: i=1; AKwUvBxs4sjhaHAKdccrA0kxZfU8dZofHKu+g2fpp+laf6NVQxkTgAO/nRygsoSUIa1alriul0pUSCD1aeesbRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQKykPCBFLbuBRiAHZxFCx9qhUMrf7EoeuwU1S1R+yjtZW1YbE
	3qOLYAcZN4OmulRZBhiWDnTXv62POa0yTx0OpsxvpH7ItXX8f/4VmMW8
X-Gm-Gg: AYBFou0U1qSbW+OoucrOKuI92drkvHlgXCK+lPSAP3fHAnGDCXCJAbjuldrdOFEtskA
	vpKk6q19/bfj5A5qB0jGVFJTOTpYvkLuQqMo7PBJJE3raIyCg/QCdrCmfYVYsapAx2zTrPOzIfH
	8a8Ne7g8Fyc8fW5NfEEmFGa7tjOKW4rGuIHbI/MsrMqN9VgngACnkw3yhPM+m985H1QFg6qHrk3
	UhIJ7UxdpHDPEkTRHrDhOZJRmc7oaQId63ILq1yr28Eb5VMLZDsrcxeASs5HtYuQQvuqqyHqSEM
	0ZSMeuNhVWbffS1K3xfMjW1gKggYKm6hOmlOFAXXC4Ez4X9xQh9kfc45hCiYng6O+GyN9V/uN+v
	uW6pjhWU5+4b+29n/7KZ+ZYzY12mMc19bwjc39qRpYkUXchE7I8hmpEbVWM5C5lfvgpjJhEd78/
	QFhAwuX6oEnXlAhIByQxxCwFzVo5BiXu40FVlOmxfiI/Rsk4B42K72vPK8VByGhF7TM0oI9u+la
	8SMK05LIZpTBChinsHDtZxwuQ7UOsIlLJY/dANDY5wchGOL/FJBn6Qj+CPtqEkMmvWz/Xw5w9DQ
	E6vb0AwImN/iGnaY4lmFY8eYmHtL2Q/RZCpLtSz+tsNb34vl91it1DbiK1bqYWNAU5pbDFBQ+nE
	UN2c+6AN6KElzfQAllFKVrE4fslmjkljxNec1wHTv1pU84ttRenxrx8u8joe1h/y/wOsl34xZMd
	S6nrOMDG0VBkxig5TRl0nmnk4Z
X-Received: by 2002:a05:6830:34a2:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84faf57f015mr783469a34.15.1792725300342;
        Thu, 22 Oct 2026 20:15:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:53 -0600
Subject: [PATCH 2/6] dmaengine: sun6i: handle the last partial interrupt
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-2-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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

