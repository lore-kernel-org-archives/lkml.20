Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937636;
	b=DrJs96rZEVgzUdVVfqTJdIOT6WTF5of03W8pnUuPaA6Uxu2qpjve4Pf5rBRSTi5fLdQU
	 hWVfDqTo7Saj59/X7vwgkUwWN8dmLZbloeRO+skf25U8UFmWdInVmpOSj2JVECmHgekb7
	 nlU00xKBEG9piFX+gfEhN38e+xrIeRO1uotQhNssD0Og1lmiZ3Vcy1c69YwplQW1cotxB
	 rkzf2bKs7AcU5H5OKoE8THKGQNcrXiUeAw234TEtjrQSfHZBIby1OgDTwJqCDba5RxwR6
	 Q9MiC0uTOmOaKbLMyjj2Wuds+xJO1coPf1sIM74gr0E5k5FPiQo9htDLE+5P2XH2Usg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JCcriedaG9Q2J0hr5lnlt3xuWfc+MNZlG5G08p5ypto=;
	b=RaopCuSWUlFKC93tDHyhFFDSvDQ99nO/dvvfErxSaOMFEf6Z0+eknT0lbvzfikkfMuUN
	 7gddf9Q3i8Obdjuob0UsQ+3dipby659PkNwG3uve090uUviSq0S2hu3Hz3Nvd32Mtd0SN
	 MaWPW4x7A2o2/SRbbM6OX3I7EsYNOEYER5q+kbIAMETZ5bX+rUuNWUSSYX+sH11tTpQXv
	 CjIxyZhDd7KIOYv9Qsi2P5pQYD3LXRQPA+5PpU78WrowGzLPYP504M4TxBU/hgVlPR9pW
	 m0uUtSE4gvsCDV3Fyrn42rwwfJrQI4rk+VqZ+VGWUcL1dWgtxV/LoKs7QGcURMw1NPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qIpEXc9T;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A25606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A25606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qIpEXc9T
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1727695a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937635; x=1793542435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCcriedaG9Q2J0hr5lnlt3xuWfc+MNZlG5G08p5ypto=;
        b=qIpEXc9TDiXymyFtrf93QEMwbHa0MLXw+nOWWTYZwDMbGl4gHheJBoomqYOghmDnZA
         wlDoPpeB1SNvFjn8cZP3oFaSntUKmfOkYy/NGnS+1ux1n9xyB7iUSrzhDyHxmeuuMgcy
         ZG+5uK8WBcXaOuXrYL+J1ENAE0RTI8AMEMFcYWhcmJhA2iADoedu8r54JwWVHcFCvrbJ
         21RYvHP6m7Qk1xxY9HIF/dK8vyUehiUJ2Qe3zkDqQdxILYZtUH36rnRxAtQB/AL3lQuF
         lKmWKnHUWueJxVBYstbmRq4+vRoI88ZtXALBtLcYy9KFxdvo8gHa372FgDaJyJjFl11D
         Fpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937635; x=1793542435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCcriedaG9Q2J0hr5lnlt3xuWfc+MNZlG5G08p5ypto=;
        b=IlPotYEi7ZiZcZizARkJtUiDLAMhB+6NrG5Ui4dJe2zhRMU54b58CxoObjkNqLzr43
         1hOWpONm0Gbk3mtFJCkH6IrgZFlLfQeH+mEavpf1AUuPcOR2PqT/6wrHcT0HFN9skhs5
         cSYt4AE2Oel348EWJKnuQXnh0Zhi4UO+SoBchamee5/hE2+nTjcA199h/IdbRIrSM3JY
         cl/UzRip5yjViJO+DFqsVGdUEZE6Scl91jWmYrBuNzy5yDFyomqAFqQ/w7aY5xadQvNF
         FxXjODFMCB4FETcE04Hzl2B+USBFX829vUS8pZdIAILuVa8YcIux0nSHGRmWcgbSzRgZ
         BDmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ANU9kXBhMiGQjncjPTfYuL8XXZxw01Xhb56Cw69x+sXUAHFzRojGanukEPgvo/2pccIjO0AoixdSOcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy9e2P7SnpHXDYIR27ZX9jT956pIeUEUFKE90Qild+DjxkaEzy
	ME94qt8Nwu8daBHI1fPe8dR8AEoKoM4RHEl/HEsbhCgSw51IPrZYUeGX
X-Gm-Gg: AYBFou0IfHUxkvyjS2vKbKCEquZEuzUKYTyRe7eeUh73w2A5ZuMlbXyStSq9vh2500W
	qIa8PVFdokzegaLEo2rE4UvUoq8IuN7HkNm5cjv08l9Q7Dad5QHXw0uLGbYHdb571xdH+u+jWl0
	1rRJbBZ8ekW9zKK8ppA+oOJU/oh7qpEnLmWe7sjEapBojpjSoLrYQ4mKgWQTM+LuhXeMk1NI+4N
	r1GvrXeRzaNL+WoC2DGTGSxmWmJ41Hars42cy3Zotdcw3pSCHzNBMjDifgbNcFU2LkssVbdIvzJ
	rXAGUb3ucmp0ZqGCWHTbb2MsHYfImC1PyqEN9a+b1RZE2X0f/bAf6ubg7MEbOp7XU8zUsrVq34T
	hC2KbVPEWNFaezBsAZ87/NrBTPtif6wxNa2fqImky9hbdqzQ9l/dGjnsiY9ZO9kDTIBLkBmgfVk
	d4ojAJJHqa+3H5l96ajDACPX9aRg78zfTILobSONQC+vL9D0rNrs/Yd/WOsUeH11ClrT9v5D8km
	Ewnt4iF60NCqchIGLg7C6y6XRz/j7KQLnqfA+30t666WgxJiLuEVojZykXIHgsyB5PkEyfL
X-Received: by 2002:a17:90b:1c88:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3ade9b2f1dfmr3782956a91.6.1792937635105;
        Sun, 25 Oct 2026 07:13:55 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebae7f3csm4086746a91.3.2026.10.25.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:13:54 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH] iio: dac: mcp4725: Update the cached DAC value only on success
Date: Sun, 25 Oct 2026 23:13:51 +0900
Message-ID: <20261025141351.33554-1-pocj8ur4in@gmail.com>
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
Content-Transfer-Encoding: 8bit

mcp4725_write_raw() updates dac_value even if mcp4725_set_value() rejects
the requested value or reports an I2C transfer error. After writing 1000,
a rejected write of 4096 returns -EINVAL without an I2C transfer, but
out_voltage0_raw reports 4096. A later powerdown exit sends 00 00 instead
of the 03 e8 frame for the last successful value. The EEPROM store path
uses the same cache.

Return the setter error before updating dac_value. This keeps the last
successful software value for readback, powerdown exit and EEPROM writes.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested on ARM64 QEMU/KVM with emulated I2C peers through the MCP4725
and MCP4726 sysfs paths. After setting 1000, a rejected write of 4096
returned -EINVAL without a transfer. The baseline readback changed to
4096 and powerdown exit sent 00 00; the patch kept 1000 and sent 03 e8.
All 202 assertions passed with the patch; 40 failed on the baseline.
No physical DAC or persistent EEPROM was tested.

 drivers/iio/dac/mcp4725.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
index 3fa7acc69aeb..94d51af83042 100644
--- a/drivers/iio/dac/mcp4725.c
+++ b/drivers/iio/dac/mcp4725.c
@@ -356,6 +356,8 @@ static int mcp4725_write_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		ret = mcp4725_set_value(indio_dev, val);
+		if (ret)
+			return ret;
 		data->dac_value = val;
 		break;
 	default:
-- 
2.55.0

