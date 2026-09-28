Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D074DB54D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606351; cv=none; b=aULsP2YjZfgOAiFiSrAMHn/TWGXKIRN3ZE0HP2zzgLMVM1lZTk1Jjc+sNoPhG3YMaeHwdg0pMrqZkK6pHcXFrzrZBwzNn36wLtm9j7XV95tZm9hBTUXT5K7O3fk1njPYtUh1dfC93myYKopgdHwyulv1rdsZ/enNY8ETVaRUPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606351; c=relaxed/simple;
	bh=yzaQoMK7OpMmVpyo12PL8FGsA8XQ/70qtYYwV1q1/bE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rxdZ6C91JTcDoQYKcjqIGftV+txDbRNb8QOdoIfWmvubZKMXETSfB1HoTLCebd8yBGGbvSi5yuFrBzmlgE+B/EVmbFz1bem8f7RFdzzuDn61xqvGfpSxQzHdjWJLjoTJVTLqP8esMx/UdWi8IulodQbq5n/wG4Kh4kYiu0N/Dgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TzGi60nJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TzGi60nJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso14204925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606341; x=1791211141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=TzGi60nJJAeKEAl3NvWH1kuxg9APE4LRYdNFtfGJz4c4Rsrav8kNps+S5qXgeLnXx+
         IAfYALSzTV5V9nd9wkarDVnr+WC6j0aanuMi8qIZf/wmxXzmHok2gGKfHHWiRkoMaqS5
         Tbdctam3Wx1IsWWF5/+wzlPMR+3sviq1C394Q5idVfg6qbQqAg9OVBcHu2X2NyECmtWN
         RkhxRkXwt5WTAy9X2E8dnm/bDbaGggj7nopIymbf9CuIhd3V3xmMxRx5scGfyPEjMfPs
         QIC/Ge8aT8vVm160XxE579ik4SHMS4z1EuMMU8xooSnS/mPrnP5ZRRTBtq4sxKfOHDLw
         IAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606341; x=1791211141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=xB58QsmRddQ123eXzLQY4aAFMeEL1HdTqUrSa3cHIpxIIhsbxwNqRxc2ekoaaP0/tg
         bZZW1I7xTovCMMxQN0UR1qypoXORme632qtR0BRXW8JkTX2uxRNp0hguqJBCv614Jtts
         9Q7GoW7hrI4ZbkyIa6v9hVMIe+xwLCMTuvGmOHi9pwMhfD8lBs6kgKQ2Bm6Dtdr9TQPZ
         O8hCGuRnQbax4WQQzb3I0RSnUwvnrPWbbc3egI4hdxdpuzJYGvEqDK06RDvVJWHfLCkC
         pE2eH83geLB1i+2PomYFudoxjiSq6fuivjpqeDM38+Sv4LMqRn6BCUn6qojFkA7axtSk
         jNPw==
X-Forwarded-Encrypted: i=1; AKwUvBx7TGrYqC/Re/qkzYo52GcnWdO4xEQfP8svU0TJ4duuoPgrV7RlG5h2CWbNgyZfjh4Y3l4nRI6LcurKtXA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWlVyw9eUEMqc/nA/4XM69/TrrgcmAOSk1wKXaUeui9kkBnwSk
	Plfbt9nf3AnUmRw9Ki5Vcxxp1snwVSJbsWDwsOr9BKdN19UniLc1x6IsXHrwrrw7IDg=
X-Gm-Gg: AYBFou3A2An6rKc7kkpPQyd+vz0R7PTXHAxPjDqvGddf2ltsvF3qnnOmfC6Jo5Zxfmq
	FoMV2U+5cE7T/Lxwb4AgyZk7p1x1dkRG590v0FKJh4d66W399p8suMTnKqgojyaG5vi91+rf3Rk
	tC1mGF5xJk4wF0R7EQKdxj3xcQKaUCxQQ4Xz/kHme4XBZFZ0sq8MmI0dhuGklIbjNnqiiu7RuAy
	tQmMfadoh7nF/KmSfFPKWoVYv1XdkN/mxMR2l6TP7hpG3OsL7HqwBfqN1CtJqdAFlIPCo31cXog
	BEu7KwIa5kvxvVfggQdlwMTPFBE4hICL8DWMNAV9A1nn3mxKxd5ZjHS+S63yN1eU29ROSBQCK49
	UzhzN0yt5F5HL8Ry/Cm9pCRzhV7LYpoKmiyfuwDtGuAvnMB8pvrdWXRArP5ingiDA+D50WdzZFW
	v2Ic1k1BbjNq8lqMqxNyIhXxDyJ/v8OQ1NAz9+MegRDiGajiw/oP3+fyGdGJEGb4YwNomhBE8pc
	vXK5Ynn
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr222403935e9.20.1790606341440;
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm141007155e9.14.2026.09.28.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
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
Subject: [PATCH v11 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 16:42:39 +0200
Message-ID: <cover.1790606188.git.andrea.porta@suse.com>
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
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V11:

- capped duty_cycle in rp1_pwm_round_waveform_fromhw()
- fixed a conditional in probe function dealing with an unitialized
  local variable (base instead of rp1->base). As a result, drop
  the unused local.

Link to V10:
https://lore.kernel.org/all/cover.1790603500.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

