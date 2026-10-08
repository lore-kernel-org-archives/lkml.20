Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00F3B1035
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433607; cv=none; b=W3dofpQ6OFD38IvETxMyTcCPWbsqMaBHtnZ/TKbdTd0bymx2CgysQdFTtOleceQB5g9Bt4nRsVvEFDAL9VLiFi+CmdsWZHeKECHyA2y+MsMlgI5XpY582mIVX07/8E8uZJFofpw9ASdqGsxBfy0DP3wC4+3vDzyQTUZ2dsDEodo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433607; c=relaxed/simple;
	bh=cUv6hh3W9DWi6C990WriU1Uo7wUq9iqSOj3YbxBud9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/rsM/dJI08c8OcCHk9dXOsbhWL6YLfM0hlCK4+L2fOE6KSCknB+FVNp56RYlsYlSikqwfJrkUbXzDT9SUJAb4AqLL8HSEKZzpu9mQUbS7h4PbwWQVSVjtuhIN4eK+ZdBjBpXdzQu9QOSof1nTXzqBeLTTXqPkV3T1xaVZ/DMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2BDqdFj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2BDqdFj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so30005175e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433604; x=1792038404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvEa6S/dJFZJC2lyZ675Rkq41lS8wP1soF2ixtoNMag=;
        b=U2BDqdFjyq1cd1JLOJj355IoZ2cWKLkgs6pw5vrgtL3jIC9NZncGGplWgb/9o3rop/
         jO3XRZV43A8FSbXclyZ6xZQLjxGGDhxWu33f8nYIVNUSTB/am4L1j6VcV44CviQL5dP8
         M3j8fptz0dxHqGd+C2wn05m8hjMW8Pg90n9/D9Heb+FNEsMSW2k4MOU3FFKhX5SXBRJ3
         /vdNuGCveHT/mmGykEqRJqO4MhZB/17b5yL21B5e5+zt6SYKdj/gyf06YHezXeg3Nl8O
         ICfC4MyTkDuY3LuA362H6FZ6O6XkyjtIY02LeP8+pWqG6K6CW4ABKByIdOvQfHO029yT
         UpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433604; x=1792038404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvEa6S/dJFZJC2lyZ675Rkq41lS8wP1soF2ixtoNMag=;
        b=pp2+X6GwQqzZ6DNgbLCQQqK9c4I2OTebm4GEKPaJOLN2Um1FIq/B/GPDq7DbPJoNVi
         oENwWYnD75ul4VyhBBXonB48wr/UWMx69yfmmwT0CDIOnMJ2iQEhcsUcGZsMEEnhiLkR
         rL36NhQ/QlgGSYNpRji3rBK6jllFVXiOsRJr5+IrE56D5rxbhcmDEPHeKC44bkCOI9h6
         92e0eVwBjf57ZCa1O9+95O22ulU0PAJKGQuqFUx8GbA8NGIH4Gpp56ZuAc8zTdryUUwY
         34qv+XJJ/ap26bvLEqcKTxZ3OmCicGjnjFPpGSOTs6exzbg7ZT/A+o73gTRRerdUFQsi
         12tw==
X-Forwarded-Encrypted: i=1; AKwUvBxjihVZqGIZLucSYZqt8f61iE+dItlqa9YJ4vyD0rcDFyE1TxfO6gTV9XjqpSIcnal2yGzgnKEKmibev14=@vger.kernel.org
X-Gm-Message-State: AFuF++mUG4RA+2ncO7Ed3H0u2jKSoDEtUhyOava+OFgOtptv5tdZxCY1
	AprWC2V+L8LVZx63+tTB69p+o1adMvhLb/+0ArgYrSKsm+Ym2XeZpq/B
X-Gm-Gg: AYBFou1GvTWp/RmIMd0Wt7HUNLXflBmtm2M6ckkF5XRLnMkapOqJWDPcoYyji15Q/pF
	066Aaq84gCMXwEJwrkGW3l/NPxOC3Q6PAuHn/N7eHshLS8jUw/GSmEuGs63cleBzdy/DfTP4YLx
	RxWx1pLS3FQieIpQXppG6+IpY3KJmPMy3AxAAo19Lq0ILNJNG69RUeCjqp/ieBLaqamdmS0wR33
	oW169T4+23kB1TUE+GGGSFYDXygKobEErhz1mzQ8EN88wEIHTksdm1oSZx74lGgf7zjTeWZHNrw
	GM6dPbvP+DuZj+2/3U8KOfq3JX/Ddz1Y0YN5WevA99iAmFDvG3FVpY2QafkffebmMuqQoqTpIlP
	hdrXtCBspG2hf+ahbYczFOZvwVASgXOm+GWsztjy0YdOK36BLrnHgNVVIiB7V8s05fe/gXf0a6T
	zZlsloup+Cx6zMaYQ6lxogHN8TUXcspbFdJ5updaoLOkMaJmHoPnjjqK4d5AG1ZnXVN93pT5kyz
	WwgpCvM2oxco55mOnWTtBvoCVUePBEgym/922+jy6XOCUJOxfCkp2CSOkN7XY/krZHxG5Gli6yS
	tNLiuee0zhYzYGcuisDseS8p5Uv4lQf6vS7ju9ZwoA3IOM2jyMVOdgnRwDc44nMsGtlZO36Qd/B
	CZWD+p2FVP9jeyKN25sAVUBEH5ZvX/To6RCd2PggAbeT2MDfK4i2wvA==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:746e:589a with SMTP id 5b1f17b1804b1-4a18045579amr66658625e9.18.1791433603701;
        Wed, 07 Oct 2026 21:26:43 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm88071375e9.1.2026.10.07.21.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:26:41 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: v4l2-subdev: Fix NULL pointer dereference in the EXT_CTRLS ioctls
Date: Thu,  8 Oct 2026 06:26:00 +0200
Message-ID: <20261008042600.275884-3-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008042600.275884-1-nicfio@gmail.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS and VIDIOC_TRY_EXT_CTRLS on a
sub-device node pass sd->v4l2_dev->mdev to the control framework.
v4l2_device_unregister_subdev() clears sd->v4l2_dev before it
unregisters the device node, and nothing serialises the
video_is_registered() checks in v4l2_ioctl() and subdev_do_ioctl_lock()
against it: sub-device nodes have no vdev->lock, and unregistration
would not take it anyway. An EXT_CTRLS ioctl on a file handle opened
before a driver is unbound can therefore dereference NULL:

  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:subdev_do_ioctl+0x1926/0x2550
  Call Trace:
   subdev_do_ioctl_lock+0x246/0x5c0
   video_usercopy+0x47b/0xcc0
   v4l2_ioctl+0x187/0x1f0
   __x64_sys_ioctl+0x134/0x1c0

Use vdev->v4l2_dev->mdev instead, as the previous patch does in
subdev_open(), and as the video node ioctls already do.

Found by reading the code, then reproduced in QEMU with KASAN: with the
previous patch applied, threads looping on VIDIOC_G_EXT_CTRLS on vimc's
sub-device nodes while vimc is unbound and rebound hit the oops above;
with this patch the same test shows no oops, KASAN report or warning.

Fixes: c41e9cff704a ("media: v4l2-ctrls: support g/s_ext_ctrls for requests")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c56ca328f..1a2ae7c13 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -775,19 +775,19 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_g_ext_ctrls(vfh->ctrl_handler,
-					vdev, sd->v4l2_dev->mdev, arg);
+					vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_S_EXT_CTRLS:
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler,
-					vdev, sd->v4l2_dev->mdev, arg);
+					vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_TRY_EXT_CTRLS:
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_try_ext_ctrls(vfh->ctrl_handler,
-					  vdev, sd->v4l2_dev->mdev, arg);
+					  vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_DQEVENT:
 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
-- 
2.47.3

