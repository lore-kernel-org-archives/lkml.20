Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A7325494
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947773; cv=none; b=mj/1jRXpvPhwLNAWVRUCyt4ZpDE9gC7CqJa4FYvUftqxN+heNY9ffQTKMKreACkG310AxLW7ISnkOhRkTYKH/SSRZznlaIwSbj/IE/pKEzYUY13zfLIg08lbWEIxinwEDWi5QGRdnRATZ8uykUqnKQVdV4iR2sPZQrA2gaCq53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947773; c=relaxed/simple;
	bh=uq+i7K3prZJ8eb3wTU5rZGC8nwsgOZKtkmluAFWqga4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYwdhXVhXZa/01ZhyZZyyGidImvE9gfcyavoIYIvN2/n+KF0AISmJfz1fM4zvZBIRjUsGjL2lSCm+EOmA1bLhM3b+4qmKwBB6xhhwvt5Bujk6YrWGZlMReU6vbTOrWW31HuIWT2aLLVftg+9BtD3GwvN2OL6/GXV/Zcrj0jxF7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orCruk43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orCruk43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D785D1F00893;
	Fri,  2 Oct 2026 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947771;
	bh=TDy/ylaNKkcPbDh0SidKsuPyPtCK4ApApGvEb4sbVSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=orCruk43+nSFFiP6bOAx0zCF4GQDD0e6+mS4DzJNvojJuXfRJ5aZLkTE+ycffQgvE
	 57P/BrTw9swkFlqjlqSZUJTDJizUBj2l2a1dIWyxdZebhvP9wp4iIvhLwOKy4k+DxP
	 lehxpSmYnrrSt0FER4vI9clI2paYmMfCSCYvfNhhM9qyRygV2djrhv4KBuwPaRJyjK
	 XYDxx2I9CnP1iMom+LlFIrP2xSwCiUllHUO3KHcPcfH9jKx3Sjoa3TE3AoQ3SNiyKk
	 2OLf9F7UW8KaCEf8cu9b3y0iiBQWVx2bsrpC2PLfCkCLTGmUPUoijT66lByFjHMQwk
	 lCKAtLnXv7big==
Date: Fri, 2 Oct 2026 14:29:26 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar-xtsSOqwWK9jWQ@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>

On Wed, Sep 30, 2026 at 01:12:12PM +0100, Fuad Tabba wrote:
> On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> which are RES0 there. The macro only checks that PMUVer is at least
> PMUv3p9, and 0b1111 passes.
> 
> Exclude 0b1111 before the compare, as __init_el2_debug does.
> 
> Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/el2_setup.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 87560d8b254e6..1da277baacf78 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -421,8 +421,9 @@
>  	mov	x2, xzr
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
> -	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> -	b.lt	.Lskip_pmuv3p9_\@
> +	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> +	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
> +	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF

Are you sure #8 is the correct immediate for the ccmp? My reading of the
pseudocode is that it should be #9, but this instruction has always confused
me and I hate the fact that it doesn't take another condition code mnemonic
instead of a raw immediate value.

Will
