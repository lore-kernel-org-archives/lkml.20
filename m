Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737342;
	b=BFtuyzsnwyQmV6nfV6+/RRoMDlkpyUIYgR/Tnojme8VI6gYHHTkShMfd+Yjj2tgfRPgi
	 GdnbpnBWs9gTXgqgNAmvUPeEEzTvARK/zO0FVLZgLZhnsxRXCht5F3zD9OnbGp40zHvv4
	 mV7SLyz8IJ6NljF8ZmRS5SmrftiIh5THoW2N2bRCtEfOf/+91Q/TG6oxnj9k6ujtgAfjS
	 D6G1YMOeRaVMKXuKuKUuXtMRFdbiWjpn9HjCrklQ9f+ejIeZ9zxh71KlxbWozSl9oA1dN
	 Bn6B4NXwY+dhojaxwnrgH1nWuB/Cdj/JYLzuCN6+dQr1hssz3PsXzKRFRdAu2n3DD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737342;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OowuJQe3aC0/b/4LdRy+JJUp1bkSK8DzGICROZcpBoE=;
	b=ENiKH/tXySCD+L0xUJr0+wfhwY5pCVajVhRlObqI0NPd9pjtwnFNuNDZ11iv5wMyz9Bv
	 DvP06Piz96sYOEaqcH4NNvXmMHQ7R244UE0hEPGhbQvCIErXJJjk3T3CKGooNB7DLU7PG
	 QMtNfgHEHaM+Xl8v3I07G5fFYqI1GiflzsyYb5mycV2dowawPhVnr1ZPkMJav825ujKJh
	 siO7Op+Jtyimzp/bq90ESPpQxcE8wIVaheWanMmx5mHxxsMuknYRG/MVAj2lFjN39gxHp
	 o/u09k96OrYdu0noIaw2K584PnyUY8FJnxKh9D5QVvBP0cB2+WKe3OJiDYREVEbpWkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1Cb0x8H;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B00606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1Cb0x8H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OowuJQe3aC0/b/4LdRy+JJUp1bkSK8DzGICROZcpBoE=; b=F1Cb0x8H3kRQarOHQ6CQBF8gcm
	bhCaWl5QzG2ChnLUDKXehOJ1Fd70NHF5nPk8Qa2oY3y2zTXZibbInwgks6qIO7jsR2/QAgLiZ7Mnf
	+Oq5KN0uvYZ2FH4mc561XClVhRllCL1VVkD8cLM8DXg/rxi5vNy8AYZvnsFyk4Oy41f0rrDcMYsoT
	9NwwAIAxwrm0qTE1BW1pWuw+VsMe1BuN9kL7Pf6fyd3n7biq9e7FZh9lQVjdebAiQLka5B16WM4Jx
	A/pcNV/fQv+5FmRItjO+L6m0SVFyXyC+E+t7lg5UlUAi029mzw0Mgmren3UPQxkYTGL562EkzD+ZM
	fx5Fzeww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOL1P-00000003c7K-08Ii;
	Tue, 03 Nov 2026 20:22:19 +0000
Message-ID: <124acf19-a676-46bb-a414-08d957d9cc7b@infradead.org>
Date: Tue, 3 Nov 2026 12:22:18 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/wii: Remove redundant 0x prefixes
To: Thorsten Blum <blum@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261103170305.455444-3-blum@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261103170305.455444-3-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/3/26 9:03 AM, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefixes to avoid printing 0x0x.
> 
> Fixes: 7b69600d4da0 ("powerpc/wii: fix resource printk format warnings")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

There are other cases of this elsewhere in the kernel sources.
Are you addressing those also?

Thanks.


> ---
>  arch/powerpc/platforms/embedded6xx/flipper-pic.c | 2 +-
>  arch/powerpc/platforms/embedded6xx/hlwd-pic.c    | 2 +-
>  arch/powerpc/platforms/embedded6xx/wii.c         | 6 ++----
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> index 91a8f0a7086e..e9c84793cc4d 100644
> --- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> @@ -145,7 +145,7 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
>  	}
>  	io_base = ioremap(res.start, resource_size(&res));
>  
> -	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
> +	pr_info("controller at %pa mapped to 0x%p\n", &res.start, io_base);
>  
>  	__flipper_quiesce(io_base);
>  
> diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> index 1522a8bece29..a1bdb83fe51f 100644
> --- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> @@ -171,7 +171,7 @@ static struct irq_domain *__init hlwd_pic_init(struct device_node *np)
>  		return NULL;
>  	}
>  
> -	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
> +	pr_info("controller at %pa mapped to 0x%p\n", &res.start, io_base);
>  
>  	__hlwd_quiesce(io_base);
>  
> diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
> index e7eec328f121..928d082abf56 100644
> --- a/arch/powerpc/platforms/embedded6xx/wii.c
> +++ b/arch/powerpc/platforms/embedded6xx/wii.c
> @@ -73,10 +73,8 @@ static void __iomem *__init wii_ioremap_hw_regs(char *name, char *compatible)
>  	}
>  
>  	hw_regs = ioremap(res.start, resource_size(&res));
> -	if (hw_regs) {
> -		pr_info("%s at 0x%pa mapped to 0x%p\n", name,
> -			&res.start, hw_regs);
> -	}
> +	if (hw_regs)
> +		pr_info("%s at %pa mapped to 0x%p\n", name, &res.start, hw_regs);
>  
>  out_put:
>  	of_node_put(np);

-- 
~Randy
