Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2228367285
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974166; cv=none; b=PihxmSrjYya3WSZjsN+I7DS6eFKD/8G0Ndn61tTl3FZ+3BP5ZaSCzbp+zI1GEhE2M0ydAvQ/RfsTDhKdRYKrsrohnCFA9b7/oqAz0F9Xkd2oWoGJHWhNUkkrOPWLxN83XNIVSO72pSr6yYXg6DaM2XtL2J7k9lI6OvyH+DV3Dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974166; c=relaxed/simple;
	bh=xWXtKGWdmQ8QZm6ej3clulDuAowXlokzszgvbjYxdLk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j4StSin9C2Jk0rZB5TakxsBq1h+hZRfDGHwZvKf/RWj73f2W2srjss9ih/c4O67Uj9HJ7dgEFXlezrHHDYrYUzcp/yxiyoD8LsagbOhCAIYlIjgH1gS2GzDFMaJj8g7ySlf+Z8M+YIzt5fjvp8LGzKzy42WXi+bRKOVkHw77XE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=er64flnC; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="er64flnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788974157; x=1789233357;
	bh=LEAYYFgYThiRq91QJKAhbIRFiL81kF5zd0S9oW+jhQ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=er64flnC2lVVUOeFOdmSzfbnXe67aIMFx8WsF2ITMlmKJ7vwQd9DR2HzyvZcgtPcQ
	 yc7ihFNMNffipOhuUgsOMPK1Dsa62LgsshQXJ1IRs+cmkHkHjS8Dp4AXfrslURKjy4
	 WP57cVY6Bf4x45kcNaBS2VlOqXJW6j4EqIJUJe4B7hvRUsf9PYqIaOqiXpar42VRbz
	 0K8vlKX8WZx5oqrXu5e+xty9zJqtX3ZYDv84LlkllTEEG3k79sWKayP783uBONVmaS
	 grv8VM01Cj30NTBUetYTAcoye4Tl9oyvFLqRAH/FTcU8GQxw7HZW50bvbIWZaXF70e
	 rvIczGZ/z45BA==
Date: Wed, 09 Sep 2026 17:15:54 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: contectforbusiness@proton.me
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: [PATCH] staging: greybus: camera: fix potential overflow in debugfs buffers
Message-ID: <cfUNtu1Qjzp-pieopsMQtanXUJTuVi9kZQ14w2f_jp55EwWn7Pnu5EwFUNI2vAWw1vWe3jD7Mz4IK6t1iZLQLE1fEnjfYfQdBV8tZF6Q4aM=@proton.me>
Feedback-ID: 147676893:user:proton
X-Pm-Message-ID: 45626d177c5d4aa395e076f30182ebe97f362473
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The debugfs buffers in gb_camera (data[PAGE_SIZE], length) are written
with sprintf without any bounds checking. The four places in
gb_camera_debugfs_capabilities, gb_camera_debugfs_configure_streams and
gb_camera_debugfs_flush do:

  buffer->length +=3D sprintf(buffer->data + buffer->length, ...);
  buffer->length =3D sprintf(buffer->data, ...);

If the formatted data ever grows (e.g., more streams, larger hex dump)
or if length is already close to PAGE_SIZE, this will overrun the
PAGE_SIZE buffer and corrupt memory. The driver is debugfs-only so
the impact is limited, but it is still a real bug and the pattern is
repeated in multiple places.

Fix it by using scnprintf with the remaining size:

  scnprintf(buffer->data + buffer->length, PAGE_SIZE - buffer->length, ...)
  scnprintf(buffer->data, PAGE_SIZE, ...)

This is the standard way to write to a fixed-size buffer in the
kernel. It guarantees we never write past PAGE_SIZE and will truncate
instead of overrunning, which is safe for debugfs output. The return
value still accumulates in length, which matches the existing use with
simple_read_from_buffer (it will just show truncated output rather
than corrupting).

I checked that this exact conversion has not been proposed before:
the recent greybus conversions to sysfs_emit (light.c, gbphy.c) and
fbtft/vme_tsi148 scnprintf patches do not touch camera.c at all,
and a search of lore for "gb_camera_debugfs" shows no prior patch
for these four sprintf sites.

No functional change for normal sizes, just makes the code safe if
the buffer ever fills up.

Signed-off-by: Vaibhav Agarwal <contectforbusiness@proton.me>
---
 drivers/staging/greybus/camera.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/cam=
era.c
index 62b55bb28..efc83ceff 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -890,7 +890,8 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb=
_camera *gcam,
 =09for (i =3D 0; i < size; i +=3D 16) {
 =09=09unsigned int nbytes =3D min_t(unsigned int, size - i, 16);
=20
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
+=09=09buffer->length +=3D scnprintf(buffer->data + buffer->length,
+=09=09=09=09  PAGE_SIZE - buffer->length,
 =09=09=09=09=09  "%*ph\n", nbytes, caps + i);
 =09}
=20
@@ -973,12 +974,13 @@ static ssize_t gb_camera_debugfs_configure_streams(st=
ruct gb_camera *gcam,
 =09if (ret < 0)
 =09=09goto done;
=20
-=09buffer->length =3D sprintf(buffer->data, "%u;%u;", nstreams, flags);
+=09buffer->length =3D scnprintf(buffer->data, PAGE_SIZE, "%u;%u;", nstream=
s, flags);
=20
 =09for (i =3D 0; i < nstreams; ++i) {
 =09=09struct gb_camera_stream_config *stream =3D &streams[i];
=20
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
+=09=09buffer->length +=3D scnprintf(buffer->data + buffer->length,
+=09=09=09=09  PAGE_SIZE - buffer->length,
 =09=09=09=09=09  "%u;%u;%u;%u;%u;%u;%u;",
 =09=09=09=09=09  stream->width, stream->height,
 =09=09=09=09=09  stream->format, stream->vc,
@@ -1046,7 +1048,7 @@ static ssize_t gb_camera_debugfs_flush(struct gb_came=
ra *gcam,
 =09if (ret < 0)
 =09=09return ret;
=20
-=09buffer->length =3D sprintf(buffer->data, "%u", req_id);
+=09buffer->length =3D scnprintf(buffer->data, PAGE_SIZE, "%u", req_id);
=20
 =09return len;
 }
