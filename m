Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521273;
	b=MWB8wws0PeGwDy5hcYSBii9dJwCv9+y30w2LE4aFXpqqwObBcYiHKJw2aJ4++QeX6TqA
	 OW65WSHMJR/ZJ1BsD093CLJA8fyamI0UQXMeDF1h2FTK+CVWRvpaWatAAEW1K7wivckGx
	 mCiblHktI7hFWXllHvr48R9hPGT0I/tWehJZ3/WWiceQ46tqYi8cu2zlhuaGb90wKsA5Y
	 ROmA8Wx6ukxcZzuFHBV2Rqt4lpcwElXsJFj7mEfIQ211ONscf/YrVSGqX8jp9rm+8B9qN
	 SzTx35/o6oAjCeitcUW9x18a2/cEkWGwno1HmdZWER+NtT/iPIig9bKAtwwAgS12HAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7xvuCJgcD9l7E/ovSE3XgN/jPSwiafr1MiTxX4bzF5o=;
	b=OjiMBxkvVZoZm9eW3PHaO1mjhDFw9q/jX4OUwl1S1fJhYn9CNgU1o3ULwQQExmcMubrV
	 P1z2pDbLbDMYLJdvM8HmOSE73lDhmkT+QLvWcg2ZZHs8SbPY0+WjXPs7mpTkhpcOq9AYR
	 NpXF5fVVSH0NnrxUA8yF6qrggfC7cKhA6u1BXTpDG8v2C8vn9SqG1+AWXwlfyf/+9kJuv
	 Fp4NSSeA2FuYNr4oxKklnsY+x5s4IlGNWzuYpOrlkKa7vxlLwYJpwYzIdGIJfg7EYigEB
	 omiTgYOcvQdA4JVBfR8Tl+mmpZm2KRzilnFLGcwk36BgT0/ZgWYeCoiIBedNIrWuvcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NkJZjs/E";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB0606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95BB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkJZjs/E
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2944425eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793521271; x=1794126071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xvuCJgcD9l7E/ovSE3XgN/jPSwiafr1MiTxX4bzF5o=;
        b=NkJZjs/EMBQbCOIMogkLRABNsWip9qBkrNjQB/a5g26rcPoQDXpdRvjx/2LwgpC+/P
         qpLlWY6S9cc2G1PJHUZ2uvdPlFRMNXGu/Gbq70dv7cG68VQo0Yzx2REwx+aWWF3WJSJT
         UD1YOh/j4hhe70lSvxLt5msD1QeWZmeIVnLZ7wJlH1BGYBF9+T3RpT8wWaNcgRTil984
         8rJWRfJusj04p/47zY5znfEiig2Q8paiT41Xhu66586PldVud/zlYiwE2tbEW27kDahK
         /JW47NzlINKy49MVj/oMt4DGAQlPvtsYpdjCDKmIkiAiBbaXZsh9p3dF9aeXLcdQMpx8
         WaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521271; x=1794126071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xvuCJgcD9l7E/ovSE3XgN/jPSwiafr1MiTxX4bzF5o=;
        b=pU58ecHWCLJFcKxy0A8o36fZxYrIAMEik1jTNdLDyp6G7z/DSEyuZuAnnENP6v4JGW
         /PFEAWJJSEMepvVzPG4VUOVkjrxNBtjhutdpo0+p41u2tcKQPQfahaRY/0QXUHwb4YLz
         6BvjQEKn/F5m8wwQ/zE6jWQeqgvDZff571hSQKQJ/+3nvWYYD/bbqlxd9MVP6sCagCiv
         NFxg9amfsWDLJRbFVMbgW9pG+5U85lnHwyY5DmuOOptD5FqxAwQ4W7+XVQru2XidnW5Z
         VrQ97rWgG6+h4tyr+poPOqdS2ZhOUk52rSbj3pNClduaXxY4Kr4+NclSzUKEiuBrlabt
         SGQg==
X-Forwarded-Encrypted: i=1; AKwUvBwdy9HKtkTK2O27XlLSruCw8D4VcCFH3X4v/5aBybEqxZ9IhY+gqkRXgo3txNQgRdXlDzFH9i+NTmWLUUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/njrfV9tRMpq0juidIBOBej66fxL/+tC1Y8QJccrNqEU8wxVBV
	Y5j1GLfzq67khKVwn4zDRQkXgxtafBLNYfvzmMokpsLNsWJ/lTeEkzy2
X-Gm-Gg: AYBFou2U6kIE/SDNT3fA2tJNVpCtGOJEQFjO4eD3E86ztQM98nYj7oo1H4zY1DptXUU
	pPlfLCCAUb95izqx+4kPd0vfXqF8HryzpnzU/r2ayzdn+5+SVfSvxAyNKCy6BhABWaIuxh8swqc
	xFL9+O57PNEYsg+gNdYFbCN3Y7JjA8Gc2ZuHVXhhyRJhhLJYO0oylZgrd3dGvRAiX4CZ3EQI2KX
	6ZrQSDUuzH9KxRxz4jLxX8xnIk11UJlie5qY3JTZqfVVPqszyNTT0G90YyNrAkUurwjpzcMgXTH
	eFmxXJbVYL5f9jbxlserA5XsYCpfzJk+mAu1mwyQoIqv7GI1d776NQ40U7xWcpx1p4xQUqfvwba
	gmpY5mpfKTIuOt8P76l2fGL+1Dzfz+XVZTj6RCVdUrk2vHSAtxtm90NMtMEnIE8fo4DhjO3DwUJ
	lr+sDfwPMBPQENtaVH7dQF5ztPSNTW7xk1wsuQDCVO+xg51r5uKuom4gVKnv/gJmsaJNl7OLGDO
	D+LJL/aq0HiQRPO3ldXaXXR/BSTsx/DYeTP7W0VppGokbbCzm2moWgV+5sdZHOGBkItXvqF17zT
	nlwJLvx+Y/qIF9pBoDWzuQNmfL9r
X-Received: by 2002:a05:693c:895c:10b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-36a4a08f8a7mr8653024eec.27.1793521271334;
        Sun, 01 Nov 2026 01:21:11 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:bd68:88be:f3db:8e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm24114255eec.28.2026.11.01.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:21:10 -0700 (PDT)
From: mdshahid03@gmail.com
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] x86/hyperv: use pointed-to type size for page table offsets
Date: Sun,  1 Nov 2026 13:50:34 +0530
Message-ID: <20261101082034.134583-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The Hyper-V crash trampoline code calculated page table entry
offsets using sizeof() on pointer variables.

Use sizeof(*ptr) instead to calculates the size of the
pointed-to page table entry.

This makes entry size explicit and avoids relying on the
pointer size matching the page table entry size.

This issue was reported by Coccinelle script noderef.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 arch/x86/hyperv/hv_crash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/hyperv/hv_crash.c b/arch/x86/hyperv/hv_crash.c
index 5ffcc23255de..810eb1a4a0a2 100644
--- a/arch/x86/hyperv/hv_crash.c
+++ b/arch/x86/hyperv/hv_crash.c
@@ -512,20 +512,20 @@ static void hv_crash_build_tramp_pt(void)
 	pte_t *pte;
 	u64 pa, addr = trampoline_pa;
 
-	p4d = hv_crash_ptpgs[0] + pgd_index(addr) * sizeof(p4d);
+	p4d = hv_crash_ptpgs[0] + pgd_index(addr) * sizeof(*p4d);
 	pa = virt_to_phys(hv_crash_ptpgs[1]);
 	set_p4d(p4d, __p4d(_PAGE_TABLE | pa));
 	p4d->p4d &= ~(_PAGE_NX);	/* enable execute */
 
-	pud = hv_crash_ptpgs[1] + pud_index(addr) * sizeof(pud);
+	pud = hv_crash_ptpgs[1] + pud_index(addr) * sizeof(*pud);
 	pa = virt_to_phys(hv_crash_ptpgs[2]);
 	set_pud(pud, __pud(_PAGE_TABLE | pa));
 
-	pmd = hv_crash_ptpgs[2] + pmd_index(addr) * sizeof(pmd);
+	pmd = hv_crash_ptpgs[2] + pmd_index(addr) * sizeof(*pmd);
 	pa = virt_to_phys(hv_crash_ptpgs[3]);
 	set_pmd(pmd, __pmd(_PAGE_TABLE | pa));
 
-	pte = hv_crash_ptpgs[3] + pte_index(addr) * sizeof(pte);
+	pte = hv_crash_ptpgs[3] + pte_index(addr) * sizeof(*pte);
 	set_pte(pte, pfn_pte(addr >> PAGE_SHIFT, PAGE_KERNEL_EXEC));
 }
 
-- 
2.43.0

