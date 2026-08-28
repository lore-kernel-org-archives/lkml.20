Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC29390C88
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887220; cv=pass; b=P/BIouzATBnI4UuKigL94B3Eliwz/gd3lIcJ9Ne8GOMiUkHE3ZqdrGtyBt8/FCch66Cid1omP303buYyODs3pGvL8GH5eRI3CbWmDbiOEa4iHYbumaOoPgHyGIpiODonFiaoJ843K3OTvzINGf8FuHlLd4oL2uzenCaiWsC3ym4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887220; c=relaxed/simple;
	bh=kgHpO2Ikl4Ztbxpz8203R5O5XVv1oa1S0z5Gk6TuZi4=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=T3OORMbVv+15I9cSjZS8PB51iq+8xH0G1B38NgvysEGLfAoDF98XJmHoERFFdMUx49MFnFSeOg8KG94YnaLJljXz5Um9/3IcbjehYppqYEd2CyuDcu94dJhyJDK/SoGr4w5b1Ob/eSWN0DkHPtvYiheOT5nITzVse8T543xQkU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=tKLwrADA; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="tKLwrADA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca80d708489so361757a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887218; cv=none;
        d=google.com; s=arc-20260327;
        b=EWgVimy3AXFF3rzwA6kUajqeAEkJqbLc524FZWHq/jS7KJ0UHydVNuQMh61K+2Nqof
         7qU3boSZJRdo1R3ViZF5tNTC5zS1iyYGN2lXK+r0fxuLq2D4DNKQ/PPRhBblP3GsUf0C
         oTY/eRSRBsU4lcv5+TEe/CUeyfWyAfLDmeDnap3F8xbItGjJNhED1IulD+ciFtBsY6NI
         K6TE4+YYN7iz6D4V+yjjtGWS7yQhvnv0Nd2UZT0twk6MnuxCgBOTtpNOPnLwKn2hOmaZ
         p1AXMsBeYdDFW7OzOUKpW12KkR0/+ruvsZr1+ufnEHaCnMOsiJW+mFiO+9z/MHHfs5Qa
         GySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=F6UJtsnO3smK3JOOScTEcLd4724T7H6H5aWAEuAo5YY=;
        fh=HQvnka6YOrdhc+kZn/HMm8/8Tyb6yc1y+KKJ7AIkK3E=;
        b=UkgaBXf+r+VVOdRkPM1k4XPWYu0+VS6E4GgGUlKOxVBeDqgkw/Hz+hDK/0mMDNUSGq
         1L/pkzTYzzRuJmpLRx0N1jEAfje924tzbaMwQQ2VwOPDn0/5qFxnw4xMmieTzLKXQacq
         hRXJTIjAFc0SBdD+MVFbHoCiKFVbI2w+L3U3dlN7u1My4Omxl6qyNPd8OjbDWXeHAcGD
         /lREmN4gtpw3TuvIdTdIUsd3QXyL+KUB0Oupx8KeLarK0Ts+vGST3ajMiOcZ1db1Cm3M
         yjHNB9LexbL3jbOUnYv1FKH40f5LTBySkR+lRGcveQ6iemybo+ntjF8LVQtBDm5ZmwnY
         x/0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887218; x=1788492018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6UJtsnO3smK3JOOScTEcLd4724T7H6H5aWAEuAo5YY=;
        b=tKLwrADAz6eynQDNZYNbAQntzfP/dT9YD7dJsKa5k+fzlY2gFXhYza2HDwispuy2BP
         l0K/sPIP5SM+KZBHadwzOBlxN2NnYjLNqOH2ufF4txiF0zFXYUnO77vdMeolj5yZgd6m
         ECVkl0NGFasm69Uv3vRTimOBTV9pNChUlMddDCCk3hZ2bz8rmrfjjCcC18k4cQ3X5fJU
         sXMd7JV1ws6vCAQA2VYakGhgqZOgZjen410g/2xXHpHIctirOuzEB7YKwUmWjAwUc2LR
         6BSwxGPRGDmWmMujAjCnfjkmLEaSKMHCDpNIDRyUA4ujlpp/2yWBsiaUnzFD2z4nuMy9
         fVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887218; x=1788492018;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6UJtsnO3smK3JOOScTEcLd4724T7H6H5aWAEuAo5YY=;
        b=LOILW2wx+NSwGebzC8ojo/4AwxYXD8jzhR6BEEtxdnJyPQ5Kh9Vy2Kwkd9TF1T63eP
         aD2D13dIw5A/iI3exhmkWFbLrCB2n7iWzG0ANYT3FwBGBtPpz7NeqM3fauCUYsfo0ykN
         x2Vo0lW+BOpk9cIDmbAPTm3KrHkgmfCGY1xlaD+c9PFFH3K/WPkLLRq23wZwaAGGpfuI
         aIUqD7BbxNX7iGOgrUG1VvtsFFTzbYU/P+x9S/ToKpu6ARDOAYS0wt3bWEaEDee1eCb8
         XhL4YIoqOLrWCzOCyoiJQNhiwwaFKCptSZDzqu34FiH5qhyadRaimNULR4SXdAwI5G0U
         UVzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmKh0cxJ8xbJ0p1DdsiuovTZFkQ8MsAUgXwk9SqxrLxkL8Td1ATB7DmlPQT4Vu7xL/oK9m0K3NslUKxE4=@vger.kernel.org
X-Gm-Message-State: AFuF++n4n35ZsMNVbfKPsOeKhIxMQ00ANgVjym9kKtPL1k6oyDIpn9DG
	7pK5UedIs672x7HaccUhkSNR5YWPUA54KqxFNqd6sK6B6DaOpBlseGqH411f+UW/IApFROBIRlg
	0za+U8mklWmlZM/EgMFvWsJOkhIbbYzYJKld1CX4e
X-Gm-Gg: AR+sD138/pFmTDxLufg6xIEwx0O61Tnc65FWklNczLyCrr9HuhhzLdjVh7fmhnrW6qs
	KSzn1vhEKO4z+wNDTnbVCm8FHqJVEOYhh9U0V6P/ACVBUiUi7VTcQh6rL21aqXX9cfpfmzBrSTZ
	LGW08LrwGigQytIHG1Xspqd1KMhKRiWrEiXiHEuzkWyBerckIqVEfQd5VUIDdLFx5dJECF04xaY
	DbDG8zGZwl/miinH6ylDuE6i4l1VErPcYFpKHby0N6ytz6/tpaDr/R4Oe54Gq5S3XMJ+j0+NIlZ
	sb2CDjX4BwsSgLDPXlVYCv8/qXOp4WEBcdHtF5UjOVRagf+6LQhYAsLeDZcc1lfFdsFpLZFu7dw
	j7ZKENiFNdLBQBPkVI5IvUYG30iEHK/Yf
X-Received: by 2002:a17:90b:1dce:b0:38e:9ca8:e99 with SMTP id
 98e67ed59e1d1-396d0eba0c5mr4301675a91.5.1787887217137; Thu, 27 Aug 2026
 20:20:17 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:20:16 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:20:16 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:20:16 -0700
X-Gm-Features: AcwNN1Wm0pwvO_rSErBnx6PmCrW9fJmfgjFCdZ4KE09JBGrDp_V9cwPpkUpgGWA
Message-ID: <CA+0ovCiBsLEjFZ7-=MGtMQix8HMgsp5WQJbVqb70dPqyHSZiTQ@mail.gmail.com>
Subject: [BUG] free_irq -- mei_me_probe error path frees an IRQ it never acquired
To: Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/130-mei_me-free_irq-never-acquired/

  genirq: Flags mismatch irq 0. 00000080 (mei_me) vs. 00215a00 (timer)
  mei_me 0000:00:01.0: request_threaded_irq failure. irq = 0
  Trying to free already-free IRQ 0
  WARNING: kernel/irq/manage.c:1879 at __free_irq
kernel/irq/manage.c:1879 [inline], CPU#1: kworker/u10:0/27
  WARNING: kernel/irq/manage.c:1879 at free_irq+0x292/0x8b0
kernel/irq/manage.c:2018, CPU#1: kworker/u10:0/27
  Workqueue: async async_run_entry_fn
  Call Trace:
   free_irq+0x292/0x8b0 kernel/irq/manage.c:2018
   mei_me_probe+0x672/0x820 drivers/misc/mei/pci-me.c:295
   pci_device_probe+0x461/0xa50 drivers/pci/pci-driver.c:489
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
   __driver_attach_async_helper+0x128/0x290 drivers/base/dd.c:1227

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
