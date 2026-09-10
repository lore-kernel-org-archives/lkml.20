Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A50380FFD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057456; cv=none; b=nC4XWMOyqFfPZsYd4cOnpcisNm2mHzCGz8Mk2sFlzdkjgAJM+Qai2+/bh+KTHs5pb0Zs4+luPHp63vm/90LP9R0hE9ghEFvY12Rt+Ar3fQ3stv/VNfmZhQNPG+vKb/mT35p68Q/1Z+2wXaJmWBL5O0ccdIpq+rXI1j16gCBHPyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057456; c=relaxed/simple;
	bh=pxrnsvzW8MKgeFG0MarEtyI0HnlG7oA7pNmC3DpRc9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eQo91VoXxtcEvrW+IGEW2lEODfrq/eWO334wa/KdGnRpipw/QH+0qL8pNuPOc+gs7bUK18MWBQx3w9UtpL5okJrMw28RPOhi0qG0CMYh3q2Nie7UjRbWKuhYCz9Y/1MufMNql6BtNDY/pxDJt7u5rjr6zaFBkxJz6/ukaam1/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oIKkq3Jp; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oIKkq3Jp"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so137305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057449; x=1789662249; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHI1zbWWi1BOEuhxInEo9eXwbPIfP+RyCmucdS/YFCg=;
        b=oIKkq3Jp0ry6K0DsHLDkf84OH4pYLX+kknjykm17cdBxO2SIuUe2jmB5SlSaX5JfGc
         Fv7YeiWWQHr7bAuUuUDKoGDyhCyXF1fnjC0UZuUhWBFo55H67c+ZSw/1bs9/1druy6X1
         Ea2D8yXPWlcWeXKt5f5wfE7y3+ZJyf0Y6iDiK5RlH8j3CrPVtmyeV63rKYSAqfOPq+Nh
         qIIzE7eMAALtaxVmKsNph7p5KSpJWMX4t7wIjeinimv4OsBHI9OAipvGYbHlz6CzOY1e
         SjlojdwUctVwIOu3meiAMyXM+tQbe5xLSlmHFTmtm+941L6YybKtm+Ni8WwqO6B1iuHp
         azNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057449; x=1789662249;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHI1zbWWi1BOEuhxInEo9eXwbPIfP+RyCmucdS/YFCg=;
        b=sz4sHieLuuozc4HY+KQEdfm4KvQ8Z6MjJSbErhQF66vrJLuuajgj9xQ2Cq381RrVot
         runWGWN/fcg3yotzv2qonGkFwCmETPxMOwFXY8E8yEaKEjMRuKcuoigq2jfiadKJdXWx
         0c7Qt3a4di5KosQ8+AqdIkDVo4o58lPh/rt5dsqwzvbjEjTJKR4Sy+fLafQzfM5JyBA8
         ejaxorJI6VXNj4zMEmMddvu4LsDZMnAEhopOekRIOWLaK1VyEViJpAx+WoLZDqOZNd2/
         b6igTWQTLX0CLu8YEBbbJDRBFdJWX6f+6S7sTfEFSxaPJqdaLZcmVx9LXiIimaQNwj1z
         0S9A==
X-Forwarded-Encrypted: i=1; AKwUvBwsCBTj5ULQb+1cfRheRU+IJnsz5ld4ilcNKJ5otPNSow9xrQW4SVvlbtOa2YhdE6f/SuBzh/+mVdWoq8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lZibL+/cZ6JKpm5KV0CJQii0excqbObZfL3co1NqNr7tR4NzWt
	B9ApLLx7L7UMwC9NgLIjuQL/YXnVDAJIsZVEgAZeAiYp6qmMTAtXwDvfXdzUO3xn5NtdPml5E3k
	p3Q==
X-Received: from wmhj22.prod.google.com ([2002:a05:600c:3016:b0:49d:1474:3527])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c29:b0:49c:fc6c:be03
 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr410272355e9.26.1789057448808; Thu, 10
 Sep 2026 09:24:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:43 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-11-elver@google.com>
Subject: [PATCH RFC 10/10] KVM: x86: Enable CONTEXT_ANALYSIS with opt-outs
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Enable Clang context analysis (-Wthread-safety) for x86 KVM.

Because virt/kvm/ objects are built directly into the x86 KVM module,
this also enables checking for common KVM sources.

Temporarily opt out sources that require more invasive annotations:
mmu/mmu.c, mmu/tdp_mmu.c, i8259.c, and xen.c.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/kvm/Makefile                    | 8 ++++++++
 scripts/context-analysis-suppression.txt | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0474604ab8a1..a93b54b00ae2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,5 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS := y
+
+# Opt out x86 objects pending context annotations:
+CONTEXT_ANALYSIS_mmu/mmu.o             := n
+CONTEXT_ANALYSIS_mmu/tdp_mmu.o         := n
+CONTEXT_ANALYSIS_i8259.o               := n
+CONTEXT_ANALYSIS_xen.o                 := n
+
 ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
diff --git a/scripts/context-analysis-suppression.txt b/scripts/context-analysis-suppression.txt
index 1c51b6153f08..666c4ca54708 100644
--- a/scripts/context-analysis-suppression.txt
+++ b/scripts/context-analysis-suppression.txt
@@ -17,6 +17,7 @@ src:*include/net/*
 src:*include/linux/bit_spinlock.h=emit
 src:*include/linux/cleanup.h=emit
 src:*include/linux/kref.h=emit
+src:*include/linux/kvm_host.h=emit
 src:*include/linux/list*.h=emit
 src:*include/linux/local_lock*.h=emit
 src:*include/linux/lockdep.h=emit
-- 
2.55.0.1003.g10538fe699-goog

