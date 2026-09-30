Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4954D0CFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770343; cv=none; b=QxCq7+NFPopTKFd4u3ubRckHXr/+uU4meybgMKHoMJNWN8z+FWhh/+h1SdLoAdiD9/1PjyB/OFlWNNcuHHmqS4kQ1OIJJkUfGq3Ts2ac4JZ5C0HT6dH/Ns4zc1e9HJfJjuIs+YDjk0Ok1b8DoHQZQZMCdeBcFGr6l7ee8ygi4Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770343; c=relaxed/simple;
	bh=giJ5+atcfObBREk4HV3phD5/1wpIpixiJ0GDdg7jwGk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i60iSpKUunuCmqzgg3S46srutIKh4zZZH9AHsEkDPBcFARAjUXaWiWqh/QsZrLRU0dJ217NdzqtBd0VUYnD1zYssI8kAKXorSsmiHzuEjbV6fGiYQ2lilhZR/qsitnTFN8isc6EMo1tcief/sBgiMUGVoXt0U6mczD5pfZgrxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bWfF7enj; arc=none smtp.client-ip=95.215.58.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bWfF7enj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=giJ5+atcfObBREk4HV3phD5/1wpIpixiJ0GDdg7jwGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790770337; v=1; x=1791375137;
 b=bWfF7enjh709eVOEO0twdRO5xBSdVFalHnZFTFCjH6yKkFytlel+AONjao6kqtgKdJdNrw6D
 sHBj8MyLo6+vOoGbSagTBMsOvX8zGMms5D2/BZqKfJ6Dk4aY2O0m/rd6oL5yprLzBtN7iOL8jTW
 Hq8EQ+RDdQ3hDBv0ol7Ga6Tk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e8ef16dae118072c;
	Wed, 30 Sep 2026 12:12:17 +0000
X-Mizu-Trace-ID: e8ef16dae118072c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Date: Wed, 30 Sep 2026 13:12:12 +0100
Message-Id: <20260930121212.3101361-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
__init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
which are RES0 there. The macro only checks that PMUVer is at least
PMUv3p9, and 0b1111 passes.

Exclude 0b1111 before the compare, as __init_el2_debug does.

Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 87560d8b254e6..1da277baacf78 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -421,8 +421,9 @@
 	mov	x2, xzr
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
-	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
-	b.lt	.Lskip_pmuv3p9_\@
+	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
+	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
 
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.39.5

