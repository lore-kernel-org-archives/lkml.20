Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D606B3B05AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131467; cv=none; b=UsGki/TeAYliPBOE4g1ZmkadPn+qj9blo6fFaO/wfOvQJoCnYOzktGvg87nlwPvc9UbS6zA2KkhCAiyF63lkv/9x54Zsn+91ZZ/oQsI4oJqkffkLA35/AMSDlpprMHA/LCAXDUak7dPMuHrns8YSbANc8I06G+on51NjrolHybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131467; c=relaxed/simple;
	bh=euWXYByltiCr6eLT3Uvt/s/e9D4RAaciKKJ13Szz3HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruCQUp4R35qKFRfJxr38l7iu8vwDFDTWBhICYzM5bsGZmEF/oEE/LN8t4rtJejse+A1hxnpnkf9zaS8mRUAkZrxT2Nr1+3dY0Fuia1o1LM7bA08Ir4XToYrTpaD8O3/mwQdNuGw9zJnGCFcsd65NhOzMoywLZ4CPfjrj3Kr93uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCus1n00; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCus1n00"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-ccb794ce92fso507627a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131465; x=1792736265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=rCus1n00JlnitjfimZydf+oRVJfN/AUR5mdxYSbNezwChoMj5dn7hp8TQ14xH2TIMj
         yVP8dabKAI6sowQhV8LBRLkzdvZrMe/GobgCiwqh/ZBTBdwQb8sSkGbZPb+My03onvlU
         V3iZbunP2zIquiLJbxSiGnsN5ve2fw9CjyYp8vNA1J1NNCmUhhtKEwV6xX+XE5U5r9RB
         xr7ZEXU7M++U9+FL/RQX23wA7KeViFtc+ckM2h+3WIVHifCR7+Y3PdUJhfBNLUTsdyFX
         HVy0HTGqFZ3T8Mx2CMSlNjTSIsQutOZXXG2ixoRjnbFN31sdwsUYNE3f0HqdyTjbwmP8
         y1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131465; x=1792736265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=QkXZEh1gTLClanCc9RVilSOae/FyMNxx1uGzJCTklE8shgvzKpoXWgwERI5gdL9SrJ
         nxh9Ex04HJBMF/TBK/ny4napcqjuVR9Uk4BuJg2sQANvIMtu5tqbPhEfWgWl3doBTLoV
         FQkxJ0xOctiW7jiEn71GU/2I51IKdyTEXpw4XQQ+PdhzWF/OKg2QzILJWDxOF2Xjm4CC
         lSy/vsrQ3S3WCsPj+EuFkKJEMqlxHo92EQER4VvWe4su70GSXigVmnwIbXmJo3msqIFG
         4OywMnSvIeQ1k7moSAiwfzxIybWa1cXJPU6VE64fy7sYsDY6Bjp1xDPjmlTKp+D6kIpP
         ++7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4OU0jgG7T6IQIxpVVvnYk9nLhs/w9Nzb5Rty9gWO+gCpd5LqdkRElTf+zUvhNtfXRn4sfVY2RNcVSNJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsG2Nhe8eyFRmce6Je2HHhSp0/7H23EG1+XdMuLXgF8kFB4lb4
	bpPhMtlcR1fPu1B4QnqvWL5UYo8l1tjkqkVKb/KSVjz5+/5/Vwb88WW6
X-Gm-Gg: AYBFou3iE2yLoKiVbtwQc9fEDCBr+ZkISo1fFBq4cQvYsdmhO3w43lKZigikhtvyeUQ
	xC3Wu4ehYVl42se4yM7VjascY6FLYVMXHSSP8tj0fTm+6pKQf7W0oUoXC5WyzbB6uLNvUuGNle+
	Y9+QSKcGI92euAFSjC/KD2ybQtciS47hm+gmq/YNEeZ2VeA4FFJYC8kRFOXCx7/5CWxew/N+iGi
	t4deh0pKeaHZ4pIW9mhY0zBvYThKCi5DqFidEOJv02PwgF8WPQzXN+FkjS9D5OthPB0qgNRIMyW
	DH3yCYcWVQdd7gGMPV0bdJRfe2f8feC5xhNfLrWiNE3RsCjja9Z7hxFaqUF6TrY9kMcJgOywy3U
	Wl4SlmsOQGUi20ioIVWQ1yVOsy8KsJeIdJiK6e7MmzlVpR3qDiso9GxVS1RBDBqxWwMUTSupZWJ
	DKH8+gWk5t6+22tLrmag9c718Pt8EHWvmXLi/kmc59bb2JXfqSrATKHHd1i8FKTeWCQfJHfC3if
	4SIwg18hBDzxQjfivuabQ==
X-Received: by 2002:aa7:88c2:0:b0:886:cae0:fb64 with SMTP id d2e1a72fcca58-897c700e74emr16786375b3a.31.1792131465299;
        Thu, 15 Oct 2026 23:17:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:44 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
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
Subject: [RESEND PATCH v8 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Fri, 16 Oct 2026 14:15:49 +0800
Message-ID: <20261016061549.4181390-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0

