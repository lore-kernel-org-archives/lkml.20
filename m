Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851543;
	b=YGQmRbOGs0idz9bLk7nyEIb4Zy33th6cKCKeIdPoI6HRCuHKsoENYT0tEB5443tox1tC
	 LMQR5IeLNeqNi6WdJDD2xKwHVXpqg1NZJM+HSH+g1BEhBkP4C2IqIbslbAu7f22xr7HQ6
	 63fNSJJybHtyAuq1KviDBnu+TYFier2Ns56xhxiSMN6+K4pfpi46Mc8kHSg4ARtK4OmHw
	 yCzt8SON8lkkBxV7Zzyzfa4EX+af2mACq7qMZ1g362R2JTSvYRJy2STLxkO1Kn+h0LX9Z
	 CTsvre4Biz9qrHRZuQhYo1h9IFj0XQpzDtf7HgozCFA/QO+Vtf5WyxtFBqIgTCZBtcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
	b=zwy0wj1dWNAT06b7TaJwlfYq//3k3Qi6aJigyqQlF5DKvu3FYrIiB19Pr0S1Utx3yP6V
	 Um/LP+qY510aaojfvSaJ0KUJY4ALCAhTh8iuYpv1hcKI8oN4oDd5Kbd7C7siYeJXUjrXF
	 4FadUx5pewt37hjkgq7c7t048nd5IN8H0xATwErvcXOYuNYRU+3DnQvlbnW+azHF8oNNF
	 ySYedhtWvJ602mAaJjYE8P1+75VVhAhL5Ulqq0p/mTS1LaqjxFH0G2Q9Oc1WdEgfxWY1Z
	 XGwqLgqEpkvSKEJ3eNXeH5nhdJaTe0DPg954QsjG/UzmT6WrkIcmW3v2YhEhJvkO1Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OgXgFlvK;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08D606A8BA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B08D606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OgXgFlvK
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso3739413e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
        b=OgXgFlvKOEMs11VxHFKS8Q6Bon5uLbybbWRwurbnp+6hzPkrhnaGWaK79w2aRejWfn
         8xLBNdIDikUgAX9OBqwHKTO7y2KdSXBL+pTJlVK12EAsDfbcbBJ/LWeMwqavDitaiLkk
         uZWWgXcm5+S1EAhIcz33oAgCVpXaSLVXq2a/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
        b=gArRLEhqsGARQOBpOsWLMYV/WiqmPnrpdgm4CDivKa9J2SR3Y3oOuYO7x35+4ggkbG
         tNtqMpsqdNBKNvyx4Qhh4ERGs1Xg+ztBzbMEzStT2Y4U19zwg2cORBqNrYKAzQl7LXeq
         4uLnPPzcJ5ojhNEhSqKOq3UTvH+4GU3y4xK78X2CNyXn9hVXzPPNOGxBKbO7uMZ94rqu
         JfeU6iRNyWXL8g/mDCTGzi0Zu3W8ZCtZo2s9MdITzK3kRiL9ju0toChJQT6kKihpa32+
         SbJpc9PPFPeudScYGFX4UwylH1ygMeSdxE57bLV6KjXMZ88drIPlvxjFQLm7fZJm6oER
         yMcw==
X-Forwarded-Encrypted: i=1; AL+hErHMRHE0aQMolZFpIaWyi5QWX9mbNsbXN0HhpPfXPjOtljgdGXmHL/OpNQv4ejC1NvhW/MyGixegY11aBmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z96G+mCYgJmYO5iH8iS6zXN31Q17d7CFBl7FMibVFgVWiY+21rV
	UUzI8urp5NqaKIm0undbQ4ySSPgHQHKM/XhTD1WxkAm0eigwUWIchd1tLYZM4c4mjKxS1ylY8Rj
	C4BIgapXl
X-Gm-Gg: AYBFou0jQjyaM/ukHm/5XWgkupyXccwrLDXjV9Enn72j3TFjGe+Idwz6QfVULst1pbk
	IqpQn8ujeFyGMokvw06K4Dn5syKK7kAGKQBynLPaaEcAEG0g4uFoR9iiav0YjVVFJx4GxqXoQnp
	p9gMA2znESn/6akJCB0cIOEHL13my7t4Ml7YYm0wTPVqqq+13cV/d75xzT8XABr783bv7dMr+xl
	l53rOeczHoDL6RM73xK0w+1QEhGILrJSzqN3VbqROmJBrwkl3ehwpmds0ABVNDdt+I76lZvrcJV
	vCy1k1OU/DFBMjuK4UE+2asUnmlkpLcbLqW4+xedPU67JFq/UrMDuTuIRbUDwZqg7qakyyEC88q
	tQ6pTt4G6MoYHzozgj10dtXmnLi9K2FJ91oJQryoZBfUIhb2mw6ztpapAoDerVLoYWiFX10YKib
	VrGPMk5KlH1aNKAQY/2fX0ndwjrHc99prgODLSn4WaRuoG3Cywoj5tl5XkvIjJHzOk8yw3lF5HA
	ARUZFW4kRcoXEcw1M2jR26/2BNH0LRcVFP5AdjHoEZSqPSaTGJ7r13IEcG6fi6K3COBSutj7xN5
	L3r6Ac6v3dTgZlVG9Amh9n5h5er6KlkWoEROUOf4oTnk0f9AkV2pqzTUTse8FqSr3noxE4DbKlu
	L027SoT3DqII=
X-Received: by 2002:a05:6512:138d:b0:5bf:ce20:57e8 with SMTP id 2adb3069b0e04-5c1709c19c4mr4170869e87.40.1794851537494;
        Mon, 16 Nov 2026 09:52:17 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:11 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Use bHeaderLength to detect empty
 packets in clock decode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uvc-shortmeta-v2-4-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Use the full header size (data[0]) instead of the minimum header size to
decide if a packet contains payload data or not.

This fixes the heuristic on affected devices if they also include
extended header data such as MSXU metadata.

Fixes: 5cd7c25f6f05 ("media: uvcvideo: Ignore empty TS packets")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index ac8e0c3a0c71..a822b8234789 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -641,7 +641,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	 * clock sample from many and the clock recovery algorithm wouldn't
 	 * suffer from this condition.
 	 */
-	if (buf && buf->bytesused == 0 && len == header_size &&
+	if (buf && buf->bytesused == 0 && len == data[0] &&
 	    sample.dev_stc == 0 && sample.dev_sof == 0)
 		return;
 

-- 
2.56.0.679.gc527c65306-goog

