Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284DF2BE7CD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957281; cv=none; b=cGPnzNLm9M7E1AWouupnIL4ZWrdDte/nTrUoikgtUcxy+onziVWYGUT6QXevsnvDYuQj72nfdnIHcEuSWZHxyrSQqKEsdPfehKMEa+K+LTrH0WA+naxrDThkwyxZcfD9NzmRbSopvi3cs8qbTWode18I6zMMVk/XyZVjXpmlyho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957281; c=relaxed/simple;
	bh=Av2GYvdleMYioKNHbuGmN6mnJbgyWi2BjHDtp6yomiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKGOZRVRN9frTvMu7zHNvTKKHIf8pAZJCeKHv76BAs32C21dWhaYzIUK0PwB+NFu3ZrjqsUuLhb1WgWlDtFZliG5SFCqM4xl2BCtRGf4H5JNYTALuKit+4xgwHSd04rgptH1oDlbRwRVr+7wlgIUVmkOVLOMvtfQ3rTJ06tJr80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLTXpoZC; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLTXpoZC"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb0so200703685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957279; x=1790562079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+LWZyHJvmzCBfQ/7nfECvX2BnZvzVstEnA6IU3FlQ8=;
        b=iLTXpoZC70h5g83hGB0RpMSEXeuWcGRitdUyJU5FMXkk0838EqxIOoAYm2LXWAOts3
         0Ez4f8/Npiws5xlW3XK1uId02pAPOAt9kG3kSQVhBZYaHifeeU6Wiq0Zc+G08vftGNgg
         qLQuoIDAP5VGv7ucfGQ92N4urHeyxSj7undNI3r7mC3Glw6p/+Vz3olheRcsC50/z4B3
         HHV7ank6FIMSw2rv5Hj9Xg7mdizZgt4kaonyOCTTRQQQ9cS0MPpwoJynKYaZB9wCHByu
         JH77Ixp5vdGbWF2crBdhhXOHQJH2GGgfxHQF3Zcm3rLSayTnBnSYhzvi2hRbl4nlztMl
         6+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957279; x=1790562079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+LWZyHJvmzCBfQ/7nfECvX2BnZvzVstEnA6IU3FlQ8=;
        b=XN+Z7dLjtFlqTTUb1vJqpZLXkjoQ9Pn7t4+H3Kh+EHq02k0k5jWU0z0Ka7Ph0QPIPn
         vLoxYXl6D6752uq0KcC0RWsGBMt3bXCKeqfcuKcRlopxEUeA+szTbSD9pTAM1MF4pGhh
         GsrwzAHLurV/ti7ychXqgVvQNCdUvxl57Cl7z8KZe8EmxNaA9REWuGp6U0y+4NHBax/y
         6K+akKFW4cTOgIuXuQu1IlPz0UJgcAieVEsCZ/wPMiRlPcMFcJhtQsT+sUh+BxmCjtV1
         WSmL91GrrOvtV+jZ5WaYzJY312Py6VPH4+oU5JxuLw+HV/H3bzqffEZFv0kVmPFe6PTS
         xJ4g==
X-Forwarded-Encrypted: i=1; AKwUvBzy8VkBh8+a+XzQ8glp8rD/eWcGxPWuV+d/HGF/hj2vKVXbR6NwbjKhqqs16ODDJ28U6tGbj48FOJ96jo4=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQhINnsAZEFkoSWiLK6xHr0xF2BJbs8Jx3PUMIvu9SDa+E+Ax
	EwPK/LD1tnf2K67CnTA7u4OyWqeYlU6qEkFDNFfNLCwD0alJpxOEFd3W27arIsE=
X-Gm-Gg: AYBFou2AJf4OqlhhsrL1OU5PdspVpchHrKV8jAnvHJlXDGy7/hEWG4Y8TdDaDN8raXn
	8jzp5+DjgGazzoZTB/abFmWoRpci++qXmTBh0/1sShXg8hDEzoUl3c4PXldgTHL4N/HEJG3h6eT
	oSKEBdQcX0dpCJj7EAfP+a648ItnZuH/ZKqMdOso8UVo9yAxaZKHBEDWHsFOMQEppnhX9qe8vWJ
	BZp9E0bNpG3AG8a6iNe94byXRvEYaWT3uYuOpDInziftw12KPnGSVrru8WqbSJsEEWpyS+4gi9W
	GPeEa+6o0+96AlOojiVyBT6QkS4Zt9Mu/gyFYK+UhDVh5STNbgVwM7MeVMGgZxRy+nog4Vv6Pqg
	yUMi4Z/dfU4TBUxZNhjag1MaU+kfLbnPm+S3St8DR1j7/0DM4LAhkn0WSaSZZbE+RygIbuf+G+o
	/Jtlw8xancPzEToC9pSBhUMFJHnn57HYJCj4qGY3xE9Q1TxSpqAdEF+DTom22yGPXRmo3VYqJOn
	iSZVsY/GSR08D60z9N06CPjNFVRG9+ZfOVCHRvjMYBvyLGkuBXuifvLTRZI5UdqVJcSCdlAneV5
	NBxOodkgSD+WecTd+cxaTHpEQ7L6JGD1wKRlVQ==
X-Received: by 2002:a05:620a:8008:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bf5519eaamr801975785a.6.1789957278978;
        Sun, 20 Sep 2026 19:21:18 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bf0215773sm496204385a.6.2026.09.20.19.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:21:18 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: hp-wmi: Remove unused platform_profile_support variable
Date: Sun, 20 Sep 2026 22:20:01 -0400
Message-ID: <20260921022001.6020-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support variable is assigned during platform
profile setup but is never read anywhere in the driver. Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d..1f165e8e1a4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -556,7 +556,6 @@ static struct platform_device *hp_wmi_platform_dev;
 static struct device *platform_profile_device;
 static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
-static bool platform_profile_support;
 static bool zero_insize_support;
 
 static struct rfkill *wifi_rfkill;
@@ -2531,7 +2530,6 @@ static int thermal_profile_setup(struct platform_device *device)
 		return PTR_ERR(platform_profile_device);
 
 	pr_info("Registered as platform profile handler\n");
-	platform_profile_support = true;
 
 	return 0;
 }
-- 
2.47.3

