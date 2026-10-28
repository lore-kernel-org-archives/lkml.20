Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185671;
	b=5rs510cCE/DdVRd6TgW0lt9lgTkdPeeTndXDyc0Wx7EoifJSp1GrAd9klXxr+XouUlbw
	 s77ntcAdJVeV6fTpbhTiPxy/rIws/cglRdz3EN1SGwfMvAA0hINlsAxBTTWXS+dLMKitx
	 b8JSg46ELkC9eMjzv5WfKQd0VE8N4SEOQ7MzDKggxm91B1WPzhf2mM5GAm3uVNqrrrOi4
	 +s0eQVLxDaY5tAR/BudoG/zhMsIy8nEPK5MVVo4E6lopLGeddjg7HyXS8awPjfZNACVij
	 7dufszyvMoFLe4ZSp4cRAslPcVzNC6JIOYRm0mcwkEyDPXkSAXwrmJ13Dug8cBU6i1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185671;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/dqcNV2rxcj+H+N6V1Q7pF0i14uOvWt3XmYVtpF0Vwo=;
	b=ICg7sliOgSO7o/aB0nXIRyIVYdJVsWp0IpQCbecRuKMKGcRNCOaqaWo1saXfgCbArUxd
	 X3tdZGLjTDS3/YMqyIazfq9wAKxVxnmqZon8A0PtmqDFgtMBW0bQaDDWsolCrvSX0is+w
	 vEHVdol1MABKmArV6MsoBS9Iw4pYrI2Zgsrgx0gfotjuc8a+Y/xonaLJFSX07pVuXI2LE
	 BVlomveYCrnn+hGUeyeAHF30u4zsGLINqIX0XlfUQxzgE/TOLkgu+LaPXcnafVZxcFnpJ
	 7PpIsPiU/JgYS2QuY5roomZGDpffPC+bJC54JpH9wIgSVrEAvQcpqscR8d9u8jr6l6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nfb4mP5r;
	arc=none smtp.remote-ip=91.218.175.115
Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nfb4mP5r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hOfLyCvPxdoMK3iGT2snLIRtrBmcqixK3sf0MGFjqIg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185669; v=1; x=1793790469;
 b=Nfb4mP5rNvDLVs3iRamDv+Bd3CpvSbnBla1lH2DOvGcphBkQjyMQrHkkuf9vdc04DZdmEeC6
 4Ltay/ywTUrscnybiD4kGWmRV6cspeiSaljn/EFvupl9GC/tbuC7U2aQ7epm/wteLNyHbOjLznm
 gB2e+bp3U/hbgnYUTjCJSrGA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2dc3a04ca25871d;
	Wed, 28 Oct 2026 11:07:49 +0000
X-Mizu-Trace-ID: e2dc3a04ca25871d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Synchronise kvm_host_data before host deprivileging
Date: Wed, 28 Oct 2026 11:07:37 +0000
Message-ID: <20261028110739.2366566-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028110739.2366566-1-fuad.tabba@linux.dev>
References: <20261028110739.2366566-1-fuad.tabba@linux.dev>
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

From: Vincent Donnefort <vdonnefort@google.com>

When protected mode is enabled, the host is populating and reading the
hypervisor copy of kvm_host_data until it is deprivileged. This is an
issue for nr_event_counters which is only used by the host to populate
mdcr_el2. After deprivileging, it is reading an uninitialised value and
sets HPMN to 0, preventing programmable event counters from counting a
non-protected guest.

Before the host is entirely deprivileged, copy the entire kvm_host_data
content from the hypervisor copy to the host-accessible one.

Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 380dfb1db0be4..58190ff6723d6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -316,6 +316,12 @@ static void __init _kvm_host_prot_finalize(void *arg)
 {
 	int *err = arg;
 
+	/*
+	 * After __pkvm_prot_finalize, access to the hypervisor copy of
+	 * kvm_host_data is lost. Save it into the host-accessible version.
+	 */
+	*this_cpu_ptr(&kvm_host_data) = *this_cpu_ptr_nvhe_sym(kvm_host_data);
+
 	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
 		WRITE_ONCE(*err, -EINVAL);
 }
-- 
2.47.3

