Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A03D669C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395250; cv=none; b=cEBOcB7YYGgQfYrMPx+6fV43r0dWXS3sXK7EtNyxOYZPHB2Zy4G7StxqgD9WzumlzNyw8YYY+ERjI5XnQHhp/wK7SaCwGi+cc0JPTOc9nTc8tyE+nnUxZIXq4sf5uI+y8fsf28Ruwnz5+BEaRKOVyBrBhBaKWoCa9nZfjQKA/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395250; c=relaxed/simple;
	bh=YGXshkkxCHAlGmAm2qvq0E7xpbO7oEixQZUdChIhw6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=V9iXzDiYUwj4MfYNaYjP4yBZslLjLMK/1VWxIyTLqhhaEU4p853FFIWB32Cc3Wz1wIpsQAEDPE06PrJS0IUY2JNBMMPEZktQYTY2cyif81fa8RqbK3H8KMC0drGdKFejDK2FLre4WPqY3mnVh8iO9PJI/sWWBwE9QlXz9kcEieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BCcSMRoO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=i1TDMQTJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BCcSMRoO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="i1TDMQTJ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791395240; bh=Qx2Cu25I5sjT0OS3Laf9tgy
	myNlqPnrQKyFNkKz8hR0=; b=BCcSMRoOiaMRXN37pk17F9CJuD81V9NKcfClIQP5roSEHLf/YL
	DN+MG0FgUdyjX+O6vhMZWrF9QfxMTZfggz+Rr97M/joZedAgNqVmUno4GThBzLEAg8AuQYzlT3+
	zdcMom89GRbHlhqlcT24MMn69GC/TIXFoRCWO50XYN1jYneGyKRKCgylkkcwTEi8hUJH93BQSqX
	iZe2+OOYL9l+FTzjDr+KDqwthbs+LKs8NgN+Rg96nTlfA3hlObdSC2Txp/9rU2E2PxsCV/4u9HL
	YpK5NfXNYfBYIrFdDe/Rb9pJ9OTQcG2O4eZf9KSwgIJFldcY7+/ps7qIib49pG34qQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791395240; bh=Qx2Cu25I5sjT0OS3Laf9tgy
	myNlqPnrQKyFNkKz8hR0=; b=i1TDMQTJfLEviP0Fq2yU35+M3ye3HyQ+UjO6AvhTdR/zDqmxou
	2mHJGQ4t9aM7xOcaB10bjZxtO3wUC37Zh3CA==;
Date: Wed, 07 Oct 2026 18:47:21 +0100
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
CC: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_entry=3A_drop_the_unus?=
 =?US-ASCII?Q?ed_tmp2_argument_of_mte=5Fset=5Fkernel=5Fgcr=28=29?=
In-Reply-To: <20261007175231.1.mte-tmp2@mainlining.org>
References: <20261007175231.1.mte-tmp2@mainlining.org>
Message-ID: <EA0C88FF-9778-4645-B744-F65DFE1D1B9B@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 7 October 2026 18:45:01 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
>used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
>commit 82868247897b ("arm64: kasan: mte: use a constant kernel
>GCR_EL1 value") swapped that for
>
>    mov     \tmp, KERNEL_GCR_EL1
>
>and tmp2 stayed in the declaration and in the one caller, which
>passes x23 for it.
>
>Drop it, both places.
>
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>
>diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>index 0e1d9c3c6a93..2baefe7a82d3 100644
>--- a/arch/arm64/kernel/entry.S
>+++ b/arch/arm64/kernel/entry.S
>@@ -171,7 +171,7 @@
> #endif
> 	.endm
>
>-	.macro mte_set_kernel_gcr, tmp, tmp2
>+	.macro mte_set_kernel_gcr, tmp
> #ifdef CONFIG_KASAN_HW_TAGS
> alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
> 	b	1f
>@@ -258,7 +258,7 @@
>
> 	apply_ssbd 1, x22, x23
>
>-	mte_set_kernel_gcr x22, x23
>+	mte_set_kernel_gcr x22
>
> 	/*
> 	 * Any non-self-synchronizing system register updates required for
>---

AHH. What happened here, ugh! Why was it sent twice, stupid me man. Let me
go resend it PROPERLY, god sake Bradley..

> arch/arm64/kernel/entry.S | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>index f63049ac32dc..c3106dee61e1 100644
>--- a/arch/arm64/kernel/entry.S
>+++ b/arch/arm64/kernel/entry.S
>@@ -171,7 +171,7 @@ alternative_else_nop_endif
> #endif
> 	.endm
> 
>-	.macro mte_set_kernel_gcr, tmp, tmp2
>+	.macro mte_set_kernel_gcr, tmp
> #ifdef CONFIG_KASAN_HW_TAGS
> alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
> 	b	1f
>@@ -258,7 +258,7 @@ alternative_else_nop_endif
> 
> 	apply_ssbd 1, x22, x23
> 
>-	mte_set_kernel_gcr x22, x23
>+	mte_set_kernel_gcr x22
> 
> 	/*
> 	 * Any non-self-synchronizing system register updates required for
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
