Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150853;
	b=GqO0rGRhbgjINfMTTbXo3crqythPuc+pnowfCVhuAWICKvZ3L31pbhPnZUDWXlC1Wdzm
	 69BWrP5gxJ7ilxhh/MWldxfmuTTlXAJtSsVVyMcjQT840mt5q0oPQVfCATbpSnAoMfott
	 klfsGWKbPSvE/zpP9IiTPASCgSkCaFkvDgYhK0O8z1i7j9jl7IvY4oDY7hWQGeADifecK
	 r5AkR5xpjVoVz402cVRTF1jiLf32ho8oUT7WsFp/Bl76aHQ0iWazAT+GT+pephx5NUbNa
	 Xf1p80nU2pW/se2EeDvNSS6Gv4BnG3TH09XGRNYdVvW2YbIh27RuHXBECzyUpvAiYkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
	b=fDSfxqEeyPiRZzqKaozfGEg99r0r+RPIA60CSi/XP7q//26r7ervETDkbsnBz7PuAlrq
	 PZpQQ/QxXcITj4ZaOqJwVnTUxBjei3vCly0Uh2D7i4WHMmif4QcynAhyjvHxSm1XOgy/i
	 FiPJPWqDx4alL4Z+edQ+LuMN5F90wFMmwOxioTnTUpBTkoIMDehQoRFp2tUUSemIyqax5
	 z2Q+ERx1+td0rYljsMvzOtrrr+bT2DJJdJfHhw01tFe7ooK9zhj2E1G6sWSF8m/WZGxsO
	 kqq07LnBQUT8eF6YGF9NJqWvi4vP7+2KBR0m+N6I6zREotcHBGgnjVVTuTOihr4O7Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF8606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCF8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d473cfff6so15934666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=k+sw3vLYGtsdgh44ewI3ONGEVRE5G9Yc4ViLK/9qvelJ6ZuQ1Zg+Wy3yLBQj9ROLgd
         xs8ytVyJZNi3KPl8VJPkuuuPV5Mi98hZ9s7lytBpov8P3Dv8sm57NzypUQ3ewuDNxN+P
         ZbpLJCKQVPQEjt3EhHdXCk2STdgMORsCuFRsHRuRCufEvM/x6D21MPgZqtrrs6V3+go3
         VEZLh48Mk2yewVFxSVZYCOkqtYhQ8IZD1a9M8FSj9/cp2wbLKUxxKePnXQWWRq7SyUUE
         Cy9ZSGSUe2N+Mqp7zISjkA2uIb+izKV0GLdxE4z6dai0ODMn8sIoREhE9KSjJ0yq4+u3
         dpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=YNKmLwdvs9fZevdvU6VUFcnPYW3GuX6o3KMtVlVOLuGRpvdR99cZosMnfmYn0toi46
         xU4vBnHe01kl1whaohmFb7IZ2HSJ/mugmYrpGbZYTGQUSSB4jcPMvo1I02k7M5JsoE1t
         dirVWRfmXVJ3Td31BFR0tFB49+NHKhXa2eTyeYNk2QGdwTPhFOL0509L/pRCp6xyPmrg
         /+KFsWpu89edE3y77b1ZKY2lf6Xq9nsnVU49zzwa49G/4yJoRC720sOsqqgy2x+ZUGdu
         oTxe+rdZZdUTDMdzAR24X+ELo7y3tPAXfIgwstdWFpdprvWOKC/uJpasIHXlMgILHdln
         aToQ==
X-Gm-Message-State: APuU4Z/JwxiWxd8IbV4L+hbttnwTpmmEPfvfsTjrrrV17mFRLFYvDzu/
	zu+n+H7Jen108uLzwiGw+d86aG7h9kDRTxxFemksBrnGNZVo9bmh1kO+
X-Gm-Gg: AYBFou0lJqGgQtQ/+DD+F2uOLqfQipIwOLNIT7mRjtpb1KR+/3zug4DVTjiRERq4W69
	l9Mk2gsJQ+WsByRBomzsMSXuTgOx1G+wR95iLp1XiaTWSPL+fKL6U2c56r0Wwr408DYbvjDTALa
	vRy3KM9T22BsPs2prmvJBcxRPBE51w1vY2yvXRK3BimKtqwmbFPS1olYbNtKyuC+KazPV0o8Fm+
	WvCi9ULtAewcB1g4nsJbB+HVQEGFK66mgvPYjIvfxsRUgVE04IQbbBgtbpFMljPpbEpd+ee/xTh
	PudjN1R2nBqfXD+qQTgGfZwPwkKPdqosyIxkDND2QLy2E/r55SDdoufahwzdjQXgTYOCQPN8H5L
	bh1qdVxAt71R8dfpCyIK0D6+ZKAdWaEOatUiyGnRZ5GJFSlOAbNN2AaCepF7MCYrYBhRn5RgT7f
	4TWLhHf5PIkBts7/ILCT52+CV5v3lgnObdwxv2N+VZCIu0iq9UByw3K/R6CKEyuuU/b60XeQsCP
	Hb5ouqAvVicMB53uXlDxDPpCd9JYtpQS+AsLxDGgy8aV9+mT7p4p1JRbXc/j2AQhc3M3jEo5o/a
	Z6G3P3SqQwkDXfE2c1JMp0egA7nqcAkdLRL6tPPGXENi+AcYol+ALNSbqP8CYDwTg13qzzF/W/d
	hCBohtEZNeA==
X-Received: by 2002:a17:906:c150:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c4d6db81459mr108618266b.35.1794150850606;
        Sun, 08 Nov 2026 07:14:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:45 +0200
Message-ID: <20261108151348.204182-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

