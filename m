Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D92D5C7A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275929; cv=none; b=gV22Ef3xCqww9E3DlyzX3Af9MZcX7HnoMI7Rz0LyD+F+uxNfBuTgxZ6NtAkC70mdyu9awkFGAoTE3jnCcgRj+dcsSDppaQrdgxJkQm1amk/4ANzxuV+g1A/CZ8iNxlN2dopQV9uC0Y7UwycHpxwMFlvXUjcC6uBkq6jGgZrB7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275929; c=relaxed/simple;
	bh=D/TP/LZxtJPkZc+5BDyxSzlqA6ZsrYhTjJdzoacrF2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M382oU4oNG/yn7H7uzTHdGOSdZybL6sSVyRVRfjiTonPFk4OzDEb+kiBfmHXdkswiXabanDefGLFFYR7dU0t6HbyPfulEXC4LR7IKm1ecbn6bP3EwBnchIGySAgeXy3T224P2cDM4yxS0PPL6oF7TCSjG+aucZZhavtc5wcsf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agP5aPUo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agP5aPUo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso545545b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275927; x=1788880727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqt0DA3rHMBC2JGEPtQ8G6D8wkEO9isBswK4tBDKvpo=;
        b=agP5aPUoU9WTkyBcRwhrMGOES7ZS7353PzuKo3ScR//6hiG8/FjyClBZc5FlRjPE/O
         e2BaZRu68P6+TUFT+IALfQb9Bo8Dl30y9PjFAT7oSovMZRvKR1LmrkM6BN1+71BTSzsY
         BzIXeg0fYEOyMcJ8L5yA3qHRsPgxBmRdAy42mzcl0fYNP7D+KELhhrpTmjwp0JTSsBfy
         GLIJhE++DbdfDMo5BcSAbTpULVlnFNYkF25DfBvOi1oIs1Us8QEM/1EVkvqmOOzz0LdV
         e+/5fXNmo9tn9wGF2/xFHZMqFMEkHTnT5zzDvmTlgFPT/SvexHSqOQlpOOZ2EGrT70Ap
         bgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275927; x=1788880727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqt0DA3rHMBC2JGEPtQ8G6D8wkEO9isBswK4tBDKvpo=;
        b=m8TSCwN0YY6VczW9GDc/D0UJ3QtmTKaJPnIx+8smvFnMrx8NMmNfOC6mQoTXjFU6Mg
         wbFGlIpyzd57DaMnsc0VOgIb9m31pnoE6JN0Ocyf4YozyIhGUGgWYyfJSI/Vlz4HNcb6
         3FBav0Uz0vyp/i4i+mbEegi1A97js2SJ/DBRYRmd/oecG5+kWpeuNHR+A/9OyTieyrL5
         UHLdF/xJbJw0oWUfOPo7Y3MkDkjEF90v7WTpK3g0gi+FM5W8iDuaEW9wWhYx1cQgcyz/
         pRsiuN1mT0Vb08iJjC4DgCSfG6QYTyyJzwjpTcfcTC2lD+6F9aAul6iWcnzgRWV3C4Zw
         yXvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDeIeTkHCDubDSuV2Es9BwKZ7LWQtwMMLK1Ek1ti9CdTdwDnmLorqmAqp5Pp21qg1PaaRsks6uRwWg2Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++mKzdl/pQkT5yBrm4G/H7C5gtUw/hA9zIIi9PXgSvlLwAbqCoU3
	aEc5hzccIZmVfF1sTBV4yyrzIUZFBpFjOlX4cd8oTANSlcANkep3/F5f
X-Gm-Gg: AR+sD11ozGvoRiUrL5pPzJ+9KXUOfxHc48CuHYuc3nGLjYiDzZPiJxXm5chHc4xIO0r
	UpZK9kgv4BLiozJz+zmLYOisVAwetFVOiMoeiHc1Ag9b/vVpM1Z89yoQkqkuUJkXnFAATqhuAZW
	GsuXzP0rzwT+vdeFmgqp6bev5t1aTnHGQUUzzD6odVogxPSDtXvukqMLNmCVQJGCGwAEtxtDsFq
	bh4IT0zUhdhu6nZGw4TDsSl/pxLfo7egE4xyXp8aSb5i3ZbJTPk6nvuBAKsw/SZ8Mw+thArYZ1u
	HqRbuavf8RnQlkDb/M7vdk1/D+DZ9/OYpv3g2+oRV+A0abQkNh6WeUCugfWV6ISA3vjcmeYo1uW
	qw5JUGnxbNMzDwkvDyeLpHqDNFe6WqXOhM1zCdmIKQ1U0/Sa5utY1/fe0GWuVOR9oxpN0jwMOhI
	NtkgnjUatoFfiYm1OVdTzdFhILHOGxQ+n/Q+a0FrlXia2Z15KpUCaFsN+nSQBCXU3cwTKaJgBrl
	YTKiznho4IWUYpDkovNvkqxPg==
X-Received: by 2002:a05:6a00:4903:b0:84e:b5a9:ca3b with SMTP id d2e1a72fcca58-85625f2c0c9mr21548292b3a.0.1788275926871;
        Tue, 01 Sep 2026 08:18:46 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:46 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
Date: Tue,  1 Sep 2026 23:18:17 +0800
Message-ID: <20260901151818.3191443-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement set_direct_map_ro() for arm64 and flush the TLB internally.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..1be86dc11543 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int set_direct_map_ro(struct page *page, unsigned int nr);
+#define set_direct_map_ro set_direct_map_ro
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 132938b32eb1..0e95cd904ccb 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
 }
 
+int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (!can_set_direct_map())
+		return 0;
+
+	return __change_memory_common(addr, PAGE_SIZE * nr,
+				      __pgprot(PTE_RDONLY),
+				      __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3

