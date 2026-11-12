Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441741;
	b=XezTLq9ULvK9IYUKog6IliyWf5nN9wgAyFpDYy7swYqLdkw/BdYSlFdEy/HiG2Q7Gro5
	 49mcZtvuvXLDG9JoIMIG99H/SBprRe9b9pqeVOqOTUool5wUsP2SfXDSGYHjstCIfD4l9
	 M6uTc5/cweccXjxgVIuCNifoSweaOHeL+2KqbakBUw4KDd9xV/jiXusM9aauX5qiEdZiw
	 kfibwPlwNbLoNC0YGeAs04nspFR+xOixzECgxUPOWMdaEwlZOWJDpZyut/hI0+YLInj7E
	 26lwiJ3ieDp1F+1lHJeNBnmNlcHtSiRQTxCNw3VXwh5iTSKrYHaZRVMpTov8IcVHkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Q+6J/DQ7IMd0v2V2aVaoHh1rHXWM0PUb0FqkcNSz188=;
	b=b0ouG2db5KflaGYgjIh1Eili6sAfgr5A4FlrVnnD/j0+WAij6fgrGPmHCx8rwJLB2dQo
	 XF4fPerIqkSsmPegqzVgeAgxHxOg5fy938GgFxan4LBQRNB+/RLj6hp8WQbwTps66nHiD
	 LzUSIfHlDluEGo8SbYmZutT2x3GrKqI2ghxbOt05RDusFYWyzs5sCUcwswbnb3Kxm9iPC
	 I2Zs7sv2oA+NE7vBX7F0iP2ZXM9njBP2EeF0a+6ZyCpsRbOeDTORFKXIkQLd+2CaQSugL
	 KB6uuevgoAbawnxVoqpDO47ZGaD9JOdSRY32oQkfp2yvRJ1Q1dv7q8xqOZWSX3oX3Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2mivfA2;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FFC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2mivfA2
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dab94dc3e7so6659648b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794441739; x=1795046539; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+6J/DQ7IMd0v2V2aVaoHh1rHXWM0PUb0FqkcNSz188=;
        b=K2mivfA29B3ATToRg+o0oa0LI0CShsYZov1CvZfuilRb6ISgP8hmq/lKS5I9YZui+M
         TlKq/B9cLkes7zFWE5iVKPeQ0bHU/EWmoM6MNuERHnrnKd+AKBdquNugH38PmpCWI4fa
         WkGWO5X1BXT+6kMonLfoUqQrFs6clhde1sGoaPxG3u4+J9T1+uY8wVPD45uZLtI3JJbK
         Cchrp93646GeeN5QWaIpGwDzHp0XtvczGPjBNWnQvkv0NyyNfzdSNG8Pv3u5C1hbhxq4
         Tu6jTxggl0hz5SElxOkeB60gzAu/IlXd3OrBpXIQysWNh4Z+u2AZof/WKI64sioeOrwM
         39UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441739; x=1795046539;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+6J/DQ7IMd0v2V2aVaoHh1rHXWM0PUb0FqkcNSz188=;
        b=yLQakFJI50gAtvDk6KpCDbIGxTwBbdM29KGQdv44rVml5KN6u+mOdgo3zwfCRDHBBA
         +J/95TqmDC+WoorgvdmgvJzWqenqc1rybeaHwi8XTPcYFWUGTQ2tIUSYYFoGVOfhcD8u
         0c/Fus2zJ+YWwUwdlTpGbTEOpS4WuwBNPSiQ78aBlp93kX7ODADlau+JB97IE8OLz1AO
         11Lsiljh9sBVIPNcsBTNVoko3noe8pwYCHU0yO667qLHJwjb50e/aaxcWY120cqTyxqB
         5IWQkClbGiVWHMrhTO7D6pLQT8NOuhjXhAE+PDadGq+OWHAq6xswOZh84nZklfEkbM56
         LdCw==
X-Forwarded-Encrypted: i=1; AL+hErHRTqGd5d8QFatER42ZCsbLqmBwWHx0P+HOhRZxMbpAASgFwBwor2x49JiSm3pQ6bxeuf6uAL0Bno3ocME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kpRj9FzJo03R6HvsdxPPwU7QU7jiN/RCicfD99me1jikaLjjl
	b9qxnYqPjXmW75xSaZj+voZP+gIHRUMi5/C3VPx2opj/M8jA4oqdC2y5gBAn5BzHSnMvwuonqnJ
	QPuLYJ/Q+yb7vcA==
X-Received: from iobjf8.prod.google.com ([2002:a05:6602:6488:b0:9cb:53d5:ffff])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:13c2:b0:4d5:295c:a82c with SMTP id 5614622812f47-56b9771892dmr4190007b6e.57.1794441739057;
 Wed, 11 Nov 2026 16:02:19 -0800 (PST)
Date: Wed, 11 Nov 2026 16:02:00 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112000200.3005587-1-jmattson@google.com>
Subject: [PATCH] KVM: nSVM: Mark VMCB_CET dirty on active VMCB in svm_set_msr()
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

In svm_set_msr(), writes to MSR_IA32_S_CET, MSR_IA32_INT_SSP_TAB, and
MSR_KVM_INTERNAL_GUEST_SSP update svm->vmcb->save.{s_cet,isst_addr,ssp}
(which resolves to vmcb02->save when in guest mode), but mark VMCB_CET
dirty on svm->vmcb01.ptr instead of svm->vmcb.

A stale VMCB_CET clean bit may result in the loss of those MSR updates.

Mark VMCB_CET dirty on svm->vmcb instead of svm->vmcb01.ptr.

Fixes: 48b2ec0d540c ("KVM: SVM: Emulate reads and writes to shadow stack MSRs")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/svm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 136069dfcd44..eab11fe50312 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3181,15 +3181,15 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		break;
 	case MSR_IA32_S_CET:
 		svm->vmcb->save.s_cet = data;
-		vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
+		vmcb_mark_dirty(svm->vmcb, VMCB_CET);
 		break;
 	case MSR_IA32_INT_SSP_TAB:
 		svm->vmcb->save.isst_addr = data;
-		vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
+		vmcb_mark_dirty(svm->vmcb, VMCB_CET);
 		break;
 	case MSR_KVM_INTERNAL_GUEST_SSP:
 		svm->vmcb->save.ssp = data;
-		vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
+		vmcb_mark_dirty(svm->vmcb, VMCB_CET);
 		break;
 	case MSR_TSC_AUX:
 		/*
-- 
2.56.0.567.gdb80ae8cd5-goog

