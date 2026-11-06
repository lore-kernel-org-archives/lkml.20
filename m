Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946634;
	b=2SXsRdOaDhmruARGUt9G9++wlSkmBs8uWnaRnAm8zX9szvIrikqdU7ce6cLgC1qxgpcl
	 c24omIAsCatFGPzO+SBIQs3huPr+vcRpf2RBjwyRlMaOAOzL4v7fAdqlIvnUHjnfo1lDR
	 82WthLvnydllwtlAQtMYQFuvy2SUrq0qubJoTZLmqPxlwxYnViwDag7c9B+KOfAOZCwc2
	 UMgvpjUlIiTZg/cCSIdR/3oPybway6r2KRPWcSbQ/t5YdLUcxScVrRZqyJI8eXto8zfhU
	 mf34YW+TP4ZrWb4O57wEtO9fwUStvfDOvGwu50a41EbjE2/SA5dsmplfOJuaJepvoIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
	b=HyfYg6dACq4tEr9dSx06rHsrpIUQauY6oUEW2lTX5BFb0drunJiPhAndYRI69ofcwAjX
	 ytWKs579knLJ0fo9IkONC4Vxg3injLX+S1p023mzXFAMGog9nwEgNIduYracIybCbhFSk
	 Q1GOdR6dnDjVc3VgcMCeMXovuPtCeEuaO1jvL0AROu6cQbFwVAUskS3NGRJ/CmnU3v/Mk
	 ILFPOQbg6coROV2rs/auP+WOxfJolKwvsWvnQUHLUDb1+PYYQjZH3XzPtKbDG+UVN0xlk
	 LeHw1mjCePMSk6jwQTdYN56hdGFVoACp6BXnYS79dK6qt8ibB1ewP+qNTNJiY7D/9BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpPglMrF;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10162606D80F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10162606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpPglMrF
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so60698c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946633; x=1794551433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
        b=lpPglMrFwQrh/cxploueyvasslTQaPe5VM7tB9qKSi/4NB1k5DNhcgZ/vA/Ovd2kzz
         0jnSLlUY1HqEF1FnWMyhFCkubYnDjbencVUs3OtFcdKqbGY/fNMdCiqDaj1PdTEll1LX
         zccY7cSBvfmoft5viGaFwDB3SL/yoTTz2rbMndCR6e2AIJFE/57+bdqcD8fosom0lnqT
         v58/84k83txQEMGoaa5icOHJuk7dxxDsP9D9i0G7alx74tJgFnBcz3HuTrTN9q3JiwlZ
         WHPncjIt40U87EzAbSV8MgHQKTe14fZMKy6vd5WJqr/nVj8C8u959gsACSQFDFb6BN9y
         I9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946633; x=1794551433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
        b=PjAjBmGPYrbQpM2v8DLNcKAHdHrUPEvV/C7C9y/nhAlSTTXNgAAUYmwUi4kcDW1o6z
         DB0SWqqDtLN75cKp808Kj40Pmx2GXIiFhm+LVindxb827qYsp1nh9uIPL4x1mus3hmBF
         8Ze0oYMhSeml99OlIcqkQ/CYCLRJfn5qwZOmnFbZboZ8mYiJMDWDLqilu6sjSg7HgyeL
         JVFpIWwOd/cwGwP/lfazhyAyYyn8Zyhpi0xX0erVNj0+SKUmjVQWTXBQbC8+GGJs7NOi
         XDT/8zHpNjYQWqM2zQs0YCdxO5Lhrad76ikmqzGakth8fGksxISsXuXw7gbqYRBIpu5u
         SLNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWMpympObFBPD5BZ4JrzM9hQjJ2kJVnJHaN/K5V2qy6NWG3YqtnkC5lGVyzYgyGifLV0Pgb/f9zcqjx9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z94bDFBZ17gLJ7qzFM8UNM47E7fIqLtvg5j1TnvokfKLkyXaPx/
	iOD0ua9x+y5G0qhprBWliH6Rd6/amcc8d/GAegHy2BP2Samu1gceK/OF
X-Gm-Gg: AYBFou3RrnksnBXlSYb1yg8fXeUfcNEFuGNQDtITetBgkxwK685hPQQEQfnAYxW6Zrd
	Du5wXqucHvk+XYjeCCgr+hyllMElcgrZfAOZ2DHbVl4WpI0TD0dSNYWibvub8dvgz1MCpM3FjMH
	OdhGEn/QrLinsgMnadNY0XLcxZopiGhHsbvS8/S2AjhpROsjUnizVTSsQrUFkhwW6dmkLXJ2IAc
	HAOUwA/PxW8zVRa5pC/dAlccJRjzyEg8w/0cXgHRsc8O3/LDbD4PaEp6KberZJslFxB0vtaNfqI
	85Xoym9fv5fcV4RyydUMM9mCdiy3ZarP0z6xpYKUdQIoBl/5m5Bm3vlJePSKtXlWhCWhTBp+GXM
	HWEgCuh3MztT7MUV0NV5lBxJ0u7ykAesiGMpvBeJyaVDmo68k+Oiww+42BsO0XBcOGrtOrMMTZf
	HelMih9VF5fzSVlBJc/JyakPewDv3BzsF41UcuXZyRSzKDuRCNMDMtbUHzBgUloNNtT6k5A0uBZ
	QsuVpAtBuE6Dmfi89t8pJoEbK9fgDp6y9BFVGdNi5u9EUxAGAWhb/QhOu93kPmVMEw3hX2XEnIu
	rB/TxUpPHSnc6qXkIqJRAJogHhT4U6xUjlh2cP3xKCNTn+fo+U3NhnhTl4Do7cmrCNNmeCn4L4D
	iTFRlfkwFFIwV87SvMFOmFX4Gjo/DfHVuXPRKBg==
X-Received: by 2002:a05:7022:4585:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b25d392837mr2519116c88.37.1793946633211;
        Thu, 05 Nov 2026 22:30:33 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:32 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:22 -0800
Subject: [PATCH v3 8/8] gpiolib: use %*pb format specifier when printing
 array masks
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
Message-Id: <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), the dev_dbg() statement prints get_mask, set_mask,
and invert_mask using %lx after dereferencing them as raw unsigned long
pointers. This truncates masks wider than BITS_PER_LONG to their first
word and relies on the raw unsigned long pointer representation of
bitmaps.

Switch to the %*pb format specifier, passing the mask size and pointer
for each mask.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 83edb89a364a..079b5a715eaa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5362,10 +5362,11 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	}
 	if (descs->info)
 		dev_dbg(dev,
-			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
+			"GPIO array info: chip=%s, size=%d, get_mask=%*pb, set_mask=%*pb, invert_mask=%*pb\n",
 			descs->info->gdev->label, descs->info->size,
-			*descs->info->get_mask, *descs->info->set_mask,
-			*descs->info->invert_mask);
+			descs->info->size, descs->info->get_mask,
+			descs->info->size, descs->info->set_mask,
+			descs->info->size, descs->info->invert_mask);
 	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);

-- 
2.56.0.506.g506a7eabc5-goog

