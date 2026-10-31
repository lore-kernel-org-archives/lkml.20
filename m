Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793422596;
	b=oo8FSMazKALxBKFnL0+J/mzOc+bZ6ttQBp5B4Of3RARI0SgjppkaKXCn9F6RHwbQ5XfP
	 YGpqakVfX+qhhpu2y5bDcH0qSEWtcSriwXvBJGwcY+DUzlrp0Ef0DVo+tzQBq0ey5Cv/E
	 +eB+df5b1WluJRtsooykFEfnG1ZPsUQHzUy85FkfKhYrA961Of7VDsf+Z2Q9IP6AMVji2
	 DvIZHmy99jdz+lAnase8LjntV7OUX/M8IzhyhfHGnuo/iD6EYu0Cxda1ZfD4agokkvR82
	 5iSlKX12KlpT2mp6fZVa5Isyum2A1GYKy+NWSMjHqZo4iii41HU24pad1LCJ8srWXWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793422596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hEvfN2in4LxIcbfP/vztl08HHOpTmxjwkLdA4M0dyFU=;
	b=1FIr/LD8UhRemKqnz5zFuQtVitrcHri/7Wm1/zGr+wyfPjB+9uBy7imBkShrXzh4d4Ef
	 /M4eJZb/55rkWTMcQze2W1wSZVhWwvs/sQrrKi9ynTGl07ChzafvjV1oICWPkE2RJby1X
	 osGWTJ9AMz5xMkWEOebX9dTgNlTy26mfTsIDaxW+e2hjHUCne8htzw43wxr/qpbdvSm92
	 9IB5IuD0MKrb/Lv8leCGlBGedsTea9jwgPEk8eYioCMj3Si0LX+aFwsc6SZkOeuJ5Xmvt
	 KLCnDy5oA+xbt61wjysEQzhoHzrFSrIciqSivRmZba15eNd5Q1ZPHjCc7qN5vblXYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9ETcpem;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D38A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D38A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9ETcpem
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e96502e447so13185135ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793422594; x=1794027394; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hEvfN2in4LxIcbfP/vztl08HHOpTmxjwkLdA4M0dyFU=;
        b=G9ETcpemj+dUivyZfucVpH9xUsE13MbZ3cmOIFLDq3p2mcxpZWztcY19k9mj6mrC/E
         GazR2qtYzLuTtCYy3MIAfsHDpYXfOL7gXfN9YymPQQj81hmNtyPs0LLlpOFu9LHkfIr+
         mBRhlcAEtz5cWjHDsONrxMV96gzKJDjjoM5A15Ni+xmleIJGPGaHi+crLSFMjcNs83dj
         KqFQpvybFAmXC0cbdvM/dQ0k210QQ9TKypvt9AGqKx4cpDUNt5vJ1pkWZhWug2bkZohZ
         /RtOBHl4nGsroTXdhpSFeLcqyXa2VSdxnqai8u/eO4tMcgaAKJxDHSy/PjoskXdzk6tw
         TurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793422594; x=1794027394;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hEvfN2in4LxIcbfP/vztl08HHOpTmxjwkLdA4M0dyFU=;
        b=D14wjFLDRtci0P06u6sadQs4LJGfsJeP0hWW9Uk9hcQVKn5JNudkBhSF73SrWWy9FP
         F1IsfIj63QbFZJUdOsDx2YtU1KWfjgLftrUlPT1BicnEUQeHa1Bol+u0JMtNMMK4Gkeg
         LVsrdAxYjJN/pDu4dTIgN1kem7aUCsCZvVwovpUSVire1Js/vfigsS8S4zJErXtS8iYH
         x0b9EJmpdUwaWEYfKKbE0FDIBcLKibagWTnZfY8VAqOmjC7suCC8quxJ4Xz5E0DnuPmm
         W7elVLlz+Be4rnkmRKmOxir76w6zM0OY+hlV4a52HmYrLyFYdDmm1YkuBOFNtEN3pihV
         +siA==
X-Forwarded-Encrypted: i=1; AKwUvBylxVzhuAofpCV/f5CNX4VxqZDcpUA21Uvz2Jg6H2AaphKGbyMIFsdeWzmw+SyuOQZaEIKP4SO4gRw7tVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYInb0oyvusHVWYktqXc0Obg+0ZJeCeCG8QEDkxGGZICUX1oRN9A
	Bth29qPsy7mCpYRHSkyYCoeVpIvV8d+1DfvtQ2x5vaCc+6uzbGNTbtvf49s7wg==
X-Gm-Gg: AYBFou2ye0ntqIcIft4oOWkrnrK5Ig3y6ooiz5brfUydp9Hv5FVRfZNf0+ZjfopV0uv
	OlVKYObVCdUEZK7WyAVkK/k97aVIfL+C8lBcnJ1tkDWVfjfWJAldml2FwiThBYP6XF70IBH67r1
	jDRTxmPOeAILpKyYHNNbxjOUDCj6DZ0UZHOs/F2aeCwxbaYtuw58Pz3R7z6M9W0To4XSBo/sMbl
	1LneDmKN1ie4SPB+oxA4QfnwYPuVZwSsQgV9D8Za57/6pr/QGP5O1wLL+BM0J5xsaKCyJeFVbt4
	aLlYCpvUuJATFU8GYUyWVDYiiIiHtOoEtY+YnVo2J6R0IFgl2upIQHLLUfgI1J6buUkdf7MWodr
	4SP2CgWJGOSTQrECgYK6/Z0Cz8vpL/5kduxqgImhHDLeJLI/rgGWOuzp7/ZlJApC72HIcpqqY3Y
	hHRjTmXcy6f43ucVyX/A0XmlaYqoj010ce5YIJoib2aOpFx1NqgZRgQdy51N8KUGc7R7y2H8cxs
	AVxFCdKlBNT8NWrFdS5ZupTZzFxPnQ2LrMaAgloWErYDPLF0hWWYuchKqmr1/DEXXPylQSAP1Cb
	wne9B61Mj/sk5xO4vUCneRHi2RwWpveouhEaHrzcINNEnnaOxDG1sd6HVfyW26cTuiUzuQyDOkk
	hdzlwvCWyzUa3nu4oUttHcGdVhdz6yQyBJAXss1BX194ey5TtzIxx8ySgus0HYtRRFbsp58oBoi
	SzDftdAeYasKlccIQw+fx9qmY=
X-Received: by 2002:a17:902:eccb:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2eb36536d3amr42961375ad.60.1793422594375;
        Fri, 30 Oct 2026 21:56:34 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39267b8asm12657775ad.44.2026.10.30.21.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:56:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 31 Oct 2026 14:56:15 +1000
Subject: [PATCH v2] ASoC: tas2770: Configure transmit clock edge when
 setting DAI format
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
Message-Id: <20261031-tas2770-sdout-clkedge-v2-1-afeeba781cbb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2pq2vNSV/2FYlHaAKlDTKURD+
 HcLxqXLk5x7zwKE3iLBJVnA42zJujGCPCSgOzW2yKyJDJLLQvCUs6BIliVnZNwUmO4faKJUZ5i
 eTX2SpeQQt0+PjX3tv7fqyzTVd9RhO9uMzlJw/r2HZ7F5v4b405gFEyyXRWFUk+ZNpq/toGx/1
 G6Aal3XD2U64VvMAAAA
X-Change-ID: 20261030-tas2770-sdout-clkedge-b4e39db82720
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Shi <shifu0704@thundersoft.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3386;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OwmxCPcbFYhY5r4ZNCYTw9bPJZ3qesg9plNIEYpdPFI=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGrldPijNpCpGHEs8q2g4WcZj7Fi1TpLi5pdfRl+4xeZ2DEfS
 IiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmrldPgbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgkhUBAI1VZm0L1FZETGpuMHxwe/eAnJ1+fyZx35jlD8ToqFi
 gAQCkDc/wnTqGnaIaHiYLN0cZdOvaw9JYk3Qm21hQrtoSDw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On reset, TAS2770 is configured to transmit on the falling edge
of the I2S clock. If BCLK is inverted, we are also receiving on the
falling edge. This can cause data leaving the codec to be corrupted.
Transmit should happen on the rising edge of the clock when receiving
on the falling edge, and vice versa.

Fix up tas2770_set_fmt to take into account the BLCK polarity and
always transmit on the correct edge of the clock. This fixes
corrupted VISENSE data on Apple Silicon platforms at sample rates
above 48 kHz.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Check return value when setting REG4...
- Move configuration from VISENSE transmit to DAI format setup
- Select TX clock edge based on the requested BCLK polarity
- Link to v1: https://patch.msgid.link/20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com
---
 sound/soc/codecs/tas2770.c | 9 +++++++++
 sound/soc/codecs/tas2770.h | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..67ff2dd949be 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -353,6 +353,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
 	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tx_edge;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -369,12 +370,14 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		tx_edge = TAS2770_TDM_CFG_REG4_TX_FALING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
 		fallthrough;
 	case SND_SOC_DAIFMT_IB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_FALING;
+		tx_edge = TAS2770_TDM_CFG_REG4_TX_RISING;
 		break;
 	default:
 		dev_err(tas2770->dev, "ASI format Inverse is not found\n");
@@ -387,6 +390,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE,
+					    tx_edge);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 102040b6bdf8..666a9631c65d 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -74,7 +74,9 @@
 #define TAS2770_TDM_CFG_REG4_TX_KEEPER BIT(5)
 #define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
 #define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
-#define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE	BIT(0)
+#define TAS2770_TDM_CFG_REG4_TX_RISING	0x0
+#define TAS2770_TDM_CFG_REG4_TX_FALING	0x1
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
change-id: 20261030-tas2770-sdout-clkedge-b4e39db82720

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

