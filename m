Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090F54DAF0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872746; cv=none; b=c6+4LcVs7HQvfDSNLVR2wJ8uhdelbx5CPHA44w8jFHIuWtuqTCdrw3ugoUJTlyEXKn9tc2aFljm8BcX7VfWU8bvRN3RQfkm4d/9VilXMsw7R9x9JnVOXNmjU6TbHBp9c32aITwYdyhIhav/qjy1wJQHcCru52XuIWswCCxmR9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872746; c=relaxed/simple;
	bh=ZhtLn3TWqOvp5v2Vg1A7U7kOpXy03Q7QCNFETA327lU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dhkFZCcSOHAP0YJJu7L/7sxV0DwU5qTCqk+DabrklZvlfkyabmgCg1C67bbjnaQjuQLMSOkd403tL4BuWXPS547MAYD3nH1GNrxMBF8COm8tTkj+B0QF1X2FGuOohcW0+sa6YhHZziM0/BDOLgcvgV4rJmG061dskto6E9bsg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bmKghT1t; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bmKghT1t"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48586861639so3037320f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872742; x=1789477542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=bmKghT1t7a5gYveq5B6dATCh2XOahAbz8ZyR8KmKA96ChhTIjCQKYRnc0YWeF7ssAM
         Z2dTi9GYiam2aqWEuFXUHY1DNmKG/Lwn4+CYnfaKYziYXUFYdTLnsNTTmpuMSNEoV9Ys
         c/sYwgGwpHGcrrKcHtZg2xNjsLO7fmCfe5SHulTqT0QUgkRPa9BZFgoSNEysAGIFUuzt
         7G41BLhngUOSMjcXDBv7EeT8dzH3e/V/EXFEMsfaMxyIPlvyxgbuUCYGJcffToXhySPo
         x2htp2o08kbyPyiiDRpoiCbugtbK4sHDN/dfICNmwYhtnsHjbQExaYEUSuqEcc5mXNUl
         o02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872742; x=1789477542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=Io7g6OCgBf+ZCLN+UKmyxwuzbwO6X6sIeG6O2dC5ce4NRmPWIthQ02D6Klo0NRgLOj
         IyGWwTQ2ZjKM0jvpmH/hU/oL0lYAAPJF2LVqPNC7p6rXnB7t32bYggNVFCE4NUAVV/XT
         pBVbCIaDtrfdGi5Iuwxh3t0PWiNd5oCFg+lW+Yb0CuQ733ui6vx2+pNrkGsbz/BDgMwH
         xM7R1oo1l1y2O1+nwZ3PyFCGjyEJBtXE60bmEH16vIsPoIVk8HBN5flETCc60elnmseY
         OrSzsc+oyZDYw4oK2aEBa2ydunQokGCKPUzai56dqxUMorPq7BFxikkjlVZw8jcTERbT
         o3tQ==
X-Forwarded-Encrypted: i=1; AKwUvByJlXrUiBV5E3MfxuvvuNPZiTHGmeSG82kYN+Gwp9Wjyd4w5XVos0urSIsQgQq9C/vy+ZDWn231q/9Nu/g=@vger.kernel.org
X-Gm-Message-State: AFuF++nNLTFhnWApo6Z59XskbJ6f59tO+GYbc90msaeEqKlGLBiQLtMo
	sei8zN4vF+D7FtJD242Fli8hTn0RpNiDBtpRC3n+kZN5uYuv35q+M9CW9gGbP27bRW0=
X-Gm-Gg: AYBFou3s9B2fE8yTnGblZqPz4lCTOvWxGQopC4MMz1V7WtAIVPefcWQur1LJ3UYj2ba
	ktd9vGLQm0LdkwVZailymXGvTI6YoDHd1tyFvdjbFFxpYWSFe7lJMLlog7/3YUN+X3xGlM0BBUw
	tgNkAs8H3gljj+WciuGCADcypIwIeayrZ+u94bukd7HfP/eRvgmUiNkqv1+emKo5ljeZ71EQYAG
	VMQK3SYj5CzaGJXHbpqjbjbl0FfQ6dJkII9iucgXyPuy/Vue57NXHxZm4d5gcBeNmHe1Z0GRoId
	tfRc1z+QHPgfTgEmxlSAWVygmxxguawTCOItC2pwVgJGY6ccKUz5StrxlUKZnTqm6LS9UbFrAmA
	w7wrp+4EIzo/DVNfPCmTIoHruoS3xCndqOReqKTCSYbenEMQOOrpBaRgqgVuKJDtpU0jIQQSuom
	2skZK3g25X38sPtSBilZjyrLjv9kffJY1IOZ08UJnYtfinaacpx0t2vUJm6Jk=
X-Received: by 2002:a05:6000:603:b0:485:a517:6287 with SMTP id ffacd0b85a97d-485a5176ca9mr4823534f8f.17.1788872742207;
        Tue, 08 Sep 2026 06:05:42 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm27618899f8f.15.2026.09.08.06.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v8 0/3] Add RP1 PWM controller support
Date: Tue,  8 Sep 2026 15:09:11 +0200
Message-ID: <cover.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver via
a function. A subsequent patch will add a new device and driver
to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V8:

- rebased on v7.3-rc1
- dropped the syscon. As a result, reintroduce the .remove
  callback
- dropped the reference to syscon in the bindings description
- Kconfig: the driver no longer depends on MFD_SYSCON
- added a new header file to export the function prototype to
  read the fan speed
- added the exported rp1_pwm_read_tachometer() function to
  obtain the RPM
- dropped a now unused local variable in the probe function
- link to v7: https://lore.kernel.org/all/cover.1784539788.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   8 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 452 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 +
 7 files changed, 558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3

