Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD244E671
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764386; cv=none; b=uQJ/2Dt58YQ+Oev3Utvaw9BSOxNakc1m0BQLa9aUztGMT9V7RWNMzwyRdf4Adhiac+d3NA5DHI7bC0fYH7KldJmeZmoZTP/akVN9kHHDNJxJH6G41lc1QqZ8+ohFlxBhCZRwUWur+heXml+N0Y08jMNVuLj2HRRH5xt9VB6rV4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764386; c=relaxed/simple;
	bh=q6FCE71hqOdUh5ccpzRzeUldvCJyHXHPMQ9uptiqErI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MxsrgyMqUai2KCSDIi9zgo/q9EHgzBItShX3hnNLFl3wEzSE3mkKCQShXuShViSEZi25/UMMce+aYUlvWLEnVJLVkJ85sokHTGHShY6pCxBb1xW7+UK8xPn0EXrGEMfeb+SWqYWduuAKSkoYtECH/lq/K89eJV1PRgsn0WZyyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kM0NPocJ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kM0NPocJ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso708321a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764369; x=1788369169; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXkEMVsh2+8xb0uflNe1dR/nClI4LJ04DIhwi5akXZo=;
        b=kM0NPocJ1cvFHYU3RsTe/oi7vgx+FeZ1a4Omkxc49j6sB/0NSCDOT56SqY6SQ4AJwT
         0JcQw/0q+f/ixwdWS57ZOwnaIxc4cmhZY8f//G30U3slVWxwKLXv3++lkswUZvcLDZzd
         CZTLyMhuQNJfN2MSaonqDWkMkb4Tni8zCiCaouBMuM2650JhpUMIoamnqL/kCA5uwT2y
         7mnEof/yo4eoRwTZU71i8Sl3c9gzvSuEpbbfbo3wH3J3kSu0sbHFGVpR1FBFmCZHcQi9
         xnW0/RKrx3mBElHn2pU3USLjj+W54dQaWL2Q5OPwHHFDl67IxRvqNfjgwgJxjvMLm3e4
         tH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764369; x=1788369169;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXkEMVsh2+8xb0uflNe1dR/nClI4LJ04DIhwi5akXZo=;
        b=RfVQyqp9LsXZFEIlHLhWIuFULj8q1yoSOQdRHPNJOlYfeSzgyQpIy7ccL68H5jhP3Z
         vNUgadK/qbtv/1gpfjR6UvouLP0AZLpVTlyOthk/Y5WParpDD7mw+3NMQ0nMuLW364Jb
         WnQmVFlUl+JHk6RT5mDEn/mRasUFrIjsyOdUSeRpKObbiaUkUyFHPQRYFMi1DsOsT9kc
         I1MvOsYkYlMZSGlhk1bunzJInCD1nKl9XrSen/P/f7AH+ev7gZ0vFOxQ06HAghGqUmFp
         aKRgiSmrtKke3Pq6q4Me17Rk66hcwhn7WwFzLOz/vg/Fl8aM3wZDU2GYd76P4BKdk08D
         FbIA==
X-Forwarded-Encrypted: i=1; AHgh+RrNdjGeb+TPSZveG7/dVdOFzk3zIm+XjDA8pHO86AF0u122EPZp1dup3Le3ReDaOMQYKPDML3K2Y9mj15w=@vger.kernel.org
X-Gm-Message-State: AFuF++kvTaoz7QZppl/nPmFHQ+M4vhDhhcICgEEjArgBv/0y5pIFkshZ
	3Zok0m1rqXwQV0KaKr+u7yYAx1KtebE5xawfa842BnDIWXZYXMEQ7h9aU+okvqyofGU2nvs9g9q
	ZnhM4mw==
X-Received: from pgcga15.prod.google.com ([2002:a05:6a02:668f:b0:c8b:2b50:846b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:4047:b0:3d0:cc29:ff64
 with SMTP id adf61e73a8af0-3d0cc2a0565mr4203700637.15.1787764368706; Wed, 26
 Aug 2026 10:12:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-1-seanjc@google.com>
Subject: [PATCH v2 0/8] KVM: VMX: Harden against interpreting TDX vCPU as vcpu_vmx
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move and rename "all" (read: everything I could find) common helpers out of
vmx.c and/or replace their vmx_ prefix with vt_, and then poison to_vmx() for
all common .c files to harden KVM against misinterpreting a TDX vCPU as a VMX
vCPU, i.e. consuming to_vmx() on a TDX vCPU.  Spotted when working through
the bus lock series.

As with v1, the TDX changes are compile-tested only.

v2:
 - Complete my train of though in patch 1's changelog. [Binbin]
 - Rename vmx_handle_exit_irqoff() => vt_handle_exit_irqoff. [Binbin, Sashiko]
 - Collect a review. [Binbin]
 - Move and rename everything I could find, using a dummy "struct vcpu_vmx_tdx"
   to allow relocating common inline helpers from vmx.h to common.h.

v1: https://lore.kernel.org/all/20260814161129.2177118-1-seanjc@google.com

Sean Christopherson (8):
  KVM: VMX: Move the shared "IRQs off" exit handler(s) to common code
  KVM: VMX: Move the shared NMI handler/trampoline to common code
  KVM: VMX: Disallowing using to_vmx() in common VT code
  KVM: VMX: Rename posted interrupt prefixes from "vmx" to "vt"
  KVM: VMX: Rename EPT violation handler prefix from "vmx" to "vt"
  KVM: VMX: Use dummy pseudo-overlay struct for to_vt() and vt_to_vcpu()
  KVM: VMX: Move common VT getters/converters to common.h
  KVM: VMX: Rename common exit info getters prefixes from "vmx" to "vt"

 arch/x86/kvm/vmx/common.h      |  60 +++++++++++--
 arch/x86/kvm/vmx/main.c        |  92 ++++++++++++++++++-
 arch/x86/kvm/vmx/nested.c      |  36 ++++----
 arch/x86/kvm/vmx/posted_intr.c |  20 +++--
 arch/x86/kvm/vmx/posted_intr.h |   8 +-
 arch/x86/kvm/vmx/tdx.c         |  32 +++----
 arch/x86/kvm/vmx/vmx.c         | 155 ++++++++-------------------------
 arch/x86/kvm/vmx/vmx.h         |  37 --------
 arch/x86/kvm/vmx/x86_ops.h     |   1 -
 9 files changed, 227 insertions(+), 214 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog

