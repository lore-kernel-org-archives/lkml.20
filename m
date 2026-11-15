Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735196;
	b=hvKLusYIR+jzKgAb0L+hBBIhWFXfyPYVOX67dKfyfYkImQIIpibgg5xFvEMq+X0cDoF2
	 sT+pNKxw8y2SlQBkQHs2xRx/E/Nz60ftU8vKo1A/PLGrxHmtg4BkKZX9HkHnBLh7v428I
	 +DGViH/HZaQMf5iz4MYKkcIBv0j3iBKMK5Jly4maSGgP7qxsWp23N7soSEUuwq55a19LV
	 06kU9JI3TJazaQuUV6hkoWzEFgbQL6OxC0uCjny8QFxqtrqT79HQO9LHqaLMtzmZErazH
	 BvtTFvyc8+QC2q8m7lnrNNLOnTRdRTsAq0vCyMYYQiOcvWiGAUIora1beBHGY3y4NDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
	b=xTD183LzI1n4zmJI9NUYsz83Jh8R4V62AKy0USHCXCT1zYgGiClmDDT91X9PgdRGB+Mz
	 /2wBi1CITpgYgizPWlIBgoUoTj2FpCbPnh291a9HwR+4Y23YnipF/HO9XdNUz+EPWYRi6
	 OqpFQlFbEbIjFwYwtL2FMI78sZGgXfa3I3Dzrky8us9d/qISxqOM+PEkRy59XvVhv1Y0f
	 uGqZg9V0gJ6aTwBfWPsvoppUXYkeo8dI97FbOhJTH/Aky1remRriVJlHhOjlR5jCMnBd4
	 +uqx4EZ6xp/OpGx6BZrc17juDX3CdF8cXtzivfvn48af7MgATDOK/NLLnFLesnraINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLQfn8SE;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A5606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8A5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLQfn8SE
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-862b090e41eso348513a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735195; x=1795339995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=dLQfn8SENWQdwhM+3gZFbvRn/ZEgQYuRLM3YfMEKnqn0VRTM4jtSpbKJxmMGbMD1jh
         Rq8fOsIb5OxLScPlINGeWLcelmVraq8Ny0mON1YOEhVXfmlU+SlXYbH5w1hkFYe/j8Oa
         rjt1Amg9sXXqe8YuabcTmXgJBKnvHzWgIHqyZ54HohEkD15vDvbkgQyVNzZjmbFh3LNe
         vB3Mt0QL0SWGcD7I9o1mzuvjNPtsVFTM1a4EsaPvDwntJAopJlTKHsBLjPcmjH1hdFgJ
         MPf3fFcNpUuYhAw1d4axKklQn7q8rWsBAS4Ilbjf639v18qY7EVz678eFrLHmjZWm2lz
         w3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735195; x=1795339995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=NimODumD6WJHK/HsZtIiNACICaWhm/ecf5uUx01FUAWxKH8UzXt5seT0aUNC7QIJRO
         Rw7ub0ZUzjd2XENf+2K33Xw6Ig4dscO3cVYcUscoxpAdk5E1o3gBmplCxDzwNRruGCOO
         DLcV0HVyyFECLzuXhUFhhZHwy6EabymBbg8nSzrrx2LKfyKqkM7kjW2r1ttz9nauMCPN
         S7HcWg5M6Fg3jMsBgo2Z+5ufFnCR1ZSchvpIUYIhuHy6Pao6xbo8ivF7odlIr9rkd4m1
         0Llh7ylS5tt08CtbBg24UJBo76FqoSAiJdU2K2IUkpM6fuuZo1FBz/pNdq06clU/sRhR
         hbhg==
X-Forwarded-Encrypted: i=1; AL+hErHnZciHUk7Ry+9IAsSnz+2Kme8QjcMBYHedhMhH1fA1VoJYAacOM8R6bMPG8xr6PLWRxxvYeSSQPNLHBm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U/OyyDrNrdlBxSEmHHqhwdwicV3dWjzlO3RtbKnAkvg6rh4vH
	HeAX7Sxiu2eq9AHYbMkDz/m92jdMp7q1lGQH6Kjpvii9/Pll0vvX6a1P
X-Gm-Gg: AYBFou108eOPG+25e3oTCbi6/MtEI0iWR1SIub/1P6jwVJaSBkM9z1Hddt5ETbEKbNo
	0fSlxnUN/HctYBS6xX4eW0a4aMm+sA/QjqpEHbXJm/gUK51wRK1BzjI3r0SPGUycjNoBcFWO0RD
	LPIRqO+UYQaH/9z55V5pAFcwCTfNqHBGl4z7bh1ShNnSqvuXZabW3IktAxRizdm1YrMS12e6L0/
	m+4rjupAp/l9szeaWLWpQTWIi8ANTvvl1LWCt+8Jhj11I7352uItK2NHXsu9CkBPAEoGAnMPmA2
	P3WfOiMVp9qQMwSjLFCTkZxi6P+T011Knix3+GEtidm29HZVk+olbL6kF7SUjfGnG3KbOodX6jn
	z9rJckfy0dE28OxfXnK/JXFWLtFsWU0TMUskknEH2Bx9iQHtPbPZvamRcULlgCPHtQp8lC6FLeN
	VvJzgwnbN3QicCiZx0X/EKsxLv5gllwu4ObDcgHuoNlvRZxj8AALdFZxb7gqtb9zn+zmuetAjtP
	+NR0JEc/I2CMXe6j4PJjwfGOg4GsyXQk7ZSF1LJYTFUcyUwGr9XbXo0wpXJcAD2eNdhTQvGcy5g
	agVTtLZmN0hWP5dqNYphtWeUOZUvS6723dCTPgAGGszSB8wHWY56cNFsc2gjlrVc7IOGTjoaOjF
	z4X5YmPAxNI3u7f6y0BdXaZfJL93RktGe6czGrQe2lJrhJCxCBEsNGxfo3glVzkghMtqr22lggv
	uIhJgvhp8UxWsA7OnEEcybjKqD7OYx75651XMqQR478HFX3k4DDGc=
X-Received: by 2002:a05:6820:4a8e:b0:71a:ecfc:4434 with SMTP id 006d021491bc7-71aecfc5888mr297943eaf.61.1794735195084;
        Sun, 15 Nov 2026 01:33:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:50 -0700
Subject: [PATCH v4 2/9] dmaengine: sun6i: handle the last partial interrupt
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 885cb237b2b9..9533f3bdb949 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -589,12 +589,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -604,8 +605,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

