Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E7345CDD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814181; cv=none; b=JlXJn1+Hif+iDFVPqaq9ibExlnHHfDPAMqTQiUA+k/2ju2+BVz3gzR3ov7Y53cd/iMrjEmkTDJ8q9j0Dtd3FHTyroSTglUlneU5uL2iiokmZuU53+AogNoYY3ZcvVX79cTrXsTjzj7aiV8lyi/bIHj7QZDs7zas/rAU9tzEo62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814181; c=relaxed/simple;
	bh=6JKuVrCOyZr5HvBv8gGEzuGBdgsojD1fi1cYQ2T3C+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4AZLRGh7Zdx3jtxwweEwRLJTLuSrJbc9fCrWdNZVWu/UCg8ZUABOoCFXqbjyAI2BA6cjuhWOR2i2w7CK+kcTOrf/qvW/S8kNh6E4aIuAuMyats87kyY3ZhnaTtBObocBzvw84dmNuka9w9em8NGSg7NzS5EH3/uEy0vgdDy9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJIVEB4H; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJIVEB4H"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88732460a36so769708b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814178; x=1791418978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2gyWQPmKEWea4fs/1x3Y9NNC2VkP5t/q0sEoQj6Zxw=;
        b=EJIVEB4HqBi/2/hreY/LPnluQTujBhkAFUC5CS0IUmLhcXpyMmwzqPdhDYu2UeIov9
         GYNdm7zhvunftufHmKo8Lr/YurOFp1DB26GGZJSXt9c5e8x9pDBmbm/llIutW84zPUWO
         qtOT0nk2eqPX1oG/N/AlT7fvyTWED0nLROu4G49KS589RYUCeLHGeEg1nD9FbRvDuZk2
         OiEi8Nv1iEmbWWWNGIAZCY5wUXPD/7iB5sC2X46j8xByyDOcVw7ZRF435U8ebXoYzaPR
         TEOG7+AQIj7x3x1/BaChO1ukpjLujSRNjWYKD9TPpCiZiKH3LtVyEqjnh1OyRdgC2ZbW
         VvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814178; x=1791418978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2gyWQPmKEWea4fs/1x3Y9NNC2VkP5t/q0sEoQj6Zxw=;
        b=1XJj5npuGBqPEwwl/cm4Kp/ZLZAANN3pXMQIUC1g0QIc1ICVnplpL2tJeAlbuuDImo
         kVTI5UZOktn/CR+6w7+mANtiHxG0sQH9NOh5gFRQvRD0/gQoOjVtapn4KV2OH9ovC0FL
         /0ue53FTA9FqlovFEvL5Dbakt5rkVvAayxUyIFS0FdWP85/UFb6YJX/OlYW46aoxzI0o
         FVifb7LVU6VaA3xDK716XZGdkUuBwdd15Jw9bczHBTZdq2PmnppuZphmkcGuvwO+cV17
         mifHKHRinAd6bo8nB6bD0u27OSeHYuczCppob9Ewco+gzxtuDnPQjH709CIdiWNHI7uP
         hYTw==
X-Forwarded-Encrypted: i=1; AKwUvBz2FeUUs5IYUil28UdPn3ZPwQqc2HFWRxAfu1WG6PH9iNFV12eJM3Zkw4NWJTkN81C9RTq4EnwPXC8fAJk=@vger.kernel.org
X-Gm-Message-State: AFuF++mlIo3/tM5HJeBHymtHbDruYSEBfQhYz0PiojXy1jkbl5qY1z3g
	XUUcuMUIASb1AiswyVAT/CTRwcxdago/Ig7tbWxm4saOpXRNfkdzPTM0
X-Gm-Gg: AYBFou3rVDQdDM6v3dHYKlW1vc1PeA63GyVL6N7lrKsXRz6c7w3Rx2wPShTrDhc6efA
	+nDIkrsFNzAe8AhMiScnYmuINhcW+oNCbd8U4dSqQM2X3gF/e74JDhsZobGkfbqqC3C6iGlJSG0
	RPHWOK0l5adEiswRRTWKxvWoiJLpKlcXQvM3LB4K4x6QYX8etzzY5GaC5X4ktHNwBwbig4BJs0J
	LpVOpaMXXBk7X2h65gNKJLxCIF6t99tdNlFAWaCQic65ehQO0Ipx8pvC5A7VnvWm5A9RWfLc3tW
	9C5u7V0S7CVjtCDVaWp0Md1VfoBcUE/ZR/eNM3SkSG5v1oBdy04ac1uq0un3Pbcf7shabuFi4ib
	Ce9W28qX2VzauLA8QMr3Z/9JWBGsNVVnfS9em5OFSdDy8b8Y/8F0SxRjB7HvXZ1mmmsCuGaZHsn
	xRGPScEQpjXbwsrwekclvdFABVttVZ0krm0rpiGSzUgykEOtrcgpP7
X-Received: by 2002:a05:6a00:1885:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-8874c4de843mr2761065b3a.14.1790814178486;
        Wed, 30 Sep 2026 17:22:58 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818deef3esm247601b3a.29.2026.09.30.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:22:57 -0700 (PDT)
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
Subject: [PATCH v7 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Thu,  1 Oct 2026 00:22:34 +0000
Message-ID: <20261001002239.31461-1-qby140326@gmail.com>
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

v7:
Swap low bit and high bit for
WMI_EVENT_KBD_BRIGHTNESS in bitland_mifs_wmi_keymap
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

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 259 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 --------------
 5 files changed, 194 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

