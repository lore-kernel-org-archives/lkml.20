Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF2233945
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895481; cv=pass; b=jmMXhy3hqIDq5+uss+SRtyY9J7h7t+9vea89pLDJ5JxUwn6110A8NXEIUp3LVkGS6utuomwJ9SiifwLfGBrkRtQIVykJabIS3K355KNz9WP51zpBGaZUdhsZpiBfHDh1hWiMOR0yK1CjaEyFPlE0qPKi0FxG1H0mBnxRrNEkM2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895481; c=relaxed/simple;
	bh=n3zBONh6aX3aNN/6KO2nIjU14xTQwCZ2/uMbihc0f4s=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=kHUulU6GFHniuAWZuRxQh1nSDFCJghzu1p7KvPac57y0hcTFr5U/FQWA5HmL2JlYtXN9Mi3H5krnL3NPqYbUX7RZF6RR4EOjgGuGyvVJlLl4cVxzbWQSDGOaku2WR7+LMVBrRCOumYNoq4ZWVPsYpQRCVJnHYc6FEVB+MMj6VqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nl06KPwE; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nl06KPwE"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so447448a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895479; cv=none;
        d=google.com; s=arc-20260327;
        b=TDVhrOXO58BZ5qCv81Y5ffE7ZTYAH1X11RvIY4eSyMu2psv0dnkJXVajxJ6l+jwRGH
         ymk2IUMsqERK1GsGRs2B+ZgOBdl9kRFVqVX9+Bm3jpTPOg4CtnjKSFtkcUBJ1SsZ551A
         LNHnY7EZhYge6VDGn7J3Y7ER5egeH33WXhSWvzPHaMq2eulXL2XImyLAb6TvYrR2HiwK
         7tItQRDSiOOVKUGl8VyctcSMvS4AXPJt2RJqcI+E+J5rdV+B/IavlTzSRa7C3zSSTBQe
         zqy3Mq18BJmto7QWP9kJvc8EePNRerFPWgLlaaGMXOsugcnIR6xTxo+AyY9aPFyG8g1J
         m+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        fh=RE2s2bAw2HhmpPwzbrHhuy85Bb6fwP9fWFjBBQfYhYU=;
        b=mzFP7wNXjqwoyPHzpylwXj/TNcofzI6D6oSSksyZgluaeMfv96tRmELlzxkhfqINVc
         kIyPshU9EgfojAlttJXbOEGuxWW8ExZ6+iueIzkkv7QbPztX7LGAvCCy2dVZoabDnyOm
         e/r3mDK/Y+1fsu1z/YXGEfVze4fjo5trEsyA79DpJ6d4vv5fz+cd03TDoHS/YyR2peKm
         oMx7vstqD88Bq2FVcWxi0QmmRuSWTnGk2zK4vqKxqA2+WIgdISGRM2YvShnE7bAMfRu4
         jkpKocfVzkYYQKWJ+MpJRaOobEM2rylra+iNdOu4ZODcZkE+xBvIBDZJEvaUxEk3i4YM
         rT0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895479; x=1788500279; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        b=nl06KPwEGJX/m29+0+QObN1c9LaTv2uD7fUDHA+vM4lfbnPvb3S1+ME6m/0dFHfbQF
         NEO+jickQ8brNRykcgSRLzLQYD8yY59dpZl/cZMBWATQWG9VdSwHUSkceyfo/VnNyHHe
         JiOXM3NUFk4I/EDxiEdxgvX0MORAP+9tpN5zncLK7hEF3mZJ85KPK5/77SK4r6hZI7I9
         LMSXWJ4xm6uYiweqnOEtzwE0jcIQrwylYFkcXruDEhCGmm1oNZcG7FTJ7A6bcSx7btdT
         DdcfnFjQ13YabZidM5olEs4EkbTY4WFm9/eHKqfamNMxDYm8KnPwA8VhRFNylKci/sXM
         Nubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895479; x=1788500279;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        b=nFPIDk0Db/PF1CyB3mAmhvJ0VmSWsy7SGeG29py8nv2BAS/Gh5p/DCE2b9gpJmWfaW
         OSfzdSOfqgNDkisOWKCSAkzNcy6aGfilpMXfXljCf8RSSFBI8w4rnFOQNUWpFuDsdR1T
         1Jl2U2Lgg42zGZWVhCE+3abPyVJSnHf99Ogz/6UEcnZkoYC61gINLoYENpfVjOFznw10
         DakpMBUXxkGonrvWc4V59zZiEOGqjxFhNzpVOFQIuZe/aEDFWQS5ci1iGhFa7An5x7mt
         WRF2z0oZsZQVGXzV8+bsnPyGsLR8cgyhvUUizoLpK6OZ65uJmUHnxbUiotRctxeIloeK
         EN6g==
X-Forwarded-Encrypted: i=1; AHgh+RrO/bJpH/1yuuJYXKlRKx0nUyZFWW0wAcUn/A2tNjdtRukCJHggeg8IXupknfgcFofle2+0u+lqrg2v0rY=@vger.kernel.org
X-Gm-Message-State: AFuF++lkmbqfF4t165g0UoECuoNOrahc8zYVC0h2GsIL2oXX3uk29NGV
	FA0j4TlhS8dWpo7W2pjk7CT0RjBgGwdTbExHLzJMgmq1uzOfug2afePMQzPfVwUpASdjgzr7hyS
	EOci1oEHSvQoAjrIo0aDpG35+mtUDuAPAuwqC2fBi
X-Gm-Gg: AR+sD12X24bsyz7Hh0dN2LBIe4281PnleM3dk5S74O80EZqcKHSgrp32fwfjZCU8dzn
	828zQFXgXE+nVL4t74J5KH9qJBamwmrfF1e6GIYFi/rhenE64zDi5yWtTjN5bTjVS/D6FJ768QB
	pAiViX756X3m3XKvcHcAEo2aoFbmYL0Y6ySl97SJ5jehFwIUwbxQeegGZr1+Et3TRdYI2d2rYTZ
	XVL8Ho8joF4DKMBLzCzDHjqsNLHHPDU4uukxAa8SkDuuh025lj1u5tkuYHVj6A0D3KxNCZAUlII
	yjrTMkvzdjPhPsN1YEPS4oSWo5ebPaAHMqqaF+nHIzX/KmiwxEngTq2+6D78v8i8r62SeSYA41k
	6tF2tEnEa27cguhZmKBWAY6xQXjiNoNBV
X-Received: by 2002:a17:90b:3d88:b0:38e:5964:97a8 with SMTP id
 98e67ed59e1d1-396d0f52b40mr9523946a91.16.1787895478534; Thu, 27 Aug 2026
 22:37:58 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:57 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:57 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:37:57 -0700
X-Gm-Features: AcwNN1XzTmBYqrqtZ_dmpRR7CSc9J6NPx7Lt1tzojZpsGhuCIv_6xFEHXYoQIos
Message-ID: <CA+0ovCh-g9VVVHojVu+JoArJZvuqoiOe9rpTkv2iMNTcacMetw@mail.gmail.com>
Subject: [BUG] media: s2255: refcount_t addition on 0 in s2255_probe_v4l()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/157-media-s2255-refcount-inc-on-zero/

  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x9f/0x110,
CPU#1: kworker/1:0/24
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   refcount_warn_saturate+0x9f/0x110
   s2255_probe_v4l+0x73a/0x9e0
   s2255_probe+0xbdd/0x10a0
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
   device_add+0x7ec/0xb90
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
