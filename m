Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30748125C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132960; cv=none; b=gZagptTNTwheJPMe20pdbjO7aUAtAJjfBUwOWbzC3X8MJPqxMYYG7he3soucqAJ2MSvmNKAq7NJjaXKFT1SGpqUouMbFXGW+30y20bwxXmKArx1TcVnHRvvwlR/woQonaKqqQ2PQmcZDiBun89nuAAH5wiwRwRz/M8xKG2wDdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132960; c=relaxed/simple;
	bh=GtuyPJ5P8lbyUrTfh0GZRYAsrA++ZQ5zBOp4E9kCYro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jrc3b1aZN/EJGnD7UQEq6/wV1+QjqxZ/vNbQEvK6VjTWIxpXbus7afAl23o61U8R8Bki7MzSc1+EF5yFsKhaTFLxHEEpKr4zb46nxoIEjSC38O5mDz7ob41dXgFdWsPEB09/IHrjoWwtNB7Xv9LENybwTvBlIyNLDVJALwVqjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C7tLjX1G; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C7tLjX1G"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a49a022221so7351181fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132957; x=1789737757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sC8m3daIJ79tgZkSrk/HqNKaifQKUiCqu879ubTl/Mo=;
        b=C7tLjX1GigqcCGDfzh2GaqHzvHiQfQjwTGdReSRr7jmx2sMfxSHWjSsB/Uf41tpFsx
         yC1f+FeW3bszTjOqO/Ln7i5xusx+3A0hywr4YT8hxpYn5y6bOEb8yLUXpJ4VUpTU8SeJ
         38WJPrto3O0mLLDKyQMZWBZ76Gi7Zyl+sxiJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132957; x=1789737757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sC8m3daIJ79tgZkSrk/HqNKaifQKUiCqu879ubTl/Mo=;
        b=FVmHpbuGoe5CCpUbNbgNk+j+hV8/Qvsrt0ouKWYetKbiX4vniJeH+vF9efVfwRSYFu
         KSMpEn3zfdvWkQyEBxKSEE9pLBzqWpPPvys228sF3r5T5UsG6EzGb1OtFHypvm+cV53N
         JM+KR4KRR2AN3SDjDjCjXNSQDB+iTDhuGxc/ihHBEs6/0tl78jTUmdyOac8x2Php3g0A
         AEroNS0z7R0/gk1Ze2H2dB/s0h5B5mubrjynRtGjnUNMZ9uVd6SWN7y2/q/FvJOCaxBf
         EFR25u/vjQEp39nRhYzPnES3KqjHEwsxkYB1PAndz4HobUYrrv0lXweRN9LfzUh3HmXn
         GbGg==
X-Forwarded-Encrypted: i=1; AKwUvBzb8Ay8UGytvAYzE50a0GgiAz8F9B4v+0HkEDqogybm+KKnIjzQtU6REQSrhWi3Ctvf/295MfneRXhK+58=@vger.kernel.org
X-Gm-Message-State: AFuF++lRMFzhcJguJM5Q9W4ZiaRFTbKOJLE4/i/uEK9KieBmcy+U2Tra
	VR/RlnfHj0jSaJXZ2NFP/bt8ZRSgBFS12QjLGXPqd/o+qc+pKKQsCgog4KCbUtZ6fw==
X-Gm-Gg: AYBFou2VqTsN0sETHsiC1iQGh5/rGTi1mGSR3mYGMgZhco/5UBFfKIlON9HXG8s2+p/
	7g9AxmdHDujeAi6m8vMQh4BYOfLTp42NUvUEZk3zG7l6hJMgGMjr7+w1FpjWZ2Ee77z7NYHYBU9
	BFG97bry9T7zEf7bPTzypvbaT2A3p7J5g0D25GJa42mWbqZ0N4xXhfhaOGICaThgCS/6C2C5SZo
	GnUay2+fxoIubMQMNCKd/WCafFOg3eyARTfyd8sroultmrJGw+7WAFBVtth8A1GjQ9vnjoAfrbd
	ntHeq3EhnITg9YhvX6pmwNg2IdcyCueBqYd2TxR0eqgmixXEelBiJ3/r6C0HTTRm5G72lvvmvOA
	xzNPKrovOgZEMJYh+HHIjMex1Rwl76kUrgtUWM33PldDMwJ4KVuB1+Ol3gIKeiXkfPUkZoWz2/S
	Ha3wXMqZmkzbI+y4VL0ooJAqM+hpsp89OpOmXox6OtmqXONqDL0saE86KBV4ZTNmKYTSQsjnVBA
	qG6IM5y+i2/NMJmzNR47oASDmgMijlEl4m/CW/AbsurWyqYyA==
X-Received: by 2002:a05:651c:198d:b0:3a5:afec:9ce1 with SMTP id 38308e7fff4ca-3a5afeca0bdmr642021fa.12.1789132956876;
        Fri, 11 Sep 2026 06:22:36 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:26 +0000
Subject: [PATCH v3 2/5] media: uvcvideo: Use uvc_warn_once when it make
 sense
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-2-604328d8a0dd@chromium.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
In-Reply-To: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If there are multiple cameras in the system affected by a compliance
error now we only show an error message for one of them.

Use uvc_warn_once() to print an error message per device.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a4399f..2a3b7431cc68 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	 */
 	if (ret > 0 && query != UVC_GET_INFO) {
 		memset(data + ret, 0, size - ret);
-		dev_warn_once(&dev->intf->dev,
+		uvc_warn_once(dev, UVC_WARN_QUERY_CTRL,
 			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
 			      uvc_query_name(query), cs, unit, ret, size);
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a80406f20beb..abcafd929c9e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_MINMAX		0
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
+#define UVC_WARN_QUERY_CTRL	3
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.55.0.1007.g17ff1f9808-goog

