Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666179;
	b=1SLec+yGUQmv09dT9pG/a8PDASqDWxzSxt/7WK6ZqC2imnHpIqhys+b0mVCYtlukv8F6
	 CnubSwog0KKz9mL5fdxjfXs/NOb+PY03lwIZxdSU/49FvBLZ8zmkX8mrg2Mpo2WVKIvH9
	 1QbHLrhAy2DhFVY3XOhGUMyOqFWIfqaBmgmVcFb5BUxCovzu7djmFYLzKuTMq6wMXNS3g
	 jRd+x95Jh26HsxpUDd7npZd0x22AmSzt0KmGaWy1pQCyV5Pdu8Rx8oGQuCvvvdY8LuLmp
	 +u9zGdTzRBeBjnJTpi/sESHUvbJksa+ZkvItdSfZN7w4uiDG3rKYd4YRmxUI24qMFXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=G5yus5RH2Mmxq4O40QSTYF6RMwPjngJIn1JYpz9Q3bE=;
	b=2W8oBhfnz6tAqTrzvRwq/pFyu6i4a11ywaqpaXFgN9ZpLN7aNucDkouuVqEbb5PKxMOO
	 stXU4wsI5xKHwhKSKvQK5U3li2Tg5eVCBvfY7mOiu9NvZ4x4QBQ7MeccfioGN0NAbOO0J
	 ojrXtzTxJ6qI3ZcmkmMfX/+HTFdggXU3rh7UyQmpR5Jz//HF4Ty/fCFBSXsw0SwqfHC29
	 hniFbbXdbuaygJiVAQ4ECG3NvEmjpdwG3jDkxax3BIVdfchXJz9W0aeFcLL36oLrkPvt0
	 O825v6tWVbR/m7ha15TuhV1prKiS0YEnpbd2OCqklesGxX8DS19XWcHeo7XT6A7rRpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKa6KfC7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA383606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA383606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKa6KfC7
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-537548b811aso12753941cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794666178; cv=none;
        d=google.com; s=arc-20260327;
        b=c3FVG5dj7IXuHB1k0vFtnO+6MFY4nfTaED8D8HmH+sVqOC5wAho6YJPAnNkptK8zFt
         yCZfcGi1jY5lkQ4OPHlFh8oiMTNohfuI0DnAnGGZhHv85GweMKHD0hQDmUahvU2mWP69
         87S9laoOQsM3gZomb8rKn9AVJ04Z7Cn+vClpT4PGSGuXpplT5TJdRQaKr55Dl1nXDTBL
         Eloxprj5J2uRGCTkF49E5DsLWARIW0N771du/o/vKAS6kxNiWCZ7MlVR/xO1Q5KJv/1G
         wjVXbWiO5MejD8hepr8tgWvU5kHlTGsph0KfNIfBlWALd6zXdyJVWH/CW9wmxFGS5mFi
         oqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=G5yus5RH2Mmxq4O40QSTYF6RMwPjngJIn1JYpz9Q3bE=;
        fh=Jf8SWyz+DK9derPo3IQ79M+p+s2gIiZhHi2De5EeNaE=;
        b=F++JX7vIznm0wOzBJKG8ffpZgzP/FGhQ3E9qcGw9BK/dw44a+5HMQ4X4q2hX4BO02/
         FLG7jL7ld0hYxAOIRcYIHLtSRHqTyED0cy+FwCT6xS72bw+2r9fogDBL/TqtxrEE/yl7
         54BX7H/h8gGLz1oH+Acb2krVwp/YTWZjQ1bxeQ/oG5NhGXjAXtVU2dQ4nXRLf03VWw8z
         NnkPKdYOnvA4yOQS6pLifLlhDM62eqHhGcVRukEw39Mrw29GgCzooYnSR8p4ZHbkTXci
         EfJpb89XcwsXuz+bQCJfqgWzFr1Mg54fAULLy1DuhEcbKlHoX8Wh/c70A5LrwDbg7Aqi
         M0Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666178; x=1795270978; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5yus5RH2Mmxq4O40QSTYF6RMwPjngJIn1JYpz9Q3bE=;
        b=OKa6KfC7ruy5yaZT8s4W8fKpzxvy2X8Or+9st7L3BqjXlq12bO5v0k3ujfceeea6vc
         zEkpkol+mYW2vkHJdhrY4ykz6LgSw2TZO/HVzKAsoun0282sWSCLUrI+5x9Kync1dasg
         Lgk4xvEMHufsV9B2EUGbXIoeSxVA59kUMGnOpL03Aa2r2Bls/oA4bCUO40sArQuqGlXv
         yJ3hD32WWpzpymZzULVZJF7PKs1V5RUd5znLYtFRYr7GXlpfQbqZH/EFw6lVTS+KFfZA
         8dmcKABy0xebNEraKsBBGM2blkuOZKyvYL5xLU2TklJ/Kqa3CXB7nKcZ2Lu9ShlS6+UW
         KdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666178; x=1795270978;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G5yus5RH2Mmxq4O40QSTYF6RMwPjngJIn1JYpz9Q3bE=;
        b=qCs4xfUpWNPE9JDk0MITTgXoCv0ExTy40GS0IFrU+7KbBpmwPmwBFlPr9yquMyYlkl
         gYB9d8n4vJ/pFVmnfW8H67jzKES5R7cX9c1qRbAaXOHaRLIuaMZ2gUkdVRuQ10UABv/f
         USxYpmYnzC1f1YoqMOHjGMhlhZKmtXuebEersSZv9sqEiufE+VJ+QsXUPL1adNVagSSn
         lBXW9zCk2di9m204xrSvcfIESYO6sSzI4m1TBvPe65FHY3FIi/l2l+1bLad+//Us/25y
         cAHAAgxJ0kXLCg4XNpDspYsvas8cGQ6wPvJBvQA+t2BYuQWgpOiSKC4ODuDP6k1RM3Li
         u+Gg==
X-Forwarded-Encrypted: i=1; AL+hErGyjEZYsqOriAMN4M4XkfglTu8Wa3FUKpyCUEw3EAwKtzGQPxWMIrts6uBRG/nyo5tB7Zjc54ZF8r9Ehe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HGbBsBrI/onjYsYh9kfPN4gyPUeISBqvDJIeFEZAM6Lmak+Xz
	76MowiNuU3i36iOK2LcNrUj61cOqbEHpVHNpI3I7wKI3ykcG0iHu2zNli0AEHWhwtZbGpe2kPux
	iIVhXlFhCKmUQf1TkwtB5i3ynnuZJj2YoQg==
X-Gm-Gg: AYBFou1jrTpXDu9Grr2JClT78jik9Ao+sw8HIypwox2JBspw8XaYgzH9UzvbgqaQLfK
	OONHIvNsSM061gldwEwNlbtDoVeaY5ovHssAaSRNWquVaVCj6WWOnj3Fg6Cy1xF5clcgjN0zomT
	ql/jZALQmWHNE9pBKePrg4OZr1VTOs0+x2Md/8NhYG0apA9Wh2bB8LxAWLG5ie1Wve050se7jSX
	OX4CiWFQ3WQTY0zBMyBw5/N4UZd30YlkooAJUGnqd8fNX3iKKLHogk7Gn4aRiOYk+X8kvmG2oNX
	VbgvIUqc9EoI/otBbb0566zliyWFoEpglNCpIMc8ffm2GNYT50nj9FfX/pzAGVxjaoCIEfO4DNB
	9cT2+rqvoDwawZtnFIbX19LUqU/8vtjFrcTFrhchzWutEANPta12xWbmMebqAXbtp62TVrQ==
X-Received: by 2002:a05:622a:99a:b0:55c:303f:622b with SMTP id
 d75a77b69052e-55c304f17b0mr39835191cf.0.1794666177718; Sat, 14 Nov 2026
 06:22:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sat, 14 Nov 2026 22:22:45 +0800
X-Gm-Features: AclHuK9yiLIXob55ZroLFT0Cg9mD_HokkJX4TvKd-iDgDxOTy4uoDwFYBnQu6Xs
Message-ID: <CAAi4Z-ff4LK0ZX1JHGkcv0JE0Eij7C2y+gRMhaMq7kHVjGsJ=g@mail.gmail.com>
Subject: [PATCH] bus: omap_l3_noc: Check IRQ lookup results
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

omap_l3_probe() passes the results of platform_get_irq() to
devm_request_irq() without checking for errors. When the interrupt
controller is not ready, the lookup can return -EPROBE_DEFER, but
the IRQ request can turn it into -EINVAL and prevent a probe retry.

Check both IRQ lookup results and return the original error.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").

Fixes: 2722e56de603 ("OMAP4: l3: Introduce l3-interconnect error
handling driver")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for ARM
(multi_v7_defconfig). No hardware test was performed.

 drivers/bus/omap_l3_noc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/omap_l3_noc.c b/drivers/bus/omap_l3_noc.c
index 56794c67d865..0e445b36a647 100644
--- a/drivers/bus/omap_l3_noc.c
+++ b/drivers/bus/omap_l3_noc.c
@@ -276,6 +276,9 @@ static int omap_l3_probe(struct platform_device *pdev)
         * Setup interrupt Handlers
         */
        l3->debug_irq = platform_get_irq(pdev, 0);
+       if (l3->debug_irq < 0)
+               return l3->debug_irq;
+
        ret = devm_request_irq(l3->dev, l3->debug_irq, l3_interrupt_handler,
                               IRQF_NO_THREAD, "l3-dbg-irq", l3);
        if (ret) {
@@ -285,6 +288,9 @@ static int omap_l3_probe(struct platform_device *pdev)
        }

        l3->app_irq = platform_get_irq(pdev, 1);
+       if (l3->app_irq < 0)
+               return l3->app_irq;
+
        ret = devm_request_irq(l3->dev, l3->app_irq, l3_interrupt_handler,
                               IRQF_NO_THREAD, "l3-app-irq", l3);
        if (ret)
--
2.43.0
