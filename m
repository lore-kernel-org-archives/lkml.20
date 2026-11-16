Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830206;
	b=uOtdI5KSJiHj18BBvSd3syhRX/DC25IV4rYIV1QJoYkqbFtfo8UX/Jjfz6wdakTrmQqd
	 UnIl+OEf/kuqkqv+FaEkTSiHR7R0CeIoL/C+GzruxzdOS0nzifHWClPoua4wGQrxOzQHI
	 7OAOqSegfuRyLDuRRwl7afW61G+CDMvr12uWKNmhJ+Oc+W+wjRaA0ZiDuyIf8CkW8MQ1l
	 mJ5XP62cSQq3eYzlTPJ0sURTQG7tWzqmmjmoFqzhT41AOyFt7N5reV9iGdFRB8Ooz2UPR
	 JEDZsSV89Q+YE5ZWq4l63OuP2UkFi0RpJq9K3Jf+Mi3GkmT5T51sWzQ7IJUup6NfAtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
	b=ks02mqgsPWpzjmz6rTux0cM1cuashcwTwNV5jjT/E5s1+TsI3cAY3OXuv7kMA2BsDTVr
	 jbn/Y3f+UM4jXwACg65836wN9QnxD71eqqTm7GPsOqKVYhtDyFisDUSd6Nbi0wlX1y55C
	 lYAj2l9MPrw77BHdxgp64MTmuDx1/Ent0gGxKBhgJ64JksYvzW/Nq/tSRe/PmNt0C5qs4
	 bSUnzNnItA+YJKExXk2AXPGKWMzjb5PqNiN2hA26ouuBOB9lUJ828/5SlT9ZgFNu79qpI
	 wYxakCQfLF7VY1EqEseFCyB0741Y4rG/9BIpFgHrbxX93hAqUmXRbbxQlxxBUZzQWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K6QuAuQJ;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915B606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0915B606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K6QuAuQJ
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so30459431fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830204; x=1795435004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
        b=K6QuAuQJWUkxqikWrZ3j43wGho2vSW00MBfV6rkA7bNMYX+be0i+viVynRYuY5ml38
         YVrbqqzWKdh0m2MSTRvE//kfuLRd1oE46xlPusARo7KVc9lSv09uQD0wtKhsIsf93A+a
         cTQgmUbRpg7UUd1w+0fBDYzAjItWceeqPN+tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830204; x=1795435004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
        b=xsrwY2mALH9jA7lnFkXuiXkZg4pqtRIA6QMlxCAqKzqEsWDPFTr1nfKYyK4FE1W355
         Ym5zUMQXDGyRZ8HIRa+cU24lOyXwlUq0HMQsKhOaNgIVpCCcXAsi479wWeSQ4KX2klfr
         xjg4emRFUxe1YGZyPRywFeUzqY97E6/vjfOJ6irWFLigSFF/jhXkwr5Eu0kIE3rPLkCt
         7JQb1Qk+idWZrQ8XvdM9h4vW1MztZW0+ubWWJxmxsutYOzaEcPGNnohcFnOD+QCwyEhk
         aeSGAvvqospTG0aUKEzSG6UsbUlpN74LEWq4CS9dTaY/m4U5MXsTHytpNXqhqKUQzA0+
         afbQ==
X-Forwarded-Encrypted: i=1; AL+hErGp1ZKSYXhpkquIbPN5B/npclHam7mhORGyevWJLUpZe2Zso8kwv4FgSLARGYFriqA+UohCLw0xDUkmchs=@vger.kernel.org
X-Gm-Message-State: APuU4Z80yEp/NUjJ5fA2FSlEYZShAUzLjOXnhXxsg6UQ3m0ok6rAUHnF
	w0Pf5B/JnvdSpuolhPG4o82BJow/P9NGkn7RxY1HbK2YDlm7BJODwZ4JuantV0+v9A==
X-Gm-Gg: AYBFou1qN6SbtJlPDLZEzHjN7mKeR+lr/GUusaRSi2fFyI2YBnEbMEV5LElupWDThIY
	/G+B4HFhv2jqMlwxzw16CQw1Kuiuo1ZXD9vp6Oa8bMmKFjp07TDOAAy6XLCV6wRGtrujjVba7Ry
	wkH/vUWZ2eTrkIbHSiO8WteWlb0Muszj6Z1jdDDVEG4m3BI6Mu8+nw9c6sOZ5wrolZ+jwyXy2VB
	o+DnZ8i3NXarVGofaV20dtGfValB77x0012G7N7YwErOTtgfs9hM/U4I3vFrq8aWHTjn2QNTj1O
	d3XLLJFpHcUUEwF8Jrinw+5Ecs/78iUfXf+VDq4sCYGDAT7z+XXAT2e1MMlSe7NsLbcUDBF/Fj+
	E9q7OcSgK0tkS12KlT2EAf7dYr3jVOQ8naxU7DOrKyaS/FjE2RDwkkx8PoGxgxckdE9VixsdVaf
	u0iLllhX2QcJhUQZ2nN6wYejrPXw1V4t0IepCrI/AwRB/WcfeB+Ce+MKzX+DygOyzKdBwDeLb0Z
	YI+r86gu2y9dQ1hapcPFbYGHC5TwBMncPoq9o1KHKVhsZNrJ7BbXdm9BgGkbgwebfV4t27iKwc2
	LL656bIgnapaath0Lt7Z99bShiACnQ01UZraCQPmYOTtcqHoPtnzp89vhIhJgg++tkP2f5iIaUv
	tefuLhqt2EQ==
X-Received: by 2002:a05:651c:993:b0:3ab:2d74:71e with SMTP id 38308e7fff4ca-3ae2b4eecd2mr24839651fa.10.1794830204243;
        Mon, 16 Nov 2026 03:56:44 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:37 +0000
Subject: [PATCH 1/3] media: uvcvideo: Reject short metadata
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
Message-Id: <20261116-uvc-shortmeta-v1-1-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

The UVC header has two bits saying whether the packet contains the
optional PTS or SCR fields.

If the header says that those fields are there, but the header is not
big enough to hold them, there is something wrong going on and we could
read out of bounds.

Mark the metadata as invalid and move on.

Reported-by: Sinan Turunc <enscrpt@pm.me>
Closes: https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me/
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..9cc5d83acbc2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1487,6 +1487,14 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (has_scr)
 		len_std += 6;
 
+	if (length < len_std) {
+		uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
+			      "UVC non compliance: payload header length %u is shorter than expected %zu (flags 0x%02x).\n",
+			      length, len_std, mem[1]);
+		meta_buf->error = 1;
+		return;
+	}
+
 	if (stream->meta.format == V4L2_META_FMT_UVC)
 		length = len_std;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..59e23e55bc2e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_META_SHORT	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.679.gc527c65306-goog

