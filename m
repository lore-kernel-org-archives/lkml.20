Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558971;
	b=ej7M7sehu7htEymLiXHoJ3oSFgI1JSqnNZd/AqjDvl2kxT+RKAtEXCm4WpeH/Ez/1g/5
	 zawWw6GJdDY0fXYocjUA04qFxXUlmaIUWf1+HAAREZI/wKVS5f8ZNaGsbsA2nV1GbUHOi
	 uCzTi0HiGdVGUmYKvgl6fBHA1oewg1F0Mnk08IMqqp35jPmtt+7/Sph7K4QZee1inAcB0
	 k7mRtD+XHiW2FyaglBaaHivqrfPXJ61ObHsGPQOm29V6rxI+UkdwI7WLgQc/RBHTUokd7
	 JTWFhbFq/mq8awKDpIFw0qNmWSQFM2xTPe2e5TizgP1h3NVyNp48PLGX8eOFI9Ftj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
	b=D6TgKGYGsjbmabIIfWTuM/pEFh7fQihEDM7894MIZGTS70gaEe9/aZWL8/z+D2m5WOns
	 pn4EAIVt74PJBBf+2YqF6pxNdZyol4WL+w3vjGyKoOTsq1/4pkuaeHOMe1pxywDlB2je0
	 WGejSsta0s/fp2xRA79htTAzc6cNtIvBAF4tDBnnCuf/SGRgHDShFQtPe6RmuN7gWRrFD
	 TjSN43X5jCjyORcRb7qOeT48XX8o90fNvuHTEZfXAIvdnt866QCxd9LVbRqgso/h78SQY
	 SIhUrmPR9zOBtt4eOgurSxGKv+v8e/L1yBFHLSnPzalZTKLBqGsx5bDXM8SiznT1Pgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T1Lt0/8s";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF0606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFF0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1Lt0/8s
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1704106f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793558969; x=1794163769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
        b=T1Lt0/8sM6vsdHVtQUrrSjN+N+RGfd7oTw/E7Iem+qy3KEkUIPeeqSSNSFbKnZ2xWA
         gP/NJs9vEK0U1VSFD1vACyL62pGU+rvu7Tgzc08NI2GYp5APsDw7XQIu/XC8yOW0I7cf
         zqR2oxVp3FXmzSpPedq7wro6heKXVbnxubEjVnVnauasf9M4RLRAY87NZR5sVnm1Hupm
         oCMvcBmGfXi2tA2qJhRtG7YAYZKsvq4j5k2MBzw8NZZozEHTxDyyLypNZs8DdcL2mzCr
         3yTzJQ8JCh22d5NUpgB4CVuknomiJM0oB5kOZkCQLUElyv26pTWmIMbFUUkUwa/l9hPo
         BdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793558969; x=1794163769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
        b=WQvagFVnH2Axfc3kwlm3yqVQVt1PNNksrj9eiBScMwnFsLiuq+zYtn5iB4KOKqHi49
         Uc4FLf8dCHIiUklKgC1F9OqKfjn5OlIBZk3K1V1aVsuD0eZugFfmEtHnjg4t4UoKYssL
         UWG8rAUD7agKGfF7orIUTIe/XVuP3DgbweFvHW3XD76AN4rsaKcHwr4Zdj88w03mXqyZ
         qzzgJItTBvSLjc/AyQbLdhN+TFGwl7jxNPWCm4afT/asotOiFrjz9YEFi9HLl5t6dAGt
         TWHMyj8nq0+AXQU4agbyh/AAGn6EPXJcMOqeEkotXVnXGF7tBt3hV4Ji8bWhATjM8O3r
         oFNg==
X-Forwarded-Encrypted: i=1; AKwUvBwos7SowGWGm9SHduUbN27T1g/w7CQpm9oW4Zs2MT6xKAS4Tw9XJu0WbN9yCqFyWQo5ef/xQauxJsnypzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zNZCeVVfHiSTpopXl8MmXklnvBDXEnL+U0nEJ0F8z0HS7QMTx
	uV39P1rW39PMtKD3zkU16RrNOJhI0SpYxeJ4DDNUjAzehGwDV1sBt+k=
X-Gm-Gg: AYBFou0MX+9/xCQ0IKg2Xos/emq48/8aUlS6oZJ42wl3GHnz13H9S0KTWD21Js6D8hb
	Po1cs5URPE7tfPJTZ8sqoCpOy3RYeTHaNUafNTEQpFY+Mhu6p+GZyCAIoTtzagPxwNWYX7Fm3/8
	eKSSAr9IguMrEPxuWJ5emqOW+1uA2M0UpsBfHGB40M3qfXU4kG/gUGnYCv9qA/DDznKqqHWzvu9
	ceEI07kFBSaOHVI0JToQ0B92m6mGUQK+RvKlkO43VgKkIPEKHkX/2pyJL8+TSw2w8G8fE7ccJ3U
	C9kXA3+/uLM2dj6rV2Y7+ku02w8F70iyK04k6PrzDIxC6g6nicyqvhrt39Jeqwe8wGAyZgSCRFN
	g69ggjRQiYzKrwP9vOcZzI7PQe5iR79+6OtFckc/oEF/uNUip7rjZ+TPdRrSS4Soej4obQFZ7y/
	zB1EQPVdYE1GBj+1xGxuBJzc9Ir4seaEwOi3XOc8PhFYpJ4z6d6/nVfHahCdWq73dEcF6GFsuF5
	WVez2VXUN/J4Q7lDvHCaR69wmp4Ht8rVsZfLWV7psF+05XTUFZWpEy+zswHZZS2UMxMBonM8/qV
	6jJ0bRfans3RzD/ci2nSEwkZ19m3UAghUT/FCW6ZM52W5Eiz7v+eALj/kcOOwzBgGaSYiIxaO+X
	472a0a0HRN7TfHgQzjkLjG9+kzk1Gh7ipWEvb4w==
X-Received: by 2002:a05:6000:4012:b0:48e:678d:396e with SMTP id ffacd0b85a97d-48e678d39eemr26985417f8f.9.1793558968758;
        Sun, 01 Nov 2026 10:49:28 -0800 (PST)
Received: from localhost.localdomain ([81.199.56.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm15530548f8f.11.2026.11.01.10.49.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 10:49:28 -0800 (PST)
From: amit <amittibi123@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amit <amittibi123@gmail.com>
Subject: [PATCH] staging: fbtft: remove unused ssbuf member
Date: Sun,  1 Nov 2026 20:49:15 +0200
Message-ID: <20261101184915.33899-1-amittibi123@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The ssbuf member is documented as unused and has no
users in the FBTFT driver. Remove the unused member
and its kerneldoc entry.

Assisted-by: LLM
Signed-off-by: amit <amittibi123@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df..3b58bb9d7 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -155,7 +155,6 @@ struct fbtft_platform_data {
  * @pdev: Set if it is a platform device
  * @info: Pointer to framebuffer fb_info structure
  * @pdata: Pointer to platform data
- * @ssbuf: Not used
  * @pseudo_palette: Used by fb_set_colreg()
  * @txbuf.buf: Transmit buffer
  * @txbuf.len: Transmit buffer length
@@ -192,7 +191,6 @@ struct fbtft_par {
 	struct platform_device *pdev;
 	struct fb_info *info;
 	struct fbtft_platform_data *pdata;
-	u16 *ssbuf;
 	u32 pseudo_palette[16];
 	struct {
 		void *buf;
-- 
2.54.0

