Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804528;
	b=P/e0z9xWWHwMWkV9lZaKCVClsQe/zfxs0H4cKUQ1eEO4tFm+tsySWsz1AzS+YMBIr8wZ
	 +j2VduJzoQqjKPRemCVtW4G0TbEBV7yBLYqdH6/XOSyUEdCRSTiLPTq9eqcBNaFNpCr67
	 SdTPg8u9oYJiYVNgcc3AiDy9TpSvZ4evp6hfWFPgjXmpKCLnlDaeZE0qqtlW3bIBXbzge
	 xb7EhiiiXXj8GJSYTqr7S6tTaSU/qotiiYciEqYP1udi9h9uEy0MBtg3FCnEmYOV3qLiW
	 kitMA9OIbuxJIMY5ypTrkTG2fA7ZCJDN9hSyy/QWxocdAFz84HlCHhVNGYtdxHuWCrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
	b=YM/lltLZ/jLjOEfvvXQmxba18zon9KkmInVcLntYkGmE5EQP06tI8IMXmakWp7ED6B2z
	 CvlkkJ07dC1uIGKCwxySyXsA3g4qWhGz+tgvOlTUTaN5nYP69DNUuiHyMLAz6WT+QF2GI
	 2oowIr/CStXbTGbwa7wwk/Wkvbag8APonrVaHq9SGEOQG9fiUt4st+E9DWfEHOOB9jvdm
	 HlgAgD0KuxudeAaQjfj6tetFRfdOPOa8o2lXvYFPVWfma/aht1cmMYLB1DMgcjNn/MHMt
	 S9qp4zL0rC7ABX0z1kUHEU5UXkPqjpmMKU10X2Ay8y/bx40bis8PpQiRilboQyayDuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLrvMirh;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F38B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLrvMirh
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso1890455c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804527; x=1794409327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
        b=sLrvMirh2ecuW2S7MRadWh1VKld0W3L5ypNP/I+48lkDU7us20FkyWVOVzpbfAlPlW
         GeoJFyBQ4xaq2wAGSzYIBs9RCiGSuomNpcRpKlS0eUloAIeTZFCH2v96y3rpIiKBezHt
         /4B2ant3dT1pS51g2HCehn44IGAMaCeh5g0Q/MEI54G0BxTh0byVOpVSdRsAWcy3J97G
         KDnENarjgTWtqLkpnpgCWyhM/BB43Y1FeKCHYMo0GmIZs8hevWFokPeR1oMPOtyz0WXt
         Eg3xyDXT47kIkuGPOkUfG/36i0NMz63W1Wh3W3AmD2Kxi3QL/GZGbYrracB+yZp0pYMg
         WbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804527; x=1794409327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
        b=nN9TLOePQdDQ+KrHqXgtqdBo2gNqV4tPb51GunCTsYwxuEVNEKrJcm7AKIu67Nz8Kn
         Fz/5m1DJ/QbHUtMvSvG8kP/Y7yo2KuT5UcLlimcUjP57NbsQ7OuXUOqZgA82ymuBgrJa
         6taYsbaC+mooT//eEK0IbtBT+FaoAZmZrX1Pzaq+ty2KBW78bwY0FZTJ7b9SUUjJ7HSJ
         7kMEFKu3bmZJIExu8UD9VKqgrvydkDTm+zOIi6mu7N+DqLL0vdDdIIi0AVlCANKDfbld
         rwTKBO2QV+wEYSKiAMTYVD31Y2VEWc6mXDBHJOkP8Fxnmv3UVY8cXqzsRf9nrUedwey1
         +CkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn1HsCO+Ts8dCcIjQKG6b5SmNoD5ICxEhv/e1+j1Jop0GHfaQbjRkbr9AVHRraIbrLrzMFoBOCkmtkg60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CkS7pWfgXCPtGkVvvqksCxAOpSIrIkSRvOjHYd+CkZYJrFP0H
	2qCsCM8IK0SphW7uRjes97YOSCPoI35xg3HQ1QU233II4D7OKH/Nzhci
X-Gm-Gg: AYBFou0KNHgJpAHBdIJMEKO25D/mZe8v7N41BU62WurKJNBQ6VoVgkInuQei71cD9Rn
	KLtzQHTBIg0Y6iEkpEKQmKnalBNhsqTrgwtcYruwWk7dkiEAE/5TdSTV8fluPK5Vfb36akosX7w
	9bwPLfzO+VheQ33+tVFnZ89iFD6Qm1yF1Kz0mcBl5Kf8/WWyZ+xrtkYcXOuoxzluYjgX87Fqk/w
	XDLzTWzGrtXtfxpYvlj9srDUIy3sHHJbQaTM72/n/kODPFNVyOL3PoZeG/hrxANhyzMy2THO+zR
	GBum18uqsWzZkit01Px4fx49clmWd8d//6OThX8L7O3CBPQFJMjlmssPAlTeGg19wHPk8owUZ8n
	2KsY97z2uPsXLo10xCDhAyzbrXX47wwkf2NodFbvDg4AwMRS7zsQQUIwWEMSVbPhqIEtZlgpu0k
	cHoRub446Tj8bxN9EYIabkB6T2Bkpjq1ScsoJPSMuMftqsYfjQZ1Dg1/TBM1LuZe50jAo575SCy
	EH/wyWpCYUcty1UBeX8B/ErOuu+fgVGo/0FQ43VNUSmyGVadzQHth75fn/Nh5bGp8Ml/PMIFDC+
	bA9Y81hHcg3gwF3RP0VhKd4fFFKiXShZoWN1jgXkOeKH4/IG/hCf4dRR16zLEJ38TDYj+jNBdXJ
	oE4RQXMzsD0HzywnAPw3eGPrOaU0=
X-Received: by 2002:a05:7022:2582:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1aee0f52cf9mr24971896c88.28.1793804525902;
        Wed, 04 Nov 2026 07:02:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm8735094c88.1.2026.11.04.07.02.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:02:04 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: bo liu <bo.liu@senarytech.com>,
	"qianghua . wang" <qianghua.wang@senarytech.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] ASoC: sn624x: use dev_err_probe() for the regmap failure
Date: Wed,  4 Nov 2026 20:31:54 +0530
Message-ID: <20261104150155.33157-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

dev_err_probe() prints the symbolic errno and stays quiet on
 -EPROBE_DEFER. The sn624x prefix goes too, dev_err_probe() already prints the device name..

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index c9e690482..1a83f0a11 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -1736,11 +1736,9 @@ static int sn624x_sdca_sdw_probe(struct sdw_slave *slave,
 	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
 					      &sn624x_sdca_regmap,
 					      &sn624x_sdca_mbq_cfg);
-	if (IS_ERR(regmap)) {
-		dev_err(&slave->dev, "sn624x: devm_regmap_init_sdw_mbq_cfg failed (%ld)\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&slave->dev, PTR_ERR(regmap),
+				     "devm_regmap_init_sdw_mbq_cfg failed\n");
 
 	ret = sn624x_sdca_init(&slave->dev, regmap, slave);
 	if (ret < 0)
-- 
2.46.0

