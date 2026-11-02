Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641533;
	b=vYzkmwtDcQI1lA3RiNprlosHMm4xX0vPCx+R4y5rxZVheuhXMk/nU0XqbDWG7RTse7fK
	 yqmy4u3eI7bxrrrnkLSlvkL/Y5LJMiaphxhFC+/sBeGQgBl+4z0g/sVP2Lt+20u5rCeQt
	 xxc4CAPCRMBpmPmsvBm0d04WTnTxgnICLjv3ZNL3W4DiNq/l2F6+DGBob8YcurF4unlyF
	 yYRtZPM1PWRJqwGzRN2FKSA18OeQEAi95CSNsBd+K+qGOTVw8kRkKBqCmwADBHKd1uWFi
	 TX1CfYPdflZjkHJYFq2AfyRangQ77JLVqAEHoz7irajBUsecVurXIKzhkL/8+NpJjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641533;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Y6no/JVsXMyaF2S1vCkMXnFSBxc9Aomb7dY+A82TzLk=;
	b=LI9uR+UZeSjxjVSiQeSvEFbATGWJ/Q/CHacTxaxuBKET3ySSdnRqqKOdGs+KmgJFdyZW
	 0uxqIqdHEbt8lY9XHqzv1sydh+I7FEQZOrnepT1a4+a5A2Pugd4pifsBVjMFDfwCCqjRb
	 caI+a/6UVfnj6MUVBMu5ko6XhBhx5E7tZcZxeK7hwafDmyTLApGJ5srNOlmespdLylyV6
	 zpVEkGPSQF9f6DFN1ez812ne3+kCTd/LFYfTip5KXEy8YEcooaLnjcijZGoLa913GfRg5
	 Yr8u2lmPOndnIH95JhvpaEXCLDXUPtv6F/q+Ef+1HmALvfOGmhLGJEBuGEBgM3a21YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwwuIdQX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C476072C70
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C476072C70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwwuIdQX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6no/JVsXMyaF2S1vCkMXnFSBxc9Aomb7dY+A82TzLk=;
	b=EwwuIdQXQHwCcpKUCN76CQAF4pypJ92LhHB6DuVdwPvqN4+BpRk1O45Aa6ekA603IFhPQ0
	7V8JmExWv+MeR4rtLI2BnlWi6EWMd3agibHKmQ2Ge3WnWBowFIIL2N5OQOdu2Y4kvpgYKL
	kiEFcBcyezsDr7D508+b11P6baFzDWk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-FMWvH6nDN_2EH_YxlK7FMQ-1; Mon,
 02 Nov 2026 12:45:29 -0500
X-MC-Unique: FMWvH6nDN_2EH_YxlK7FMQ-1
X-Mimecast-MFC-AGG-ID: FMWvH6nDN_2EH_YxlK7FMQ_1793641528
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 097331800610;
	Mon,  2 Nov 2026 17:45:28 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80DD2180057F;
	Mon,  2 Nov 2026 17:45:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 38/45] KVM: x86: mark VM as dead after KVM_SET_SREGS fails to load PDPTRs
Date: Mon,  2 Nov 2026 12:45:05 -0500
Message-ID: <20261102174512.8903-22-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

If loading PDPTRs from guest memory fails, the KVM_SET_SREGS ioctl
returns before resetting the MMU context and with stale PDPTRs.  Mark the
VM dead on the error path, so that the vCPU cannot run with inconsistent
state; userspace should anyway use KVM_SET_SREGS2, which provides the
cached PDPTRs and avoids the guest-memory read.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index b7c25b16ffca..3a11a6d06889 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -634,6 +634,7 @@ static int __set_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs,
 			r = load_pdptrs(vcpu, kvm_read_cr3(vcpu));
 			if (r < 0) {
 				srcu_read_unlock(&vcpu->kvm->srcu, idx);
+				kvm_vm_dead(vcpu->kvm);
 				return r;
 			}
 			*mmu_reset_needed = 1;
-- 
2.52.0


