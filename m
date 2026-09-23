Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3439891F;
	Wed, 23 Sep 2026 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171101; cv=pass; b=dI7Qjri71yejjYX6xnHOwsJruZNS2Ww656NzcFRhKZI5dG+n8DWAWpmuvlIN8ez6ATMGfmjfx/ZhD0qpsaVZSkjysZLdtLcosG6BKHDz0AwaKCeVMqvOMBzjaAbSRyp1LnwdFfYBENBHDvulw7J8luxxbInoulRXZUAN3KTOTVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171101; c=relaxed/simple;
	bh=/DM/ED6y4O2U6WiK4esE4YX5QVGn6Wr7jyvfJGqndyI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XhVtdfeOEj20ojdKoZSQDNkJv6UxQvTac+FeSFeoJVa8c3sqpnkToVRS5jz9FLECSqQsCnLlM4K20clxq9l/wjlVWSQs9IR5AXG01uWDW1XUzjMYaGOHCbcPZeF6nWvSPIM9dEPN8EQz3yCg+g9v6bH0AonqHX7/w3NiLd6EeDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=RB+Tafy1; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="RB+Tafy1"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 645D5201F09;
	Wed, 23 Sep 2026 15:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zjP5YpQfh5eBZHqwpO7i1HdYtCXcDxLbRCkwNgxPz6o=;
	b=RB+Tafy1DSPruWBLQO8cLnlZ8lAV2c31V7jHE5MnIFrjWgnluJGPQw8sDrV9eNT3l8FTBV
	jbCRGkbiZ6Fd8pIcLTXqOXkWsfEhM02b0ynHYfPBvNbHlAsSvmyyIDOk5AXOTvt4Gk4VUe
	H8iOyOIXDJl9yvg9cZ7pUCxCK/FGsr4qIR54/jKerK62l3a4OoHp8QR19yh2q65eaT2QlS
	F3jLJZbRzRSPY7CX3sVbSrlchu1AsmzmzGa0UbKsMb9ozmDkh1Ig30LfnQRuorc0r4PNw2
	KFA5I1lNlxqB+IISozWLCJdJRJcSXjJGXwpGgmb4eRgBOW1+6fl9hXO99IxhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zjP5YpQfh5eBZHqwpO7i1HdYtCXcDxLbRCkwNgxPz6o=;
	b=YwyZ14yOn7V1cjbJnOSKduGVmN/n4djBuLq3xvrcmLUKi1ycnEn1WCndUBGqnSFCC02HcA
	lXgPqnhArNwU5fmysHtuwctWUEDGXYD3OfjX0nSoHbdi+uGnc/RhdkVGogKiBKtTff2sjd
	GvDgJX7Nnkz46U9SmiuP5lTqBHmKBSYLdQTlA5Bt5p/+giEbKIujycrsn+DZwCv1OzgkW/
	rTxoE82QW+F6dW71fpCDger7uXJdSC4XrqM/jhvOvQNY5EFyb9m2/rYSEQvZOmRlWs3TOX
	WVHIHRw2giZgKGAWsP7nR1rgfPSy7XU+k2HAbIt+KwRzNI9QS0VjsLdQXrEWYw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171091; a=rsa-sha256;
	cv=none;
	b=GvVjS35xpThnfUD/i1R2a1HuRDRzQ7uDj2lnsJQa0FUBbYOBxgVXXXln48vPKdKW6NZbPI
	DVwxn3KRC33X6XeSXyPc2fyIKNW4wdvhGlP+iwgftt3b3XncIM02HB/oV8ZDlU9nwDoY8b
	PsdiATRLj6vou5QrW/VyEM9TnLzp+4sNKngk565frm1rlbe4NcGw3Ni57Hl80oVYgy+ZGY
	AKO9MPDa0ADyNjxwmn/HAzmE1S7wloTLYwN1XC+j9JvFW+iZV67uFaEKFhvan2nm1/qAFz
	KfdUbjg6pe8nC1V/0e+bkh+1Pa0UrKxFI3gVRvv6Q7nXJCWNb08Pboufnp+5ag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/9] media: synopsys: hdmirx: support an HDMI bridge in
 front of the receiver
Date: Wed, 23 Sep 2026 15:44:39 +0200
Message-Id: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfXs2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMT3YyU3MyiCt3c1JTMRN20VPPUJEtToySjpFQloJaCotS0zAqwcdG
 xtbUA5JT9U14AAAA=
X-Change-ID: 20260904-hdmirx-media-fe7eb952b2be
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=4342;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/DM/ED6y4O2U6WiK4esE4YX5QVGn6Wr7jyvfJGqndyI=;
 b=7PoAZ7ad0l98kP3rXIxbbxhzXQ5wgTYsVKCp8l/6XYQprjQEl0IP8RrPoxEQG28bj66wGHxg0
 RiPvf/wU8bjBgW5YOpZRl17x1pIx/BSqYf2EkiSTHZ8Eem7YTJ2I4CW
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

The Synopsys HDMI receiver driver assumes the HDMI connector belongs to
it: the connector's +5V line arrives on hpd-gpios, and there is nothing
between the source and the receiver. On the board this series comes from
that is not the case. An HDMI bridge owns the connector, the receiver
sits behind it, and the two are described by an OF graph endpoint.

Three things follow from that, and the series is arranged in that order.

Patches 1-2 give the driver a media device and register the video device
as an entity with a sink pad. On their own they add a graph with one node
in it; they exist so that there is somewhere for the bridge to appear.

Patches 3-4 add the endpoint to the binding and bind the remote subdev
through a v4l2 async notifier, linking its source pad to the receiver's
sink pad. Without an endpoint in the device tree the driver keeps working
exactly as before, so boards wired straight to the connector are
unaffected.

Patch 5 is fallout from the wait for signal lock, which was bounded by an
iteration count whose duration came from the 5V debounce it called
each time round. That debounce goes away on a board with no hpd-gpios
later in the series, so the wait gets a real timeout first.

Patches 6-9 are the 5V state itself. Such a board cannot provide
hpd-gpios, so the property becomes optional and probe stops requiring an
interrupt for it. Patch 8 adds V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT, and
patch 9 has the receiver set v4l2_dev.notify and take the state from
whatever is bound in front of it, with g_input_status() read once at bind
for a source that was connected all along. Patch 9 also gates the two
hotplug workers on a flag taken under work_lock, and cancels the hotplug
work once more after the async notifier is unregistered: without a
det_irq there is nothing to disable across the cancel already there, so
a notification can arm the work again behind it.

V4L2_CID_DV_RX_POWER_PRESENT is otherwise the only place this state is
published - adv7604, adv7842, tc358743 and tda1997x all set that control
from their cable detect interrupt and stop there - while a format change
already gets an in-kernel notification through v4l2_subdev_notify_event().
An earlier version of this series hooked the control with
v4l2_ctrl_notify() instead. That reaches into another device's control
handler, and the only thing it bought was working with those four
drivers unmodified, which turns out to be worth nothing: they are HDMI
sinks, so none of them could sit in front of an HDMI receiver anyway.

Nothing in tree sends the new notification yet. The driver for the device
on this board does, and the alternative was a mechanism that no in-tree
driver could have used either.

There is no in-tree device tree using the new port yet: the board is not
upstream, and the device in front of the receiver, a Lontium LT86102UXE
1:2 HDMI splitter, has no driver upstream either. I would rather send the
infrastructure for review now than sit on it until the board lands.

Tested on that board, and build tested for arm64 at each patch with W=1.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Gerald Loacker (6):
      media: synopsys: hdmirx: add media device infrastructure
      media: synopsys: hdmirx: add media entity for video capture device
      media: synopsys: hdmirx: add async subdevice support
      media: synopsys: hdmirx: give the signal lock wait a real timeout
      media: synopsys: hdmirx: skip the 5V detect interrupt without a GPIO
      media: synopsys: hdmirx: get the 5V state from the upstream subdev

Sascha Hauer (3):
      dt-bindings: media: snps,dw-hdmi-rx: add the source port
      dt-bindings: media: snps,dw-hdmi-rx: make hpd-gpios optional
      media: v4l2-subdev: notify the bridge when the source power changes

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |  16 +-
 drivers/media/platform/synopsys/hdmirx/Kconfig     |   1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 318 ++++++++++++++++++---
 include/media/v4l2-subdev.h                        |   8 +
 4 files changed, 309 insertions(+), 34 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-hdmirx-media-fe7eb952b2be

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

