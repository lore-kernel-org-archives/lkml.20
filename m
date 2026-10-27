Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139152;
	b=aEyfFHRvswwc/pC/Swmsbk81vioIQ56unkZRnXE9XCRQvVN/u7msxDjVPcxYZB0ygyJg
	 54owlqgpGyK+bYR9CJcnHKqax6m6y92/GpOWqHHZjhyPkE73GbLm9ZSwLdIpRGsG6LOr9
	 t5MQrxukOUMCOt1WSaHB2IHGyfvhN5gpc44Ao2Mpt09dYqR2i11gfvEUeVh92dfHBCECB
	 aZEY16loI6YIXEplZNZplbeZrDFGyy/P3vxL1akSTqWQHcuHLK7U8YCnIfUyta2B8M1fN
	 vm0RqJG/r4bhBHhxP5Zwn6ABhMFXS3uuWY6yya/jt46mpW26foirb6Q2j68kxZC1xDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=dYm1W2He5BBY6NKWGt29bcYFb4hGcqDS3Vh4Emo9n8Y=;
	b=F1AJiePERNjLjl8LMwV+EkkFFogYHoDQMuwSB9JeqoTWiov4sfokOdc/AgeUYK5CzNFx
	 HOP6T/1oSHOY6CmjBHadUCInsHHaYemdxwE6npUXZ2MDK7cZi06V1dQ4XcIFdcuz4aKLG
	 Yc/x4EcSRUS+hxmeXOK+c+lzXSvCSRVw/dGD8tEJbJO81qO1Wh0BLFnbL1aJczBlWjHZH
	 yXEI0zvPJboCSGMgOkjCiw12SkoPjIh/D7Hb90T2a7HPDLTWXu979f3ABeC7X8Bns7q+R
	 9JEV5EVptmXm8t/vRokMTA24bua1301ANtVjNfE5wIraE6VdmqwjTWLRwKTwYhhvLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="l4RrGY/F";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927D60A3839
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0927D60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l4RrGY/F
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so4280165ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139148; x=1793743948; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dYm1W2He5BBY6NKWGt29bcYFb4hGcqDS3Vh4Emo9n8Y=;
        b=l4RrGY/FMDBqf87GwbGjx4Fyem/i+cVr9NOuPaEIrVyQSLfcmJ+4/GxrWF1kvkc91A
         sIi79j28WVnd8FbwCtUqLjxffEIOaau0Ej75LovdttAtMUA0CnZAHcoubPFpHj8uCczH
         GW0KSPq8uo4dvIKNctRvQHXCcqAnIy9SMeqeal16xG8xv8x5LMM7kFPWA+LlED44n5Le
         6MrTOmpHPt7KF2W3+XRasxETeY0FYmcLzd/jqrNTPqYAuVmOOGAylOKT9Ku6dPDfkZ7t
         F1hBmmL9WOWg5za8qvtMtq8CWYd8iyNtobNya69FHAicPC8X45dT+S1uuJBt+D/44U6g
         dRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139148; x=1793743948;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYm1W2He5BBY6NKWGt29bcYFb4hGcqDS3Vh4Emo9n8Y=;
        b=cAnFGBXR+0ZoK0LSoGWWC+OsH8n0xetLRDJMjAXxVzIi8mx7sPvR6QQ9gSlk1xrg/j
         VkEZAC1rU4DFSX9bRLmEEjNd5oalpTHF+EJ+UvIK3aykxEX2Cjq/mmRUu7tBakyPxLmP
         C0r+/pTLrJfeS9Zr9c+HGmnKwlNEEfJP/KWo+Nc3mzwlTAbKhnqDWGI6bEq8FvNdcbeO
         4W6ljF13UdFvsvOoyIw6ycwCSMo5YcKkzhUsofLk7Yn3+jr+TLNfa3F5T3PJ0Kp72yWK
         o3wnJGz+3uQjXVpkDXOKkHFL2COwDSj2vabMuWlmIeB9GZ7i52ZaI6ukzhpXlVJLGiPW
         C1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUV2MxvMcPa72sGN760oBvncIFSkjuBDeL3rcU6oVW8NlLpgMFPDyphAmAMNvOnSgQ3XamKlSR4MC9wsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0KPCWmuIKukB24nLhOpVZ9A9IhJUyznW4q396A8XtJktIasct
	PI/M9Bd6n66hVPN7o40t8KwGeSbrRe+yLUoQq/H5+aq9jIbgkBv3ZIoGsuFqsivi+lTQBvDny3b
	ofXC+Cg==
X-Received: from plrb5.prod.google.com ([2002:a17:902:a9c5:b0:2e8:8642:f035])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:18c:b0:2e9:60fb:5e41
 with SMTP id d9443c01a7336-2eb005809a9mr5348485ad.50.1793139148246; Tue, 27
 Oct 2026 15:12:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:05 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-13-seanjc@google.com>
Subject: [PATCH v3 12/15] KVM: nVMX: Cancel the nested VMX Preemption Timer's
 hrtimer in free_nested()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Cancel the hrtimer used to emulate a VMX Preemption Timer for L2 when
freeing nested state instead of precisely canceling the timer if and only
if the vCPU is/was in L2.  hrtimer_cancel() bails early if the timer isn't
running, and KVM initializes the timer when allocating nested state, i.e.
canceling the timer even if it's not fully in-use is glorified nop.

Canceling the timer even if L1 is active will allow KVM to leave the vCPU
in L2 without having to retain an "is_guest_mode()" check just to cancel
timer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 1b30ad7731ee..553915015a75 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -339,6 +339,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 
 	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 
+	hrtimer_cancel(&vmx->nested.preemption_timer);
+
 	vmx->nested.vmxon = false;
 	vmx->nested.smm.vmxon = false;
 	vmx->nested.vmxon_ptr = INVALID_GPA;
@@ -401,7 +403,6 @@ void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 	if (is_guest_mode(vcpu)) {
-		hrtimer_cancel(&vmx->nested.preemption_timer);
 		leave_guest_mode(vcpu);
 		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
 	}
-- 
2.56.0.307.g5fe7bd680c-goog

