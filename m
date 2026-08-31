Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8D3B1EE7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216113; cv=none; b=nYdx0oUc8rhVfshPn5OrG3xuYk1NzQeeS88vYthZUElmqcSglje2I7mONdpNFuMOi5VcadwvPpPB4tB0NsuCmMdtVdt/9EwS5gncUi6GudRICo0Z2easOv3aPz+wD+HeL47EZ7wjZu9mOvSUHt8G4u53DhFLcGw7vyZP3xro/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216113; c=relaxed/simple;
	bh=qqNY+gaalB1BUeI1ysAr6gavh3tsGasmZobl7QFQusY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uFd3iyctfJejXZbBYbFKzYK2rmKpoQJmY591lXfUcfeNZ7FIG0Yyj/SOgHjKkpjKPy+uo61B9da3IORb8l1oPPwPbN0HOHnhNIFNqBI0iwb2s0mlsdmTHNb4MEgrFBFlOlvHOM/SoYEdLUL743zan69hJD0qZu/AuowdCkqrrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKgiAahV; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKgiAahV"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso3546889a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788216111; x=1788820911; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTx1AgYP23AdK79jxwWFILKJics9q54j+HxKdGs0mkU=;
        b=ZKgiAahV+dkGMI/0P4IzsrC0rmZPTX9DSBs0CcTb4kR9TyEDL62fqFbMC3pIQuxnac
         /09Qh5DYtW480/vpXvIAfwSfdaY6tjBFaED/vpmjb96/bFZoNJTq2ToHyCsc1u9A1mTY
         kBHCI4/zGthxDkFW4GtnJ5/isuHgRvWc7IzH/2VyiYJAcu77xdwSpxL3dSzoU0jYHwnl
         7NXs6fSBRcGTt4ydKsMDzXNv5RD2TrzCl+ZppEm3cm93pCx8bB3VBgJuh3JU2jdseM5v
         N82I6uRbpTSUYvFqY9AmXOmyEVe2QzFWkf0Ca+DeTRjTVPMThE68d53BmAvIpypJKEBD
         vlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216111; x=1788820911;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTx1AgYP23AdK79jxwWFILKJics9q54j+HxKdGs0mkU=;
        b=TepVnGeH/v/l12jYfTCL3NbnoRtIwZsGjjJw5Xl+BhqMoY6eQhyMSL7nlWZiCbQ5tu
         rBkhfihlvEBserA8MWeUPKRLOboyTBdC1UBx6Dfs0qgaNjbR/6c21iFfvy1+KLsPOXd9
         OjuKyJeb1cbcvjtfY2xxDUq6c3tE77ZyFAcKL7U1vNAyKQSEFysgX7H0HMMoK4RjSFHA
         9aiYSq0gLrYgyeTr6yfREsDswmyFWZFgGozHVSC0UUrkMYZLYZTlL70pEiJf3Ak2jY+d
         3k7ZPwlRWW7VFSyJHOCOZ9V4yn7c23Wj6BaJ5CxjqyO2xXdYSKuQlyJwjTO1GZt2rfx9
         iapg==
X-Forwarded-Encrypted: i=1; AHgh+RpHRKnECrkVUUEWDgU5AJyO7gC4nfmu4C3r7GWyFPYxvOpAigtJdPWuDNhvvjhD7PyMT6GUPr/fihSp7zc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkzFmjZjjHerWGeYUqefBT8ICJ+olPD7upWSwpU/CdRxe0sSXG
	7pqOcmrdWWaDg+tzI9h+lauG7Gqga6qQI3a5bIe8R6M4xcligS+SM6Lb77iU9xUixTZWQqc0kni
	9C/BKlXu0RRpjWg==
X-Received: from dyhb8.prod.google.com ([2002:a05:7300:1488:b0:328:604e:75b6])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cfad:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3d7af833c9dmr6569943637.17.1788216111235;
 Mon, 31 Aug 2026 15:41:51 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:41:42 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260831224145.169403-1-cmllamas@google.com>
Subject: [PATCH 1/2] binder: reject mremap()
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
index 8f2ef1bd539f..6c12e502740f 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6032,10 +6032,16 @@ VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
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

