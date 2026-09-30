Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434324483A4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797005; cv=none; b=NHGpO1ruFJbNuJm1K/RajP0KeaV6TPtuA4iIfGicDiZQBm26p+QFePtrC2C0ehsOKHebMcWTzuav5yK1hXprpQp2x1agiywsp63lDR1icvL7W1wDeLsw6C88JRSn50vI+7anM9rxFBKgwX87MUmoG9xpaEZkOH6/mHK1bc9Czbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797005; c=relaxed/simple;
	bh=DulPg7/zXtQerdUkYnqcFrpUyi22iOm3y9XoyUHW5AM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ohgFxdLhdJpyjTrn18sc9U89piQQajEgGPd6UYXr0iCU2a3ceouqFW31mpp9A8wzcuJT8I2GFpjXYN92ZuAVJEUpHXOO+541sxfiApWbaW8GlRZVUahaBr31k7c3kI2WzS56X010YSpxQn+bbIZfipHdlBtkQvVEDT3zGMvz9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CArz6yc2; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CArz6yc2"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so40191605ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790797003; x=1791401803; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMCpehhuLNfrMqYXSXfBVNBLKe/opomj2fBIBH93FW8=;
        b=CArz6yc2klrq9LUgsUfzMOYI12fqt8Lxpmj30rYs2JL8Lm3xy8bxSltn04dhh4hzOy
         OZUea4B4w0SkCO+Pw7w85A5D6cZV/Q5anOnO+rcC0zcOi96770jx4ZyrsvYYU/Uda3i2
         oBuYw5ER2pCZfhkB3BPUTvWRfDprWA7HAqCWX8A5bffsk+IYx9N6Sa+jfNNwHW2fxYg+
         JA4rzV+hHW4s1O3WFqiBfX2pW6r8N7R4B7DYcSEkforETFLM3zobTaAngtMkllsWRJQe
         IoMcRL87OtwPzz+ZcNGs8GSPX915VSwqlVZkrJM6kSjAay5McITbrHpyCzwF1s8/6koa
         v5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797003; x=1791401803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMCpehhuLNfrMqYXSXfBVNBLKe/opomj2fBIBH93FW8=;
        b=2BOL00wGJnbm07f7Wl/995tV4CDAvWOXXCM9pKXqAQJLg2hElY44G+di8jxaX2NVk5
         cT8stXAzSUlRUHQlazB++0WNclGQIjd09nkfbWEXLwv/JwSPAnVHKJ4T5p2QdW76z/u+
         quoJgcVsZZaV/GdnabRr35sKq5ohA6BAcVgTVDZU9LgNkRNlM3kELRk48n0ecjLBMPyM
         83EtXbsEZm7IYP/otRbWhyCPcu70DrrsYo0X3wKIo/nGEaW7lJXPSOTQulsRUJPn81W0
         axA+tjs9263EA8ZwEQx4CR6vGkJCNzSrYYYgdezckCuXhSb1FEVw53vK7DyHa2VqURme
         hApQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9U/acLHHP/ar8wap3cNQvOE846tmJaG9f34+MPPDKd0+LS1I30Hto/dAz99vze3/zugUa7oOtOYWP6SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2M58Q5y14ZslO5rm0oX0DXyi/VI90q4Yv/66wwQLiJor6Jhue
	gPft9bVN9Alam/45ojetqAlTnIw+biBPMgxswqg+6uPdEqrcR8rIe5d1hLPh5v04wCra4rBYQtn
	k9xyJ5g==
X-Received: from plec2.prod.google.com ([2002:a17:902:f302:b0:2e2:cd01:aaca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d590:b0:2dd:ad73:c98c
 with SMTP id d9443c01a7336-2e2e4b4a5bdmr17303485ad.36.1790797003299; Wed, 30
 Sep 2026 12:36:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 12:36:27 -0700
In-Reply-To: <20260930193634.3415089-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930193634.3415089-6-seanjc@google.com>
Subject: [PATCH v6 05/12] KVM: x86: Set guest's fixed-1 DR6 bits when
 delivering #DB payload
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

When delivering a #DB payload, set all DR6 bits that are fixed-1 from the
guest's perspective, not just the host's perspective.  Don't WARN on a
"bad" payload (or existing DR6) even though KVM itself shouldn't set DR6
or synthesize a payload without the fixed-1 bits set, as userspace can
provide a completely arbitrary payload via KVM_SET_VCPU_EVENTS (and
"hardening" that flow is not worth the effort as there's no benefit in
practice).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 99518e3265b4..816c6df8dcea 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -440,7 +440,7 @@ void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 		 * breakpoint), it is reserved and must be zero in DR6.
 		 */
 		vcpu->arch.dr6 &= ~BIT(12);
-		vcpu->arch.dr6 |= DR6_FIXED_1;
+		vcpu->arch.dr6 |= kvm_get_dr6_fixed_1(vcpu);
 		break;
 	case PF_VECTOR:
 		vcpu->arch.cr2 = ex->payload;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

