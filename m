Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785342;
	b=1EX1vvSaIoKYAhAoQxyadpvZNgI+Qm+vQ3uZlQfgjLCvh3z7y9S17qXLNZGw+ObV6pjq
	 FLQh7kQvqO/krtYgeX8onI5X8oj9tqp3j0Cdm3vo37cqkMpwU1TE2o2yUNcO1wls9uZ3A
	 uyyRP95C7cRgRWtZwqzBdOvd7gFgAt7on9r/pa7ZYUiEJ+gicVCrvogKoakk+j4yxbefT
	 pDTEu5rNrBvlT7fLWVc4u4eJ96OUuH0sWDcngkoNjPuadBpsui18/oniFR2d5z+CMD8Gb
	 GH1Lz1K6wCiz0tAph+Bf79Wdeoudi7mtJjXF2pxl4wQRuKnptmXqIIPIISh8CFBQnTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785342;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vp/AYBTEkmOuhm+udpmABWKXdbZzkeNKf63Ou8UIdq8=;
	b=LHxyDmNRjdXZHJjCye61KdEeWU68TPOUr5ChiI8D7voHZCUJqBJyp/OsNAmPkBSZG0Cx
	 sR+ODos3K51CkgVre+Id/LfT2dtqG8kb80OqzgyqscrrrZJnM5MOJ4iWa4cUDyQ/H+E4X
	 A9FnT510lieWRLOGoh+Dl3dfdYPdJiXV0Hu520T7xoTcwrhm+viIDTIVUSC16CZE4cUyc
	 8lifbZ/Rh+NrMcUviXRFFpqIYFRkGVM9LfixQNovAh5GT4lWAME+jXW/jO1VQ+zNh6w0g
	 D+JGW9DcrHM46FG7ziuEShNAZtJ0c+H4TrCy3PZvPirBI4Pi7Q661sAS59cX+Hkv/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lo2D6TzA;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6860A6F48;
	Fri, 23 Oct 2026 19:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF6860A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lo2D6TzA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785339; x=1793044539;
	bh=Vp/AYBTEkmOuhm+udpmABWKXdbZzkeNKf63Ou8UIdq8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lo2D6TzARB9AREKFhgqRBp/EaqgfONqrfBzNiSh0DrHBQHyZbo1tc7KK+jrpOdqfR
	 JB0IO/NUd/xLq5odGwyNRj8metN09pUFcAyq2USUsI7QtJdQFhuK4HCRvUSOcQXU61
	 xUlXe+/xyfNopk3CgVUCE6Oyk6nisw/1/9GRLywvVgdf09wXiZ5+2HilOJQZHAvQil
	 53seUqzoksJyLy408lNa/hq/Q4HpQ8Djf5P4AUZR6jwgttL1Dkie9EGRed8DwmNSj0
	 FrGoyHwG4kgBOQbGJ1CVrrL6+tQY402/rRzaS8B0ecACPBl5cY5FvU0VlQKmLzdrm1
	 GQoSTcu42Qttg==
Date: Fri, 23 Oct 2026 19:55:35 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 02/11] media: intel/ipu6: fix firmware message buffer leak on send failure
Message-ID: <20261023195446.22578-3-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: d8912a2165cee8d33450f6b015afae6b4c27c54c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ipu6_get_fw_msg_buf() moves a message buffer from isys->framebuflist to
isys->framebuflist_fw. Buffers carrying a frame capture command are
returned to the free pool when the firmware reports
IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY for them.

If sending the command fails, in ipu6_isys_start_stream_firmware() via
fw_ops->stream_start() or in buf_queue() via fw_ops->stream_capture(),
the firmware never sees it: both the IPU6 and the IPU7 send paths return
an error before committing a queue token. No PIN_DATA_READY response
will ever arrive, so the buffer stays on framebuflist_fw until
ipu6_cleanup_fw_msg_bufs() reclaims it on the next runtime resume, and
ipu6_get_fw_msg_buf() has to allocate new buffers in the meantime.

Return the buffer to the free pool when sending the command fails.

Buffers whose command was sent, but whose stream start then timed out or
failed, are deliberately left alone: the firmware may still own them,
and they are reclaimed on the next runtime resume.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffe=
r queues")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 4 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-queue.c
index 23d00e1f89..7a38feb911 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -359,8 +359,10 @@ static void buf_queue(struct vb2_buffer *vb)
 =09ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
=20
 =09ret =3D fw_ops->stream_capture(stream->isys, stream->stream_handle, msg=
);
-=09if (ret < 0)
+=09if (ret < 0) {
 =09=09dev_err(dev, "send stream capture failed\n");
+=09=09ipu6_put_fw_msg_buf(stream->isys, msg);
+=09}
=20
 out:
 =09mutex_unlock(&stream->mutex);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-video.c
index f394e78db6..c7e2dc1311 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -538,6 +538,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_st=
ream *stream,
 =09=09=09=09   capture);
 =09if (ret < 0) {
 =09=09dev_err(dev, "can't start streaming (%d)\n", ret);
+=09=09ipu6_put_fw_msg_buf(stream->isys, msg);
 =09=09goto out_stream_close;
 =09}
=20
--=20
2.56.0


