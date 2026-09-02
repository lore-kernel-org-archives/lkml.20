Received: from mail-pz2-f11.google.com (mail-pz2-f11.google.com [74.125.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D143DA7F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334360; cv=none; b=h4+ge3zmCFtB02y3pRk7SgmDXOexh3gvkjJHoKGgH/2/UuFjMxrTyfUMnWzrEaSvlmp5MlwULKIn6d8Cy+i7Bxu7PAqLFNCFvn3X3pIdxD3EGn6PM3muj4K81cJ9RgN5BW4z/PSxCEN/5n+k6S6XZvIRJXaEtKx/B/cscq55aXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334360; c=relaxed/simple;
	bh=M8mUvhcvfnEDBFtUc0VuhdtpXKf34yjgQcgAYje1vMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAZYX71mpREdBmtEnMLjnSqVHEgSCXGNDnK70H6p0QVMKBDRi1c7Ia2n8+DZbdR+ji91/UZUKUvtEhC/0QvnRPJ46lQ4ZB2gKmbP4ZqImD93jN3O9/EAYwm3VgvkNanxmwQLYzPM9qI/KLkkDExdqbapvLx0esYgujeMLe7xLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzZg0Wna; arc=none smtp.client-ip=74.125.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzZg0Wna"
Received: by mail-pz2-f11.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so224843a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334358; x=1788939158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDn9kL+O/DcgCowWQhzjL1E+vRjYGvPyhLWTC672vfE=;
        b=YzZg0Wna5gJnKaCf9lWOoi9J7I3wUtHq1dqQfC3TyBDb8bt/7ndDBeNqYPaHp2uExg
         jdo5smfULVmXi8Tsf3nLy+R2WUaG6cySSVMScc3o5o5GWbwPkvVeEvrajk/vaEXlEli9
         CQVg/7MgMnYXFBYmWFoL1MoAiUniDngJvXDwJij5erdJRobP96jjIV/7O7BaNOgYZ0Xp
         WlKeS33l13/6/sylnqW4cyeJl1V1Atm8HqAUgIA4zsmPhY7OSaPS1vSJ9zZMXpkUx8bC
         Xo5eYVa27j+vOEfJNPbeWxl9drw00ZTwJJ3j+VMBsNM7UdQOCCdYP8EK+E1BjUrWZ+Qn
         aDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334358; x=1788939158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDn9kL+O/DcgCowWQhzjL1E+vRjYGvPyhLWTC672vfE=;
        b=jxmgPobD02gM14gAe22cX9i5BYpB+9xSadWJlqnGF2SkOp4kP1DyEMa2FiSpkVp87w
         Dp9x8ERW2rocpG98UhjHyLDpmY4irjuUZz0YetumXVxBtdN4yES+LCiicYnOsKJ9d6io
         5CUatcoGJy5Z8JigDBxAuQWmAGLlcQUw40X8uc5Suj32YQbeSnupUBNkEiQsMyCUggF9
         pzyaiHHXI9VgOYmOvJt1acWkg6QtP6+wR0JrVBOzyYfZXge85fWYcvr/wr3ROXkr4obQ
         V/g47JYDYVNZ5VWCCgLZpRkpUONLH+V66usStoGfPNZ4JyQs5zcd+mZqvkSG4x7vlEAk
         GkNA==
X-Forwarded-Encrypted: i=1; AKwUvBwLmLo1qBDtG04whlnM3//FdGV7QmcpG5I2XoKg7XGJdEcAtfnReRLpJ99XcBdWY7qXksQqxw6/VoJ2Xf8=@vger.kernel.org
X-Gm-Message-State: AFuF++mEDzBH3CtvhQy7VnIB1qQ8cti1Ap7CZJj7anB/vnF9IH4TJurN
	IFQag5iilx+6FE8TLMzskADdLC3hBwsGpdFOewyb21PChtCr5kusII5i
X-Gm-Gg: AYBFou3t0jgYrxSMhsNqKRnpJ2/uvA3n5dEAK0SjpH9WME3jSutOjh7ZEWjuXlcfgkd
	7GiOPD4ihg3NQTRzPuHcTqQBYanm90LbXxkh7CiTPJ12HkcQ5SkNgBVg1XYKoT2WRIHCR2vMRfB
	faDDdSKmnmTxJh6j1njjjKvAeo4CTiTp/ciISXTKV1lNPECn2bV2beI2qdbPabhg2Wwhw1+RG1H
	KtIjHfoXAgHxRBl2RWWhvYSfOMds9kHnHJCuEyJ4k8aCELlvqdvtnCh14FCn96P1YE8U7AQi3h1
	GFO9RsaEDe4Mk07QnM4D3JJMZuJDoCx4GfeFMfOTF1MMZDoAVMigkn3HuOQ6mSvpN3l14qfGRp5
	xYQI0iXK+pOmyqCSVt70hU2706otJJcPkfubp2Rbt1jJLmdcvONA/JTCIan6MdCNI08Lx7BsIAu
	7XUFHELwpUFVPLKuq3/rWbfTKtbjinjnCLzm8sbw23OFl7C6JEOSzMHVVAY5tjHf1BVA8oXRz6
X-Received: by 2002:a05:6a00:391c:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-85ed444854fmr4147616b3a.0.1788334358011;
        Wed, 02 Sep 2026 00:32:38 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:36 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 05/10] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Wed,  2 Sep 2026 15:31:11 +0800
Message-ID: <20260902073116.802752-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 3adee1ae120c..bd64cf585795 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 {
 	struct crash_mem *cmem;
@@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

