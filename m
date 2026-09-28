Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF144D17B8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632226; cv=none; b=reMQqvvXrsqjZY1Oo01I6sMyvFO4NksAk2N95MVPbIKxgOHotGUI8uIgMDzP6jRtN9kj8RtlACkfiKQqOEt8mkVjCDFoyxQgd/uEfFRUrIy0qhymoZvqILwfM4Nz07p0dE46Q6OGL3jgugjbuBdDytk5wYngFgjSdw1o+Q69CUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632226; c=relaxed/simple;
	bh=XoW7LB2/PWn8I3h1KrEZjrzK/rPV8dwx9VMc7EUn8bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cknoyFqVeTvz0vZ4u301nD7wB0i6zZtLnW7s/sKXSHypnsgDamgPv5e3xJYuv38NhwLODHlKzpd09Tp0R2siLiSqvIAh+5TDxSrVQCETUp7SAU5+Kzc48vt+5lPQjDRqFiWBFCOnwdkG0iSKm9ylvwLP1aWVd/iVLdT29bgblWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3AB3k9l; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3AB3k9l"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532eeso30958807b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632224; x=1791237024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psIXgfN/YF2RfKR13CbY3bbgVwSvbogynomJi/9w4Ew=;
        b=h3AB3k9l86LS2sPes8tuU5uZjP+AViD+NdBlo354aDA/nMsUSD7fdrKt5TgSp8nNZ/
         UbkQJ9HaSEeBTQ++2Eh2hOW9aj0NWyljUZXs9mCJ3olspCUPjWXkrzqZf0UsazM+KCXy
         sS1HyUfhgcfaRji/6sEc1Y4T+3L5QQDf/X/KMYbLFs6u763k8qJWqYKmrBZgPWNalgPe
         ytmq3tz2fMGOtZMJGwem32oKZ9bgAe2E2tvlwQI8Fo1umS1Zdfr2ofjF+p4fqK0gnftT
         Vux6bxiQs1NCArqfJ90qQWHQVBbW+ceRLNemsYhjsUnS0DsA+ARC46M7K69Uc9dMx0l/
         CCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632224; x=1791237024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psIXgfN/YF2RfKR13CbY3bbgVwSvbogynomJi/9w4Ew=;
        b=d8QRDIu6KLsYwwLQs7w48VR/CvLEEY7MqZ5V1L+VwSg8PGcgUSc4k2TOJxaKGIzRUF
         8aN294N5O8r+TboPU4Vc2aIdJrlN+0peFDEtKecV7lZzOeZcjrN9BkLvXN7WNanpHVSz
         tQr6oZjgfsZh7W065hL1H9j4QiP9zBXdZtNaS4tCoky5ZWy4n8IDvTiyTCaLvxKgUwK3
         2+5fvYudBMAwGW8DCV1ieVRvG+ksJERq0IrgJ/rW2NoqBbNkMkIjl1qLRAIvvAxJXcen
         tWra6l0I59+uK3uTa2PHVzxZfjzJyzJ2iZzASVzxxumvUdh/Y1hMDSyN0/2ktSfAJUTF
         PUpw==
X-Forwarded-Encrypted: i=1; AKwUvBwncPQXTFO7iXhs1/GL+AKiWVGBYmiGL9//qCpCqF3Qt6I52kdi1wfU8wk4hmBeAcnnwCo5sGfhQxY2mss=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWvuX9KI2FTbEEgTg8Qw/Xo64yJA/nKj+teAzajoVxELmz2wY1
	ZqFJ7BDFJb/0/rugFEFAO8iztwXWCmmQal7/oXgqKMUApF3fPpa9WISh
X-Gm-Gg: AYBFou1CfIl1aNl7WBuROm3MPDDtg+d9Yt8xyLjvejEjGdARxliP+URMlSBVL0YkJkp
	YWviF9M9pAhVz3G4aF7dplXENaedquNirH6Nakcm8Q/n73rIAODAKlR1Xlgdn/sy3GcjlKq+7E0
	qP8emIStOJRTlBYV8P12ksGfN83fIG8J1YLuiU26dtPHgltvmxXQIWo0ZxgkP3+wHN3r8m6eiKb
	Lb7R+QmUDyU/aWzfveJ13QQr2K61wFh82oTJsUQ0ZmRWCEeqasLhcqW3dZyxC0gycMD+FJbhd50
	vZWnS4hU7RWSHCQX6XkB+BXLML0wi5oVU07J3SNGfmXqF0h2K8Gfvzxv+tVirfv2luWag3/tgzC
	TQ8vrfpSmYWzjo7pedcWt2MYlxNZAgMCgrL+vBqj1ro/6PWHaMUtvr3QhExbTEt8wEgeou3R+ui
	fILU8aPQHeUIf/ALh+LuqQQo/Lz9QPa7u7vW9e+S7BZmcna4h4/zLtIsFxuoA6J5eOOs5tW0Z7J
	13dWNkpgEV9crS326bIALK8MUMz1B2u9Vbe3e9kb7TBblOVXCBoRw==
X-Received: by 2002:a05:690c:e1cd:10b0:8a5:2652:9a03 with SMTP id 00721157ae682-8a6466aa351mr41747467b3.42.1790632224311;
        Mon, 28 Sep 2026 14:50:24 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:23 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Mon, 28 Sep 2026 17:50:18 -0400
Message-ID: <20260928215021.819064-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AUTO_UPDATE controls can change on their own, and the driver already
re-reads them from the device. Tell userspace by setting
V4L2_CTRL_FLAG_VOLATILE, plus EXECUTE_ON_WRITE for writable controls
so that writes are not ignored.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..aceb263103e9 100644
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

