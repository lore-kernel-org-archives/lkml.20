Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317847;
	b=C7mfHnzxdLOstSS+S0aPDAjJ9drI3I0rtUF964yS0ExgVxv7paZO3JpzoGh2Vlsl3too
	 sZoksFR4O+h7NvdkBlEgCNkhdU9giKeGFZyHV7PQ5hUdiCipYgLJ/inkZ8pYm/UrB9Y5Y
	 dikszzaFdB+jsrA9BM3Xu3AczjqWe3xCnNtfuy9E+FwTUaYhpIsUsmUr771BNc9AM4u0l
	 wjQdvOES54ZsdQvVn8wLnGLACjOSAFfcTDxS/VVj7s6hJ3G/faYNMpkMg6yBGLEPacHpo
	 lguS1GmoIEY5FD4tLt91WApvGLiod5D5IOpCoj5JVwiFbfCOB2X8/3wZKNFcjN6qRsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLKH9Mb7xVZoEANx5zLK4zjozsRFYCrTpLOqfVIFbFU=;
	b=hO7uYl5kyfcirEyYAY2wD7eVjrjXMXXrT7Dp3VYPMVxmUCzHHOxcErYZW7+SrUzetJGH
	 n2bCcF+X9Cp/x/fCRUI8KCj5v9xq/Pn87UUZB1fEvoFBaIy1PX8pyul9qjEJ4qBRQn23z
	 mhlfGZDHf6Y0SXJQZdqXx78NE9/6hEIn+hnTTt5KiOaDBPYeqrnCU404+kTB4c5Y7G9bs
	 dBkXJNIF6zlTCzfWMP8SYZlxDS6G3sMqcWCEwCOU3zrBiDxpYGTYqXbzO/Vl4AEeoJmAQ
	 iTKD2e7kQ8DRftxPRh1cD/aiMBti/Xdze7aGVryt/A/t5Qra5sCThwLcfhaQ0rOnQqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6t4nlL+;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4F606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B4F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6t4nlL+
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so1068175ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793317846; x=1793922646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLKH9Mb7xVZoEANx5zLK4zjozsRFYCrTpLOqfVIFbFU=;
        b=x6t4nlL+/THve+kHJInO3FmP78H3hnlw8R/TNjnUl0q+3MFcz8V4p2WlKkfwrIeXFS
         dDSwysLd952vKhoSz0Fp+dzZwXu+dKZP27WkOYTQmGRQnUCUHrh/2EuLAyFacYHoeIME
         se9FT4e+jl1v0G7doBPpOqMr36vuV1RSriPV0lD6teqvd+fXmoWME/tjOggoTaTOGgpU
         RBb6Cl0ys+h95ymk3vujCbKnKUH12Mw/bxVwKgCqg5/Aw1ToL5oEo2ENt13nHGiRcmzr
         TgE6r2Ym3hB6e7/Xc4mc9JlIT2yeBi4am/Xwi/5ygOXMRQ1bJ0X3s9eZ7NQzRF4WnZKf
         xpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317846; x=1793922646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLKH9Mb7xVZoEANx5zLK4zjozsRFYCrTpLOqfVIFbFU=;
        b=u46+g/IHnh2PfwXCNbR7uLMY+8FLe+BwWMw46W0tW4V91qQUK6v4ys9ZXSW0aSgESv
         Nq5jbqcdAdP4ivPuVO/pFVpKYcCCx0dHf+8QGVrCDMJdanH7y8y6X72JGMVRYqymNOiT
         JH/RQXgZZCxCh4FoTYGLluKWhDy/55yoxxn2pAn4GAA29zFxMy3HM4JFqWLxZTQQtk4z
         NZP4bwuMdYtZeV53huuTyflIbm+D85/tSKBTwLk+2WjuRax6gdRp0qlCrX4eJOMuZK9o
         /Tr/5T0SmZelSQ8X0YkIEZf6nAjFMbYF0pEcT7wTq7VmRqjgpg4yVXLrVEqnfr42Pv4h
         xA/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2khq1HshPT3k6Ey2hEGbL+jxC7tuLbrDkRCCs8fWXAivDuyhVzrfLGqO4OLohB+mH9XC4cHOLM4mYBI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKza90+4XmHp5R/pa8kPVD55jDY5oUs7bqgTtTH8mnQzgy4G6A
	P5XnNeoq9Ql9Gcm7/nZm8GZAwTAML9rUJgu0LtfNaJd90zeD2CYMuq4E+ck5Lw==
X-Gm-Gg: AYBFou1pkdaeUN14K9IaBh66K9hVmYOIual5Ql0Imzs+V1UuyQT1yGY36CaHYZ5Mv/k
	twPFFjPRarK7bLuTDwWKU1ZkXI5D5GkMhOcIElC4oUSrNsCo83/SVOQ0qdrLujtDn93g7Widt6x
	URmmMpD5NvD3SN2fHJRsuBrZ+NV5XJ/OF9hDujbkIrGwMR3NWj3IKk3vxDuEKDKI+3MDT6Tb+Pz
	lbVXDNxdMsbsph9zZi+17y68hxdUOVeYUw8YMB0+57JaHtMSKlZOiL5C6Ht9E9jcq8bI2T4Ceo+
	BKyVa+uimgS9i1Gcj0nmpST/BDKRv6GHvBlwYc6krvMzDIWBj+0mVy5xTEQmVUBZG1zWbwuQfpW
	Rk6eBp6eTes1cMXCQoCjPHig5u55/WqnDzLTP3D2BJc/k5wkJSggn5bis/wvZAXhFastyTDomaz
	leVLNsGvgvjjQJGy6m4JF9B6XaHop3ohZANgwV6tWeGct4qvZXozemchE92wEIuS/nREPynRl+S
	bXTYWp/K8Cn38HZKPz9msS6/Cl5sGDekNi5tvFB0+rhWp9cGv/1K5dYVAZeBjAsBsSyS6Ek8TVC
	U3PZjAhEbWzKhVMl095GQjbp4XONACoeKVJY5IzFqKYTpNWl41bcei7xar16eisfFfSCcNa4B7d
	Gf6m9DCFC8w==
X-Received: by 2002:a17:903:24c:b0:2e9:4b32:fc6c with SMTP id d9443c01a7336-2eb3643d494mr8145375ad.26.1793317845994;
        Thu, 29 Oct 2026 16:50:45 -0700 (PDT)
Received: from monk.. ([2604:3d08:8e80:f800:3c86:745c:97f1:5486])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266f42sm384225ad.40.2026.10.29.16.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:50:45 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 1/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned by L1
Date: Thu, 29 Oct 2026 16:50:39 -0700
Message-ID: <20261029235040.12013-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029235040.12013-1-ma.mandourr@gmail.com>
References: <20261029235040.12013-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

When L2's LMSW exits to L0 but not to L1, emulate it through
handle_set_cr0(), as is done for MOV to CR0.  kvm_lmsw() ignores
vmcs12's CR0 guest/host mask, so L2 could change CR0 bits that L1 owns,
e.g. clear TS, and read their effective values instead of the read shadow.

Fixes: eeadf9e7558c ("KVM: nVMX: Handling of CR0 and CR4 modifying instructions")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 arch/x86/kvm/vmx/vmx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c60..3633496299 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5748,6 +5748,21 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 	case 3: /* lmsw */
 		val = (exit_qualification >> LMSW_SOURCE_DATA_SHIFT) & 0x0f;
 		trace_kvm_cr_write(0, (kvm_read_cr0_bits(vcpu, ~0xful) | val));
+		if (is_guest_mode(vcpu)) {
+			struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
+			unsigned long mask = vmcs12->cr0_guest_host_mask;
+			unsigned long cr0;
+
+			/*
+			 * LMSW leaves the bits L1 owns unmodified, as does a MOV
+			 * to CR0 that writes their read shadow values.  Emulate
+			 * it as that MOV: L2's view of CR0 with LMSW's bits.
+			 */
+			cr0 = (kvm_read_cr0(vcpu) & ~mask) |
+			      (vmcs12->cr0_read_shadow & mask);
+			err = handle_set_cr0(vcpu, (cr0 & ~0x0eul) | val);
+			return kvm_complete_insn_gp(vcpu, err);
+		}
 		kvm_lmsw(vcpu, val);
 
 		return kvm_skip_emulated_instruction(vcpu);
-- 
2.25.1

