Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814152;
	b=Awywg9yiOsdwGuxc2Ulsn7j0GRAFFPVUiKlo/pfHpgtoxs+gsUKJBgUlyUqYHjYwRso/
	 U7lXJ2osCQwk1HU87QWvLzeLkzjmdaaONNYeo0LF9toierdnjlT2ynIFiNAcCzf84L07z
	 q2gMkTLLwkCf0tMx1ktOSS7w0mgKZ8snd+s0pIvR7ybxy+K3pdCu0NgHnL+K/ecpzpV7L
	 LrxRHG8pFAnUVbNCywT0XNZnyUfFIhUSCaoivpJ09lV08WHRDvbb/sV/k0PTOJ0kPTVQV
	 TdzRwfZJSZ7wPYagbJ2Y4c2Q8Bq4OFNeJ+rIm25+bf31Batlwiq4K5gWsLxK5dQY7lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814152;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Qgrr7ni+/wWB6KrEVoi8winLqQmlrOPhCmlWyUxljNw=;
	b=oEcglH1vf8nzaIFKnn82Ibg8lq9CrR5pSV4HCuhotxc1buzxFSnXdOYbjoCxsPl4xMU2
	 sMuxUMXnsJUHkOWTVz7LV+H4pXp6JAkypg43lB11zTg6FUbm7+NAYAfB76ff1gwh3yyZ9
	 2Nf1AWExvq4JpNOHZIkyl6vmx/CKLZNyo68XXGHYxuEumd2PgynOXe2B0T17yIhY4g8Yb
	 gD0fauycaXYprU/PcD1vdCZ4Qcw6r3voTDE9aAbkUxdPlKm/a4qE5HY8PA5BdrMVkoXBE
	 mdXkyZzXjfJy+j4MA2D1mx3cBBpwOFOTPpkpU2C0VcGvfSybQ7hnyZBUkKYrC/8leQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=srH7cace;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD6F606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD6F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=srH7cace
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qgrr7ni+/wWB6KrEVoi8winLqQmlrOPhCmlWyUxljNw=; b=srH7cace5OyxC1TdxFOr+0SV9v
	YTuYN8Mdli3q4t4D+ivBeGsfe00NdlnK7kxxurFEZTxKy4IQTBb35mdvErJ6E/u0SB+b/mcOTzlLD
	ycRAoYy7wTqSK9s7WyLpO2x5xh+TIM1vG0BjaKnJMWvCZBDWffiJj9CH1Q+5zXqgTCBo4gU/rjcHd
	ravT/ixqz1n8pAUEL4B0Bgq5BbCcwZbckr4CMNdBgVgTAJgiALyzFfyRGAzgJzAbx5sFP2cagKKyZ
	iLJOC/IYymF6l+QT51IQRg44qK/ODXABaQFCzfPiqQXQZsWRt4Qad/6CkiDZALp5+nDmTXKTUko1A
	jkujztEQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf0I-00000006G0L-0rAQ;
	Wed, 04 Nov 2026 17:42:30 +0000
Message-ID: <0f7942d5-71b6-484d-bb4f-ca3b13462216@infradead.org>
Date: Wed, 4 Nov 2026 09:42:29 -0800
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
Subject: Re: [PATCH] powerpc/mpc52xx: Remove redundant 0x prefix in
 mpc52xx_pci_setup()
To: Thorsten Blum <blum@kernel.org>, Anatolij Gustschin <agust@denx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261104172829.231857-2-blum@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261104172829.231857-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/26 9:28 AM, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefix to avoid printing 0x0x.
> 
> Fixes: 59510820fff7 ("powerpc/mpc52xx: Fix some pr_debug() issues")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  arch/powerpc/platforms/52xx/mpc52xx_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
> index 0ca4401ba781..a2e53cacd15b 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
> @@ -288,7 +288,7 @@ mpc52xx_pci_setup(struct pci_controller *hose,
>  		printk(KERN_ERR "%s: Didn't find IO resources\n", __FILE__);
>  		return;
>  	}
> -	pr_debug(".io_resource = %pr .io_base_phys=0x%pa\n",
> +	pr_debug(".io_resource = %pr .io_base_phys=%pa\n",
>  		 res, &hose->io_base_phys);
>  	out_be32(&pci_regs->iw2btar,
>  	         MPC52xx_PCI_IWBTAR_TRANSLATION(hose->io_base_phys,

-- 
~Randy
