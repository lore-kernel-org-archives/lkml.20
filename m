Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C354DE729
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605940; cv=none; b=C+hWCK3emKqKKxHvPgi4qTUF9DnE6MbT2WoZNBLaPa7Z1PMWCpc3fcLLj/3pSqlkjaX+rjIE/BfNX+Y2OadC6c83NtCM+AltSw3oD00JJ6oRPzeTZSOJ4/OVZrC8B4HOUuDSZCrsE0ikQrzZ0bXiB0DwKc4DC9Y5+l5FUHcZLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605940; c=relaxed/simple;
	bh=vTx2xmq1OWfz+8T6HSxU27AUGa2mZ0TcP8GSl6lUKJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRHeHfElQj2MgzvSL/HhjTEK8Yaw9heHa6kNltip1Ct53G0NE/OiZD3BQeu5WZSLEMCWNCi+hFMQ/npIIv95/QEfOvvjRFPkBW54I1nRi4iE7H8C2zO9JegDr1u8lAigLWdhFhPY2m4tqWpzuCYuZZnT/SuK+pnuWWmc8hHMops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZs5oXqS; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZs5oXqS"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso26991641fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605933; x=1791210733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZmOc8wc9+wz/uutYCALFKqsDrQBIXPS9oyyY3WIPdc=;
        b=PZs5oXqS62eIUAe1AeULcvzt1ZSqIaPh6PKrvzGYPZMDlgyWmxfXtWDBAckc1k5yUf
         h/wO2Eu0EHEssxwfLJ0N97OLLDvg1Jc4NuDhgOzXDK5Eba3RtWWTELYhzaMR/ANhacLN
         4rb0Dr8Ts0nqRkIUAUKHIc4YtycBt5SVVJlWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605933; x=1791210733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZmOc8wc9+wz/uutYCALFKqsDrQBIXPS9oyyY3WIPdc=;
        b=AYkCQhonVgUHkJHjgBelN6xrfDZr4Ev5TjJMMN18u6bbTcuC9uY1iDBWSCt/EarhE7
         elV2P6oe+b1I2EGXjD4VE0kUUfMQVcUSXts8FWH0PC3k7G/bazFyjZ61Yk96yU1BIzsK
         HGLhdfAuVE9cYul8YGfBuX+dpLooqcO2Y2jSIA6bIbPzx6mEJHjKOgBpWFSEtuA8zSS4
         fKXJHYgujqSUFTY54P7m5rJl9FIU1SM5Sn3YocAYv0HRCUJMz/+h2+XrQ9Zz/t8xeptE
         euG7MNHF+vz4r8kmHr3ZhD5OAM74yse8LbDXkJMDS/RrV3aACDpcwp+niK2Ry7CdDQoe
         WMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGDbbptI6gtCbDwWYzvzG55MKq9iG/A5rol/J7dSCHCpo9Qi4ojIVJZpaQ5We+w42v+Q5GT0LtE6IPkRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhM+nFr9Madh8FUvKyeYVxYRpO6tEk+6wag9tKXJHEgtHIzqTD
	LDdRmrImzLmVsnDUge+5MmVbYnXUjjmQL5wa/diWRNrxXiOeo3fONpWn1UiLVLgTTQ==
X-Gm-Gg: AYBFou280oH93YgiAxAbvWRqJ2PYsxQV9mDEkkSPoNdDgyfodFexif+AZae93V9dS5l
	H8hggqR+dKDQi3kpkDJadV3v48ToQ1+tCbs+lMZHxR7V97Cbz1N4XIZFgxvoFsdP32U4dmYPtLz
	UbiOowSLllT8KdF+r7QMqPKOq7F3kPxhxPqRh7srxqK+UsPQZoErGapMMfcp1JRkQvWVsl/Z9de
	NkhSGQxYLAhT0J/FHznWbTLDqNUqhEKxxkVgibD1Chp3tRxt/kSUVtwKceoJlabYzsnuv5QV5rh
	uufHsBe1ToZOv6R7OPnceOVU0jyw5Z5koM4LsW1x2XoMedkaWiXUxrMGwBxA7cGfZXJB6RtoUtW
	efaLl4wmKTNgpMQxd3ks6hssMdyBU6zgSmApn1cHfecRi34nAQguZDOAfZTEsHPT3VfxcUX+y64
	c4piqQBAK00FyKFXiEjoNWLrHn1NT+wkm+ok4Bmdws7ENWj3z5FXEi9ONkb/N/CF3UXclpZEipb
	HhDI9uiuGZZXoH4DYcz5DsaohuEqjL8qavAwxj7GrEfOrQXJQ==
X-Received: by 2002:a05:6512:1313:b0:5b4:74a2:cf2e with SMTP id 2adb3069b0e04-5b8df0db4damr4119015e87.21.1790605933233;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:01 +0000
Subject: [PATCH v4 2/5] media: uvcvideo: Use uvc_warn_once when it make
 sense
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-2-da0e983fcb95@chromium.org>
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

If there are multiple cameras in the system affected by a compliance
error now we only show an error message for one of them.

Use uvc_warn_once() to print an error message per device.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

