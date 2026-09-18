Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29984E9C36
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731418; cv=none; b=OOObWsz+fWu+bEfqRuz3/RInJY8oWiznA7jM3dAsMY1kNIX6q77re7FY741iyjfo4Yg85nOGBZpmbkZw5EoLFpBgdV5CfQFMOsYmwk6xnCsMzyNig4mtAzUOL5uWEkJ5E6lWcuhRIvLV/Zd9+QFgJCwGCe3lzqhgXUx3x3I7etA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731418; c=relaxed/simple;
	bh=cq67vtValCzXKP0JnfJpqL0gle41URPMyyjjif4LXCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOuRK7YvNJ1UBiwgblY25d+r0jD6UEXho2lr3fpR0oOa64PX3ymmDc/x+BxaxRYlD8ou+UzZg1a1EakMJu/C8x7mRKaX4L1EDKlDCeos5CtMxDPlArLdq+Ob02nhshdBuehori2Y/84iIjPexUvVmkqc2fZ3fi0ULbfkWztc9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ8RKtrl; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ8RKtrl"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so473062a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731416; x=1790336216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goutfUAx32FOvBhVFBRbSGLDzTqpTfwkEkewd8WhIgc=;
        b=RQ8RKtrlE8SFat42bMZAUWGArEK4BPtD6Ull91/gtwSEc8wChuXAUiFZngIwNANVv8
         TCdBjPiLzIvxLFRv2FyWAx4elhmImb07GwkFyfqPR8FLvYFZ1v3eQNkW+ZlP5R8F6Jw5
         +aCaiRmyJpYnupshMEOWg3kZI+y2yvjfMg/YNuEwyfNaDV0FBkp7SNurulWffJ39i6Zv
         mWnMdYcrZ0SS7UZ7h+6DCGsM9TmsAuYAc7w0eYcAmFRewA0lXgYAPq079O3NLHpBYMmW
         VekDJHMQx/JlPvde0Pw/zVwdaekAj3vPAMWot6NWgmSFrKw2dxZ+OsARB8fHGgAakHpD
         qVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731416; x=1790336216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=goutfUAx32FOvBhVFBRbSGLDzTqpTfwkEkewd8WhIgc=;
        b=wJlIiKE3SvGvvklQwB8B7Yl4nRO7maa4AuTRmKuKboSC0ghGqxciZxm1cr0XLHLqg9
         y3Y9t0q2mbrUB0fV/Ozc6yyHYVjY/awZ8keG6XOExRsszz3Q04uoYgn+GgMNY5MFJmaZ
         vkRJW9c8nB/oIIoiHlN3vldiTT/Xlc2Nm1zIvUXTCA4Es+vI+YKYczHTAV3xEGoRvPa3
         49zfJ8nWXNscJTiNlnobMsrZFMtR1gInl/SzmnZRWcWGQAQnI/LH6MMQQkoONiLe5ADw
         lSHO9wM6Zg9nxHaIgzhIIDRAayE/ifrQrbkMdRcb18X3RJTRxjDfYt66cOioNFU6A82d
         60pw==
X-Forwarded-Encrypted: i=1; AKwUvBwdN9SW7ILkVgD9CSIEQDSI3xmUxbMqEP8Do5NmNf9nJ2MY2r0+e/hkZ6MjsOS07yZGAz2xV9cLsHjDrI4=@vger.kernel.org
X-Gm-Message-State: AFuF++mbMH4ivJhk5w+IAZiX7mfJ8wVI/sXak6e7hNB+ltCl5nLrd60S
	6gSrFO/LeGElIR+c9fPfKbGO9gKNP7wKPsZHg00wyYZyxADiq9N6Cdlm
X-Gm-Gg: AYBFou0iEO7eeZqm4x+/YNXGonM6jtWbJxf+lYfjnPXV+0Lbwzoe7jv2+35JzSX8Peu
	HcIneZEe9SVl/LDHu/8T02rbXeafK27dcLikqXGTJwNW82b07drNhnpyWzzw58DVIzf4IaRVnAD
	rsVLD0oGJ5vy5/IzokvAetxoTTyL845JSkeT9Opv4TFVxk7K89V8DRUOe2V5342GPL6SBImIVw7
	UT5Q7CF95E7MNV6HcZz6lv1fd5NC549290MdR6S027H18L+Ylo7RMy1c9rzxwjLa8LO33ldl7NQ
	eACIp8sLDFPwsbP7pxzd1xs2or3xPxEBPtdcxf3gweBmwJdApv1OGwTgybYMbkS4BGymlw1Us/R
	nYLqjI5LApAfxl75SGQHw5YqUKJyaqeI1wVXyTaH4B0VnSjinNBkKEiB1AGhNoPmRieuazindDa
	j4gA86svsyNiYgiunbMJm0B26ldUjpYEwCf/R6fKDWjLBPHEDnseLak08DNEJGN5qiyzw7dALc3
	8POeAEXMjt4
X-Received: by 2002:a17:90b:2c8c:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e54aa1442mr5549176a91.5.1789731415773;
        Fri, 18 Sep 2026 04:36:55 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm3735097eec.30.2026.09.18.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:36:55 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] KVM: selftests: Delete the declaration of vcpu_set_cpuid_maxphyaddr()
Date: Fri, 18 Sep 2026 17:06:30 +0530
Message-ID: <20260918113631.634233-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918113631.634233-1-gokul02k@gmail.com>
References: <20260918113631.634233-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcpu_set_cpuid_maxphyaddr() is declared in include/x86/processor.h and
defined nowhere.  The declaration is the only mention of the name in
tools/testing/selftests, so nothing has ever been able to call it.

No Fixes: tag: a prototype for a function that does not exist cannot
have regressed anything, and there is nothing to backport.

No functional change intended.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 7579e692bc2b..ffe95ce1ad49 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1180,7 +1180,6 @@ static inline void vcpu_set_cpuid(struct kvm_vcpu *vcpu)
 void vcpu_set_cpuid_property(struct kvm_vcpu *vcpu,
 			     struct kvm_x86_cpu_property property,
 			     u32 value);
-void vcpu_set_cpuid_maxphyaddr(struct kvm_vcpu *vcpu, u8 maxphyaddr);
 
 void vcpu_clear_cpuid_entry(struct kvm_vcpu *vcpu, u32 function);
 
-- 
2.54.0


