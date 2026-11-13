Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543674;
	b=Ln918PmuxYrwRK7pZRHwh4hE2Qh+OaGG4WkeyBAXX4FNKwsqKc+08nQr1WnEtOxZ+8sh
	 8VtDHkY3/9TgP39zwp/sedilChJReaE8+nUtSJHKWyJPceV32btsyMHiafAU/SZPMG9ZM
	 qk5zj3/YpRZ77DHfOtxq59xxxlUH2xH46W2ZDTBl917PrQTww8WWjfJxcbVZ0u44OPt/v
	 4MJqKr6Wa2J6ZWyVSxc7bq8C3gUBJVG/pFpswxEt77jlrTudKRNtTLP8/qkh9IDgVd2KS
	 SJzrXJiDiuAW5eAGEjEMO6oySC0q7p7GX7XONlk2BhIbq5KnXvfpjovGTHPPLee5ouw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
	b=Z/GPyG5xWYxi+AvNXvJ9Fyql/y7vvVEDvfurgUdzsyAFQd0YW7JiZ8QchVRLNaqc43iJ
	 4i49CHupTpLESNjK/R3cPjbvCjTyXKu0DkQRyIJSNj+8WvcfTq1s/+VNC04quJu0mZm+g
	 JwncohvBj+QH5IZc2wmtuY/pcNiVHS7dEOgBWcHKWBY1uVPDa+diaXtAMhF9eJCAhrliy
	 RjBM2edmvR+Q0fNMDoxFfsc2H6XEh3Ykw/+5G/dXFxvCoxs7clYSklgGgZGRCpnwXktbt
	 XXIdnfjY8Zs7lOQvFSaBZ3cRROdFdGmMnpRqT34KBSRVfGugzZLbkLcYlpkRFXan1BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcOP6SPw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11014606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11014606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcOP6SPw
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53664b4860bso9346831cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543672; cv=none;
        d=google.com; s=arc-20260327;
        b=ppGlXYRtf+SmSs9dLTkfc5qx6b2o6HjC9eF8pwyq/ifcTTreR8EuX42BfFGiloJrlj
         6NRU917rnX4so7xxHJZIIpnYqHrDb53rEr16ehmMLLHoJLx/IFFD6kCf+A/pJpjWwIq7
         BWulQmBCcmcGGSF3vZa9R5HaXJfIhycCGRhHlYcAk24apfgeuzS8jJBSAYZcqu7BoIz5
         Q8kq+2PfpITZi6Yn41jzGEWACNn9xoNfNB98y1E5v1bK3WTIX9+frlflCVu14YF4m89e
         jK0L9UjNTvLELilrHiscfdYUEvK9yGSzvK765ZJj1GifM2m95uAodlQ5tsiSCyHe4tsZ
         RjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        fh=RAOfUOQzLq7ey2zWxDTJkZ5J592dN1/a1rIliRyO7Tc=;
        b=JN4qqkgej3FLkl/YCBFJrColbLAAJ1PU31qdfLI0mm0JB3C7UJYFvgiU8XkJZMWz6M
         Elj6zoOhmzirCcyOiktd/Gle+yEi3FwLZMEFeD/KrxfOWSc8r/xdHwa1oNL835+C+JeF
         cBeY1PHvPS2O+dipZVvGgsys+QglmJJIpYtFkxE1lqwrMOOouAIEJcHZiriI9a0OB20H
         c8hltlPgL9hHeyA4EssFYBVe5lUbOs4mIOlHxvtGLDtoqlPCgGQXdS28DuEYZHQSx2PH
         XTajFnttc5rxKzV40KYcKnE5AnX6of6TOfML2pdLrZmCyEoxsg8hw5eWKZ7XLB5p0TyN
         1N2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543672; x=1795148472; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        b=OcOP6SPwfGVjfk2vk7Kf3JWIasna8TKF5+LlJEBONoNmpJXqQrJvILfKRrsFawcrdm
         IvE9pAsj3dXuzzQ8AE5TbZS/R9QMlZRAPMD1CtMapbUPY0IftEKFV1+Y28xZFSgLaRWX
         DoLvd+aqdCs/sNUNZcbl1Nvy1ciTiuidyK41HlSjCLeAwMlnRbmXNNKXaTF4yq3v+TeN
         X2V+M+PTuv5Jw6FN99QfkFGxCM+o4A4fTueWz1k4063wiX0wlMi1KxJmbJBBpt4Juumt
         3bfKWTDBuCLriIUR3uG0JBbQ/rvmRNAp7QeFQKNKf2huongfnqyhbgrNA5gmr8rnLxfS
         65dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543672; x=1795148472;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        b=NrQJouxX6VHQHJOshqCvgWM8fQw8sqQ8mu9r4vi0dZn4IbCPVJzayFhh2UgtR8u0rx
         qPb9L+OXJmLKtIDdkZg7rjjFCOW+mVY23zJtu0GFgLisPJKuD0oLlvi+zu4yBh1OtnMD
         lyzCH+c8/cH7hD2x7y+jDrDmIWJHyTPJm7PHm6IJ9GRad3UV0HKXLvTw9edR3DqnazKy
         VpqXjD7u/y5sQMz5X8wpmdP3mTyni7Ufc+GfuQo2nCLp6jZX+LpE9oAn/BMoMBXK9m5N
         OsIkzA3XC1HjRZlBqRLJhH77vHEv1DSGUXC/5WukSUMOIu7MUYf6a/75vkB5JMEtoMMh
         0Ccg==
X-Forwarded-Encrypted: i=1; AL+hErFXGKnTLbN4b/PB8fwB7wp3IdchvBBiV5ZTWXdvHzHOw5TyJoJ1XNLytrdh1TCzlfIc0IH/GYiDuWZqmwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OS+Z4nHY+j1AoXw2dpLmVtqMGT2mDNNzUZU8qI52jP46H3Zis
	VJhOQPD5rpXjN2T7Z/ga+Fj+kr4VKJiToNAt+MD+KzItsvQWiaZevR3dxt8ZO2ycTRXUCzgqfIF
	yMOPwPO4ZObsgT29W7UXHW3BCMDZqtSo=
X-Gm-Gg: AYBFou1PEk3rF81BJ3xFjlUkKj4ktEkg3R6spxjNm84ycH1gmY9Ls7Owb62q37C+bEC
	MDVCA7jLQxcBR07FmF3hh9tjn28WRminH9d5H3CJqXTIXdXX/VjkVCjnoa0uj/3a+xkuqjrGF76
	+zI4BxyD8Mbza71jECoH0zgN/V2l3nxGGvHuYRZQOKaVGqDOs+JTjVw61zoGJNEPr+rARwJP9oB
	zDI68WqKYYrbp10+l/DXDBdxtg6rQnjcjZogHwlYBBxHODHjAiC4rtchX5EGkO862TIRKptYhUy
	WXtM81vw8stlxI09wujH7HYq7y+MiAoEk469gIfTO136vYOu1TYYST1nqfHgY1WslHB1FjXiysI
	JnNNFFKxTebspXjAoQ/3oY2aqoX7nglx33YbjeROZggan1p0tHnKY2nxD2ptQ0cs0bRf+99ePP2
	ly2Nf0Ulean58Ubj7S354ENbf3/X7oGry6/kmQ
X-Received: by 2002:a05:622a:a58a:b0:536:35e1:b5 with SMTP id
 d75a77b69052e-55ac3363fccmr24163281cf.1.1794543671941; Thu, 12 Nov 2026
 20:21:11 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Nov 2026 23:21:10 -0500
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
In-Reply-To: 20261113011234.45270-1-diegomancera.dev@gmail.com
References: 20261113011234.45270-1-diegomancera.dev@gmail.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 23:21:10 -0500
X-Gm-Features: AclHuK8Vg0T6W_EJcB7LJOxNFCo5T5bVUA5gjr-c9q7orQ4IGb3OUxb4r-MnfVs
Message-ID: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
Subject: [PATCH v2] media: em28xx: clear dev->v4l2 when v4l2 init fails
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com, 
	diegomancera.dev@gmail.com
Content-Type: text/plain; charset="UTF-8"

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v2:
- Drop the non-standard 'Assisted-by: Gemini' trailer that failed checkpatch.

Note: compile-tested drivers/media/usb/em28xx/em28xx_video.o with
allmodconfig (no warnings); not runtime-tested locally against the
syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c
b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}

+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);

 	/*
-- 
2.56.1
