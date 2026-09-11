Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1D485500
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132959; cv=none; b=YgxUS7APVRh8JA7ktnGuSlI86pdiShCQ6UH9siFAxXnwYgEpojhy4NkP1umdbm7K2NNU8w4woq9AiiQQ7LrVZ76xwphoITLwswE4LYZawCKLJ4dcv5P/8mOroUykgoRbGVsCGxOEOqAL4CInalE4AVNKmWzMzVar1wmAye6J+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132959; c=relaxed/simple;
	bh=bOQ/MUtV4oABfhpMfaORamrLvXRLrnJxJ8E3V8zPxPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qho3wPbV4YX0uiEKu3f6+Z2r3EeSydc6he1egPtW7OlHuHIyJKP9v8mcrnDoXjT582cafPmayyDfV3uyL9o9Txg+w2jjVkNFk8ncXLuNadPYnhMH2SP2oGwiuslSH5IZ6CREzlxCBIUT+CnwrhDS9HwLNYKaaqyYmjBt7ueD0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fQ5arWep; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fQ5arWep"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a309f92daaso7236261fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132956; x=1789737756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axORLmg8T0T4dSUmkU6VVFtEBAwXnJ3GuirIwOgJeOI=;
        b=fQ5arWepsPpabgndkLNl5iRZ2bKo+uI+JRRjkDvfcbt0eM3P1wbujxBFxq9Z3AQ4M3
         H6bVw1W12qbQMoSrQB2Si/8deu2g8jse3qmqa8sBbIKnKRGqcWSzDOQSuvehx07Vpq0M
         cZs7FGki/lZxY1zM0DRUqq7FTvB9vx+uf7kHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132956; x=1789737756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axORLmg8T0T4dSUmkU6VVFtEBAwXnJ3GuirIwOgJeOI=;
        b=krgWnoOFGg0xZDdbZ+UDJq9RZL0aD9w6Fcq30UZv2DnyhwLEvK5BygqKtKP1Skhnay
         jtVcd30fxJ9j/nO3KUHYUuz0LVHywcaxlu4oX/WVZVfIMoJJUASQmSkBPESq2aYUWxnc
         Jf0TLOaZHZZm5rLc2mQLCo+/vjo8h4FIzjNw4EI1a1TlHwPP6dRxbkhazsJ327yjuquD
         PvnU6Yw/e14A+A55yOZubZu0+UuurZ6zpIOXBRUaVIitm8qEuYi0zTRgNciQggIB8cZr
         9Ze0pP8ywMRF2Nci+j222xW0w1JNUltb26Dx14LXcgOnp/bzhRkV8Mk2e4C8EAhj2baQ
         qzew==
X-Forwarded-Encrypted: i=1; AKwUvBzQCX5IfAwXyj+yP4x1hWwpnSC2RpbI53DQCH5mvNbkR0UfTiB1AXbpGD6N6DtjrqS4ixuMhBL3oO24oYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHNRzgfH5zKG5pe+wpgsJf4i4KYekLIWPbgXgoos+LE99MuMf+
	obMNUk8ODvYD+SusYq9DX1nuFStvl/2hKI4N48KSW/SCuwbVjnYy5jJ/9nLknM0OPQ==
X-Gm-Gg: AYBFou31NsnowgXKKv+nClF8AkSVJs10TvLCIGTyJjmGqKnwqjCD2nwSpRQhdtnuPz2
	QlrlwbOKkUJYePk+/9dE/Q3PwcVMsiPv5Oqw0Oi7xcf96Z7REJfeU3no4WEL+zuZo6EQ2A2Z6or
	nGEE3zMOYWkPGHwG7zAXPkIFkO1NxmPpWnPVkGeUBZrgOz/VfNybA1aJmC3vmKZe8nB+WRnYCr7
	aPXI+GsFpEGWzLtuah5ZN5DjX4I2ccZK5JPAYaz84mnrouXWL37DtJWKrORhEXZWRC/HYqlxACZ
	KsRJKLyP0NXnTnSlTr33sMBfvcTkpuP8meSKfVSG0Fypu39SElSB3r6wX3UvjkxfQIhVsszJtwL
	dy7MPYS+ClcCge4VYhmGTmJS28L2imTikrX7RUjlOHLfukdCO3yKLsyU3NObTpDLCRY9eQl1SZh
	jURFoLWEQynU8H/v5al91Zxpe/pzfH5lBVFrr/cKs9kAIVp+xk80asniYh+LETxEBLnd1hjuhqz
	w6nLRnn24w8muTFsNQcFjK6JUpLTo+wEMi72hR0Pwgu9lLjYw==
X-Received: by 2002:a05:651c:2127:b0:3a5:a54d:c8cc with SMTP id 38308e7fff4ca-3a5a54eb73fmr4938891fa.23.1789132955799;
        Fri, 11 Sep 2026 06:22:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:25 +0000
Subject: [PATCH v3 1/5] media: uvcvideo: uvc_warn should warn not info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>
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

Now the uvc_warn_once macro triggers a info message. Use the correct
level.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..a80406f20beb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -685,7 +685,7 @@ do {									\
 #define uvc_warn_once(_dev, warn, fmt, ...)				\
 do {									\
 	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
-		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
+		dev_warn(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 /* --------------------------------------------------------------------------

-- 
2.55.0.1007.g17ff1f9808-goog

