Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBF346782
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955225; cv=none; b=ZqFy4hxcKe/OfCpcE4f8hnnvWmu5fKhpqj6jsjJCXHKaR1zjoOc0SVD8BVB15bMTAtxmtplxAAkKsOEi31EQfHXObHQo5uF4lQtQUuzdNK1Gk6GvmqkRQMIbKhQ1nuN/m3eRm1nvnDJ9TFWsP2mkTZASIZ05rH9vpcmFrWfZV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955225; c=relaxed/simple;
	bh=vt9JeteG2oFQV+GnicXgGkbehrJnCtEhGL/4LutvWww=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=s+1PJDE/lDTiFISLREFO96rmwS4BvrEuPCAVGORrnYXD0Ie2rJPISIqdMJLGtLdBpUDqmzG/rXd+G2B3Ki1UWMmImqUbbCFjFq8shETp5SS5MdLr5sZijdQcDm3ryUxPIa7RJKgASHZZn8GIvwyF67g2ZavAbxZV02OjQNwngXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nX8Id05w; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6N2z7SVo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nX8Id05w";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6N2z7SVo"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790955215; bh=+20aOKF3zq1y4vWlQvjoUmE
	LZyVU1h4VHnXyu2Bm7Xc=; b=nX8Id05wqjZjqfR5jGWZR0cD9m2euAMMfctiXMmp5o/xbmZ5B2
	q0cNt23cjPEJ26A5hsLoThYviz7MF0IpRwBTdJ7yKetiqSztVI9DGrm+hjXsPrBJQdwgkWFCR7k
	qZbHhVAhWS0aXHpBBvfCDJm3HyYWhs5Gu2qiUhexMzQVCRr1D1nvxYwXdTNK8jRGHN3MQ7WrpUK
	c585STpqrjcH7vTJ38Hv7NW206d7CCrLqrEX0tA4e5Knm9Uqg9Y1bawQT9RZjTQqck9RFU0tyM7
	2pFzd2pJrfjekniXmcvzq33cYTgIMnfB/+IQAyGu1BcZ9ilcYnXHHbPmCh4nmxddyDw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790955215; bh=+20aOKF3zq1y4vWlQvjoUmE
	LZyVU1h4VHnXyu2Bm7Xc=; b=6N2z7SVo6O4QV2KE8PftAgNrpUDzXMTRgFKFOfqcaFvHi0PnEk
	iKjCJn5MouWmIzpQnLQ/Q545VDrYbApiaUAg==;
Date: Fri, 02 Oct 2026 16:33:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: fuad.tabba@linux.dev
CC: anshuman.khandual@arm.com, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, robh@kernel.org,
 tabba@google.com, will@kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
Message-ID: <7300EBD4-5D21-4EA3-84D7-BE0DD83870D8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 13:12:12 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
>__init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
>which are RES0 there. The macro only checks that PMUVer is at least
>PMUv3p9, and 0b1111 passes.
>
>Exclude 0b1111 before the compare, as __init_el2_debug does.
>
>Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")

I see, I see.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
> arch/arm64/include/asm/el2_setup.h | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>index 87560d8b254e6..1da277baacf78 100644
>--- a/arch/arm64/include/asm/el2_setup.h
>+++ b/arch/arm64/include/asm/el2_setup.h
>@@ -421,8 +421,9 @@
> 	mov	x2, xzr
> 	mrs	x1, id_aa64dfr0_el1
> 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>-	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>-	b.lt	.Lskip_pmuv3p9_\@
>+	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
>+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
>+	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
> 
> 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
> 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>
>base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
