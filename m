Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5344718C0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449625; cv=none; b=dzjwLN7XUKnz9lc2n0uTKE8IEL8wNz/qZJ9zW7vmAQUAjMqU0RDQrp2DKaNzrsOu+QrxPsQVLZ/VlqjxYCZikp0Z6pH4qdWhP1MSG4rh6cPtiSp1bgjZ3mO1Sc71rGU/Zh6OKZMsI7NBvsErM0tvVyTf0caQQIspAEmesgEqaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449625; c=relaxed/simple;
	bh=DorScl8xMBCj077pCoMZa9UZ9UdtTl6iptQ5U72q/7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rXUTfCe09t7u7mTHa3hWk8EhW0n/WDsgepRvKIUU5E244h278dtBuU/884/HcNQV+sBk5WvGSC77Gc9eU6C2bITDpCNa+wDTylWJzov2GgtBhfemL59hY0Th7BcE59kQZRmjzdf3vu/ztRRaPJ5b5X9omf2l6NSHo4aZznuZjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2O08l0oe; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2O08l0oe"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XrSmR91whuk08N644eAwBFjzDz11AL82MPhnOqBAPZ8=;
	b=2O08l0oeep6LTqg6atyOJge8tnPzdgqdxkfeQyYM9prGQusXxeTpmDu4bPCmvQW4yDixvHhMK
	TqVRN8TgFheshklaoiC9UePcklih1SFdiqGqsXgvxtCyX7q50VDE1ax691/+OYsjWIYsZT9bxPn
	UkqJowGBMbe1S6Qa421sm6k=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j0k422MQGz1prLc;
	Thu,  8 Oct 2026 16:41:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CA4040579;
	Thu,  8 Oct 2026 16:53:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 16:53:37 +0800
Message-ID: <f35a662d-07b0-4cc5-bd5e-14fcdff2f161@huawei.com>
Date: Thu, 8 Oct 2026 16:53:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into
 separate helper macros
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-19-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-19-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:14, Will Deacon 写道:
> Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
> macro is getting a bit unwieldy as the control flow becomes increasingly
> dependent on the macro arguments.
> 
> Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
> EL1t, which are then dispatched by simple wrappers.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index b4df2f23ebe7..38f9327e6a0a 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -36,10 +36,7 @@
>  	.endr
>  	.endm
>  
> -	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
> -	.align 7
> -.Lventry_start\@:
> -	.if	\el == 0
> +	.macro kernel_ventry_el0, ht:req, regsize:req, label:req
>  	/*
>  	 * This must be the first instruction of the EL0 vector entries. It is
>  	 * skipped by the trampoline vectors, to trigger the cleanup.
> @@ -52,8 +49,10 @@
>  	.endif
>  .Lskip_tramp_vectors_cleanup\@:
>  	sub	sp, sp, #PT_REGS_SIZE
> -	.else	/* \el == 1 */
> -	.ifc	\ht, h
> +	b	el0\ht\()_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1h, regsize:req, label:req
>  	sub	sp, sp, #PT_REGS_SIZE
>  
>  	/*
> @@ -66,13 +65,23 @@
>  	tbnz	x0, #THREAD_SHIFT, __bad_stack
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> -	.else	/* EL1t */
> +	b	el1h_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1t, regsize:req, label:req
>  	msr	spsel, #0			// Stay on the overflow stack
>  	sub	sp, sp, #PT_REGS_SIZE
> -	.endif
> -	.endif
> +	b	el1t_\regsize\()_\label
> +	.endm
>  
> -	b	el\el\ht\()_\regsize\()_\label
> +	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
> +	.align 7
> +.Lventry_start\@:
> +	.if	\el == 0
> +	kernel_ventry_el0	\ht, \regsize, \label
> +	.else
> +	kernel_ventry_el1\ht	\regsize, \label
> +	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?

Looks much clearer now.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	.endm
>  

-- 
Best regards,
Jinjie

