Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152C42E8DC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054027; cv=none; b=RH099yCdX5TbG74araAsxzDH+Qpf1K87bD0vvGRoSxX8ibt4bDu8GvPoB+mezJW5uPKhVC/WBWzqBfqATJlcfilAU9xAFOGstp9HmzV4BDMoFTq/kt8/F90pYNTHBoklD90/LLSKpMQVkuWu3z7qmSMIAFEq0C+yYjiTIyj9sRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054027; c=relaxed/simple;
	bh=HOcRnjQ/78+UziIir9oKy8ANLOoA8o6bAT5N5PtLkpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPDRJ02k85EVoZLaj+HOmLoEZcRiLtocmP0T6Q5e09eFXzbH5aqNLWE00ts6RvLvDc4qsA8V8GfVv8NRtBV9Kbju9uRcQRjuuJIMfojMA6t+InKYD3mHEkmN79tpiesSKC3dS4ItuFNZqUnr2LalJSAdR7F5cjre/sRGYMsfSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXfj5Hb2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXfj5Hb2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso710751b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054026; x=1792658826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYttvjru9fKHemUV/qFF+L5++eupMPrrcmnwQVMAKQQ=;
        b=XXfj5Hb2/vHfMhAXzMo+GL7tEdt8m0i0jRrMwVGm/uZW3CXMZ1tkR7fu6O702RKbqi
         gMdkjMgOshedqjlYDUd2Gr3HCJ48G9pPFbui0mvE9CxVqraMqFRPRtRh6R3zxyu6iGTK
         IoNA9eCW+d7AXren7o61t30JJraJRIBBpLaGspOePTzWKYkCW8HCb7RWmG83yGjEHNGX
         Wb21weEyBin4oRkd/3Vxd8yjDHvv3HGRtEKv3alfBjGIiqXXYh4Uq8wZ7uSg3K4B52vn
         IarERUf5N+8vNo+oZBwkgC1KmiGwNq1oz98toBbg8FbS8ourPLbqlY1eZB7a7E2VnKyD
         9nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054026; x=1792658826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYttvjru9fKHemUV/qFF+L5++eupMPrrcmnwQVMAKQQ=;
        b=bK4gNEmhan8gxiHbsF3xDy1ROg1X2lREkWnM7oHd/j5hw5SWsmOpTLVxAzNs9FuBXX
         FcdbBrSIRb4Y4GgJ6AFR5abifVvEDJJe6NaP2UuPTgT4eLG45qP1HwlpAIxFUDXSFvU2
         8eOJvXlNvVqL6u66DSObcP9wLkJCduvY2O64K6+UILZPetCY8bwLg6i1lsz9RWwL6nNq
         3nAFyVXxbD76yFzVedlkGz5IVUvLDZytmhAfOfPZ9p3Do2uEGl6yRb+UBJTIkRyFSPSg
         gZJoPFupUrrXpjQKo1/mAgJF3x5+OJOUhe4JkFgRaSqPR2OWrPkgtWkkHh9a+1vK/brd
         JV3Q==
X-Forwarded-Encrypted: i=1; AKwUvBySjXy/PkafY1zWcRbrX0/trKgKHDjnvRyHL+7PH+03PE2J77TYeYf8jG4cg1rnlF5vd7wnvHIreM+Clrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqgwe2xH21IK58tu+k8xXWI3wZZvcPDyA/gTMTiqv3WwEwqzT1
	+se6Dck6pPRknFIXfQioJZuomfejNqBd13ls2v8oC76Ep835TMq2YDyu
X-Gm-Gg: AYBFou0ZfJDimBGWEdZHpyZiwgUqmNJFZxSvF3ARakTf76fwLP5x6uy3op5MnFeYHh4
	ruN5INDs+F9ckHoVYoXOhxsm5dY/+N/Kz8t8HiD+lk2y3Clwc+De7HQLCVAL2ameaLJIm+VTEGM
	mYBymxtUzfTr1+xu2alIHP37gkJIKziSbHuhlU83Z+onLNjAqU77CQKqsMfrrGoniw5EeS+1NXL
	e8RSxJittZXhzgCxfEQJiz8A8+f1GwMr9SrrHQDIsVZUPJ+RpUI2v8HX2FGdFh3V7eZRvEioyNS
	tJVv9Gn2pt6I3cP4k0nfKp2+I8MlIdHKYf5ZzccfWTVyA1Jk+UsUUAww6HujwBpZTYjkYYYdyVK
	kDkL1XwflFVbdy5cwB/HkaVdIsz/k5XmuQT1IbCsyf5i57EayxGmFZYaBw/S8Hh2kSk4kHltJ2r
	Ef3E43DRzgQsreC2cbtYwPjaisElWdyB4Miss4PAr8iSx9+xn+HQ4X2cwY1WB6IhruCjJ70n4yo
	NkpyQTssbe8u473iETgJm+hhEmBFLoseEQzDjU6pISIPtXJkdcOxZRy7arTgqXwDjF1ti1nDSkA
	vp7obo25tVvokIMk7tQp6jkw91+g7RPs9QzxppIsJZ0svCHv
X-Received: by 2002:a05:6a21:490d:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3e16bb71b3amr16357663637.10.1792054025821;
        Thu, 15 Oct 2026 01:47:05 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c57517sm900574a12.13.2026.10.15.01.47.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 01:47:05 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] usb: gadget: f_printer: fix pnp_string use-after-free on reconfigure
Date: Thu, 15 Oct 2026 18:46:58 +1000
Message-ID: <20261015084658.70918-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_printer_opts_pnp_string_store() replaces opts->pnp_string with
kfree(old) + kstrndup(new) under opts->lock only, with no opts->refcnt
guard, so the IEEE-1284 ID string can be changed while the function is
bound and the gadget is enumerated.

printer_func_setup() answers the host GET_DEVICE_ID class request from
(soft)irq context and reads the string with no lock:

	value = strlen(*dev->pnp_string);
	...
	memcpy(buf + 2, *dev->pnp_string, value);

dev->pnp_string points at &opts->pnp_string, so a concurrent configfs
write that frees the old string races the setup read -> use-after-free.

KASAN, a configfs writer racing a host GET_DEVICE_ID (reproduced over
dummy_hcd):

  BUG: KASAN: slab-use-after-free in strlen+0xe/0x40
  Read of size 1 at addr ffff888005036000 by task swapper/1/0
  Call Trace:
   <IRQ>
   strlen+0xe/0x40
   printer_func_setup+0x410/0x890
   composite_setup+0x67e/0x4690
   configfs_composite_setup+0xbb/0xd0
   dummy_timer+0x1934/0x1e40
   __hrtimer_run_queues+0x1b6/0x410
   hrtimer_run_softirq+0x13a/0x260
  Allocated by task 3486:
   kstrndup+0xb2/0x130
   f_printer_opts_pnp_string_store+0x3f/0xf0
   configfs_write_iter+0x1a7/0x250
   vfs_write+0x5df/0x940
   ksys_write+0xfd/0x1e0

The setup path runs in atomic context and cannot take opts->lock, so
serialize by refusing to change pnp_string while the function is
instantiated, exactly as the sibling f_printer_opts_q_len_store() already
does for q_len.  While the function is bound the string is then stable
for the lifetime of the live reader; it can still be changed when the
function is not linked into a gadget.

Fixes: 24b7ba2f88e0 ("usb: gadget: function: fix dangling pnp_string in f_printer.c")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
Tested-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1111111..2222222 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1269,6 +1269,11 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,

 	mutex_lock(&opts->lock);

+	if (opts->refcnt) {
+		result = -EBUSY;
+		goto unlock;
+	}
+
 	new_pnp = kstrndup(page, len, GFP_KERNEL);
 	if (!new_pnp) {
 		result = -ENOMEM;
--
2.43.0
