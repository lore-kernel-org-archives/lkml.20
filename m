Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924519;
	b=tBDxtXBnURvImgTxsNj5ju5PBPcOYI1S0mr4zzcsSbXYkWLlAmAnRVTf9HZ/petIM36z
	 h11Vydy5gYWrU9LZNor1+g1eCUaB7VGmwDu6nZd+EnTxQTaZ7/EEOmbkcln7DmWd+dB0l
	 d1iu2ELPlk/MHytrfUWRlWlT7QC9nDp9DUvnSDvSiVr8xivuxldmXh/N57TvR+G0m6mea
	 ZZGZD2YuCPTa4OKLdE7OKYZyoEMDlZSFne0ORJDSZ1gyEXI/IfqmfnZQdFAoaeYvfluk7
	 pPfOOBgTv/i+Ywm3Df3OeE5wWR8vsiWOZCCvdN4Nqz2hqimVLmHCdcl+BMM8z4wbp1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924519;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=b0uTJrSDJvFzWRkmkFnAPcUtkJ4sMnKMKlQvmRcmj2o=;
	b=j7hb/oTq7lYnN15amP/06fz/93b0KwmIZS3eWNkJXC4dQOz0hpcFaqHhKCXeizWnFFui
	 9rIS6AWBLhvyz6f32rTS3wLm+22tLGTVYaSOedtoiWXX9Q45oz4hyz7Vidf3uuLn/ORGJ
	 b86K6ypkqs38EDH2/2QNHt2fYKM0Bn3GCxjAQOy7vKeI8clKFR7caH+VBezVSPg2I9thf
	 D7XgauBakDHvnjPtLGAmFH27hA+NAcDlSbHbmt+F3LTfXNxrlQ8PDBWsNW2ca3LXQ9SBP
	 AhqOlZBrE4mzpTvuyD/aDV93sluQ9il+74BzQ80Xo12NGnEzph7PZR+wE4DrXNB+hLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmYmlJHq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61464606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmYmlJHq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230181F000C4;
	Tue, 17 Nov 2026 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924519;
	bh=b0uTJrSDJvFzWRkmkFnAPcUtkJ4sMnKMKlQvmRcmj2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nmYmlJHqpu/iBOtxaStsTIhL3ukuqd0xBqF+HtYgBN0k6zJKcD9OcNge0AEhWsu5k
	 1/LjUrAM859b0GhNx1Vxb0Z2ZOWwbkIAEmjm9ahKNckIJS+i32gyLM+GBA21IYTN25
	 /gunzASGRUn7MRF+V9zMHC32ofH28zku/Fru0crC3ML/MWnoYIUN8cAnmWK6aLCfIC
	 /H0QtPTOwJVHl0lsUCDGgR/7ONyAa4uqukShA36kuhG/xEapCzkwB6sIROz8TGWZ7p
	 PokCm1OL7RXuttF6bxFi86sPM+mSDQHYfLb5h8nmvqeGGlI037FYo86oJOM+TKmzm5
	 XaMaJb+2DQUlg==
Message-ID: <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org>
Date: Tue, 17 Nov 2026 15:08:34 +0100
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
Subject: Re: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X
 when CONFIG_MODULES=n
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
 <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
> commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
> CHECK_WX default STRICT_KERNEL_RWX.
> 
> Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
> we can see the following warning splat at boot:
> 
>      powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
>      WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
>      NIP [c0000000000ac204] note_page+0x4dc/0x4fc
>      LR [c0000000000ac200] note_page+0x4d8/0x4fc
>      Call Trace:
>       note_page+0x4d8/0x4fc (unreliable)
>       ptdump_pte_entry+0x70/0x94
>       walk_pte_range_inner+0x15c/0x260
>       walk_pgd_range+0x6d8/0xd5c
>       walk_page_range_debug+0xa4/0xf0
>       ptdump_walk_pgd+0xec/0x304
>       ptdump_check_wx+0xd8/0x154
>       kernel_init+0x94/0x26c
>       ret_from_kernel_user_thread+0x14/0x1c
>      Checked W+X mappings: FAILED, 1 W+X pages found
> 
> This happens because CHECK_WX noted a writeable + executable mapping.
> 
> This happens because execmem_arch_setup(), checks for
> struct_modules_rwx_enabled(), while kprobes depenency on modules was
> earlier removed via commit:
>      7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
> Since the insn slots are only written with patch_instruction(), which
> does not need this mapping to be writable. This patch fixes it by
> checking for strict_kernel_rwx_enabled() instead.
> 
> Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/mem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index b617b69452cd..77b63b52d8f2 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }
>   
>   struct execmem_info __init *execmem_arch_setup(void)
>   {
> -	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;

Looking at this, I'd use PAGE_KERNEL_X instead of PAGE_KERNEL_EXEC.

Then we could get rid of PAGE_KERNEL_EXEC completely for powerpc.

>   	unsigned long fallback_start = 0, fallback_end = 0;
>   	unsigned long start, end;

