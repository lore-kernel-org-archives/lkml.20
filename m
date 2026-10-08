Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A550246788
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438374; cv=none; b=PCG3AmcA+q+vOQgyH5G+wCRQmf/TlstYX0AU65I1IWIY9i24u8Ik6V5amh63oJSLD+S3qqGLZHWs/Tsx3jyoVhYNcNsWOpujy1JVnnKq7x7nwP7ln/0yzx0tm1A7i20Taib6hec4u1yilBLjZoVlVot7mI1pinHaTKwE3oiOTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438374; c=relaxed/simple;
	bh=FGrRbKRt0eoQO99iU3Dc5Z5iqzdFbEcsKVVA8IuQ5+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmNrrjdPTtlY9BXhkVGoHNBK+9TNCv5ZyoNN3lJUm6Q7uUTSDOEFdlYHoUCVghi4Ed+Lx9xluyB8vEPZmIHOQrc0NuwPvo5w+7YXL7jE2gq6BZyjDPXt1ctHSP9fxKS3MkLI6I7I8p8by8ogAf+XKBEZlPd0eDsen2GZsrCenGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqyGuhiS; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqyGuhiS"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so326348eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791438372; x=1792043172; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMfPzgt3xAK5X+A2OuqXJNVUyenGzQ87xP08w+wp1aE=;
        b=CqyGuhiS+WZyaXufWnG6UIjgiKavyepD3X8RdrQjyTwfdlpnjij8bouJv6QDpKBw+b
         EvqECGk6KwTgZXbcin/3zptvEYZS0uoHpXa1kE0sDhoQytivie+zpKgz9c/g6BDsfrA4
         CnfmSH9afECWz0LEDO+9nqf5EZ9qkpzR/72l/l0ikzgJIemnWr0l7LRV6+h+Cbuf9kJw
         RT5m/jhK9KW3f8ZrQrgEMfB/m8PbjEaFPH0/6poFEPjUsYH0hJfDaT70x9PvJA/LGJl0
         fJgyYgeuVvuDWvKdRMSyuv8tzW969hAv2tYIBbmzIe4AdJ6d+GaxFHNipF4Gdat8pJM9
         6g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438372; x=1792043172;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMfPzgt3xAK5X+A2OuqXJNVUyenGzQ87xP08w+wp1aE=;
        b=p5tis4juiOm0sZY+AmhYmm1bV/FsJY0fUNozba3p2oCtJqI2palECaYIdHELd7SjDI
         /jAya5px/YpH14hgMcMLHBgMTnItyPgbrX9W5pH8Ma2ZM7RGMiWJ8ywf8XqqwZm3xjoc
         XCSGSmwGD5afC6KdPfe/W80Hal++hoJSBv5szCUB+INwXJ0AYC2LqhetL7E6Q05ptsVN
         LodkeFnOfbl06X6IV4ddni07JKFZm0gGvZ6fLDY8peVppmfH3U5QgU/WZ8H91NtZmMek
         hVRwFCLkT6Bun5LCaMniROG06FHY5rZm53NTgHbnoIZJjmYKACtD3Vp8GuVkUvtKi67g
         JTFA==
X-Gm-Message-State: AFuF++mA2uBbUqds04O8QqyZBlFWrRN5tmbJxTdqoCI1GpFxx25PiGpC
	GW9/cfYXxXA9o81xWIuB7JWmS63b7kKjaKK6JxT1Cz5yebgnqaajV9qk
X-Gm-Gg: AYBFou20gXxP6fT9M2Vxc5jox8P7AiF4SQ/laEF9OZZfRyUqo94t+acBugKtZsxzqs1
	YulEKe1ArTlQbLJSZPyoftz0f7Zgd2ycCXGvsGF7/pRkRb0YksYbhmVr23t6yW4bFQI5EX3qOLM
	xh+DL0j9aJiI3/Dk3ZGy6gQMg84TMgoFsazxZpdTNRs8olFNC4eVCL1hVPhFf1YIFRQ/5RKTYsv
	0hT6zW1jTaHUI97N0ARqS1gfP7tz4bUASqba/DuReiZlNQ38lPGfpldf0IF1G1nUg9D926yT4m7
	UCpAEaEuyKcFaIct9o2DAcj9ckkEu1YEqaSMgLqz8BnJmazBJ1O4UBjQ8AWWr7arUPEeeVp/2qR
	qMbSR5mDkt3uw1LJC+a4NksS9cUNJgcm/m5VJF55VxLJjVuigz9cVoujCh6uJUeMXg0k2UqShHu
	L7jkiw2eGtRGp5QcvZ+VNe/2tRI0HoVfqjRyJcZdxz4wWc7NQd2c0oze1fPgQHR9jVIG3CYxRfy
	9ua5gg0AOgKW4N8FQFq86fALrgNZuR2uyt+oo5mI5Mnu0kXGPw=
X-Received: by 2002:a05:7300:d185:b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3515dde3a20mr5014522eec.16.1791438372329;
        Wed, 07 Oct 2026 22:46:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm12095989eec.10.2026.10.07.22.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:46:11 -0700 (PDT)
Date: Wed, 7 Oct 2026 22:46:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: gpio_keys - drop redundant input->dev.parent
 assignment
Message-ID: <ascuEtUKzVdo68uO@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_input_allocate_device() already initializes input->dev.parent to
the supplied parent device, so the explicit assignment in
gpio_keys_probe() is redundant. Remove it.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/gpio_keys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index e19617485679..defe4074a60e 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -885,7 +885,6 @@ static int gpio_keys_probe(struct platform_device *pdev)
 
 	input->name = pdata->name ? : pdev->name;
 	input->phys = "gpio-keys/input0";
-	input->dev.parent = dev;
 	input->open = gpio_keys_open;
 	input->close = gpio_keys_close;
 
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
