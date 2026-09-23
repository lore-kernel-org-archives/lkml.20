Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767E534473;
	Wed, 23 Sep 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171132; cv=pass; b=FmXv3zcFo6mZgUxHiPHsiX2Hs5BB1gqJEyjrviFt9SMWTxSNorsZ6YWPtrG4A1DAHreneCsE9hOdaCcvX6B4hwi+trbOfOep9KehE5rBc6/IL+EjsSyukqjAAKyYry3V0X5ESakbh/wl2At+sBEqLrWoAuZH0bfjzqfAci1XXnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171132; c=relaxed/simple;
	bh=t1v5oCq7AbDEQsFkLv6r5sDpDSeu1X4jbI9KRzVoKI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDFHKP4R70bdLOsGzPNJO+mMBh10zPVxdAWKMFFugs9q8j0Ahm/VEF+PKGC/A0OMwsABhAF7WIKuPT2n6IvcpJ69gikliqc8Nns9DjXMZx3ld7uqz6hlIls1CqPciBDil0uOC1K8zS+SjxjCzKuGWdZJ31thMSPdPLo3gySJqMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=QHQwDOZl; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="QHQwDOZl"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 49415201F09;
	Wed, 23 Sep 2026 15:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4jAV22Xrw4YIDaiJqg1Run+tpO3VEw2vJGgrK8QLKU=;
	b=QHQwDOZlOmr5BchOQtgCSINVfUOOq5W8yGo+w+WAsRjVElMV0wZq8qYmiujlcA9MkvYYEV
	1ZMYsO0BHBYb9UJNNxYBYG+/QB5FuM/7kmO8QMoz7dMgzUO9WOVwDLoh4vmQKLTzrIEfN1
	yE/XPAAVQJ7Q/i6Y/q9qg4gvKcPpkjuiuf+eqtzIW0XLYey6BaK2GLFWRi0GjnvybGeAeU
	8JyexzXD+aYnX8G+koymJk1DWh+ME7e/f6Mueihyu+I4ravKVcbptiBZXxtRzitkQNfk9k
	XYm6WvrJ5gsrWA+9PHiWIL9rOY+mD2i5yq/jPM5G67NsPXJ9SXzhBi1/JihIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4jAV22Xrw4YIDaiJqg1Run+tpO3VEw2vJGgrK8QLKU=;
	b=NEhxdiXPop4aS/8YIX/6c4OOYMCuEUrYfd/QoZW3Pp/jWy2NDM7+/fF9AXxJHSORCyceRi
	vUAqQzGw27H7uLFvpgq4IVdE8Abs1nIfJPkzB6Zc4uuCnvOHfseBfZ3SLQdlCKzRdp5g/q
	+xA683hEhJPHLCJdSyjutYhviGT5qgQ9C/yOezxfwmz2nKttkrsfimonaBvkrveqSVno34
	E2Yzwaw4GzG4WhgrkCkty1cwqRkIPJbAyacNL8ONwibDiEM9APib8XxrVcrYvIL1mTjTf5
	oy/9EsDHlGS0Yrkx3kNOv723c5xbXvL0QTPwpU3eIDKRM/m9oj7d5xbOn09acA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171125; a=rsa-sha256;
	cv=none;
	b=eJ5jjVPXeclAHBbpVcat385ZNfNHhVa/r0JgeMKsSC/aaltRHXD5u4BPxwi41LxBxJ+WJM
	Op8PmIf4EdZtfb9ai62UGHk6Dwu/VL/+mdhZ7wqZcMfdiiSdDTn37oRMWcpe3yyoHDiOFw
	kmJvFoqjV6XC1NQ28NcyJk2A0fVDCv29lpPQ4jP2D5pZq0RW/AlgWyFrD4cv4uB2n9b3yo
	iPGL+BUTKrZbh3W4rTRrsEMZn4cFcTGQL4stOe1DgsLJGGGCX1Z1dzXd2zV9UsyjerjJap
	7NV3OaePIURRGachY/LR2lqGshJXsMdlj94zwjZDJHWBp98SsdsReTl7k/RHRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:47 +0200
Subject: [PATCH 8/9] media: v4l2-subdev: notify the bridge when the source
 power changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-8-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
In-Reply-To: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=1765;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=t1v5oCq7AbDEQsFkLv6r5sDpDSeu1X4jbI9KRzVoKI0=;
 b=CtkE+yOMb0E3CIeyvS8K0cCTiNsFCxtCqPuURbBpgGi8x62iZbecfWOWEzwmt8uVterGoIIdX
 xz2vlm+RIyoBegz6SRgGaZ6vQQrki6yNV5dzl18jAVy4p8Ue8++L6Vq
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

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f848..407b353fa943d 100644
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

