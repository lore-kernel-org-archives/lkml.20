Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265277;
	b=Z6rNLwDCLF1B7nHMIE7OqGRETI08Dp3jrOQDQZgiJ145td2K0r6ItA5dFNumfjNnyRCo
	 rpECYlDkk0/q/FqPL2gPH4rhPAjKeQoctWQHyOC9DxuwUghmRjzth0G8jzQyypji+0x5R
	 yCjCOkkMCpBCueoVbtf2+elBLgknSUgpoKnpCZ10mLt56zOGe0USztge+HjWl1rfSoAxR
	 RFHPSUW2hTzZuQd1j1Idsa3zhe3mUMmfpHT/88AkELJrqC+sb71fLB8tma+mR8vAc/fEL
	 TWni4fRIM8SQF8TN8/pnyV0mdv5bdDBt2Y35JGbTTrfnI12QWG8rImTNzkhu/YsJsjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
	b=uwcf+ujOMO36PlfBxpfYu9+YsVMu07DzpyXGMEraF4WViXVCTT0ep6T9I4zIntIbDh7c
	 qvZVxWeesL5N23GiqZJ9Eb9nbWIgUNYOdY9Hc66eOe4wiWkYZs8UvfN8LQzZsywHrvCbo
	 X077I25CI5dcjfPPbk1D+FTCsQjdnEKI7aWIB0aKP8wa31rhmYkyC84AN+oNrYpak2a8U
	 SF+C26p3ogD+fyWKBZcJBfyAJwccUtKbYuPkRL3rOOALZ9QBDt+bWPMoAlZacRGlX95JX
	 XL3GOFXFZlYhWeEjt3fmyiVlrzRPTuFZB2aqhIJ3ysXXkbQYB+UjEldTsQ3Z1ZRJcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0UpgrnA;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E8606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806E8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0UpgrnA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso1759670a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265276; x=1794870076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
        b=O0UpgrnAfA/REp7oM/+TGTRLJ1CwloIExRFYdRtBX5fnMUEv2IBW5UcRNV7zsYELrj
         6f/cZlWIH4grZ+/aVO7b0KaJYcFyvXKPbyv+z79I5DTujCmUzFZ15eAV5XAe8UDWxWUr
         o38c6A5Ti4h4dTrbFdBnQIPeJE3IrSxdihdjJlf7X1v/5PSwFW5FUEdJOHeo/v2sSaMA
         Ux57TdpmiZ7aYnN1k+Mgx70A2HDw2SCq6OuRyjZt3FjQ060VOZsktL/+k4hD0/uH2kgH
         Vluag5K5qQODdxOUXz9upz0b/MQq9duypQLIYP68K4zKMZ1mBal75WyW/F+/d6nqrTZL
         Wr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265276; x=1794870076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
        b=qMIkFujICL5VaLBiAeoEJx7LqGh6IXjZA5tVN4jK9VxiK+qeE9IIxSdPD+KZxQ8+8m
         egbwPLc4xWxYdBEWuRs5HMe2jJfZrURYpkhLdH7iakDdho8yaFkFWgWM5P2ik0RWyCML
         l2380GIo9J8ExB1vVy71DWEm0GwFRJhh4N60VAG4AVryTrbKRru1O66oJXXcARMRPeU3
         l9BBoI6/XA4fCanCBXpBscai3yAuCjZ5bYzl8UBOANRfcXoR5ZqbYjT5UFwoIeJv2BuP
         Sh1JC1xaTMtyhlt/iaOWhWw+JYz5wyfmjfypWfC+GNn3AHQks0TDBDe6UNEjJ/ntH4cu
         bygA==
X-Forwarded-Encrypted: i=1; AL+hErEJaJS8fFCAgPk4HblqYFJvfYDeKzSt02qwH8riGSD5UYYPoSyM28QnCC/W/VZPN4vLiM5r0SyVy/E+cm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5g9OpcWSpQGlGl77SpqT8nH75DuKgKwjElNfuBVLBRDOww9ti
	VRIItSPRQdKcOymJ6SjmcFsrukTRr/hS5k5XetI5hMBUIcdiUKsa0jKFE9ZR7VWqz7bEGQ==
X-Gm-Gg: AYBFou2WKwpUiTX5Tgjfp+IoxsSztCBzQfDFRxjlGMgoaxdixbWB9zerJHhY+IyvXHl
	JFAucBaVjFPmlrABTkBena4QpbCWwPPsbMQomxr/LoVOo+4EO9Q1w/nK8m3yLVdX2E4TMHqUn9U
	78E4bZQiX7s4DZWc1F9oF9NnQADUx6WrL2iKkl45SK9LJG+RbuW4hc/9k4kP7PpdOXYjhbAA4tL
	JP2fqKMVwHyvSPYClk8Cb8caSOTWBBSt0mR/LwP8qzZypNE5tqmhJ9s1qREsydUIehnXQegVrVR
	MhMQEYm/LxnzSjDAPS1/6lWT8a9eqkdNl9X9mKuB2GxJf+nYALh/9aOyrrX2k02zxvtLPt3L+OG
	LXdplTU9GZavYz7zFBkovEOI4Fc2varEDqolFhx0fq+ZzT9279g7PTsmX424JuAgGARuh/niF9L
	hxF8q7GNTK2pQcU1Otzhn+VT122udx3XZAcYg7rltVJHOOLfELg/TwnAEzpZx4s/QUoqXMeBAJz
	RfffGPUJQIq68zioq6nwpYdTbvNDnvSEsbd2kcSHo51zUzBF1KamkkdrQG5zs/lZd3mgD9fJlzy
	Ict4FaiHM+/LqGMUd+faNJTNvzVxJIrxwtX5WYioQUVfjboWSd8y2okkkpVCV+N+0bdo6+sMk9b
	hgtaj10KtufySmA==
X-Received: by 2002:a05:6402:c4ca:10b0:6b7:1c:ead7 with SMTP id 4fb4d7f45d1cf-6b7569d88d0mr547971a12.20.1794265275825;
        Mon, 09 Nov 2026 15:01:15 -0800 (PST)
Received: from fedora.tailb87685.ts.net (ip-194.15.124.140.laito.net.pl. [194.15.124.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578beb01sm265789a12.6.2026.11.09.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:01:15 -0800 (PST)
From: Platon Miller <platon.ksenzenkokk@gmail.com>
To: gregkh@linuxfoundation.org,
	rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Platon Miller <platon.ksenzenkokk@gmail.com>
Subject: [PATCH] staging: greybus: light: Use sysfs_emit() instead of sprintf()
Date: Tue, 10 Nov 2026 00:00:59 +0100
Message-ID: <20261109230059.24572-1-platon.ksenzenkokk@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() in sysfs show attributes
(fade_##__dir##_show and color_show). sysfs_emit() is specifically
designed for sysfs attributes, is PAGE_SIZE-aware, and avoids potential
buffer overflows.

Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0

