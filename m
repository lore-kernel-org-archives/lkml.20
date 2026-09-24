Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22EA47F3BC;
	Thu, 24 Sep 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251574; cv=pass; b=HuGAgpctXnOw+VGTZzZ4JQ5lqOxju8bKocWzDruR6G4Go0KyeZK1T7JG+injaLY4qbnOMMxzJCM+vnCyiHaCOU747q/LkcTW6itqmVTUbZKwHz1fNzNbnt1YvvEMc30xQO4Ae47XwSWSX0SOmApnb9tWdcUCyJ2y+6P3I3NuKtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251574; c=relaxed/simple;
	bh=zlHKYXV6eg+nZRJeH3ASdrT6tot/dPOLzqS/ejv3caw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pL0HeLiHZPND2AIsvM8FXg+x6QWmeSBKxNZPEF6GUZ9jajDccn1s/A5yLtM3y2UoSo1DG++ch4qrJmt3HOusP9FLw1aFQ76oWS6hWGXAy5VT1JgFIEMImqHhWl5DIPWF94MzKhAEJ03XDMtlcBV0jhu3ioMcyfJR4c3qw1KUPoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Kq/Y1Pnd; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Kq/Y1Pnd"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 870FD2021BD;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyBGmoaLN6ssFVm9eDEEPBERfFfq/uzBQ9ZE0rd0deg=;
	b=Kq/Y1Pnd2XVmrYqIN5yWPR+hgZsT8+3T1rWcbhq31gKaSo3z8TimGMsBnEhPlUTm3MrtII
	xzROmSSc9T0mLo9rmyCP/dplxWSvzqTMaasC1w3nrZ33C12S5y9a7wDzgiDcCX0URVzKrf
	F/z8+8lSCig0JyDNqCGcNnfhkQ4TgjgP1EVeNEGJ+YVy7wHzgK9FsteaWBclNoFhh7Dv4O
	TzxRoOc0irS5ZVb2ShgGu76ebc5Auz6KIHiv1L2fwvHaln6R/J1WabQbjtY1tXZ7rTggcC
	WrYi3BAvFdRcwSK4ZCl0Zc49oPpLg+IechLhhFpWEGhvEnbONyfJDcYlFBgX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyBGmoaLN6ssFVm9eDEEPBERfFfq/uzBQ9ZE0rd0deg=;
	b=AQIu/ywHR9doPXm+6puyh1iZPTI9/P4eaELiZh54DZj1QsDaT4hxjEipdvBFS2TjCEdcjn
	Rv3/XJ9qq8Y4Y8vrjQwoer7j5/BpoT166hjTRSpJvRB+6OwPKeWXoYPSAbDJXlZeLv3YvK
	1MdvJSuXRNPcgxt+nveWnxcUFP9sTjaCpPv9IdqNm26ZsSoXJJ3/bT7PVALaot186GmAXF
	vZKuVwrcaLW0XGMMANNljUVBKU4UbCk7Q1pkaGhKcr90oefoYO5rqDq157/O2TW5DpcAdO
	l6WOMFU6CVfVmvKbPMa1k/7kiRRljz4OVGwaWOptq3RlLFNGWQ+DQwdtQq+R4A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=d2zAy4Q1JflBJ94Ga90XTphjSG83C84dxoGUu+VhOpKKxSDj7sUvhWHs/SaQjOAhO1NVa/
	821VYtkTDk2EU4yP68/UeMWNTZ/YyF4BWhiNsp84UXhxVZ/nST+EFv7CQwSYIWxEK12vDM
	EksxBzxnxLAbzoeFGvNFt5wK8skCcNwJlR0dvCW0+++3AqaSOofC0zkeZRz3ngzIIBNyz1
	0/MugvZeFqbyJcwdWzKE3aQLLT/HwwbuT20tq5jwEvMNaJq0bdSBxT5152UdGO/NBgo0UI
	6Jhea4di77vk0m3XFMfxDv6Lfcfj7Wmt5c0I8CpbHwyZJ7fI97EHVQdGacK8dw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:06:02 +0200
Subject: [PATCH v2 8/9] media: v4l2-subdev: notify the bridge when the
 source power changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-8-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
In-Reply-To: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=1765;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=zlHKYXV6eg+nZRJeH3ASdrT6tot/dPOLzqS/ejv3caw=;
 b=fRV+JTnr8ujfPaAlekJpYydXYXnFWyj+m9iPagHAkXk7a4/fCQaB/C7EVjRBRcilLEucJ31zC
 Q4+9fopCb1LCitt1QGIL5c1HrKBvkNu65POey6ZzeOs+BHzTWZ2fZ3W
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

