Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB9C2F5324
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308758; cv=none; b=d9ajH8Lzx8ISraKGwgRVaANuORv0iFBB0dL3N3iqvrfBew//obouWEqBPfm855lHqT5zgTOIlLOkKG0dGSKd8Sjy0cTEFSHVIdaQQQzh1DWU4O5DSja9DMmPGEL3BlT/OiH8alUc/biFY630qZHC25D/XMeLf1E6tP3r8ER+W4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308758; c=relaxed/simple;
	bh=OrguBF0469JG2pK3364edLr8OvZI7wEyhEIZ6DU16ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiULu57rDht2K+rqeQ8DhsE5rvclcrZsh5qHcajB6qNQn/Mlu3KoxE1EMuGJKEZX/Z8XDeWEz1rCBWOV+7kFoES7oj0ODCmuxulQWJqbkfud5a4rGnqnqVk1XDBBr2lfVViZJ8YllASUHXh5vs77yatHe7fLd/CSdS0tXa8ck2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4+w/NoC; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4+w/NoC"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c711b7f2aso462058d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308756; x=1788913556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rR4HvvkSZSXWGaiSoIrlDM6ioSrlrhDFTfgpP1XiDW4=;
        b=D4+w/NoC9YDabStQYjJs4p8C9yrAj0GTSwxhsVm4E8NmujepH7Av5xGah+AsWpYuZt
         9w5zJGB9QBEzjSjnUq4Hr63Yfiw3WxoKlKvfPnJjYVHc68Q2c5cZZ3ALt6uHXDGdTpgP
         Go1wTqvIqCn7FBVSY0Pn+lBdwuKtPn33Q2OT0VkHCRnilGibqLfQ5PWUKjYhKCHN1GE2
         oS33yadYkxNv/WoYqbMDjumUY5O9lczVH0L7n2Jhe8UACz/j5QLGlOdYEMtuAelh9k5o
         fCm0JBpCatLneXYW3Hmf0bs933OeIaYdpr0iW8Daedt8DLt+vVdIQBlTx1EPFx623pBj
         WZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308756; x=1788913556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rR4HvvkSZSXWGaiSoIrlDM6ioSrlrhDFTfgpP1XiDW4=;
        b=dgVb1iZSveCnuLy14fnqkiXIQabNiTuQT7mR44PU89q1tR/ZRJMkFafFxcr4vpleSA
         4ZdJKPN00VP2UL0iqgaEj3s/Rr3pr8/p3PhU/heRvQ++g6GayWifN5HrIux1ei0EkfUJ
         4Z3/7knVUwR/aE6PgwQHxsf6ivRoJ3vjNV6/oS2UilSVgRiBx21RUMyDGSmKbNgacOgN
         9rhljkZln2AioUvXUs4ZoCPf9t4Ajf8V+Az6ngHaiCJ8Y6KVnsepYP4tIHMPAqQmR+W8
         3DV0VYpuB6l8iAFDXOspsTpQTOk3sRvpAdjQiL1SdEc9Gc6HlSyDUgKASe3MioTbxYf5
         TpzA==
X-Forwarded-Encrypted: i=1; AKwUvByWkgqQXzKb2l9/ggbvqfKqI+n+InnqdnenKmce89Vb55wVkO38VzMwqAQUBJry/Yzl9wv1Dadcl9FmuKs=@vger.kernel.org
X-Gm-Message-State: AFuF++nwp2xkZ2GqgEZV9OOVHzl9ql+/jl/7vFNKkCKOTVmxAyGKDKNm
	NiR/j6aXdNBX85oudwNSFzUXKar3gb83zxzB7lISt08k7ejbWcyo9+sc
X-Gm-Gg: AYBFou1f3BfBmo9qLnm1r0qAwXmURycCwRaavaazRHsH4zYjC9ex9kN/ToR/7BFEzUj
	oRHGYH/8iSpc8dPulgz5NKIGQzGDJ9Vyl+Rk9ihPqD6B+CDAJLnwTiE931vFnBsTCS/O+oswkQh
	EvJ+FZ/mxPEkqoNGv+zDGiXSCh+Hxf+UW7Pmj9NToptRl4AOVZpFCURi/TyZkIMKik9uu88sWwD
	C1+5UFSRUWbzZ5uE9vzm9t9urTQk9DSlIDvVHnbweMGq6WZJ7jcm1rquBoRp6yquZqMhnDLY/mY
	zXHt+Qy/CGt9G2JLkB2HNM5iUl4uEfv8F3x1hy/7F2r2/1+gkYxIil1TOJJVXD3thDlQ71DGm+Q
	FSnmA6zWexliGu09Cq/oAPiIAJXnvj1uhbiqAlboSZl1tL1YlnGwkOb5XyNFrrx4d5UNBw+m/93
	2EpZVFNZX/0autry+mrVv2peXLCo/lQBNpZA+/tihQzG1gEa99BN06Lqen1IYOkqX3FPAwYTDYU
	4FIa5Xmxg0PHx/yFL7UlkdjhJLo/5d12DZr/SCVplU=
X-Received: by 2002:a05:690e:12c6:b0:66f:7dbe:74f1 with SMTP id 956f58d0204a3-66f9b93156emr407634d50.2.1788308755886;
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 1/3] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue,  1 Sep 2026 20:25:51 -0400
Message-ID: <20260902002553.34839-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
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
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
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

