Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96328412BF6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465526; cv=none; b=F9maPKQnIisc5ji2S7S0ZxOz86/ng12ccbWF+UsYZFdrdKi8rjgXJOVc866k7JPuK7IKmrCLLNvy9xX4OwHLobM1bRNkFA/EYLzXmkr0+41QvXKxlepvgrrjY+MuNbmsklMF3jvc9T/H2W/gyjt/RoCE8+NtLXgvcHwjDDORoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465526; c=relaxed/simple;
	bh=/9yZ1NRyC8SOp6WN1l5tRIXNc4PBOsZqzAWsKo7rHk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G/1y+yu23E6hbXhEImPB7ZzWfDGVHZkteQIq7jG6/qM+Zwx+5D9dkWaoesu7bz0sNWoPQU8luZDnBesupoR8XLYZivLruUCRVG8GzIh8pjswfjwvkHLLARiLY9p5Wnvlg5JJsEzhlAl9pZ5hqQngIaV9e2QPVgXTVpV4+8i7MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyZsMz95; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyZsMz95"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so42288a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465525; x=1790070325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbEtTcAKC+NNh94lRz6UaNq1ouVNmAzr5+SKEZXpscI=;
        b=eyZsMz95kgFQDyv44UxzQ7FFLfyugzlA0gG3x4lKzcCBCk/rHmXA1fxMbXzYmVmpUL
         vr2TsfiTxObBJ/SvrQso/zWt674MwREBVVcCbDTW7w0QAWZBC0dZNinZAgIQg2mxDcTt
         LPkDqQmk6pTJVdYSxCe26BeslAdV06+w9uJ9gLHkaQWmE+s4ymySwsmS8s4jgXuzz82R
         ucqMwvTqdn0xhPlmqrlGIoPXu/HKS3JoQHSxUGQIqT1+benPB1PPDfjVqIyDA9Mpj84o
         Q8tO++adE7DYMYxHPCFrVwA2qxQ3kzykRlmT3bVB09j4uZFClyCGNm4FilFs7XEbdoUK
         atqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465525; x=1790070325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbEtTcAKC+NNh94lRz6UaNq1ouVNmAzr5+SKEZXpscI=;
        b=LrJIEH+zw5udOvo0Ms75S7IPMC6+R70v9gVoFh1nSM+jVPTN+/53mdB8P4FXS7OshR
         jmvyJ9xiNxO/rpcLLq00kbePVPMAXSwbRs85grTbUOQs+i4Op5XZoGljlljotOkL3MAh
         g9gZBVTGYUnLoMCMc5QBJBmS5r0fYk8lmRaj4IYgY3HpRmnIg0y7Y2C6nacom9o8okig
         jk1Nhxj5HIUCAk3plhTs+Rjjl7TJDN/v0uQTqindcJzaGjfiNkWwrzF+UTcSpueRT/xm
         RH4YGn820qPIT6PS3FzVPCHXsg4i2Fjpn6PFPbjzaCTvHZhyVFPG0WNm49Tcy33UBTiw
         fYbA==
X-Forwarded-Encrypted: i=1; AKwUvBxgpnI0cO21CCBicx/nxe8HWn9BzNMhzBIthCb8L0V92Azy4XS5A9E7S5tjHtdKqAgbattmgwpyyA40ePk=@vger.kernel.org
X-Gm-Message-State: AFuF++mS6Ch0uqtqMueG3V9pE0AMN7zPuhehDhhOnqwWI1BCNfV2G73l
	047QolWv1cajSXJyJd6VcT1VITkndRfac4X77dpta9YzfLqxTeUOvKPF
X-Gm-Gg: AYBFou0cS0xEPqkoYipBbgW7xBLetq+XW+/rHpRoTlqzFPlwj153PHLZStQNNW9zLqC
	AgE58pYROyIzkiV5Z3k8d7oJ3mftePrrL34qv9dp2aMmQexTn3YR0u/hBLjnP88AjZEBmWba6V8
	lV5GDSMvREcM7gs/DYW7TGHL2r8cd88LmB7OEilW1EXctoU/uC/fTs0vkQ54aZgTqEQ+evzV0kl
	93MJaj7Cw7ZQZrO26HpPu7ZpIeNOQ2dXRqLg7jsn+8bMpQEifcCCDppfBc2lmwnK9h9nTiRS2z6
	+y2vtWrQI2TAz6oUZ5bYMKdxGINMYofwx5AP4fP9lm9eiadi/3U6BOPUlApb7Hb3Ikhl72iTQ4l
	puPeTuVUdXF9grRwKpaISzU/JWgLBDFiviEk0QX/+AcBW2p1zwIxY/x32pAv5J85nkNI9AXaYpR
	N4JB75CTkxkal856owlR+/zNyImqKr79hsbTWnOnkiem0Y8Rhb1U+ACrgZ6WW/CFdEaCZZ5+lY9
	KJhIRY3zgQaKTPadkg32qgfKULs5xJxXo9j/lOtjDjzRuaI
X-Received: by 2002:a17:90b:3f0d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39e10c8a755mr276527a91.5.1789465524864;
        Tue, 15 Sep 2026 02:45:24 -0700 (PDT)
Received: from hyeonjun-ThinkPad-X13-Gen-1.tail710e10.ts.net ([124.197.199.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd58af8sm4222111a91.12.2026.09.15.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:45:24 -0700 (PDT)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>
Subject: [PATCH] media: vivid: Remove unused overlay format declarations
Date: Tue, 15 Sep 2026 18:45:08 +0900
Message-Id: <20260915094508.1870931-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vivid-vid-cap.h and vivid-vid-out.h still declare five overlay format
ioctl handlers that are neither defined nor used.

The four capture overlay declarations were left behind by commit
ccaa9d50ca73 ("media: vivid: drop overlay support"), which removed the
functions and their registration.

vidioc_enum_fmt_vid_out_overlay() has never been implemented. It was
declared when vivid was added in commit ef834f7836ec ("[media] vivid:
add the video capture and output parts"), and struct v4l2_ioctl_ops has
no such operation.

Remove the unused declarations.

Assisted-by: LLM
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.h | 4 ----
 drivers/media/test-drivers/vivid/vivid-vid-out.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index d08a85927510..2fb792cc3a4d 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -32,10 +32,6 @@ int vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
 int vivid_vid_cap_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
 int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
 int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
-int vidioc_enum_fmt_vid_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *inp);
 int vidioc_g_input(struct file *file, void *priv, unsigned *i);
 int vidioc_s_input(struct file *file, void *priv, unsigned i);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.h b/drivers/media/test-drivers/vivid/vivid-vid-out.h
index 1d03891a5de5..dd259206e25b 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.h
@@ -24,7 +24,6 @@ int vidioc_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
 int vivid_vid_out_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
 int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
 int vivid_vid_out_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
-int vidioc_enum_fmt_vid_out_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
 int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
-- 
2.34.1

