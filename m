Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E884650B426
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739450; cv=none; b=B34b6fb9GWhJCDqVqm7IcZZuJS/ycSBrb6kgoiiJ998XcK66TY7rBhjJxT9eag3KmSgJ33JXHHdydMhclNZjMjYgSZ+ch7aa4liy7Wyi3uRITMD8t3fsOlG96DX1CDO0DrHGDCW8M7b061kTJosPZIvZIYOv5845FcFBCV/m7Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739450; c=relaxed/simple;
	bh=RZxCOLCVZlRFWLzL3AVdTz89Pw/yNZ5sq8TC+i0x1Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNkf3zezwBL6Ie6rzZQTZ7WedF6HiOomzm8luAKvZt1MnGUpuiF5SVZyw1IeP3UTKFfQ2W+gbxn5xj422xz9bkku/+BQc4fhvBxiJtojpEmRUN1/98QBJsp/a6CVkzlNGa+HfZPE5jcVBkcJzhRqvV+RenikChwu9zNoGT/6wTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RPHy7MF4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RPHy7MF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwKX3HlEsuyePlIuOM5A3Nk2wXUUSAAY+zZPrVBSMJk=;
	b=RPHy7MF4zpaWkHzhqVkx6ofm4ssPGw5QRjJrdVQ6clOwBud1pkhvERlr5uP/QUFbvUSSMC
	k7S0Pe2tll+7hj8pGO9/KR/7Uum/3EGbjlyWOQBvjIkLEzblMbrRZe0chFK2E+IN/gqK0g
	ugcoeNF83qj7iwlZC65E4RScH3RYL9Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-yJWODDSZO0yqDNBKh4C28Q-1; Fri,
 18 Sep 2026 09:50:46 -0400
X-MC-Unique: yJWODDSZO0yqDNBKh4C28Q-1
X-Mimecast-MFC-AGG-ID: yJWODDSZO0yqDNBKh4C28Q_1789739445
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96C84180AEDE;
	Fri, 18 Sep 2026 13:50:45 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37965433;
	Fri, 18 Sep 2026 13:50:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 15/31] KVM: Introduce kvm_fetch_guest_page() and use it for x86
Date: Fri, 18 Sep 2026 09:50:14 -0400
Message-ID: <20260918135030.171564-16-pbonzini@redhat.com>
In-Reply-To: <20260918135030.171564-1-pbonzini@redhat.com>
References: <20260918135030.171564-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Introduce a separate function so that the emulator will be able to take
into account execution memory attributes rather than read.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/x86.c       | 4 ++--
 include/linux/kvm_host.h | 2 ++
 virt/kvm/kvm_main.c      | 9 +++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 182fa31a286c..e07966b9ef85 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4872,8 +4872,8 @@ static int kvm_fetch_guest_virt(struct x86_emulate_ctxt *ctxt,
 	offset = addr & (PAGE_SIZE-1);
 	if (WARN_ON(offset + bytes > PAGE_SIZE))
 		bytes = (unsigned)PAGE_SIZE - offset;
-	ret = kvm_vcpu_read_guest_page(vcpu, gpa >> PAGE_SHIFT, val,
-				       offset, bytes);
+	ret = kvm_vcpu_fetch_guest_page(vcpu, gpa >> PAGE_SHIFT, val,
+					offset, bytes);
 	if (unlikely(ret < 0))
 		return X86EMUL_IO_NEEDED;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 01223301f0e5..cddf0b943757 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1444,6 +1444,8 @@ DEFINE_VCPU_MAP_CLASS(_readonly);
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_fetch_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
+			      int offset, int len);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3b43a0d2a5d8..9fdec95ccce2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3289,6 +3289,15 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_page);
 
+int kvm_vcpu_fetch_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
+			      int offset, int len)
+{
+	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+
+	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_fetch_guest_page);
+
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len)
 {
 	gfn_t gfn = gpa >> PAGE_SHIFT;
-- 
2.52.0


