Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641304;
	b=UDJY2M1Bpt52UjfAEqRgOuWyrvfmmdFiE1aKMe1JMMmBwrJhUYK+FZR+/41ZUvy9eic+
	 wg4UOWlIHzFIjGFG9LKx8cZZiPKuQx2wnl90KzR0aLp7X5BDFnfv0UAgFtSmWtqR+XtPa
	 4xHSUY5WnwzdHsNvHwSlzYU74+iHAy+yTbfF6FV3OZZiYBcuY8xYYo6u0qARzq84fSpqa
	 mcUPVOhuhcj5I0L4XkqyuGlpLUH4Z6bKTAQZC7A3nfeVV8hKwgiwNl42NYbQtBhnWQx7i
	 NkQpt1U1S/7vOLQTNz4SPxJffb5W1YyTltW96F8GG2YnFK+eVz/7n+El4hy+0+1xqBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641304;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=4oGyQJIGrjAzOl+0UALxZK2pDMzcNkZQ7rZmMKDmU7s=;
	b=cJE51wXQv7JoZvHKNZnPLwjvuHJ9NcTlLHGmeg5TsbHAAkKzSHxMrm4hdN75XIJQxjgz
	 33hiz9FNR0vxe1CN+0/prITDkbdk1yfa7ELMEZqGUCxJ8Xw9SpfFtoPcUlx5ePvCRMpH2
	 +Lorb6IS5o3+ZVFfZuB9zBTne8r49OS4pd4WwSO6DLnO5yBigNtCmw0RY5nhMbJmc5kzL
	 q8IwiMDAkMKrEdr8FEGfecRg3huQONwam8Hh8yh7CWpNELx/mNKIJfCFYYg+n+8r+dX/6
	 XUmknvjLjn230zKcHWli1uHLsXIdUBL+QiKD83PZayMp9Ou5+rbJPM2obE0B0Up5r1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fu4+ORxB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065660752A4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E065660752A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fu4+ORxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oGyQJIGrjAzOl+0UALxZK2pDMzcNkZQ7rZmMKDmU7s=;
	b=fu4+ORxBxEnFPxxoMsHW0q2ytBBX4jY9ACC55oKWN1HAqzVJaFuPpwGabKSTnS/9hhV7yF
	39vDBNBS0eLs1SgHCLvRidkcCNQVplyiUMSKQ8TGv6aBHHxf8P92w7RG262ICyDJszi+Vo
	mxlDoNMgqEL+mxXgTJnH+BLIEqQYkeY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-Sm3UEA2YOruSafd4Dykh_w-1; Mon,
 02 Nov 2026 12:41:37 -0500
X-MC-Unique: Sm3UEA2YOruSafd4Dykh_w-1
X-Mimecast-MFC-AGG-ID: Sm3UEA2YOruSafd4Dykh_w_1793641296
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97B831956051;
	Mon,  2 Nov 2026 17:41:36 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC12B30000E3;
	Mon,  2 Nov 2026 17:41:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Anish Moorthy <amoorthy@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 09/45] KVM: Define and communicate KVM_EXIT_MEMORY_FAULT RWX flags to userspace
Date: Mon,  2 Nov 2026 12:40:53 -0500
Message-ID: <20261102174130.8779-10-pbonzini@redhat.com>
In-Reply-To: <20261102174130.8779-1-pbonzini@redhat.com>
References: <20261102174130.8779-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Anish Moorthy <amoorthy@google.com>

kvm_prepare_memory_fault_exit() already takes parameters describing the
RWX-ness of the relevant access but doesn't actually do anything with
them. Define and use the flags necessary to pass this information on to
userspace.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/ZR4N8cwzTMDanPUY@google.com/
Signed-off-by: Anish Moorthy <amoorthy@google.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-4-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 5 +++++
 include/linux/kvm_host.h       | 9 ++++++++-
 include/uapi/linux/kvm.h       | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e95c9cda085d..7123d021bdbb 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7481,6 +7481,9 @@ spec refer, https://github.com/riscv/riscv-sbi-doc.
 
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
+  #define KVM_MEMORY_EXIT_FLAG_READ     (1ULL << 0)
+  #define KVM_MEMORY_EXIT_FLAG_WRITE    (1ULL << 1)
+  #define KVM_MEMORY_EXIT_FLAG_EXEC     (1ULL << 2)
   #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
 			__u64 flags;
 			__u64 gpa;
@@ -7492,6 +7495,8 @@ could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
 guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
 describes properties of the faulting access that are likely pertinent:
 
+ - KVM_MEMORY_EXIT_FLAG_READ/WRITE/EXEC - When set, indicates that the memory
+   fault occurred on a read/write/exec access respectively.
  - KVM_MEMORY_EXIT_FLAG_PRIVATE - When set, indicates the memory fault occurred
    on a private memory access.  When clear, indicates the fault occurred on a
    shared access.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..5e386c3d2495 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2556,8 +2556,15 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 	vcpu->run->memory_fault.gpa = gpa;
 	vcpu->run->memory_fault.size = size;
 
-	/* RWX flags are not (yet) defined or communicated to userspace. */
 	vcpu->run->memory_fault.flags = 0;
+
+	if (is_write)
+		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_WRITE;
+	else if (is_exec)
+		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_EXEC;
+	else
+		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_READ;
+
 	if (is_private)
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8dff2fc1972e..229b3bdb7aed 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -457,6 +457,9 @@ struct kvm_run {
 		} notify;
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
+#define KVM_MEMORY_EXIT_FLAG_READ       (1ULL << 0)
+#define KVM_MEMORY_EXIT_FLAG_WRITE      (1ULL << 1)
+#define KVM_MEMORY_EXIT_FLAG_EXEC       (1ULL << 2)
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
 			__u64 flags;
 			__u64 gpa;
-- 
2.52.0


