Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701066;
	b=cnnBJsUR1ba53pqCC8kI18cw/k06jSuBj+sQMnAAhhDc3dSDG9WXeIZWFqsBSRxpf42N
	 ab+yI/Ctxjb6XNXdR1BQeTHSv58V8HoXaJXmWgo1VRiLDiWjjPP8ssVaUtSazkIQcUVd9
	 jVCKMY398Nd7QbpLtuBJMybpI2IZKfKBvPCS1t1qMc7aTi/D29WcNEfNhj41XGh52Z9uW
	 jBFpoVbsQzp60gWUFyhD25NYfpGZr3ootG/ErHlR6vBqv9YnN7n2a4k9fa/yCWpJZ1z7U
	 qymFaqJWQJmycV1gzNUH0hPHUKcb2/FeCvg6F3Jq4mxVxc52+mBDGYcJ2TjwFKCCTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=;
	b=PtizAP36M4n0AlwtksMujT4qFaNgCjz/StVa7TlZs/aOi4AJjP/81KjIjo0eGfln8y7m
	 x3x9i2GtB567aQov9gMSMsxSONjuLP33DGgR7OJoU4enXU9ITa9ZfrmtxPTY35WjTJpoh
	 ezsMF+2W+f9dRCRiGgnWsts36yS05YzDlXvGVjsCZRrkRWJB/3Nd2A5hL+VmKpoEId6sV
	 VIiSJoaFr4JUQsILpmFLZ42go11tACrJpMX2CjjWyaXAtx+DEMORxI+pU0DCTsxsk3fud
	 WXfGkh+PsbE/EBIWHrLQB+oEfB8VVj338zBF3K64MFcAJ9WzQAxkF7bpO76AyQnohCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcCjbp7B;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F8606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478F8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcCjbp7B
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4808199c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701065; x=1794305865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=;
        b=hcCjbp7BJGsBfNZ/TvuOS0Cmydo0Px5T/78GqzVGtFBBtv19ubsCH2laBMI4uNFQ5S
         xim5M21tiEwfxAryfWtBdsK61x3jmFKM0eThMXnSOowFrHyyMsZL9EULSd/wjUIrnKXW
         ZJcZjSVva5+GBhCJI4HAtfan4CFB8qY42A6edd74VkK/vBR7YL9rZB3b2WimZ3/PAvka
         uA61H2JmKqYUy8qG6R9HF75uQsP5er12fXhtc2vxNiv3fINhZ4HnqWZ/8WNV0l0BQxSj
         JQnAix6NnW1AYzCBaNbuHNQ6mhz5FmJ/JbE/l1CxGdk12MX0QjMy3pbrJw1Z24CR3HSl
         yXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701065; x=1794305865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=;
        b=DRpZ6rZNGHs8op9v3YWNUVJR01AEA43OLb0o6T0SWapIvdiU1ToY4KDVMDvQ+wQRZR
         vbcZFJtC8ixSWEeot8QhlK3h8Dog4SUydCTeiuxNBWyzO/5dzCjSpn6Njkiq+D828R/q
         u4ACcxaH9gJJTrcvU7aTjOekVD7/FV3joKyCvMgrpZ7KiBhc2F/aP2BpETDI/Cuc2+fw
         2fodIfmG4VnrZaIi/PVi2NCaO8M9ddB8b1NkuwCmu7fiWjOSA/KYglyLkC/tmRI9lI8b
         iZ6utEQqQWS5bAs7tCNdApgMCsjkBh8NYxqnrfBhkZLcXjbnKlncmQYXTmDcF6v1Xn6C
         4l5w==
X-Forwarded-Encrypted: i=1; AKwUvBz1Kscf68UIMdpuH0rPd8JLNraQk+VnU+xH57nDEAEkdBWxjEdv2dkBrTw5aSN20ZSJKD+xykIqLSnt1Lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VZV+kZt3qgGCm80xwwksuLK7s/+vCYTKnJjeC0olumNBEeJpy
	5w7Xby/bWX9JLV6syuANay1m97l6r9akKD7Z3EQ2FkBVKCgpsx+4BZsq
X-Gm-Gg: AYBFou2HR3jO57EF9L8+JZMPlsyjcMeoE1NMw1NxcE+wDzBKKRD+91eP+kYZq33hgiZ
	a2c8hQhFcVDKSkKG5kQzxSbYgiBX3ogDvtnHujQX3ihMWCRi3Wg+bknp44YYG+fmDBaSsT5kuV9
	5s+83k3+YbhWH9yYyrYp3/w0ACiv3LSVbchtR7w1As8U4ZSQfOl61Q/0WeWgueRtbh8KAv2dnoZ
	uf+9BcaGe9qjAwmj2axm86HKMDDuzIggbo0H78jFh68uqGxWiTMg5MgjuejgbmzWirJGvuDyLgB
	JajVhFhKIfQtHoyEXDmn5hwO2n3UA4qfAgV1YTF7aX9Ra0ie9UNEff3IvoHKObnpA2icN1PYJL9
	5j7Da0kTziWf836r0ynAMXelQy6SzVV6aEV4P9O2UKsXkU+dn/uJous9MGY3bvi6GZjJdfzzerL
	0ifYBHUC6Q4WiNgqJ8AsNDbT3lKIHqqEURswRiAFO/T1zZY/nvaRYNXhofB9lOp90Wtb4YlGICc
	2EpEBLFI6GwPEiE3v3SINrvwYxDxGD1ZS5uCpf92i8bpmv3+UaxuAXexDErs6cqmZ0md3pP7Vs4
	GPUP3gYLMXZx2Mb41Nb7ahF2sBFXAw==
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr18115510c88.3.1793701065267;
        Tue, 03 Nov 2026 02:17:45 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:44 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Tue,  3 Nov 2026 18:16:53 +0800
Message-Id: <20261103101658.766905-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single vmap_pte_set_huge() call installs several CONT_PTE blocks at
once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b3..c29704a19e27 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1

