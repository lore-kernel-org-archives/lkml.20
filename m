Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231AE3815D8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804618; cv=none; b=gfl8+0zcAgora9pfyCrCm1o2K3fbrNH8j5Ikd3hMBd5ileG84jSzLPhjbqiXgXfXzd1M6DB5wsCB7CfU4axyezJqyDz+LQwvLf7fV7eKe5GRhErDzyxCx/nH3j3MOu3s0Mt1YbgXnuLyfgxMdHEJOuSD6B6aFd70p9+2hx42B/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804618; c=relaxed/simple;
	bh=q33W/QIDPpcW82+RedjgZuMTbU78MNYup83VXf3u2Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUHbgyYRBU3qnP5oKiNdzo0eFKIE0hpriWN1c2jlootI8893SSjFNFczGMEWjjm5IjC9Gh1NqVStVCPSq9WnmBR+7GIlrr9mHodxtDS4mVFuG23R5gqhqzOZIatcBV8e859TRYy3280u2M1YsxdclnljrSrJ6N/nUbghLT+lfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX2cfBR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxMjbUx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX2cfBR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxMjbUx5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7mWs4015814
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 18:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=; b=RX2cfBR+It7mDI3e
	cJi0k7BbqZOSdOzU1WT6/KtLLmblGVyNqCyUoLrK9V5YM4qHY5TTF5m7Fh3wvN8K
	V+BFTkDLUI4Xu71ukcphqqodf42ZDMuXV8vpIG/UlDAdcW6Yz/NDO8xb1Oxrlten
	lXZVAjYXXCce8YsSWzTFvX7H/0eIqyLCqmlbXc4zYVsycBeuvQvLc00EnArtQZRq
	1b28n7JruznwSW8zDLivMxRaET6Jo471G3UaSj1jsNMg8y3iPPTQ4OwwowiBtAwq
	3j7AkaTIF/D69xIsvJN2pWz3/k93Kd67PH9zlK7Y5e4R4xS6p22VdX50bZvFg9Xg
	vBk3tA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw224qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:10:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso26659115ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804615; x=1789409415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=;
        b=YxMjbUx5bpzt/tDURFqZF4QXdAHeXGHo8xvGnCnsEKveTfOFm48twkpHQqssvpISiB
         NRidziDDhKbvBXGJh1qHs+ZNmnfcOrPZkl933HPmB9eAPS2MAyC+prkQopgLVF30yM3a
         VR3PUui/40THab2nEQbviiXQVVrt6eZo+OCG3/2Q1GX61zTJRRvuwLcbXgig5WFoR1Kd
         RAN+NAvZ4sYB6aiUVZOfzSCBByLoS29S7d/3stejHROYhm8ImzaKPnrrG65ij+fB/3ZS
         MvV6jxR9tDSi62KgKWkfZf66TNEFgpvQqkiZ7r2bGmy6qcMWac9EbusRIcnRE/p9BTgP
         xiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804615; x=1789409415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=;
        b=UXAAmH4aP4gw/ty/BT9YC1pNjxnoyXRZmDG90upmCvoCw4dar85g88dFQ81cxQMW/A
         8MNg5RaB1reF2fjFRmoKJuvGrBUBB8qMNeCUNcsThWuq2byyn3/pa1LECXzOWhs+G9Le
         JCyT53Z0de9PLr5OHSrknVrZWHew4fYbUuYGcbVT2zNn6bFE80THiej8oVTvIIg4UeoA
         7blRs4ekkOBBJp3/SBcmjkZdmh19Zh4q4kBKL4eErqkkgHDA29upyKDZHxk3EfZ/WBeW
         7c/xtklmIC7Cii23xsq0OMcO2w6AOsWVZfVaPYCwRUuAhyTM53Hvboit/RQw2z74w+f2
         BcPg==
X-Forwarded-Encrypted: i=1; AKwUvBzlYwPJXuoTzh8hfOMhDIo7h7h9wPt1bBFmzN6nuus/BovpEYx5YEUlQrpUfqYAMJlT2lIV7BOe2x5nyII=@vger.kernel.org
X-Gm-Message-State: AFuF++kD6Xg4ZC48bnGNe+AkltU/tyhkWhNJLR1LkQleHwP3tLWMQ1FI
	a2qj7cqIddX7sv1xrlLXobfImIIZmY9gKaseV4l6+wjoNeZDkGuA51m6OqIzeITSH9N3kH/53rO
	WB9KSTTt956w+76JpqIRxhrUtoSqcjifo5g/ZX6gY9SESMl1/Mk31NfVQVJ1Gd7RmyAk=
X-Gm-Gg: AYBFou0Lo0WhPd0biiRCGrSoc8ar12duIfIpNHAiCGTZFD/cTMcdxDK3TFOMW4OMNES
	ElzdjN6/PmW9yyjXMhrB33pigLAoBYXxBEWF8nPpKBKnWa27C2P4HAZW02mYLJv/TA6iLmSvScX
	lwnxyNvnBym3x5sRDqH4/ijJAmGzvdY1kbiQa9Gzi9A/U+A5g9OoewD7VrT+FB987p0EuVaxm5F
	LyPjbUN+iBYkfHBUpMxEvMB/C/z2w3eMc1UGNt/A5S2m4KYqp7f6ASyYBn38SaOecKGPdAfd6Dc
	1GjsRK3gmSUzQ9NqiAQ9YxG2Mzavlj/Fml/U6DPwkh7Tkuh4L79P1WzvsxYV902aDt31cDnMZxj
	W/BZb2xpcjMV02+rXY58uFNEnul1NJIGFOYmQ
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr38847059637.26.1788804615533;
        Mon, 07 Sep 2026 11:10:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr38846995637.26.1788804615145;
        Mon, 07 Sep 2026 11:10:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:42 +0530
Subject: [PATCH v1 1/5] ASoC: codec: adau1977-i2c: Add OF device match
 table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=1998;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=q33W/QIDPpcW82+RedjgZuMTbU78MNYup83VXf3u2Nc=;
 b=+oTay6szKtCGRPYNGXq+QRWc9G6dMEKlRiXIi/7vD/iIHtIbXC3XPHSE+THx8VXYbrf2oUbrc
 SpahW07x3hoBXpP/4jUw0+ULERBAuEo41EJBGn2dj0NR0C77zcBSXxn
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: zvUcBVwu-_wobNQfa4emh8njvgaXUfrB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXzTxjG7V6furd
 OLbSxUFLSVHEOKLiwiHcDqDwPPUiq2aWg4IML+F+C1+h5i80LB/vL856LbliW8BCMjmaMxKjb5p
 +83jcuoulePluKi3QO7JlWZre3nL9bA=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9efe08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RY5VwJC9HJP-BV025wMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX1r0/jyJ+krDe
 uU34pAmaqwEb3uOzHa+OEQARETTlLmUp/+I35hahmKRgXGKgeir1oTxG2kIbJdihTisIWq88YFN
 7me91Uw3c0jecAsyXtQAQ4X6CNN6H+fJFLStFPbKzWN/5u38moSAyiIpeET7xDHxdZ/vnaWscZK
 gN7dX+jGXIjA9f0WoGgsxGFT3TxTGI3GrQ6NHRqdEN9wnimjutKrKLUciiscHQZJdqTa8WFXsfx
 254oBi+TyZrNV7FUJGg4QIkhVdevi6Utj+4nB37577d3Wl4eN3rSntEWWWJAbDTcDwT5Hv9b7vw
 h3tRv7SFsOxbLawz7xnVJo2dz0AOHCjR4LoaJbmPasUSetsnxYkyAafYaWQllEuUOQodKq401+I
 SrM+Jz2/tALei4SGfD+rY6FMw3nkfGpBqDCiFMC4mTSC2xGc+NM8xKlm9aMnI9GtixlOz95u8rd
 y/J19w2Hau6lLWZGs5A==
X-Proofpoint-GUID: zvUcBVwu-_wobNQfa4emh8njvgaXUfrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

The ADAU1977 I2C driver lacks an OF device match table, preventing
it from binding to codec instances described via Device Tree. Systems
using compatible strings such as "adi,adau1977", "adi,adau1978", or
"adi,adau1979" fail to probe the driver as a result.

Add a descriptive prompt string for SND_SOC_ADAU1977_I2C/SPI so
the driver is visible and selectable when running menuconfig.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig        | 4 ++--
 sound/soc/codecs/adau1977-i2c.c | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d3730c4da51b..6f481a54313f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -526,13 +526,13 @@ config SND_SOC_ADAU1977
 	tristate
 
 config SND_SOC_ADAU1977_SPI
-	tristate
+	tristate "Analog Devices ADAU1977 CODEC - SPI"
 	depends on SPI_MASTER
 	select SND_SOC_ADAU1977
 	select REGMAP_SPI
 
 config SND_SOC_ADAU1977_I2C
-	tristate
+	tristate "Analog Devices ADAU1977 CODEC - I2C"
 	depends on I2C
 	select SND_SOC_ADAU1977
 	select REGMAP_I2C
diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-i2c.c
index d1c6c4ddf506..9f54fa8375b1 100644
--- a/sound/soc/codecs/adau1977-i2c.c
+++ b/sound/soc/codecs/adau1977-i2c.c
@@ -34,9 +34,18 @@ static const struct i2c_device_id adau1977_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
 
+static const struct of_device_id adau1977_i2c_of_match[] __maybe_unused = {
+	{ .compatible = "adi,adau1977" },
+	{ .compatible = "adi,adau1978" },
+	{ .compatible = "adi,adau1979" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adau1977_i2c_of_match);
+
 static struct i2c_driver adau1977_i2c_driver = {
 	.driver = {
 		.name = "adau1977",
+		.of_match_table = of_match_ptr(adau1977_i2c_of_match),
 	},
 	.probe = adau1977_i2c_probe,
 	.id_table = adau1977_i2c_ids,

-- 
2.34.1

