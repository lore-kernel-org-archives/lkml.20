Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213167;
	b=wZ0gT61dN0cXcVo/V7yMWPbim8XERdyMuuYJMo8PI+FN56pFFJXxmeQS0zR1HUqWX2qa
	 CPGIuLvVB6YBsVVcIl3/Yn7viW/UbeyZ57gYP8Bq25dpAj65JYbxDLxylo7i8M6gQ2H1U
	 +tymGAXsUxZz9rG8hVTg5mVKrscIiDY5UkBcChttLMdOLMDE3Cs4PCAQaOMvDl8MZlz0+
	 cwEIQE5f5h8qFfZ7bF1VqKszjfueZlN42iMLAgFsP8s6niomNOOaaYroAIIljHBroKogT
	 zp25y01wyoQhRcGzF0HR/h1UBMaRj8VDpnILbbe4ADChIlY+9YiRp6URaEjAQJz6X3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213167;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nuZwdcEqSf0GREbYY2JQO9BxTM9vkxgcBZSixac3fTw=;
	b=lJmnic/OmHy42eOs4+5X8tF8BHma6e+KJtullSJk3gwnU3LsE40aSW8MU36v8fFXy3HW
	 adPq4Kh1ymxCeNO+vF4EOJRs5Qv0HEzn7xRGejyZ719opYphkdPGbWtwyAb8CgBhzUVkJ
	 /d3OtyPnMwHzDDLZwUCU4i6QjNigFYxi+UkeRmilSLTGVJRRu9Ent9j2qOmZeznE1xFyZ
	 xLi+FYXpX02k4ZA0WJXxvSZUie9L+gd5Akcz+hoFBjRdueHHjmojIgxnCK0kINqRzLGND
	 JmNV6rfsWCJGxqkBCYCOCHZzGm5jezsx1Z56Ybtof4lhuD9gOj/BiyULZYJ9QRPYvIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="W/y8klYr";
	arc=none smtp.remote-ip=95.215.58.239
Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EB606D833
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0EB606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W/y8klYr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mVkQGuj8ljyCa0NJBq4S9PryK2Zi+xV6c3MV6FVKjRw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213165; v=1; x=1794817965;
 b=W/y8klYrAEsxqsoyhFYqNkvkK4k+n2on99sytHEaHbmRbsqWRTPR9JHAiHdXomlNd8o3X2rT
 vQm9hI7ljYUmcd20fvgttgqa3pyHIjlyPpqzW/lHHivzvVJMJ9ZFCGm38xi2vfVR0kkCpNJ0yjZ
 842ppNZ0jOQVIxuY/TDCxq0g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9e35c043b16f706;
	Mon, 09 Nov 2026 08:32:44 +0000
X-Mizu-Trace-ID: d9e35c043b16f706
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
Subject: [PATCH 11/16] KVM: arm64: Advertise HBC, CLRBHB, RPRFM, CSSC and LUT to protected VMs
Date: Mon,  9 Nov 2026 08:32:00 +0000
Message-ID: <20261109083205.806619-12-fuad.tabba@linux.dev>
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

Advertise FEAT_HBC, FEAT_CLRBHB, FEAT_RPRFM, FEAT_CSSC and FEAT_LUT to
protected VMs, with CSSC up to CMPBR and LUT up to LUT6, as for a
non-protected VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index a937aad009348..b325bab5431a8 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -214,6 +214,11 @@ static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, BC, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CLRBHB, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, RPRFM, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CSSC, CMPBR),
+	MAX_FEAT(ID_AA64ISAR2_EL1, LUT, LUT6),
 	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
 	FEAT_END
 };
-- 
2.47.3

