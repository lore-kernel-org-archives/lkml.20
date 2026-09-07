Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303FB1448E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744842; cv=none; b=Q2DjgwWUnveCQm2Q0eQZrVwXMPeIGKiO11ymLkyvh3iSqmkTYw8c+Pk/oHKOhGHxT8FfiB5X4hnw/F34PoddyPDtdQ7cQhpp3/i9dHd0t1+OTxoUlbn/YODDbi+1DUZZHDA2kY45fMDrzbI7OzL2X29FwQ1AlcMQ9hzSTuUlFFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744842; c=relaxed/simple;
	bh=XuzR/AeiC5eV3O6MqY45jgZaAxmh7tsjHTqImQyPP68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q74FPzjjD/f9NqDiW/X2URmjuYCuJvrUxWriedaDeK2uMDLKs4EQ/+Vig1P9lEEXShxmj/zCdu6Twa9+Rj71KLro3zsrGS42J29zIvPozPB0uVgInrBNUb63UEKcg0TwLhI1KlhHSVQ7AuoKMlNJm/2PWnxMUKYjE2Qh3bYA1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=OEjfHQIZ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="OEjfHQIZ"
Received: from [IPV6:2601:646:8081:8d71:eff4:58ba:1553:a194] ([IPv6:2601:646:8081:8d71:eff4:58ba:1553:a194])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6871XWIK1701657
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 6 Sep 2026 18:33:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6871XWIK1701657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788744813;
	bh=G6EHKDPoz+cMSYeZ/E8fN6n5h2t8dqEBErQALZ8xfOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEjfHQIZJv87iM27aDMUf64FlaT5e4SBGR3Nr7TMl95X6csTq1yUP+s3mErep6Be6
	 d1UT+vgAu+fAJFLNr74AMLC2g4JJ9bMSLU79LFCZx7NsRnoQJ5Nprrmult5tdJ2d3P
	 EAsNp4fcz9vftcluhwhnh1J63kAtAaoZuiUhnrg8CKgWxCApAP5DAGG4dxSKSZ24WU
	 wFLwKIzCn9KzG7X+Cgm+xpS9azGAlnX1H1uhgexCjSGbvBSml6wByunPt5P/DEhvi+
	 Pky91iB1umyBlWyGOBokn+lqcuO0s2Km1oJLoTB4sDhfRpcacTika8TqgBC0jkmh0k
	 aPJOSZt+auBRQ==
Message-ID: <fe6933ae-5684-4c5a-8c99-1d80f583a101@zytor.com>
Date: Sun, 6 Sep 2026 18:33:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] x86/kexec: store segment registers directly to
 memory in crash_setup_regs()
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
References: <20260906183942.103011-1-ubizjak@gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260906183942.103011-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-09-06 11:39, Uros Bizjak wrote:
> crash_setup_regs() currently moves segment registers (ss, cs, ds, es)
> into pt_regs via a general purpose register (%eax). Update the code to
> avoid the intermediate register and store segment registers directly
> to their destination fields. This reduces the generated code from:
> 

> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 5cfb27f26583..ad7ef567452b 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -106,11 +106,11 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
>  		asm volatile("mov %%r14,%0" : "=m"(newregs->r14));
>  		asm volatile("mov %%r15,%0" : "=m"(newregs->r15));
>  #endif
> -		asm volatile("mov %%ss,%k0" : "=a"(newregs->ss));
> -		asm volatile("mov %%cs,%k0" : "=a"(newregs->cs));
> +		asm volatile("mov %%ss,%0" : "=m"(newregs->ss));
> +		asm volatile("mov %%cs,%0" : "=m"(newregs->cs));
>  #ifdef CONFIG_X86_32
> -		asm volatile("mov %%ds,%k0" : "=a"(newregs->ds));
> -		asm volatile("mov %%es,%k0" : "=a"(newregs->es));
> +		asm volatile("mov %%ds,%0" : "=m"(newregs->ds));
> +		asm volatile("mov %%es,%0" : "=m"(newregs->es));
>  #endif
>  		asm volatile("pushf\n\t"
>  			     "pop %0" : "=m"(newregs->flags));

Why not use "=rm"? "=a" seems odd in the extreme.

	-hpa

