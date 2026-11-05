Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852160;
	b=0Gx8ubEvAmoBT6F9W4ZEzYn8udxak8DewV66EqY7CChv7gNrn14dskvPYJXDT7HqFfII
	 LMWT6HRmkw4nmY7w6akkNPJIeNms/c6GuJ5VuI+kVv2Uso/BxC8hueBNRnQ8n5GNZ7HqO
	 D8xrcuVKP4IWEHylgcYewUjpjDy7byrngmuEPmGIreOLtQ2uwUphV5rECOTITYehGXxMA
	 YkdTsmEM4qvdADSeJr9jz3UH3poKl4q+32DHxVWDEEoArXQUKRHlRIFgAUp23UsOz4FoX
	 Hfxg7vFZWyIfdpZynUWhYNDww8dOjLK49gikxw77ifPhlz7usmQshNU6XuVrMZlxpzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852160;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=dNQLnnz11qHKvLiS1T9tl3SzeapcPq8bf9vbdgRsqKI=;
	b=A/bvGBashnjyg39oSvPbBXoNDM82EXG8AI2quzcxvls1kPVi9pQvmCu8MzHzwiFRtLBq
	 Bkpt2ZpSVhBaeZZP3LE/xA/jY86SqzkE2/mq4DTcwk1Y1RhSzHJMWJJdj1aQ3+6Uizb61
	 +FkjvyOp4yaSjGR4+kdHRPJCxuDq3n3i3jsaHsh30U7E8XTT1YKndCEm3uek2jO63b06k
	 kOag6qSlHbKuHsuCVn+34orgvKvWGMLJi+yfJY4APsIvq54wqa5lO3Uf/DndL5bP0Yada
	 2aSlSWuNBCfAwNJc/5/k4Uhxgk5WkYaww8M58Y4ebLTIG0z0n4EB6qr+ZQTRWYukUiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MTzU+TkN;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC85606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC85606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MTzU+TkN
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id OiGAxtxfzyb4YOotLxEgvc; Thu, 05 Nov 2026 04:15:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OotLxiNjM3MEFOotLxM7d1; Thu, 05 Nov 2026 04:15:59 +0000
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=6aec02ff
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=vPC9aCB5EIUscj87Q6QA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dNQLnnz11qHKvLiS1T9tl3SzeapcPq8bf9vbdgRsqKI=; b=MTzU+TkNFfkqncdtvu/PbpH/he
	RQrM8hgY60rxNgTV/fctkNhAWZzJebHA75Zg/ibgKci15h+AmAuwuQnNxoUOf8x2z1P4OPhNZkyy6
	0FUkExMQJ9K1/pvDGbFVWLwsU6DCseDO+CF2A+az0C0YRzD55+M+IOB4csyVJjB0oP1ocGLYMPWwl
	E36pvtH6LKl5MHmFq2oWjAfdtgarYJ2NSCY39MQm1vSYoVVYJGn3bFoWuzfhqC7bHKtphoMyBySdB
	Kmg/Vo1myxqaNh/bI7dmf3A2lafniyt9JX54bTXrDcEd1cD2DxSm/R0pJsZQZoYMDayJ7iB2L1PR4
	lD6PH/jQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51402 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOotK-00000004Do8-3nFP;
	Thu, 05 Nov 2026 09:45:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc2
Date: Wed,  4 Nov 2026 20:15:58 -0800
Message-ID: <20261105041558.3259881-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOotK-00000004Do8-3nFP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51402
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFQgJSBF8GnrF2cKdJ0Bn4nwpBR9wIdiC8kHk9GMMzjWhQZl8Bj8PBCQwRLM8ObnMDNb+dEq+yV1MyuNt7VsduZNKOJu5BejHPkVaiYh7ufNO9wdQuVW
 Ao2Vbk6kPxI0NpYzzbNpczlA0uMUBmvz2v4TvYivSh2cRif7ZPyRWXXa/3TofTBSuLsBfpwHuMU26auAxQ/thk7KyK9Izx4Eh3LS2o8VeaIOOVTByvg4ktIM

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc2

Thanks,
Guenter
------

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc2

for you to fetch changes up to e395bbf3ddf1b3175fd3bddaead63a2909b33694:

  hwmon: (asus_rog_ryujin) Fix timeout when reading 0% duty cycle (2026-11-04 06:43:35 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc2

* acpi_power_meter: Check for 32-bit and 64-bit unknown ACPI values,
  Fix missing locking in sysfs show callbacks and resume, and Prevent
  spurious power alarm when power is unknown

* aquacomputer_d5next: Avoid truncating scaled sensor readings, Check
  maxcollection when probing AQUAERO devices, and reject short status
  reports

* asus_rog_ryujin: Fix pump control source on the Ryujin III, and Fix
  timeout when reading 0% duty cycle

* asus_wmi_sensors: Avoid global struct mutation

* chipcap2: Series of fixes addressing various bugs in the driver

* coretemp: Check for NULL platform device in hotplug callbacks,
  Fix 32-bit jiffies wraparound in show_temp() hnd Set nr_cores only
  after core_data allocation succeeds

* corsair-cpro: Cache fan target only after a successful command

* gpd-fan: Reset both fans to automatic on duo boards, and
  Update the speed cache before dropping the PM reference

* hp-wmi-sensors: Avoid global struct mutation, Fix unbounded loops in
  scale_numeric_sensor(), and Serialize alarm flag read-and-clear with
  state->lock

* lm75: Fix setting polarity mask for chips with 16-bit config register

* lm87: Fix drvdata type confusion in vrm_show() and vrm_store()

* nct6683: Fix incorrect struct cast in show_pwm() and store_pwm()

* peci/dimmtemp: Fix devres leak and UAF on concurrent unbind

* pmbus core: Check return value from pmbus_thermal_add_sensor(),
  Register the thermal sensors with a 0-based index, and Fix return value
  check from thermal zone registration, and release devres allocated memory
  after devm_thermal_of_zone_register error

* pmbus/q54sj108a2: Add missing NULL pointer check

* sht15: Stop deferred work before releasing its resources

* sht4x: Convert update_interval to jiffies in pending data check

* tmp108: Fix initial conversion delay and wait until ready

----------------------------------------------------------------
Alexei Solcanu (1):
      hwmon: (gpd-fan) Reset both fans to automatic on duo boards

Baek Kyu, Kim (2):
      hwmon: (corsair-cpro) Cache fan target only after a successful command
      hwmon: (gpio-fan) Update the speed cache before dropping the PM reference

Guenter Roeck (22):
      hwmon: (aquacomputer_d5next) Check maxcollection when probing AQUAERO devices
      hwmon: (asus_wmi_sensors) Avoid global struct mutation
      hwmon: (hp-wmi-sensors) Avoid global struct mutation
      hwmon: (hp-wmi-sensors) Fix unbounded loops in scale_numeric_sensor()
      hwmon: (lm87) Fix drvdata type confusion in vrm_show() and vrm_store()
      hwmon: (nct6683) Fix incorrect struct cast in show_pwm() and store_pwm()
      hwmon: (peci/dimmtemp) Fix devres leak and UAF on concurrent unbind
      hwmon: (pmbus/q54sj108a2) Add missing NULL pointer check
      hwmon: (pmbus) Check return value from pmbus_thermal_add_sensor()
      hwmon: (pmbus) Release devres allocated memory after devm_thermal_of_zone_register error
      hwmon: (pmbus) Fix return value check from thermal zone registration
      hwmon: (lm75) Fix setting polarity mask for chips with 16-bit config register
      hwmon: (tmp108) Fix initial conversion delay and wait until ready
      hwmon: (coretemp) Check for NULL platform device in hotplug callbacks
      hwmon: (coretemp) Set nr_cores only after core_data allocation succeeds
      hwmon: (coretemp) Fix 32-bit jiffies wraparound in show_temp()
      hwmon: (sht4x) Convert update_interval to jiffies in pending data check
      hwmon: (acpi_power_meter) Fix missing locking in sysfs show callbacks and resume
      hwmon: (acpi_power_meter) Prevent spurious power alarm when power is unknown
      hwmon: (acpi_power_meter) Check for 32-bit and 64-bit unknown ACPI values
      hwmon: (hp-wmi-sensors) Serialize alarm flag read-and-clear with state->lock
      hwmon: (asus_rog_ryujin) Fix timeout when reading 0% duty cycle

Javier Carrasco (11):
      hwmon: chipcap2: fix command error diagnostics
      hwmon: chipcap2: fix off-by-one in command mode retry loop
      hwmon: chipcap2: fix be16 handling
      hwmon: chipcap2: defer probe when IRQs are unavailable
      hwmon: chipcap2: fix IRQ teardown ordering
      hwmon: chipcap2: disable device after hwmon teardown
      hwmon: chipcap2: enable IRQ processing when regulator is already enabled
      hwmon: chipcap2: balance regulator state
      hwmon: chipcap2: do not discard pending alarms on disable
      hwmon: chipcap2: serialize access to the alarm indicators
      hwmon: chipcap2: synchronize ready IRQ state

Jiale Yao (1):
      hwmon: (aquacomputer_d5next) reject short status reports

Myeonghun Pak (1):
      hwmon: (sht15) Stop deferred work before releasing its resources

Vas Zayarskiy (1):
      hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings

Vincent Jardin (1):
      hwmon: (pmbus/core) Register the thermal sensors with a 0-based index

Zac Lanzon (1):
      hwmon: (asus_rog_ryujin) Fix pump control source on the Ryujin III

 Documentation/hwmon/asus_rog_ryujin.rst |   6 +
 drivers/hwmon/acpi_power_meter.c        | 100 +++++++++++-----
 drivers/hwmon/aquacomputer_d5next.c     |  58 ++++++++--
 drivers/hwmon/asus_rog_ryujin.c         |  81 ++++++++++++-
 drivers/hwmon/asus_wmi_sensors.c        |  13 +--
 drivers/hwmon/chipcap2.c                | 196 +++++++++++++++++++++-----------
 drivers/hwmon/coretemp.c                |  26 +++--
 drivers/hwmon/corsair-cpro.c            |   3 +-
 drivers/hwmon/gpd-fan.c                 |   1 +
 drivers/hwmon/gpio-fan.c                |   7 +-
 drivers/hwmon/hp-wmi-sensors.c          |  31 ++---
 drivers/hwmon/lm75.c                    |   9 +-
 drivers/hwmon/lm87.c                    |   7 +-
 drivers/hwmon/nct6683.c                 |   4 +-
 drivers/hwmon/peci/dimmtemp.c           |  21 ++--
 drivers/hwmon/pmbus/pmbus_core.c        |  58 ++++++----
 drivers/hwmon/pmbus/q54sj108a2.c        |   2 +
 drivers/hwmon/sht15.c                   |  22 ++--
 drivers/hwmon/sht4x.c                   |   4 +-
 drivers/hwmon/tmp108.c                  |  26 ++---
 20 files changed, 465 insertions(+), 210 deletions(-)
