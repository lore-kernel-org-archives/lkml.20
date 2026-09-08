Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F1525A91
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859160; cv=none; b=RalGqmfL2ablZhjxtlKCzUqnEIo7zkZikgdRfrtBwwJfX2DxyV8VfZf99Qysmhxms6tiGra90echqNUiJVmA4xJKSZquWC7zkHGkbNy3vQWhEYptqiLyfADljq442rk0iot52ScLcqTrTxuRkPVbdaW53auVahBxN8IfyMAMFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859160; c=relaxed/simple;
	bh=xtgeItdy0OzALjOO+/MceqMtezUFrplKml5SLbPUvec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBIakucAF2L5blkHln6nF7pYrPCLpVZJrEaC0q0wRfkD4XLjFEY3zBIeAQOLgcv1LPKuU/iOJh9rjgPNMQrIPNk9mhiAvPz2G2GT5QBbpaQROR0iRJ2UOm5buCF3PZ2teaFQ/kUhqoTDnpuuOVh6adlmprtd22U1DBUkuOzU3V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=LakehRZF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="LakehRZF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71ae3455aso69371905ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788859158; x=1789463958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtIpB1hhLYGZusTjT6rnPHQOVwY+sSeAbi/bl2xwBEA=;
        b=LakehRZFsFY5Zn0t5WjpOX3Dx2j17EAlrGMVJsjOsnTVMibF6/sRvBfvEPrN64wWtM
         HqTvoSlW9fxGqyg9Ssv0Ia8zB8X2xCQAYBnVxnHD3R4OK1C6HniLBQRZh3vId/QiWVBK
         U1BEr05m2i1sqLZPFHID50C6vC0O620gCBdF0KVknTfSCQmWg/Mbgm7EZZrpNTWQW9Ah
         njybgh3eabDmUg/dSvmOakj/4aF38H1dLXyKUZwYEo2YmjPKBvHAoSVeWYwZoFhyKwSi
         KGB8+8hAhOhH6FwYiKzR29T5iJEA6rqYOfW1EZLlna1fiwLMjXdz3D4JYBCoePOSI9rM
         b8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859158; x=1789463958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtIpB1hhLYGZusTjT6rnPHQOVwY+sSeAbi/bl2xwBEA=;
        b=WeTa+j4+HEu54NzghntiepN0b2HVaMSnB3n68ptAQUhSMoXEEuQocUgGvDwp/bENEe
         15myoUxqIIuaNyCdqIDgneZSBcBH8kPlJ9jFP0TZUt2LzlSqAU7b1Bf7pbm7qHWNkw+P
         FRkQd6p1wZczoXe8RC8C0es3nEaryuW6fSDA+xOvemPX4Q03l6LGJLkTS/Otj6ss5SPa
         JaFme10hpno+8Cim9t3Q2uGZRN94P4SEBCSYpcHfNECo1nf27grQ/HEjsJHLTk55EfQJ
         rhDBMtGSBCJCoTvS0v/f3wo5O1vg9FES/PRHN8TDdgG+ksXG8HlCdvyNisork2P2Hgrb
         Qm9g==
X-Forwarded-Encrypted: i=1; AKwUvBwcJPZJLsXCIA9ScAxqaP2GyuS2WhkgMlHyR+1vvuu7/tS4ulNgjf5w1VFJf3xJfnRrz2ftYMOQtIMzLOA=@vger.kernel.org
X-Gm-Message-State: AFuF++kquy4634mTAP2IhuxezhGp/vhT9lRnpkBhaChAPHq5XS3yvqig
	sDCdyn4u29WpVxhpAYs1Qr0v6caNScRcoGNzFzE/dM3Do/E5GS3G1lDBxCUq1DovKxU=
X-Gm-Gg: AYBFou29hKEY/+LF5ZrH2SR1fe6zxP7uW9fSCmLLeUKkVm37J9/CHR9pMNB+/M9FH+s
	YblTvEy9df20ziKUpI13tJXPGwSYG1l+J8YR8mI4DkClWMM2uanYe0Nt9wHVhIlPQ9LoOwfUo3U
	TZM7bBFtdsJs8VbRmb4p+QXS9LvDc9XjJlC77ZuVYVESe6UKI+jUHepDnUCSA5LhC4K9H0W3Rf6
	VOUlTPeJ/0PyiEOHxcp/C6pBwY1V9oZA5PoYpKQgoSB2oKxR8Ju7UafeWAGQMDOs8BkspC5NLHn
	ecNVHPsY0LAXx42PtrXAEgD/DZg6Qf2W0oQcljCELxx67sg+Rvu+izGdg4EdEgPVRDDU7C9pXuU
	rAh9ljhtZZp70AfNSl1ihLGRE8qdmVx2W9kHCx8k1ZgnDdvBXeuzK7CsnPipr5tnq7R7OIWMAHs
	CrEXBqU7677sgKu9V5GTi0U1UWXIVQTQBXxtjz1cUJePpVk0J9b0KaRked71rcVf85gNn3eLZJ8
	f5ytw==
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr41833249a91.20.1788859158105;
        Tue, 08 Sep 2026 02:19:18 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:75be:f01c:dde1:cb38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32015722c88.14.2026.09.08.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:17 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 08 Sep 2026 10:19:05 +0100
Subject: [PATCH 3/3] HID: surface-hid: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-acpi-hid-v1-3-08df24c4b139@thegoodpenguin.co.uk>
References: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
In-Reply-To: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859148; l=949;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=xtgeItdy0OzALjOO+/MceqMtezUFrplKml5SLbPUvec=;
 b=Bv7PIIbID1GVnQlHmUM/w6I/Dk/7/ZxTyv7MMza9p2ztJgGoB+kz78mu4kY+t8C8rVCMasMtZ
 uHNKMpfVlH4ACgJZ8jyEvtF5bC+fh9VtG+PEI5AhmcQ4SoYes01zUkm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/hid/surface-hid/surface_kbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/surface-hid/surface_kbd.c b/drivers/hid/surface-hid/surface_kbd.c
index 0be01b5e74258..036829ba47d42 100644
--- a/drivers/hid/surface-hid/surface_kbd.c
+++ b/drivers/hid/surface-hid/surface_kbd.c
@@ -277,8 +277,8 @@ static void surface_kbd_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id surface_kbd_match[] = {
-	{ "MSHW0096" },
-	{ },
+	{ .id = "MSHW0096" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, surface_kbd_match);
 

-- 
2.43.0

