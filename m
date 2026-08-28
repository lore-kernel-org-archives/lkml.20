Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1724E3822A9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895346; cv=pass; b=DtborscYWZEz2XsmeVFje3KpW6olgsQkoOUtrqP0XqjwIkY9iZa9n6HPD9AozJQDbaTNz82GgH/4Tg+BQ2I7HRHSgAuTnR1kx3nrJn6tXvNIwV5zeuGxhF6K/0+J65sVWKFa7p404hcaAHERD2RG5whltkcg2uOn5Nl2Q4pp6KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895346; c=relaxed/simple;
	bh=p1v1IVzRIDgNx/N8eH1pS5FUDeCgq5tkPUQHyB+es3w=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=cJLLycIVO+fOQN6kvTpTwNDYS58WuaowpG6nq41GHGPVYGVoQDAOmBWrFFv8QQSLYVFl2hKuNhoB5TTW8l5EyvHP/ZMPCfKAuuhhcJ+2Ev+tc2vgjS3Pf3MlrIOUqiQGx8qzUcr8xrgdA3L5zChGylHipG38okkZ4uf8kH0UpdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=DyN81XPm; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="DyN81XPm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d712281f8bso7375765ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895344; cv=none;
        d=google.com; s=arc-20260327;
        b=JKS4V8jT1EtQP7HtqGOqqP9G5p/elixLWsQcy9OF7rk/8eQazj1qMwSyo09pHtFOVU
         uG57PksNZgeklSjX2FLsR+QI7v2J/PkihNrvXq83o7mrRqD4psKyPkSOdDk+XAZ+Hgfj
         HLMdNp+f074xqtiqbtkQeec48S4m9BiRjBeFL78soOKERT9nlW3zuD71TgVovq+rJvZD
         KJl7K1WUuLL6Obzm+zI0SG7BPkML5ndpg3PNlIpgOSv6txl2tNojK0YE5x03VZUWl0Zk
         hA3nRSYAoDhyU5NrzGhHWQQzvJbmnkX23EPXp+KCnLIw8DYw8eULHBgaDDJa2+1qJ2dW
         LYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=LT4To0OsjX1/jK+rL4EorTsovtuZzKeOb1eHUmWtFGk=;
        fh=7zzX2eFj3E4HQY2kXFYkzz0LXlHh4g/cyQVKmPoRzng=;
        b=R/5QhUHc/c66IqvbBsbCrQyy7LhWZXLXjdIVTYoMcWA4zE2/TlI6SsimoHgY54qaIV
         5mJsTLRdW8YFJ2FXyNQaQkWCLG/jYuAUmiejfJK7vfMpeWbM+wi5PMdo5sH72sLVnnvq
         sFR0ZE5OSal5aZlbZz4XoKfd4t3TZA5VNERdOU1pW0nSSp8bTHz401qQW/knSgf9vXAM
         jsowWetYBq3P9yoZ64ZGuIUykPtxyTqZDmnlZId6Z7vkDoK3FIScBoucjZbg3tYy7cnf
         Vn7+EUVBwSnj4C+Tue5Tr5sb+FvuHHYl73tGKcHUMvhZgpmXMrPOZAhWgGORNTA27fUr
         onnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895344; x=1788500144; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LT4To0OsjX1/jK+rL4EorTsovtuZzKeOb1eHUmWtFGk=;
        b=DyN81XPm5L1yPoMoypvFNvYw/+qE7t1U961tPx2an9bkhjo8M53rrXvnraqatq0mwD
         /KCqmaSfaDSAd75nFy8wZwMGv5dJV1G9A0fkSYHlNTjRq5FSoEfDgaFe6hm12KIy9Je2
         Ba8xYxhpfZ32ZGkkB7ncT3i2S4/7sFI20KXYYA1f68ZqQHZmwRx/7dPn5KCy98w1kSa+
         GcrDgbaYjUpxduxgs8UoEiPnriELi1TbQF6ZwDOxMWjJO5Ch4kF+XyGJdp6+VKKjqfjk
         hMFAmYwm2uTnbQb7tqnEPHgmfpxj5YAJx96il49nlTrO/4xYYykDMvhAVCP4kOv2jO9B
         ra/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895344; x=1788500144;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LT4To0OsjX1/jK+rL4EorTsovtuZzKeOb1eHUmWtFGk=;
        b=PR020uVb6MSASKHMQ7tdrehxJACfBx9wMzpSclaXBhOmJkK8269VBonbxhzSRLC4r5
         GHsNgnwoqq8muSEWBNyNIcU6TmPZk7pc1RSoIpgSX4bOZ49MY6VzS1NUjz70191BQFk6
         lHz6xmsYOLTMl7aehv0OaHlosSaePvHdKhM88yyfwJulritM1chQp6TnWppNmMWymEYG
         51DKGJqlpQVZmRWXc2pSvbrmZnBOYhwpXm7bOtT3POEEf9L5ioSkODHTddUQAcr57RCy
         qp9UGxQHhwcx6+gRRh29LpZRCcLpFZoG0kv45+rIJlDqnfJcSEk9cmaCKN8jCN7LTa1D
         cKtg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5kjz3Xr8Y3l4vBYn3EfdCMp7rOdS7UqHkQXDVakayT6Mj1Y7zumdhK01CU/ZOVcdlGaAlpm+Q0WiEQD8=@vger.kernel.org
X-Gm-Message-State: AFuF++nTPXkjEFtCFekrVNTy3z8cjnuLrW4qQyhcT6OOeLT8gZOvrWEI
	PgLdfyxGKKw75+T9JYbV7l4PBkolT7V0nvmK8zmMsEzfjUAoOj1Ponm9vrOeZz/uZT1MeU9Pm/h
	fxUwVJ8eMwXeqYm2BJNZfUGFwUWTFCWlETUwhpYBd
X-Gm-Gg: AR+sD13iaSDP0JRD5GMAvbDSjdGDituyrKRrzzqkn3SBsZIaOF6BaO2n9N0yX5GGXqJ
	58t0sOKBethxYO6w/fBWyrfdQ4NiNZAr0CqYZA+goIWDF1CMGUYEWk0dVmS8zh+wq0FcEG2QyS6
	DhHt0AKs5WSlpbeZ1vFiMCAW0zzNlUBHgB43gc3R4szQP8W5Rgy5Ta8jAMh3PzAqv9ptx8qgYDX
	M+j0yikBKqgeRlTem2CYLswPMpc0Wshc6OSU8IrmeobxRr0V9TIQ4nm5Fis0PgP6VuKdzcZ8s6o
	XKZdcIOlXTwAUIE1C+rEdkB/VIUpZhd6ANpggZ6y0q5QSIhGqf08dpPUSgGW7l1X0e6UseQWBJ1
	ONdny+ZiAaqWMxUFq5Q6NFmwh9HAcSYBl
X-Received: by 2002:a17:903:22ca:b0:2d6:fd55:3a9d with SMTP id
 d9443c01a7336-2d74dc111bcmr73203035ad.3.1787895343268; Thu, 27 Aug 2026
 22:35:43 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:35:42 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:35:41 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:35:41 -0700
X-Gm-Features: AcwNN1VyngbgcKs50N3MJkg3MeaR66VvRj9F8NMxHZOvLMicNByVpJwrJCJE87E
Message-ID: <CA+0ovCgxQ3_H-5BWXLR_o=AG8EJ_bofmx_E07VazDm44KiZKgA@mail.gmail.com>
Subject: [BUG] vga16fb_probe -- KASAN slab-out-of-bounds reading platform_data
To: Helge Deller <deller@gmx.de>
Cc: falemi@asu.edu, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/151-fbdev-vga16fb-vesafb-efifb-platdata-size-check/

  BUG: KASAN: slab-out-of-bounds in vga16fb_probe+0x828/0x9e0
  Read of size 1 at addr ffff888105ba2dcf by task repro/9494
  Call Trace:
   vga16fb_probe+0x828/0x9e0
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   device_driver_attach+0xe0/0x1d0
   bind_store+0x1d0/0x220
   kernfs_fop_write_iter+0x3af/0x540
   vfs_write+0x61d/0xb90
   ksys_write+0x150/0x270

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
