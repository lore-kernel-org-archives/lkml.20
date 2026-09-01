Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61F466B63
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295979; cv=none; b=G6ZfqjFl3RfFVtEWCuy4ZNzhr9nk0Zp3KpINFHKnW6Lr7aoHVdR98iu6+Igeg00ZdYPL2TKSvz4y/uqCwPmdoT15PPOUFz2qHYwEWhNTDdqnrxE6VJxg6wwOGn0BglUnf/2WsTTmxGxastk4r+jlLmmgFvtVE0FZ+zrVmaQVPzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295979; c=relaxed/simple;
	bh=mC01VX1n7muqMaBoWw5J7zX+JcinZQb0IpbAjZAJoWg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rknok9jL1qrC9hVzsbZ5L/5IF4RlEeryx2hnc5mqmsCst5+Faq7HiGM85+uyzc/8P9gvfgRLBtPuZU/grJEjcDV+IfD5HfEXL7GyLVhXB+/OEyJk8mvHu6mvxPFh6iBsNzckwLsPWEmDaN3naF9ASg7D/ofLr6nCURvFOWKxvWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MQzoiVT1; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MQzoiVT1"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so234383a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295976; x=1788900776; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zocSb9A1qfC5TL5NRNiwUw0+UxJIZxHTRhrF7BbbrB0=;
        b=MQzoiVT1Y2bEl7t4/tMFXOGz6gcgV9h6I/ENOIWVQy289NffZqaVD3bcSnc7m/PvLH
         v7EaHE6WGvYhDxZx8pii+XxhOiOeeCSKxjkXvE7DYk40JoQjdrY8S4vauo8V52B3DKkU
         iMs4QJ8njowrYRwpRNzbPQKHmwFLvPO0XgFQOyWMXsPMF7trE4GzbgD3IxUvECraUHuO
         3XCS1jXGjPlX9NBTBYoN6SLlVY/olUA0mS8sxvkYyXU0zTrsjpH1F2/gLRbTELOzHUvS
         QtzhPaLy5Fv8T8c7kN1LznZAXG6XJA7jgDaoVjwhkQghIF0uVTx/VLs7ymPhSFMyuHGb
         5HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295976; x=1788900776;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zocSb9A1qfC5TL5NRNiwUw0+UxJIZxHTRhrF7BbbrB0=;
        b=bwbMeXSShwt4im7CfFNzbB78dQQuoACFkG41O0w9E4jaAHEmHgxzCQTSWlw1vbmOmk
         B2rgbgF37xlwx1/VfARiBRVrIW1S6O9zoBF9AXBTXZeMW0rKgkH0Qjk09VMXvY/ddNoO
         bpJ/pmdsugRALCvqFqW28eBjr7PaMck60P0I4JB1Ph+iNJtMKAUWwPq82BTEC39AKRrw
         XV2jDTLGuYbobS3KYj2/aF0sNXB7aB95g+4RpnYw1OEzonlVhUcH90syDP8NDndEtQuI
         HKvH5xnbQ21IAQwzmeb/Ht5Rh76IbQOd/XNtgomWhr8yINq3Mr2Rpl9ZXQkaBMW5Dfbo
         SncA==
X-Forwarded-Encrypted: i=1; AKwUvBw3eFMEqxrMyZl2Fud0xdoRRC0XuhlR/XAJ46WTSII5Vaz7bvUqiok+EBDWy0ofuTMcP7D+aoGvEun7jUA=@vger.kernel.org
X-Gm-Message-State: AFuF++m2U4nTbn9etM3e1hiDNS+a5ZI1ki+vPEDslI8VK1ZDMVnS9/45
	xiOHYOvKbxET5Yjaz92MEFuEDeA18inbieVjxJIpgBxoHRQi5X41zlM4QUKUbqcusdwxEf5NsP2
	r7JsjJtwJUvKeHA==
X-Received: from dybla10.prod.google.com ([2002:a05:7301:1a8a:b0:32e:7e7e:22ff])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2410:b0:2d9:2b1b:878a with SMTP id d9443c01a7336-2d9526c2cdfmr76986075ad.10.1788295976098;
 Tue, 01 Sep 2026 13:52:56 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:41 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-2-cmllamas@google.com>
Subject: [PATCH v4 1/7] binder: set VM_DONTEXPAND
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
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas@google.com?part=1
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
2.55.0.966.g6673acef38-goog

