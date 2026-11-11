Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435691;
	b=vGlzz8qYtve5zsRolCPCDgEMOcinNsW4YJRrdFjlbLzpXDSXvmxV2GYSSH35/qXkb208
	 NIQEDHuHIqKuI78ul0eOAgVXaodUt2gFxBOqb5Q1v4mu0jO0fdQzFH2c+BSfriPYoJE1x
	 nVxMA29UfGUR1gxOpQys45Y4Tw3GS5hR/YRol4rkO09aSdHkt5s9baZQHqoH2eBtgIxTZ
	 hIf3WyLEqTP/W5JSvGy7WGW3au9hCyGAMEplIB4zdiCee08as+YPfT7Z2itSWTUXbP7Nt
	 l703KH1bCgzfM6c4JVRnVLnqM1a5nRHJZaSA0MoI8+OTHaMaVQA7k6IxJzm6GSAHGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
	b=NCTeyE04Dnq4TFrTCBP+AAgf5Efxe3e9c8nUA81MZx3dIlWzv6FPkYKO3DI9pIgHgXUX
	 UM2TcgjGmGUk3BeQdORDkL1VrnYyyxTq6PPG5eTDKUvQyejHn1l0Xwu8RKg/ix9XVtpEd
	 elQIYog+HQ0zz6RSagR2xBQkd+CRi31kibgdkQNUhe8T9jUWwAVsPtDhMDkUX7XcctX7x
	 5MmYl4X4ROZdqGoH3mEIfZN8hUVsk7gTXwICFTGq0lW0lQ/Yo+ghCVo/P3/Kj8Ed4otMO
	 4Qvoc6+JtRZMswIZc6moOIpaF1WE1bQKTwPBha9JXrtOlhvz/XuPaPa+TBEDHn9fSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAhkWesh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855AB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAhkWesh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3422535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435690; x=1795040490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
        b=GAhkWeshmXeULO0RrMSF/TEbMI1rd1Dbu9ohLHmmwmxzRDiTMT2sMZNOQ0a/2G4tSa
         H43L05tjDvA1Bxxt1FR0x7e35oZYwRvJ1bPbenazsGlsk6ItPwLVNWaA8oLMlpAkjEMS
         N1eitSPCAEted5vZEUqrFL1vZplEM9l6Qz1nDytE6InIAI6DDiR7kdkNiqHS3v5905vR
         Aj2onbDH/JimL5zPsjwpBGJkuAdihvFqTbdkbnw57v9zXPy5MYzjSmc9abLm6CNH+Ri5
         ol5v1SfAiMPfJRhlzhf4IPiRSgTD4nrdqYu0lLd92MoaB+d6cjc14Q7V5WsmiC9hHrTP
         qOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435690; x=1795040490;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
        b=Wbkh1pODrRmuTDMTNWKbOqzEkg46g4TGI8QYrzxZq3klJFQDajKpfDWsQbrmRsmP+7
         zxhiSSlWCNd64jaSzXhNAqsr/RZovchACDoU2TH5YzUTdTQP3oE46mpfBt8g3aiccMJl
         8U25GA/LIFh+daOqgdVMb5OKVsVkE7ucVsCtuUQNHpX3rDyuuiAzao5J/NZ186xZ2KEi
         fg9TK7NEabmE6BAa56yBVWr0tzjAbJeg1bJBg5teC9KaB9IyAtlRtUallY4n+k34Knpj
         QKo15NwX9w3sAin8mGoEx4rWzorCk5U6RRap9w1tUjVpPLV8usYAr2V7ch8OaZ7y329+
         ztcA==
X-Forwarded-Encrypted: i=1; AL+hErEIt61cO6sDeWOFulEk24LgZtjIHHqkvJX3vCEcit5JH452y31PV5OwoNZqShn69RngOTbRjRyvOrubPWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/od7HkaRVg577zhHT7cTZFfvtJm4bcsguUF2YhxtDzjPraAQsY
	vS6GnxsPNVMdaG4KIBDGaLrAHxJ84j//nhh006uIWDyEAn/NBQSxkZkp
X-Gm-Gg: AYBFou1z66YC3veWk0MgaoJ5cbEMEbVhQSksdX1PbVpE+qRc97e7F5iYhuJfGx6IPPm
	mDCfYMEuAaU7FjNxerqqyXQxI8YeAV/RTJ2nGwmofc02YH8xUPX5kAPl4T4xXeFh7quvbZbpdVA
	M+2b3887Xxy8o3Wb1H91BWy/UvNBlgc/FnL5fs8wKrh6ipfTL/tBX1vPfa6D6fdtaGgAEq+pxXN
	8eJGNdFjndYT5jrS9WjMctRdCzEHTbaoP/k6HQdI53sW2fpfSfNhG2r3qwb1Thtb12qU9SNDE+o
	dG4e0kwl3biktfu0xdp9qZgE21WFYH1uaGOYhBpHtFIhjDucr0HMSzC1GmSyHyh9tSdvCr4/lFq
	y5uur7cW1ZF/jUPwhRb1q+FaRBLtQsXtMJGaLCwX+hCqDyVe6mZlTyOqvM8lCyimy0oM0wsSJ47
	LvhUBk75zTHK1DxlRQ6DQWkkx7tC+AIvLyideFta0KsYYuE+dIHBqj6mq0cXB1BTp7qEi058/Np
	JBH3P45lChYDWzZYwoNj5sX/dsnS/D1nr+DdLaTLfPIfYAyp2W1Upksh/lmFYrtGFjVLIVAh8nP
	8mVQKqaE/L1tQqqGqRB/5HIfktM5d5EPwAwWvwe8X/h1xRlw
X-Received: by 2002:a05:600c:c0cf:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb4e283f7dmr11079755e9.9.1794435689714;
        Wed, 11 Nov 2026 14:21:29 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm78893405e9.1.2026.11.11.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:21:27 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] power: supply: Kconfig: Fix two spelling mistakes
Date: Wed, 11 Nov 2026 22:21:24 +0000
Message-ID: <20261111222124.1035303-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes in the Kconfig text, fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/power/supply/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 16d0a38b41b7..1ab617326791 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -246,7 +246,7 @@ config BATTERY_S2MU005
 	select REGMAP_I2C
 	help
 	  Say Y to enable support for the Samsung S2MU005 PMIC integrated
-	  fuel gauge, which works indepenently of the PMIC battery charger
+	  fuel gauge, which works independently of the PMIC battery charger
 	  counterpart, and reports battery metrics.
 
 	  This driver, if built as a module, will be called s2mu005-fuel-gauge.
@@ -463,7 +463,7 @@ config BATTERY_MAX17042
 	  MAX17042 is fuel-gauge systems for lithium-ion (Li+) batteries
 	  in handheld and portable equipment. The MAX17042 is configured
 	  to operate with a single lithium cell. MAX8997 and MAX8966 are
-	  multi-function devices that include fuel gauages that are compatible
+	  multi-function devices that include fuel gauges that are compatible
 	  with MAX17042.
 	  Supported devices: max8966, max8997, max17042, max17047, max17050,
 	  max17055, max77693, max77849.
-- 
2.55.0

