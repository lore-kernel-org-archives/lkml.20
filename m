Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889323817E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036016; cv=none; b=GMBPrFx0h4tZgUzKwkkggNibCTfCTFn6hf+CnLKUZgoWujSaOx4/vuqtjZ7pNbSAEmnoI13hQRZZaVfzw0YGRvDTLPMpOtqc7IkNlWaTHkuniXDWa36p6jP7xF8BHxdcTxoXXurp7VmpZBygKqZRuAd3ncYsNiGF0R2X28clLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036016; c=relaxed/simple;
	bh=jpQTZOsq9Y2zE31QAXD+PcxDvJuwfkohXQ2UD5qRwsc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XrROll5OKi0uIoaXcht38hJV3W+o+1CPPJ6uCYY6pVfii3lw2+2HglOrxM2UqWNgMNuo3drC1+gnrDmLLCHT3/XpF8uQGOlAJMul0VL2cRUhgMWsektJ5McrGLyzNLual8/ykUgwawX4/H7TGrAz4rADTUlh4pJJa3mu2l+2bYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLwW3rwa; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLwW3rwa"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so50075545ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036014; x=1790640814; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsOiLRN27kcO3pnY9NI5vzYfVkfUxUTwKtW8W3jGLrI=;
        b=mLwW3rwaI9LymIg0BO5RCIYdCHOkzpInjzBUnoYHUFvFPF8ddVIUdxQj0gXXkMR+Ga
         tDIckD22JNCAtxmiGUqGI+H1dTizxoZgQcsw+pBySxgty3z+LWlXiwlQq/JXo8ayGZz8
         iuAjOtqYnj1tirYFbbCU4e/sdtZv/0I2Czlr1EcPDfhPXz4AfVYWPEgPU2osGl9xWuFp
         zAWXbyASYt66MGAagudQ/Du1N8UPigxy8uQHmOMeYJhsJK5wyLpyVa2qHsIlJdFz24gp
         5sXhQ5nxNW4w9+Lzp9DUFGb6MDqzLVloxjBwtyIUqLPcFYPpakYo4DPVzjMIeG4+71tb
         ufcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036014; x=1790640814;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nsOiLRN27kcO3pnY9NI5vzYfVkfUxUTwKtW8W3jGLrI=;
        b=Lmy2DjKuonb+RYl/JsMG01HEHlm6DeYSXeoEBIhtuNKUp+bDBdcpl+VTNHd56+i1io
         UcSi/099RofBYrGriatQjt/0xnPjip+S6RJaCniL49okPNijlMEvvGSc3j2zC9KS9/Jz
         Hd7hEUOhEiQKm6LGumrcAVgDBayfEzvcE2eGqbpOSe+umX0S63bm7v/b0cX9RAH4Ol1v
         i/e27FtxeKr1XslulGySt6bh5dSfxjrHtAkwGWxd3UD+g2q/FM8lxvLeyRNveGh+TJjO
         uxCvwEPF7tKZZ+NCF7hQwHECx2Ztoqs8Qa/nr+yCZh2QmHpBECT6r9rcYKRkln08yX7y
         TlMw==
X-Forwarded-Encrypted: i=1; AKwUvBxt5V7gXvkyDCOM64DbdFe9IMuZ7M/MyDcoxvhn4FLII0UhZibQ8u6PeamN2EGmZ+RBwcf9CMD7G5OmOWg=@vger.kernel.org
X-Gm-Message-State: AFuF++nPffpukw6PkUX8cmvPqE4ZkAhds0y2n1BaLciLFfll8wapsA/V
	IUfirscI4lTDLn3o0cTyyFc1wEdpwuxiQRI4njIUroPLiEGruBKGGl7PG32XGHO0ZnPwugNJHBm
	T6zkGYw==
X-Received: from plhz7.prod.google.com ([2002:a17:902:d9c7:b0:2df:4827:bcc7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2983:b0:2dd:c100:4257
 with SMTP id d9443c01a7336-2ddc1004551mr112666475ad.59.1790036013944; Mon, 21
 Sep 2026 17:13:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:13:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922001332.1121266-1-seanjc@google.com>
Subject: [PATCH v5 0/6] KVM: guest_memfd: Fix binding bugs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sorry for the spam, I am hoping to get this applied before the in-place
conversion series, and I really want to get that series applied this week.
I finally gave up and split bind() into prepare()+commit(), and I actually
like the end result.  The only really ugly part is an extra #ifdef, but
otherwise gifting the gmem file reference back to kvm_set_memory_region()
avoids the TOCTOU issues and weird juggling that led me to initially reject
a prepare()+commit() solution.

Fix guest_memfd bugs related to binding to a memslot:

 - Handle errors when inserting into guest_memfd's binding xarray, e.g. to
   do the right thing on ENOMEM.

 - Bind a memslot only once the memslot is fully prepared (because it becomes
   reachable/visible once its inserted into gmem's bindings arraxy).

v5:
 - Split bind() into prepare()+commit() so that the memslot has all the gmem
   goodies before calling kvm_arch_prepare_memory_region(). [Sashiko]

v4:
 - https://lore.kernel.org/all/20260921210616.1024168-1-seanjc@google.com
 - Drop intermediate xar variable. [David, Ackerley]
 - Collect reviews. [David, Ackerley]
 - Restrict kvm_gmem_bind() to CREATE as calling kvm_arch_free_memslot() on
   FLAGS_ONLY changes is unsafe, and doing the right thing for dirty bitmaps
   is tricky for similar reasons.  As a bonus, this eliminates the ugly
   almost-duplicate code that David pointed out.
 - Explain why KVM must deal with the unwind during bind(). [Ackerley]

v3:
 - https://lore.kernel.org/all/20260904004342.3162959-1-seanjc@google.com
 - Nullify bindings on error before dropping invalidat lock. [Sashiko x3]

v2:
 - https://lore.kernel.org/all/20260902182020.2615443-1-seanjc@google.com
 - Fix the binding-too-early bug. [Sashiko]
 - Explicitly zero the bindings entry on failure to ensure there are no
   partial entries. [Sashiko]

v1: https://lore.kernel.org/all/20260826165154.766699-2-seanjc@google.com

Sean Christopherson (6):
  KVM: guest_memfd: Gracefully handle xarray errors when binding a
    memslot
  KVM: Use goto to handle errors during memslot preparation
  KVM: Only bind memslot to guest_memfd instance for CREATE operations
  KVM: guest_memfd: Split bind() into prepare()+commit() phases
  KVM: guest_memfd: Establish memslot<=>guest_memfd bindings *after*
    memslot is ready
  KVM: guest_memfd: Drop superfluous WRITE_ONCE() when binding a memslot

 virt/kvm/guest_memfd.c | 68 ++++++++++++++++++++++++++----------------
 virt/kvm/guest_memfd.h | 19 ++++++++----
 virt/kvm/kvm_main.c    | 65 ++++++++++++++++++++++++++--------------
 3 files changed, 99 insertions(+), 53 deletions(-)


base-commit: 70c944caf570fda2d79baa71435589a8db39f048
-- 
2.55.0.1082.g2b9226bbc0-goog

