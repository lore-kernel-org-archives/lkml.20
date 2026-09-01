Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1948167D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280530; cv=none; b=rKzDuDuiiT9bjIypIqXdQEB/V/+ELzzLTI9u4aX1yj0N1te4ezioMOCqUCcPZ/gw0rz9tkzY6Y+ZOmDOH10RHU/zOrUUnvyyl912bPpGdByAQjhUTpnTmL4kNRYRrW3u/7Iwmkr0br7y6V4r00LGCy8Uc+AMYps9FXwhXKGcixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280530; c=relaxed/simple;
	bh=hu/IbFNnTPszKMIhPjq4a+4Cu+oiVtMDsWGda3p00DU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sdV39IkcD2KEIktlPOKCImMDY2hf+yqhD52RlxpPO+F7YEncYL1/ZFv4ntExiFKlXYbjhjmkoGYV8c5vRLUb1iIDeGv/UrgjcRPhMToWqIIes9lNUGmR5rsRM9NEl9+kpPaBCuuz5sJKs82q/C05HyujfsupH2d/LFz86tws5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvkihqJA; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvkihqJA"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so87115a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788280529; x=1788885329; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uaVU7Y38geHLJxnPBb9TaaFKTDZvM/A8qN/l+64928=;
        b=CvkihqJA2qpPL1UQ3oJ6e7TAj4ayw/tKeAgNn9zMKeErFpN1j96lHfY4IOICZrpZb4
         so12zVU5egPQmOfGMd9eSnfBu8cpYtSmW9BFFoq/JodeK0eHwBmwUfRilY9+WtNpfxUW
         hgqaokLnH83uzv9/pbFUQBGADgXjBLx28bCALvIM3slUJkx9lr6adeYUuEl7D7UlWU8T
         e/nnogtKR+BFCwtGU5sKlCs1oD/5uwlzyOjHvPRrWoY8uQgp7e+bs2FEHhOMBRRvxETJ
         3FqA6Z4vSs3laeqiObIsx9YjVCAnKN3zF+m5t4EHWpXnI+bWUi4ot+H67HoCBA1TOyS7
         erbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280529; x=1788885329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uaVU7Y38geHLJxnPBb9TaaFKTDZvM/A8qN/l+64928=;
        b=VzTq6oNUgniyy+98mbPrkMTcY9YFaXeJ+WVcHD5xC7e2Q63ZvqBw+ArBZCZum1ZdSi
         VerIbXDTBu8cs1Ma4FPkj9ZpKMEvGR/KcIStutyTq7/AlMqQxl08JirqEz3729P/kSp2
         btV6jHsSV36D5oAZTHReo4r6YRygQ8Ai2chF5RanJ1Kas276M01auO6kGolIhftETrM4
         1tEtPWBDlvalcwdIcqwhuS8AAozv3waH2X8HTINYOKbZcZriDJTHPseuakSu3HvR0TfE
         PE1cmdlZ7ONcxID1zEJya6JSAKn+R1wO3N1f0ih4etcZn08P/BMT7RD14DDq8DlBXiV2
         wWig==
X-Forwarded-Encrypted: i=1; AKwUvByreYhfFFaoh67lmiRtvPa/Fh6NZyBi0Lfn3bwGpmpeleNv4vgRxIGWUMmjfiE67kmaCCeKDXg1Ty5GSb4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+2xepAted9TJcafr46PRLXMof8fMYAZn883yS4ypJzU9cX4hu
	4l1XfnSBnrbNQx3BIrNsoOIShFzTmY8MjSarm/7ZHlZcw9kCs7n1K7XgX/uiHloYAfgL4X5o08C
	Z7r5PNzN0wN+erg==
X-Received: from dybgt3.prod.google.com ([2002:a05:7301:2203:b0:327:d6cb:19b8])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1e05:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-3989bd54c4emr33067004a91.19.1788280528732;
 Tue, 01 Sep 2026 09:35:28 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:35:16 +0000
In-Reply-To: <20260901163521.1355535-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901163521.1355535-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901163521.1355535-4-cmllamas@google.com>
Subject: [PATCH v3 3/5] binder: check vma->vm_start in binder_vma_close()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Certain operations like a failed mremap() might trigger vm_ops->close()
on temporary mappings. To avoid tearing-down the main binder mapping on
these, let's verify that the VMA is within the expected address range.

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas%40google.com?part=1
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 1b492ed48ea6..59ff436f1138 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6018,6 +6018,10 @@ static void binder_vma_close(struct vm_area_struct *vma)
 {
 	struct binder_proc *proc = vma->vm_private_data;
 
+	if (vma->vm_start < proc->alloc.vm_start ||
+	    vma->vm_start >= (proc->alloc.vm_start + proc->alloc.buffer_size))
+		return;
+
 	binder_debug(BINDER_DEBUG_OPEN_CLOSE,
 		     "%d close vm area %lx-%lx (%ld K) vma %lx pagep %lx\n",
 		     proc->pid, vma->vm_start, vma->vm_end,
-- 
2.55.0.966.g6673acef38-goog

