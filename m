Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D749CF3E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642071; cv=none; b=jQZ4OZCimpVpEzusTDpwYybZ1LY/fsEQMlJ/O5YkBGxDzhJlXKllSbV9YMPCINEdrOHpF8+mv+D6kbU/xeexY8L3wbJKFKueEAUrxxTxlIaEFzVhQ2GNCXyftyDFr/9oKL9J11JMdwXRxdNOxtPX7z6lZY/GDqi55uU/6aG1ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642071; c=relaxed/simple;
	bh=wmj7guVz0/VeKewTNjtjnpkDMkgB0uDZrnGDY/6dXTM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HZQUAqjnD0xuNmplBdpUnmN5XyODC50UIJJlS6ntKuSqPq5M6kR5MIPGDfIm/c5UGFuFdgrA77uGX+mEbJyPzoEhMjwLA6Do2RdP7E7V1Gj6tGv4I6vpE+XOZq1Mqm6fA5qo2kgzoM5o6EGvMtm9AY/v3SUcjNs9ntbD+bozpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=svHI33TR; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="svHI33TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791642058; x=1791901258;
	bh=ELRzMF7PowDnre2U30VE7cr11G7OIFQwAe+fmSqK0p4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=svHI33TR0L6bp/Y6xEJwjsWSLm+Cev6pTkzFCau9+oNvVwmYPII3S4bVH0jfiuLw4
	 NudlUlOh75gFM8Wvlqm9MGaxPWmFIuOxHQoh7y/KMyzJzbeUNsPaH60B2WhzPujK7H
	 GQ+YCyBurpftBd9/XihO2b7r/G0+PQWdtlDS6osutWvwQ/SmjLjriddqCxPDfH08wU
	 ffzH7yjq1fpWlwvCRQRiLbrIBGpROgDYF3W8uw25SgZVyODliSclM9/j+DzenDOjWc
	 QcH4yBk6YPErO0ZyOBca6Zf6mpzPN3ko5QdcU35ffmxz5p6WN7YwM22JDUZMcgDRqq
	 AUw815QTnO56A==
Date: Sat, 10 Oct 2026 14:20:54 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5693: Support control events
Message-ID: <20261010142042.23253-1-simon0x+git@proton.me>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 87b0d29f18153cf8e5ddc32eaef4a2ae19c518da
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The sensor subdev exposes controls but does not implement the control
event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
reports:

  fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Con=
trols' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Add the standard control event subdev operations and set
V4L2_SUBDEV_FL_HAS_EVENTS.

Signed-off-by: Simon Kruse <simon0x+git@proton.me>
---
Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, OVTI5693) with
media-committers next at d7e7bca71. v4l2-compliance 1.32.0 on the sensor
subdev node: 45/46 without this patch, 46/46 with it.

 drivers/media/i2c/ov5693.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..5cddd46b3 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -26,6 +26,7 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
=20
 /* System Control */
@@ -1095,7 +1096,13 @@ static const struct v4l2_subdev_pad_ops ov5693_pad_o=
ps =3D {
 =09.get_frame_interval =3D ov5693_get_frame_interval,
 };
=20
+static const struct v4l2_subdev_core_ops ov5693_core_ops =3D {
+=09.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
+=09.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov5693_ops =3D {
+=09.core =3D &ov5693_core_ops,
 =09.video =3D &ov5693_video_ops,
 =09.pad =3D &ov5693_pad_ops,
 };
@@ -1336,7 +1343,8 @@ static int ov5693_probe(struct i2c_client *client)
 =09=09return dev_err_probe(&client->dev, ret,
 =09=09=09=09     "Error fetching regulators\n");
=20
-=09ov5693->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
+=09ov5693->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
+=09=09=09     V4L2_SUBDEV_FL_HAS_EVENTS;
 =09ov5693->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 =09ov5693->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
=20

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.53.0


