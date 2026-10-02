Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA14DE726
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954958; cv=none; b=cbilH//XR+6fa3z3rj4HAVSvDkSQ8IwlkYQoC+s0f/Kpa0vk7UKm+rQ08oS9fTazgcXgWQes35B693uG6pJ+GyQW9AoxMqilfJdgaGr4lpQQhyLfBZpseIHbblglhrwpTruTYWBOpBOG45LLHb/wnSkUHqJLyUy6TMjqmzSitwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954958; c=relaxed/simple;
	bh=EUw1WzOuX4c74KGVkPvPqLB7KZE53M79YcIkko+a2pY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NuTg0p1JOURYeuN383UQOgiPQRG4MfJ4UfRM9gxQcQSiLsfOPCuTlEpxaaJdqtohh25CfH0/DKKAH39lQD0J+Oil+PPGvxYy5kCAJCMnvOqcykJ6m2qQAYVG+TAgvUz8FmBAZPAjdSEkM16+WSPYdCnIjwoPRWAKv/9qbPLgxhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Km3ono8o; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Km3ono8o"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so3613076e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954954; x=1791559754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C3lpUuIJkpMbj+ceGO26hsI5ydaqDv+ysVk3F0/il0Q=;
        b=Km3ono8o4sPqtPbDnAtHHGi/YouvAPf/jegrKNL0ZFz5ZQqgUXRJSHtlq5HtBr9HTu
         UpKeMlRxqw0AkXbcJdvkqqXP+CADmvPc9ngvsCfBTLW94O8So6W8BC84eqLeqqNxHWxu
         8SgSQSDv11QyVpju+zV4Kpcrv0/aYNTlxfqY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954954; x=1791559754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C3lpUuIJkpMbj+ceGO26hsI5ydaqDv+ysVk3F0/il0Q=;
        b=l5f2DbRMyZaEU+3T/K6hfvpDZdMnegUeJCB1QJhajnfCzX7aLkuy9ySNSVIh+5Cj4R
         eUf/p/Zr0tj+dOUlv9AVv4YrE5bNnfvF3wcsz67AhbWOcUTlynEziqDjWgxr2/cCCNma
         TJEws/4WPFrqvsB4ZRtfI8x25l5J6RHh+Rlk1HCYljgLEx/LMdo9X5CQRC74r35AmRhS
         yCOmS+mA0UilDzSkbnlTW2R+Gv8JxJiS7FKFtmx/OCcYkTh5X3tsKqNwv3eKcRunUEjN
         1unD3YYNCvYyZACXUn8QFgocZq2JpIZjyj6axYIFjthR8cmhuT8jv+4cVWrasTChdynm
         lypA==
X-Forwarded-Encrypted: i=1; AKwUvBxNq35gBmR20dX6ccLqVcaSkBL0dP+pl1XGfItEckLtP9+UhlnxlV5I3TFKmvLOgjpHjUh8Sn+JmCYBa1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRvvHhsEWaDOcMEPTSkvfoM6f2mSL9MQBY4XeMivjh98wmPaVM
	8e3umG1Bt/S4a0bcuSy7KpO8y/HD/GLdTXPGW8YEYIEJ+Wn/JMW+Je5b+yQfpyvAnQ==
X-Gm-Gg: AYBFou0Xb2MTKn8VRdIx/jstY3zswgRQaJPMoCQB1JHfC2N6NpooKPC5jj3bASPnUkx
	pLirX2DYnkeYZb6viByNJgqikApy3Rk8KI+L+p6lmwBy+bGjES7cFUSfOFmcNxL1t02rsjJRXm1
	JeN2ESJAjQ7sePfM1KGzNZu9FclzMh5oKKhI9TaY56MKbNpDRUx5KsQLUJ8Yrx+9W+L7S1TZQ23
	qvpmFKAGdvq04LSTDsmH3WJybttpU57zWZNhiQw+kBf5gqxJ+HTcDK3tOTNoS6oaKcFVFztk91V
	E1gZTa9XFthtcgt+Nf0f4KMW+7JJseYWLJMCZHYrFns1qSm+ItwRGxVic/JnIZlRn6a/Z16IjIf
	BJ07kNK94ea7b+V9YOSgMDamamqHaLel9/1acNrdNzUxcuFsncct310xOXAzPbNtQhjx27EERtt
	PTZGQ4LV37W32rxA/lqXh9fyDqreR2jPwDYiHlf3JDCikJpv17d/9mWcOwo4f+MSaDOteRmjFVU
	AUoCw79uPTBOPR3Gh0UmnMF/R6A9xjbmC68MNzLOHrBqzuUK4HDBic=
X-Received: by 2002:a05:6512:3052:b0:5b8:f533:d439 with SMTP id 2adb3069b0e04-5bb9bb1aca7mr941379e87.38.1790954954375;
        Fri, 02 Oct 2026 08:29:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Automate quirk sorting
Date: Fri, 02 Oct 2026 15:29:04 +0000
Message-Id: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDNv2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3dKyZN3i/KKS1BRdy6RU01TjVDMD0zQTJaCGgqLUtMwKsGHRsbW
 1AIrn/MFcAAAA
X-Change-ID: 20261002-uvc-sorted-9be5e3e605f4
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

As the number of quirks grows it becomes more complicated to keep them
sorted.

Lets rely on automation to check that all the quirks are where they are
supposed to be, so we can focus on reviewing the more fun code.

We use this opportunity to modernize a bit the quirks.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Use USB_DEVICE_AND_INTERFACE_INFO macro
      media: uvcvideo: Convert one quirk to a per_device check
      media: uvcvideo: Sort all the uvc_ids quirks

 drivers/media/usb/uvc/uvc_driver.c | 730 ++++++-------------------------------
 drivers/media/usb/uvc/uvc_status.c |   7 +-
 2 files changed, 122 insertions(+), 615 deletions(-)
---
base-commit: 79dd149ff9244884f7c62356a9e499a934ed6071
change-id: 20261002-uvc-sorted-9be5e3e605f4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

