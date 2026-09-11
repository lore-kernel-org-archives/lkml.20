Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129344F541
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156177; cv=none; b=dwsdZqhwNn8Jw6wyXwqh6ZwBFC5LInS+scu6jzog+cvvfpfV5bOegv9QIxh8VHYaFFLtQQntkUp8FPjxStQ9KpM8LArIHZ35fGcWrXgKUonGGDK//Nq/0gRKhnO/3ujVDoCq1drWnDa3ZMFVqRBsv/zX0DeiSXfWtHEZ/zHE5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156177; c=relaxed/simple;
	bh=8L+MJLvc8rpMWflVBEwSbVEOm4tg7Z8cCjwZhqNT8cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XskMnTbq04TNz7Rm7+Rd6xfV1aK7Q3eSddno1PCr8HupDIIeNVZRusxaHbyVX1JeKxsIVeGL9b8kUkT69aGpyW3AuJmxA5VCoIFUtZYbw2zUV9FHeJXk9LrNnJryDMpfG3bl89XRzzVmP1YHTEeJDTownL22n3WeZj/axQ4JdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI5jOqlU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI5jOqlU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48589798dbbso1216448f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156159; x=1789760959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO9sSaJXgVUZLaMrL25og9Fl/eV88WCxkq1iFkvm7/s=;
        b=tI5jOqlUsH9OVr+AG91u7vp12QRfz9buPzCOVtV2TrC5coSGXUv/L5Te/hyWkWcc++
         zRathPxKMbXOW/MNPbPncn09EFu8MFIueL2qFzAlJ27aGuVkVG9+hgQO+zfY3Ke2pxnU
         4aZijt6dnHuUK0N6c1kd1/TdfL5jamioNGN6at/jjKeW//H+eyxFWNRc44n4cNz/8m1p
         y14lnROALYRdSbth/wW3Y+T54xzADLYVk9roCsz+5opQ9Lr3D6GtJ83zZ8fNQZbxuLFG
         BKL/Wr2h6AiR+Wr62Mpc5s0fpq/gJlxYmPh7XWP3MdljdWM49RNFQEru5CR1OvNF6pxA
         dcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156159; x=1789760959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bO9sSaJXgVUZLaMrL25og9Fl/eV88WCxkq1iFkvm7/s=;
        b=FJdLXLdUAjxJl1nf42XnQm7rLJ+QpZB4Dzi8tG5ZzvuQJcX/9jWc9zHATBknQlSHqq
         IRi/4NZWPEbJs7Fs8h9oamgFlmnLIHUFjqPgmCrmrZIQb1tGnX4Tc6+viR4Sx6nMbI3K
         7Ts9M3OrjJ1SnKwLo19q/EIgUEkT3wnsxLcS3IR/HIDrmtsLJYVXBrxzOVqd7lqiMOeE
         YktMsZHz4QwNK5PjgigoI1U5gilJ2Adw5zckYRULapP4BLi+HmInxMg5b7sWCUlCq55j
         E/me2VeQbYya82XFIyiYoBLaNAuVbQ8iULMwAxwxxEaxvi2BuenqerYuyU/1/vUTrptC
         5TRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHl7LKuMwtllKIQJcD0TckM179jJHPipP9oF2vBTa4RtI2bcnxJBxPXfvAmqiZFCf3u7BQichsVewcgPE=@vger.kernel.org
X-Gm-Message-State: AFuF++keMWvTetiQeDT5Dhpzfoj1dgb7+Wm1g7s4W0CZntwvHazyvnlP
	ofXvM4SuzyXASFP4pLQaMRMpu+X9J5B4EZxOGFk+Bn4c9+9+jYTMZ15gGoQHB63G+nU=
X-Gm-Gg: AYBFou3AszKUgVJQ4m4ijt56qPQWLqCEm48PqWDKeravghcKgWxK8A7ZJPAVRaLtIZ6
	pgckUhbTnbGmrMQac8X6aqgbDJJqhM1vBIy+u92o5AAzOaUTVdya/Mua/uLEnIVDerdNXAzE6DK
	mgSw3Ql0jgsY/tbKx/pdGN6/kLQY1OPvLmkAJp5YkzW2jAJjaKfAI0/OefyU/HMIlJIn8xp9Acy
	czARAH/XJfD7TbiKGXyR78quR7zZLJmrWiBpDGQwRRbbquna85C9Wamjw7nuRoTyRWBXUiLUK7k
	efWRah/+Aas6WqK25fBtluTSRXUBIFl6d1fygvkcrq0mmBf/eurSFYyPCCcsanHwJ8Q5B8DZT6m
	AQs1iWfXxzxOFOH6ci6ojAOWJUZ1zElfAvFKQLacczcBToGLytci+UFzWyh1HMwmHUVN/U3/JEK
	F9PZ0dDtsmLLIbaYizgDm1aXQlStChAP5z+BkRcXmMHvB1HTOizV4f+r42kx7kGGKBg+xMk2hKG
	WEHKSKj0VjQ7LJ/Lk9TsWxoUmwp8oxJPnQrntSVd/12evP6jGDeUYYESO35MZKtzMpf7T601Mki
	TNN2+Gj+JfhoCrGT6X6GMdZ2f098HAUFfqua78rhF5AOvpNznS5UN7X4Nso4FgZgIqg0KPdzeJQ
	1imWFhr0Sb3ScowkM4riqZZUZ9gA57goj5HwMU6HXDDJ9fWdM
X-Received: by 2002:a05:600c:c491:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e619bb949mr72530525e9.20.1789156158588;
        Fri, 11 Sep 2026 12:49:18 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:17 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 1/3] media: ipu6: Check the remote pad before dereferencing it
Date: Fri, 11 Sep 2026 21:48:52 +0200
Message-ID: <20260911194854.78894-2-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911194854.78894-1-nicfio@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a sensor driver while a capture is running oopses the kernel:

  BUG: kernel NULL pointer dereference, address: 0000000000000020
  RIP: 0010:ipu6_isys_csi2_disable_streams+0x3c/0x70 [intel_ipu6_isys]
  Call Trace:
   v4l2_subdev_disable_streams+0x1b7/0x370 [videodev]
   ipu6_isys_video_set_streaming+0x20f/0x930 [intel_ipu6_isys]
   stop_streaming+0x102/0x110 [intel_ipu6_isys]
   __vb2_queue_cancel+0x2a/0x2d0 [videobuf2_common]
   vb2_core_queue_release+0x22/0x80 [videobuf2_common]
   _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2]
   v4l2_release+0xbd/0xd0 [videodev]
   __fput+0xde/0x2a0

media_pad_remote_pad_first() returns NULL once the sensor is gone and the
link with it, but both the enable and the disable path dereference the
result unconditionally. The faulting address is the offset of the entity
member in struct media_pad.

Check it. On enable there is nothing to stream from, so refuse with
-ENOLINK. On disable the receiver still has to be stopped, so stop it and
skip only the call towards the sensor that is no longer there.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, with
the CSI-2 port of a sensor being unbound mid capture. The code is
unchanged in v7.3-rc2.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---

Unchanged since v1.

This one collides with the IPU7 work; see the cover letter. A version of
it rebased on the ipu6 branch of the media tree was posted in the v1
thread:
https://lore.kernel.org/linux-media/20260903202820.8401-1-nicfio@gmail.com/

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6..c00a82eb8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -356,6 +356,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return -ENOLINK;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	sink_streams =
@@ -392,10 +395,17 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
+	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+
+	/*
+	 * The link is gone if the sensor driver was unbound while streaming.
+	 * Stop the receiver anyway, there is just no one left to tell.
+	 */
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	if (!remote_pad)
+		return 0;
 
-	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
-- 
2.47.3

