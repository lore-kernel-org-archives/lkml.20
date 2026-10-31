Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411203;
	b=G2gfF+gGhxjB9elGuMO+s+zpfgzjtaYp6p65+1mMQ11kJpPCOnVqsoCUhXd001wWlND6
	 EGV32e8N8HQybWARkrqjypDQnBb+UEAAx3DTPJsGjhcmsBXk8S+1t1sBIf5ECTSs+ilwi
	 6s+q/hfXU50jh/xmAaVwiGF5lsnqEU7FhyU7AlAmj/fiHP9KhbuTBXyUqU0kdtIctIvF/
	 GDcUjwGM0akhbYL2VO0A/k6n/wwiyFd9G5rMPa7K08zd+wHz6QHhG/9ckQ1V3f0nn7xRF
	 KeoVgoKzAFRuNuEnBt0r3+T23PeclWY6b7PondEDVKgmpiFnaUTK9tXCtZsWlMAPGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411203;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kd14u096JjkPRLaqOkROOBBjpmqH88uswZaEM3ZEqo4=;
	b=RzQXLYPJRMrG8A8r0k5b/uyRK3ujQsw22ifdow6YG9vuJk5JoVzv0KvO4TPXuLnmLwOs
	 5DMql5hXiAWgAF0KRFYrY5rDRmtJZPjsdyaq/6zG6JaRwmrCNgsLJNL1/LxVaKDmQ833q
	 Lfk9gfk5G63kpc8gpG9R/VnF62POuWvuWUmyxouiJqQemEL9R7fYne74gTZ5CqYIJNXsP
	 jKHBuHZyTDTjg1HNL3yKeT7EvNcI92Qa9R6SUxavVWYtcOuK705TLAKs9BjPJ2nGIp+FX
	 fVuE4eXaBOqdf3CHUl8ofqORMx4xDjuxlOmrS/rdafM7KoCDsDw2BU83Y2Dwi+Z125Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sCs88WfC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA26606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sCs88WfC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62B71F000C1;
	Sat, 31 Oct 2026 01:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793411203;
	bh=Kd14u096JjkPRLaqOkROOBBjpmqH88uswZaEM3ZEqo4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sCs88WfCWNrd5mwuw/wWOb0uy5CH/M7jz2wxKIMYL11yu4lifwZPkEnqNj+jElaVy
	 X/1WQZXaJmXMXw3k0G34iqX86NHFwFCDIYExe9Ikt5fRu1g6W3oscaBlZw4DiSoMW5
	 RN2N2hWVxFS6NAo7CuZXf+ulG4yNc98zUjUunT/k=
Date: Fri, 30 Oct 2026 18:46:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "Ahmed S. Darwish"
 <darwi@linutronix.de>, Kevin Brodsky <kevin.brodsky@arm.com>, Andreas
 Larsson <andreas@gaisler.com>, Yeoreum Yun <yeoreum.yun@arm.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] x86/boot: Fix off-by-one error in
 sme_clear_pgd()
Message-Id: <20261030184642.3ec0215c9b47e3f3e0dbdbdd@linux-foundation.org>
In-Reply-To: <20260918142714.242711-2-blum@kernel.org>
References: <20260918142714.242711-2-blum@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 16:27:13 +0200 Thorsten Blum <blum@kernel.org> wrote:

> The mapping helpers __sme_map_range_pmd() and __sme_map_range_pte(), and
> therefore sme_encrypt_kernel(), use exclusive end addresses and stop
> before vaddr reaches vaddr_end.
> 
> However, sme_clear_pgd() treats vaddr_end as inclusive when calculating
> the last PGD entry to clear. If vaddr_end is PGD-aligned, the first PGD
> entry outside the range is cleared too.
> 
> Use vaddr_end - 1 to calculate the last PGD entry within the range.

When fixing a bug, please always fully describe the worst-case
userspace-visible runtime effects of that bug.

I'm guessing "none known, this is from code inspection"?

Thanks.

> --- a/arch/x86/boot/startup/sme.c
> +++ b/arch/x86/boot/startup/sme.c
> @@ -99,7 +99,7 @@ static void __init sme_clear_pgd(struct sme_populate_pgd_data *ppd)
>  	pgd_t *pgd_p;
>  
>  	pgd_start = ppd->vaddr & PGDIR_MASK;
> -	pgd_end = ppd->vaddr_end & PGDIR_MASK;
> +	pgd_end = (ppd->vaddr_end - 1) & PGDIR_MASK;
>  
>  	pgd_size = (((pgd_end - pgd_start) / PGDIR_SIZE) + 1) * sizeof(pgd_t);
>  
