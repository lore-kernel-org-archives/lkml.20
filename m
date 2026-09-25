Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E82B471259
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323306; cv=none; b=qvf/HAVh84PysWpiKqoTezZv2DMerehpDuCHjgt2om72zXLj/UNWVPt41gX4U5pQ8+K+X1t53ANdicrawa5ZBwpM280MwIQnBiguGLPoUL8NXvR4pjJtIN+CPNSvz/ExUdB2ymbn9YjLxoV642Y6wAwtdJxx7bPNgEOBh+H5/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323306; c=relaxed/simple;
	bh=l+UTWai1dYY/ZEpL8dyIn91Ds9SFYRgRbj357nizg5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Er2+jKRzebyx98/QVjX/cHs76zNASG7ROZKQkT4xG8Xcg+TqK0Xzuw+2UMYo9NZqD8PnzyySfxUId728wR9qBD+kS3QbroGkr9JYRpf8k3RpCAMWzj0VyNf0ISwlHmx0VLInCyhjqFx8gQaO7kapi+GWc06gILRn81rxNFppvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai; spf=pass smtp.mailfrom=getfieldwork.ai; dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b=SfnZpKPx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b="SfnZpKPx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1988595e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getfieldwork.ai; s=google; t=1790323302; x=1790928102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOlBBpGD3Y0REYiLwhaWxhjVYik9/CfvZxRnEgnvMuo=;
        b=SfnZpKPxH/1sIJJghdHLrkm9E4gsgIwoDFvpeoY3D3aA104rsFsjMwhf9B2yRsrHOe
         INS0I6cwCiHHWB/FtQiUUsYz1kFYmiSO3Vnp2jQSj/vIOhtXF3GAJI4o0tWFuZ4m+ZBj
         tER57+9E+V69pL9x4/sl9QlgQZ146NW2dhvSoQnKG3pp2M0UDYGGme/zuMFqB0+t4rf6
         1KTVlRdXOo57zJiiXK97SVSv8XKNPPO4V1lFgVcXRmob17l8UODItBLMP6SIp/CuEFsh
         dESFvYORiA5QEBRujGgUsUBO1JfLbM1ro/bTZzKQqatMoZKfwWVpwN77O7AMPNgNp7aJ
         j86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323302; x=1790928102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOlBBpGD3Y0REYiLwhaWxhjVYik9/CfvZxRnEgnvMuo=;
        b=KdJAxtiwU9euq88BMaE1a7Z1eLTPx3+wKl3T5oVaoTDpXtF6aia/XERr/2sneD5eDU
         Jfe9iwJMLJUZaZDcrFmEkc+9m+zTDEDKkfWdjNbUbheFjA4pQEP9LhpngFTw5kCmpDgl
         afOETcwVURVZM5K3ruWLm3bfuiCFcDKH12/YFXy1c1mhf0T585+ZeuxfC8Qmg+iB8pmK
         zwx03V1DndpkzOZEPZ2BrIm0KlOhTGBjYk++z8C0UzJpqKTu3nNPgboLNm7326CZ+cF8
         bOuBpUGyZH79SbyAFwjpu10ooaCqbWmKrYDrmIYe3SFxYMeJuVEq7knsidyEz+0tshqU
         t6kg==
X-Forwarded-Encrypted: i=1; AKwUvBxA7AJbPjFQuJKEN9RzpiwFj1ngC3IAW/tW63MuTCt466GQzRgSURbVgIMxuf+HKUXkLkL0Vm2sWTZkuPM=@vger.kernel.org
X-Gm-Message-State: AFuF++mIr9H4BQyiiUYzlZela9f9TdZY7zikvtcAJf4yP+wQ8W9AOele
	P7gI0cTAclJyc7+mYuZ+RXllTNuPCKovpL9G90W/2SEfpp2OspZqxTGH4WMveTjSVSYz
X-Gm-Gg: AYBFou0DQLZEQ++RJD/Lxw2B7g+e7yQPwOK7i5m9MwdW61zMDyW58n7gTeY2yIzHCcl
	9tmO9g7B1GGD/V9BN794X1cZVO28aEIzfcob8Rk9ojK4lxVr5hZoBY4Dpf1HvvWIsF3JsRupoju
	Ll7A93gUWQ1xZP+IIcuEbCrWTkHfJPdmE2bjYSX0v32sqZbnbOhA4dHbwykpD2ODV66a+lm5MrG
	GyQlPRv8K93AOZ6zk+K3v1tP2GimrRTANmamHecrThByhES7b6bDQ6LZ5fswAnsL8hTak+0SCCO
	kZALYboONFLjgq4nLTMs4JCGflnWJ/XSMtD7xI33qSLbzdMWg7mh8XB4rwANTP9hL0CDTe0MRps
	AGPfYIK4rOJyp3IEgGHg/29nsoGfqqDSBZ+BCBamnB3qIUgbAf/TUZWWWIqYwnSjPNPpeG1G0rD
	OichNCMz/tUyGmqOT3oamu76Vj+VomhrkINw/3SJPILG0+8ACVTvIWY79iXAhr6FUOgm2xcQdEH
	Rpc9Oy3IWlZJXNdzz1UfWIrRSqIJaQarTN7XGuR/KD6ozqDBKCZ/RfeMaRYLK22h6D/RuRMmIA8
	Tiwv+MFSV/YloGXtIHX3OSk3mU9CDNDj+qVM/PGhgQqyPz5kLqSKA5R9NKQ=
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr77962585e9.8.1790323301545;
        Fri, 25 Sep 2026 01:01:41 -0700 (PDT)
Received: from NicksFWMBP.taile41d51.ts.net ([2a00:23c8:b064:8301:e401:b461:4e5:786c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm21662945e9.13.2026.09.25.01.01.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 01:01:41 -0700 (PDT)
From: Nick Rogers <nick@getfieldwork.ai>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	adelva@google.com,
	aesteve@redhat.com,
	changyeon@google.com,
	daniel.almeida@collabora.com,
	eperezma@redhat.com,
	Alexandre Courbot <gnurou@gmail.com>,
	gurchetansingh@google.com,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mst@redhat.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com,
	dbassey@redhat.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: virtio: clear the size of legacy controls built on the stack
Date: Fri, 25 Sep 2026 09:01:40 +0100
Message-ID: <20260925080140.44696-1-nick@getfieldwork.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923162928.73497-1-nick@getfieldwork.ai>
References: <20260923162928.73497-1-nick@getfieldwork.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A driver without a control handler receives VIDIOC_G_CTRL and
VIDIOC_S_CTRL from the V4L2 core as a single extended control that the
core builds on its own stack, with the control's size left
uninitialized. virtio_media_send_ext_controls_ioctl() takes a nonzero
size as a payload to copy from userspace, so these ioctls fail with
-EINVAL whenever the stack is dirty. GStreamer's V4L2 encoders set their
profile with VIDIOC_S_CTRL and cannot negotiate, and v4l2-ctl cannot
read the MIN_BUFFERS controls.

Legacy controls carry a 32-bit value and never a payload, and an array
that comes from userspace is copied into an allocation, never onto the
stack. Clear the size of each control when the array is on the stack.

The core is being fixed to zero the structure [1]; this keeps the driver
working on kernels without that fix.

[1] https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/

Assisted-by: LLM
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
---
This applies on top of the virtio-media v9 series and turns point 3 of
my review above into a patch. Build-tested on media.git next with v9
applied (arm64, W=1, no new warnings).

 drivers/media/virtio/virtio_media_ioctls.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/virtio/virtio_media_ioctls.c b/drivers/media/virtio/virtio_media_ioctls.c
index f0b82b5ec..19abcf95e 100644
--- a/drivers/media/virtio/virtio_media_ioctls.c
+++ b/drivers/media/virtio/virtio_media_ioctls.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2024-2026 Google LLC.
  */
 
+#include <linux/sched/task_stack.h>
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <linux/virtio_config.h>
@@ -576,11 +577,31 @@ static int virtio_media_querycap(struct file *file, void *fh,
  * Extended control ioctls are handled mostly identically.
  */
 
+/*
+ * VIDIOC_G_CTRL and VIDIOC_S_CTRL reach a driver without a control handler
+ * as one extended control the V4L2 core builds on its own stack, with its
+ * size left uninitialized. They carry a 32-bit value and never a payload,
+ * so a size there is stack garbage, which would be sent as a user pointer
+ * to copy and fail the ioctl. An array from userspace is never on the
+ * stack: the core copies it into an allocation.
+ */
+static void virtio_media_legacy_ctrl(struct v4l2_ext_controls *ctrls)
+{
+	u32 i;
+
+	if (!ctrls->count || !object_is_on_stack(ctrls->controls))
+		return;
+	for (i = 0; i < ctrls->count; i++)
+		ctrls->controls[i].size = 0;
+}
+
 static int virtio_media_g_ext_ctrls(struct file *file, void *fh,
 				    struct v4l2_ext_controls *ctrls)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_G_EXT_CTRLS,
 						    ctrls);
 }
@@ -590,6 +611,8 @@ static int virtio_media_s_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_S_EXT_CTRLS,
 						    ctrls);
 }
@@ -599,6 +622,8 @@ static int virtio_media_try_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_TRY_EXT_CTRLS,
 						    ctrls);
 }
-- 
2.54.0 (Apple Git-157)

