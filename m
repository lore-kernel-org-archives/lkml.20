Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502103;
	b=PbPgv68LcN8FaUd30yXlKNlfnGUUIZWpfPz4tCqB/sZjBo/+Y3xvreG6uG6s5Mz6Rv/d
	 GyMHNayr9DuciY4/pUm/8hcp1QGb2DA88HxZnRQLmuWTehcyNi22YKoveo7CFTd7eG3as
	 iXBAV2MGqIFbpFNWIkiqON7+do0K6KihjCnaKEX/E+XyXQyRFWhNX/q/PoRv238/hTv81
	 O3bmVR+kH04jTPDxrsrUqbRRVSj5MiJmYlc54WYiT4HKGjz7Kl49YCKKRRo9CiqPP73i1
	 Ez+YSDTfcoOjxoHKWuBA7A6OY7dJvMso4f59pYT0Z68OzPx+gA64VsxltEiQ1zXFGbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502103;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=tuNkSWZVJR9pU7AFRF8BvGrXZ1Ry6Li/NkjogDbT3rc=;
	b=dDjglJPPti2e/OcCjhUwMIJyvyj8uvk1Jbh9LcZal6OSZoMUR5R+npMmw0tTGH8oWBmu
	 9avKJaEjGo981T+4kfIgVg20YF3/a6+LR1nrxEjBm+tU2ddXQ7or0FS77HKsvMkxGp+zW
	 0iyUp1gnXuSPjKAI+q1xWhifb5LnmNrmj1JVw60yPUBJDeQGuS5MYyxDcuZBLmM7pNBkS
	 5HXjNhoCi8BPDoDKPy3fAUxC9B6qwxEYtjJpD1VCVDBaQZN2VYs2ZfY5Pti0o/iU/nq/j
	 7bNzjRiLeCAOMUG022wV+isJNipTe4hFHYsyIwFpPDA3wU2vkrGvlSxiR3Ty6Dn6iDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VjXg1g5K;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCDE60A2606
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCDE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VjXg1g5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792502101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuNkSWZVJR9pU7AFRF8BvGrXZ1Ry6Li/NkjogDbT3rc=;
	b=VjXg1g5Ks/fNgDf2YsLSivg/nAoG2t7iNWHui3CPPwLZa+vMku/uOLpDCWa0zqnr6orVKl
	GIvfCH4xB0pWMATYyItVyfIDBN8F4nanb0VpPzG8XUgxTIkIpCG7H6DOebPVO+SWd8uPEC
	zyRqe1IoRb7omW+XptWElYOC5wIRT/g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-511-JzrOb0XxOCOiUpHh44vFrQ-1; Tue,
 20 Oct 2026 13:14:53 +0000
X-MC-Unique: JzrOb0XxOCOiUpHh44vFrQ-1
X-Mimecast-MFC-AGG-ID: JzrOb0XxOCOiUpHh44vFrQ_1792502092
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F93E1955EA9;
	Tue, 20 Oct 2026 13:14:52 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A5D01800257;
	Tue, 20 Oct 2026 13:14:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Ackerley Tng <ackerleytng@google.com>,
	Fuad Tabba <tabba@google.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Shivank Garg <shivankg@amd.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 2/3] KVM: x86: leave the legacy private attribute in for TDX and SEV
Date: Tue, 20 Oct 2026 09:14:46 -0400
Message-ID: <20261020131447.122096-3-pbonzini@redhat.com>
In-Reply-To: <20261020131447.122096-1-pbonzini@redhat.com>
References: <20261020131447.122096-1-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

As of today, and presumably as of Linux 7.4's release date, there
is hardly any VMM that supports guest_memfd attributes.  Support the
legacy VM attribute for private memory if SEV or TDX are requested;
default it to disabled if only the software-protected VM is requested,
since it is only used by guest_memfd selftests.

While in-place conversion is the best option, it is way too
early to enable it by default.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 01a683a9042a..4f7d75ec8c40 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -80,6 +80,7 @@ config KVM_PRIVATE_MEMATTR_VM
 	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
 	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
 	select KVM_VM_MEMORY_ATTRIBUTES
+	default KVM_INTEL_TDX || KVM_AMD_SEV
 	help
 	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
 	  memory attributes.  Using per-VM attributes is deprecated in favor of
@@ -87,7 +88,7 @@ config KVM_PRIVATE_MEMATTR_VM
 	  CoCo VMs using a VMM that doesn't support guest_memfd memory
 	  attributes.
 
-	  If unsure, say N.
+	  If unsure, say "Y".
 
 config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
-- 
2.52.0


