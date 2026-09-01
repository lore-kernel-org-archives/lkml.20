Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D0466B44
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295977; cv=none; b=iY4bv4bwZ4V1Xq2VMeVomJaEiU3Hk6mSqIRaXIRefhDHzoDWCP+enxug9nJGEdbC7Mi+HAEzJwO8wFDxoWT1bavGTk3zY9X2ybSWXCajlTDbwTN8BNF7UpQlgDoi6h+JOEAwP5PFY6+Ca8QShNZiW8jKdYB65+hTtlfAOjpBVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295977; c=relaxed/simple;
	bh=GalQVnETsOUCH18MBLfCytWSrmZAkH25hzBlWdJxBZE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iFpSjAQfpxo5ffCN9y8LskIACTKomFHz3V7+4R/Pw09jg+rmmlPJYio+MVAYy13MlNvilDSg8xHXd165/hhSQGia0XivmVWQacXtmY4fObttinZKqYl4mp4QSyeS4v+6zb0g0mJ9p81NImvEAAc+Z2+NnehLm3qGK6cJYPCI0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VncqEckO; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VncqEckO"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso374830b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295975; x=1788900775; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmod3MZvKZiKOSiWTYgLk07xjBocBxff8A2+1S6J5fk=;
        b=VncqEckO/lVz8Ese9shZK8SVAIwE32rOtvk9Wnr/M4OCZ2G6mFkhg3vwN1AMTC/pM0
         ozgWM4G2KZBzi8xNK9cSvhUt6V1rKB4UMexU7D+ibrB2rRzoQEdIIRhOtzpcKvZcAgyS
         5bswk7V9vLrTA0bsTJtCjv/v24N2FEtDANTvzJPumNwFLl6Xgbkvf99ZrazYWUpfA7O9
         LKPvxr0OjHGwXit0bn6D4SrsYDIt7sdIA50Xrx9tOBzmE/gmgPcy63CnCQfiWvgElHdY
         IbnJxhfmwhpkbv1s8qz4qnDb7R7vt4mubrpx2bYCQWXrPsblPe7ikLgbvSrgLEcFwala
         VxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295975; x=1788900775;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmod3MZvKZiKOSiWTYgLk07xjBocBxff8A2+1S6J5fk=;
        b=HxZFmYK1uSZHjIChfly6yGNxaJV3uDw4UlqM6irgYvBTzMAJur/Ehyq9HxyL8HndgS
         cf0OTqRa4eo3ZDnZ442t6peVGyqQ58Ui88dcFH8hoJhOhjgkrk2Ml0WxcqwgJek4kuUZ
         taXjQqm9p9S7YP4dXb9UWUxud6cfiYEINxXU+JGZUOuSg6WGvXPt3DPBxFslD1VmBPXx
         P7FvUghADRn+pGn4tMS231P9foy8k9AG8jYiFmJi3x3eNu+eKUanFqnjZ1OqHJSTM3Qv
         tOpQ24xjo+76lM60iIRqUp28ns9t171bizxDH2Qouheldf1B9sGVrJt/Vt2d8h/TBhmr
         kVRg==
X-Forwarded-Encrypted: i=1; AHgh+RpYgPrXlxf44JgP4my0/hKwIaQDPAxyYYUnpTaDxWs/V9UXP/ZD4M4htpgpNq2pN+UFfL188vlmLwRz8gY=@vger.kernel.org
X-Gm-Message-State: AFuF++lAn9DApBscttc8ISxCTrHQYEiEnnrhMGSpQodmNxzVCWb9HNLn
	/e/ftOfnARhWX3Kf3ylBXfxcU3D3RjBc4ZrB1rSf08uULFM9bgoNvu2KOlE6LMWE7u1DRxr9lSY
	NsDslDGFeiksLRg==
X-Received: from dycnt1.prod.google.com ([2002:a05:7301:1701:b0:327:c2ac:2d82])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3ca8:b0:3c4:4272:b400 with SMTP id adf61e73a8af0-3d984562d03mr1240828637.18.1788295974871;
 Tue, 01 Sep 2026 13:52:54 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-1-cmllamas@google.com>
Subject: [PATCH v4 0/7] binder: fix issues with mremap()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, Carlos Llamas <cmllamas@google.com>, Todd Kjos <tkjos@android.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

This is a follow up series fixing some pre-existing issues found by
sashiko during a review of an unrelated patchset here:
https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com

The goal is to safely reject mremap() requests on binder's vma to
prevent pages from temporary leaking and accidental IPC tear-down.

Cc: Todd Kjos <tkjos@android.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Suren Baghdasaryan <surenb@google.com> 

--
v4:
 - Also reject vma splitting. This closes loopholes wrt to partial
   range munmap() that Sashiko pointed out.
 - With splitting denied, we can go back to the simpler ->vm_start
   check in op->close().

v3:
 - Switch to a range-check in vm_ops->close() and protect against
   partial munmap() as Sashiko points out.
https://lore.kernel.org/all/20260901163521.1355535-1-cmllamas@google.com/

v2:
 - Set VM_DONTEXPAND in [1/5] and [2/5] per Sashiko's feedback.
 - Check vma->vm_start to prevent incorrect ->close() in [3/5] per
   Sashiko's feedback.
https://lore.kernel.org/all/20260901030419.470246-1-cmllamas@google.com/

v1:
https://lore.kernel.org/all/20260831224145.169403-1-cmllamas@google.com/

Carlos Llamas (7):
  binder: set VM_DONTEXPAND
  rust_binder: set VM_DONTEXPAND
  binder: forbid vma splitting
  rust_binder: forbid vma splitting
  binder: check vma->vm_start in binder_vma_close()
  binder: reject mremap()
  rust_binder: reject mremap()

 drivers/android/binder.c             | 18 +++++++++++++++++-
 drivers/android/binder/page_range.rs | 20 +++++++++++++++++---
 drivers/android/binder/process.rs    |  1 +
 3 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.55.0.966.g6673acef38-goog

