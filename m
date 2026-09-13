Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11AC346E7A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335191; cv=none; b=qmL6lgIae37QwwCuNS20khNYpKBf9Dce1CLPDAOKyzcs1DcKijr0m0SWeoCBRuXbcNMA8JGooJgXaxwW4uIoZOfEqhEl+jmGJKuWiwrxtJMtfxx/eG855+qe9A+ZzwqtW0/jhVAjbNLF3oI2qm4l3TOX7GQuCAdeQ/gFabrilw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335191; c=relaxed/simple;
	bh=pKn6vaUMs8Y+A/rVNl4YVJh6pdyyXU6niI0583tegEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cqTbWCY5V6NH9kukv5pdqkwRSnjlfsdIn4YjAtkWZ6WchwYUddbh1uOsEX8lFFzMbJcY9rF8okBwPSsZcwHMB2MRsRF67xzkvSjLbA27tiW8QVRHEB3/1VOxvD+gVV1B+zqC48vWnyn5O5QaqHlcQ53Yobvxxuns3xWU/E/bSOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFhsIAOW; arc=none smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFhsIAOW"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c29390fa872so166119466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789335188; x=1789939988; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z1PnoWsODXQvYPLr1ED03ruqbkvQeTZodzqZ43PJOV0=;
        b=IFhsIAOWNMMzJD1V6h78rymwgrfLqmNy2NSzLqb6/xiE5mCr5DepmZEBO0S3v43ios
         gpUtpMWfkp3DNpZnFa+b2uzdIz1y6m+XvXmWzleB72XX9m636dAuM1oghdoaOD4tbivI
         CYzOxmPQsC+KdVabKS0Rfil/rP9o/vfOqMRK6uFUDj4dXrvuVLvB9haXAhVP8hIDnl6k
         ci7O9/fZ44IuQR6EHZPu5S4UqEjCd7+rmNfudIbKvkjfM8/Y9rxMbN8ZqGEUZFhYolwo
         5o08zbjpdsVZRGasoaupVoY8ESDuIg7Exey0DEYcJkAMi6qAZXhXYJnpkCfZ7xuQsQsl
         fz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335188; x=1789939988;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z1PnoWsODXQvYPLr1ED03ruqbkvQeTZodzqZ43PJOV0=;
        b=d5+cKEHCJp4VgksOa1dJN1ZbhIOZPCFTC12WJ3QHSD17fhA2wsanthYs5kpIDqDh/T
         VsLhsG5GyVCj9DqxxQiUsLBNyIgTvJhwp/MYQURBt/mDdrv6p10feWw3zNUd+stV2xGk
         hqIsDBLCZt5tg5CDrbbKn81fS8sdQ1BL1jhS1fHh7bHmJhGOAMSyaI43EIzIKjqbNznE
         zPW/O95yJoy7lwq3+6pyedU34GS0YpKB+BU0ShvUl65qglFiceCSwVLH+DAD/rR/JTax
         vmQ/0px4/wI1xb/1uUzYG2mw4rl+1ADVMeg97H0gv64GmBcYZtMKZBXC4d6dPDj/Uup7
         QVTg==
X-Gm-Message-State: AFuF++kVZoMx9JeBXFJlNn5lNy5AGaYNQzoKagPpllK7wVb2kIZy+5py
	2UOwyX76ZYOYvr9qsY+UBBNMrZ8K5hShoOymBm7d0+CryL9c5NVX2jBj
X-Gm-Gg: AYBFou0vn9Ko5Ik+X2AAEU7xwEyFKmxXmUWiTXzjr/E/ktDGMG624zQ/nmhlLdCZSld
	ylzTorSxMZKQQ+z9QOiJj3+/505/HYb+iUMAA3tA0DOM9brF9hUpi+I94Q/AFDtK1cAfp5xdUQ6
	suNMCMlOpXfE1vIbv4Kak+MAVip308RzafMu84akokPAIMXVwVuWAxSCfb2FF7oUEVBGRQ90uOd
	vxGOkBynzXIDcsPmuMnWhlQD2WrmxoeyaosORut+OjC1kDQM/wu9Mby2kcuHTIktzR4MvJUOO7M
	6zIfg0Er8qZWmBMTdN+RPSmB58XQFDIFGI1QwE1XFqbsG/77bW1nKOR6lTfeQEoyIE/6H7X/1pT
	hhpDHNbXsUnj+RxX1OhUTHxTvU3O1shIyMm5tnJHEV+5Q6+WcxKxhN5tZVfVeOQF2hGVvFuSGpx
	lrZ4aKqETz2AEkjcziMV/gruSe4AJTL2Y9eghWlH/qd/YDaue7NSnsEVmw+5GWlFNpez/aAPi35
	wkK
X-Received: by 2002:a17:907:ea8b:b0:c29:3711:626f with SMTP id a640c23a62f3a-c29858b20b6mr419962366b.24.1789335187705;
        Sun, 13 Sep 2026 14:33:07 -0700 (PDT)
Received: from localhost ([2a0d:3341:c720:cc08:52a7:c797:d380:f4c3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm335700766b.12.2026.09.13.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:33:07 -0700 (PDT)
From: chiffa <chiffathefoxx@gmail.com>
Date: Mon, 14 Sep 2026 00:32:51 +0300
Subject: [PATCH] mfd: max77705: Mark PASS2 revision as supported
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IomnQq4iLqJN2CtWQURHEu
 5u2y7f4/wShxCTQFick2ll4mTN0WcD48vOTkKdsMMo8VKMr/PjDOacsRi9iULYYl7TShLWyVg8
 mBKcD5DwmCnz81l3/t2zDm8b1+4PrugFqgUikfAAAAA==
X-Change-ID: 20260913-max77705-pass2-supported-40551b2ff71f
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 chiffa <chiffathefoxx@gmail.com>
X-Mailer: b4 0.16.0

The existing driver takes a safe approach and only probes on tested
MAX77705 revisions. The only tested revision at the time was
PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
devices.

Testing on the S10 and S10+ shows the driver operates correctly on
PASS2: interrupts are registered and fire, bind and unbind release the
I2C device cleanly, and the charger and fuel gauge report plausible
values, charging the battery to the same voltage as the vendor kernel,
haptic feedback works.

Replace the single-revision equality test with a bitmask of supported
revisions so that further revisions can be added as they are tested.
A bitmask is fine here since the revision bitfield is only 3 bits wide
(maximum value of 7) and is always AND'ed by MAX77705_REVISION_MASK
before matching the revisions.

Link: https://lore.kernel.org/all/20251023131732.GN475031@google.com/
Signed-off-by: chiffa <chiffathefoxx@gmail.com>
---
Take into account the discussion that Lee Jones <lee@kernel.org> and
Eric Gonçalves <ghatto404@gmail.com> had in
[https://lore.kernel.org/all/20251023131732.GN475031@google.com/] by
adding a MAX77705_SUPPORTED_REVISIONS define with a bitmask of all
tested revisions.

The base commit is from the for-mfd-next branch in
[git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git].

# Test Results
Second revision MAX77705 can be found on Exynos 9820 devices, such as
Samsung Galaxy S10/S10+/S10e. Eric mentioned that S22 also features this
revision, but I don't have it at hand to verify. My tests cover S10
and S10+ devices. The tests should be exhaustive and prove the
driver is operating correctly. Please let me know if there are other
tests I can run to make sure everything is ok.

## Device Tree
DT nodes relevant to the MAX77705 driver that I used for testing can be
found in my private u-boot tree:
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L184]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L15]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond1lte.dts#L35]
- [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond2lte.dts#L35]

## Interrupts
Interrupts are correctly registered and fire on both devices:
```
/home/user # grep -i max /proc/interrupts
  97:        687          0          0          0          0          0          0          0  gpa1                6 Level     max77705
  98:          0          0          0          0          0          4          0          0  max77705            0 Edge      max77705-charger
  99:          0          0          0          0          0          2          0          0  max77705-charger    6 Edge      chgin-irq
 100:          0          0          0          0          0          2          0          0  max77705-charger    7 Edge      aicl-irq
 110:          0          0          0          0          0        683          0          0  max77705            2 Edge      max170xx_battery
```

## Bind/unbind
The driver correctly binds and unbinds. I can communicate with the
device after unbinding the driver, so it's releasing the i2c correctly:
```
/home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/unbind
/home/user # i2cget -y 1 0x66 0x00
0x15
/home/user # i2cget -y 1 0x66 0x01
0x02
/home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/bind
[ 1481.988830] max77705-rgb: Failed to locate of_node [id: -1]
[ 1481.989191] max77705-charger: Failed to locate of_node [id: -1]
[ 1481.989549] platform max77705-haptic: DMA mask not set
[ 1481.990762] input: max77693-haptic as /devices/platform/soc@0/15d600c0.usi/15d60000.i2c/i2c-1/1-0066/max77705-haptic/input/input2
```

## Sensors
Sensors report realistic values when charging/discharging. Temperature
sensors are broken. On S10 battery temperature is always reported as
-20 deg Celsius, and on S10+ it sometimes changes when I reboot into an
Android kernel. Seems like downstream kernel is the one responsible for writing
the temperature measurements into that register, but it doesn't happen for me
on my S10. Downstream kernel is reporting the same temperature as
mainline for both devices.

S10:
```
/home/user # sensors max77705-isa-0000 max170xx_battery-isa-0000
max77705-isa-0000
Adapter: ISA adapter
VBYP_REG:      4.58 V
VSYS_REG:      4.29 V
IIN_REG:     466.00 mA
ISYS_REG:    233.00 mA (avg =  +0.25 A)

max170xx_battery-isa-0000
Adapter: ISA adapter
in0:           4.28 V  (min =  +3.00 V, max =  +4.26 V)
                       (avg =  +4.28 V)
ERROR: Can't get value of subfeature temp1_min: Can't read
ERROR: Can't get value of subfeature temp1_max: Can't read
temp:         -20.0°C  (low  =  +0.0°C, high =  +0.0°C)  ALARM (LOW, HIGH)
curr1:       253.00 mA (avg =  +0.24 A)

/home/user # cat /sys/class/hwmon/hwmon1/device/status
Charging
```

S10+:
```
/home/user # upower -d
Device: /org/freedesktop/UPower/devices/battery_max170xx_battery
  native-path:          max170xx_battery
  power supply:         yes
  updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               charging
    warning-level:       none
    energy:              7.84905 Wh
    energy-empty:        0 Wh
    energy-full:         9.85235 Wh
    energy-full-design:  13.2593 Wh
    voltage-min-design:  3.35 V
    energy-rate:         0.474233 W
    voltage:             4.10625 V
    charge-cycles:       150
    time to full:        4.2 hours
    percentage:          74%
    temperature:         30.8 degrees C
    capacity:            74.3052%
    technology:          lithium-ion
    icon-name:          'battery-full-charging-symbolic'
  History (rate):
    1788563923	0.474	charging
    1788563893	0.352	charging
    1788563863	0.983	discharging

Device: /org/freedesktop/UPower/devices/line_power_max77705_charger
  native-path:          max77705-charger
  power supply:         yes
  updated:              Fri Sep  4 21:24:00 2026 (6910 seconds ago)
  has history:          no
  has statistics:       no
  line-power
    warning-level:       none
    online:              yes
    icon-name:          'ac-adapter-symbolic'

Device: /org/freedesktop/UPower/devices/DisplayDevice
  power supply:         yes
  updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
  has history:          no
  has statistics:       no
  battery
    present:             yes
    state:               charging
    warning-level:       none
    energy:              7.84905 Wh
    energy-full:         9.85235 Wh
    energy-rate:         0.474233 W
    charge-cycles:       N/A
    time to full:        4.2 hours
    percentage:          74%
    icon-name:          'battery-full-charging-symbolic'

Daemon:
  daemon-version:  1.91.0
  on-battery:      no
  lid-is-closed:   no
  lid-is-present:  no
  critical-action: PowerOff
```

## Charging
Mainline driver charges the battery to the same voltage as downstream,
which happens to be 4333 mV on my S10+.
When charging wirelessly, the device accepts charge, and sensors
correctly report the charge current, but the driver reports battery
state as 'Discharging'.
Since the driver doesn't support Fast Charging, charging wirelessly is
faster than using a cable.
---
 drivers/mfd/max77705.c               | 2 +-
 include/linux/mfd/max77705-private.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index e98c76d6b699..6cc65ca53f24 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -105,7 +105,7 @@ static int max77705_i2c_probe(struct i2c_client *i2c)
 		return -ENODEV;
 
 	pmic_rev = pmic_rev_value & MAX77705_REVISION_MASK;
-	if (pmic_rev != MAX77705_PASS3)
+	if (!(BIT(pmic_rev) & MAX77705_SUPPORTED_REVISIONS))
 		return dev_err_probe(dev, -ENODEV, "Rev.0x%x is not tested\n", pmic_rev);
 
 	/* Active Discharge Enable */
diff --git a/include/linux/mfd/max77705-private.h b/include/linux/mfd/max77705-private.h
index 214de7feeb8c..a7ff045bb78e 100644
--- a/include/linux/mfd/max77705-private.h
+++ b/include/linux/mfd/max77705-private.h
@@ -57,6 +57,8 @@ enum max77705_hw_rev {
 	MAX77705_PASS3
 };
 
+#define MAX77705_SUPPORTED_REVISIONS (BIT(MAX77705_PASS2) | BIT(MAX77705_PASS3))
+
 enum max77705_reg {
 	MAX77705_PMIC_REG_PMICID1		= 0x00,
 	MAX77705_PMIC_REG_PMICREV		= 0x01,

---
base-commit: 5a5f978cf3cd2f50b9e123f851f5c6577519ee89
change-id: 20260913-max77705-pass2-supported-40551b2ff71f

Best regards,
--  
chiffa <chiffathefoxx@gmail.com>

