Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946627;
	b=LRw8GY81FXfOkDAlympboCmLYeYo/woOFv5Gu/fJG3OIgnUCMmYIblmZApxfL/e1Fb4M
	 YMdUONA2Jsh5rwFJoUJ4OkvFS8IUNrlKNQI8ASjinFMPwUrNe6SpjQY+ocm5MEq0yz1dZ
	 9jrwFqSJs1m3tTd3ixfpANGQpJB6Khn3GewVjMikp6cp6b8BixkHobaUIbE4nkyqas7hX
	 Am2N38WK4kRDbbqQ/JJgA9oa0BO0u99MiqY0gG80U9rXWU3V90sRNogvHbJ0HTBoLPOUJ
	 0uJTZvQ/dlmDo958ry/c7rrZyUWmhBPSijrsd1vGA65Wb3dwy8qYbPMrl4FN0ogyXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
	b=UbJO3y+ClIVy/Ygsn+eMHWD4hCVIaiwIZbTiQ1bdAOSd+y9nRcIIz1eseE2s46JmgQ5a
	 81rxRQjySd9xWodoTaKOUG6lG+mGIYPjgn6OPHT7Q4mehUB2Q4MuHWlFXqJpDZOTd0p3v
	 7syzgGTm4pYKJXrtK5JInvSaG17rbXqwFmXyRmuqbkcNT/iHFhfzEaR6leDZMphJHw4zF
	 8N64xGMl/t29B2DXgywTZvHpcipctxSWPjJajsVoaOBGB62//r7C04WtwxJvAJsmH1cp7
	 QOCvViFVUs+v/gjzd2o3Jn55scnbp4vLz5AnDaIPVE7pJcK1x8e4/VDzmwvWAU6hafw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bqkp6u7P;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D05606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D05606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bqkp6u7P
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae18eb9b69so434690c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946626; x=1794551426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
        b=Bqkp6u7PI85NUfsr8W9f4vScWFjm7+0YK7UDJ92/hO50CbV2aZTeRHLU3nxYJ0RuuS
         UEeukLwuOVVuDNXf6kb2ehgBh4OHHVxYRtyDDbV7BF57KaoytxPKjSVBDjVy+tFFhgft
         17Wp+jUqSNCLXYF3TU8/we/af2Dlll92wX2SKzo4GmvJ70xRGwo8rNCLNiXBM3kQ8VDK
         9XAZ1yLKdkbl1kgsggkoP1jUc952bi+YhvpdP87VlzTFRMKMavq977OEBBC0Hq+1d/FU
         2IHPK0NJD9HOV53w4HAZjKAvWW8CgJEoZnLxhuoe9YOqFJzYT4trlYcUioqGiptUMVoz
         02tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946626; x=1794551426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxwIyFKqtHC6susYGkQKKb2s602tPT5ccEUpS1x1IY8=;
        b=2fHe9M5eIWAuaBrMSlGPhT2a8wc4r8Qt2TupxDi2wNuAIEwAKQhfVhvKnEAC6xpKgH
         E8jZXm5+PJO0qb3Mg4kNAkpugsvNKHGtaBrSUNBHLDXzsWEoVXiJLyOIvbOrnFLdKPBn
         O5jvMavs10JCFwMGQ7nyl9jr7tR+9gFbMIr4dDnkjZYQ/1RIkXkp/VLgN9EC2f0W8iMZ
         8IK1OpLZ5u5bUh0Az91ivrYgtLUCbus7Jk11LFZkhW2vZr3KnL30rLgXojpqvMJvTZBJ
         gVuK0IAKHw3eUNhITOSSMXpr8SNOz7nfgBBoS3Ny+k2OFhbusnwU/rkTnKoY+1yvfxrJ
         v/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3nTLdZADmNFJ18UBXMqOr/lX8SXZIZxvYpG7xYuplER/pxWEP2XObSrHl+Ip0rffE5YmPkkfFdIuvHXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ql2QgFE2lss0VfttdCdKD26+BecZYfKibXqOh3voWZ/WtFar7
	KnL291NkHSxFGJ4mp/kebZoQ9zMvm6EDLjGhNFb6KKyNQop+n9CdxMQ2
X-Gm-Gg: AYBFou3oyKn0lxYDPchkbL07COx+92uhXv+u4BLufaYlmdny48XUR4n1YD/6fZqKxHK
	Hyi0vpgdrJqEKYsOX4O+uD9EnYnWgGs5tTKjDmkJHaIsDMg+8wIdYDUkPnEijAzPpFFWTm/ZlpL
	A0Nkf/AlRwY3V40q5DqiFunXM6X26aFF4nSiAfuN64iicQI866nwyJIGS8BaH9qmecYiYuQytCs
	hAlXhAMdktOP6AEXNybOSqE0/e4KozAgKLwC0xw9DMEeBSnow2t8nbBcCgaPBV7DZWaul8D0d1D
	+rkdkeQfhUbMbL+31NWYWme85aOmP/eKOrgbYgrRyWB7ygHzR8bWuN8PCNMdkOMu5WT1lxlhni+
	F/pf05BO5J30i1bYrm+lOFoxs18mY+nc7Z+loxrEdPSVoBkweoSeSg+603f8p0wO2vcgm+boVxK
	dcgfSLXLu+z4gi91fLOKb2qtNc64HGvTNTLjE9iaP7xCBNfqz6jbSycWiCCg14qA5Gz5obv/nab
	gY/ZJHfCk8rdyCrwnK40NKwhgVAD7HTF9KJzdTdyzcO5cllzJNlM2k+/pgQE81MsvZ/IxD2NpHe
	XgiNLAATneCUdrJqQA7QbbjTK7M1vn5tFbG141gwZbCXpYwiolH0Yvf1uc73ZHYGOGpaRNxGJVB
	w6cjQ0f+r/RWxAyYs
X-Received: by 2002:a05:701b:280c:b0:143:2719:f800 with SMTP id a92af1059eb24-1b25d3560ecmr1624296c88.40.1793946625885;
        Thu, 05 Nov 2026 22:30:25 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:17 -0800
Subject: [PATCH v3 3/8] gpiolib: of: return -ENOENT from of_gpio_count()
 stub
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
Message-Id: <20261105-b4-gpiolib-free-v3-3-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

gpiod_count() and its firmware backends are expected to return either a
positive number of GPIOs or a negative error code (-ENOENT) when no
GPIOs are assigned. However, the !CONFIG_OF_GPIO stub for
of_gpio_count() returns 0 instead of -ENOENT. This causes gpiod_count()
to skip the platform_gpio_count() fallback (which triggers when
count < 0) and erroneously return 0 to callers.

Change the stub to return -ENOENT to match the real of_gpio_count()
implementation and the other error-returning stubs in gpiolib-of.h.

Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 218cfe5bc4ac..9ca540d93f93 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -46,7 +46,7 @@ static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
-	return 0;
+	return -ENOENT;
 }
 static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
 					 struct fwnode_reference_args *gpiospec,

-- 
2.56.0.506.g506a7eabc5-goog

