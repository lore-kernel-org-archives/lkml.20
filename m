Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641520;
	b=lQikGO6BBLpmiHLoOkh5D5VHEe6W/I3G+0hx71r/nzCRviJ0AldZexhnW4iXQVoFPdsF
	 LElgNuLwvfYkBgsJT5NkSIQnb4tkqCtbXzvj95veW59POjwuQ4Rh6bRHFa2NiJZQIlLW1
	 +1eALCOh3Qda3TSbkJsuTyjJ+TgUvYtU7hN7f8p83ciSApvJjVcwpKybgfFOGCF79XamZ
	 BB9kpubTWar8G76lAFpz4vh/b4dgTD2h7CBYS17c7Ipo7UXwyUnlR+38PbEMeeXRjxV6r
	 Jzak1JD4ETPLJZBYh4fgmbp21WfXryGQEVPL2KYarrGNiUHHvNEKnP6FopIGYY8W68w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641520;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=FYhHSLxeTFvAmi4fll8DRpQ9fKphXXLZ5ute33mwd7k=;
	b=FsVSH06ULIAGoKvLnTSGMhsYstXv5+en2T2C/bl+TrDOX4eaVR7bp0dOrf0dHged514u
	 ALObHd8ZpF48utclwNiTlIF936VUuI+sa/qgwqM4PPRwTeBXPiDPSTDcxNI4Noe0TMMP9
	 QnsKddFixhsfaFQ/zG+cFuCJ6G1JUVVBS4vzMsYDVLWY+RUXO9/EhenqBbxLACZoL7EYI
	 iLGqsbwCAjrb1ooY934wPgMXew82Ksb6NDrQbsxKRniIehd602L0XBREuqxdxnPd4qBfv
	 NLQhixz966vUCjro8pvBFCMdVf7LxSJMJdU2yDxJ5G1kI/JxFvpZyGCK5XLMxRVOWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zcw9kM7E;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF4606E00D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DF4606E00D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zcw9kM7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYhHSLxeTFvAmi4fll8DRpQ9fKphXXLZ5ute33mwd7k=;
	b=Zcw9kM7ExKHxvW5BYsr+SnSIxH3UyPBr9Enj8p3QAQ8sMGzLUSLvmAkZF2xE1EGQKTLXWQ
	wGn8AMx0KhCvlncKsYyAws6+XDqm+m1q1VjT7tRQbbFV5uxfLVoyJqq5CUaRJqqQJP+gaQ
	o6qdVfsyjh9C0enV9XhXtDev57LEy20=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-201-3tp-u8AfNVey4uRV42bT0A-1; Mon,
 02 Nov 2026 12:45:17 -0500
X-MC-Unique: 3tp-u8AfNVey4uRV42bT0A-1
X-Mimecast-MFC-AGG-ID: 3tp-u8AfNVey4uRV42bT0A_1793641516
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 591FB195606A;
	Mon,  2 Nov 2026 17:45:16 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D09391956087;
	Mon,  2 Nov 2026 17:45:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 21/45] KVM: Take memory protections into account for __kvm_vcpu_map
Date: Mon,  2 Nov 2026 12:44:48 -0500
Message-ID: <20261102174512.8903-5-pbonzini@redhat.com>
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

Take into account memory attributes when establishing a long term map
through kvm_vcpu_map()/kvm_vcpu_map_readonly().

Unlike the gfn-to-pfn cache, changes to the attributes will not be
propagated, so that it will be possible to place a nested VMCS, VMCB,
or APIC access page on a non-readable/writable page.  This will be
fixed separately by using a gfn-to-pfn cache for nested virtualization
data structures, in the meanwhile apply a stopgap fix.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-18-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de54f52f2158..c7b8d1bcf893 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3302,6 +3302,11 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 	if (WARN_ON_ONCE(map->hva))
 		kvm_vcpu_unmap(vcpu, map);
 
+	if (!kvm_mem_attributes_may_read_gfn(vcpu->kvm, gfn))
+		return -EFAULT;
+	if (writable && !kvm_mem_attributes_may_write_gfn(vcpu->kvm, gfn))
+		return -EFAULT;
+
 	map->pinned_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
-- 
2.52.0


