Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B651FCAB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064977; cv=none; b=KWG3JIDeRofs13OSJucANeD39YZCz12drT8gyVmowowY5BBzHWSQ9WsjSBpp4fwh0tEEA9Ut0gASg6zM8uQ6fx5yqac9g5p5btUqZ/d6xf0XvBm7QYTHfjQyxYpCetVg14OvffKifU18OnJqYv2PMTPGt9jrCQeh5J/ZvBAwcl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064977; c=relaxed/simple;
	bh=LoZgFSMbH6l2V8yXMUuVWMtfuVe3msV1ym68BSi9k70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yfenhi2y9ga0XikHjwYE1YGJuGQzTA047LCNZ8lCkfCz733SCCZTihlQgjDt3KutKao4qnP8jMTVFyi4gWibK4AQdO9AKDPITgXmkeWoGofjH//1zDCiDCmuH6o5EKk0MIv2oXrEU27I1sHfMLkBEb+utjYeHF9MAdJa2B2zcCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NipcsWLT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NipcsWLT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8541875f596so18154b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789064973; x=1789669773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxFdTsORvz4Di0mzXUD8oZCgI3pt+vNsjqEyUYZBOUM=;
        b=NipcsWLTWGykpPhvvrKcNL1a0YfdEbtUTaE8qSwhlA/wGq+xj2C/S/ASooHxwvG5DB
         P7ULLRttA57XgIKKrjvP9l2WrnbYrBNS8gzDUkjcspbzNpnKfDHgbaQP4Wd5QQETi29L
         JzxzIPdeNWWvRRXmkI8spAZ5sX8VWw9ei8794LJJwmikmqukFevOH1HYp+nPXVG3SGPG
         pHLHHvrPHEZ/3i/OkMijaL55xUjOHf7t0VZ+UhozjsdQ1gNxJu7cwyjNM+I+H6DZ6TC6
         igC2TYJvE4nrg5a+BsDNj4V2YLQYohcTvBU/NrlYrXYCzqUD0WUoCmUE13oTQL+8Io3w
         EQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064973; x=1789669773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxFdTsORvz4Di0mzXUD8oZCgI3pt+vNsjqEyUYZBOUM=;
        b=Bv2aoE1qVApWBmNdNbVU5UCRdUjTsoUxgDGI/4rHuixOP/qvKp7AbqFqprA7ww65WV
         ayNK8ShCOl1RKNxWCktvt7GTy8NNbsdtkjfpoHQoboyJG/KHreUXcZF94UVvZRApwpqW
         o2/HeVE4893HaDqrRjg5As9kEqLqhv/+yYBswiE17tmgo3p38nSDKNU8Kr4UjyIqiR2W
         BBJXKtimP2itucRoIKMmJOS4SMxiY/LBw3bHggIcubUv39+jvRV4LA0CAeGHtGZDEpd5
         xwnBSQVkIVXNgPiNFk4e/i52ScOv605SG6OtL3muI38Ufq1VY6nX8r48I37GvAyF6RCj
         uIgg==
X-Forwarded-Encrypted: i=1; AKwUvBzMSJg9p5DyhTXRuAfF/W3Bkugtxhe6jKlKgEqwTMYHaUel7RXxX1/bb5Gv+R5d0RbfwUmiaVKMfxTtFT0=@vger.kernel.org
X-Gm-Message-State: AFuF++lf1d60Ieid/jtVkgZeqS5Sh1pH3Qt0nZKRO315HsMPfO2582yy
	pN1pygvkOzDc8QQ6nZDCP3VW2oVQcH9NJf2pVmFK0PxPANk+NKT/6AW/4FVqPY05
X-Gm-Gg: AYBFou167RnYIh+P9xm5YCtdmS2oX4MSN88AgriuExi00ds7HEPvewYfLWiP6wK86+j
	8m055quYNLsumFyaC6NWMBWZs7YS3pw05b5JKPRtT7dMgiMbrwMH9Q0jHKQRfFUA59cf+A6co+B
	DnWAG8wSppm1QP9AxFKKLIGh17Ud1Tl6TT0vUFvczwMIeQhR5eRsVdsLy/uYjGY9FR74VV3cKeQ
	9C9IpHFvUaVw+eVDH7t/CjA5TlhGW7IbSBCrxZ2BopY3tMRXi0gtyyk5fUP+L3d8HLwDcq9sMSZ
	ECnPGcbZoChBTPIvhF9i3tFW9MJFEMxKHdNPaBPmSeOvnSYf40iwd+txItIPJhBN6SHRSwIeA/4
	fq1ZUrMqh5xVRtbXqzzIiec/i0g/ZtgDGYHCq3byGKZE8GrPzRL+PjFz+3xYJbAjRbyQvdv/90/
	ZcTgrS127WBWIlqRlHSjhVNf/ClgUiRrtswXPOyjBcMzupZPFMAePpbPXJlm4rhhb3qbWO56Ihr
	q8KRuNNanbo
X-Received: by 2002:a05:6a00:1bc5:b0:86a:38af:2062 with SMTP id d2e1a72fcca58-86b34cea716mr50922b3a.26.1789064972414;
        Thu, 10 Sep 2026 11:29:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm111155a12.7.2026.09.10.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:29:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.3-rc3
Date: Thu, 10 Sep 2026 11:29:30 -0700
Message-ID: <20260910182930.1739489-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.3-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc3

Thanks,
Guenter
------

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.3-rc3

for you to fetch changes up to c88a6338ae485e4d6210cc74cdb7664d6476c925:

  hwmon: (nct6694) do not expose enable on DTIN temperature channels (2026-09-09 18:16:35 -0700)

----------------------------------------------------------------
hwmon fixes for v7.3-rc3

* Core

  - Fix potential UAF in pec_store

  - Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device

  - Document hwmon_notify_event()

* applesmc: Fix key backlight workqueue leak on register failure

* aspeed-pwm-tacho: Propagate reset deassert errors

* asus_rog_ryujin: HID report fixes

* chipcap2: Fix channels in humidity alarm notifications

* corsair-cpro: debugfs fixes

* gpd-fan: Documentation: replace full-width colon by a standard ASCII colon

* gpio-fan: Take fan_data->lock in gpio_fan_shutdown(), and fix
  use-after-free in alarm work

* ina2xx: Fix in0 and curr1 alarm handling, and acquire hwmon_lock in
  shunt_resistor_show()

* ltc4282: Fully initializeclk_init_data

* mcp9982: Propagate one-shot polling errors

* nct6694: Do not expose enable on DTIN temperature channels

* PMBus core: Clear generic status alarms with CLEAR_FAULTS

* sht4x: Fix return value from heater_enable_store(), and add missing locks

----------------------------------------------------------------
Ali Ahmet Memis (1):
      hwmon: (nct6694) do not expose enable on DTIN temperature channels

Antonin Godard (1):
      Documentation: hwmon: replace full-width colon by a standard ASCII colon

Arie Miller (2):
      hwmon: (asus_rog_ryujin) Validate HID report lengths
      hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

Cong Nguyen (2):
      hwmon: (applesmc) fix key backlight workqueue leak on register failure
      hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()

Fan Wu (1):
      hwmon: (gpio-fan) Fix use-after-free in alarm work

Geert Uytterhoeven (1):
      hwmon: (ltc4282) Make sure clk_init_data is fully initialized

Guenter Roeck (5):
      Documentation/hwmon: Document hwmon_notify_event()
      hwmon: Fix potential UAF in pec_store
      hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
      hwmon: (sht4x) Add missing locks
      hwmon: (sht4x) Fix return value from heater_enable_store()

Jared Kangas (4):
      hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
      hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
      hwmon: (ina2xx) Replace masks with enum in alert functions
      hwmon: (ina2xx) Decouple in0 and curr1 alarms

Javier Carrasco (1):
      hwmon: (chipcap2) fix channels in humidity alarm notifications

Linmao Li (2):
      hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
      hwmon: (corsair-cpro) Remove debugfs entries when probe fails

Nikhil Gurudasani (1):
      hwmon: (mcp9982) Propagate one-shot polling errors

Pengpeng Hou (1):
      hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors

Vishnu Razdan (1):
      hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS

hanzhijian (1):
      hwmon: (yogafan) fix non-kernel-doc comment

 Documentation/hwmon/gpd-fan.rst          |   2 +-
 Documentation/hwmon/hwmon-kernel-api.rst |  15 +++
 drivers/hwmon/applesmc.c                 |   7 +-
 drivers/hwmon/aspeed-pwm-tacho.c         |   4 +-
 drivers/hwmon/asus_rog_ryujin.c          |  30 +++++-
 drivers/hwmon/chipcap2.c                 |   9 +-
 drivers/hwmon/corsair-cpro.c             |  24 +++--
 drivers/hwmon/gpio-fan.c                 |  13 ++-
 drivers/hwmon/hwmon.c                    |  31 +++---
 drivers/hwmon/ina2xx.c                   | 163 ++++++++++++++++++++++++++-----
 drivers/hwmon/ltc4282.c                  |   2 +-
 drivers/hwmon/mcp9982.c                  |   2 +
 drivers/hwmon/nct6694-hwmon.c            |  35 ++++---
 drivers/hwmon/pmbus/pmbus_core.c         |   4 +-
 drivers/hwmon/sht4x.c                    |   8 +-
 drivers/hwmon/yogafan.c                  |   2 +-
 16 files changed, 267 insertions(+), 84 deletions(-)
