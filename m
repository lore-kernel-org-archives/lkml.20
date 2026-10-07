Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1139F188
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364936; cv=none; b=Ng//mC6/zhTd6i/pHztlVef+D7LJjfQDBMhy2lyAB9ItBbd4LQBS+AyQoKbiikhpJ6m81CtkW7CNdzHf08tnq9Wi5DvNHlru9+OYzTEl8u+37lCb2ZJ7gSKxq1qsH1injNg8zGWwiZJWx+W4f11Acpcz3fghDpTNQ2DtX/XQ9x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364936; c=relaxed/simple;
	bh=oSAM1EU6QbgMvte1PB4fhKXxFYiJ3swnTBCSusS2a3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RObFEtz8tFPVkKuG3rXvC9gGC2kQyA2Om7w2bkYaIyIS1BxvU8GAbCeYcn+LvxBqVjLEG/MR4mqIkqEUAWmU13RVLy4Gq2wiCEp0gBlPPxGud1y3u9Heg+CYXfa5gJqr7HbAnLyTRNhih56Zw1csmqIvGoqnV2bpXIeZ4zqo5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGAFg3vw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGAFg3vw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e6038cebefso4967525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364906; x=1791969706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwVYNJ0nxEgUJfy3jmzVhfvg2QCCNvzMgAVNpWVBA24=;
        b=OGAFg3vwovHB40GVh/jcA30cjW9cDc0WZmSY91MTMGAhdK9K0AU4K0TSXhhTgm/Yxm
         TqvUsB3wcb/gtoxX0gzFBnxXKngYGdrcpGOmvzSqoYUT242bYYkP+gGRsQ4ZDAj2Ix8J
         dp2K5Fxd956MMDH92aYQPFk33cB5O12sklqonYJQ1mp7oRXY3p7ylqzCdG6k9pMLb4lX
         /+UNNbumstoFDfGklaSF8qbSWFkO7h9RalXtYUA8Qnb+/XhlqWJ/33uPMaI8+qZo6MFE
         +ZSZz+vBXcgeeDkFYuI8LxSlhpJbO3rIYI1rvyMoKwt2qm6oBHePcH6HG0ANtESeZz6R
         Wa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364906; x=1791969706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lwVYNJ0nxEgUJfy3jmzVhfvg2QCCNvzMgAVNpWVBA24=;
        b=0URTjr9FGfuku3ct7kHdNJPxmtOLcjTxxFg8P3aJ8yMiDTbYkmH105tawksCVzqgoS
         ac+JvG/ia6ZfNEFZE7rYpnzl9zZEPA1XjsLQHiVCplKharI56qUeFL/ZT6wVMcTW8uu7
         /jUsBoRGkraFtfWiFKP+aJj17W5EYnn9ZgBmC9p1KU2nxCCO3TB716s1HbOKMfF0Ys5B
         MbuGpyDGRpvtaL8f5KZRjIRXgrZsp6mmWjj8phkV0FzAynQ/mjXLy8WvffQTyaE4q4/0
         WY69+kb+YakuiHyqmBfhj4fUHLCWMsvbbSYDG8Epn8VtSHtcUxcfwvfFGYsKRBcA/SDY
         FFAA==
X-Gm-Message-State: AFq9FYJ+Gel4Ryn3MLCw3oDzwtLYz/PE9jJM3s9V50C7XwXyH9ksD1Zr
	C8eI7vbejvu5s3u/2l1K8Rj5NdY2Yb0X513yuDbxTF0zRUPJH81DMIsN
X-Gm-Gg: AYBFou0tY9JmqMbyXOwpMjZrLhM45t6yux1Y4v/TClhUJj1mN71OdLgoRRsK3ua/e3f
	hcslWeX9KXU9JtLI/2cZ+5R7nhq8fjkI9jtNmmPbI/RORdhEJOLOBrZUz6XCXtuRGsEcQHn147P
	Kuxbm71jYtIQbnUZ98CIzTKwn8YGwZs79yem3coUxG0W7DfLiejho7dHGoABRdowquCxVcvMCdk
	DLTzhHwhB7C+NIaMsYIOsW7mHSX/To50DWAI3sdrEoW9P1jJsRP7J80bEvUc3K5NFA1rgUasfVb
	n0Be5tpvAKBDE7bvCOIyOKuIP/pI5pN8AZbttVRZ+hieSOsf2cRMnanqZipxoGlb4IZAf7aNoB7
	+QA0WK2OsYDIYQf114GS7HosozYQFrbVnUKmco5Bww+TTlJ6rJblVGlhzVu4H6MQI4En2v8hpHW
	AOXo6SEkbkFiJ8iycuWszyVSJyApAgqUsjsdWmol9zRaeww02QAK9AJWcHZiMqRIVlPe0mU7tOe
	+9EH1XVsRnoOU+3VZULnDLx/5/y+wcY+g3yGTagqq7Apzqs9/E=
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e6005979d8mr14276105ad.60.1791364905881;
        Wed, 07 Oct 2026 02:21:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:45 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 09/13] mfd: nct6694: Rename driver to nct6694-usb
Date: Wed,  7 Oct 2026 17:20:58 +0800
Message-Id: <20261007092102.3768818-10-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
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
index 65e8a4b5c90b..1f00fd84365a 100644
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

