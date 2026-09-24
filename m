Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCB478875;
	Thu, 24 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251569; cv=pass; b=ZGIJWzrJoUv9QyiWAEIib92hcxF62xj1QC4E8+fhrvZBDVrNrWQs6SOvsbz7mV/3GW9TKRjKV0R67boPWJhA+ifQVKBcUZMkzLgvhYh8p9dXxceRW71QKtKsRF6NnUkzOdkRcvBdRq3IgeQBTHTN8TLQ+eAMZvGsGghSMZX84dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251569; c=relaxed/simple;
	bh=QJUlPFxwRSlTeldIWExXbYGKjcOacBcP237NH1BBzaU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yo4bUSVi0dl3gFNPFVQZezZV2t9y6PLJci/mlftkADb4G/zqg9L2748wzqgbBhAhtT/gFiWnaPFjVOlckadxqb9D96Hq9tu6sKLmnY81Y/sHGEfWooSqfoJL6C8RuwxEJQx8ANEdSkBItBn2RhcI5KzYnS+PHeDMdT8030tMxIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Q6Ki6K2K; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Q6Ki6K2K"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CE95520075E;
	Thu, 24 Sep 2026 14:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Arq/eV8TjJqTmmf4hR4hu2hZqMEzJUA1K1fw0+ELfYA=;
	b=Q6Ki6K2KNsiwsYzMmxsw+f31wFkxPCwllKNkYgBYXWFIfiQsTPoK8lAQxWeq02xNTXsqdW
	A6yqBe3/ZZcBoU0xHGsrpO9qHZJzfNioQk71NsJAJfNpDzPTmPh/gKL5ires49/m/4IxTo
	tvIVRI3882gT/HuRV1lYkW1nzwnvsH+sg9ZQrI/TCbUEPsaE5Q9BqX3aYcCMAn7X/E8UQ/
	AyC6dSuF022FE3c3c6BQ54AKDVX/V+GKMFgYoJCfwv6WIbZhmOyYX11S/b5oeBvBgQDGcU
	objCWqyynLI8VuK6VYOe1vaD1ajHYMLUv4a32xz61T2qvX4J2nFidoCh5OuAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Arq/eV8TjJqTmmf4hR4hu2hZqMEzJUA1K1fw0+ELfYA=;
	b=U/oP9cG2EQ/oRY6NdAaWLQ2jw7hOZlzeJoHddW/OcdDVqqYwJ5T59tKaCAYt3e++q3XkaX
	I5dwsOlcdkgcvHTAOVuoa8OPhQfMZLLkqvfxSqT6gCpdNEL3QzNszzGlufFChPTn4y5vkI
	RAIC8SUjqEPdm4YXALTRkmhmdrloTtikMyXEaby9jX7wO54wG9tDfVx++CoMb0aZ1pbyKd
	IaCdvHpX+ZoxqxYq2IkO2EZkNdFg7i0DKfSScp1G0FwvC2bzL+TeVPbmVCu/yx7m7WeKZ/
	dcUOHarwjwcjLlMGkCkjAsEiDORWW2m9tVjd7cLe4XpmP6PWvdmpmB5AehAGrQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251557; a=rsa-sha256;
	cv=none;
	b=BneUNgTcaKdXnOGkTUwJ90YYRgACt4RMLqq+gTEfplenTG5tN2Bhmb/u/Ce1PA7T6TXu9r
	ZwGVpb1OHkkVdtmAo0v1LlyGBGj0nuK1GyJ0OtlQUDQCa+LZaqX91ZCLUbllwKQjHieSTk
	IHoB4MMDtHCRHez1i96QKVaN8nPSZwpn7tY0BJzzI7oE2FQ7zcU0ncu4XPmqtQqoP4NcnE
	28aWMsqKMrAWVEvvclVuMCSugGQAGzTUfPs2Ku7KoXS4d4dXLLF0WIt6YoPMotW4w9XtON
	ffpjOgWNXSkonmqSMqswlG/pfANNxQGSUO3sVteho6ZDpS+jWjKcnGbrir01zw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/9] media: synopsys: hdmirx: support an HDMI bridge in
 front of the receiver
Date: Thu, 24 Sep 2026 14:05:54 +0200
Message-Id: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIStWoC/1XMQQ6CMBCF4auQWVtTWpDginsYFq0dYBYUMsWmh
 nB3K3Hj8n/J+3YIyIQB7sUOjJECLT6HuhTwnIwfUZDLDUqqm2xlJSY3EycxoyMjBmzQtrWyyiL
 ky8o4UDq5R597orAt/D71WH7XH6T0PxRLIQUa7ZrGVaYedLeiH18bL57S1SH0x3F8ABEWdHOtA
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=5926;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=QJUlPFxwRSlTeldIWExXbYGKjcOacBcP237NH1BBzaU=;
 b=JmqkLeW8ionotT/Sl7O2ihlNDmrM8FB9MomrYSL0GsMKMuv+o9DaBV3mWRrBLMf/lhgB74k/1
 a3VrRIRNrjZCNgR5aRdEM8SRxsT4RhqheRkNAHfkjDlpqzohXz7vGMD
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
sink pad. Such a board cannot provide hpd-gpios, so the binding requires
either hpd-gpios or the port. Without an endpoint in the device tree the
driver keeps working exactly as before, so boards wired straight to the
connector are unaffected.

Patch 5 is fallout from the wait for signal lock, which was bounded by an
iteration count whose duration came from the 5V debounce it called
each time round. That debounce goes away on a board with no hpd-gpios
later in the series, so the wait gets a real timeout first.

Patches 6-9 are the 5V state itself. Patch 6 stops probe requiring an
interrupt for hpd-gpios. Patch 7 makes v4l2_device_unregister_subdev()
wait for notifications already in flight. Nothing kept a subdev from
notifying a v4l2_device that was unbinding it; that is not new with this
series, as asynchronously bound subdevs sending V4L2_EVENT_SOURCE_CHANGE
race the same way today. Patch 8 adds V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT,
and patch 9 has the receiver set v4l2_dev.notify and take the state from
whatever is bound in front of it. The notification is only an edge, as
the 5V interrupt is with hpd-gpios: the hotplug worker then asks the
subdev through g_input_status(), so nothing is cached that could go
stale against bind or unbind. Without a det_irq there is nothing to
disable across suspend and remove either, so patch 9 disables the
hotplug work items themselves instead of cancelling them. Patch 7 is
what lets the notify callback read sd->v4l2_dev while the subdev is
being unbound.

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
Changes in v2:
- dt-bindings: squash "add the source port" and "make hpd-gpios optional"
  into one patch and require exactly one of hpd-gpios and port (Conor)
- dt-bindings: drop the OS-specific sentence from the port description
  (Conor)
- hdmirx: take graph_mutex around media_create_pad_link() in the async
  bound callback, the media device is already registered (Sashiko)
- new patch 7: v4l2-device: wait for notifications when unregistering a
  subdev, so a notification cannot outlive the unbind of the receiver
  (Sashiko on patch 9)
- hdmirx: ask the subdev in front for the 5V state on every notification
  instead of caching what the notification carries, and disable the
  hotplug work items across probe, suspend and remove instead of gating
  the workers on a flag and cancelling once more after the notifier is
  unregistered
- Link to v1: https://lore.kernel.org/r/20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de

---
Gerald Loacker (6):
      media: synopsys: hdmirx: add media device infrastructure
      media: synopsys: hdmirx: add media entity for video capture device
      media: synopsys: hdmirx: add async subdevice support
      media: synopsys: hdmirx: give the signal lock wait a real timeout
      media: synopsys: hdmirx: skip the 5V detect interrupt without a GPIO
      media: synopsys: hdmirx: get the 5V state from the upstream subdev

Sascha Hauer (3):
      dt-bindings: media: snps,dw-hdmi-rx: add a port for a bridge in front
      media: v4l2-device: wait for notifications when unregistering a subdev
      media: v4l2-subdev: notify the bridge when the source power changes

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |  21 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |   8 +-
 drivers/media/platform/synopsys/hdmirx/Kconfig     |   1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 300 ++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-device.c              |  43 +++
 include/media/v4l2-device.h                        |  15 +-
 include/media/v4l2-subdev.h                        |  12 +
 7 files changed, 354 insertions(+), 46 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-hdmirx-media-fe7eb952b2be

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

