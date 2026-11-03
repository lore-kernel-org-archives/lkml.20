Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740251;
	b=ZJCR7zllcJr0XMtHZdwsOG83I2hZR1uneam+5xKvPr4Alp9yI2tqM9MnBl307nkhk5rZ
	 dspkiSuImvKpNVC7HhrbwUlDIrPLuFrQFHBmEpOGO0qe+088TCXnnIE7GmfUqSBXfQtdH
	 /7D3E04lcpRSOtay8DomMc+TkWjt/Rp6gkyPHOLFoQQD4KsIyzNbQYRnZ1kq/Z036dLfN
	 fl30fro5zarbpwlkuoqHLU0HfYH4/c0HQ66CRiQBKvB1vu3o0jQyD4JdUeQz3kWTrPpzn
	 AebVmgUaQ2sUoyjVfeePr0NsAXsp5Knt8PIxwKQh2cXvKEwf6tNgRqxUk4hK/DElfFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740251;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kMBTU/GrRL9u82HP8tmbPAJZU3W55pRZ2D4029sk+gg=;
	b=i/9WKn+woNS+67nLJiAPl57OS/hq3Rruaq/Jv0DhPZHSecXuoja3uSQKy94kZqgEvAYS
	 GIMcsWLBsv9dYS36ZXXFs+tGjBIb9HRmJUXUcRlRDaW2Ur7QhMEvyquNKi5zNLDY4cb91
	 v5QSLrq3oZowaEZUDSaPmNHqA7p6gH+ZhsX2oeuwGoovFzTV4O7EN4Q0xXJLJubucBr1a
	 XRDW7FMMbJbYr3km0Log/5u0Qs/LqV3UfEBQo844pdP5sa8CD2nZxrgCkIK/WyILjT1kc
	 0wKkXMdi1zof0rDCpoZndXCmZtp1uu2FVsOuynthXP7rW48Dd+Wqd+AbLQpBSUR5YjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=IlCl6Rgb;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515D606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A515D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=IlCl6Rgb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740248; x=1793999448;
	bh=kMBTU/GrRL9u82HP8tmbPAJZU3W55pRZ2D4029sk+gg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IlCl6RgbwTpV84AJ+VLPutt1MjXsAxM3ceeFycs+X8GAcO2UE38fOsZCbjjVYIaYE
	 hr6newf+/uraY+z6Gckta2rSCpYzl3U7jtDhhZ6pnoW1+EOFRux9RwAGqHlaRehw5y
	 niUqQpfxMxk41EwAgl51HdkHj5EInD22Iy58KABiFtrXpli8xb6KIFDpqkjCNg/8eS
	 hHHSZgBXCrZUaCFTlDlw/PB4nW7rMQNU6GeqmjxTAT5rmvoL3gPCWZ/6ykTwduLzm6
	 72CxizTax6WU7GE5ttly2Kl7l8s0AMXPExa4/CO3bs9BXVFRbnPw3M8Tw2lwB3zeSD
	 Yx/EprOluTiEQ==
Date: Tue, 03 Nov 2026 21:10:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 02/11] media: intel/ipu6: fix firmware message buffer leak on send failure
Message-ID: <20261103211031.1573726-3-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 12a5c87fa3478f5ff65f7829ec21d6d07c3e4a59
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


