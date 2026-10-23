Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750349;
	b=nh7W38/MULXbpHOoyJ7wsYMrDaD9+OUz2zV9jKwT4PpzZedVL58MYW9ziLAbyBk99MnG
	 85yJ3OKxareWXBysif2t5kR7t7AqY/BJSeEvExaM6UJp43/CPZ9ZIuxjk0pRLjGElwW8X
	 myhveYFbhG86QPeyMGwUrMUwiUuX39UTjvzNpEfnJTYy70IZXfWTe+NrJgVppNAMsvaFc
	 3IqEhdWZVvfJca3jsOoXZtMv23UxXNaKRXMx6y1Kmi9gOjr3x4ucV5zxGZTU3znwG1/UM
	 9lVfIKhMpbYVe4QNu/qTHD+p0L0cA3T2ESD2+jqYUPLJFAIvoPM0bHlBKyogStIeGtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
	b=cloQoX/X/FVwsLcRY/yx22raWrYX1JiiKgKF8zGK1dSqINdydLS/AmJ0y55RjH5bwyr3
	 QzdVI8RfVLa6uyKCB5pKDHj/CRTbGQwSxk65tNwfqYpKG0GXIVBSRk0kIr059hfOGc6l6
	 kBJTICfWOCrXx+bs3eqbRqNcnqje20O9e4Gx1x9/R4YJYWYPLeaYZksn/RUqQ6RnS3+y/
	 3TqrgYElydKC5m6TfEV3pjIQa/AetWPlekkN0c0sU/MDHccdlEE/sS7FM2G9N8CQQGr/z
	 jVF+x8ZRjoKDBzxppIr4xUQVMJ8atqcPJgD+Czn25YII6cxFE4qwpFpP8HdFmZuBvaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ADF60A261C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48ADF60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso7721655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750336; x=1793355136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=TXZQvtD7jcqOHabVOR/WQ+U/XG+v8vjWM/Qmsl/q6MzNZD7uqig8eGptjZOesICJ+P
         ScR9lJVpLDAQrN6bNGDoIzP2zfnTu0iNIW4E5ihRHRNcomwDgzhBfltCJErnLQgizFnP
         S00llh1bjJPqLGcEzS6ZFocGV5WDpL85Le2xfNFTfrCNSstwYtpe0mbeJ7qhc2DHuvOL
         Bcjx2MtcWUMSzpiVgxQRtlhn14/FrOMDJtRIiMOO9EZURIdpIZTJR+t7d2Y9KJAc7J6f
         3cj1tMnVc+viMiKK80xqhvsvmQcodKjtbWVwwE2w7iHG+6KbtBrtw84P6UpgGVAD0/Er
         MGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750336; x=1793355136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=etI6vYQu/cH7kG02hKvnhpCN/ipa48ZGt0OjqfyL31oY18gYweHpJym/nCeyBXo6Aj
         e0zeRlhLy5DqgZzujczgAqfN8tmzUEUlpbldox/ALNFlCg59/X8RzD6F8ooXnBJzn6fz
         Dc66lkvvNqw4tU3kWVIstbHOrAcHV5Zu99VCu7VDl3zHO0b4rd0eJ/di6iuh9050fdlJ
         jmbVjaCjrKvaseu0MfWWkElhjW9rtKQbWRjRJIbSSQtB6VfLHZdt5T452a1f6WaHuRY6
         To8wDBZ7QxS+m8mDx8UG9okTZZ5M09Z73yLE20s3FLgtpiyMK1c2ObohQ1rtuYrwLzHo
         EXWg==
X-Forwarded-Encrypted: i=1; AKwUvBz4vhTkHV8tZqQe0KzCoOJwYuYGscBPTAAiHLArOMwueamptFtv+17ieZiX6LpBJ5O6OyyljmaZWxxx8Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCmVXyFl9ptfH4hTr7aBZfUI31mH44T9DjNY+M9kKyABygr40
	yregZiwFwAjWxedM9khrfYkMkZyzoqkOl4Y8BgRHP+tWTaysatAOpr7+c2f0ZwkcpUA=
X-Gm-Gg: AYBFou1LIn/MsEO6ikkXnwKgYNiMp+j+u+VhsUQ9XacBUE5m1DTAFPY+V4iGjHvMxcs
	WTiNzBdh+fRL1BAkaxFk1H012m0Am1lWrIHFbYyptDl9dCCkd7Ku2RJOxdWNc1MSq0FuRIzj7U9
	2jXU9bg90WrwL2RvozrTJcw8XI/ZAICRPj54lk3HeaxjXUNBHC/yOKmT0xXS9vtOKbT4ZLIe+ns
	az8n2kyzJVwP5DL9czE28a/dTARIO1S7GJQbrdACir5sTgYfjZ/ritjedTyn9NHTnIFkedABENX
	xKM5aUMrGDsQLFRR69rR17YJKwzXPRu0CTr+8t7yJ8wKTBTw2F6aA7ZujEc7VIduZbRnEj6YHaV
	0l+qkz+BqWPbkX9O12TMUJqXjNSw/i/4WSxqeMrQ4ZGq5Y9UGmks3zd2m01hsozxFhB4eRy8dh4
	POSjfQbTrO3F0jZnsxXH6OPCjVTBnze6GTYRc7lNKz+VvffgEFGC8ffGocuehCB1b9U4toYi6CO
	YPyjBA7jM4qQ9vqRT/nFitFjcqwrDesKjbiZMJNJxJXxiBmkrNC9kldK3DJG0Rj5WrZp5ACEXhO
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr26707515e9.26.1792750335754;
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm57982975e9.5.2026.10.23.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 4/4] arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
Date: Fri, 23 Oct 2026 12:15:57 +0200
Message-ID: <f00b7ccef721c7120ac10a9507ab211773787aeb.1792748691.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

Add the hwmon fan node for the Raspberry Pi 5 to expose the cooling fan
speed (RPM) to userspace.

The fan tachometer is managed internally by the RP1 PWM controller.
This node uses the 'raspberrypi,pwm-tachometer' property to link the
rp1-fan hwmon driver to the existing RP1 PWM controller, enabling
RPM reporting via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 748be8f1ee9e2..9bc6d0e9da1b5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,11 @@ / {
 	aliases {
 		ethernet0 = &rp1_eth;
 	};
+
+	fan-tach {
+		compatible = "raspberrypi,rp1-fan";
+		raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+	};
 };
 
 &pcie2 {
-- 
2.35.3

