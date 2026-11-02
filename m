Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641529;
	b=o4ObkkPnGBmYE7qBOQS2Qzd5GNsceAuWnBTqrSED1e601KllXmMnqNubVGCqDy6z8cv+
	 x5Z8BQc6aZ64BEhLMoTRzCXrb60N9rxwsttVfEDu+eF0TqvRcdPQP4Trw+hNcIyBQJol0
	 lL3gsaM7ldwU+95/Bn6PIE3vVVcKdWjpCWkJ0WSMS5ir6r2BwEGzTqiK36crD1Kla4lq8
	 u2KilcYcbnKXT9uz+79IASjR44GxhcIHGpmODw2sPx7afxbez6DjdDlallnHpUfYmfe6m
	 lu1/RrvFAmwfkpofNY54kcvXDIECsAqkG2TkFmQ8mDKBaXH4OrXqQiVQHyrE/AUO4ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641529;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=e0qL5jJXXP5GTp/ESF224cNf42cmExJUT6lKMtkZoVI=;
	b=Mxz5prqJq/PuweDfbU4BHAoaH+bN2HkE32YuLoj0u8alcB7mxz8RnJLYCIiQiOO+TUF5
	 md7T77P6wKeDQNzsHHI8Y+uVtZPgzkwDcqc7lCAi9SL77U0sF7YO6oZSOxMWWJe7Mk9xJ
	 Xx4SgVuH1/Vpo5WqYYfLjV8awkzh7VYy7rg2B/g1IzB5nBGP2AuSldWECXqJmRoIyrtnf
	 g/u5sLO+SpYp3fE1EIEXk+yQQ3qyx5OoDobarCq/azemuNTljIqwXD2/jBXjyIe31/vSM
	 i0CUqCo/+JhRt1nVsLe9Yr9YVuLygh7rEPaMco3bsu5SQRR6qTsKA4jxqomWHvged1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKOlP0yn;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104D60A6F41
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E104D60A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKOlP0yn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0qL5jJXXP5GTp/ESF224cNf42cmExJUT6lKMtkZoVI=;
	b=YKOlP0yn2QOFxho0SHKaNnldKmzIK8b4wsbNGlVcCePa0NOgYnrzUBtke+jnYcdhz9HhTl
	r43coPPMkm5zTSsqgOn1YqYfaWDCBnwuSHjTZm9OsJ2bmnc8VAyRQTvxHXM/BqNDl231Kt
	NxGlMzgyyT1OuHWp82jZfBrQ4+kI+bY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-pO32RrKeNI6vFkAzy9GnNA-1; Mon,
 02 Nov 2026 12:45:24 -0500
X-MC-Unique: pO32RrKeNI6vFkAzy9GnNA-1
X-Mimecast-MFC-AGG-ID: pO32RrKeNI6vFkAzy9GnNA_1793641523
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD4F219560A2;
	Mon,  2 Nov 2026 17:45:23 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B498433;
	Mon,  2 Nov 2026 17:45:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 32/45] KVM: vmx/sgx: make return value of sgx_gva_to_gpa consistent with its callers
Date: Mon,  2 Nov 2026 12:44:59 -0500
Message-ID: <20261102174512.8903-16-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Return 1 instead of -EFAULT, in preparation for using -EFAULT for
memory protection failures.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/vmx/sgx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 162548b97c00..df18adbdd829 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -84,7 +84,7 @@ static int sgx_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t gva, bool write,
 
 	if (*gpa == INVALID_GPA) {
 		kvm_inject_emulated_page_fault(vcpu, &ex);
-		return -EFAULT;
+		return 1;
 	}
 
 	return 0;
@@ -256,10 +256,13 @@ static int handle_encls_ecreate(struct kvm_vcpu *vcpu)
 	 * Translate the SECINFO, SOURCE and SECS pointers from GVA to GPA.
 	 * Resume the guest on failure to inject a #PF.
 	 */
-	if (sgx_gva_to_gpa(vcpu, metadata_gva, false, &metadata_gpa) ||
-	    sgx_gva_to_gpa(vcpu, contents_gva, false, &contents_gpa) ||
-	    sgx_gva_to_gpa(vcpu, secs_gva, true, &secs_gpa))
-		return 1;
+	r = sgx_gva_to_gpa(vcpu, metadata_gva, false, &metadata_gpa);
+	if (!r)
+		r = sgx_gva_to_gpa(vcpu, contents_gva, false, &contents_gpa);
+	if (!r)
+		r = sgx_gva_to_gpa(vcpu, secs_gva, true, &secs_gpa);
+	if (r)
+		return r < 0 ? r : 1;
 
 	/*
 	 * ...and then to HVA.  The order of accesses isn't architectural, i.e.
@@ -314,10 +317,13 @@ static int handle_encls_einit(struct kvm_vcpu *vcpu)
 	 * Translate the SIGSTRUCT, SECS and TOKEN pointers from GVA to GPA.
 	 * Resume the guest on failure to inject a #PF.
 	 */
-	if (sgx_gva_to_gpa(vcpu, sig_gva, false, &sig_gpa) ||
-	    sgx_gva_to_gpa(vcpu, secs_gva, true, &secs_gpa) ||
-	    sgx_gva_to_gpa(vcpu, token_gva, false, &token_gpa))
-		return 1;
+	ret = sgx_gva_to_gpa(vcpu, sig_gva, false, &sig_gpa);
+	if (!ret)
+		ret = sgx_gva_to_gpa(vcpu, secs_gva, true, &secs_gpa);
+	if (!ret)
+		ret = sgx_gva_to_gpa(vcpu, token_gva, false, &token_gpa);
+	if (ret)
+		return ret < 0 ? ret : 1;
 
 	/*
 	 * ...and then to HVA.  The order of accesses isn't architectural, i.e.
-- 
2.52.0


