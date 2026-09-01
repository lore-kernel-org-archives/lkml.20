Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68B7483806
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280532; cv=none; b=VLXphPDn176gATs54h1uVABBrh54Kkeme5SNDPE3JDmCF3UFlYWgc/EOfBo0ubqACzTLLMUaThtr+c50lJPOSJ94/GPwxfCgY0PDFYbuq5cjORpUmXr/YF9CpaNMyzC50aeyh4tAB0DYzfVOwYbq8fhOfAUEp/F3EmkBFBtaQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280532; c=relaxed/simple;
	bh=GF/bVHokF5FXjZ+g0nsyqkLr5qbnoJSW65kdmui+Z90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qykww/XezP+ef157ZJGyBNzs75Nvfa4QxjWuW5ewTnzVPx1P0VLGQq8cH3mW/W8v4qrpxFfSCcG7Yg86JxSviBxQ5DqfHTUm6ov5pAjZ4dS2gavY4MP96xRgwfKHH4+sSNygAB5XBBbNVctYwZ7PDEI171XreuU/3C/hvVBFREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnogmpqx; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnogmpqx"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso12432a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788280530; x=1788885330; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1Px1YjhukNKpiGIzc6xWlYh1IDxs7EUGnftJx4GC/M=;
        b=vnogmpqxe/vBz7mSfzQ9Mq+0Uw9pn6X88u21weea1t8cmt6jd1l+KGl4/Ijp3rH+fm
         XrEP9nNPSk6wafORYRWwLoVLVzY8kdAqz7fsQP0eTgFfSfLtn8fdeoCo+f+jMOSlKxro
         xNtz4zjiK28aH8pKvf0tJ7dczE7W5CpcXS/vdSVzY/wBi63kO/Hjzy8P2hp9omN/HFyD
         ITrrRE5yWXqj+ny1BzbctPU/CCat043XCZ/ipoXaOb1xuyasAstocJV8FUBo7zYi8AkU
         4FqI1ZZTwiEVDqbEp2k/3/ZwYWTQmZc4aDuDkp8cfyKKUljuJb7hQSIAeMHpQ38DHjNO
         BG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280530; x=1788885330;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1Px1YjhukNKpiGIzc6xWlYh1IDxs7EUGnftJx4GC/M=;
        b=BP2kUwIdFzW5E/fBXti4jpJBTTbV9PtwYIidTVoaulhYbWxejrIv59xLG3+//hO3Ai
         dTR5pbc3CzrTYcz18mxf8YZfJAPu22UIPHjR6uZ/ULIctbuUaaL4pfZfdL0/2F3Pxu3i
         2vVIxlGhABlbu3wa+vk1rMAoKxDtgCTa0M3aK8vlQ7ZPrv00ulsZZbwSYFdIOEC+HOPv
         s6eQ0RERp9nLk7hhLm8NCU7LB2hbb5vu3uZ48Su5X2u26QYMwfAvAHM/WXrk2f8YOEBd
         rQgmc1StOsddZ3ASV1YokbDn4Kp5E88xlzp1g4wvNQXzY2R4roYWQ0aV8OGT8HGaKcmb
         gN3A==
X-Forwarded-Encrypted: i=1; AKwUvBzVL5BAE/B96IUEe6IpP7TOCbrIPkEpp8iib1P6HNTt9MAxN3lgdyi6q1xQh3kPbsu2KyUNnSfXd1cSwIE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Fh8Tqg+ZaGirDhFYlmkSLwti0fh/RP8brngogC/t3gX86XcL
	Zv08TkAcARiRbcvWbMc9T6Sz0kr8KZVpBTTaLeU5QaNWIvZX1cD7n2K2/B16N3fLucFpmwNCB4W
	KXaptbQ3+gd+zQQ==
X-Received: from dybrx10.prod.google.com ([2002:a05:7301:4e8a:b0:314:f5d2:b3f3])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5827:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39907d6909fmr15493354a91.14.1788280529991;
 Tue, 01 Sep 2026 09:35:29 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:35:17 +0000
In-Reply-To: <20260901163521.1355535-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901163521.1355535-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901163521.1355535-5-cmllamas@google.com>
Subject: [PATCH v3 4/5] binder: reject mremap()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support mremap() as it caches the mapping address in
alloc->vm_start. Moving the mapping breaks the IPC communication for the
process and can temporarily leak pages during a shrinker reclaim.

Fix this by explicitly rejecting the .mremap() operation.

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb%40google.com?part=2
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 59ff436f1138..0e6d6f6923d2 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6036,10 +6036,16 @@ VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
 }
 EXPORT_SYMBOL_IF_KUNIT(binder_vm_fault);
 
+static int binder_mremap(struct vm_area_struct *vma)
+{
+	return -EINVAL;
+}
+
 static const struct vm_operations_struct binder_vm_ops = {
 	.open = binder_vma_open,
 	.close = binder_vma_close,
 	.fault = binder_vm_fault,
+	.mremap = binder_mremap,
 };
 
 static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
-- 
2.55.0.966.g6673acef38-goog

