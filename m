Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFB4D9F78
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361731; cv=pass; b=lmhRiFdXRyQQm1CuEk3wAU4NMihr5Oz1HT3ItczlbOFClveJBt1A25vSZqXkMUUfp26/6F4NIDbnAM4Rb1XOJVCCe7SqYZWeEPS6fObgKNBPpw3gzQv7CgdI6m+9JM74hbqnAwZwMWTgWq9lw/LUVfR0gyhCnz8SaIT+SYGpiLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361731; c=relaxed/simple;
	bh=EG2PHgTixg9rBHSr4w1yLq7tvCjPCFuWWWvAJw5rlQc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIqmM2n+Z+eovUP6exLg3Or+U4263r1SndiC39tRwJ1qwItuL0bo7Lxx5Nq2HGxU1zHTVr2JYM9nq1f/X8n48PYLRo90lNqntpjYS2eLYDfOKkRAoHGN1TS00PW94lI0VxPCV2ZZbu7lhiYJ6tTR0AO1D2vGGfm+eePs4UVlvyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc3ck6Ur; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc3ck6Ur"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso86252866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361728; cv=none;
        d=google.com; s=arc-20260327;
        b=TPhisVUqrIavqAWA7OhxP3xafdwzS6iJ4YnpoXYMlJrqBcIxC//Chp2Cwfq2VaJRmA
         g1XqWME7+HCxagoULJ9fPOn48XzAGaTNzsPfjzBofsVHopT5h+SqNcznRPnRs8ZiVTGn
         sx53qhw/LHZKx0f7kmDE9PL6xvurSk5XD1L/4pocHuuKZIOmO5tAMEqzFOYdpDzZzMrN
         d/3HizNee5x4W/1TVTMIL2LxjFj3NikeawSKiTjaht4y0GMOUiQ0QpZ0mSV5kfwHbggl
         DSRojlLKYpM9rtHBQwPDvfib6aPvbnU8GXFcgFvpCiMNEM6irPgz8Q+GX4gs6ZAy3rnB
         WIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        fh=0vPSAe3m4s7Yh8LwyJb0aXik8DASS6I25cW32PLZN+I=;
        b=UCOIsRej0aklx+sKtOET7PxfDjJsgmcX8giRTYF3EFFkYm4MV42987nmivQyBHAEJa
         S4GqiO/p81fjjmhLTLs7TItg4Y88zc4r4BuSo/eTSsPKkX3VVhb78HcGlavChf1TKbY/
         hVX8Arc5tqGqFhKtPkbSVfAX2hgq2LUO09eBNUb2eIstgnDmEa9uX7U8gwOo9y5VxR5e
         Vh9vQMKU+DNw57ai1s40xz+ehyhjBrAp6QHLXDkkYU2D5Tk2/GcrTAd+WJUmsjpf88t4
         2tbBhkR+PxwHqMWT2FvltV4CPq/QPHsebgsK9G7bFlC/1HW5EuTpKejrA9zYuSsMUG8O
         KTiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361728; x=1790966528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        b=Hc3ck6UrOQDwxnK63GsfDThgGWBOpQd13H9nIYM+xizWrGjXwpIcJxg5DdJy/sPd80
         cwgzlsSbt0sFvuZu3W1EuRslN9S497d4E/pcYfB8xkS5kn0hgfdzrcmM/dHUaFb7PtgF
         GtBMtxi6zPDZbjknWJYdwEpACj2EsQYUJwcrjMbzPSmntWYwi9FkDT2xDnx6Y+5ihTO7
         B7Q1y4ZvMksps/7T9gdRKciyGQOSsXxrVSullgeU/EVyK/3Rtv9VPRqYu5zStJNclXmH
         Wx1lKKmJT77owEBdXgbr4QrbZbfvco51Z4QQUOmGyxR2ejj59HP5sWJgb0yJ4Ii3f2je
         IL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361728; x=1790966528;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        b=sY2hdMjoa9Qc+b7aT7RTg/NhNTfT/YY5DKP6PORKHYUGxxl0s4utwZMh7yVeoaIwGc
         sX3gUz68/b6uzO+APUMBy4mrDyZz8FVGK0/vSnTGMNfLPHMw1I6i5igoauAnHeRRNrMP
         m2YBUTm3shDet2uauAnPJsO12DRzQ093VbrkD+/pib846VVL9MCxzvRfT+ZAbE3pow44
         RLDvUisbOAvBEJaw0YtzE5vxzNXxbmDLZWB3On+gweIl+brzCrarn3J2lKc8/Ck8NOqt
         tXt0ldJxqJ1KkWAWgXei8mTvlcMB+mT2u6E90F3QSAbqI2j0DqBMkfoNDKMISwaYh3eI
         7u/w==
X-Forwarded-Encrypted: i=1; AKwUvBwDzf9CaDMOC5ocdvJcOvat2sTDtHslsCpMejkME7UMvY1TBjCpIOB6noWYu3jxt+IywW/x4fis1iXFHxo=@vger.kernel.org
X-Gm-Message-State: AFuF++m++kC69Suij3+4HUNCVPH6pP24l/OghO7Y4y/ZWg/uCSch6hzN
	T43oYm8XrOtdEYzKmfu1zFDy5vizIYjDVWbzMIgqfNJ5O8IOcSdF1rLDVe2EFrl0c3ZOFVEvEuE
	+Vsd4Nyp2+blY42/9UyauXi9NGi+H39s3
X-Gm-Gg: AYBFou340vi/M2QQAJe5yoWIyI8keBxRlfe2ItWaI0hVDVOvDI4Z5Srn4WAGlYhjuDD
	iHbP0O+x27AlfUieo/Lk5z4lWY69MS3kEAyWXR6WR+uxAeftDtR/1zQRmV/97A3d7N2pqd218wl
	MSYjB1L0tfFEWRxaPcfKCW+XnjCbPfEYK1AWNdde/vqakqEvA7M4Z0kZCdNL28z6N3jhJ9lROUG
	RY/4U6frjnA4hG02dvXOkPJGLSzGUrHfF0M42PAWPHwazIr5JCohtvAkdgNxPXvMZF/GCmd9z14
	dNY8RNis+C5tdsbTq5nJTtK2dtHy0wmVKpgSnhihz2BAHQeQbAtHGQQHPGlQdOxLD4gFV8h/V/S
	FBQZ9BBD+6qX1faLfcRyNJ2C4IMg1/LSeTwr50gHBSR126xZQn865O6KI23PxM41/+86wukX5wV
	w=
X-Received: by 2002:a17:907:e918:b0:c2a:9e6a:3b4e with SMTP id
 a640c23a62f3a-c2ac228e60cmr610461666b.0.1790361728266; Fri, 25 Sep 2026
 11:42:08 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:42:07 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:49 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 25 Sep 2026 13:41:44 -0500
In-Reply-To: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
References: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 13:42:07 -0500
X-Gm-Features: AclHuK-11njtSOspeCyZG4OM6KWbRhEYVXC0k2M43DNY4OjfE88LmT1g-L_uDk0
Message-ID: <CAGEsz8H4wT2Cswcr3g+5KJJDek0GACj1-gbFAC_NunHV+d78JA@mail.gmail.com>
Subject: [PATCH v3 2/2] media: amphion: prevent unbind while video instances
 are open
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

An open video instance holds a plain pointer to its devm-allocated core.
Unbinding the core or its parent through sysfs can release that memory
while the instance remains open. A later ioctl or close then uses the
stale pointer.

The video file operations pin the module, but sysfs unbind bypasses that
protection. Suppress manual bind and unbind for both platform drivers,
and warn if core removal ever encounters a live instance.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 3 +++
 drivers/media/platform/amphion/vpu_drv.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index a0c58ec97a42..2e8e08e05de7 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -696,6 +696,8 @@ static void vpu_core_remove(struct platform_device *pdev)
 	struct vpu_core *core = platform_get_drvdata(pdev);
 	int ret;

+	WARN_ON(!list_empty(&core->instances));
+
 	vpu_core_remove_dbgfs_file(core);
 	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
@@ -846,6 +848,7 @@ static struct platform_driver amphion_vpu_core_driver = {
 	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_core_dt_match,
 		.pm = &vpu_core_pm_ops,
 	},
diff --git a/drivers/media/platform/amphion/vpu_drv.c
b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..9c6f32c5eae9 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -205,6 +205,7 @@ static struct platform_driver amphion_vpu_driver = {
 	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_dt_match,
 	},
 };
-- 
2.53.0
