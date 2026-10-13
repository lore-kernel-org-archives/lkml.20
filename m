Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4804BD36E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873245; cv=none; b=tTCElOHQOZyp5BkhGr3S1jxxceY8r3vk+cgQ+gGbvoYoOc9WHWj2X550oIVgFUZYtnF2bzDQsps5jxlvRwOd6GlzrVjj9f2LWDsmLbVpQ191McZVJSXlJ6h6Fn9jmLcsDnNH8/PmKjgtf6+kAIh7uwe9y+PZ0waECJelKyty6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873245; c=relaxed/simple;
	bh=tAov/dDw912xhNHWsUTpLi9VWhD5iNpsaOR2Swx1l9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pyIHSKdgGSFcPWijobvE43+D/r9lGxCabwNeFxQWMZOxVH4wQuaMFYtpnfZXm5dEEZugDyDKEkM28DJAhx/Jp1AXRdJb0dCe8Z0vTSybJcQOHiqVWZO0pmgccGfuAlL6hxZf9SwBFcjK7UaQw3VnctmiHrsjDz1ZuR1u+8lE4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLMZJmW2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLMZJmW2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso1111007a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873241; x=1792478041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKTRLrIyKEMz6MI3wLdSKL+hpevlt60IAPA9xDHCRO4=;
        b=VLMZJmW2YqSOLeoVf3DEPh2kD5vzVuP11+KlLqeLUGBZYHmPyksQkzaru68nLtos4q
         t/SryB0OGfSp1jaeESYKmPiMMmBQ6afcLXLXW7a1jNTfXwMqCiG2KkHczeePSkOS0/bT
         NBmit0zrPi9WHA4lL7/td26SRPzkSgBh+7W19/9y0xYn3/MQocqVpJLFhwP7LFB3PAs2
         lsUE+XVm7T3LYT7Aa2RM5k7WacK4dkD766sQ1Vk7/N1gO8G/QrLB2Jbwj0GvylXRwZSN
         wdKyuirnGSrzZL3JsK3jdbNq3RFk2Ec08tCV1AdHYWRU/D62KQJ4o0sdPlMUUnBPkDjS
         kC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873241; x=1792478041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKTRLrIyKEMz6MI3wLdSKL+hpevlt60IAPA9xDHCRO4=;
        b=R3zcw1+JhGN/9ahWtQvSK1bXocds/OwK4lBrENvSDSRANrsQV0Ua30I4Hyzxt5PeAB
         dkar84nVupNjk4AYFIAqLsufAQdpt6W5eugiXNp5MIVbdByyWCgyxpGABFeKG+BfCP3d
         gtPylKXT29eiTRw42Id1dirPsUjtlATC8WO1i/l9/asB7OTXURfwFnE8CBw39PQLmrVq
         7oY+7ex/RcPvKxVYlHNejTT1TbyPkgMLYS6G2jCTfw8Xiy/rfZWLtMHC5pKayINcgfd/
         VwJQuBc2rTfM1GDxycknYlbLsniYVGLZjjKwm6/KEwnALOL8jg41deC9rg7Xv/QrKhxK
         Y3tw==
X-Gm-Message-State: AFq9FYJYb+PbEm4HIPD8Ju9kyU1mKQWjuO8bOk4mFhTn7nSXdMpkVttC
	Ju8jp2FFKbUq9tCCILOauJqomYD1MlZoWFDJNSdZNwudyS/We6Yc3ZWi34uXLQ==
X-Gm-Gg: AYBFou2hVmwesNSIlYI43KcG1IWRh0D/snbSm60l5C+5vCX6WhYklsSNlwjM/x1CiPC
	LoEZvPe3qLlU/ryeC0UdRyB7MA0y4mzvLlzTOg6FkVYi7LCbD3O31xeTGMqSc0qnTFjq1RKu6Y4
	xBzpSH/I5hb8nPiInOZvbevC+DilkNqthUSOhSiiAP/0N7BueYbtA5KZkxs7gokk49/wmWEOnKj
	rC0s6SMtTogHK2HXpWo68dyYB2fLjuM2uFU9kFkIrIexZMyR5P3XSqt77MN23hix9KHtTWam2wD
	XZ8gTS+jLMIVM5LOHYXiKQk+rXh04+wqx54tIBYPWq1tTnrqavAr05B3PmZvXK0kCEh5NEGVZ4f
	UN6iTlr9BDhjmK4uwhuO7eVBs78SpHlLoem1Ni20KMeweJD+7N/qzQKa7Np1CAJ3X8MV0LsD324
	BkADnlJ3Sf0daeOx+PsMdubJvuOD6T4aeZHAqVo7n7djhVfgt8cKoDS5ae3drppE4kRfl4ZSJlz
	YrUBMn3pGj9JkbMEh7UM0w7/PjCtnaj+FUeB71e
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr2680236a91.27.1791873241287;
        Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 08/12] mfd: nct6694: Rename driver to nct6694-usb
Date: Tue, 13 Oct 2026 14:32:54 +0800
Message-Id: <20261013063259.2734757-9-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Rename nct6694.c to nct6694-usb.c to reflect that it implements the
USB transport, in preparation for the core and HIF transport added in
later patches. The module is renamed to nct6694-usb accordingly.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- None.

Changes in v8:
- Only rename the file; the Kconfig split moves to the patch that
  introduces nct6694-core.c.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                              | 2 +-
 drivers/mfd/Makefile                     | 2 +-
 drivers/mfd/{nct6694.c => nct6694-usb.c} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..737b17c917bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19539,7 +19539,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694.c
+F:	drivers/mfd/nct6694-usb.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..5ff440fb75bf 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,7 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694-usb.c
similarity index 100%
rename from drivers/mfd/nct6694.c
rename to drivers/mfd/nct6694-usb.c
-- 
2.34.1

