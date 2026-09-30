Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38B233942;
	Wed, 30 Sep 2026 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733729; cv=none; b=FhAQCaQzYsQBFXm5th/WQQPSt21ypsGRsP3f5cfvge7zQrfz3HyMfHiXpq1URjT6xSjnlUV4uOKrTpDLzJQ85tJ2LJw65/MLFtn4T1EbEpstu7jEi2grlZKs0xEmwXpM0QeGji80hRbbYcfKHwNBhygT5xTHfn0rHX/oJxttvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733729; c=relaxed/simple;
	bh=xG2whiBN1m0PqcB4f8tOB8aWp/2QT9hA9H68Z/QhCoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNxBO+9ZVMIZJQPA0GZRMzyJhQyqZqqVjiOC7Unow1/E2r7md6gSN3NzTftUU1QRj326VLzdh0v8O/WPDDgJ1wpUcczWldVtQ15JINhj7J2SID76ChIEvRVv7TJczy5VCVD+IBu4S0dRu75swCefyIMdx2HtNeRhVvRBch1DV20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net; spf=pass smtp.mailfrom=kode54.net; dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b=cvif+mRj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TZCbP6J5; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b="cvif+mRj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TZCbP6J5"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 812281400311;
	Tue, 29 Sep 2026 22:02:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 29 Sep 2026 22:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1790733727; x=1790820127; bh=ET9auoxOy0PNrbfUfJtJ0
	WrH4Q1mziAEohHK5xg0K7g=; b=cvif+mRjcZ3Q9BoSXYScHuqvyLzTRxVEqePK8
	NZXDsVUN633qdDbC4qfoGt3i7qSNbMHS0ylef8JCJKDFAaxobA/qWtJ+l3347qdx
	1NXt4k3kIaj4/eyW4WkwwvZggDm/UgOKLaNhJstziV6ORstkVay4Ys6lci5EKEIM
	i6ZkjVR4HvigAgEqRQE1OvZdKaFhw63QM2cKkQvsTwA4QoHX4ABa6apZm8DwvMgP
	FfZ5sldSYqtB9PwRUZvqyA6yg7MFGO0OKDwDQJbe0rwpwtRIqcAJAkyLGNPVkpts
	erONb5XURkiWFeMn3ldbXhT0k1ex6ydfJ5zYu1WpW8U2tibfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790733727; x=1790820127; bh=ET9auoxOy0PNrbfUfJtJ0WrH4Q1mziAEohH
	K5xg0K7g=; b=TZCbP6J5lBmY3m7XYNMWnbFayMhxV8dJN/tdAzVWONIBX4rDZIE
	DGUgFuvNNsd8Gb2IeUJVj7bxjHH3gNaq12qEtwaTwyRnx/NcJBe8eAnEJvtOgdOu
	Tdljoe4dEK1N4C7XOjkgOD/QLzShCYN0tYNhdervsQqYr9Y2OaMxud1vl1m43y7Q
	NGw3Eig8QrQ4l/1y2vxN9AdXu5jEa+vZAoQAYpKma3Qv2WMG3aOCeUeytfjt8Wku
	1N1BgBl6/iKDU6b1gr14Q4ruH2JKnWCMKGj1zP4TsPULX3ZQunOyUkcq0ZEnsEIL
	e0SyJuSuJ/XgQqVCSA9CxHVQV6vjFoSX1UA==
X-ME-Sender: <xms:n228aoIyXgMYSBTf8IbQG_slhKe9NrVIRCw_LIX-FOF50u5H51Sm3w>
    <xme:n228app39eFGKpYJWSe4oAoeo-WbVTjlXjnJ-XONy5lp9IHWgU_mFiE44ZLQst9Zc
    9ZDkXMI5syAGzvmCmzAsMQLN_LCkkS9Cjn_5RuxWqAHKQq8TJYCa50>
X-ME-Received: <xmr:n228aowFBsJT2lYo_DjhONA_H_DWZED7keXz2bq2_oF7rRwPtatZDnhuCkebJeDWplK09BdZ-_5XjfKmkIGumDc>
X-ME-Proxy-Cause: dmFkZTGVccPJfnK9/F+4ETkfd/symO6UyfN5MFwoVyBTmPJeeiWjq8PKXL77BSMDUzFd/Y
    zz7eAORWyGWgqKvIRH10c4wBH/PO1cHz/uPYh1HpEMOi/0gYB9b5VBlWCH7mcRSmnfaY3Q
    JFQBiYZDpJ2WXqm99913bM1KZEe6i6Be59O8rSEmnELce9lbkVNXbufE76v0skYPjsvzsJ
    DEoTe1cbKJWb3ogiEbJ0k2rn4DVByLbOt++JJczH+tEsGIzvaOe346x2OmlDD2Azmh/tCI
    wHnQqIYxSFvg6fJ39Hn9W0pW+IyLCGT0KZRQuLyPGptKXxG4DF307qPX5FyLYBFI3iIzsS
    jPrRzJi3MRNtjStWARYdAUwdf0iJRI3ydy+jkqsuw/JkBSi/PcQksIFAWM7V4stxihgIYZ
    ShfJ3Eflxje8jJQCLJJhTqTV6lFeOFhUpLCUQmUYLYKbwLi5Xkay9M8ZS+Y6356YqLL/sc
    jYZuXQRsa11uBRH4+yaR0M3t0JsozaksJWNOwULJo6BFVGcRIFhPxYq5JsM7vCLSmys7Rq
    rYbI+XAfL+c2ddCXSCDXPx/zfyixqrmPXNSRmzKr5Z2RM3QcIxd4uHWtYErusXesmLp1aG
    nuTaplto2Lv89S7/AKELUPg0FIZ7y+tsWPAn2qymhVAuHjd8JfjBXTmJktyw
X-ME-Proxy: <xmx:n228alN-mI4by3lmgOlQzScFpidXVN7NtpXKJJLW57TCCHthZdXiyQ>
    <xmx:n228al6jKX23wLK5FGuLm3--Q2jGwPNXoE9v6uwuuxoDAzp8UWEO5w>
    <xmx:n228amlEmsnrHpR5viIdzvMFo1tKgSpeibm0RT-KAroBNRvaifY7Wg>
    <xmx:n228amTRtNf5clEbRRrC0pJMMJa5gCXGq7bWmaTPGmbLigbIHxsrlw>
    <xmx:n228aqznQX0LfYnrbwGXlZh0U_CSAMRF0GxuV658S7lb-Uru0rF7197Y>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 22:02:06 -0400 (EDT)
From: Christopher Snowhill <chris@kode54.net>
To: "Mauro Carvalho Chehab" <mchehab@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Hans Verkuil" <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: em28xx: hold the vb2 queue lock when releasing the queue on close
Date: Tue, 29 Sep 2026 19:01:38 -0700
Message-ID: <20260930020140.85334-1-chris@kode54.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit de626073dfcb ("media: em28xx: drop 'users' field") replaced the
vb2_fop_release() call in em28xx_v4l2_close() with
_vb2_fop_release(filp, NULL) under dev->lock. vb2_fop_release() took
the vb2 queue lock, but the new call takes no lock at all.

The video and VBI queues have their own locks (vb_queue_lock and
vb_vbi_queue_lock), and v4l2_ioctl_get_lock() serializes the queue
ioctls with those rather than dev->lock. The queue can therefore be
released on close while another file handle is in the middle of
VIDIOC_REQBUFS. __vb2_queue_alloc() adds each buffer to the queue before
allocating its planes, so the release can find an MMAP buffer whose
mem_priv is still NULL and hand it to vb2_vmalloc_put():

  BUG: kernel NULL pointer dereference, address: 0000000000000020
  RIP: 0010:vb2_vmalloc_put+0xe/0x50 [videobuf2_vmalloc]
  Call Trace:
   __vb2_queue_free+0x14e/0x350 [videobuf2_common]
   vb2_core_queue_release+0x3b/0x80 [videobuf2_common]
   _vb2_fop_release+0x44/0x70 [videobuf2_v4l2]
   em28xx_v4l2_close+0x60/0x140 [em28xx_v4l]
   v4l2_release+0x9d/0xf0 [videodev]
   __fput+0xfd/0x280

This was hit with OBS on a MyGica iGrabber (card=105).

Pass the queue lock to _vb2_fop_release(). Taking it while holding
dev->lock matches the existing order in em28xx_v4l2_fini(), where
vb2_video_unregister_device() takes the queue lock under dev->lock.

Fixes: de626073dfcb ("media: em28xx: drop 'users' field")
Assisted-by: LLM
Signed-off-by: Christopher Snowhill <chris@kode54.net>
---
 drivers/media/usb/em28xx/em28xx-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add65bb5..85e7430fad57 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2474,6 +2474,7 @@ static int em28xx_v4l2_resume(struct em28xx *dev)
  */
 static int em28xx_v4l2_close(struct file *filp)
 {
+	struct video_device   *vdev = video_devdata(filp);
 	struct em28xx         *dev  = video_drvdata(filp);
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
 	struct usb_device *udev = interface_to_usbdev(dev->intf);
@@ -2482,7 +2483,7 @@ static int em28xx_v4l2_close(struct file *filp)
 
 	mutex_lock(&dev->lock);
 	last_user = v4l2_fh_is_singular_file(filp);
-	_vb2_fop_release(filp, NULL);
+	_vb2_fop_release(filp, vdev->queue->lock);
 
 	if (last_user) {
 		/* No sense to try to write to the device */
-- 
2.55.0

