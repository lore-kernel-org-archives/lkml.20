Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301054;
	b=SqNdYNVrTkhuqriXzp5jkTcmPkApvPIfyrtkbvBZTehh+3xpyObJLXR0ZCthylM7EmMJ
	 MyeSeTtxQ8ePeytoI2tx0Rrh7GhLb3Tf9DwxWa5TaC+4XVXGjDMHJjKDOByaqOWmIlg1H
	 3uT0QWMOSU0C2dSeuOKAEFtxp85BMkeSRwOYNZticz1YFTHPRttfGpbDKrEpDL6OVlka/
	 QdQC8zU14nDavn3P/uXvoJjmKtHX/cCYQ6YlPyl9WV3+9LyNUDkDjtVm3iIcUJNwmsXmq
	 bb6XkfFfO0W6RV+KJ98p2aw/TSFgWcQfeFLOzJK1Kk8cj+L4UAgZnZbZYBGIUXJ1Glg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301054;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=N456NnosGaoI7MKxsp6e0Ms9ZTTTgDYa/PkwX0lrx9M=;
	b=ck7j/B06G3xBB2mO5lNWhxji9Q+OzbQg7uovE7HtKS3LtQMF2S9NrGBR1cfWPGK70tB/
	 tDsTwMS6ZCPPzVEt5wr+kHlSMMbQ1/BoHZDx6Dk2S1sMkU5+NoanyUBcgwnTEgGa76hC2
	 LB2SkuzVBFMdz9mUWagdYU9/ipXp1q+4tocjJojz9ELIgangKCmyKAMyCOX0KIH4vLKpg
	 talMLm3W2s/Ex1t9KN5kqNJQYpmeMB1k0ahB8YpzgJ0US6B3q/a/xY/Ko9qeeWyO5wBdg
	 YbiEhj7UmmgKGxfP5aGpv6+Acuh8Poc2Wa7BcyAtyi5MczktHSWNgFu5aAvPugpbcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+mQY1+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+mQY1+h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B2B1F0089F;
	Tue, 10 Nov 2026 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301054;
	bh=N456NnosGaoI7MKxsp6e0Ms9ZTTTgDYa/PkwX0lrx9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L+mQY1+h6ujuFTABer/civexikaWaPzRJgaRK3DJEY0/SDc7Gomhi8a30x8EK9z9R
	 zhiy9a4iyS4/Bihy3DftUvBhopjAk8TshBg1U+sU62E/izCMSSBuErYNJ2K0fWzxvV
	 jqlAVpIHb7YXYPv+kC2KtDgD+rhVY/+VUvnqlvqf3KQpzUKV6OBJy1VBylrQhBkqjU
	 VYCbFklVfkC0ntksPWfQsO6sLL4MMmoUOpNx48QH7Hp9StufHgicVxoD2ym+J+j6ZM
	 nCnrWYtPFylKVMGLD+ZNQcIPSAHa/vKSOp7CMaH+OC3Tu+xvn2JM4Fms4/8XMCudJx
	 dC5MMhHQaicKw==
Message-ID: <e89ab6eb-2fd3-4638-a3a9-fef406478435@kernel.org>
Date: Tue, 10 Nov 2026 09:57:28 +0100
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
Subject: Re: [PATCH] powerpc32/modules: Reserve a PLT entry for
 ftrace_regs_caller
To: Bradley Morgan <brads@mainlining.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20260923175631.235276-1-brads@mainlining.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260923175631.235276-1-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/09/2026 à 19:56, Bradley Morgan a écrit :
> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
> undercount the PLT entries the loader
> consumes: module_finalize_ftrace() now creates two trampolines
> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
> ftrace_regs_caller()), while count_relocs() reserves only one entry
> for ftrace.
> 
> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
> walk in do_plt_call() scans for a free slot with
> "while (entry->jump[0])" and has no bound check, so once the last
> reserved slot is used up, the walk steps past the end of the section
> and patch_instruction() writes the 4-instruction trampoline into
> whatever module memory follows the .plt.
> 
> Count the second entry, mirroring what module_64.c does for the same
> pair of stubs.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>

I would have had a preference for something similar to commit 
c12cfe9dee07 ("powerpc/module_64: Convert #ifdef to IS_ENABLED()")

Nevertheless,

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



> ---
>   arch/powerpc/kernel/module_32.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
> index f930e3395a7f..61152deffc55 100644
> --- a/arch/powerpc/kernel/module_32.c
> +++ b/arch/powerpc/kernel/module_32.c
> @@ -41,6 +41,9 @@ static unsigned int count_relocs(const Elf32_Rela *rela, unsigned int num)
>   
>   #ifdef CONFIG_DYNAMIC_FTRACE
>   	_count_relocs++;	/* add one for ftrace_caller */
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +	_count_relocs++;	/* add one for ftrace_regs_caller */
> +#endif
>   #endif
>   	return _count_relocs;
>   }

