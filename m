Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904047;
	b=1uX+LX9YQegs5CQlylqK3sLx21DRxTDICxH6j2AzKVheKYJFkITiGXdfnPh93ADkS0TF
	 H+3uQrjM3r7tNG/AvykC3oEVXNLeoWMp2BeH3kmppQpkILKaRsp2FZIvB3uHPmmF2dnwM
	 OEPoiLJ6fxehRel30Qc3PNIpDUDJfrRYh0sge0R+3mujCuziZtVcNPVtaiJAdmXGSDscJ
	 pzE3BjcSo3qI0E0FyMPojnMLD7Jti1lWmY8nR9PSAZSRVi+LiXqSj7fM8uj8EMcooYA9u
	 KhwoTmsc/NTLswV8NvHW762mKZz6MmNrux5+QR0BKifbGmlEjIh3tkFkpUi/Mj4kL4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nc3YPnJRwzfEYdDYZsDx/eGvT25xHUbuaxqftb/2MH8=;
	b=iIJrIEUXfzgO9Vcpz5jLK3YOAcVUNBDk7GIVEsa+F3C+m+gz5VReGzuddYi6avcYcFAt
	 DK3BP3U/hF6ByV7WqjNG/ao1+JGIv8lWl9w8NAgAUDxoYjf0xnlWtFgneO1Go7h3dqvwv
	 +VcOEN7FyCp+d4kdI+GLybjfh0LOBoex9/KTc+oZ2qTq+McHtG04C6xTeY0NkI05MMX84
	 MoZWLb1yYyk+8FS3yLCvcpZ4iVX87NiDAhFeiKCWoMvs93ei1AliCz+LCLNSIuRfrvi6v
	 PGL5ExVutvNn54JysTx7dYwGtpOs+Uryi/9Ayrzz6lgxRtNK+bzBkQJHbqof27UtnUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PrLtTorS;
	arc=none smtp.remote-ip=91.218.175.107
Received: from mta0.migadu.com (out-107.mta0.migadu.com [91.218.175.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E32606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PrLtTorS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4vYsAp5tXIMe+S4AuLT8YclXyC62fvhe94CH6TAcEyY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904045; v=1; x=1794508845;
 b=PrLtTorSLLtlQD0HL7ZTW0iiXnlnYbfMfl/pSSrSXGk42BtjuZW+JLkNwBT38tnDa2LHN6S0
 cMApJ2LoAapPL/UJRtMG1dCYAu6p1zJPgRGNKq+XkmE/n9TikEWEoHBgtqPFnVEGYF5qaSXFzdM
 G1eYY+BJgoQZOfwXxg9g+ouk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 054e15d9c411ead7;
	Thu, 05 Nov 2026 18:40:44 +0000
X-Mizu-Trace-ID: 054e15d9c411ead7
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v9 07/32] x86: mm: add PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:51 -0800
Message-ID: <20261105183940.2236717-8-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, which makes PG_anon_exclusive have to survive in a swap
PMD and not just in a swap PTE.

x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reuse
_PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
not select ARCH_HAS_PMD_SOFTLEAVES; assert that, because an exclusive swap
PMD would otherwise be pmd_present().

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 arch/x86/include/asm/pgtable.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37c..22cf9b57a135b 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1529,6 +1529,29 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+/*
+ * _PAGE_SWP_EXCLUSIVE must not alias _PAGE_PSE, which would make an
+ * exclusive swap PMD present.
+ */
+static_assert(_PAGE_SWP_EXCLUSIVE != _PAGE_PSE);
+
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
+}
+#endif
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
 {
-- 
2.53.0-Meta

