Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605A411A18
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231869; cv=none; b=NJhoMvViHkqUj8mrYMzpNknX6ucuJeYN0YQ5iv3NaYrHMsfqQlcwKfV4PtUhdrn6ECVZGr0vd6tKJ608Od5XtbGpTwoYIRFxzPMuKZvRQ4eS5eLbfFaT/UUbhr/ieb1RW7mvM13aorjlgyDPswD4g1TKP9NsI80KP3H6TFxFLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231869; c=relaxed/simple;
	bh=FYJGCs95rbkXTqTszYu9UYLZw63d0p3ONXrb2Y+bMxg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P9FGUeZcZXiZGfwBuHG+Pz4SmEhdn8ho1jOdcGTuUNpCje56OYBmkB6rzDhnQdyEN4iTE5gTosH5TyAr0YNy9BxTtpuuCc6WKa7Z4ykkTy9eN9VBJsh6fUnRetAtyAFYLWU9ry+a+gLTdAdxoBTjyjdM1vrRPfDKxTjGV0f22X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vt/prHi4; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vt/prHi4"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so6316238a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788231867; x=1788836667; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72CFr2m2ySU0zy95uI9pzFm3dRMmgX65Gs74KePjPwg=;
        b=vt/prHi4HgO+sEC9NTa/4D8Mq6EEvOrJZljj9LK00yCWbiUj950MKZrGFyXFmQ0uyx
         9gyzbIvz8hXGU7O+AG2wUNpDsFb60B6X1vwi1i/QGBrjqXI01OyC8cfOyHtS+vVhLTGL
         HdegrcyH7bLBlY8Vvm+PyHqcshBygxfvyQqdIXrcc6yyBpvuWAPmW7bPCwS27/y/qJRa
         IKyUqjAR/6lGFPo9cw1AV19WLHi3fTcmBtMIwOemA42l88gJaboYipa9+R/uBbj417+w
         V39pnL67xevnvO40Paw5sCGD7VO3u1T/UvSsAF2wAchua/N3qS8r9W1balVL6BAkcLWY
         rjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231867; x=1788836667;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72CFr2m2ySU0zy95uI9pzFm3dRMmgX65Gs74KePjPwg=;
        b=Wt97VjZHlFjCdPCfTGLIo3TRScdmgaN0PpIXGJJNAtOCVhDVbfKnXFWCs+lvX0m0yg
         U6eQ5poBwxnDovOAsRC6ZC4P+s4Uy4/0edOmtFf/fuq2p79KOk//NkiclqcnPmnpEms/
         7eYjzKHAZgOUWyIPkZVdNOJ9Z3/KQY3Sh9NczBVpEKLSkgR4Kn32NNTmVLmsYsc88Ock
         yI0YOX3EAvJ+h7sxIG5lRy6davRxEFTkfde/xOvF9FAB2HT6ddAWnRBvfEXQV5lHJB8S
         ZXfklm05PSPgJLG1XRljhPx1p5LkuOaiDLArK8AldiffhSpmQf0szZghKjcW1w9bRxtP
         044w==
X-Forwarded-Encrypted: i=1; AKwUvBxr66D/uvxK6Bde8GIhYHk5TZ+NA4y/w0OlHgdPtMkkC+lCC3GDL0BihQLAba3m9ZmqpIhTSNM0zUC98eE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAndRhNF06+a/XKIOKRdh5Wu6hvJt7c3Hr1WeK6BWFGiJINRuQ
	scIVygBJe9WjkrlXwhcJMHvzZD7+8b0puyoXiy5OQxDLwLkfU/53OoRGbEbrrgBY+KTfQcjAuNg
	ueN3DzW5qgLAoiQ==
X-Received: from dlbtp2.prod.google.com ([2002:a05:7022:3b82:b0:141:2c5a:38a5])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a52:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-396d0eda189mr41806788a91.10.1788231866976;
 Mon, 31 Aug 2026 20:04:26 -0700 (PDT)
Date: Tue,  1 Sep 2026 03:04:15 +0000
In-Reply-To: <20260901030419.470246-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901030419.470246-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901030419.470246-5-cmllamas@google.com>
Subject: [PATCH v2 4/5] binder: reject mremap()
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
index 3ec3a77af106..76fc2edc1937 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6035,10 +6035,16 @@ VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
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
2.55.0.897.gb25b4bd76c-goog

