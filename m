Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B64E8DF7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186783; cv=none; b=tPVLYv9hHDfrgPZ6wErIotJ8f4cgOdXi3i0imoDWstwL4qkyMr7ujbDsLMv3t4sXknzPjZhFZFCOXUaKC9wz2KWq2xWTGlGkPUnC8HKUXBK8Fd4U7i+H/Rmo5jedQ+BDXokIypK2ic1W4+SzQJQOUOwDyoKhkZ0aimV6pmQRJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186783; c=relaxed/simple;
	bh=JMCAe2D62F+WBYgEqiYoMmr4gCc1PIsBFv3J9qtq950=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsG9eusrrjbFHPESmI7sqFEoDCN1LNfVjT6N/xyyjRj+NGLvbJzp6EIBoaX+VfHhp5SFfRmxbRcIxq28+Lg9Noi6XsNEVVNm8C7E3laxO6lZ4ttXx6MLU+ZNjYfYqQmVlAVrqxPssTCSu/Di78W7baIWBzcCCQbSBFdkH/NDuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVGTa49Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVGTa49Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so41658525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186780; x=1788791580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jL+a4C7D0aKEgmVaWlVk7rTqIUCFUo6pEcsZDOtEZU=;
        b=SVGTa49ZuSxEQjYrS0LRKHEiwXcy2gTQagSeV15i65Ujt1HIlTMauVRF8WJHbdJkuj
         VpseAtMHo1tXLacBd+A0QjpMjufN4LzN2xEdYw2qPhuDYxyHeoTttyHckfVxpm0MK1OL
         rDv+DArEVxykHqBwIyli7BL52jJqma6JgVu/eWCLxpFcrtTgOXuyepV/EWi5Y/C6aL7Z
         2KpL50jSPgGqEEFk6FH0SxpBAr+XWfQdugeFgOWCtKdsnryj7CupdhuGgnLElZZkOfRW
         u9eFda2YqFCoQrLPGzCL7+sNiZFWdtqL81GFonZC7ho2fVh0IJ9CHUouaRMnuR8BQSh2
         MBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186780; x=1788791580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jL+a4C7D0aKEgmVaWlVk7rTqIUCFUo6pEcsZDOtEZU=;
        b=gueeSS2PZVj19DXFDzGQ3j91TrvYc/K0t5+Zr5hVdgnr7alxPk4SWDdE2Bop7eCgya
         2+x9Z5GNiQHaeHkWmC4LHF+4pyHAGErJacnnOmqnIKd0KeiSweBh89emspqSUWzvlAO7
         lhoSZLcoHYG1EWWGBrd3hqualRzLpalsYFvf3Ssh6WYVaLgeRwJhP95N8GsYg4UL1Wyj
         ttcN4qTKzj2+g+LuzVP5jjHbp2XE9AdEkjUlhQ0EGK56N/wqkuePK84ZA0zuvUKnljBh
         TluWmoWRd1/eKaeXD3oq42EvfmELbZFWDljeEz29W0xHuhNkpkS3bWTGKnzUpW06CF2z
         lZwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0XX87gegJxJ3a1ehDzvMQpJuNRNXUPQuyvWZEskiWtxyDGmmwifzfc+Es64Yo27IqAvHwKUStJloBqL4=@vger.kernel.org
X-Gm-Message-State: AFuF++kD+aeV9ceiZVHDmoBmKUhlNtA0pmXs2TXbNWXxj7N1e4DvEhxV
	FRhXUgU1Z+1KLW/5Rl4+bxlJMFqxINPRLx+dZ1Gh4hbfn6pj3kSu3AeZ
X-Gm-Gg: AR+sD11qFXBkRvzbDoO9BAVc1klOnZtM8Ekpl16R5C76ViV6V4Is/EiFT1/d7Vd9mh5
	5vLXXrwxH9UN+yWncqdCFy+F78FRbGe2A+seGaxlMVGV8ISybvcPj3owBPHgGYxHAiRURi9sT4Z
	2SPrOVG3xNoVQCgBflsHy4zdLgJcjy+AYngYLpA6y0fH93vEi/rd61z9ZTGEavS4kx37AV2DUzy
	VSh6iO0otNvcaK8Irgeih1oqgq0XpGkYllBY4GToRFVz+yUd9+lWmi9MSoKEZChu4/onUHkBXmG
	Ud46zgFKnQvrzAZnqf0d9sZaACnR+OxMm9667np1y7/miFXxwT06fWh0YWJyPPy5fpgzcSkWVfC
	R/AzPkQo81g+TWtovHKvrRPN/NwKqpHKJy7L7VV3J0BwqIYwgzUd5XayOo4hGlBCgtcGPWhl3n1
	MySTND/HMHP6Tf7xGqNhgOraneVHPC7IVVng3QjqLC87hE29l/DYItECizYE2VwInW9k8sZBh0u
	HmypGwa2NxosV9sNg1SYmA4
X-Received: by 2002:a05:600c:8107:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cd26ad005mr206906115e9.15.1788186780413;
        Mon, 31 Aug 2026 07:33:00 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:59 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 7/7] gpio: cdev: return EOPNOTSUPP when HTE is unavailable
Date: Mon, 31 Aug 2026 11:31:25 -0300
Message-ID: <20260831143125.151360-8-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GPIO v2 documentation promises -EOPNOTSUPP when
GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE is requested without HTE hardware;
map -ENODEV from hte_ts_get() in the HTE-only edge setup path.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9f3b628d5793..6dc01f7ea838 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -715,6 +715,8 @@ static int hte_edge_setup(struct line *line, u64 eflags)
 			   line->desc);
 
 	ret = hte_ts_get(NULL, hdesc, 0);
+	if (ret == -ENODEV)
+		return -EOPNOTSUPP;
 	if (ret)
 		return ret;
 
-- 
2.43.0

