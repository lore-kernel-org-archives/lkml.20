Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842390;
	b=xnqvEMr814WsitM6Jd6/j+FXW9VfaVtlGjaBmv8iu8lES7S1+q7hBq7zKFBflMLOQgMk
	 k3l4sxdQl9ow30Lr+72ISV4rTZLNeG3OpFvbQ7aTmeSpMoUxuvx/nBKm3c9vb19CuoLg0
	 rsFMayYIGxFsSYPG7QZX9XwdBMa0z+lRzF9rIONpDaDbCVtLv4buMySv8N9yrsTKClbME
	 rlbt6uYneb1AHz6O/Kq8wP4Ntob+rSjDP05apoakln2AToLOdQj4wCcvMbmxkYWEnEOyE
	 Rb6T8uPyGTLEDWxuJJxjTAJLxyabUtZ1sG8C4FzlCFCVZis6m0F93c9HX5tOzFZ7Fww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842390;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TkbHYKHTLIVKl1No9gZ3M6ubmqZx9Z1drAsVJwDOIRA=;
	b=PF7jr1GPaKCUuqQkZ4eYpQ8BxWzT6tUJj+gE4BzjbcaBTPMMhkKsb5k51ekeMlV33JcF
	 7Sz+qfjVlgppq0npBpV1a7pGohPskopd3pjD0GGGqnzTfqiRNa/7ZBtjSaF+0BSxURyi0
	 baEndRBSAzpSHlWScITx8Jd2JF2aCkw3K4ek5bEbypMNr+AJrWGntRXvgC0ig3AoDCxva
	 RpCH83Mf1ZRj2v9VOlIAqXeN10GfiS9pu5OBx5x7kKKpvIaFVbFu1WqZznH2nJ+74yyeG
	 lBe7jYf6/eyt237lnBqrXhnpo1ETfkJQEv2JgK5x/EGsBZHGoaiPJhKI9WVOP1Lk9dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XZLFYCS3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82368606A32F;
	Mon, 16 Nov 2026 15:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82368606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XZLFYCS3
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EA2B7205A35;
	Mon, 16 Nov 2026 16:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkbHYKHTLIVKl1No9gZ3M6ubmqZx9Z1drAsVJwDOIRA=;
	b=XZLFYCS3QcfkKeHMqI5473pT5jwl1YgDVyZa7rf7zWdUMbTHAKWX0APaxC+tMtJCDclZlr
	erwtv1VVGVKcRtX5jwYwOjcWq8VGTzy0XEEKSB8zaZD3invKf6qsqjls+o5e/g6khrxRBc
	SOHbGD99AZ3MNlz9wOlwv8xDuA+QFO+XhNg8WkxmfaRzOPfaUEY3cmiHwwRwe0us57SRTj
	qqlqeXzz2CQxIC6ZF5qr56gS/8+ae/lmnBGnQdmgN/B3JHFseyJ/y5tkDMGUGKfMX3cPK8
	/wrnsjMZR+5Ndkl+0cFnpiUEAcaxEIWw3lWBjhlMkH7o5afn7YOvxKOfJ6thmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkbHYKHTLIVKl1No9gZ3M6ubmqZx9Z1drAsVJwDOIRA=;
	b=JGKci/EQvHDuDIqJ4Tu1tIV7VwE389eA1S6Hb3biZxTx3d9DkrqpiSmaf3QDYNdLMDXt4U
	/MU10Vb2BHLZrsADbc2mmFFWe/SEbGA3GAIA3ZZ2Fv9LAOEKDntg2g3d3mlJNMjRRsxRsK
	3eJLpDx5IK2GnTUTnH7Nixefla7Hujlu9HDklryhu1gChp00qNd7se3Uf7OPM/oK+Sj39b
	ClnyuCNvk0IxgOvW5tVgvyx2RudxEhZfkDX71DP10IhAbLAglikZBX/hQtTUE3rPl3vy2L
	ozJMYEOdbQBX7NWE/hggipXe6B7UfQgLSnF5KK5KddJBGoi8t1iPeuUR8QMD7A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842384; a=rsa-sha256;
	cv=none;
	b=V1W+DkJe1lC0XhKB4ZIVA4doEXz+etQ9bwPLfsPJjaY4rqW4JvFjKNxaDrtH4jzO5+ddSL
	QNwjr65QiRx5e7YimjqXHmdBJ3ZhFAZLI7ZYRlOUVkZiUuVK6FJS1tWE8nlMfEJ1HvtQ5i
	S1WqnLIVPqCQPq86o9QrmVMZmtMAbH6zuedBj0fLKobI13CiaXaElSZa2Gq7FX5l5eI+dj
	vkT2Ad9ALhPAwnWoBcZH8buCkUeKv2LLI2rHP46C+QvnDcWlvfMy4VMvfYY+DJjuNhtyHp
	bwhu1mcG+diK0pd0VR0PE1TQkFztT6zdZaxd3+XoQZdfBxBWKhtRotL7ZO55xg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:08 +0100
Subject: [PATCH v4 8/9] media: v4l2-subdev: notify the bridge when the
 source power changes
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-hdmirx-media-v4-8-7aee4a0a273e@pengutronix.de>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
In-Reply-To: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=1730;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=6mqcM/Mf/qXWes6aWd7vLTS2meS/Jet3IzwLTgKvRu0=;
 b=/VwBZPb0MaxOYghKbXPP48xIbCIHkzmG0RzG3KaLopr8OG0bi988e++1XY2YvkBj94ShZfxdD
 7q+xN0Ej5lbC2uNANZ+PVzcyEowmVJkDWg+RW6/1MUo4+ZLGv9Bx21D
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Whether a source is driving the connector's +5V line is published as
V4L2_CID_DV_RX_POWER_PRESENT and nowhere else. adv7604, adv7842,
tc358743 and tda1997x all set that control from their cable detect
interrupt and stop there, so a driver that has to act on the change in
hardware, rather than hand the value to userspace, has nothing to hook.

The in-kernel channel already exists for the neighbouring events. A
format change goes out through v4l2_subdev_notify_event() as
V4L2_EVENT_SOURCE_CHANGE, and adv7604 sends a private ADV76XX_HOTPLUG
when the bridge has to drive HPD back out at the connector, which cobalt
consumes. Only the source power state is missing.

Add a generic notification for it. The argument carries the same
per-input mask as the control, so a device in front of a receiver can
pass on what it sees without the receiver having to reach into its
control handler.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 698fbf6c86eb8..59aa6518af167 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -29,6 +29,14 @@
 
 #define	V4L2_DEVICE_NOTIFY_EVENT		_IOW('v', 2, struct v4l2_event)
 
+/*
+ * The source power state a receiver publishes as
+ * V4L2_CID_DV_RX_POWER_PRESENT has changed. The argument points at an
+ * unsigned int holding the same per-input mask as that control, so zero
+ * means no input sees a source.
+ */
+#define	V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT	_IOW('v', 3, unsigned int)
+
 struct v4l2_device;
 struct v4l2_ctrl_handler;
 struct v4l2_event;

-- 
2.47.3

