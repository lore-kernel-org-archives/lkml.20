Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0823515DC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730799; cv=none; b=N4Chf5u+AmlYyUoDcEICirDeNAN8ZViAebJO0ql7e46XqLbGeapXJkRFSp3yxHRTJCne90CteusrzxTWPTv3LMeyUHGmFdW5bXM7WrBbFHsabv0aBeQqOKTRLspe0/ujF7aH58C420AfenkznCmgU5OEAN+XIr3n4LEUEPvxoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730799; c=relaxed/simple;
	bh=A/nFV5I8OILCijxu4ThN2Sks1ZObqHSvT04Eu0v4C6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RuGLoE4PCsj8l9nBrqlb1Y0dbU/rRHWzYn//2CXp2rLWqkDUy8PhrTlP+pGD1YWvyAmp5T3nRo7Xjq4nREZzS/eJI6VkRDU5D3GjOgq/QVnAGlYSzyPgtKbC+vWvNTsZ6/8SIt1IxF5chiCX1126LfMriSelo3emlfBTCTBhrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3iIWgFC; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3iIWgFC"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd667770efso10646775ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730796; x=1791335596; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A3HfqFgv58Oe77VJobLdkIke4fLE6/94erxxiYljr/o=;
        b=R3iIWgFCridW07kcurls9McIsFK35ewXiQra5T99vMFhEJUe1Mr4ntxdZGxwcZy1NE
         VE9I9ZWSU+2VLEMdwS4mqulpDxxMK5iO82DoEZCzfvnrxqzwVuFcfonkMA3MBTG+0JZg
         ycHJhRohdTphab3dfsFSjMKkrdnlPx7xNRhGZjFi+OMBSZHu1kId/ojyeH9l5oiVTuL3
         hhGtKPTRc7mIKP8sXql6RzIjY7IhG7Fs7quAWJwN/2XnqlMxmP10kr611vx/N8jRnVoZ
         7k8Kdenc3MnuPF+WywpWDcvSTCcuCn3jbSbFJ/AUAFnQtC+mNjvR0cSB8sPfcjQQq+TU
         605Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730796; x=1791335596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3HfqFgv58Oe77VJobLdkIke4fLE6/94erxxiYljr/o=;
        b=l3rP+qaBwFpXlzL9TFFwNxhRtKFpVudgwFh5YpO446rbp8igcNKEEGUCXXyHuM3j3D
         zxdxpvIHa0UYDG6c5UXsJA4RPIlaCsrOpfVfR/a8w3DRRIQZC/n4ZBfaFWiiFWTxRxrE
         Tu/BTPvLM2mZBhQSO3dGoZwfR37wKZmBNztrFqc+P1G1khi0yuC1fGRyQFAzMmUH7cmm
         8z2WTahO26IiQMZSUwoL0iQ6JRwBWsuXWZiMtaWsofterRwHyisEoX5K5PXB0kUZtzmG
         44pqwAX3b/o0uDYuwRrIZDuNyWSejADXOKQF0gYcL/+qVxW3DBscxrolGrMfAfbjkHIN
         yAYA==
X-Forwarded-Encrypted: i=1; AKwUvByHjkougtgmm7VnpoA0rVbaF2TsLPe+hYaCLdRTctV/5GqlKEgufRhnkPccN5iqGhaK4WipVnz4UeMRx/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUmFi3LKBHRxzyPwr9NWUdOKiigi5514hDl29+7wpUflxyfxxJ
	/YeG2ThMouoZXHr7uD9zuEyrNDTSbhjDxXxakubQUkjkjN4NNhPKClDQxx/5XVu8mqDviNgk0Br
	3KkFn7A==
X-Received: from plcj9.prod.google.com ([2002:a17:902:f249:b0:2e1:33e4:b284])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:110f:b0:2d7:1cbd:9ceb
 with SMTP id d9443c01a7336-2e2c48e5bd8mr24730325ad.12.1790730795821; Tue, 29
 Sep 2026 18:13:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:02 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-2-seanjc@google.com>
Subject: [PATCH v5 01/12] KVM: x86: Preserve DR6.BLD (Bus Lock Detect) when
 delivering #DB payload
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Preserve Bus Lock Detect if it isn't present in the payload.  Unlike RTM,
which is explicitly modified on every #DB,  DR6.BLD is modified if and only
if the #DB is due to a (coincident) Bus Lock Detect.

Per Intel's SDM:

  Other debug exceptions do not modify this bit.

And AMD's APM

  All other #DB exceptions leave DR6[BLD] unmodified,

Restore the explicit RTM handling that was clobbered by commit
9a3ecd5e2aa1 ("KVM: X86: Rename DR6_INIT to DR6_ACTIVE_LOW"), as the
semantics of any given bit are feature specific, i.e. are obviously not
consistent for active-high versus active-low.  In other words, while the
bug was technically introduced when support for Bus Lock Detect was added,
it's really that attempt to genericize handling of active-low bits that set
KVM up to fail.

Fixes: e8ea85fb280e ("KVM: X86: Add support for the emulation of DR6_BUS_LOCK bit")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 52 ++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cf3fcdfd8ad2..ea1406c3b260 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -401,30 +401,37 @@ void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 	switch (ex->vector) {
 	case DB_VECTOR:
 		/*
-		 * "Certain debug exceptions may clear bit 0-3.  The
-		 * remaining contents of the DR6 register are never
-		 * cleared by the processor".
+		 * DR6 is a mess.  Reserved/unused bits are fixed-to-1, and so
+		 * to maintain backwards compatibility with existing software,
+		 * features that use previously-reserved bits have active-low
+		 * semantics, i.e. clear the bit when the feature is present in
+		 * the payload.
+		 *
+		 * Further complicating matters, some DR6 bits are preserved by
+		 * hardware, while others are explicitly modified on every #DB.
+		 * The trap bits are always set based on the payload, as is the
+		 * RTM flag (but it's active low).  All other bits are modified
+		 * if and only if a relevant debug exception occurs, e.g. BD,
+		 * BS, and BT are never cleared by hardware, and BLD is never
+		 * set by hardware (when supported, excepting RESET).
+		 *
+		 * Lastly, the payload does NOT have active-low semantics, e.g.
+		 * so that it's compatible VMX's pending debug exceptions and
+		 * qualification fields, and to avoid bleeding the DR6 madness
+		 * into other KVM code.
+		 *
+		 * To compute DR6:
+		 *
+		 *  1. "Reset" the bits that are modified on all #DBs
+		 *  2. Clear active-low bits that are present in the payload.
+		 *  3. Set active-high bits that are present in the payload.
+		 *  4. Clear fixed-0 bits.
+		 *  5. Set fixed-1 bits.
 		 */
 		vcpu->arch.dr6 &= ~DR_TRAP_BITS;
-		/*
-		 * In order to reflect the #DB exception payload in guest
-		 * dr6, three components need to be considered: active low
-		 * bit, FIXED_1 bits and active high bits (e.g. DR6_BD,
-		 * DR6_BS and DR6_BT)
-		 * DR6_ACTIVE_LOW contains the FIXED_1 and active low bits.
-		 * In the target guest dr6:
-		 * FIXED_1 bits should always be set.
-		 * Active low bits should be cleared if 1-setting in payload.
-		 * Active high bits should be set if 1-setting in payload.
-		 *
-		 * Note, the payload is compatible with the pending debug
-		 * exceptions/exit qualification under VMX, that active_low bits
-		 * are active high in payload.
-		 * So they need to be flipped for DR6.
-		 */
-		vcpu->arch.dr6 |= DR6_ACTIVE_LOW;
-		vcpu->arch.dr6 |= ex->payload;
-		vcpu->arch.dr6 ^= ex->payload & DR6_ACTIVE_LOW;
+		vcpu->arch.dr6 |= DR6_RTM;
+		vcpu->arch.dr6 &= ~(ex->payload & DR6_ACTIVE_LOW);
+		vcpu->arch.dr6 |= (ex->payload & ~DR6_ACTIVE_LOW);
 
 		/*
 		 * The #DB payload is defined as compatible with the 'pending
@@ -433,6 +440,7 @@ void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 		 * breakpoint), it is reserved and must be zero in DR6.
 		 */
 		vcpu->arch.dr6 &= ~BIT(12);
+		vcpu->arch.dr6 |= DR6_FIXED_1;
 		break;
 	case PF_VECTOR:
 		vcpu->arch.cr2 = ex->payload;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

