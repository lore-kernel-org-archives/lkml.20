Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FBC4CCDC7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794298; cv=none; b=qjL2W0gvlyjHLNoWov1E/fLxWs+L4NtBUte65SJahvzAz1gnU5T0Fn9ppt1U3kU5mXvNazZDyNhcCy73siMdCWgAKHb11mdBmr2wCY+cJubNmSUFJDiGnPdKEx57goDPSmohiZ+uMXHeAGRhi5a5HZA59bMh+kI3nplkTxMLQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794298; c=relaxed/simple;
	bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liwE/OrIvN3Nj/C7+2ZBfzIK/uXd6aH7G0ut70p+UKEM3WvMJG9YB+8wirqAsZEY3dpv0FQwSVT1dBa7OokiBQ8OfSC9ESbyoj9HT0oV4Gcb/kROPXlqe64zQ6zoiLCTlIDJsnGcxkopseN1JTMQUrUi/lQytFwFoHDuTMrz9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IuRRNzLc; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IuRRNzLc"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso3665641a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794296; x=1789399096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=IuRRNzLckf3EAepyWyFzkAXsStM0b/WM601tIf4iQ3rVpHIRk43XQbPLqyJl9YPzWt
         ykUky9lQmFihPFktZmIkcokW7iIKpDz5sENNr1Fj8OJDAmsjXWEnNwJju5VcrUvMO4+k
         Uv84N7Cavu72P2+Iw0oqqtqww6GNIP2zYJkoVS7K6in4WPrC0yqs3N++Fq0diCVkXkR5
         i8vVkM9iCzCKqAhvGf9Qfvdwzi8VFxt7Nii6VP32cuOo1ORz68MXeCQvNHfDR2elf/gf
         BcOW1MmuUmkwIYTYlTarM51eNahWIEPSOurPlMbb8N7bh82KsD8s02KDjoY8one8xZpR
         Ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794296; x=1789399096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=PZb6GOg8sdTApAVsmGu9aeEUuXLjAHgliNhFmNPpi2mLcID7SguF/9j9v5A2R3BQqz
         nTHDoKtAkDjRauWRTS2q8r4UIJjOrl1yXsWRddEMZPQnDD+WGeUVc7yudF9aqms6djJc
         bnsyoWQTUUi3SMBuKI+XmEMpqUbFHnrA+oAL0juDmYhY8TO5RBWBYQBtK+n/YbYL368L
         Wa1lO3V6HCBF7Et00CbGo5oyCX5jdAN2jcgsuNg8ound8EsVJDuCR74Oby0iwdyxkish
         2TepH4nv6UGbMh6tWpi/Vb3LNpxSzpeOh6FdlMlIa0hgxqnQyIn7XmK6ssRTqvBPoHjb
         r9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBweEowLB9yN7LIDh+dfSSxo3LdbJOeJlgKp+Im5pUHICG4oJqs85xn4Lc/2qviWmlPCuqNEvc5MmRBdtMs=@vger.kernel.org
X-Gm-Message-State: AFuF++m56GCrlgaZ5qRVkzs7tQvUG5/MR8FJj0ZiQEZ8T1ttvld3H+Tw
	khY68icKLHUJnt1i1niNk+YVi962YLkMtlaFIq9T8+scHfqL0+btgQkvMchn493xLtA=
X-Gm-Gg: AYBFou3VUDqoX/Z69eZyfVtA3VdreESuH8XQW4xSt/fO09Sw+GvvtvFHKu7cHtiBadM
	2tL5/us71fIT+bnuhv+gXu4ZkmY01HKeuVLccqWNhCGFOcVTNpohbOKZ9Pru1WKJyyriHyI9xgS
	Fo0wVIHflZymxslap1FyF77emA7UPvGGxNZtuw+9F5TYOhXaCYCGuuovH9V+or+JQla5XXQ+L3g
	GmAxazrViTgtid2K3xpKCvQ5NFx8BAJ3EhF0Jg0VlP3VYciYXUlAzL0rSAX3IMa57JKQelM68qR
	2GFTf5+YzesGUcTyDHWU+uoyPWZn3tzJrFM1tX4OXrs7jJowN68GGuejjBtlZZ6w8ClHoQJuzX5
	OvzUHi3Nii3Qc7+a62oJU/VTGMjakZsUf+Om26OXL+D7slQPqcFw65oXLHUkQXAByuLPW2eTi61
	WR41ex9WCe3Sot1n1ryPfjRUVqz54+0PGIaVyvuuOHtHH8ioE2UTAmWeJpW4/wwO0fdb0hbFcOG
	NnOWw==
X-Received: by 2002:a05:6820:4df7:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6b6fd7c9e58mr12538158eaf.28.1788794296030;
        Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:46 +0100
Subject: [PATCH v2 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-4-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=je0Q/Lb8ErmaZ8GdkEHJKU6dpuWT1QFFnOIu2k51oXK8LE5wRyQGaRgXY6JQ8isasnAQDA+Qm
 6/xLWprafnpBIJxN0OmBP0LngcoNeY1WMh/YEBdL7MX14FsKewoV36/
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

