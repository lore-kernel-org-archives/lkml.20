Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025D39E196
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820989; cv=none; b=P/zBZTslo7NeLEGDp6rytYHhlawdOS8StCvj62ey9eaHfB7odBqfbjunSuxF7sO/PebOGvbbrVwD0AVshtQbIcyxlHryN1OWJ7mibVFDIQJnq6s57aIsfsHGDlUqo9VkHKBa9csRBD0hpt/vqkNNLVZQcBU8Yhpy3Dn7+X7vx5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820989; c=relaxed/simple;
	bh=YlRi0jvoGCP3epi2jzLBh73rR6rYvlrsGdFSllcGDEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnGz3StZRzg2qEXy7m+Kw/KCt7X/EvXog8qf6Re80GsHOKAEWYTdDQgoe0LpxsOZEI3HRFps063GFVmOBe4DN8Ex/nBXWJrRoyi7VzVi+QnYBh176oMUmoLYF2lgqFRxGlBUtalyIpGAZpbbOoUBvuNC2icstSz6pNjDgS6KssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsWuAMJP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsWuAMJP"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe433fso14016455ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820985; x=1790425785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Cz2gzGY048RFK6yaT1IK/Bb3cZA3GbpsU47/37Y+Pk=;
        b=fsWuAMJPgyiMBEVnBz6/PDqKbxnXYuOOqDRxYpazCKalFRSU1RZVvz4PS04HK+8aL/
         pvKsccrjxNGtZTvqK8r2tFUSnN5WXlnCzjnHK6GeF9z5XvOiToHY0k2QaMhrcdE6dvTX
         uR/Kw1pXNc0EHC478xzsfXM4hEfOJR2aE8SGssaszblbpedjipfVj/gZfReGiyXQ0v/i
         lwknjCsSlcnKjS+m2O/nCC5nMt0RNB3HPvKrquA+PEyOCSj1TG4YNsXKU8RWEAvTSCtF
         NpPvMO9KrpqMXmFMWBm+nyqSIgf/HfEx2jaCN/sh9A2bTOyX8UZB2i5jSZJC/vpk286L
         qY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820985; x=1790425785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Cz2gzGY048RFK6yaT1IK/Bb3cZA3GbpsU47/37Y+Pk=;
        b=XFb20uwOX4wsmxG0KFuTagQNS0pdQx8AAmlsNCCfDdCiwYZ+eQiA8ae6Oegy5Ga4x3
         q2qTtNBejmQeBE9bqCIylafC4ZyUO2UAw7GwWA0cEAm4m/RGWtPLelx5Q8tmB0cA6JjO
         PyFNEpY1+G2lHnIcqAXSw44kBQqwyCrvk1nwURiEDdckANBNTpDGb/i2VGFicXhY3xmA
         9ER6xJFQ0HHy/yvE7mBbD9wHlqF9ZB3E1B3oi5Rv+guMaXBfrqSS4ACVmJ2Qme8eWh9f
         fYa/TOs8/Lus70sdDoIQPsQ7TFFpiPtiqYyGkF2o2wmiCM6v0ldU+jRZq7J+BGtzLh71
         I2vg==
X-Forwarded-Encrypted: i=1; AKwUvByet22SMEOf+Tj8NdLIrcAusUELbIaIYPLCFjX72CyNg8xH9GByjeOeWLmhS8ijupxq+r5aRzfw6Zc4cL0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKxBDrdYIlt199iJ6XlvmioyuN9T56IVPCS1qtifeofRbmobt5
	fQif9NKO/MteQOvs/krKG7k8vcI9YKeKMHp8SCof5q19BXD8niiJN2yG
X-Gm-Gg: AYBFou3QUjzoWqA6XDiTbxwECNUZiEz+yliHwiaUQ+J5sHsr623LjGFVCOEG24b3iry
	+oiRsxAzsynBz7GkKqsTl3oJLTorYeGmKR9Fy2n5sIU5MQr1jK2g4HWMSIlBLe1uJdUgZmJ+iCa
	p3Myl1OLu7uFq3q5CHITRgIVUH1fPCGbkL4SpEONtIzeFjXs1jOSROQfhekSlC/DXys5O8gBOQ8
	B/fUYemXqXeCxojqcLDbx6w8SOq5kJiANqhHzmVrroIDESwH3gfdaoMP94OT1TFk8E7u7bgMZou
	uNwJImVNMM71y2wA7uec9LTGHLHUPD+73xc34x6kSlViBarDdmdIPAbxx0HdDjQkey9GhWryrjb
	12OhLrqM5i0JIIhN/Aslfc2QBY1Ru2FfJPNttdAoSCKpkxIKLXACGfFfUmtR94g3vZ6Z6tcdo9z
	B4UdpHHKvo/YMeh1eIoO3gMFLrR863VcYXbV4f7q3QFB8cn5y3ODqAnhpdbEIQMROS4s5p6BnJ9
	drhs0YHx7U=
X-Received: by 2002:a17:903:1a88:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2ddb16d6a6bmr103231325ad.0.1789820985169;
        Sat, 19 Sep 2026 05:29:45 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:43 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Sat, 19 Sep 2026 20:29:27 +0800
Message-ID: <20260919122930.1418-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Still an RFC: the patched kernel has not been booted on hardware (see
Testing), and the open questions from v1 about placement and naming are
unanswered.

v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v1, addressing the Sashiko review Lee Jones asked me to act on
--------------------------------------------------------------------------

* [Medium] "Acquiring 'power-hold' GPIOs after registering MFD child devices
  can cause probe deferral thrashing."

  Fixed, and the finding was correct. v1 claimed the array after
  devm_mfd_add_devices(), so a -EPROBE_DEFER from the GPIO provider would
  have unwound the regulators, RTC and clocks on every retry. v2 claims it
  before devm_regmap_add_irq_chip(), i.e. before anything is registered on
  the device: the property test is hoisted into a bool and reused for the
  sys-off registration further down, which is otherwise unchanged. A comment
  records why the acquisition has to stay there.

  Worth noting that this is exactly the part v1 disclosed as untested - the
  out-of-tree proxy used for the functional testing claims the GPIOs at
  module load, so it never exercises the probe path at all.

* [Low] "The commit message description violates the MFD subsystem formatting
  rules by using a lowercase letter."

  Fixed: "mfd: rk8xx: Release ...". The dt-bindings and arm64 dts subjects
  keep their own subsystems' lowercase convention.

* The binding now states that power-hold-gpios is only meaningful together
  with system-power-controller, which is what the driver implements. This is
  not expressed as a "dependencies" entry because the driver also accepts the
  deprecated rockchip,system-power-controller, and a dependency on one
  spelling would reject device trees using the other.

* checkpatch --strict alignment fix in the GPIO acquisition; no functional
  change.

The problem
-----------

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. U-Boot reports
the result as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, and describes GPIO1_B5 as the backlight enable GPIO,
although the vendor's own backlight node has no enable GPIO. Nothing
therefore releases either line at power-off.

What was established on the board is the sequence, not what happens inside
the PMIC: the shutdown sticks only when GPIO1_D0 goes from high to low
during power-off prepare, with GPIO1_B5 low, and the shutdown bit written
after a settle delay. Leaving GPIO1_B5 asserted makes the board come back
up even when GPIO1_D0 is released correctly, which is why the backlight
cannot keep that pin.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
the lines only have to be released and left released, and there are two of
them.

rk3188-bqedison2qc.dts does drive a pwr_hold pin from gpio-poweroff, which
works there because pulling that line low is by itself enough to cut the
power. That is not the case here - driving a line low at runtime, with no
PMIC access at all, left this board running for the 10 s it was observed.

Open questions (unchanged from v1)
----------------------------------

1. Does this belong in the PMIC driver at all, rather than a small separate
   driver registering at POWER_OFF_PREPARE with a higher priority?
2. Should the property be rockchip,power-hold-gpios? The vendor DT calls
   these pins pmic,stby-gpio and pmic,hold-gpio.
3. Should the DT also carry a pinctrl group for the pins, as the vendor does?
4. Dropping the backlight enable-gpios is required for the sequence to work,
   but nobody here has the schematic to confirm that property was wrong to
   begin with.

Testing
-------

Tested on a Firefly-RK3399 (4 GB, RK808), shutdown captured on the debug
UART at 1500000 8N1. A run counts as "stayed off" only if the console
produced nothing for 150 s and there was no ICMP reply and no USB gadget
afterwards.

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on the
test system and a full kernel build does not fit on it. The series compiles
(aarch64, W=1, no warnings), checkpatch --strict is clean, dt_binding_check
passes, and dtbs_check reports only the pre-existing usb2phy diagnostics for
this board, reproduced unchanged on the unpatched tree.

The functional evidence comes from an out-of-tree module using the same
gpiod array consumer name, the same GPIOD_OUT_HIGH, the same per-descriptor
gpiod_set_value_cansleep() loop and the same msleep() as this series,
against a device tree carrying exactly these properties, registered at
POWER_OFF_PREPARE with SYS_OFF_PRIO_HIGH + 1. It does not exercise the probe
path, so the v2 reordering above is not covered by it.

Every run started from a cold boot with both pins at their reset state
(inputs, low), verified by reading the GPIO registers beforehand:

  both lines, as in this series:            3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 left high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

On this particular board pwm-backlight does not bind, so GPIO1_B5 stays an
input and describing GPIO1_D0 alone was enough here. That is not true in
general, which is why both lines are described and the backlight property is
dropped.

The 200 ms is the value the vendor uses; the threshold was not characterised.
The msleep() was measured at 200 to 201 ms on the console timestamps.


This series was prepared with AI assistance (Claude); the analysis and
the measurements on the board were reviewed by the author.

Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  4 +-
 drivers/mfd/rk8xx-core.c                      | 47 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  4 ++
 4 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.55.0.windows.3

