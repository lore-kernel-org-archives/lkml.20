Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA352D2C9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689538; cv=none; b=APauHgsOAivD2WerWVqQh8EL+iWVBh3ZtbqAMnLe77Bx0u7B3z8cENj2c9pnKTOMAHGOxNWE4VyVO1HcmWLLBF3ul+8DnnwChPhhwzZqWT4K3/WCAn8MIQgRGet4v/3pBG6K6N9DU1yPzCFFiHnit1xF3dl1pv48hl5RS8DLJjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689538; c=relaxed/simple;
	bh=S4Houg1rUsqdLENp0bnscNw2E/ZkMSvd4UqZ3bxJeqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaOEIhmcTdbelvf7A3jqmkgp1hEt0dcrPw2qSFM8/dLei77mzhoh0xbrwNng4lsUOFkmIOqyHli9dy9UB0zk4FEeqqDZZx4R78LQViW3xaWKBcCKZ5rcXbupIsqB5kZRx7vIumtNekoZ1YZdQxXx7yxDqqj0dXgNalDEu3EVh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw8AHUIn; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw8AHUIn"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-8864c6bd0d5so129521b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689536; x=1791294336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbOv+6PrlEjIifh30wu1d3jM35f4SUdUb1t8Ec+wrNY=;
        b=bw8AHUInPCxe4eHxU2aQz8npBFwrVUfk3DknmzfZZxhQiV/hxPqCa+nROZwvBjo1sb
         5+vx01ve899vITBnumnc9PsTKDGXF5zpYwg3fap5Wxl+2iiImv4ooRsmjjz0tvMSwa3j
         tc9I+4iFOIsn6laHHqs/sK287YFEG7CySJdXaYZrLH7WGSnFuIbU58Jiwx3foW9c3ZzU
         rPVd4mcWWuQwcCmXTf2lb4LGWDA20MUCE+XPLc955Lt/Yr/F7LSlD6tGpX+l5x8oAcGS
         IPp7xahs+0OsLRh7r9Sm6IU7GPWB+p5HcgEYnr+YvROWx+ZW7a5LmIMfwqMwsrNQ+kc6
         yR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689536; x=1791294336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbOv+6PrlEjIifh30wu1d3jM35f4SUdUb1t8Ec+wrNY=;
        b=NbPxcbnEmc4NQGslVANtyG63s1SWoaA7vw/hWmHbPfo5FGSpgvqAZ0FTnG+YyUM9QZ
         mgFEvrwqmXSHDTdevNPP916SZFRDJrC14YOjViJi6xBxPVZbxEpczenUHefR13ewWdee
         syv4+zfsSIiGBdXbFMnm5YMKEwIHiqNhyvllG6H9I+rylPmNYb+zVBMNgdwZ+xh23rLH
         12y/5SKT9isIrs9e6y9X8yhBH7ojWzcySvGt4b1kr8+QsDw3pOKgqZ0RoSsdZRPlOjfr
         VClvUQ2SRQ90yLRwmcz4E6jKbt6uy0ihzPmDWV6DmOlTCbuDMp+YZP86PjY87DqWaygk
         K4og==
X-Forwarded-Encrypted: i=1; AKwUvBzWDykQTjbTEPVyzN5UrwJWSLPf3IurHurioEzE9WcaLseQA2lJKT/GCpe+IxFnLjbquXBBEAOfbudCzVw=@vger.kernel.org
X-Gm-Message-State: AFuF++msjLmM/Q8oVW5wEo3zZsHYKT5X91Tb2e/Wp0eO7hjzlZ/Ii39g
	wT6cHbAnsk1bVfK4AP6b9v/Td/IMa9nGgenFuyKxULKt+YyhYrz9oYyYVB07cffH
X-Gm-Gg: AYBFou3RG7yOeezUTYqvDUeMtsWdXQhEXEDCRAqxR/xXOnbijFc5umVxpkdQTuPmSA0
	zPbDHyChcA6UvsgRnL5VmR+Q4b+Ynsu0AxW6S2D3ayT96r0qdxmKlzqBEWOEmjiG6pm2WTigd6N
	EdZi/exflEn0AZvkd4rb+lGxHdpYSLEPPWs8di4FvA280T9yo62gGBezviz/PNDEsGkn7XihOOp
	xURFO/7v6EDBPyeAZxDjhVZ1mfFZKSf3QD0WedVTBi+vSdlKDfQ7h1YrnLDH0yiuHOssHlh0uLx
	WKHpuAFePHG3/M5mgmpfsY4KXzzh4R6A4DNPQwFfmgY1MN9bd+3RMxdEzXBYg2DvY5FS2YPdXAJ
	ODZ+yLpr2csFV5sj6d7C11L0h7/77ZEqEiVUVqRN8IDlxoB2jiMZf1TZzNJ8uty4ph2BQmio6m4
	MfyZ0bjSeD9G4qP3rJu9h1UvvO5/KIOyYygUrWU8vXPYD/Kwg5fKOc
X-Received: by 2002:a05:6a21:501:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3de0e95a387mr15675678637.64.1790689535516;
        Tue, 29 Sep 2026 06:45:35 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:45:34 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Tue, 29 Sep 2026 13:44:58 +0000
Message-ID: <20260929134503.17249-1-qby140326@gmail.com>
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

This series introduce a newly reported mic-mute hotkey definition for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

I apologize for not participating in kernel development over the past month.
Sorry for the late reply.

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

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 251 ++++++++++++++++++------
 drivers/platform/x86/redmi-wmi.c        | 154 ---------------
 5 files changed, 189 insertions(+), 234 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

