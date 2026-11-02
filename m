Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641520;
	b=Xxp6gzsFPUjtgYP5Ak95QlugPHDjexBOQaNCkNApbbjncU1ikoh8zj2+8U5NJUUQNolL
	 dtLKIG/EG4iZFRRar7pjIZ3SGr0iL0f1dXfkb5vkO9LGXSYhF+bEAZ1GZO5jP14mN7NPY
	 1oDURNPwnpDSzg5pQHy+a8e7kSdQPwx6N1Qe3ABRNnn9478YnwOSpsyEzJCV3gauGLwjY
	 /N7pzakcsL9wNqSVCeiTBgfJ8BgR4/Ovh8+8T58xgkaliNEiFFUTl5I6fqTtQ1o+D/I0z
	 wTcEILFd8gzg/Xg1xwdcs9pctDbxTvLhn88OCLQHGveV4B8TofuVIhTuoQ2JXTekknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641520;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=57hzFQ9aHNHxTZLbv0cg8SsM/1NYNPFtfAgwV5HFcz4=;
	b=OoRcJS3d7jxhGHXqRYn19CmOqyvJL0nkrj9rJvntDp1eIQ0y+RMzelyj2CRSqX+ieSFI
	 U0EI96ZWgjaT7URw26bjMmpl937ng2gmZPJfR3X+dto59jf1LcrEFU829LJjIFoGJLYj7
	 xZ1sT42A8Q/zuELoQU7YF5neUH8L6isk9toM7A+Hgf73s1/8EUhYxSwn/6YOAL5H4RUWh
	 pvrWSlBgn6f1ehWzb1/0/deEGM3lzwS8H+h+ziNg3cLhzC6p7vS9it6WJnZCRXROyR41o
	 IXGxpi6L/vl3eXfpi7dDUVFzpWxn6T0Z6wmaYpxhRsp//tX77Rl7VunAGFm/0InanjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4PvYGCk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77075606E031
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77075606E031
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4PvYGCk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57hzFQ9aHNHxTZLbv0cg8SsM/1NYNPFtfAgwV5HFcz4=;
	b=W4PvYGCkGU0Y7ffGQdwEmg77CjaRQctyqC3yH8tWySltNfgZZEnb3aPLIrANhkq4cMl51+
	nL3Jl7WSEmdZy2TdCQu3B6nTLkV28UGXdPCH9MUNjfyc58Y6CxM3zNEPs9fiZPF4XioBUW
	25gQgjw6eP54p/qRYW+YjnfPNEmDahw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-F9tak6jGNSWPqjdqz1LZlQ-1; Mon,
 02 Nov 2026 12:45:16 -0500
X-MC-Unique: F9tak6jGNSWPqjdqz1LZlQ-1
X-Mimecast-MFC-AGG-ID: F9tak6jGNSWPqjdqz1LZlQ_1793641515
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 264001955E96;
	Mon,  2 Nov 2026 17:45:15 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9142C195608B;
	Mon,  2 Nov 2026 17:45:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 19/45] KVM: Introduce kvm_fetch_guest_page() and use it for x86
Date: Mon,  2 Nov 2026 12:44:46 -0500
Message-ID: <20261102174512.8903-3-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Introduce a separate function so that the emulator will be able to take
into account execution memory attributes rather than read.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-16-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/x86.c       | 4 ++--
 include/linux/kvm_host.h | 2 ++
 virt/kvm/kvm_main.c      | 9 +++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 63d48ac4e1c6..ab7a859dda79 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4916,8 +4916,8 @@ static int kvm_fetch_guest_virt(struct x86_emulate_ctxt *ctxt,
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
index 3791e4290742..1974cd8d361f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1456,6 +1456,8 @@ DEFINE_VCPU_MAP_CLASS(_readonly);
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_fetch_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
+			      int offset, int len);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d3f074d7fd6f..41818ed5eb3a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3398,6 +3398,15 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
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


