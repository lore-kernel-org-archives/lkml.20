Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0B36998A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338950; cv=none; b=XIVPg3KU4VZCyEK9PnCyML2cR3jSMr1YhcTeorGwXNffw0QHayUWbVzjrcKExHuyTb2btTlF5wG9G2lYrLnA+PXVTNgWlOLAyqArmsewDB9D7lnUqa6JC9cwZyG0On2OAf7SwaBpMfjH4MQnMwFOFm71gYSPaZj9WHTPNYRkc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338950; c=relaxed/simple;
	bh=fk1sBYpSwMOddhw2TIfC9bxNmD1u6xITubSBHBjorro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCwcB3+dL2LeM0Ee1/F3/uINssyMZLEdIftkOD6o64HZ1KYDlT3zhh3X7X++nAgTY1LUaU2ctnAeyQXPEG8paFURdQJmCLqYZyTNK8p6Ie+2e50a/CnpCQ/DoNENAoMxQJI1gjuEhA23uGn//8fzZB0iypojkoBfGTP6bk6IVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTKAnEdM; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTKAnEdM"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309a20a55bso15842741cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338947; x=1789943747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=JTKAnEdM2zrVaiID1nNusOq6p+LmrdVnGlrsgUN/qjE4i9uKS+3bYtIr99bBtUUkya
         jqDjUpQLcrI6lnLTAuD0ponLFxjcZCzYlpNcSHylqXnI617SeUUuFRaB8lGqczQnWN8/
         OYHSNluTwvwVWhf0IACee0Fn0dtlnZ6eJs1cGW0CRe1VsjSEPcOkDVP1xeZJrctpksHT
         1zxaZyZs7hLSetGbeozhJjOIro793loMmVcWfk79Fz1dhGTdcof2vKfljQdeLJuAhm0g
         6Ok+oSZjfEBF/8YGw4fjUFYmZYrKvGklRzp2BOQ+TLJQ18a1LKe/ybA5ZDZ3cd9JG0ZH
         97xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338947; x=1789943747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=OT3RokfKSU5Ch0oRJuid+LUqonBiLrqWOhUP/5AgKyGX+3+62lEITwWP+DeylaHz/H
         7lSD5a3E+CQ/hEf2uGTeiwiwRop+8qEW87/g8Ikz5U+Gck5YVr3PDl76MHe7D3Bi5eZ8
         utig6UR0JuVBRLBmeCqyzHOKfTuk+z1TRzdMmjJoEUrvwPPbhjRUBW/b6GtGDn1In7bv
         1HexP9sN9EXhGwFp/Lb7n1RiBmQFCI+cWQUbrem3Olg+MYfsyrBu6s6lPAj+B1xkeit3
         r3UoAR5TrtRgJY9G9cBXhttYRoc8Yx/Dbh5P1Ddv/6D95iDOo89fqgxCHhQQNLuMNgjZ
         HhyA==
X-Forwarded-Encrypted: i=1; AKwUvBzwoPryFGGbiHB9IHs0Wu8d68Ry8EU6Lz07S+ULUzZXjfG2vlUsDOYo5uN/hWim9mNcRaV3Kk1WrExq4Kk=@vger.kernel.org
X-Gm-Message-State: AFuF++llJicJyffQfrwniu87F0+qPPtaftQz77GmSXhDXatxC/o9/H9v
	E1raTb4oUCM9Do5v30ZWCpJbrjL+G118xwLRmDua7JNKcKQKeO4MJYY=
X-Gm-Gg: AYBFou07na+Kg1joWjqgeejjru+oMhuXVO7Yw99juYdT8O1vCLuon8BpAPFLEthoexr
	cZBeeYgebb6cc9U815TFQs1TopZHK9aBLbkOiPEpf6svXHsRHMnRjJvR0wtBg+szhTZHEdU4L9c
	Z3+2G/x3WfsfrPjX7t44ObRgn5/TtoBlIrLORGJkWIPiLTuLdkRocUV+62C/tp9P3ogBhrMujOh
	468U2K9zw69i7K3M0+nI6i95Cp9xnCdKheM96/KJG7TdyRoMIIHcnuTwgC/BCdBWbdZFxCK6FwQ
	PxrBpPnBmPeCCqqjH2q522vMpoPp1cDUEzjiA3AWz7i6YgPUvm+ZcCvOxJqv6dSJk7jEWHo5pW4
	TnwTHgEdYw4wJEZt6vOtAUVASxBsP7v8lPXkSwjmVsN2Erpi+Z/aKocfASnfN4hMaluAVES2KNb
	t0H6BpwpPJOtlY8FRyItufImGmx1mUOo1VhFuJZUgVxBIYDN03q6oIanT/21gzjpufpAA3mu3wV
	zWhG2BC0dtv7Ck70RigLAqnsyaP22+R+hMIejhPPZVhWm4FR1rk8WwteSjRFkvLcz4GfoPLDfjE
	ly9yR/QDrzzAq861quf9mR5MHR69faspaw==
X-Received: by 2002:a05:622a:11c3:b0:530:eb9e:63d6 with SMTP id d75a77b69052e-5310d09817amr342871cf.49.1789338947507;
        Sun, 13 Sep 2026 15:35:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530d5e946a0sm71513481cf.25.2026.09.13.15.35.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:35:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
Date: Sun, 13 Sep 2026 18:35:38 -0400
Message-ID: <20260913223538.91579-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe failure and removal leave SDHCI child devices registered after the
parent clock and managed resources are released.

Unregister the OF children in reverse order before disabling the parent
clock on both paths. Use of_platform_device_destroy() because manual
child creation does not set the flag required by of_platform_depopulate().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD controller")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime, probe-failure injection or unbind testing was done.

 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index f5d973783c..d317626feb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
 			ret = -ENODEV;
-			goto err_clk;
+			goto err_children;
 		}
 	}
 
 	return 0;
 
+err_children:
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 err_clk:
 	clk_disable_unprepare(sdc->clk);
 	return ret;
@@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device *pdev)
 {
 	struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
 
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 	clk_disable_unprepare(sdc->clk);
 }
 
-- 
2.50.1
