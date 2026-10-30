Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=gL0iCkrPPbq+Rwi1gM80TbjDvdc483RGGpYssQ+lLhL0opJQJfZEJIyN4lxozKB9dW6X
	 /YsjXT6vdDthagoS5ALXZqnTnwTm61hQsJJt92LzIV6OeRHYzbvHus4/+0gUidilaJp83
	 1FhN1z4s1GYC6zIgVC3XvmGUpGFe6/e1HCQBoJVBqu8hMljYL1b2X7PYNTq5XtnQUB29t
	 nvDOqeS1WqWEW+prMZNVi3CpyDbFfbTK8o1KkW9SXoDTozV15tHsLC2uSvdpzOqbMaTk1
	 McnDRkM0FvzRvsFBQuNk8S2f+zLTHNWNd99Rbe02ZD/jvbtrCD1qUxtp+UMoVkhNPdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
	b=06DeTIYZYyPNy4FdfIuscWQMNxWcFaaCirtjsP0w9EgdylaVEq+eNFNSFX7T0xAMV+nY
	 0k+OUFTkN1b43h+UB16MMNG+Yn2IbpsteljuU5i5ZT4UkNbJjjMQe5K4V24nOSWXnQvm9
	 /S2b901cIgLKkcinYbb5DH7kTOxp5xg0sYB9lWiIDfVDxh6Ey0hXKXS6NUu0cppKDbdNc
	 quBuZNIGqqvSjiZodIpYBjcN2Ocqo0/3tFaul/FVmSFF0z9GiTcCp7DeFwCmg7r1HmyGT
	 LozoLmD7u4+D+RimpbxMhpYYM6IjTrisih6R/HmKUt7+qckS2KxUvV5ZtxHnJ8Qctcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D79606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D79606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so753768f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375916; x=1793980716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=oU3dR5aelx0X9640Axl1wdU5N826Lj2FpiVN7eFTYeHxQKvffig6RMfeuhajBvKn2A
         FdotIcuWDuqVlcGG9FfCu/6MOfjl1iSdOMx/1UV51DLC3Dv6S4QmYoqfWjasf6y74vHV
         psz5P7t8D9evnlDKBVa+fHwsjKGZZ4l7BoOH+PZvufmmPucGIBzQaas8OTMI7UuTINFD
         xiHD+xXapOffintzlul5Ma+QrDa19w89GFgU2MQFkIFklc1RqhHCwJTALtSUolwlZ+o3
         M2P7Q6Y+4C6PIevrACIcSkDust6eWN4yQMQFIt5ZZj14jFWcJKgjNSWoVdgxhYQjEGxo
         8H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375916; x=1793980716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=auHiy03KCDcZ8+tq7192hHbbpfRHWskVIOd/UxffF/g87N96H3lzlI5wD2e88IkxIw
         cs/BN8pKb9fMjAGUsqUNnxsUt+snRddhEVt0iOEzLkRN/nGEGDe41Y9ex53aE8V/Jt66
         21DpY/iEm+R07c7gypZDGJp3WyaMLB9KDEoXRc2w/zAH3bpBtbl7ofe9OMwNwXaW+wJo
         F0VU2gUp9/QnDyt2OUeBHpxFmw12VrYwX5oQwNxQCgcQYWbDZIUb3TbTe31b42afAtqk
         l5QOVCSlx1zaPaZ7ddpJHJlGf64Dq6z52UtUpaIxEDYbqIRHf8J4qAgx/qW7qIOL0Kv8
         3P/g==
X-Forwarded-Encrypted: i=1; AKwUvBzFE3KxpFsvb9BHk1IKQtVO7MvAV9x5daEvCft7QOOz7vTn3V38F7RcNIr5BS4tsfxKewtfAvvXxw43d40=@vger.kernel.org
X-Gm-Message-State: AFq9FYL61ZgmQUfxAFQ4KQ0PcSXolq9phBDgokbM5Bz4NIEN+65EJ/w1
	gldWtNyrIkzYGRum9UlakgzvzV3c6xYX76vv4iE0tjifFJjA1/VAHYe4NNR1VoThFV0=
X-Gm-Gg: AYBFou3ecBJA8OSGs0oRHFYcXAIp90zg9TzCrddv3DhqsBrvSXX3s/GkiSHAADQHT0M
	f6kbALNrFi0C6j6JsY+H1ovwimvMmLrKztcfhe3b8ULTx9DmDs1lFZfgeRSTPFvHp5BTmAjoTs0
	kNBFSI/yJLaqJhhWVfjkgTgpmuoeXa9Gb0bxMJY1hBjHMnp3Mc2NJ2YcR9BjcwxFV2i/acPGaTy
	AQ4ydVQwIWuix5idKUTxGOGN5wL25o6z1PPvqXVR+Wl1CSoK1KrgiXVe7bqaYjJ+X0yIwEOipQZ
	x/pwa+EUnGwNJpM1QgJXHotkSfGNDNowkU+c1MrWCVsCHPMGfBQARK+l8c+AGFHRILbyDnV++LT
	umkLIUGlKb8oeYWak0gsSznuoSHJxjEaJOfcyibEdwOdUhFPKkb0HQQCoph7oZfCatB6Nszh6b5
	WD9bniu1witTsYixg+WqSjOwBG046bpaOZTVpfVtB+ISHaZQvfLI23UQvEzy4Ndv5FEuA2hY1GT
	YWM35aUkJ4w31YtKQpxwXdOmhRTQ9egzsGN9Fp+3CIPxzyc1ofo24ovqLD6InSgMeXS4q5J4L5B
	knsZpFo8ukFUq4BjmfFp2zhrrYenI0D8n9ihf86CNdxBoNM3SL8=
X-Received: by 2002:a5d:5f88:0:b0:48e:6419:dc6e with SMTP id ffacd0b85a97d-48e6e4f5431mr6781512f8f.16.1793375915915;
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862471f8f.29.2026.10.30.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 30 Oct 2026 16:58:31 +0100
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAKe+5GoC/yXMwQrCMAwA0F8ZORtotiHir4gHm6U1MtvSbCKM/
 btVj+/yNjCpKgbnboMqLzXNqYEOHfD9lqKgTs3Qu/5IbnDIs8QcgjIWTbzUGY2firFoxvHEQRy
 N3hNBG0qVoO/ffrn+bat/CC/fEvb9A/N85Cx/AAAA
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
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
the schmitt mapping, which the platform does not implement. An LLM was
used to review the patches and to set up the tests.

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

 drivers/firmware/arm_scmi/pinctrl.c |  62 +++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 170 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   9 +-
 3 files changed, 222 insertions(+), 19 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

