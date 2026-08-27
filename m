Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD948F839
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847895; cv=none; b=Ub4agkd05Q8ZA0lPsaNb+pfTBtrj0PAZsG169knG2AJlLXkUYVZn4RyP/t6qwzUeolvMQp+ZSYhnP8fZCTjkiW+jLEjitpISu/Ts/KEGUAIAXodjrMXdCe3pcsB38trTkSm/BB3jUvL9ZSPxFK0HRqst0tAfgZoMvjVJlpJZrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847895; c=relaxed/simple;
	bh=SxoyZOswqKGCE5Si5I0REoVrym50xz6jU8J8fzcZOfs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUWlwECjRVHlHm6A2QlZlWvtrVwwbMUqqMtNNMEPy2B0QbLX9s2o7utbktCCmjVoPpXMmXxWrY0txmQ2FX2fdpgm4sVZaxsmay15DPTFAa9Fv9uoDifQmDKng0FU9TG9F83qbTCjZHRQVFV11OZwI9KR+3f2TVY+tSIf1Qq8n3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=To0G6wcE; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="To0G6wcE"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ftKn+49W8yK1HAHXVqh6PcSXmf+Z7/mnV4iNORjKKA4=;
	b=To0G6wcEbxhMZWTK5DME5yHn/K70A7erPo6Vqiwugi/mKREl4Ejl8JHdOMkCXABbkqafCNh4j
	ECKo1G8HoT75N7J7N+yHuE5w1okfaAs4WC6+f/fxaPQwgHlmeNsruHPfm7iqHhU5lc4FldADO1v
	FZMO8OtdNCCJ+DMl+6mVL8w=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KX1Sd7zJ46Yq;
	Fri, 28 Aug 2026 00:24:16 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id BBD2540570;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 14/18] arm64: add correct alignment to kimage in efi code
Date: Fri, 28 Aug 2026 00:11:54 +0800
Message-ID: <20260827161158.3618409-15-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/include/asm/efi.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..08ec4d8b48cd 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -87,8 +87,6 @@ static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
 
 static inline unsigned long efi_get_kimg_min_align(void)
 {
-	extern bool efi_nokaslr;
-
 	/*
 	 * Although relocatable kernels can fix up the misalignment with
 	 * respect to MIN_KIMG_ALIGN, the resulting virtual text addresses are
@@ -97,7 +95,23 @@ static inline unsigned long efi_get_kimg_min_align(void)
 	 * 2M alignment if KASLR was explicitly disabled, even if it was not
 	 * going to be activated to begin with.
 	 */
+
+#ifdef CONFIG_KERNEL_REPLICATION
+	/* If kernel replication is enabled, the special alignment is necessary.
+	 * Due to this fact for now we map kernel by huge pages even
+	 * in case of KASLR enabled. Ugly but works.
+	 */
+#ifdef CONFIG_ARM64_4K_PAGES
+	return HPAGE_SIZE;
+#else
+	return CONT_PTE_SIZE;
+#endif
+
+#else
+	extern bool efi_nokaslr;
+
 	return efi_nokaslr ? MIN_KIMG_ALIGN : EFI_KIMG_ALIGN;
+#endif
 }
 
 #define EFI_ALLOC_ALIGN		SZ_64K
-- 
2.34.1

