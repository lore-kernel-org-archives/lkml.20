Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B5D242D88
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481481; cv=none; b=lsTosFgdJFER3nSfQyJ74gVqGxI+6Ojt2cNew8BJBNdm4oEYBlx+JtPt345anxSAfx3K6BKvPXtVZOdMQOKhoXWg0VDNILdGMTq9VWWPfCrwLM++nuni/0rQ9qe6L6mqjy8tBlqHpwE2zjwrO64pqXccQ/wF+wx7Ec4a3UJACyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481481; c=relaxed/simple;
	bh=TzyTpIZvX8nCrYGQ78u757hq1EFVtnC4d3w5LisdstQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e66ok7eIHKjZkfHkVcYSI5LhNICn6foDo/mYtugfVXBLhTff0sDJJPpTafJHqcA8ohuG7WbRD24cvcE03UO7wcU7XjwqicgYt5mGCJaQvJzga3ryoRJPG8bg8CcxT+/03O3BjZUNWgOmoM7PtAR3z1Rsgxxj8YSd1/WZPVAYTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bAJLsUrT; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bAJLsUrT"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85599cf98e5so694592b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481479; x=1789086279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ctpiOwQNgtLo4mnzlgvrJK29bFr1/fYhEIoXwvr6TRs=;
        b=bAJLsUrTsHY0eU60SzvZDgtmXWPIpLSX2+qQM0q0NMW1uUQDswu+JN9NXlxKnUZa1R
         6w2P5EeRnUZLah6v7XR1lKxR7ysDQOXBzfHproaWBt9gG12W5fS2Cgq6dF/eUy9NVEGr
         7vGzLRnNp+70XZHpBJp40RUhvXzTZf7VYQJYIzJUCzcECxgEf9dYvZRdNOkMbjs8TFOh
         RQz5kwQbfwy4kt9tFzpZlU8Tk/cx64rJGM84z7ZNkriXgvCwD6KUTzt9X5Mkx8Iu1NwG
         y9vxvp1lsMGp2fvUPpcaRWona9wbw46s8oX1V6zv5ObunL3D4e5cNEjJQDekaNdoFKRY
         QuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481479; x=1789086279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctpiOwQNgtLo4mnzlgvrJK29bFr1/fYhEIoXwvr6TRs=;
        b=XAG9qYOzInY0lkEBrYsaJo1jHlsbpOYk1pUKCQqG8x9fSlq8QruW64u/MTbBLv84dY
         6LEMV7az7CTLuRKEX31k17FrNFw7P6zxrxgGfNx9npe+uJPk3lj4SxlFZL6MpKicXHQx
         F9gXjKnJa+BRYAiQz4SmIPdZfaHyfXgVMA6/uUZki6bqaZjAgSv9Veb4wZfxC1zJkJs9
         Hqdexz8Jf6ppv/CQIyPD1fFHxvgQnJTPhGMH0REHw9eLXe/flJHK/xQ17KmQ2xqz9/PU
         MPxOVV8es9tbZLJ+0FsCNIPEYrnSs3QXKK9pqrHswxuqDKL1EWK38JLI3OAMoMadFbGt
         GGdg==
X-Forwarded-Encrypted: i=1; AKwUvBw1OIqFyCQ81Gv3fmHmgczAYV2GzRG+hNC65JJ41L9ZiFjAHL7kTViqvCckLcXuCSEBw8ECETkIm3eZyQc=@vger.kernel.org
X-Gm-Message-State: AFuF++lhWhy9lI5XomXBgco2A857Rmp8qQ5auC5C8dY7J28YrlJQWy7k
	DqZzbGmcxl+s+oJJ2z4Gl1t/tjEDr5CnHc0Ce8wsONONJgPLs/9uzpRSLOPNz7mW5ytGxXgobEa
	JozF3nA==
X-Received: from pfjd1.prod.google.com ([2002:a05:6a00:2441:b0:847:a13f:28e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6
 with SMTP id d2e1a72fcca58-861662d4ce4mr3977869b3a.5.1788481478472; Thu, 03
 Sep 2026 17:24:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:17 -0700
In-Reply-To: <20260904002423.3154436-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904002423.3154436-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-12-seanjc@google.com>
Subject: [PATCH v4 11/17] KVM: selftests: Add macros to handle simple VMX instructions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add macros to build helpers for VMXON, VMPTRLD, and VMCLEAR, i.e. the VMX
instructions that take a VMCS address as input, and don't have outputs.
Getting the params right is annoying, especially when using KVM_ASM_SAFE().

As a bonus, this adds non-asserting double-underscores versions of VMXON
and VMCLEAR for "free".

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 71 +++++++------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 5c46ae95c4c3..3def8df902a2 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -313,58 +313,39 @@ struct vmx_msr_entry {
 	__GUEST_ASSERT(!__r, __stringify(insn) "[0x%lx] hit %s",	\
 		       __pa, __r < 0 ? "VM-Fail" : ex_str(__r))
 
-static inline void vmxon(u64 phys)
-{
-	u8 ret;
-
-	__asm__ __volatile__ ("vmxon %[pa]; setna %[ret]"
-		: [ret]"=rm"(ret)
-		: [pa]"m"(phys)
-		: "cc", "memory");
-
-	__GUEST_ASSERT(!ret, "vmxon [0x%lx] failed", phys);
+#define BUILD_VMCS_ASM_HELPERS(insn)					\
+static inline int __##insn(u64 vmcs_pa)					\
+{									\
+	u64 error_code;							\
+	u8 vector;							\
+	u8 failed;							\
+									\
+	asm volatile(KVM_ASM_SAFE(__stringify(insn) " %[pa]")		\
+		     "\n\tsetna %[failed]"				\
+		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),	\
+		       [failed]"=qm"(failed)				\
+		     : [pa]"m"(vmcs_pa)					\
+		     : "cc", "memory", KVM_ASM_SAFE_CLOBBERS);		\
+									\
+	return vector ? vector : failed ? -EINVAL : 0;			\
+}									\
+									\
+static inline void insn(u64 vmcs_pa)					\
+{									\
+	int ret = __##insn(vmcs_pa);					\
+									\
+	GUEST_ASSERT_VMX_INSN_SUCCEEDED(insn, ret, vmcs_pa);		\
 }
 
+BUILD_VMCS_ASM_HELPERS(vmxon)
+BUILD_VMCS_ASM_HELPERS(vmptrld)
+BUILD_VMCS_ASM_HELPERS(vmclear)
+
 static inline void vmxoff(void)
 {
 	__asm__ __volatile__("vmxoff");
 }
 
-static inline void vmclear(u64 vmcs_pa)
-{
-	u8 ret;
-
-	__asm__ __volatile__ ("vmclear %[pa]; setna %[ret]"
-		: [ret]"=rm"(ret)
-		: [pa]"m"(vmcs_pa)
-		: "cc", "memory");
-
-	__GUEST_ASSERT(!ret, "vmclear [0x%lx] failed\n", vmcs_pa);
-}
-
-static inline int __vmptrld(u64 vmcs_pa)
-{
-	u64 error_code;
-	u8 vector;
-	u8 failed;
-
-	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
-		     "\n\tsetna %[failed]"
-		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),
-		       [failed]"=qm"(failed)
-		     : [pa]"m"(vmcs_pa)
-		     : "cc", "memory", KVM_ASM_SAFE_CLOBBERS);
-
-	return vector ? vector : failed ? -EINVAL : 0;
-}
-
-static inline void vmptrld(u64 vmcs_pa)
-{
-	int ret = __vmptrld(vmcs_pa);
-
-	GUEST_ASSERT_VMX_INSN_SUCCEEDED(vmptrld, ret, vmcs_pa);
-}
-
 static inline u64 vmptrst(void)
 {
 	u64 value = 0;
-- 
2.55.0.979.g7e5102b832-goog

