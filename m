Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567962;
	b=HLmvqX8940JpDu6RPpzvgATA4ew9xKRpUfusZN/BYaTdM7pwmffoauP+eO6CAcMAQ6Z0
	 5hYa2esog7mK9Y3tlVVelR3/cXeB8ujddoiuh0Qu4XLzsGJCLRgoxDRw3Y7aJ2cGdnExB
	 OBpzQDmK6dJ156P3KDmKQWpqTnbaLYaYhiHJ77rVyrzuoop2V0nBHV0mKYsNwl46y5sFV
	 SbSblwTMn1bRM7VwYnRD3Wg8fopLmrqFp48G22+A1vyFB5yqqSGnDJw9GW8ztMd+y42qV
	 vHfnhXP4Fx90VxNVmrMFIL68c8dB4dkdTOzJW57D/7rBnvqfydedmOklkm/CUGAe/kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
	b=IPkBcY4aqIB1ypXI5DE1nBAAsm8FMnBWkXsCPCXaDWBoGNgk5M9VvrCMfuVo2Tr+sRQm
	 u7lLWZVmYKX2ZNo2MNTwcAZip1R8sastOoLt/yFLyIt1xH3l85U353vRYYeEz+BU5yd+m
	 fOybA/Yg2bQT3l5YOiFgGClNbRlGG3KWOrPZhwHMqcZrm2UQ42bVnyLdP732QroI95Tgg
	 j/c5SL6PRK7jiZPaDhNa4zoQjLtOsMWOLntVi1a92xtkwSe2DgrUEPyydguT+cn/zHP3H
	 EaIoxSKFhTcM1fu7FuTq64XEKMWZyYLnZnHeVxIALOMYUeFMELBseAXRNiRmyq4jWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F4B60A3810
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F4B60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so12417955e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567959; x=1795172759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=K1eQu34BjPPw9A8TdeH/jg7v4pY3cCb0VlJx1dSmFEN8R7m5ua9UHlzQYH2Y0Ace//
         DRJdz8Ln5ye+ygoMB9e2gryU6ygyEVpQvP1lJQmG1FW2VQ6/+768XZvz10zapHQKCeFF
         zKFwoevhbncajAOOGr7leegnosAuHMDN4fW8DoBTPfMu1TU9ujhHCYHBD5sFqqXzo0rM
         JT9gCQB//fuBJqoZlz/GXcn2uWNry8tJ8++9edjh3qqml0unvyYdOeeEATNWm06IrSI/
         2obyX1qTOnZiJ+gmBeXQ/qvjfrIi5+gMwQGjztnWjMMdQ8GWqCZTNYB3cC0ZZ3O13xQU
         eY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567959; x=1795172759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=IjG8aIvrJDhknuk5FXgIyzKFq6Ig8zwXJ7aO193Dc1ugXtkLnjKx2GPzF6kzJhAFGC
         80EeqomYudfM//qQoub0zCG9CR19lbn4LVqoD9BSmWDHPMKArXdm6jl+x/w/fCQHMRo8
         yuHknx6NtMYI22J2CBQkM+TxJjvLgKWEC8AtpRDDh+MdwEgKxPYU0juihwXZ8Nf4iNVP
         DDyyVyqhAXeTglaMu0MJqNynIf7nwgd9e6X0kz7htVuQYNbgv2g2g0f4T0f5mXBP0aMW
         9w1CHtYPN8fl7zfVPnq8WhElll/57XMvhslvtmh1044hq7hebcrrIMdNWKyKmiy/1Ov/
         YJ0w==
X-Forwarded-Encrypted: i=1; AL+hErEgIOnqIQAyY/BWN/RIL/IXEeOVae6vHo5CbJUT7kyCM+3aEe4ZYQbcoHP6V1KEjEf+Yi0S+tT4dmZL5A4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h5aBZ06evcUfEfyLBLKYsb+2sHp8X9gYmB0l810mS5k4ARNnA
	fgaeLaJwujtpLaWZDJ7AuEujhb8g8WfDTskDWPZUKASjQkPNW/KYPw2WkfJZUyyGTk0=
X-Gm-Gg: AYBFou2FYQxppWyZR9b1q9XbAK0ZOytIv4Bfoe5HtkmKSeukNq0sot0dxsPCh5dn/zc
	RlvlGrMvbdt2GM6nRe5g15GYVzUuyFaOlK6nqZlfr/pCxBHtuVyKIzhJbFjE1ct5tgJcShPMG8G
	N4R7LZ6kic6ZmpIdq2nVda2zMWl92E7mH2W8UtpY7EAo6GQ4Usmin4S0Tlxw76viJc7lEocig5U
	DNyFv/sNFjXvgHKa9Ws9DM4/U/CgvzGXuYePc0DqpQ21zDg7g7+bbHSZ+Ly3EdPzRk7iTEejYNw
	CcRO1SzDWIiFzemP0cuxfeW/xNb+KRXZpRBBXM0FNVQA9McLTuqCobIxxrObRJDWPlv1EyPoAGe
	ZGbLtrhKYG0g0qkkue+ECxE8nklD69TxoFYsrwfHibWmzwFJMp8cDYK7WyUp3Wt6WKj3jEpMaXr
	jqw3CgD2H6mjk4Pqgyn/P72M86+3US23gpIrEdq7PUpK0H5kVJsYVuOdDE4JtToXcp0oC166jvE
	tR86K0M2T7O0OlfvoDThBGwddF7T7BGXRh9kxUaGFj6m5WA7auiYZtlXdbUtkEDkA2DCUAH5JXW
	x4Nqaw37wX26Z39E3xGZKN2Pj/+zW7WMoK3O4WSmsX9AWnVPgt0=
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr38480235e9.3.1794567959161;
        Fri, 13 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm28648085e9.1.2026.11.13.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:58 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v2 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 13 Nov 2026 12:05:26 +0100
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfu9moC/42NQQ6CMBAAv0J6dk1bUMGT/zAc6LKFNdCSFomE8
 HcBP+BxksnMIiIFpijuySICTRzZuw30KRHYVq4h4HpjoaW+KplKwI4aby0jDOxwDB1E7BmagT1
 kOVqSKjNGKbEVhkCWP0f9Wf44vs2LcNyTu9FyHH2Yj/2kdu+/06RAwkXXhc6ztKqL28NUc8cm0
 Bl9L8p1Xb+9sX7x2wAAAA==
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (11):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled
      pinctrl: scmi: report an off setting as not set
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm/scmi/pinctrl.c |  51 ++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 161 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   8 +-
 3 files changed, 201 insertions(+), 19 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

