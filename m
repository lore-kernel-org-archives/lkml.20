Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C274314D34
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330237; cv=none; b=qDR0vkxeCMYERGcEi0w3tFwHe/FCnzrSfdcFfecA6mo0KsK+Ftjxs5H3PB5OKzbbuHZFB5FsDCWIZDCtaK2N4L9IpgSnmurcyvBBL5Oe2QRl8BUkjYWihIJA4RzSEOolUyb5X9sNUzdtnwUq9n7l+aPFbWplTFFKyOvwgDRS2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330237; c=relaxed/simple;
	bh=iUE7wgNOMrhuGoeVMSXNQvm1SnDRxzVTjBLiEo8fGhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f629iDyDisBc2SyVGWKZ190svoDJNC0wUVV4LRe0Nc//XDpnGNd3/ItaMaBJTPsNn9f3Q5O5vgZbk77ICfCXtSzd30zxEYWyhpjCf+gfRUYovsbIvSPZl4IHcTjN4TNsG4VSJLHx61sQdklzRcG9IvQphcPlpeqcu/LaokHFCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2Ec/UEH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Ec/UEH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14219275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330234; x=1788935034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=L2Ec/UEHFk3oVi5bPoZvnkwJHG6OuUJYzTNgkpLCjsoAVedeGbPYVCpxaAAw8go2zZ
         2TkSCv1FgFxKmiV6NktZH2D1j+hdkbfcshfg8Yzem4q00aNR+FuY1cguQKmv93ZHCpHp
         LIR4KAlsn02kTxoMzP/7OWJCz9RELHcmUd+ZsZRYABCf0oTJJqWplH+l/xEKNlzVplJm
         6/grXbsA9Eera/Txd0o2Ps2H7rEHQx+IPFZUxn6UmhTQ2oJP5jUf7tADRxR8ug544fLT
         abYrjxs+52uruOFjKoiVCO21mr/4qOwBj3oI7d0uVFPdfambazwMqRsJkM/mtiXiC7f/
         Ch0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330234; x=1788935034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=JtD2D5cd+YjC8HwvP6p41V8PcREpyXBpHnGWEhnFlnXWYLiucus1CAiNsXbzRCwzlp
         Z4he3cInXPk/amVe7BEv4TM6iCWLWycVUquD7+8UWENt9zQzc6jWXTUFzYpiIEIhDUVg
         akH7OoDjTx66V3jMyFd2UddnnMotHYEd/ULekSEg3gJseTVsChYfgLljom91e9WxSng5
         NE2plegIDGtxUdFsrxupa+r9tE8GP6Rb50JHZwpFdI1s3TZZEuIv6WS0tNlDIYG7EdV7
         /bUjQlozdedJB0h+ZUmfO40R88KoIRZRW0S++i78OdTCu6hbXfpYuayT9ICdUffUw1lb
         j0HQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfpzOcQp7hGvesQYEmKdjNleEGI7XC0BLZf5/wU2hEnwy6Y8khAwNq5GMUnmQu2WdXr21KZK36jyZjH8c=@vger.kernel.org
X-Gm-Message-State: AFuF++ndwTFdNuvLNGdlko2oijtjDjoExjSdQIzU0wuhv1Ow3JKCx4dn
	kKDT21ciX2TVy4MrbIhzJdikxirJeaKD4Oo57mEamI3F2KgW4VU8hiTM
X-Gm-Gg: AR+sD121XSowxnnzMauQWleuEBXLwRbo+ui4edHcoB9Tveqr9Rc01A5ywpsNC9If1xV
	9FmFPGT8BEv3C9NGIhFs8WFooMg1R8nymBCuJoT85qYQ/gWy+K5LqdiBlvadPxKLMlPXRAYOLtV
	6qmOz8mAWJ7ODZ0MYjD+GXjISmtf783GevJo6AtxQuMMeRbGRJ73tkEvaQOTKOIiqL4YQI+r6wi
	UstQ6o+WPO7RkEmp2AyUHJrLnk/O/U7uYapwkIVyJhFIiQSWsxf1R+IFg+60A8h/o46NdhGovu9
	/KPxlWBpZi4pEVP6GLBsK4cwVsDaujUjY9H4Ml1uuhcipEbmro+PhhfiWDS9ZYh4x0gymPjmAg0
	K2nIh7MXPxYDgiOJx/el6U1CgrEJwAQKrW2V0oo4LpRhl1zFEmAanh8VLfvogEelyF6m3VN5/Z+
	lggRND3qAia9RZJhqAqmNEZF3sE4csMiOP/VMbzn1m2derAOzRPalkoHjy4K8oHq1ihlZqECY/t
	89n
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecemr12186495e9.5.1788330234183;
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:53 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH 0/2] gpio: mmio: read the line direction from pinctrl on chips without direction registers
Date: Wed,  2 Sep 2026 08:23:50 +0200
Message-ID: <20260902062352.3600368-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this is the series that replaces the gpiolib guard patch [1], along the
lines Bartosz suggested there: instead of teaching gpiod_get_direction()
to stay quiet when a chip has no get_direction(), give gpio-mmio one that
asks the pinctrl backend, and teach the pin controller to answer.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. This patch makes
it parameter aware for PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that say where those bits live (Vybrid:
OBE bit 1, IBE bit 0), and keeps the raw register as the fallback for
everything else, because the debugfs dump still relies on it. Converting
the driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 installs the get_direction() callback in gpio-mmio for the
"pinctrl backend, no direction registers" combination, mirroring how the
direction setters are already forwarded.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next: the 21
boot-time backtraces are gone, and /sys/kernel/debug/gpio now shows the
pad's real direction for every requested line (the hogs, the SD card
detect input, the USB VBUS regulator output). Pads with no pinctrl
configuration in the device tree cannot be queried and report -ENOTSUPP;
those pads cannot change direction through this chip either, as the
existing direction setters return -EINVAL for them, so nothing that
worked before is affected.

Patch 2 needs patch 1 to give correct answers: with the raw register
coming back, the direction would be read from the wrong bits. Taking
both through one tree, with an ack from the other side, avoids that
window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: get the direction from pinctrl when there are no direction
    registers

 drivers/gpio/gpio-mmio.c                  | 27 ++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 4 files changed, 63 insertions(+)

-- 
2.54.0

