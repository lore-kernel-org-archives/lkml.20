Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1364E06E0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605940; cv=none; b=B+jNYCpvuv/YYb64IiU0dqwbewHRgiB80wbfOdLvggkrZbGl17UaTmMAlvElfgXYLhexfe7OcSLB4ZAqw/Y6uFxIRf+ZvkDQvsfEGRWOe0wtzfnf/JU1ILDMiZi+uAm7LqdqBKosSFAARxTwZV+9WKw9VLHgpa001Jo5tGC5/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605940; c=relaxed/simple;
	bh=C32WIKcMjSufDQSgpLE112ID2RGi2wFW4Rq4I0PGvBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxKajMtC32av7JqkCXAUs7cSU2fA3Y+vqBb10I7M6lTfdAcXXp/AbALMV5eRfpo64toGwf+KhKaxdh9YIwPTGVd9fF6NLEM1oWoJTFCRmxUEZdBS5dtzrPptlLo5EVsyMGFlNhRmSMZpZ9/qLra8lNbXOLs1Zv16Iww0edXbwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dv9UnCIJ; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dv9UnCIJ"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6502b74abso22730211fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605931; x=1791210731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUwHGqWdEKrWnZJi1cFZbi/odoLBr8uhXk783Ds9z2g=;
        b=dv9UnCIJgK7VNQ8ImE8+as/IZTNeuiAWwR6OnJgYpugLUdZWLJ47ZKNa6nUue8xSJS
         kkLSf8wTHFC4aNk0vvBx5yz3Hej0mSKAAho1hqUBItxkrJmlVWibJTsLhOq5+IcNjR2I
         SisD1UqhC5PqtXAnD+l2g3He5E5rlN0xOmJP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605931; x=1791210731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUwHGqWdEKrWnZJi1cFZbi/odoLBr8uhXk783Ds9z2g=;
        b=L08/Sv5VW0l/JNzz4WwBIDIricvb2hLDT2W7G7FYW5Tb9WWZ1LQ3XtPAtMK6aWU5Lu
         cyrw/1dSaooKUEykuJZhzhLxEijch5jfgQ9xQLdsLqP898jhd/IdtS/U9pONOW0rP3uU
         I5hsw1JWG2OPPSl/nwmKG5URV0l8XuGITdl0CSB4LZ39Rw900HFnjt2V0JMGCxhlDM5i
         UMAnw/VHhm9n7EzWzwiegw0ilQeSVjCzYQttTajzyaFf0wXicGhb07CJhACm5k/hc5c8
         yhyXpJ28W+Ag9b3wdZQxrR4r7UQNZqT5LNpAb125yU10qqQPPw4IZq5Gg5y68a+EdYY6
         3aiw==
X-Forwarded-Encrypted: i=1; AKwUvBxjbquOA5g66XTt9IUzRZGF31xXFoHaADQbfheteXXipxOtcPmLJjuQKw48WIf7y8vX4sDJtUO13luMafA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzYYSfTion/RUE9qTQaYsn14aLIwr1wVhemq04KROfRvRHbYc
	Y9XqBbv9rit3ysGdKO0hcdDkoh2sojMPnZYrWTtUP/HTOjQLgYjJa8cVO5r8oad4/w==
X-Gm-Gg: AYBFou3dMLReEeRq35bNF1DxKf2Vz0+zvipixIP67Om4mqeoX/PiDCKsce7dVNpvkMn
	H4u9eEH1kP4MOfP/8Onj6hdzvjTq/0Jz22/LSbpb1Ykr8pkQB/wDLKRGZlUignmS20kErRhs24L
	PyJACuCSZy4D+sVGjYfXqHzy4DRFZ9qW96rJS0+w7rJiXysjoHOyyDY+7FQsz6EO66+hMDqZld/
	Oe9pmjxlIInMLtSXoNBAu/tVwu18JSJafkoeYRuyS2jYjozuVRwa/5e0eCZdIH2Oc0Fu4cElURM
	KePdNhxkEGVUCn3sdNrESsvLFbQv3xN4oBHOWE9j2AcgjNKINnUd4FJ1zkutt2O1P/E06hlxP7r
	yBnfl4JOVggBBdgYzx90vgC+ZIUsUHDXywlBd+2WYGdBNROa1S/VP8sKa/JF4bKLEhBBxyWK4DQ
	bZSm87PaWMOKP9fAeBi5vk5jf3D4YYZoJirTZUTP9tdY3RUMgtunPyPniOSmE7neXXIZV/t2sND
	PtNL/gMnNkfG+sV0yHWIP+7FXVRpHNZ8+i6c8PTv9UiwzzHqQ==
X-Received: by 2002:a2e:bc06:0:b0:3a7:60f3:40b2 with SMTP id 38308e7fff4ca-3a760f34514mr2414141fa.7.1790605931661;
        Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:00 +0000
Subject: [PATCH v4 1/5] media: uvcvideo: uvc_warn should warn not info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-1-da0e983fcb95@chromium.org>
References: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
In-Reply-To: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Now the uvc_warn_once macro triggers a info message. Use the correct
level.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

