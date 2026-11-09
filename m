Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213170;
	b=C59QitygiYT4XzUwuvPjA79GM7wOYrUsxReLYk2cq6UJekBfrlBgcTvMYT5qhaE60w6i
	 AXW3zdlcdAjgyqpM2d1BripPrSc4q9WM5G1fXLsP08WDNcV9md9wk7I7AHwEPUxSVWzVt
	 IRsx6TIpB5Yn6tr2e9DCbTpQYkAvSPNwRoVz52Wi+DSbL1NxFxTgqnaOJ4fVVwkSK5riz
	 eyjQB4MCKRvqcn4+h1fjY7VpoGCoSX89ofIilZFkCDBoOchoceMlovn/iOXFa7qMfZjJ5
	 6t+YpnMV89mhLQD898RaGFzj3y4cxw6gk/2L2ivMnMmwyD0pn7kxA2sU1wMNRFEIlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213170;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ut9Nym0C5U+5iZecBoNIMpMDQzMmxDB90w5AyEXvzQ0=;
	b=c2Q+YAWhBbeaNHNfNX1kWulbQQYzmcklbaho3xWSZYYwHTiLMO0VZ51G09ACDWf7/GA4
	 YbK/P/tPupaDeorkiXnh4LmGaNo51ijLjdTbrGQ0j1ia9mZ3xH1APoUJwPN4mREiWv3l6
	 +d+NJvzFvdOv1oDGE9D9sKjGN3FWNVzeyM3G6SzeSkR+U8Jv/V//v6mI6vgTBJExdpdgc
	 HC5Fng9SW4sQLyQpzxQ+/4UATFLbAsLnYb24xvNDqyG59T+nHkhYxUfer78jt6XM7zoSR
	 L1gsv0eVkVfbl7LCn/JyFqSsKBoIpDkPSGjI+R7BMKhSHCqqRTVvoV3tf++qoMhUy7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="MGip1yh/";
	arc=none smtp.remote-ip=95.215.58.9
Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908406082BE0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908406082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MGip1yh/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PSYHOaV+7+K1ZX7ZkDN48fB/sJAUPij7DWY83+YiVG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213167; v=1; x=1794817967;
 b=MGip1yh/CT47MbTuFklWtwk+2wVglhpOYoUuqDH6Pgc6pK0WVJZ7yDLlZYaYAF/+MMQL1r6d
 Xn/YeS5Tuaj1jc77YAMB7ZkYaMci6fmM6pVz54CujLzigCdIMsiKJc6K8u5m1IXbqd9HEkc/eXt
 0sIb1gbqEcOP7RPwUuVIhTwQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f12ea6fb60e66e67;
	Mon, 09 Nov 2026 08:32:47 +0000
X-Mizu-Trace-ID: f12ea6fb60e66e67
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
Subject: [PATCH 14/16] KVM: arm64: Advertise ECBHB, TIDCP1, TTST and LVA to protected VMs
Date: Mon,  9 Nov 2026 08:32:03 +0000
Message-ID: <20261109083205.806619-15-fuad.tabba@linux.dev>
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

Advertise FEAT_ECBHB, FEAT_TIDCP1, FEAT_TTST and FEAT_LVA to protected
VMs, capping VARange at LVA, since LVA3 requires FEAT_D128. TIDCP1's
control, SCTLR_EL1.TIDCP, is switched with the rest of SCTLR_EL1.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 08805c7e4e5a7..8e9283dae3484 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -170,7 +170,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, TIDCP1, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, ECBHB, IMP),
 	FEAT_END
 };
 
@@ -178,6 +180,8 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
 	MAX_FEAT(ID_AA64MMFR2_EL1, CnP, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, UAO, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IESB, IMP),
+	MAX_FEAT(ID_AA64MMFR2_EL1, VARange, 52),
+	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, ST, 48_47),
 	MAX_FEAT(ID_AA64MMFR2_EL1, AT, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IDS, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, TTL, IMP),
-- 
2.47.3

