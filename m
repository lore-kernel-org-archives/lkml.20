Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451280;
	b=gVYZHtZJAqJkFTPqZF0hGDbaX+R12SMAeKRFXZbIrSMMB8RN6slUwZ7f717GBMOF/ohq
	 30EBasV2dGR0G3r2vaO2B2KKOTZqoZCcugdlg6iZfNqVv+cdydN7ojG/2//Kk4+29ML5O
	 mylaOLg37yoBQCN4jVotaaCjlJzjrby04tPVwcdAvaXv2Q6LrZmzBdotvat5WrxHkG+qK
	 T/GF/f7mOW7YGiLD0cEynzShBZgeLJeR3H9oPWvCOnxcns1NIiCyzXCUtQgYVPUSqiGjA
	 cdQnejzpu8f19bbZqr4S5QYiDLy/kVP/VUJBRP9RUY13ugnMeDRSAWDyXSCyvZ86bDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
	b=eeFmSx9ad/gjkJJKL9g7EvcxdUQtx/WMAuyEssDix+JFb1gHIqxZ21P+ybPwDTXmYu5V
	 L9xWhmupi6oQ0H8N7OnoZcSJ5smbZ6qXSIHOUZEUMuzrJ8r4BhEfcUjYjCrHG2lgi//Kq
	 58a1hpxyG/Jp+KpC+ViYz4cq+HI53/ttROWnJp/LqmaDYExjOTiAO5UbB7dozwFE0Durb
	 BrjCjI256jp/dfcQS16qyPjeABk1llFJ117u9yL7WQ8airVnwMkVZX9pajgNP3YFSGB1H
	 dFlRA36+BwMXsWYFDmjiCm19XL6aSUBYfYuIxIuTIVdvU/+/QKNaaEIkH/u+csgH/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqGf34y;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF15606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF15606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqGf34y
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso27633995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792451278; x=1793056078; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
        b=ZRqGf34y0L2eaTOSXNXcCgx4ey13Hi7lSgKxcZ0hiG25fHhTSQI1FthwlV2MaYeOb5
         glKUEdq7peqUf4MIHsxgmepWpSL62cxxCalMyUNXAIXpm4/OHELNEWv4/RcRn756OiSX
         3/LVXdjrH1J961z8ZMv2m4VX3z3u+a4HsRcUfXfRnu+wWiSYJMxwy+woiMmcYh/SDi68
         jZNeAy2zgEbYvvqax8+ubrDyE2idFkQRf79iV/w4mC9+K+sV+S7ers84/XK+ayYPU2FR
         QEerbhnp9XwEwm4uolQzzkFRik5aEi7Bk5lVrJo4s/XLChGWFWgoHMlUnu7Yv+aRxfb2
         +EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451278; x=1793056078;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
        b=LOBrBc/MbtawqvxOZTWpKO0KMJ6UcccCwKkfxuOzcS7NtxWEsF1rWZ776Qf8Q/uuJk
         tiMixTMCwDa/Exz7TTWIkIvSP+bGRhcXHg0crcULuUFxhGubSQXWf0tSx+2mnV94dLrp
         Or/zL9afIkWShjrc5aT0OxPgjJGP3pGIzUoR4ode7VMJJRbvhzHLovEMZdUdjGsZWCUn
         RT9SAxJuVRJ2MDVRuhecoxpdMYDjQ0CBcZk31w0a/A94lrdnC92eZpYY4wPJ2ijNGzR2
         31npgzcHz6KoX9xG1Pcz7Dqr05Vsg4yKji7Eq5TQ2F4OR7xxNq6uskc83hMPfI7rVs8+
         ympg==
X-Forwarded-Encrypted: i=1; AKwUvBwQCP1adk5s8m1VMOXZ+0HPh9FYcBweQEBQ3zq5Yg0UrHyXEZxdbn29B+g7taVbSM+WyUvIT0yq6qfae4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVkGncLyorfdnBitNzZ2KXFK2JmChx77lv6Ni4T9UGNwHdkDyu
	K9OFf9N7t4Z/AX80f3056C/YOjocChaJrQj4ty4dBBgRPgpLukle1Fw8gOJqi+VN0RO5a2o38wK
	XRYK8huk=
X-Gm-Gg: AYBFou3amx+FoxEyRaVJGjU8C3NH+LuLogl2hE9EpZWFoHr14MJDUzDs2tjPwrWOzVv
	EExmcwcaZ0A1NT/aAK/rNEj0X3d1L8OLTNXObZVo1AmkwfGL4EBbhZ46m+ZXQ37Ztj2N0VbbApI
	bN1mZySVFwRfJw/fMAF6GktUK720KsLihRdPB15jlOkZfoNc6WdHVNDqIE4GW9bFot2C95zwJWp
	YZWJ/y0Q/9PKM6NGVjOuTLeNl9sSGc1Pl816XiKHWp+rztNE2ZhlIN6WzhMpfgKd8BxNmRAh/Nj
	aDuEjcdTHdrZPlJ+hh0SgFDg885ywWGGYCiGnCazkrWWx0dsKC5Q2z1v9xL9QT2jfM4RVWyebBa
	J5OUCdkFTdl2UAnPXzwfPcSsMfYqHrwnFC2B7LzuVtf76fIrVYoKQ19n9MhkZNnWAt927aqzKaH
	yd89F5ycF/ziuwJ2OxChl9DtQGp1pdUPKwCTjcNZ0KsK9yO7kNL0tjvnKNtihcWrTLKmbQQGPvP
	C2M0V8yPFMjj/05ES0S4hOwLPOuYxENvfnL0V59F9VnJ5bY2setw54jBwmn3Q==
X-Received: by 2002:a05:600c:5494:b0:4a1:e0e3:7fe0 with SMTP id 5b1f17b1804b1-4a1e0e3802emr144230465e9.12.1792451278361;
        Mon, 19 Oct 2026 16:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm4083445e9.1.2026.10.19.16.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:07:57 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 20 Oct 2026 00:07:54 +0100
Subject: [PATCH] thermal/drivers/samsung/acpm-tmu: fix platform_driver name
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
Message-Id: <20261020-acpm-thermal-drv-name-fix-v1-1-71f72280583b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMmi1moC/x2MSQqAMAwAvyI5G7AF16+Ih1ijBmyVVEQQ/27xO
 AMzD0RW4Qhd9oDyJVH2kMDkGbiVwsIoU2Kwha1MYVokd3g8V1ZPG056YSDPOMuNXLuG5tLVY2k
 h9Ydy0v+7H973AwXwlsNrAAAA
X-Change-ID: 20261019-acpm-thermal-drv-name-fix-e7c8af5c7b52
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3

The platform driver name is set to "gs-tmu", likely a leftover from
the downstream implementation. Update it to "acpm-tmu" to match the
module and driver file name.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..4b89a2cfaaea 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -637,7 +637,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
 
 static struct platform_driver acpm_tmu_driver = {
 	.driver = {
-		.name   = "gs-tmu",
+		.name   = "acpm-tmu",
 		.pm     = pm_ptr(&acpm_tmu_pm_ops),
 		.of_match_table = acpm_tmu_match,
 	},

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261019-acpm-thermal-drv-name-fix-e7c8af5c7b52

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

