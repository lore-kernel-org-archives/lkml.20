Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1647F778;
	Mon,  5 Oct 2026 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206925; cv=pass; b=HRpYdKYB3BwS8ba5r+FcsiYdv0lN8vtq5FBLaqXVXYAagu/J0CaDixm3+wkblSGHHgpsMBljuut83mHcpAVLkCdvG1lVIud9Ym3CeOu29XeVF2f3ujYRPZesbPwrg3k9zz7caxpWqMuktew9YSdsNh3vyNNp3a76apmlw9hMJUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206925; c=relaxed/simple;
	bh=DClOr0+yOImOxTrcmpWDm+2EO4QLwXSB8e44TdRLPzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRcNU7EDfZNUlNQqICJYuhwhTIQfDzw30scowrcpV6OOafUBwok3V8IYDPDEnNR7qpwk2LsFQagzaHzvvK7uMnC22XAXJCjX+vBVlVUdhiFJNAxqfeayixqZTuFxiVaDnguA/q0t6aK6AUi6jWkfkcjYBgFNoy1yGLDwsoLAe/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=YDSJpUux; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="YDSJpUux"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F20B32003F0;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVxcHnOifvxEj+zRMcyCSI6+UVk9ei6O1aps6P0UxMw=;
	b=YDSJpUux1T+TnoqvU43thODg2u+oO2X65+R6YW5RMfE5IARqthqJdrD/rLi7oTdqno6xYU
	a7sHBwq1RUpdHUOVZXFTYRVPEK68VPpsHM+lJ4aUYK1OtE6LXt2sIz0p2YMMuw+NnGjV8Y
	ID24GTCdLZZUQpW8tpBxh6E5ji8j5U7vS4X73gtPMp2lFyQzuDB14yt8ESizilf6/mD64U
	/cD1EJhxtF7PL50aUxQ8DLS7fcTKxESghg2xs78yNyev4lxSyJuXlWENNy4stW5FtKRh1P
	63vZjBNd5QQH24BB26p6kRK2MXn3kbIhYvzwDFvSv66xhUkQC+2j4/Um7xgtlA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206903; a=rsa-sha256;
	cv=none;
	b=OpXh3kKnz/nlTbucZJllrGLDav+h2U2viY+fXuU/Ffg0cq9jQ4WnH6eIssJQpN/d6dKbh/
	H62GRhCx0aCivZZ+LyQ0Wgm+g757M/RMYECsV/E7j8nqbkLSqHENf3FqENo7eY2QPbBmTc
	xmFlTRV3ZBKqIWneJTLdthZoociu9iu4uMQq9qRCHyJ7b8NCKUOnLRn4iUOPqwsQyRbFe3
	sKekisIlJlvTpPyroHKOUNYxNP7v2a5XvlzIlPIbeX5bwAIAPoSp4UjB8fgmnmXFFGZrsi
	ZVUx3+a4bhVkFiaJCXOs06htnHRMfkjXnxIZCHFa9jHS4beBwWHjVY43mDdkVg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVxcHnOifvxEj+zRMcyCSI6+UVk9ei6O1aps6P0UxMw=;
	b=QCEBgcSjZI18R9k18/n40bc0APWECgzNb1uvgxhsOAyetg1mF1bmZEKCqObKQNukgZ92YV
	3XflNjSoZv9tchBDzGJfaD+xe0QNBobZp5IE7llIeVyQ3TPWqR2P0YbX1DtHIjjjhbg/k6
	cDfqQ7JUj7+vxtll485/ygu3gg0TjyDNiJEPhLKrkVcWja1oRaonxXqoe/2w/CpMLuF7q4
	Ciy2RkegIdaP3TyGXdbUAohmDoxdSbgL3nt5Gv8Yu6g/hUeLipisMDZz5DPkSutviT7ZNf
	aOvfXQJzv9jgSt2+vUPvv06uKjViOwoUsZ1DHkq9FbEu7AUWt/2FCc5e9qEbwQ==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:28 +0200
Subject: [PATCH v3 09/10] media: v4l2-subdev: notify the bridge when the
 source power changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-9-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
In-Reply-To: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=1748;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=DClOr0+yOImOxTrcmpWDm+2EO4QLwXSB8e44TdRLPzE=;
 b=5mjKpjNqn9FozE9+/2K0qVKGA1WvPepAxCuGdB13DQbrv+BjAb4xf6T8net/1zt/zRJPMbaAW
 c/gt4phif/FCSsVM0TNMh3qnImybIBa6dcKIemT+uruim6W7B9JxSZ7
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

Assisted-by: LLM
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1483a85d0c72..a3ee4866cce69 100644
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

