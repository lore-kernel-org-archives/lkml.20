Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C64A3414
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143595; cv=none; b=XD1UXdXXkXOd4HdynVvbon496VL2L+cDnROw5PfZkWyFzKfE6Q/ojZ8LipkNyzIID0kmHfMoWMBeGX4dwdlt9pymQQ1e49h+INTbepUsv+sZCsWkjxBEpIectFqHMvLHVrifEi+KdZQ3/Ex/n3LidT1GPRESaHtBwb0z04qg6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143595; c=relaxed/simple;
	bh=0VmX/bfbnx2c4Jtg8/vIZoW31/wztFQKeXEmNZ/1Tso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K9c849sX+DiZoTA8A+BTah3q7WL/qSFWLY8I2VnkhdxWAdQNTpxm3TbH969iyQa5GTZAm+aRP/IdmKe/LzA6tSGCPTOTLH4A8PSsJIiCmAnpq5JSYRqhkStjhtDuHvWx3guvkrsQKF79q1lHxefJzrrSlaTxTlLlGp0VuZzOL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=doGOexev; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="doGOexev"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1089136a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789143593; x=1789748393; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2XnLpR3B7NyNraeHl2CA87GE+9itrvfOuyFtdLAXmw=;
        b=doGOexevKxiQ6mnifRQU2B7qaewmsY/ed5Fi3YDfRsgDhihvu4hihst7WEqGz7jPtv
         eb45YjSAucN99vjdw3gKmHTk33ImgdodS0b87fLYHqqKDBFO4ekAEJ0NDoR7MsPZuWip
         QxiuTO8D0x2e3pK7xFMS0xMmZdcQaztiytg+dLTtnXtYf5ZQy/Cp8aIPxDvSoeHp0tp0
         oK+fiFYnVp4oOPCZlLoJucze4uTk9DctHdetJn7ZegJAmTq+DUelcZRTj5l19M+J42Vv
         CSYUy4t559GtjtRCWA8BgQ07kg5Bq3tCCJqNyPQFNJ6+IczXLSFmSM+TrP5aqCsR4FKi
         7USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143593; x=1789748393;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2XnLpR3B7NyNraeHl2CA87GE+9itrvfOuyFtdLAXmw=;
        b=NVwm9J9n0gS/P+FF3xWu8uv9VoXWgLtOa/ufdfiFSU+OlzUFB2KRexMNALwkKlnLwQ
         HxtlF9l2fxmpgrVjI3+1vTDUljIcvLiB1l//aI3iyM5q9BQTF2gfGEGCSv6p2Cjj4uFH
         rMQ2FHZtwbaK0H+FEW0Z+UWWfse43TIlTPEHwiVn6Z+JjoH5PLLn842bc1JsWlaYCEtV
         VZsiQDxeyFlCQzBDvwFv2g9F1/hkRlS7hMpVkvJXxe4/SKhjr5X6rYLoFwfYrcd0pb1E
         KxzAPI6NeffdaVZrBuZnHvZkP3N/t4Efq/gsJvh4KRSK/uAf4JYtSCHrHLG+4G8vxbLQ
         t2ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHADWRQw7s+UdsG02xvecxTLC0VbCqmFucueT+HWsAKaervxic0Cm7af4MWpaorN3DO/2B3wQTTXlNdOo=@vger.kernel.org
X-Gm-Message-State: AFuF++lIsZujStgWNwtD60bq3lASzksFu9SZ2QnICO19C1R9iUUCu20f
	bWxgPyPDgxk9v6yzYSc2WHFg2MKrp+6Fa3Zzox6/Vr+dWwjU0I4JflX/8LicM7v5MjDn5PnSMAx
	u3f9JkA==
X-Received: from pjbmr15.prod.google.com ([2002:a17:90b:238f:b0:39b:411f:f252])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:398:e436:384
 with SMTP id 98e67ed59e1d1-39d9bbd7b60mr8793864a91.1.1789143592529; Fri, 11
 Sep 2026 09:19:52 -0700 (PDT)
Date: Fri, 11 Sep 2026 09:19:51 -0700
In-Reply-To: <20260910115414.3015260-7-ewanhai-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910115414.3015260-1-ewanhai-oc@zhaoxin.com> <20260910115414.3015260-7-ewanhai-oc@zhaoxin.com>
Message-ID: <aqQqJysVQxS76YIE@google.com>
Subject: Re: [PATCH v2 6/9] KVM: selftests: Skip PERF_CAPABILITIES vCPU checks
 without PDCM
From: Sean Christopherson <seanjc@google.com>
To: Ewan Hai-oc <ewanhai-oc@zhaoxin.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Frank Zhu <frankzhu@zhaoxin.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ewanhai@zhaoxin.com, cobechen@zhaoxin.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Ewan Hai-oc wrote:
> From: Frank Zhu <frankzhu@zhaoxin.com>
> 
> KVM allows userspace to query MSR_IA32_PERF_CAPABILITIES through
> KVM_GET_MSRS even when PDCM is not exposed in KVM_GET_SUPPORTED_CPUID.
> However, vCPU accesses to the MSR fail without PDCM.

Hrm, no, KVM is supposed to allow reads and drop writes of '0' for MSRs that are
advertised to userspace, but ultimately unsupported.  I'm pretty sure this is a
KVM bug.  I think MSR_IA32_ARCH_CAPABILITIES is also affected.

Completely untested, but I think this?

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index dd3bb04878ca..fa77cfdbda7e 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -512,9 +512,15 @@ static int kvm_get_feature_msr(struct kvm_vcpu *vcpu, u32 index, u64 *data,
 
 	switch (index) {
 	case MSR_IA32_ARCH_CAPABILITIES:
+		if (!kvm_cpu_cap_has(X86_FEATURE_ARCH_CAPABILITIES))
+			return KVM_MSR_RET_UNSUPPORTED;
+
 		*data = kvm_get_arch_capabilities();
 		break;
 	case MSR_IA32_PERF_CAPABILITIES:
+		if (!kvm_cpu_cap_has(X86_FEATURE_PDCM))
+			return KVM_MSR_RET_UNSUPPORTED;
+
 		*data = kvm_caps.supported_perf_cap;
 		break;
 	case MSR_PLATFORM_INFO:
