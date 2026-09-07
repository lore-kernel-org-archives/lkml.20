Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD048EBD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783540; cv=none; b=rIvfy5K+a9AFYOJgsUqU6FVO5JhnKUumsnO+UeLmD7uLfSgfiqHBujCY+kqg1OpFEvv2TRUNnSLx/WsOFmNOXWN65mCq9lmqmXfeq0a+j/hlNmBr3iKLPgqRPsiA619i+LiNFAnKDThvQu1hkPrFZ8BETNcDTKyVUMUw0RrO7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783540; c=relaxed/simple;
	bh=SotKMOP7zUiJtWG7JbcS2nlpcvhlbdHg0Kyg5p16B38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ju3SDgPKQTTmZ16N+I4obIgnNev0uj+2fzcjoHXK01RlbHCh+HwR/IacElYTzGEuNVUePM/iiHVvYv0LyPVMGInCRNu7X4sc2BtEMdOdESRdgTfumGjzVq//Hq559O7xZGHLthJnIdo9LzJMt6ULSEvO32iijEnI13ImxDA/Yb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYKNzjDD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYKNzjDD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so2305936b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783538; x=1789388338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaPh5i+FuZkrfBsWH4a7+TIG5RJ95lzG5o9AQinurAE=;
        b=lYKNzjDDVFcFjjDNpDdLwVhpUlCJIHtjzCGxANz0NAUupP1e7S8/aarYcc+MB+b0V2
         cfUFHmg8oyYsnOY/H1aR9EQK12mLjAvHu/0NLU3S3pkIoTYB+XJQOjd3/ZMMePQCMXFV
         curP0VaUbz5bJASZ4AjfAEReQ5R4Mhn17rJMJLxuaf6B1/WpPI1kDLa97VMdKwO1hPs5
         lHU+dmaOQQcc8pdDlEN9Ih9I25zIawxL24V3a4MyLhnV68kLJEHJnFlVNFSCHEEu+j4n
         UH4Xgp8+dLB5ZLFx/xVEPB4PMaM5Wevi7ynndlqqxpKyZmuqfQHVjAyMLP8BT/fICL6x
         +wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783538; x=1789388338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaPh5i+FuZkrfBsWH4a7+TIG5RJ95lzG5o9AQinurAE=;
        b=EuWTBNwx+20A+oX/7l1Nn9OHVN6dSa6SIE7MxEDvIOin6EeO7kWgh4RPtBNYgIA2jw
         J7hL2i67dJ4G/wxFoxxTAR+yREJlKl9SS8A9+LrPdr1/dc73mxUOGlRT2Dp11i7ia9Ht
         I7UPn492P7Kf7/4cAghqSc7GZ39niy0UQHMnOuJ2k95HIuHoCIw3g3booBIOVJLq9DPP
         DVKUrPb5BjsY8oV743Ld7qIFbnjX8MS5qTgZkQYh7XXj2PZj8aKW3AveXUKaWNSeLs8y
         JQjk30M7NEgLRqmeXirMObIuFgH+xGptl6gkKBBvOh7swUbvgKoQRogJCFMo4Wo3PkeX
         cOSw==
X-Forwarded-Encrypted: i=1; AKwUvBzsqB6cra6LgdQS4tF954fT9Jf0XMhQfSBlLlNwnaLuT9x9AmV16ljV92XIZaP4qWYqlaUYFWn+0QlIRCY=@vger.kernel.org
X-Gm-Message-State: AFuF++klLMd/VT/UgeRF2L5jHOjtGekDgOx4Elpe9PhvfhK3lY/Iov2P
	O6BywAyUlXFsW9Lhc4hWZNayJKxsYww2cpE4ZZcv5QjyAh8Z1eiVdgorW/Iwdcx0QY2PXA==
X-Gm-Gg: AYBFou2+G1B4qQGE+73xAVfweUI5vZBiDeWSLEHt69ajy5oXhY/u70zFztnPWZY865I
	4zpvCAE6sXPcbg2CveHqQZDqtFxyNqIWDJYXnNf2CYq53DTSuozS7LGnqbp5QBe5dzfcCTJfCG7
	Z4Ye1H6UWesTPOmQmhBNBKYdNbEof99/Naomn9+/dwzeWTsm7tSPuwfARqxl3FWzglGvvnoV5Nv
	iFdEIkwfamifUoSnd/PnfJZKDX4H5wWP1gnrosiD1AkMX8vXJfu9EbNnfVMFCcy256kazT+EWDE
	Lq2vycmMqlHh837/vaUMRdU4/99lU+DXifPpwBX/RlpbT06ilJjFNht/7HMK3ARPXxLrZUql3R8
	5iA1LmGWx5DkqOXUJuQ13Owp2eYAOxraHyTvxtRGBuD5OR0b2Yr+C14cDjp8wNnan66hoRJu4cJ
	eV9n/a9/E3FiXq+1GecynpYDsZOCxPpgPGxlCiQKRvhHDLGFG9rF0S+gW/ZMd6BBQSbISXBAPGD
	6Jnbm+mMVxMfvtknsOQa85AxZNDaqhl9/7WOgAIkc2zrvZLCFV6j5+ATagC2kzUfJKi6GqIWkcZ
	L+6gCRE=
X-Received: by 2002:a05:6a21:3a41:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3da3a16baebmr39641411637.23.1788783538104;
        Mon, 07 Sep 2026 05:18:58 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45545210csm3958174a12.21.2026.09.07.05.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:18:57 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: Wei Jie Law <98lawweijie@gmail.com>,
	guennadi.liakhovetski@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ribalda@chromium.org
Subject: [PATCH v2] media: uvcvideo: Fix NULL deref on events for uninitialized controls
Date: Mon,  7 Sep 2026 20:18:43 +0800
Message-ID: <20260907121844.2592492-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

A null-ptr-deref exists in v6.12.105 and upstream. KASAN crash log:

  KASAN: null-ptr-deref in range [0x0000000000000080-0x0000000000000087]
  Workqueue: events uvc_ctrl_status_event_work
  RIP: 0010:uvc_ctrl_status_event+0x105/0x280
   uvc_ctrl_status_event_work+0x82/0x240
   process_one_work+0x66f/0x10b0

XU controls are initialized lazily, on the first UVCIOC_CTRL_MAP or
UVCIOC_CTRL_QUERY.  Until then ctrl->info is all zeroes, so
info.mappings is not a valid list head, list_empty() returns false, and
uvc_ctrl_status_event() walks it from a NULL next pointer.

Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Cc: stable@vger.kernel.org
Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
Assisted-by: Claude:claude-opus-5
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

---
Changes in v2:
- dropped comments in code based on review received
- add Reviewed-by from Ricardo Ribalda
- drop the former [2/2] patch as it is a duplicate (out-of-bounds read in
  uvc_ctrl_status_event()): already handled by
  https://lore.kernel.org/linux-media/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org/

v1: https://lore.kernel.org/all/20260907062819.2519878-2-98lawweijie@gmail.com/
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..ea28c4e819bd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2209,7 +2209,7 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
 	struct uvc_device *dev = chain->dev;
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
-	if (list_empty(&ctrl->info.mappings))
+	if (!ctrl->initialized || list_empty(&ctrl->info.mappings))
 		return false;
 
 	w->data = data;
-- 
2.43.0

