Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395280;
	b=eafwO/AJdu3ik7w0vW3mhzscDr3issj6pxDpRN00grHrhNkhgxdFP2rDC9/2X8afSTPd
	 nnxTsl27nZOkOExmEK/A9K7w+Pj184hExBvq58IBxuVbl1V7So+1OfxU7dQnadkHYCmXV
	 Fut3vG62yiWwRhOCg78BWTLQYb2TX6y11AbPqgOjxNkGLEkji4/VKUWWPiG5sDWXX+5et
	 XjOt32tr2V9LhhaQUniC25kBR+GuuYW4mG2cnUQ/S9j3hmbvRWgq7A3TDkPJFx74Lxo4O
	 DGMg22o+5E5ToKOOb+2y6uwu/8slJCGAMFy+30HjpfFZDWeCYLvfoFEILGUfxBwj+DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=aAKXgeyyRU3oc6qV+7Ii8MEYj0RDQoBh44JQ3GvzeWs=;
	b=vO5te0yoGe0BYqsn55tythlwCES07Nq+2ZLZ2gTL5ni0IqkBC6uUFEJ+OyzwYkKc8xwd
	 P74arnwgKCbfJEY4xY7PDXQEXJPiLoiaHdkAGSRiUfa4gXfe8qaC8fzga0ZzEvwj6/QjZ
	 zYO3lSI8DgnQoO6dK9RDnqKftELX/79WLbA3rdDe1j/NY8Q9sLEmBIOCLJL4c/+9qIwPe
	 HLuOMJ/js3AJMljhlYDwZCFbMnK3jjBIU2xEmfEch/gxJ77vIJX1M3ibdPI95aDWFDZCW
	 PO/nclnhdZZTUN2PQCt0QRww1oJKSq0uILMlOyWiLe/M04EhePPV5tzb0D5ya+uql2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h0zKdHLf;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C760A5BC4
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 402C760A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h0zKdHLf
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so937007a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395279; x=1794000079; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aAKXgeyyRU3oc6qV+7Ii8MEYj0RDQoBh44JQ3GvzeWs=;
        b=h0zKdHLfSeYHZjjVYZZvblBx6MIv2aA7HVkDQX4Ax0VqiX2mH+bpzKgSy61rI+CMhz
         SiNGxQ8juTO+vlmo1AtglpqR7B9tbOGCdIrb4LB8/TqsClF4brgPFHeb/s5lGGno1JRi
         DmZYv8VDT5YCMCf8gOOevmJ1lC/CJbT3gp5H8HpeY7sQehuxlBiHcVSd0P9ipMXzazBw
         GIWqAgkY9/KtNYJ4/RzCnj3WHQUJvR9JlBAdv+W/8UfldirFS83KB6JBnzj6AgID2/6Q
         f/RjPWJ023dgXj1Qp7de62yGW6NcwPGjGwjA0kmy67TfqAtnb2D3rFdeIdE5Cjb9dHcz
         CEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395279; x=1794000079;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAKXgeyyRU3oc6qV+7Ii8MEYj0RDQoBh44JQ3GvzeWs=;
        b=sT0+Zgxho48VQgAZy2s6Nq+fFNWKeBjqxzvuaCRbOzDUbq7pJ7n0I3kDh6QsLUtoF0
         jXxw1x2KpNtm/7lE4q3cuXNuhiECLcYZbNJffxmB96cNnmpRQjvBJwVcM+KpOAR+Uf8I
         qCU38HfCDFsFtg21IpEmU03HzbLMWnnc6BdehHl7pRwb8Ns07ZkoYFIHQfsDpNXbj94J
         VSap6nSctRdS7St4tO2nWjPieARKrfgo6Oi7HaWXrIxOF+4+lE+lsFjKZ9TI+Ex7Jlqt
         2uaVhvRglSu6Tif3inrrvI0jWrMO9foMe/8MtPIzFaGT5ct4FiW43H1ebkPeaK0gfam0
         d1Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwAtmHQHf4hxtUybeVsOXNhsB5Y8TotHB41Do9egByyDwnH/WJUaWCwoGwkpawIp393xfzDCIXPv6TQb2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZzL0boYTUdVPt6UUCw4Io2tYMoNV2fhl0bgxXu4g5xUE9LQzY
	nwbFzG9xlwwB19Hz/vZYTcU6m8GTKG5A4Y6y/0KKq1rgVIIOoViTnAli13S7yWKZbbusQhGnBSI
	eN7Rr4w==
X-Received: from pjbfa4.prod.google.com ([2002:a17:90a:f0c4:b0:3ad:99d8:e894])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac1:b0:3a8:211b:6c6f
 with SMTP id 98e67ed59e1d1-3ae898662b7mr3039027a91.67.1793395279439; Fri, 30
 Oct 2026 14:21:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:53 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-6-seanjc@google.com>
Subject: [PATCH v4 05/23] KVM: WARN and error out if memslot update encounters
 existing slot with no pages
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

WARN and return -EIO if an existing memslot with npages=0 is encountered
when updating memslots, as KVM returns NULL if there is no memslot since
commit 0577d1abe704 ("KVM: Terminate memslot walks via used_slots".  Before
that, KVM pre-allocated all possible memslots and relied on npages==0 to
denote "no valid memslot".  The check on npages was deliberately left
behind to aid debug, but that was over six years ago.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 218456372b11..dcd28b45ef30 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2086,9 +2086,11 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	 * and/or destroyed by kvm_set_memslot().
 	 */
 	old = id_to_memslot(slots, id);
+	if (WARN_ON_ONCE(old && !old->npages))
+		return -EIO;
 
 	if (!mem->memory_size) {
-		if (!old || !old->npages)
+		if (!old)
 			return -EINVAL;
 
 		if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
@@ -2100,7 +2102,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	base_gfn = (mem->guest_phys_addr >> PAGE_SHIFT);
 	npages = (mem->memory_size >> PAGE_SHIFT);
 
-	if (!old || !old->npages) {
+	if (!old) {
 		change = KVM_MR_CREATE;
 
 		/*
-- 
2.56.0.385.gac671c819a-goog

