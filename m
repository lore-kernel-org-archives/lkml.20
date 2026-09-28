Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB394D796E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609061; cv=none; b=BF/1WL1o7W/UVJJJekEN4DUu+UrxlW0mPJCsuyM0w/2iVfsCDii8B2v58aVRrKq4n8qNpRrKCxSVe8TOLZQfE5q6GPgTHnRNOGXk3PWLRckUeFd+1jQ0Cfeiue1DKMfVOhp5Gje5hYBCzv3xnwdke9HJFtkpr8WqJAKcZ8gSNeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609061; c=relaxed/simple;
	bh=68+HIVMJxTUsgUBifFFiRQxztKzWDsww7vGF2ww++18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9ruaou4P7GA+QYtryQb288YjUxiF9KX1lqf0L6+7N68///BIpOOK+2TfrE+9u7S/8oYU/9/4BrIoZE8bH6Kwn4KH8MZU93ME3EsctJLEKDUK6o74yIOOebw6hsWhsZ8Eod7jzcY+L0tdUlDiKQEy7qgCZt0Cof3QuKLHQ0beTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAKgEcmu; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAKgEcmu"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8aa1a918093so12421387b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609058; x=1791213858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rYYVHtymVlLnbConlDLuWqcY/dw2+HoGIDr304rCJ8=;
        b=OAKgEcmuA3/rYkNkX5j6e2tNJSUB+uaKIRm8LNZQfsM3bmmisJeVxc5xx7vfrzKMCc
         dUrjD1ZkWVrX3noW2hG7OPm5FkqVBspQeWS3cn94P89SBcqgj4mntuzHS9bj61HjgQlS
         qBBu6BWKexp+cpzdrPAPswdTVOcWEV9tm55GPSvuY0nMOnmz3Ch4PYZ50qAHJ3RBtEbL
         gcLziaMVoFAQ4LDPiXXaChu5aLldhr6nWP+LdPl8ZYc1H5jK2BrZopPpJrhVRvJktJ1/
         zBUze9KypVv6P1IAqn4gV6Dm0e0JY1EBBi7+4hTgJG1xGAV21AjrO/j05fYoIuC4ws9L
         hi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609058; x=1791213858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rYYVHtymVlLnbConlDLuWqcY/dw2+HoGIDr304rCJ8=;
        b=qbHn4f2nXkJ2m48TT39Qsmp9P7/TMiSC5rrhmsj0legogoKvPnFPM6yCfrg7QeaoGi
         ps/jdJ7xuoP2H0gBWPqTuvjjdvqFnVljwYtPgj5li1ZSsXBEH1RJRJyt27ynbP9I18pB
         3IiV40Uylb4RlNl5vQxrP2UqImW302yLketZTWMiPNIYWeGFTi3QQslWTiXkvkJ9Sxcp
         AGkvrM5XA8NXlVzsk+2xXpQLjgegVfdxvvppMCW3c8r60qK4VhtNSGGWD4li2QbubQ3Q
         biTUHqoBAvBo0zSo48qMH+X0dz8cUgGsyQ3CCOcg53iJxGX8lGMZTNVR7OZ09j4kk2Bb
         /J6w==
X-Forwarded-Encrypted: i=1; AKwUvBy8kkDbyBARd8sQx/AXpOmWgBqnJu9kWzK6VfMg2Up8ooo6SRD9JS6H5a4J/N+GegOo9bKCQZ7mUiWHnos=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaWmIaD+0CAIBEZU0SWvb9ZeGPaBddzNcpRF3MtOwbvd832MyG
	CBuIVbfgyF+u956A/0vMRXga2i0dYPRkMJ7GpZmuAePUoTSG57/y/8QE
X-Gm-Gg: AYBFou1CHoZd+kNGUXiw0NZg6fgRmT47oFaVcnAzGTNVZk0x3eGYcMiqyWk0tEGRJ5c
	MMVyPW6dtaCHCHH8HLOL+xMsRitYDJgf0YgOrDM5A/I91ZyCGPphJMf0N6pEgbp3LS3GoW6+2WD
	BehE2xnAatdwEelkAJ6TDH9J6QVlEI7nok4V4b5c7OfXA78x0UYQHuCLht40QwsAZgZ0jQ1JmQA
	g63vrXKVnZoS2RAYT3oyHhhLX2A/JcgIwPzeaQJ79ND+m8/JumSVVmkgA3mQYWdPlzGOA5X6F1M
	jeM+H4ikfwOvBiWwf5r9jBvO9kP++m5PzbG33uqYKx6Mj+t+83+sXqGtaiDo6UYS0PqOpPqRDpk
	6nPV8IhxlS31qDEwg9nh4y5bV651FZmbohE+YzvjfA7Ci+1FlRz1w5IpEvNuL34rEArIBgpjJcv
	DUJbhVWi8mQ2RDu6CAjI4nTsIgrlPccSIjl8tMf5OFiszMUUiZN1ZYkcD/JJZqH+4MWm3wQu4VN
	3FXwAcQF6zSfa4UX1Dn9HMcXzaSNxwMThDcFqsAYluMHm6yu/sHfB+vIml9k/BO
X-Received: by 2002:a05:690c:c4f1:b0:8a8:5f9a:399e with SMTP id 00721157ae682-8a85f9a48bcmr38572407b3.99.1790609058421;
        Mon, 28 Sep 2026 08:24:18 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm45777777b3.21.2026.09.28.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:18 -0700 (PDT)
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
Subject: [PATCH v3 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Mon, 28 Sep 2026 11:24:13 -0400
Message-ID: <20260928152416.766957-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928152416.766957-1-jordan.mymail@gmail.com>
References: <20260928152416.766957-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvcvideo re-reads controls flagged UVC_CTRL_FLAG_AUTO_UPDATE from the
device instead of trusting its cache, as the device may change their
value on its own. That is what V4L2_CTRL_FLAG_VOLATILE describes, but
the driver does not report it to userspace.

Report V4L2_CTRL_FLAG_VOLATILE for AUTO_UPDATE controls. Writes to a
volatile control are ignored unless V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is
also set, and uvcvideo sends every write to the device, so also report
EXECUTE_ON_WRITE when the control is writable.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Assisted-by: Claude:claude-fable-5
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

