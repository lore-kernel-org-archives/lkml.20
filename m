Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915934;
	b=l4vrDuF04Yy1Usplvde8hQicLHiGpebzEMI9ucib6W48xywK8MzWy2YdU2aCf9CaRMyw
	 Bk1QOcMNoiEV6HLykN8ynOdazjLxCRMkXyvTeome/LclHH95nTzrHWXP53ukrW7Vsxx6P
	 WhF3yW4c9QcQz6tI7lJDAErlvm4EzuDajQ5vnlVnGSnWA0JL+uAELiAV3PdxCKJuhUEPu
	 fznqcREPoZdk5JBWzcHY8f4e32lboD6J+nQUMIqhVeWrUnsYXM7oy3ThFJWZNeYNb4TzO
	 NaQxwhSMNdaKihe8XxJmwFwKtbmeBMTk3a9PWY9AkF898ZQ1hyUYPxyiJDlh9Qt8NhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
	b=Hz41yxYnTzRBNkt5eYn5oqRQ9rSROiI6n86QxEFM9Lo3YZA5sViRjdT19gxQTbLwWahm
	 54mqij/fzeu+Jrbqv1i3IfIyq+SsFrF/aeQ8LdZ6Ro9iz0SDbrM46BjRs4tBL51bvEILq
	 tBx/1NtBMCME17TxKgBvfztxTYBGWKjqSHh39AD0TX8eqACZLbVdzW9EYc3wIaEGl4Mrv
	 Bw5D6W/TnYauKH7qLzMWz1A9XsmVK7z0LDH5Vm/6IqlzGLNWpkLGiEe9EsU8Nx6gTitCb
	 CJMFV5LGlMTpmgF9vcHa5cJMtq9nVT9R9+Pqp8IeFso9NWCwS20xM2PcZjV8p8iJ+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WsqOSfIV;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED7606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CED7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WsqOSfIV
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so6146532e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915932; x=1795520732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
        b=WsqOSfIVK25F9p93Brwyq5FUsh06s2akhOotHBD76D3QqA0aAGgDo3nhbPfHQWpteI
         2VsdK9H01btnbfZZY2X/kQOEjVBJftHFgs63gbzTMAf9X3QKTj6k6qzKs8k58Yw7fxGm
         7ASWZq4F1S4bivuZu64rDBZU4oUb5Wq6jIOIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915932; x=1795520732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
        b=cmETRLPWB405SmbB/9jFGMJmfLW54S/RhxKtLssCYwxtEAyk+XC7n2xR0R/kdioZ2b
         jxhzseRyZQDCK3mCCssmYYWojRNw9782DHJPJdRqYMThFmIpBsSHWpBleGGvgLyfdfd9
         U3ZXNGKyKZsk7pwJ+RzF6ianH7bzTyBcV1O74lSSGsl0WCuo4YSDC+jDiM9mgDzaqodu
         T5pcfykayd/7EsLDvilIvDRVIfI3pG51tCkZVKS162Lg/bDq/4Hcn9TXNFP8N4zkaF8q
         EeCzFoei1rM5s+ZwNQeJHc0GY+jHgZj0c5iqSjJQjkNx5GBm4Qg+l05TSun3He87gX81
         0+hA==
X-Forwarded-Encrypted: i=1; AL+hErHFxsvGYV+1wqynhq62H7h1cvEtuVYogclP6pnYT20R82nSQJ2zVv7bey4iQh8NFjEFoaHtMrrc1/2/mJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UzeL8DU8JogSt3VPPPv0u4Gs/x4aEDxtctIenXefVFJqxzMvu
	SY+yZDJBJzyDb4RBTicQyHaCauAq4z9A02I23nVXVErjRswT/ViTFq9RRPtwwfMtiA==
X-Gm-Gg: AYBFou16+q3Y0+t5w+8wT6ixPRGrzWziqNgidall84N1s3PRRhwP6AxA2Dz8dR62xfZ
	EKBeN4j5LYeAI9vagFZFFhtuNbQHG1ZsgPDpRnIyohFUZUiSrsgaNZ6kWAhAnqKxzIwKMYXe1dh
	sgBfDVFlxskNLeWZs/BBvSFqaQFdwO6i4kE78b5FU9xDEm9VXWZ5knmWtVpYCdOEnTHeOuL7anv
	8lPEUugtZmjxIN1S3PSTZCTnjvoifgILszS58pvyDPs8XdoLJPRd2/IfoyMZ71ih5jdCFP9HtY1
	BF39zqnrUgXcbK3h+zGUJ+1HLMbLA4czpRSVgNn3/IiE45RTSY+QDo+eiPDOV050Tc79r18hBZr
	+n8X/KiWWLXM3xeSKQo2Nf7veyQPwllGmNg3hm9bXdVigV8blhasrxWVWHWvnnjIIRh8200E/fb
	WD0nNyuKO5xQQQpk2I4zMbtNRofbDtj5mAc871ym3X9+BSmx6HGSgLp+1BPRxvM3OSZ2nYtlag4
	8qHEQnrFRD7XldK/YazumUv6jIGr62rfjEvsE3f8DBGXuJwbkW3AJiSpkJJ2yOb0URRwWR3EwLw
	J+iFf7slbnA3Hq1Cjnh2KzF6IKLEaR/kAHyYhxLBLAR+23p5QXTViPL/UmlpX5JeFxQAi+4v3zk
	5xMZl5xk3XQ==
X-Received: by 2002:a05:6512:2305:b0:5c0:13f:8fe5 with SMTP id 2adb3069b0e04-5c170a07f28mr5117026e87.51.1794915932409;
        Tue, 17 Nov 2026 03:45:32 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 11:45:26 +0000
Subject: [PATCH 2/2] media: uvcvideo: Force the COMPRESSED flag for
 compressed formats
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
Message-Id: <20261117-uvc-dji-v1-2-7cb3cf3b4b5a@chromium.org>
References: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
In-Reply-To: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

Some devices, namely the DJI Osmo Pocket 4P (2ca3:0023), set
bVariableSize to 0 which fails to identify the HEVC format as compressed.
Due to this, the driver sets the buffer size to 0, making the format
unusable.

Add a new heuristic that automatically sets the
UVC_FMT_FLAG_COMPRESSED flag for compressed formats and publicly warns
about the non-compliant devices.

Fixes: 40b222b56ea8 ("media: uvcvideo: Add mapping for HEVC payloads")
Cc: stable@vger.kernel.org
Reported-by: Jordan Moormann <service@jordan-systems.de>
Closes: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de
Link: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de # USB descriptor for DJI cam
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..f5446fc8100d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -332,6 +332,18 @@ static int uvc_parse_frame(struct uvc_device *dev,
 	return buffer[0];
 }
 
+static bool uvc_format_is_compressed(u32 fcc)
+{
+	switch (fcc) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_HEVC:
+	case V4L2_PIX_FMT_MJPEG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_streaming *streaming, struct uvc_format *format,
 	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
@@ -413,8 +425,14 @@ static int uvc_parse_format(struct uvc_device *dev,
 			ftype = UVC_VS_FRAME_UNCOMPRESSED;
 		} else {
 			ftype = UVC_VS_FRAME_FRAME_BASED;
-			if (buffer[27])
+			if (buffer[27]) {
+				format->flags = UVC_FMT_FLAG_COMPRESSED;
+			} else if (uvc_format_is_compressed(format->fcc)) {
+				dev_warn(&streaming->intf->dev,
+					 "UVC non compliance: forcing format %p4cc as compressed\n",
+					 &format->fcc);
 				format->flags = UVC_FMT_FLAG_COMPRESSED;
+			}
 		}
 		break;
 

-- 
2.56.1.708.g77570a6a1d-goog

