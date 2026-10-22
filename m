Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651607;
	b=ipkB0I6yUHy2kCZFrjd4B3wQaibW256cFX9vLTYe06kT63JNlXbokIfv4fjY2STI7XcJ
	 vhvhc6F0mowGwv/wbtzUSjxiksaOroVdJw1LjA5wGyvomAfsayxAgTvnopYiBJHMPuvZ2
	 MAJWxKmNaLgYMBx5chd9P/MG1GgaOZft5aCQel2VgatIZE82kfuLvZ0l6n+pDZUYc0Cje
	 DqokuA+PGy6Iz/RtPoNp1S+3xFinBXgc78aI4H+MDmFZ6mPntzJMJn1eTjDOZcFqphFhz
	 MerF5V+zo9lhUmajWraUBy+7qIWNLXlRQATtPn7v78Y2oKWxt4OP208yYh+YoffP9ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
	b=sUCoIAsz1mNkId7TupjlrhIEPv1m8t51IkuG1tiZSLMJCT5vcRkcad87ycUww55JbbRW
	 0gfen1e8wPRmfyWKUu1qHjsrQwSYQqOKj1FrO91clKQw6Mt9QPTiGx3C3ptizyrci5L2L
	 DXfM57ObP4yXDrdPMDzQIv7Fkt+WVU8rkVvu/pzbFWGymZyAeorkBOa8VTd74uyhRZBuV
	 k18vSkQgYt2G6tyZladGIL2F37yp+iIq74+lTy7/ezltXV0UzFSZ+vX7SAjk7EokF3gjW
	 /V7q+dKLx8mo/XX8x2aG0/lJfj8F6PvYqrtXXtc6p8SHyRwAYcH3AKAzj4z/wkFm2eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3VZFGWD;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E63606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E63606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3VZFGWD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so966431f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651604; x=1793256404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=V3VZFGWD4KSHeM+DO1nMisS6i/wVge1HM6fBy74v88dr0yo3wdHQIcH6CdlySChT9O
         ZtagAUhE4z5oHQbTDfwTzSZAUjg5OkMthcQr1prlqKy+nrnPy6M4YeSm41x3jV1ykpwW
         GG4PBQloGs3RtgMl8ipgoXyQ19SZhjzgRr2vtEeIoOEnT/nmoFDRWKVqaiVR81kVgbGf
         Vn58vCEk37QLp6G8KhPEJg6hpNnZkZ/jKHVhQ2eec4UbeGitkwn8TsbXto7m7KJZdr6e
         qybFZILP1qgJqUYcnorNnc57GrlG+Ja02JZIX+MV14ALtyZqW3DKLy/V4RxNyP9VN+J4
         FTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651604; x=1793256404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=1d4dkxRGfLeryholiM4rHdKn+FBCIILx8z4s+BBbg4iRGlBkW/1mDiR8G+94pBss3Z
         TPQt9nrXQW0lQjB1yJ7jG8DAQ+li6kiRnN9EBBDHcGr3vOIK9w0n5yA8aLY+M6Z7tCzw
         FBAlrikGnv7W94e5MF+83BKc3+rQwu9N+TCRYxt3fI0iOGKFuCso5YBrdqQR4JIbrGIr
         9eJRxgaq0V5nAMRRZ7GkpUR02GgQTK6m9Z4t5sUY/7sOHAm8ENWDV8p8RGnoFiGAs/ed
         IYYhKNIbE3mZmNZ5pH6sexAuCoDalzPjutusWNTVIplFBf+19PTMOmK1HxxLNHKbH1M5
         gsVw==
X-Forwarded-Encrypted: i=1; AKwUvBwwftIeg3ZMbVVchA9Xsex4xpWSYiUb48+T43CYSyxkqgRiB5hV2VsCTcyyQ0n7TnKwwHXPKHLuOhF3dFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg+2MVCP7uDFEwmtiiBKbn3JUqYxF3M6HoYzYh2pgrPpexjjFT
	cxjB8NGyc5Jf5C332tQpZSPLd0CcpNatIlAvzOaG0da54NRA4gkX6a1D
X-Gm-Gg: AYBFou3Q40yHPk5KEbP1zqaIBN52GQfcVcZK3TeY9wIoCA6VZN/QnRAqSKcTikEjdm9
	2sWrfiNXqSXW8c9NbTpE/aINt3/SG2a12Ka+3TZzlYdzsKcjSBV2qjLZ3MEN9pAj8qefw1XiOSA
	c09WC4vm0fbvHjlwIp8CBgCd0GmpE+rcHz+pg9vcMREc0qknIyu+4efTIxibizncdAs5RDBuzN0
	vtpd9ENcStA69E813qXvnvZgZPr3UGwCredALxvY44Xn9TxgO6Cd4V3g4TD58YCIPv3eYFxu8Vk
	XFNfKRfV5mkgfMgXjI/z9X50Y5Ub5uCuW5bO+FE55gixTj4bf1fgXxa//KRPznfo3aw86F4nK5r
	EJEJZy9W0ord+m8BaZC47Zn35gUVD0aAkS1HvQ59ATrNPJCslAVnZgTt+iLXcmUTUVmfSnhXMvb
	tKLYZO6IF2cogVSiVkK5vV3BJs8elH9zxAyVlapqb/StKIHikDu09DeHDB4OUpZHO6vXbD5OR1Y
	topqxw0FbFYPYH0/ABEHnVmK0Rkjc8z4dXNiXqfIkDxHf3wDoWCZcA91wWf0JjHkKLAeEEJj2SY
	bXHA+F1pX5dD88J0FTjxyFDMRLtzAZ+qFnQnKXOIhUeiwANA1QZ2CCfZPT4AVRtda6JjSre3WqZ
	RRFhZeqAe+KnXg2tFIbztBk7938SsCFZ2dSyUojzTU9+hi57RxhQyzfkMRYb9TIV7
X-Received: by 2002:a05:6000:1111:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e264caa01mr6437578f8f.34.1792651604419;
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:27 +0200
Message-Id: <20261022064628.4206-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
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

Apply the GICv2 bookkeeping to vgic_v3_fold_lr(). Clear the old latch
when the LR reports that the interrupt has been acknowledged, and
preserve a latch which was not represented in the LR.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
---
 arch/arm64/kvm/vgic/vgic-v3.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..8009dc6df00db 100644
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
@@ -103,9 +104,15 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state. A write while the irq was in the LR may also have
+		 * followed the ack, so preserve it too.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) &&
+		    !was_active && !irq->latch_written)
 			irq->pending_latch = false;
+		irq->latch_written = false;
 
 		if (is_v2_sgi) {
 			u8 cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val);
-- 
2.39.5 (Apple Git-154)

