Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213151;
	b=EwMy6Zmr0RA/5Og5S5KFcgj2KAouiwivp3GlkllwtkHG2qAVh4BPwIFKImlVo+NMlGpS
	 KFDmqUIJ3co8lP817doY5VyQhxsCEbXjX+2fNDr7LbD+xEOJgsz0sGrFnKDJdyMaG1iUv
	 SbO7vYnFWcMW/HnEQv/X/rSzZ+xiwKRpB+X/amd8g83OWX+PbvYBBj2b4I6TmAKfFhGVm
	 38Pvi/9x9+FTW9BEXeiuC60yl/aNCwvdr/ILrE+DJLxo57kA24MMAdzNGAoQgMeF52+P3
	 vzSx5j8a1CMqwko/mtU9E4jAfB47bInVrBUx3fAfY1cwx8dvCw97nxh42tj+bEH19nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213151;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=42Orm40wyRzB+1dz5ASuI1+iqJtxIK4njD90kiRR/14=;
	b=vtFRJstLY7ek4HjQLLP5KSL2VLROzgGbJLqgantuatc5skpj2Ld4mI5eQuOguOmzNJQ0
	 buygf5+IYj2ESDeS/xSTwYWB/Un0GpqqMLVKoJdSVVKSKhuqXE32npFFUI1We4HJxZaOg
	 AUNcVJ9t7gsneYO5x9749kp3Mle4xqDt5FpsGAFFIRk3OV3Mkh2c/URSAZumzqzaP0XO3
	 1hBdn5PbQPGMV2fDPbcxslP35WDdB1JHQ6H7hrEzJMDHA5ciSPKAdgrEwk1o323xsERBp
	 TF2fSsBXjW1hyMRBISii4b6gk3u+PUUjdKSUEXO2sGpC49jQzvDA63gTcihamOYZp/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OYqErS+P;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AC606EE88
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2AC606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OYqErS+P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h9tWamJLklnLk65EksHqbtyH+466JFRTiXTrnW1mmmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213149; v=1; x=1794817949;
 b=OYqErS+PX1fiBK2+BBhLgkvYq8BrD86IwPoKvPFeXbNfdENtREZzCtbj5zmiJslkKz+NjW3V
 0x8sTL3tLMYWpWZ/2J3eYaYuyzT9+OqRfhxOy305dj2+OX74EwUDaa05rmyorBXDpsx8lFTwKVN
 A5qjrIxvdwHVHXhN7TyQPgoc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3df3eedc180a0556;
	Mon, 09 Nov 2026 08:32:28 +0000
X-Mizu-Trace-ID: 3df3eedc180a0556
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] KVM: arm64: Advertise MOPS to protected VMs
Date: Mon,  9 Nov 2026 08:31:58 +0000
Message-ID: <20261109083205.806619-10-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
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

Advertise FEAT_MOPS to protected VMs. With the field set,
vcpu_set_hcrx() sets HCRX_EL2.{MSCEn,MCE2} for them, and
kvm_hyp_handle_mops() already handles their MOPS exceptions.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index d186aba6aa09c..bcc35d6990e67 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -212,6 +212,7 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
+	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
 	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
 	FEAT_END
 };
-- 
2.47.3

