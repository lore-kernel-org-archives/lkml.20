Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A54570FF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727087; cv=none; b=uNZqjnD7ho1TXw9/A0rjhq7vpskIiFN2nm9AjJOollncH6gW5MHOaFDO6WMnviHBI59uBB8ekkcPA5/Y8auFvKFIuxjDakSl/SW4/pNXWmPEW9Sz1DR5V6YoFkEF2HaL+2Qfcagny1fsHy6wIJL3Q/PcvOqytKYWFpgYqPcgXCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727087; c=relaxed/simple;
	bh=iy9ZZHgQpUtmWwR8tI4lZ8e+lm2lxVAZeU3WNOzQBzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePxbiZ59Zs+vnbvOeHxf/JnJjATimujod9N7KlwnEMD3bzrAznr5V4pSgpXvyPODFafo4Pd33b8HzFDu4u+KcNtB6HJwccqePIKnhrK6xzA9pAGFzTgku1jkaP7eNJQSt5KXj2tsqPQ3Fb7m3rkvC/14W3Hjvq/qzIzu7jk3Wbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpSdTSde; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpSdTSde"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so402597a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727085; x=1792331885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9M6enOM47AmtmwL3A50YpqJfaxKxGlislTwgMrzOxuY=;
        b=PpSdTSdealkpZ72fYMrnNGcAB4ih6Lb0VpOzZBR70TVkUqkfBXmEo9ya248B76t8rg
         NxwBgDx2pCvlrbDCp80bCF7tBqd+xpO4Ap+VxrghR0sPQ2tJ03cBFsktluMF0DttMKMb
         MsSeopR87G/OzY7T8omR154X9nFlXkMrCfRQ3PRUdlths7UaTb8iPXYHoVHxlAlV4hck
         QMtM3tLrXRGABsHDZ4davYJjSnT7/HZknSZlJWhXmkOR5v/aoG7Vkv2mqbivD+L3r/J5
         ZgwWaeilFNAxI9xy7fblD+fMszgK5Z9Jet2ryMJmCb+BVF4zDYmuTyKTh+KQYoGI+CLZ
         P0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727085; x=1792331885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M6enOM47AmtmwL3A50YpqJfaxKxGlislTwgMrzOxuY=;
        b=PFCrLLVz5B5KSGARXh0Px7zuwq4kZjg+zOsa4oS/9hqaLUlyf2b9YZDqprbgbRFX/b
         J/fBf/qYcBH05DjtWA9wlvQEhCJUcR/uHq20fUgfqMKCfvp6XYShJmoFaeGppVd0jI3E
         YLKcxS56Ofp0I7TEcLjpZY8EVSLWmHXN1L5WrMZ612mM5jbSLVL/jZokGDpLrpFtczas
         SGKj5/8iw79YDB/am4uuo2HLl6bAb9onGYprPjvDNo9JDB02+6fqslUJDXwTYwLa9bTK
         gVZlqiltsQ2hzkt6PUSjZV+ycZNFyJAfjrRo3jCR8jO8GbL1HuPedVBsoiBA/pi8Evm5
         YkVg==
X-Forwarded-Encrypted: i=1; AKwUvBzLjkFwHcRBMwDoxCHyN9BkxGku3IBTdfH40K2Dd3+++6BKSFcCEueD6VjUIPlbRLXK5YjXUHdbmpxeQpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeQfNCanI5NKRnndXDO9o5jYMVzJeBNKzKKEwZQIxTCNiTOUkr
	Qn1J45x8NsZinvI2WWjYRoOLKC/MDVkrcjqsXC2tHtLfs6CvtJBgbVGx
X-Gm-Gg: AYBFou19nqDwUX0INRF7dM0nviHKStrG65/WalbfnopJ7l0xKTP36qWv1D2NN+dk7Bl
	dboiqwTAwMfiNiewcwNjPrbu3+/Awk+b9CrppjZOpDI/CG0Yd1dEdbPccCpQAoAtpyFoTq7Kfgh
	OnTHrVmEgSI4VY45/6dWHbhzOi6c5rCmkNt9XFewH2OAIvA6NtSZnkx+UMUB74j4/uFIxLIOoIj
	4wZWGu29cmWpI5AnaVZm27jQQix/t/gMVh/v38Ipa1jucMk+IuXZVWRyVlEjvkufiqHEbTIefUh
	bvL9TCCNYJbVRfWBsmyF4NMFU+9jeHlc4Rp6Y8ggBY0T4ZBoJdF6I7z5L04BYtU5IHreUZ2HtBO
	vgXqJXAxdP32s/dk5YAKDUhJOjjSW+IjqGVDyhwm9TaLJN12ZxIMAnlutDfrOuUI8MtPcBbYcf0
	E3Ww7Cij/EV7YqnXOkGlL1CJK5oi/mkr9sol6i5r6RjapRLtIihchaqUraElpOQd/Hg5c92ZSC4
	A==
X-Received: by 2002:a17:90b:224c:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ab3ac5ecc6mr5550005a91.53.1791727084732;
        Sun, 11 Oct 2026 06:58:04 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:04 -0700 (PDT)
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
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v10 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Sun, 11 Oct 2026 21:57:43 +0800
Message-ID: <20261011135748.11792-1-qby140326@gmail.com>
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

v10:
Replace the previous "profile table" with dmi quirk table

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
  platform/x86: bitland-mifs-wmi: Add quirks table

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 290 ++++++++++++++++--------
 drivers/platform/x86/redmi-wmi.c        | 154 -------------
 5 files changed, 205 insertions(+), 259 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.55.0

