Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DA4BB263
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861849; cv=none; b=FvEr9bPlu2arFlOa6Cc7axDqRZ/CkApwa6vb/KAXZ9kwGCpwlKgXUg3N1PGtK1oGK0rAEEdvbAfms/OxqvIvG+KTfAvgHx2qV00VCEMUi+eDuTuKo8r0HFDcwGTdJfC+D/sLk8nc2VbPZVsNGo/UjzCmtMVfN7wQ50sBkScpPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861849; c=relaxed/simple;
	bh=Xhm6jlvyEwqt0Rkb45fso1jOzajAyzEnl5++oRbjBM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lq4Aw+8CtxvMKMoboQmfRXkjUKNZIrVGXAQCmX7a/tPeuaxWzPmuBFoeMxwcGhMej7pifWM3iWmtJdQ1wkXUt1cxyd8n5aVXJcvzRPSEoOGL8swkzJdCCcwf5+ydwTL4grJt5gT/bkdZ+AwGnyY+qx0zuGlUUtEzr6BXDdQelG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ3uqtpd; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ3uqtpd"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1989360a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861843; x=1791466643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn/EbQ9sJIYbAFQM5a6e39873e0LmKXeYS2Vj4aAJCo=;
        b=YQ3uqtpd878MsjuAI2PfAyaf2FFKvXDDHTycaysiMOjEL08EEJdGZkzYg4efJnMuzt
         BIrHAAcj6Z+cAC2O9GDqi05PzaAc1ECCxxveYsNG8RpOP3EGcSXwXoNgjrd16UyNwjDc
         qxMXp6865RuG1Tvoi4/qCup03QL8yzJP9y9VBrRyJkH8lrhC4HLQhESUcSD6+Cu3EjpA
         4m/rPO0UJ/WXeXFn+RmA5x4AKP2IOl6uqqCkz0iSWhbc9a9Uaf3pFXxgA4zXxkKTzyvg
         vwBhfGz4HU5cBQgdQLhPj6Fq69JomcHZ0lGC5UTjxeeKxViLbjQkp7NsE2PJG8DHT3wj
         riHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861843; x=1791466643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn/EbQ9sJIYbAFQM5a6e39873e0LmKXeYS2Vj4aAJCo=;
        b=SXMkl5Zb4ysgM9iPDkJtKRws731TsCNrl638ZyMIx2MmR3XoImwr1xCWXDs+/b0i5N
         uJy+tG1ugF1yEqcbaL3L5gYF8iEWtyFM0pEDmzXQA8DbUr+3qXoOVpwGd2JbmSute0WJ
         4lPHj6CovfDpcWcDM136QTDuVEr+KMZagrPPdYYxE9S2DjChWfSGxttG3vIgwk+OueHA
         ZYfYA2PH5n/2z9URnSbHIKKK4j9kU36Npje3mLAjpVrVrqtROFjbAWAnU1CdS0ByJCJI
         NW/L6KPmf3Hpq7aHD4dUjVN13hVdK+qxfjZ5Hr1AzK2YFPvGt/CxwpOEpIgPsGbCrmXQ
         AGNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCgWgqYHYeWuV7cLXikusPsbk0WulURqWVx/GJ7waFLrDg+hc++aM7lARrUSSZu7p1JpWKXhz5hOnfmYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL66G3/X+bxsVVHDQEh54BEFptLRr4QP1NBIna+V1l2tBq851YF
	DdwV0qQ6AJYVUoJy80HtOwCVKoTDIVjci0WTN95H3Dp7MxBnN4ERo4aA
X-Gm-Gg: AYBFou2xE/4jwOyg3QQ9Yh+zoLGvX9R+wxkSPHD/xmavUIhSvij5gHG6xm2g12MT0pX
	EX2sOPQfKph1Pl4PqrvrPrfMZFxxivptlugj4PTJvrHY0M/5H+oD6+eXaWg/iuBIIcqkR2acOtQ
	GzkPIeMeG0FR0DGksUUXVaW5cF48OjXl7h8FnUAG9A7iGoIZ0MfqLdtWMpvq93FQWlpmMPUqvfm
	2hfA0cXGgo4dHpm6S03sDzMWATmKjqsNaIRLA5onHtTSXyCkT0tB/9e73k4wFBw2HY03KbQuqEx
	j/oMuw2qlPnwd+b1MpP4CzVTk/rmWF40BtUppy9Pfwj3cm8pIow942yqOxtJ1Lt3XNS84mWKJ/v
	hsthuPinT26/WKGRle6LI5CTx8u8YzFHt/otSB58NmEJDUlG1IfPzNwDu7H0hve8owOaNIWepGw
	1P8YsgYjdnRQwG4Bb2pS0ys0OQjG1rFlZqgXaUZddS50egD9MMpH8q1fooWwinaETNYYlCOfw=
X-Received: by 2002:a17:90b:4ac3:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a4f318ff56mr1532702a91.36.1790861843289;
        Thu, 01 Oct 2026 06:37:23 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:22 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v9 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Thu,  1 Oct 2026 21:37:00 +0800
Message-ID: <20261001133705.69244-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (5):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 261 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 --------------
 5 files changed, 196 insertions(+), 239 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

