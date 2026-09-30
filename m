Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704119DF6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744307; cv=none; b=DiOnlJOdHRrBoFFYqHxYDW0LVz2eaVks5r3uYFBfUmReeQybJlRbLpwKbIHNYk9ZJvxcCd9hki4lRaPPGiUu5tshQmM+ka2PvEz1fZD8+tv6ULkirUf4qFWr6nJsYwX7cCLJVhwak7aexojXjwTPWSZK0XdhsRhIZxDkQ/cvdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744307; c=relaxed/simple;
	bh=bocwqw7X310Ap6HbvXN88unuvzXmO6SuDNjdejac4+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u5TcIdbgsbSQB72Z2SJ6flwhPeW7R0IO+9CzBB5o2KvJfUIfj32frxk23nwEf3dci2D3kMeigfRVkNQP3Ui2pAvrSEI9aHdfzO49jY0NAjWbvCU0CZMjp0UHcTB09WAb9qLSeiZ64QuXtz5EFaOZj/jK665+CwIa0o3BMCrJZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT7DDBaR; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT7DDBaR"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ca54bfc48so366322eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744303; x=1791349103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uEa+/CcqrhlXh9egqa2jk7iOVWdF6h8G71PxTzsaVVk=;
        b=AT7DDBaRlgxqE5QlgB2sbI5BWR5GkjRwziO+IrDLO0I+hwDH86FtYEADRW99Tft9Lh
         Iatm4mCwlQT269h0uhR74TCyS8ZTtFCnTOPPSX8WSCmvs6dWB0s/j8wpug7ic/bntkqk
         RK1I3VkeVZKzeC3YQcM8Y0206QAYeYw0c4o7fE2hH67tMOIntui/KFi/Ig2nhxjPArxa
         Buk++fkVXOPEMSP91VSLWieErsRJCc6xIqedcZ9SamSS+d1XXxRAHD4I57/hHrx0lKVa
         XqiaYMWiAsJo0coNRsw9DKazohn7vhm563tuOFQK9eW9I+Xiz311VW4szHG3wHbH6eco
         3TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744303; x=1791349103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uEa+/CcqrhlXh9egqa2jk7iOVWdF6h8G71PxTzsaVVk=;
        b=zC9vmqBPb8ygb7l8UNA7bIMAi/oegvAUxwPprlWxpikT6iTTBVLuMdHaBV3yr/GzWq
         5PRnofsw8GecQrvQTFscIYVdT/avpbzs1C7XDPa7WvkJTWlVlKEYl7l6VK3yvlWV2147
         wrseghBCpkzAYsT6xoCQcBrRyZyGDw0AuVyF+pM0x/IKePxdl6vzNw3RoSA9u8CBqohR
         yA9HLsRFmjXAP9qC8x38QT5BRHfa04wHnkcymYS6yaMQi5Tu6r9Jl7nqrbCpaesbqlOM
         h5EJBGx3GWQnWeQXLjyu5uqvxncXvrhOctszwbpq8BjS1hQMnxNKRKSKdau2wIea09fu
         n0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBw15IpsvRf3t3+3QSxjlRCKCQ93CG2cyx+j1/TlUR7CW+A9QGSEoX4WxRknk85Hkyt0e13U1qr533a+zfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcWPSUM/Wli58t0PQgqiddx+GwPGG9zMS//giGia88r2maIbtw
	MuifcKfJrTBaFm2yT/IgKtdBRBk8+vpCmkocLWU9JQbUlaNPrZSL1ZJo0HS6qSwp
X-Gm-Gg: AYBFou2IQg6K8OEq1H9y80a1glz1zwWHIYRTRsu0+eoWNYCXtNDEAT9RehiYVkF36Nj
	jD+ZemunMoLc0RmhnBUfjELXRB8D2e3BVtxdIrwLGCXPNu+wwc2EZpwqxa+yB6Ctc00HYqKqWU0
	Y3EYHRz4izvTX3+/ciVPHzKl78VeitzUPMV5G0fa41kk/kjiIBoyeZCZ+ZNL3SB8yckRl2lAzbN
	pE6WhoUggCuAzXagUIo6i1mdVIgfdfk2YFH1jZDDkT1oag0BP3D4DgBBhkjB7gy67ws5rt+p/q2
	j4TvCyEeRAtuCwnKhQaMV5xx4nhl3+Eie6FofDM6Wjv6pS6VQvhQyKCNosh4uHUaTH3xsEoYh1U
	PAxrGzim7A2vrvg1p3G0+9d+Z5h4MqoiOFNvWEJ5vbed/R2k8TCb4Boq1NFZqm29wa2ngdbMQwv
	WwzMachKUKcw1LF2TFO8Ila70x/fWG4MBYMGtV24TvjaHbLxXYgcmdD7i07hAmjEek+bjmb/hwL
	COGsnSerIBc6A72AuN6ckI1ojfmo3HrOMtdsWbFujQu36A+N0HMZvjdtsy8ueo=
X-Received: by 2002:a05:7301:d38c:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-34cdc9b6537mr582806eec.23.1790744303385;
        Tue, 29 Sep 2026 21:58:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm571056eec.13.2026.09.29.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:58:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static
 device property, drop legacy gpio API
Date: Tue, 29 Sep 2026 21:57:59 -0700
Message-Id: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeWvGoC/x3MSw6DIBRA0a00jEuCiJ921H00HQA+BC2fAtVG4
 95LHJ7BvTtKEA0kdL/sKMJikvGuoL5ekNTcjYDNUIwooS2pK4JjmjtKahyiDxBzaXFPhaKyouL
 WN6iEIYIyv3P6fBWr6C3OOgI/V9OaBx8yz5vyrLMiWDutWuvJMSvWFubAxux9kLzjm5Dw9o/vk
 je20pE3H4eO4w9iiNjntgAAAA==
X-Change-ID: 20260310-rsk7203-properties-82bf2c12b985
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6c14f

This series of patches converts rsk7203 to use static device properties
for its devices, including gpio-keys and gpio-leds, and removing
dependency on legacy gpio API (in favor of gpiod API).

To configure pin functions the board is switched to use gpio-hogs, as
doing full conversion to pinmux is too challenging without access to
hardware.

Changes in v3:
- Avoided using inline compound literals for property entries in
  software node initializers to fix compilation errors with older GCC
  compilers (GCC < 14).
- Collected Acked-by and Reviewed-by trailers from Bartosz Golaszewski
  and Linus Walleij.

Changes in v2:
- Added a patch to isolate the function gpiochip from the parent fwnode
  to prevent ambiguous property lookups.
- Added a patch attaching a software node to the main PFC gpiochip device.
- Adjusted the board setup to use the PFC software node for LEDs and
  GPIO keys instead of creating a standalone node.
- Added support to sh-pfc for configuring the secondary "function"
  gpiochip via a "functions" child software node.
- Converted board pin configuration from legacy gpio_request() to GPIO
  hogs, using postcore_initcall to ensure nodes are available during
  driver probe.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (5):
      pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
      sh: pfc: attach software node to the GPIO chip
      sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
      pinctrl: renesas: gpio: support software nodes for function GPIOs
      sh: mach-rsk: rsk7203: convert pin configuration to using software nodes

 arch/sh/boards/mach-rsk/devices-rsk7203.c | 314 ++++++++++++++++++++++--------
 arch/sh/include/cpu-common/cpu/pfc.h      |   3 +
 arch/sh/kernel/cpu/pfc.c                  |  20 +-
 drivers/pinctrl/renesas/gpio.c            |  28 +++
 4 files changed, 281 insertions(+), 84 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260310-rsk7203-properties-82bf2c12b985

Thanks.

-- 
Dmitry

