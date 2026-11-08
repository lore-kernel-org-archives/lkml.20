Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173824;
	b=Tjq1quXUhYLnJa0DbNs8uYfRmpztD/C6RO6PCKKeZ39lb17lMNBZzYFzxN+YafceSmTJ
	 SuDT+xtUvlqln2GWik5gMhk90w+JMDe/8Jcra0RuGERMm1emunJ5DeFMUua5TCwlUTnOf
	 1cZO8cGtP1trjnCgBweGoOvYxwysWpttV3cdwFbkBDQEPQ7JXcm4t1iCYZhvbghyVfS6R
	 6R5cK9FA7e34RhyzL1warKENpxoBShXqz/WeDyUaTUZk49r3n+lCBL1D6lbPVxe9NH5dm
	 gvbAGSb8HqPTuQSj7tTX+i0fTJ2H3EPgRoIjRTfwDeOw/Q7ezm3c75cyGoO2SXEMDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
	b=KUmrnFmI35FRaLf0Itzh4/tuSPEwaHEOrwIoxjBeN6qXzzRIDglVo7UmITl8Hzr1VSyu
	 wr8fUXZx2LKD99Ei2ZGvWx0ML3+eAqeksTjvXpWV31yBAtGOF86SYL/fpdCECmhd9NdXy
	 swOg/VWzWx2BN1lH5a6wesPEx+jknmjECecFinBJ1xaYVxTa5HZSv3tMdErUVAajyNzwZ
	 ORXLvmHaTscewRuVIq8nqb4MVnzIVuTiO3kz/yS/DIQysW9+b9TtJtIzlqCKqEMDjBben
	 EXSziNrDuTU9r9G4QEbCEpoIZbaXqtFKkwhTW3uoedxDQRbrR/GouJiuv6D9vzqI4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbBpTO1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BF606A336
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12BF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbBpTO1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so4126075e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173822; x=1794778622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
        b=NHbBpTO1b3sbDBGVHG/0BZgH9TAvD3ll9f/tEk8XtKiBecqfCwkQDhh+l92Hil9Jy6
         17CtBnf+NUOf2d3/0E3X8v5MUcOfQQZvAcg7jxNZz2nOGKh5Wtt3t5kYpee4oGeoXfL1
         fGu5JUCUk6tErdxBuTP+5mr44+RuVMuIbngsBDeWjx9TInwJZd/a6P+wKLFm0Gpf5p3o
         YBjohUKgwo9XKmmlcdj8tJ0PUQO/Bfk4w74fsaA6SP1mfhSLjkRzpLn0vgGDUYBVpoMy
         VZeleUukb7PLU7ibdIq5Rd143jiY6TsULVd3xiNllU0ceUqmymERK2dLVoqAuS8BPXwS
         SVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173822; x=1794778622;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
        b=I88zm0GH5IevNTyoeux38pKfJv4MJXXUar4AJLeZPa3PagpzcXb4mtaLSmR7dQGs77
         XNjV8fGDlnKMdApI0X+Rs0Ya+v8YrawPhVcdSCZ4mbCwXUjdstrrzT7xVwp45RZuLwHU
         nAKt04YCBFX2RiQ40J7RAVEMPgLBFDX2VubBUqxAvOyL/9M1LbUQD471IUPD0l1KyKXL
         Hzkgb5Lzq1UEx70PAz6vd4b/xCvojowmzo2s1iMFvxJk7Hwdgb6T/sfEUuc9Wxd/ksQP
         D2Th35Am5WG26E/bSZBqJQaL3PZo0cnLttDHH4IOQf5tiB7LZ8IuiA9UfdBwEfh44JMK
         B3ow==
X-Forwarded-Encrypted: i=1; AL+hErGM2I/p0C0ApYkOU9L6rF4inklASlc0rNs2dKoWWCH4Y5NDFAS/Ur087cNwiyb7GTY23Ic+9wFWc8OFoqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gjenaMlbQNgYluCrN+jrr6epl6BlQcj1mN1bIh1XT6DkP76F2
	uoKbfapR9ihdwjQarImz37F5treVv1n4E2z6o9Lss5kB2NDnR5tyKGmVM9Xyi8yH
X-Gm-Gg: AYBFou0ufAK/0CcXZXcriw6hTXZeDufklAX2THk8JAf/gFRu9h51jsDw7O3jzyJbfPF
	zgm2OwrHFk78qr2tVFiqO92giPzaDMVg8iUbIlpZmfQvN1ZsKY787AiQ+X6j/YX96Lmnumu+gm6
	ShYTewONElUWWel6s6su/CazyggBVU6/WQhYgYxCyy+u/2Qkg0L8xsZ84Ob1TjScK/zdBF0ypXZ
	E8qjWUXERczjblLl5Veq5ZOIYpZFfZoECyEO53giXXuL/mI8GbG6HOQmE4BirnE2DwcMY4xXVEN
	yS+xurgDqu0lUswrH/eBCoxqINh/FOlm3BI9B2s/Qpa9w+MAffwY9Jb1VAxseucU7BZ1Uzr51h7
	cWPf9k1MoNKe/3pMpxNAWid/g30nvUwzfZDadEupqnmA++KPkBxAOCOkZ5VzLV5avtrpA0ykEGV
	asWtOKGZDGXclfRj81heYJli42mjHJhhMyssZmhDKZgtoLDed2yojYzq4J3xKR3bYtDDAvljUkK
	cmOtOrv05YhwL3KFY5Wbp8Utmk0JAFlTegyRRnegu8D5ipqP3h/T4/GcFpECDs9lxseMG7uGgl1
	ruawMVa9e1nZp1z3VgV8ePyxAKiYh+xbe1RogAYh0Z+qyLjhJrIX9/WhZuo6
X-Received: by 2002:a05:600c:6095:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4b960da5640mr43548365e9.12.1794173821866;
        Sun, 08 Nov 2026 13:37:01 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm92178595e9.6.2026.11.08.13.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:37:01 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Sachi King <nakato@nakato.io>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
Subject: [PATCH v2 1/2] Input: soc_button_array - support AMD variant Surface devices
Date: Sun,  8 Nov 2026 22:36:55 +0100
Message-ID: <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sachi King <nakato@nakato.io>

The power button on the AMD variants of the Surface Laptop 3 and 4 uses
the same MSHW0040 device ID as the 5th and later generations of Surface
devices, so soc_button_array matches it. The device check then rejects
it, and surfacepro3_button binds instead, which is the wrong driver.

soc_device_check_MSHW0040() evaluates function 2 of the MSHW0040 _DSM,
the OEM Platform Revision, and treats a returned 0 as proof that the
_DSM is not there. That is wrong: 0 is a valid revision. The AMD
variants implement the function and return 0, so the check rejects
exactly the devices it is meant to accept.

What separates the two groups is whether the device implements that
function at all, which function 0 of the same _DSM advertises. Of the 32
Surface models carrying MSHW0040 in the ACPI dumps at [1]:

  fn 0 mask   fn 2 advertised   models
  no _DSM     no                Surface Pro 4
  0x03        no                Surface Book 1
  0x05        yes               Surface Laptop 1, 2
  0x0d        yes               Surface Book 2, Laptop SE, Studio 2
  0x0f        yes               the remaining 25

Only two models do not advertise it, and they are exactly the two that
need surfacepro3_button: the Surface Pro 4, whose MSHW0040 device
carries no _DSM at all, and the Surface Book 1, whose _DSM advertises
functions 0 and 1 only, function 1 there being dGPU base attach
handling.

Use acpi_check_dsm() to make the decision, and keep evaluating the
revision afterwards so that it remains available through dev_dbg().

[1] https://github.com/linux-surface/acpidumps

Fixes: c394159310d0 ("Input: soc_button_array - add support for newer surface devices")
Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io/
Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Sachi King <nakato@nakato.io>
Co-developed-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index dbf86ea778e6..75946e18cc80 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -546,9 +546,17 @@ static const struct soc_device_data soc_device_MSHW0028 = {
  * Special device check for Surface Book 2 and Surface Pro (2017).
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
  * devices use MSHW0040 for power and volume buttons, however the way they
- * have to be addressed differs. Make sure that we only load this drivers
- * for the correct devices by checking the OEM Platform Revision provided by
- * the _DSM method.
+ * have to be addressed differs. Make sure that we only load this driver for
+ * the correct devices.
+ *
+ * The OEM Platform Revision _DSM function tells them apart, but its return
+ * value cannot: it is a revision number and 0 is a valid one, which the AMD
+ * variants of the Surface Laptop 3 and 4 report while still needing this
+ * driver. Check whether the function is implemented at all instead, which
+ * function 0 of the same _DSM advertises. The devices that need
+ * surfacepro3_button.c do not advertise it: the Surface Pro 4 has no _DSM on
+ * this device, and the Surface Book 1 has one that advertises functions 0
+ * and 1 only.
  */
 #define MSHW0040_DSM_REVISION		0x01
 #define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
@@ -560,27 +568,22 @@ static int soc_device_check_MSHW0040(struct device *dev)
 {
 	acpi_handle handle = ACPI_HANDLE(dev);
 	union acpi_object *result;
-	u64 oem_platform_rev = 0;	// valid revisions are nonzero
+	u64 oem_platform_rev = 0;
+
+	if (!acpi_check_dsm(handle, &MSHW0040_DSM_UUID, MSHW0040_DSM_REVISION,
+			    BIT(MSHW0040_DSM_GET_OMPR)))
+		return -ENODEV;
 
-	// get OEM platform revision
+	/* Fetch the revision separately, it is only used for debugging. */
 	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
 					 MSHW0040_DSM_REVISION,
 					 MSHW0040_DSM_GET_OMPR, NULL,
 					 ACPI_TYPE_INTEGER);
-
 	if (result) {
 		oem_platform_rev = result->integer.value;
 		ACPI_FREE(result);
 	}
 
-	/*
-	 * If the revision is zero here, the _DSM evaluation has failed. This
-	 * indicates that we have a Pro 4 or Book 1 and this driver should not
-	 * be used.
-	 */
-	if (oem_platform_rev == 0)
-		return -ENODEV;
-
 	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
 
 	return 0;
-- 
2.56.0

