Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163693;
	b=F3ux/lwsTHqmTcgigpGmIAQ59bJ1D6VEmHc9CzM0DiFCQ7zqtySCP4iqjdYWyBm4mWIk
	 6ze41CvkKiidYnlsf4yEX5G2/zf1Lyq1VkahLX/2J31Qz7FG9xs5oqq17a96jCbovfIa9
	 0GOhn+7bfcI0Ag4U3zjd7uHHh9iCt9cE88BfE/bLY9UCDgyzdOQqV/WLUPkLbmpG68o9G
	 qhjya9kFsUsCi0Bx0hCU3P5cbmcwRjW7Z5W7qC8xXJhZmUva15uHgW2oXbuZuOGIxtlbj
	 7rbD0KsfD7/IZuRJHIRxEDTE88y//hWgqPeqYc3xqwXAxjOcfAmUiC2khmLK0VLXw1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
	b=Cv5hjqmgN2ORwbhqdZqNX2p+isH5Jjy6ntIG+1zX7giW0Rap+vThNMqdEJ9+a0M8By1E
	 fQiHbjAiS0o+I4YEHMyxJYhZTTBrBPQu3pct7MniZmf6QMLDA3mk+fuOwRbKWJNOG0WJr
	 ZpWQRGYOU5jpkhaKvxAg5CBNCj9wkUPvRmdeuQNI59e0oiepLIg4r9DKg66cOB7dmjFoJ
	 /zh/KOfO/f1nsQVuOfAPA9uJZ+O5/I7YycQd9b+wvrm9PzAdlYEzWXPWOkiE5k2UgQvpX
	 4I2CydkyabpuGIHt9tso3SIt7+JMMoZGSyNYXtZsLlVRzKkaGcn1oJX3yDW7rzlDhog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwNyz0N9;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67860A3824
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F67860A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwNyz0N9
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso343392f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163691; x=1793768491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=vwNyz0N9FPu0o6YgZqRkzyBxaG10fWVAQOVs2yTJgwqUwsngi4f2LJYKzFLwLUAh67
         DOwSrB1EfBP4ISN8zOhWqBzWBG6uMI/a8jXB/Yt3Eh7P3t2DH+W+WaIEf4hgvUnIlGmE
         GU5KvEwXJh8uv3n77XZebnt1KWXR2VyExWIWlJtV74udckaWC8GU6wbAZcJIsFK3x7fI
         YoIH0TbFMLnn1s8tTSfhq2glVItyFXNbYZyqBPMS91Dzi5FJV4Lqvj/EPW5g4F0cGnJn
         FHCwWqZF8zeQaGmVa1nHtDPvFg/O8KHPXK9fO+TPJjU66j+zkQF8pb3SbU3/sFK7+CXK
         h+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163691; x=1793768491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=plIEF2iP2uezLQ4Uv96Q7eBQg/XpUehMknq9/ipXL2uQ9XAwHwTEB4oA/aq8QXLoZC
         xBMLoWANuzt+i/0wFrnjMbiLPmgY+h1E/rniBG26RmJFyNrhxW6uq/Tet4QCXZgA5LoC
         8DgxvTl1ykfGMeAoAJ3IxKVqtB4rHtuo5HjTzeCJmGNEApYDvTy4pNky3zKH39DeeXMG
         yb+hbRS7VOEPEHWl8uGLSarRRAz61Q00gmSgD995wA9JdY51PGLdcJwxeh0RQ0EBSWFG
         y22UKpxvs/ZasQWI1WzfXVIEiLVBO8tvH0N4rrLM8vMYvvxJ9BvAuY1qhE2HEvpwHy4P
         OIAg==
X-Forwarded-Encrypted: i=1; AKwUvBwHiQJjmdxnDZXV2e4YKadQWLe1jkcYFtAxz67Mt4cGtxLz6vdSkNCbFGMJc7duWJS713+KNwMI9L6FGbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf+oHrEStQAy1XQjxgD5XKPcMXVlr2Mr7M86LMRhhKU6r2Vg+D
	uuQVr9zNi+N4IAFZ0BWD/2el5p2LcqSOn7kg8jGmPNqQJR/Y6ezjqdos
X-Gm-Gg: AYBFou09LPceUIHS9YEPXpb29W+kIubKrFeHBeEfAAxb1HSNZGycaDY+1TfcQP1I2jL
	K0G/XAWlDaOuRRBZPqxLNs7MPYxXvcN8gLz9g2VDsVDFv9RPt3nKAFWAka/oKc5u38V68R1jDpY
	WRFAIF6AK10l/jWlphFiFPwigtnjs3l+/Bwx4sek1wP1D4JAmBzz7Wt3C0ZE7UewXbKLHcicaFF
	q8BhYIKDCSyClWBFJwd5gXEjXtTDabc8G+gS8ztgyAxDXIpldoD41/LPQDXfgCb6EvNwEwWysXA
	tqv4RBK3z10pDqKfS1OJx4I3F6mWfm2yGP9HEMJm2erypG5BkaWuNGiX4b4KgtHzRCQdARUk4zo
	ywF1kx6p93odGK1271SbWAWmJL6m9I75pq+c7CwY/339ZyIfZS8Lv12/Q9aeBQWgETM1PyFO9XH
	7CC4NfegwP5RgTu3rejxf7MQ+ei2iDt5RafkxAYEBQoIzAVMKFHu7UKDI0lXFRzc1VxBu9Xvx4h
	ANlzYOqRHHNaj4nt2838SG8IhLP4ZtAPYVpgOolGMIvKknuhTq9ujGlBKA7LN12SO17qVFPsH5P
	RwzC9tzV1sTXUUTc8g+zt9g1tip9lR9/5SRfJ+9Up8V8BU02CHHjkGzq7YZguCndIwQnjqBnTwC
	TndWH7G6SQxWagTwfV5iFNgY5/jzaaQl4up/eJDiI5E98OOSTxkRnWiMGtZ83BhvpqPE8zpYqa9
	xWKZZZ0Oyc2tOoQU514reDNDNGFlgYedHUjk0Pc9zh6gAL0x/j2xGdUaHL6+o=
X-Received: by 2002:a05:600c:4e03:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a963ffcf87mr21560375e9.2.1793163690594;
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:12 +0100
Message-Id: <20261028050113.10046-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
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

The GICv3 backend also loses a level interrupt set pending through
GICD_ISPENDR or GICR_ISPENDR0 while it is active. Its LR handling has
the same split between pending_latch and an Active-only LR as GICv2,
and clears the new pending state after deactivation.

With vgic_mmio_write_spending() synchronizing the target vCPU's LRs
before setting pending_latch (which is a no-op when a vCPU writes its
own GICR_ISPENDR0), apply the GICv2 fold rule to vgic_v3_fold_lr().
Clear the old latch when an LR populated for an inactive interrupt
reports that the interrupt has been acknowledged, and preserve a latch
written while the interrupt was active.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..4d802fc9c6dd5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -75,7 +75,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 {
 	struct vgic_irq *irq;
 	bool is_v2_sgi = false;
-	bool deactivated;
+	bool deactivated, was_active;
 	u32 intid;
 
 	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
@@ -93,7 +93,8 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
 			val &= ~ICH_LR_ACTIVE_BIT;
-		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
 		/* Edge is the only case where we preserve the pending bit */
@@ -103,8 +104,11 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		if (is_v2_sgi) {
-- 
2.39.5 (Apple Git-154)

