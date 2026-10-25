Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955027;
	b=D4dea1HAB5ShdurvEC/fCflP26VHV4cvrQTktPCHueVfV+LYBgkopb844Nmya/6dgLzS
	 nMMTXrJQnp1aWYQKeZmv7AoVzIQHvrgR5QL83Sm8ay6db4PrY8Sds3vakZ/qgsfhLbRRz
	 VceRDd+8wXFi1X5/fa4wSTuCmJOv4Tm/bNkXqCg9JA9SLE8M0dBv0qufwkhD6Ip+FrzLC
	 eGhaICPj9ibcdC0pLCkMcvlLH5J5SVU8U7/eW89ePu9TMCQ/XrXKrGn1FySIBoDke1gV3
	 1gHF85xXjnDxHdPa2tAdCpfJviB/thBRYVS0ZgT/NyVFb2obu2sFdECVItyjlCD6gCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
	b=gkE6n/RpndrgTdUIcjOn4k1zRtjPAAT8p/EDNE+2u5yx9vns868f9a00d+zpabAiAprh
	 N0qW6uYyUIsJAbpkYGk+AIjul6r49b6OlgcRv2DqccP4lGiwSifWHAJ9XV4UqOoWqPNkG
	 CFODzAx0tNb7+Wcho0FOM8aHf3a57zYk/0lM42dyFssjGBi0KiacrpzFL7xrqmYYJpQWV
	 +Jfxm2WrqULHT1FVhDNgXSigmXRZhRhv3EmcB9uKoYzpWZwfpR7SMWmfyW95xjfwsZemc
	 S/PQrJYEOcsZmO7IiPDXk3VxZsgP6rq45dZzAhH7kNHUwoP62uaPwaVGaM0cf8vpKEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE00606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so3635258a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955026; x=1793559826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=WJgPkCjaveAzr0VVPWHkhIvN7ysCwpJVuRE6e0O1PUkWj2RZQRy9RbHz4DSd6ofLfd
         dR8XaKKd04Z7EwzgWXEboXeb3KWNIT9nu70gwD/k5OOqHIrSPbjeu3IxtvTlNakw9P1a
         gaXTmTn9osslPJ5wEp8/b152E8Efd+zeKEquTmYS9Bt//LOcxMK/AJm1VPg6jzET4TiM
         4baEZ2MW2hoTTtl5wNf5BDFNzhGLKKr0MegT8bUPLuD1BxouI8nSA8k1fThqSb5txHbZ
         LrGoHKKhrgcABWd3tNgE2I/hyTcOGHBynq+9Q7QQnKK3LKjaZHI9CLITI3rxzLCBmDRR
         slLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955026; x=1793559826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=iTrS34al/twsP4SGNPLJpwEnlHIrPHNyEzyiJIzSM4pBHNLr8xOqHrp5/ELOZWCG0C
         SGHaVvvbJk9AFjWMGNncQWVh3RpbeXVCzSd5hQgo02iffNGZ7RNvFhnPJacv8Gu3J86I
         UME2/8g2li+1oek4GNOxSDaXkf1ly/6gFUzPs6vWZx/2Oh9y0rcxqI0KsC47uzqPDwpI
         chiMpU6Su/RpFA2i17JC9p6RyRt3AAI22mPSZDDfNrZYuDSiRTKSihFx0eLLetAyNXUe
         5kFEXrsCJiJbIRxQ/109m0g5flxLFS7pgWkJr2gzXzIwEJei8noULcEN1SJjxKzud09C
         Qh5w==
X-Forwarded-Encrypted: i=1; AKwUvBxX82xvTb+IJfS2FKsNMjT3bopRh2M2jIBBNojWxwEKKhr4SuSR1tKhJC5yfannqe1WbUp5SiWksYdv8Uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLULwNl2R3eln4YmQFxhC6/w1VWn6WtMBGE83w/CLFL3UCv+PUs
	jUmTRlVQjE1bH/Gndv2cdoDzpr3SdSaOuOBWeGcSg9HODSFSdHwsito6
X-Gm-Gg: AYBFou3TTRMFGLBXU75wOrC0IOu3oP4/uVEQNEvHrAV2MB+SCk/l7sVaWM7wfV42qpQ
	mW/lH19yr8dQtjwVN3AcKaD2ZMi77Gey6ECIsc6Z7WEPuW20xCbY1SFfXVLDBcMlDg/S7dt0X4T
	nlccNbhnHFITN6x8+fmcqldMT3hVS71jzL02kfj+zJlTJy2uET1eRo7LdY8aHb1OxX0BpcI58y7
	jplpTbhU+hffBW33xudWBL4A4fN92SlNTkgm2ZNpyWFHk1mO2g7joK44NzW4OqHkQwVCqVC+3Wm
	JFaQN5i3AmG9zlIZuXWHOG+QsZIlcirHXyUd9UL1oD4BsxT26nsvJBGt40++BUeC+yeH8X1ZhWL
	Lg8n6Dh3ELCfseN96J1hAHW4YBM2PC6Dhw7sapQHUB7Kr1dVrpElK+1/2RPTjUXkxiGNXpmUzd8
	902GVDJVzNvUxp3MeqWGtItKSGdfjJ6AAlojweTdtlCT7YrkZiytsQWHfycORisrxtkc/9D2hER
	8Mhl8GZMWr42y39C+i/ZOlWlK6/pX1cFyRzuvgYFf0BXSKGiwirmeOOlES9IIw0AWWrS217tcOu
	KSKIJ6LWRGJTf+3PhQSDlN3z4GkQTbQPr3sQ5xxKixcemr/9hxkBOn/BIe5KdT8W4PSmErZAuem
	IqgcpiR87x3VHtAIU8JQfuQmzk3gyg4rxc48hVDswtVMN
X-Received: by 2002:a05:6402:5024:b0:6b3:e575:f4da with SMTP id 4fb4d7f45d1cf-6b442a81523mr6769954a12.4.1792955025764;
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45e167f4esm1231230a12.2.2026.10.25.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing "iommus" phandle
Date: Sun, 25 Oct 2026 21:03:40 +0200
Message-ID: <20261025190340.449613-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
of_parse_phandle_with_fixed_args() to parse the "iommus" property and
extract the stream ID from args.args[0], but never release the reference
acquired on args.np.

Call of_node_put(args.np) after reading args.args[0] in all three probe
functions.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6usb.c     | 4 +++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a0..49bd0582d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1030,10 +1030,12 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4f09fdd40..f09856ee4 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1309,10 +1309,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c..5888bc41a 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -382,8 +382,10 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
 	}
 
 	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (!ret)
+	if (!ret) {
 		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
+		of_node_put(args.np);
+	}
 
 	ret = devm_mutex_init(dev, &data->mutex);
 	if (ret < 0)
-- 
2.56.0

