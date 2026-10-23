Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785340;
	b=GfeI1zgu9tALxC8c8Pxt2/kQfruGFTGl5lUugpGdOsN/rxG626k+jWvGMgKlvpt68xPv
	 uFqU8UgU+K7R2RwKslDBIAyueWIyTO3mkB83EO/96kNpB2ZBHihdd7M07shghbrwhlvIx
	 teCzOP88UNfJbNMaQ6zSdZyFpdFS4ty0HxAL6T8/S4FUBl3B75uCnPOyl90n6dFm8ch8d
	 MrtavN1JcyYNqWYcLkySPLgLe2wRHgq8ew2ADOwjc17dCHK6wqoZstu9AxSQ8ytTJLj84
	 uJWROa3N8ioguMXe1EkpcDrao2QXQ7VkLPkBdeWdcljCOQhsmw+tptXQOTWe8xda34Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785340;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RXKCvpHJ32pnnjF1qsr+tNnlnW1UiL+VS2YSGEdo50Q=;
	b=Yvsplf7qEs4HETcQFBDZ/shvlBNUfn7en26O+jq/QI5dFkz/NiZ5BKrvS10W8kYSCEbh
	 DijaJG0UURr67RW19pluIxITybYBvra4dp+2qxhmaGtFPPFvzzJsmcHr+1TG83Js+skV+
	 waJlXQ+MHgmmUSVP2B6ABj9mHdhUZZlNmBY5i3kooJ7OH5VtZRW8cTuczNAh8robUSiHp
	 d/kQOfoBFXmMWddS6XE1obSxlHoOBbDGqUVSjUurb4Bs2xuizVk/0PcdTKZo3aesvNLgu
	 +Wjkw/VycUPzpv/+zfU8BCcZSBx0jVMCRCzhlJkXY7SGT/m+ixDPH7ffgUUblOUbQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KoU12STC;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAC460A260E;
	Fri, 23 Oct 2026 19:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAC460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KoU12STC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785337; x=1793044537;
	bh=RXKCvpHJ32pnnjF1qsr+tNnlnW1UiL+VS2YSGEdo50Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KoU12STCx7c2LuF2evST7rCBCI24GcWZdHNJEkR11kLkRnyQWOHficwZVlAtK9V0l
	 +w/3bh97pMdInUFFffRBHol88y+2UJiF0P5j+8UnPYEnIz8A/N6HTkNDi8PXW/o0kW
	 dyeywDHzpiMoBpNCvFPQlYBTmE7xVfIzqnRG0YGuC419eqZzXWNg8gjv11ui087pqv
	 iraRqm5I52Za+W/hFtI3YQfTtU+xnR/Qlk9YNsDSwWWdtOMpdBWwRx9sCmkHaazlhc
	 6Bjobwlz0wwicr+31cFfKj0ZhfzTLo71fwsrVhhM6JI2oC7/CmNMLoXBoODJqCFLqe
	 GHfddXFhEyoaA==
Date: Fri, 23 Oct 2026 19:55:32 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 01/11] media: intel/ipu6: move busy check to ipu6_isys_vidioc_s_fmt_vid_cap()
Message-ID: <20261023195446.22578-2-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 98b5aad615cdf6d10d28a9901dd9636dfbf368f7
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

ipu6_isys_vidioc_try_fmt_vid_cap() rejected calls with -EBUSY when
buffers were allocated on the queue (vb2_is_busy()), although the V4L2
specification states that VIDIOC_TRY_FMT can be called at any time and
never returns EBUSY.

Conversely, ipu6_isys_vidioc_s_fmt_vid_cap() lacked the vb2_is_busy()
check (unlike ipu6_isys_vidioc_s_fmt_meta_cap()) and ignored the return
value of ipu6_isys_vidioc_try_fmt_vid_cap(). As a result, when a client
issued VIDIOC_S_FMT while the queue was busy, try_fmt returned -EBUSY
before clamping fields or computing bytesperline and sizeimage, and
s_fmt copied the unvalidated user format into av->pix_fmt.

Corrupting av->pix_fmt while buffers are allocated breaks subsequent
buffer preparation in ipu6_isys_buf_prepare(): if user-space left
sizeimage as 0, the size > vb2_plane_size(vb, 0) check is bypassed and a
mismatched bytesperline * height passed to vb2_set_plane_payload() can
trigger WARN_ON_ONCE(size > vb->planes[plane_no].length), or if
VIDIOC_STREAMON follows, program the firmware to DMA a larger frame into
smaller buffers.

Move the vb2_is_busy() check from ipu6_isys_vidioc_try_fmt_vid_cap() to
ipu6_isys_vidioc_s_fmt_vid_cap(), matching the meta capture callbacks.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffe=
r queues")
Cc: stable@vger.kernel.org
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-video.c
index 129016e574..f394e78db6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -290,9 +290,6 @@ static int ipu6_isys_vidioc_try_fmt_vid_cap(struct file=
 *file, void *fh,
 {
 =09struct ipu6_isys_video *av =3D video_drvdata(file);
=20
-=09if (vb2_is_busy(&av->aq.vbq))
-=09=09return -EBUSY;
-
 =09__ipu6_isys_vidioc_try_fmt_vid_cap(av, f);
=20
 =09return 0;
@@ -324,6 +321,9 @@ static int ipu6_isys_vidioc_s_fmt_vid_cap(struct file *=
file, void *fh,
 {
 =09struct ipu6_isys_video *av =3D video_drvdata(file);
=20
+=09if (vb2_is_busy(&av->aq.vbq))
+=09=09return -EBUSY;
+
 =09ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
 =09av->pix_fmt =3D f->fmt.pix;
=20
--=20
2.56.0


