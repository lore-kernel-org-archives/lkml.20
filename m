Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393467;
	b=QZkA7ru010TlRo/7VCexiuH+JbJtT76xerXqgZoUGStTKmVNgUAk7j7RCVeWXsC1mTud
	 dAxZZqYHVPJF83mgIlPUfhpv+u7jzBLz8eQb9mR+2GtO+bQYUiEaR4btUVkKSsG5RbLHQ
	 S5XVEJTSH4mzHi6lMcSgydFGI1ZXSjqd58RLV4MTCYBc0vqVwT62+O6HslBKnkSW2CI23
	 uK1G/Tp/HILGlhBtFoj58lZPnUXd3qdfvZbP2YechgjIy+CvTm1twfhp2mUEJ6eYEM/t1
	 JzUw+d0UwhooGDpHtjUpyrobM9CR1kAZMMO0pcjBwEL4eJBf66SnMZkAOPfFLspzQRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
	b=gz/6a5e+CSSTrqdramDJLB6vfJhVJ5v3wMbqfN8MQS8/KsFg74bGqB+a+rIBU9zfONru
	 DwfVEqNZF3wNjSUdgRIqQqIqraKzmQpKe5zJ2uYgXxrsB1KH8TU5UT4pGoI4Cw7F6zU28
	 o1BEU3983B20KBhROibZoTUHklPdqEGbYcBXh2yDVFVl97ts+dZr2F2Aj+I7VqbYtYlrw
	 zztTQz+s2K2GNPxCOGXHoFCBKBu/GuHzyI6qfXVIxrrXcNSlc4KmVh+Tjb1ylDr2P+zFW
	 t3LxuwcZweUxhLFI6J87qXO27Ac4lOk4sTohj1HCAr+2nKcLm3a4bQfBtdnldcp5GeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSly81NO;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A760606A8AA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A760606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSly81NO
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so5129032c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393466; x=1794998266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
        b=kSly81NOvkhOF6h0IUmSNriQskA6oEcGAjoNE8bqtogijFzDsyCzVPJTAOi6M+4j8y
         qFBg5MELsECzCfQzr965hhvxj1AzlX6Y2dZt2YzO+cQ0KhL78bRIFyAIfF6VCl5izkVQ
         /01F2qZkeRNNa6TydW8kNim7Ooo3GKXOCBqLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393466; x=1794998266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
        b=BzvBsrOdGgvyhxrPWkc78N56DhB5eMYMBQTuroy038q51necysShUHWgJQQqOIM3cB
         oFDxXYCxDohBnvA3ymvT/8+O92yS9Q2ZytYlWWmyC+DCuHO5NZDzf7KLJJMJKsOboXBP
         15Q0K5ft4djQXKgiVV0bYn301vcEshCYI2Ee6NX+p1vyFqXZQ7KnPic/YxhHI+4oOBl1
         Ul07zgvunBv5P2L5Bhx7fb4hqc0lrRLu1oI8C9tpxCarVuORNc0D3pNJql9lRelvCO9/
         nh5R+qxmEoslw0LBL5liV8SUxks9qv38YueDtxoAT8qAAhwORVXMIDmNtEZ0+T/sTT9V
         Pc7w==
X-Forwarded-Encrypted: i=1; AL+hErE3sxCepXsamKd67oFL3IFk/O2Uy9tqdA5MVbtbV98lv5L5+6pCUMfIaegAneXIEAZUHsZjw+nVZx3hZAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cSV0dhUWrwhYnXsqW5xZQpk/ZOhLD4RZjH38+7XMn1eSctrML
	6McNuc4W+UBLfiQ3TCBfNuwY1DPzdR7STkp53HGZ2kESXyfYXpeIg2ruZaTDfFnBBQ==
X-Gm-Gg: AYBFou2Fs1AxhvNLDFuvG2854q4yn0iVkrU53HkAa5j+q9x292X1pSBPXcKvvJ3s0iG
	9Y1ImXTCR4R0pQ49A/hiu7DBtCrzM3Owa0NVkxiqstaNMJFi9Q6Nxtuma6JlffUzmepV71XwhIn
	1Mvnf5n/PW+OJU8zU4SgeYPhXZ+OgGyjW84YNoEbtijArwKbOpuimZ5mxAo62A5rt+SrlGrdET5
	OO0N2Llb3F9NvMj1e4boFFrwNQAvP4kiN7G+lv9FCUOkf6dwM+rPp/tuxP5CjjOSbyTIJzi8Fbv
	nU+na4CJB4Rb+KHMZ/Y22Clun9bkpdt8D6T4onGG8mYBFFhdsj1BjG2X5WJQ6QK8YyNIdBadAEZ
	9EdRBogDfCuSMYUXz1Ky5PWT9x9u69ueaP5xJXOnlangrLBi4rqW8PRblCYEf/Si5tkLJ3bBO+L
	3J1KmRCBa3Bequg7E5Tx0/PUUIDVxaDeplkxqSuAuzj/mKv0JCLq5eFp2m7sToP7OH0u5B4R7RI
	1wdsKPKtQ+7W1akZ1zgLXM/rbglzZvGY5UjRwugYLhzOX0araThVOYMZtIadGjCYzDwaYdHX1l9
	O6ZyOHXkK2jrkDldIb6hWwwWPQMV6VChGlrwAHqskFhA5OC7pGUvfqNfb0hE42wL8lqhKuqbLk9
	XfQnyPNgnK1/G6t3R/Q==
X-Received: by 2002:a05:7022:b888:b0:144:c123:4036 with SMTP id a92af1059eb24-1b3c034eb4dmr1715739c88.35.1794393465573;
        Wed, 11 Nov 2026 02:37:45 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:45 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support
Date: Wed, 11 Nov 2026 18:36:13 +0800
Message-ID: <20261111103710.1393311-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111103710.1393311-1-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
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

Add support for the Genesys Logic GL3525 USB 3.2 (05e3:0629) and USB 2.0
(05e3:0630) hub controller, which shares the same reset duration and one
VDD supply as GL3523.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 0606d405c16f..3bf03e1d1287 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -666,6 +666,8 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0629) }, /* Genesys Logic GL3525 USB 3.2 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0630) }, /* Genesys Logic GL3525 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a149..b1844a068ddd 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -155,6 +155,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,629", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,630", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
-- 
2.56.0.542.g3ef89b7020-goog

