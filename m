Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A0339B3D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930765; cv=none; b=o+SgX38hQ/FmrchGQ3CNBMFZMgf7OcG3s0Aw9kyWyOzTOQqYSwKBXyovlrWIW9VkW0A+UlPokwwg/lhzJIyfIXmydrePfYPC88QfkHPMEaoHboQt8wsJoPaqBWNvWRpz6jUOlvrIskt6DAFSIOnXu7RgqjNM2H17HMAlizWHWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930765; c=relaxed/simple;
	bh=gW+4ygGqzNQ0vb9xxhCKDAwYheLRCq2jrlm1+aBrI8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWxssouCY0MjGB6IZWIwgrNAb6bk9T0fiySMsXoJVig2aC7EzT6QO1SJXMurRILMOCacigFr8BMlsFfsEb1xiX+yqd+s3ypqkp7RBwWK8VhGvXkz265e6DTX74JPIMUrSinT6FlVm0GjUkK3ot26y9LRtLiKsjpHObIqtLshCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkM4R6y/; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkM4R6y/"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66ce5312ca6so1077235d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930762; x=1788535562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chm6rlj0DMPuDVYMC+rhuNex9L2iYUVPl3w1NFWhG38=;
        b=JkM4R6y/7vuf3+GLmXpvnyUZwS1IJKpXPmXDuYrK4w6anIMgbQQApwKGTRMGIOgL9r
         YPKKBlf/ZlJBDBr6gPu+bbuRi/YdZ6oonHYuND//QcN4AziUPYh5VhW6mMSWkHZlOVe7
         psOgZvTUX++gxu7t+XYNAcQyMVXLNyFN4vVLmZlyW8JXPsiz8pz+oB94z3/EJhuBSFiu
         /sjYXnKTwgvxLtTSn4Vj0TY6zasEAd3QUyu3wx/UZxpYBBpttqrMmFDgZztXnOEWvb7t
         TxIgS790PbUCa/NynAUdCwlQPI+6z567eDVFFNTZTgJRpbKXM9K9eI3OTjWOjz5UCVsg
         YfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930762; x=1788535562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chm6rlj0DMPuDVYMC+rhuNex9L2iYUVPl3w1NFWhG38=;
        b=QgnFhTidCx6pl4f9oUvgkdWYt2Ca0FtAoJov8wihknm+EvYeZWv8m/EVSYKnx6SaQ7
         gu67RZ/g6z2suQUKWBFKPm2CHUBFtp0UJDsA4F2gq7TtNXFi9nUquJRnypO4AL6IexlC
         pGqUT2hBpfTtMQDKRKIGl8dnV2CTad70xWmQZXeCXWxYtLSdggRIujHacl9DqosNccwr
         tk2xGwHMVcQsPa9QXWf1zCWl7nvdfedzzGf+sTynjq2gvVwJQET8Y1GtjRJF3g33YtRo
         PvBnOSt1WPe3+m3KlT+SvcLUWsPVtS28iuj+12S53rwHiRMrmSom5pNO9B+GXgduLUzg
         c/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzjpo0D2x2mLuUR1nVkPkDjGl7YMKRzCC07+fztUrVFzub5bt5BFgvWir9BbwKw2CwAqfLjZaj21qP3Vo4=@vger.kernel.org
X-Gm-Message-State: AFuF++nAJuwNQBpMxgc0uUJB26ztkTBIK9XBJnIlZYgDvHB/EjZ7AUe5
	7TNeOrJcF5AAUbFb6397BVnqPl6dHb937buXUB5YOXWkyMbpDiJfKfWM
X-Gm-Gg: AYBFou1NQH02b9At4c3dMn6ZbJh67YQaEXQEbRuhay+wEfEq28HNhrqcS9gljmRGZCb
	66C9c3F6eXEu262khGN7DpYXjCpMLv6hR5Hdpvhs59N55owOFe1iOv7hyXOJrpHSOyK4wBrVvsm
	zDH4lL6TGu5Dz7lfdO574EK+gsd5clOifGr0ToNlzqoDCGKz7quH1g5D/84vyG/1fRjGX4qixPO
	Roj5p2kPjPV2pmGW76Yxm1zLlAjK1QJt7OtqCwgrEBxecyD6+jyf3fUfpyNH6ud9IbNA4N5bhdK
	biXNnfwqSgbag2MCriQY3a8i1T3huyI4Sw9+YzV+kHKDVXN44EHYRZh5RyX4zjcev7gcKvhfh1l
	KMsxp4v6+bcsJ2/RT9GQlINXqvsFxS3Nd3UTaB8+gFJxs45sXzeUS3/sjLd4EqoQQX0aDHoSvCo
	Fr35M5Ju3bP89ueyOx6xI8OjoA02zljhb3RpTZhdkEAWn6XPhKiHt699Mbem7nNvDLgTBxEL6m/
	RU6qId3Ffkq/UpqGge/PwzjqlAM8it4NTBEZ1j+y+I=
X-Received: by 2002:a05:690e:11c2:b0:66c:8e41:f5dd with SMTP id 956f58d0204a3-66e4c698a3bmr2106100d50.15.1787930762160;
        Fri, 28 Aug 2026 08:26:02 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e6756e0f3sm8064327b3.43.2026.08.28.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:26:01 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH 1/3] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Fri, 28 Aug 2026 11:25:55 -0400
Message-ID: <20260828152557.653475-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828152557.653475-1-jordan.mymail@gmail.com>
References: <20260828152557.653475-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A control with UVC_CTRL_FLAG_AUTO_UPDATE is one whose value the device
changes on its own: the driver never trusts its cached value for it,
re-reading the device on every VIDIOC_G_EXT_CTRLS (the rollback at the
end of the ioctl runs uvc_ctrl_commit_entity(), which clears ctrl->loaded
for these controls) and re-reading it after each write. That is exactly
what V4L2_CTRL_FLAG_VOLATILE describes to userspace, but the driver never
reported it, so applications had no way to know that the value they read
can change under them and that a fresh read is worth issuing.

Report V4L2_CTRL_FLAG_VOLATILE for AUTO_UPDATE controls. The uAPI
documents writes to a volatile control as ignored unless
V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also set, and this driver sends every
write of a writable control to the device, so report EXECUTE_ON_WRITE
alongside it whenever the control is settable.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83..aceb26310 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
 	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		/*
+		 * Writes to a volatile control are documented to be ignored
+		 * unless EXECUTE_ON_WRITE is also reported. The driver sends
+		 * every write of a writable control to the device, so report
+		 * the flag accordingly.
+		 */
+		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	}
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-- 
2.43.0

