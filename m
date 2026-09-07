Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BA517BC6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804630; cv=none; b=bIS6hyj9uDiqiinxCzNvlqKxiBWuV+RDHjwtvV1lPqW81IGmJxGINlK4ACqF2fzmhIVOd19MqGOeskNDxHPK3hvAiuWKb7ZQodOsBwD0tzrmnUrgMWm4PQ4IdOeRnvDqAbms21CGxyDAsjlpNQDmWyZT13qRqee1JZ1+pct6LVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804630; c=relaxed/simple;
	bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNkulzmmHpW3NxYFGNEuNcTVc8LipOcSpIvGmTZplH2NVEK86XoGP/DsA86upNb5xaTKtMFbtRkgNlkjFyFSANQs31lgrah50nXrgH26Pw1l5/w1QnUEmYXWfHwbqE1D05rXXOkHVisS/5Qc49CrefoAkdz4iXT9TodE/ontRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q64BUtBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzRrZ1tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q64BUtBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzRrZ1tg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H871T4183553
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=; b=Q64BUtBxTRFwPL8P
	plsoZg2S515PfXEVHzJVpgHJsCXxE7Q1miZRG2CdcDvPYbsSQD4PLLFTjI93KcMz
	4ROHwm3fzRHqCkkT2xbHuIj4fpxizv1TCEXOi5zRq1pNN3drVYcvsOqYPrgN6o8y
	4904kfTO0yNPDpNyb9t8Xz8TU/UfQ9j626I3tfVXzL3cuygXIGaDf26jwtTEX8fW
	bicRzUi/6i3YlEQqPdCq1eN/tlbhJSE2AzNhIjBwXiN1FjuFWx93RyN4+n71Ok1B
	H3oXCEQy56fK3p01oKoJ4gjAbpf4h6xMnqRjpQMD2rC0a6vkXZvoT9zluQju/4CF
	uXcNtg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx1xjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:10:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4712483a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804628; x=1789409428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=CzRrZ1tgVG8VZbg0Rt6nyuNzFeLqkg56ZVHTr7Ck1Y44XwAU14TK31xQsbviFjvQ3q
         dGEWx02sDmYkLntgqxLsAoYnf36y0hB4aivO5MSUNqQmWj0W/7ZCbEhyCQReBvNYH0Bv
         TxzZJ+GOY1vEJxYREabMWT66SFjWtQZ+bXc2jHNpzwIE9RG3WVSpcMEIgSomUFoNRKXS
         Ap1qyVJwYvA7+VAhU3+3S6LoiTDeqDgk0jTtGrOQ/NOP2rd9iK8tCApTPljPHnJWeHZ9
         qn7J0BeJNHatwl+2UQNDxlFaU2X3HQjRP0qA50uTK3r7Xt7fvobtcz1Fc2JgV7oRJQt1
         aUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804628; x=1789409428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=MQHtevfmQpfwSqx7l3NCgExLvT8yFKIV4Zw3Q18jZ8xKuUNY27ebp2T+lVozUXYvmM
         CN69QcAZTh1Hdg9fzdcOuZrMyJZM9jr4HWcR1o24wb634k+S1wJP6t9E0uYA+2i3KBAk
         2pWjp9CtzI2FvwPyiLeoLxOK/5QpbAQ6A0BfEuPYO659wXBI67HNwF0EbHp6sxjANqO6
         Tr2lyslOZmAnwpzjPK6/W/vRfPUF223XVq172ka9ctQyIc+4YmPikC2xMwIG/VXZfBJA
         jQlnbvsPIFsXwtoK25VanhBZF/LTgBjauWGLQuDTB6s3PqMcdC9To0ptSXln/pSLbfX/
         XvGw==
X-Forwarded-Encrypted: i=1; AKwUvBzRlSFu/sv6QsIyhjzF8KErPlNc+sWlm5p9ZszcXXGVNkyZFgkXxM6YCchGOLp5aiQjrM36+T5JFo4Xt8w=@vger.kernel.org
X-Gm-Message-State: AFuF++kIHqbn9i9EeY+uE3ezJkfHZnnttdP0LbN338c9a8+rh5o6QHxN
	z59heBRO6CYtH2KMKIq15IqXvJUGXc4DSrcQwD1ZdGgscTKLs+X42YEIDvyChSBro0+qzEyntts
	RTQNxZb54E437+zzAH8l8/F7+tR/ncBW8KSyFrHueWLEdh7vopEGZxKpNdC6r8/jfiZg=
X-Gm-Gg: AYBFou3bDT0rZrYh7r7wzjltK0IWH9EV1vatX6KI2EuB09vQwDlL6XG4OYS4P+3CVhA
	PE4Ru6bDkP82Ceg5z0tOgeFgrZCxSsbNuKhIo3UYOYI7EudPpfU8ulJW4AWsw6LEzC768p6ArQZ
	Rw4F9dcmCYjLkOe36mZN0crVe3a5worNp0K94GDWu9cBQj/c+0EpxpVojwIy/v5FIr1MpHfpi8t
	VkIsV00BUt2BYw2Tge1Oz/8PhzlyHjXg+pkBc4G6dOokVc9fi1B+K/rHLlDKTF3M1ErcPdu/X1k
	ibl81197QEZn6JDKrq/EomSiPOVjH4r5cwJlfnPxD3dDXHBeLNxYw5LKnu4iKZC4Fg3D655ml1p
	OljyXURbs1L5eWeLTezj1fj3aZ/vwYUsFvsMZ
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307964637.12.1788804628236;
        Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307902637.12.1788804627806;
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:44 +0530
Subject: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=2155;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
 b=tXG6U5aLLaHjGg1mY3KIPnmf1ncikfJ7KkwbNwcX5EkVTX9x8A/tFB1OgeDoA9wlPWRIgmICk
 EyqlVwHN3DyB7vFzQFWXBWRqx6mtRYhgi2Ytm/Lv2QERLaGNKQX+Rxe
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9efe14 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cGfOUKfoVt3f02dCv40A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: LEIgy1YPLZSAlJ4dAqgc3aqFIUvjwLBX
X-Proofpoint-ORIG-GUID: LEIgy1YPLZSAlJ4dAqgc3aqFIUvjwLBX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX1AM7+CZ8/IsW
 nRQUDbAgziCVwal+UksuL5rzRtv+f04pb02M3oEgqjqargx6R5RTmQrHE9tLpBzpqLI4xgjDTMf
 fjEdTSPtbJ5DWSHvJU06wuXarrWFpX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX9CLroM78m8G5
 UIPLXmArlerev8ci6O+j7Dcm/sxItMVapkurR5v9OuW5hNKxXD9aAEaHlEqcOAC0FtI59S+Y2gR
 E6vrz5eA59UHZrnLnbJwIpGWj8bi0mcnuYdRaT++lO0iAIxXIpcvIJ6JUzpkQ7zgVGBml10QKxh
 n1FiVVFYN3bEz+gfTKy+2ygsrDkhDd8atuHbk2Em/L8pI1iRPXHKaNKWQ584C4Zv1d7NeZPqgC4
 kO6F+OGRlmPA0CwWrwAyKLjyUBp12cZfkqnmexCVOSOTLbqEeu7Jka2nqarnARf87QtaGUq9Bie
 RoHbWsSkfy/BDd61P9LIWolOxftl+ztwGAzMFJJjkU1Oj6BiwwcuVf42/V2uOI3wyLr/qQCbZO6
 HniyvGKub3QNtgetwTv6TqzeoGVmC+Gys7FxdOtfVNLevnOTbjsktk5/AW8aRkRNzmSAQkk0TGJ
 EtTW6vyZ96UwCAyVJkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

The PCM1681 DAC requires the SCK (system clock) input to be
present for proper device operation. On platforms where SCK
is provided by a controllable clock source, register accesses
over I2C may fail when the clock is not enabled.

Add optional clock support to the PCM1681 driver by acquiring
the "sck" clock, enabling it during probe, and registering a
managed cleanup action to disable it during device removal or
probe failure.

This allows platforms to model the PCM1681 system clock through
the common clock framework and ensures the device is operational
before regmap initialization and register accesses occur.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 60fdbe5c4e05..cfe549176d14 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -74,6 +75,7 @@ struct pcm1681_private {
 	unsigned int deemph;
 	/* Current rate for deemphasis control */
 	unsigned int rate;
+	struct clk *sclk;
 };
 
 static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
@@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
+	if (IS_ERR(priv->sclk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
+				     "Failed to get sck\n");
+
+	ret = clk_prepare_enable(priv->sclk);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable sck\n");
+
+	ret = devm_add_action_or_reset(&client->dev,
+				       (void (*)(void *))clk_disable_unprepare,
+				       priv->sclk);
+	if (ret)
+		return ret;
+
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);

-- 
2.34.1

