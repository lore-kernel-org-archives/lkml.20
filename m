Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806624;
	b=x8B0H4pdUaNe3L3kcseqkzP7ckDMWz5hMiG8NOf/QLFyV0WQNSMVtqnP3SpL4oVDOA5i
	 Uc9r5rLR4BXEA5vnVbGtlGiR/Iiik6QXhPZd7pWaffzk8Th3A2oxFA+avwzCnU+uZgcOr
	 YzOerAP/g6tE4yVpDAS29OMXWVCqOx+1/3XzlcHZpopsucDHrqT7DNR9VEIwagY3fcX0m
	 8FsNPM5n39tcXvqsSeIOvkXB3DMut5DLxaUUHe1t68w6B8uuQAqrz1CBJCXFr7MnSPRmT
	 RxKvfwbQUIMG+0aYUK9LZBMU+R1+ISxplFc+4IIClG7qTpLcyp07+gSCLUnhbcjIUBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XfsPgdvy8kSHCEVv9LMQ1SA8n9GsOVE86sCMtGk1lGA=;
	b=Zc8UjjNohL7Juoe2gcp1BnbQRBfROzXIw0t9ajWOWfjxdalArh28vdN8rieyWm6nhpkF
	 0y/G2Uu0YOuKupe6fQbgTu+jKCOtSLvyAH3pdNS/cVaTTQT+mZlTUg7CGdog5ogMXdo0c
	 4uvVWj/6PEr10bPeVqkmjj8m0Kz8IaRy6YhifztF6YFDHkc2HkuSWfUVtNIvSgwUlqUVG
	 2GkreQQBctvcblD1LOXytRb2u5HrKutKs47ept9TYRbQrom4JDHGBRX1akHEVqCniGvCW
	 b/0xMOAdT1KK+8lLQ+5L4YnnsHZriZdKReofSdO4ydaJJJ16p+JxNN6OVqay/AyfgpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ODMh4QEV;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC4606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CC4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ODMh4QEV
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8374785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806623; x=1794411423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfsPgdvy8kSHCEVv9LMQ1SA8n9GsOVE86sCMtGk1lGA=;
        b=ODMh4QEVtjhQfHvQfvgU78XZh1lK8KDqQZxBrc6FJOIRl12hF3pU9PSWPflHPw+6o9
         LickVM5OEI2lUkTXIfVNuSdkrmkdhFZyGtWoKqiWRcXGuXACmgD0uXCmP751QDgFn5RI
         Q0kYi+M+CmiL3xVMm5rHhdLDWdbk8f5uGxZqRiU+4RambiAqmXs//hIGpSI71UCkQ+mc
         lGG2ZlMXOsbfPMxxX3sP+GV61lW7fBuY3N+7JArIMkYpkleYX54pjzf+52DMnInvHDd5
         meCIuledeAX3cxAjAUOw/wyv3FPbdfs7LtPEIPpJD71I3XL4BzT2+UNFqYkcYMCwMhNc
         hSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806623; x=1794411423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfsPgdvy8kSHCEVv9LMQ1SA8n9GsOVE86sCMtGk1lGA=;
        b=I1HpUD3r4hHEBDk6/5MXiWkHolNO+3vOacsrfQJ9wEET/10mE6N+wdgs/kyPkNBiU5
         gMI0X//duxdDUtT/uAbOQDdbnQhnRljK0+KLN37Zf53/jcAyaqLQ8f5KtI2RU4sJwoZF
         Z3+ogGzABlzHuB6YXIesTq9OOVDswKXykyVfKyslqlt+jHUfiL84f8PsocQjWB3RMqnI
         Umc/aijzgmvPrv1IqCCzTTy3RBhJrCOyDo4IdcHzHSxUu0RkLi90JQhLWOrONy8i+U4z
         9ZhmUsl/J/dzAPeya951jOHAcXsyhQYf2ZA5e3rLjgw1BuK5nx6hId2vk209ltJsN9ZY
         w7Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwmjP8xI2DU58h03qDMIpHN9ODJJeTvMA6paaEl2X9zaPvBLUPnczOaWPbNAEBuBkzRuGbkdgj8jktbrEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CP6CgGDZKnAxrkRpub2EiDzt2Tj9SrVl2YEhK1WewJjnhjRhn
	iiu/Oc8X2m5Q9CxS6Ge0/cVpATYZnq74J+Qf2d0qa9XH0fdKCfTw8nSkNlm+FQ4ECwA=
X-Gm-Gg: AYBFou23BqyAuDRfAq1dtM2gBZBVnw455VfR3ZIaInZnIsefHw4OxwT3GGv8FeGXknS
	JlucB8HVOYkqxvdxvrbFdWJTAu6szfdew6QUZzKM8FMGzb9jKr0CyuxFfe5fckJv5ezlfzGodXT
	usAjajUcF1yLABvBnITB3EQFA0cyATAzAGyVpK2HQp2iAXi2nmjjg6xIEmB+5sFg8Es4MXpGV/u
	alUvi/t65XymDvra0C6gnklh+js+FEkWh1IS4Rb8SbKOsEQ36mjKRGvZ9PP+5O8bQxZyTOSBrAB
	h/Urc4aqfVDFJIQjviUu2XjcQQi0UW1tJiiKuj9FhJXkyXzTJEk8tjOw/xdwpii7/rCm5EquF1W
	+EDc4f431Wb5CxkFjemOvsUO3rEgY1kcxMtaxN2Su19WWPoBgEnAMmijvvhudfFUFJiJ8WaR2Ar
	HxrC42hdn2Pnv42DTY0SNQyxf/Rbdaetj8Kks9SDVr55UFVxaLCK/b6CjWr5Wg2vHoOCcQ5On/a
	9LEihhjV+aN8VXV/Bo+FBGQfq6EvOpC9GFCiTTyHBiXarAXdqLEdRCdeObcDpssMkmA9Ke5aT9S
	oW8IHhKKmC2j/02s9QBOzJl3eS7OrTnR
X-Received: by 2002:a05:600c:3554:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4ac14ec66d9mr391692595e9.2.1793806622707;
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:38 +0000
Subject: [PATCH v2 7/9] coresight: Fix resource leaks on
 coresight_build_path() errors
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-7-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If allocating the path node fails in _coresight_build_path(), the
references taken by coresight_grab_device() just before are leaked.
Drop them before returning.

Also, when _coresight_build_path() fails, nodes for devices further
along the path may have already been added and grabbed, but
coresight_build_path() only frees the path itself. Use
coresight_release_path_locked() to drop and free any nodes too.

Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fe264804-52b6-4b0d-a43e-184e228df19b
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c05d657cde73..bcfeb1c97127 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1033,8 +1033,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		return ret;
 
 	node = kzalloc_obj(struct coresight_node);
-	if (!node)
+	if (!node) {
+		coresight_drop_device(csdev);
 		return -ENOMEM;
+	}
 
 	node->csdev = csdev;
 	list_add(&node->link, &path->path_list);
@@ -1061,7 +1063,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 
 	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
-		kfree(path);
+		coresight_release_path_locked(path);
 		return ERR_PTR(rc);
 	}
 

-- 
2.43.0

