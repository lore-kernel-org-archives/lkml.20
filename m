Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915934;
	b=BNL79yFG/m16skVKKT8i3xM6U0fWPbe6atZs2vTxP8VHw1ijm8sgIqrZ7PniyRzZSFlc
	 rJ5WfsP0faRcy4yo/FMfyrVaLkTdWOBl+Vip7A9HnlK4arOdEY8qeLkuq/UIQ6tsMT8VK
	 SeUelGqY0NOtl8yCTgfodCGtlH2qDoudR34lVl35HSzkMdTqG+KHiDgcrGDd1wd/VI3qk
	 FBWhnkO+WozSJkZOiIkS9H6Xx33MbVWL7OV6PXWyKr18oZLNQuYZahwsrYX97SSwLrRYA
	 fLjjh/n2iQp8i8AbIalsLwTEtlkRGXRIHoDwTFGzMcrjJUhVv76RL9W8QWKjENdqM8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
	b=srkQVCOJKnPyCJhrcck0VdDFzo3ZUDxxoecOlnR75pjAw8H5uAqK0IvmD2NugDdE5Uot
	 lx1R/U0VNrmfMf4FE/ZTwhGDNs10Wu7y8YgsphFoKnSkeSQ3BpLCewWV5i0aYkPrKpXJp
	 K/CTMEebQGgEEc6ySKHPefEcCFPWGnmvd0s9gEEWDXeGxCaS4lZdigMOooke7/gnTG6pt
	 0LRLEUjvHLdNN/ledMecTo2HArG5+p0D4oM2VHxaiq3NJzDxFopSFD4D0qkXU2OsXdzA6
	 219BZObsYXTQU31fr01dsnoRTLkNy4s1XjdC4Ziptmzrrt69W1uE63s/mlzsqW+KfWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PfcSc1Xv;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB17606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB17606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PfcSc1Xv
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso7589141fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915931; x=1795520731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
        b=PfcSc1XvKlk/DIZONeZkQIZzT32HbHfJqlE0G+YBOOC3LvGz+JT+4i6XHQBrcch6uz
         qKCHb9TIlE60UCro7tYZgWSpPOoVW9XO1Q6mQggeTMwkLcCKWaKwOxYFNHY4htzNy90W
         EAuN0yNbL77v43AgNHoAsz4l84kSsfLFK2k+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915931; x=1795520731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
        b=IOpFJbX0UxqanoK3MbLuJD4D5FpPtBJN8HRHbhK3Q5aDJsXJua6KpJ/g7NIBrbBSd/
         v+lZxl4OLfoQVndkx/QVzr1ezQ0qens1Aj4L3mhmjjvivy3/jzKjLuspJcOZhitV8UQW
         uFigebjH+fsdYDGZvAFSmRMk3Im4jNYaucfhMJzDJdVZeqXky+jTK2fNyd91uS0tj/9N
         3ZPj0ByO3Lvp5xVCtj7awtbPgpsIS9n4TAPkngozrlwmWwwvQIMlDnSKMiiO8a55Oy+V
         zsMw7VFPTEjwoxgJFdFMCtn4hGbZARHgbA75mnpjwtGh5YwkoaOoC1CRWMHagFIkyPVj
         6tfg==
X-Forwarded-Encrypted: i=1; AL+hErHF/X3IfxhLMfVGOSV2RZVRRTGS1NhQKmiocP1KwHea7RhfvVN/yKSvg0usvBrsNlGjQYC6BVVNOsGUPgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X/2OEbWv83zMehSCnQWyO9IWGZInsvW8F/vkuNMS3ylxMKmrL
	xFd8p5s4KcwEu2AdymROEZ3HuNY20J+zf40kAuPCc9L/ek+OlukiYwkkZPcjW7UKFA==
X-Gm-Gg: AYBFou1XH9cm0uM90dCN7CgQ97jQPOUX+XvxnI70tdLrQIKxy1cuCeLjGpqftjre1qL
	oH+iA2YgQg6d/KhRaoy2q8Kw31Cd+2ptPpN/4rqQmAiyfATvnYOyz9rIbAWmlosjf60nInAP86Y
	YoVmXBq35PLscFsBPMz4Nm7DepD1X8lKU61wjLBWD5hHKnNEZstPujd3XQ/VctyRNYX8KcmxZtg
	5fkrFF7R5gyrHB88E8KeYmp6aEClLArsPV0XlczCl1A70YqUw1yOFGI04polmsO0h3U7WKv7hkI
	BGbKmw5gkE09kgn4fp6tzf+2Idisi4m4mXYT5SKgoZcmVLPvGwEYxWmEv7vaqWMECusHrJmrcgY
	j5DS7fLQ0CNMD4fCL6ZM/dgsY5K4D5ihTNDuVaw50GYDRyVE0nHXgSqtpWxxCeA+EwkyY4e+Liq
	1Rukhf5P/OxmJaaUOwkOo55Wgyuh1auCzK/0cxVWrkjAwMEj9j3hKZB9Ruszm13iMvbeQO3aLPD
	ZWfeURFLYRpG4WJ9J/+sOKQXR4N1b104b6peXAE/eyiMpzYNnHtkyWmAuPmKcqqki5klo4K2nrb
	3ifTVsvjBTvrbY1OyO/n1Ni1xmELcMFbEY8QCDpke8YI0w+C95xyPtuUenRfwoBGSS6E0FZkUR9
	n4E8DbW72j8kmt3RHvJMLMMQWeuz6NMk=
X-Received: by 2002:a05:651c:a191:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ae5c9c3b3fmr6962841fa.5.1794915931605;
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 11:45:25 +0000
Subject: [PATCH 1/2] media: uvcvideo: Do not setup queues with buffersize 0
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
Message-Id: <20261117-uvc-dji-v1-1-7cb3cf3b4b5a@chromium.org>
References: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
In-Reply-To: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

Vb2 (correctly) does not expect queues to have a buffer size of 0
and throws a nasty warning:
  WARNING: at vb2_core_reqbufs+0x60e/0x630 [videobuf2_common]

If a device has a descriptor with an invalid size, exit early before
bothering the vb2 functions.

Fixes: 6998b6fb4b1c ("[media] uvcvideo: Use videobuf2-vmalloc")
Cc: stable@vger.kernel.org
Reported-by: Jordan Moormann <service@jordan-systems.de>
Closes: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..46b807b95d2c 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -91,6 +91,9 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 		break;
 	}
 
+	if (!size)
+		return -EINVAL;
+
 	/*
 	 * When called with plane sizes, validate them. The driver supports
 	 * single planar formats only, and requires buffers to be large enough

-- 
2.56.1.708.g77570a6a1d-goog

