Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7832B114
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231865; cv=none; b=H3BE9zlvRMdhgstzs2M4rJ2pIafa2J5A6eqxtGECu2qvZ0tWaV08w9MFQ+Ecv+CtR8hDNdeY02jH7dtosw0wkxRfd/rtu3xjmPApiQzr4v1P/KKPOn4sRWuO9XSWm4dwGYoEDNsJYq4cqKUVur1W01w0NZ8Thh8posWguBEQxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231865; c=relaxed/simple;
	bh=alwkBD/+SQUXc6OQqN4BOwQT8uua2JgeRzRa5U2y8kY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O0WZ7HVmgFNW/MqMOQHVBfPLUMVMGSMvyWk8Zbx+fx/2c0xj9s1lGli1t3c7ookHv19RI7kJOJgygZp1hGW+3eiqJqJGGkGKuN80AYVIUpgryXRg3mwIyykXdUTI45MIEwWcvfEP6zWwFRQOFe27sOvp/WU/CHjv+cANxprozhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q4h0KaET; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q4h0KaET"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso5620163a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788231863; x=1788836663; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3TdueNSyiGTL64eGdavHuKzRARmETdxICv7py0WGZo=;
        b=q4h0KaETtAlhpO/xAM8S7pXm4VcQ7A15cxx2FQOcVenHS0FuKYLfvCtA1tQ6P3QHwa
         54rP5j4npT5LYQpgmCNGdL4DWIQcOCW+hboOHmcGg4aXEVPJgK6KnA18Yfqf2II2+JEz
         6NdPZqj9bU/fndX53t8JHGM9cmBxhzXdcHQB2y79UTmD7i0Nzouxp5xyA9HnWqgDV1bn
         eSqMI/HHxrM+iKqe9+hSaqglYnsRSjhxx/rg70AA25abWVJi2wB2WuBm43koYuZRpTHz
         HjGJV36pBePE20kAjNEmsUS9ZDgAkQYBklWH0ZjOPYyx8RzUDh9OHV9g573LkVRHOKbH
         CU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231863; x=1788836663;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3TdueNSyiGTL64eGdavHuKzRARmETdxICv7py0WGZo=;
        b=r3L4ng6vVQLbXyVKH0Qn6be3z/8mszzEi8InUMfl/VfPeBHRcdxjvpYrt6bbW5WcxN
         VAsR1xz7/YX5e8XqoDLkDHC04dTnYTsZCsM4700jBLe4OaWKI8feCoM1pIaJ3OEiSFoQ
         bQGAaw2f8Y8HmvEIPzCPLc2tjIxT0tAY5E4usb78kBQ+iABTivbDQVIdV11lyYXpHf2m
         Chrn2okUL4VztcM4Rzy/YOdPSgGBmn51dYCDKEFH7aEQ0CsDkqngIoAjarwQIbzpF9vA
         xXftKdrBKyQu7xisbgV3aJQzNeSD/uO9fwSBXfYunBs3PfRgsLL+eJXcc2Nkk2kFqHXU
         s22A==
X-Forwarded-Encrypted: i=1; AKwUvByFMxp6xkKULjHonPt7F6Cee4h1mI3R4qUeMPWj6kAfaKO8WEMZV1N4Oa4RX0DvYemNGVy5hgWDhCV2BZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kiKooywjNzf4oLTvW7zcGqPGujFiDvgSsAuYl2OfU9/Yjrda8i
	Q46vG5Up4O49teBQSXfxLX0YPPswhBWWSYWEdD0UYL7gnY4u0eEnN0OVwhnb69hgkDDD4Wxf4qK
	fbaEdkRNdvCfy+w==
X-Received: from dyx8.prod.google.com ([2002:a05:693c:8208:b0:32d:dd4b:f2b8])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:54d0:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39907ab0ec5mr7583812a91.3.1788231863112;
 Mon, 31 Aug 2026 20:04:23 -0700 (PDT)
Date: Tue,  1 Sep 2026 03:04:12 +0000
In-Reply-To: <20260901030419.470246-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901030419.470246-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901030419.470246-2-cmllamas@google.com>
Subject: [PATCH v2 1/5] binder: set VM_DONTEXPAND
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support expanding VMAs. It caches the original size
under alloc->buffer_size during mmap() and expanding the VMA would only
result in a wasted virtual range. Set the VM_DONTEXPAND flag to prevent
the vma from being expanded via mremap().

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas%40google.com?part=1
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f..1b492ed48ea6 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6056,7 +6056,8 @@ static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
 		       proc->pid, vma->vm_start, vma->vm_end, "bad vm_flags", -EPERM);
 		return -EPERM;
 	}
-	vm_flags_mod(vma, VM_DONTCOPY | VM_MIXEDMAP, VM_MAYWRITE);
+	vm_flags_mod(vma, VM_DONTCOPY | VM_MIXEDMAP | VM_DONTEXPAND,
+		     VM_MAYWRITE);
 
 	vma->vm_ops = &binder_vm_ops;
 	vma->vm_private_data = proc;
-- 
2.55.0.897.gb25b4bd76c-goog

