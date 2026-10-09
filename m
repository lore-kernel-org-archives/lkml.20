Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82B4086A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562999; cv=none; b=QI6Ic4W07kh6jXbLfZiYT3l1Wpq6ELdyjAGGeALyoLhFz7Fz3CmkNcrqf5wKI7hkpirEBKmfWh3otL3Vk/T9xOI+sYTq7m38kZfyL6X5nGE18oZWxa6uoqgnjO2o7khxgvCcffYwciqoTv9YHgcih0j93YQx033ag3KBqAef6ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562999; c=relaxed/simple;
	bh=dcB8GrS4FLQZnSz4OKPOGFWDPfA/+6E64vH9JKqoHOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjm2pWwtnsnWbWzt38K4r7tN6JjF+uGC1qG/PcunSszG/mY1sHFd6nXjdlvJE3wOBiu5jvi5K8C+2t30k5Lkgu6P3JBTO00HELjjM6Ho8f3t3eESpRGpG18aIhiHVrIXTH2CLmYfKYSgxgJ5JCObv+kerhgUk46Ex14t8/I5T0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdqZDfCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdqZDfCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EB31F000FF;
	Fri,  9 Oct 2026 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791562995;
	bh=YfWBggPRcNUfmpocAPmpGBAvAjUX6S4h9gFS+GGWMfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RdqZDfCXJ+/1LS6pv+4dduHj4eW1XE2E6t7zJZQqkM6PoeYMuDwIyy7x/aqqF2jAg
	 pZpyADJFfR2Y/zGJLxoFOJSm3GM7AzHemdtW82eB528KrITgGYfpjErBMhxTIaNIRb
	 AtWwrVo4zGslaRl0SIrwyVXobipGuAx6KV9EI5tcxnz1/yrUeehqYh3f4vaFLAPCWK
	 twXdwvStfePpiuAM7XseTqi/1j78HWMV2XVUFE7GYndwfWizbfN20Oq/6FPrFMfC+s
	 TErWb4h0o3EAKHtlZ0ATAshCB0RepoAFAgMTnqHOliUoblfTNLooqDmmt41tAf8nOd
	 p2HL7bTxee0bA==
Message-ID: <509cac24-1b3b-4b85-8ad2-ef90da521dd6@kernel.org>
Date: Fri, 9 Oct 2026 18:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/lib: prefetch ahead in __csum_partial()
To: Rosen Penev <rosenp@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261008034932.3180490-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261008034932.3180490-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rosen,

Le 08/10/2026 à 05:49, Rosen Penev a écrit :
> __csum_partial() reads every byte of the buffer once and never touches
> it again, so on cores without a hardware prefetcher every cache line is
> a demand miss. After a non-coherent DMA the received data is never in
> the cache, which makes the GRO checksum validation of forwarded TCP
> traffic the top entry in the profile on a 464FP (APM82181): 22% of all
> cycles were spent in __csum_partial() when routing with GRO enabled.

Very nice patch. What is the new % after the change ?

How do you test that ? I'd like to do some performance test on 8xx and 83xx.


When you say "never touches it again", do you mean the data is not used 
again after that ? In that case would it help to do a 'dcbi' after using 
the data in order to make the cache line available again and avoid 
possible writeback to free a new cache line ?

> 
> Issue a dcbt four cache lines ahead in the main loop. dcbt is a hint and
> never faults, so prefetching past the end of the buffer is harmless.
> 
> On a Meraki MX60 (APM82181 at 800 MHz, single TCP stream routed through
> a qca8k DSA switch, iperf3 median of 3, A/B in the same boot):
> 
>    prefetch distance   LAN->WAN   WAN->LAN  (Mbit/s)
>    none                370        341
>    64 bytes            430        381
>    96 bytes            438        397
>    128 bytes           438        385
>    160 bytes           434        386
>    256 bytes           423        383

3x CACHE_SIZE distance seems the most efficient, why did you choose to 
implement 4x CACHE_SIZE ?

> 
> Prefetching the first lines before the loop made no measurable
> difference and is not done.
> 
> Assisted-by: LLM

In what way did LLM help ?

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   arch/powerpc/lib/checksum_32.S | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
> index cd00b9bdd772..5a14d45c7b9d 100644
> --- a/arch/powerpc/lib/checksum_32.S
> +++ b/arch/powerpc/lib/checksum_32.S
> @@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
>   	bdnz	2b
>   21:	srwi.	r6,r4,4		/* # blocks of 4 words to do */
>   	beq	3f
> +	li	r9,4*L1_CACHE_BYTES	/* prefetch distance */
>   	lwz	r0,4(r3)
>   	mtctr	r6
>   	lwz	r6,8(r3)
> @@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
>   	lwzu	r8,16(r3)
>   	adde	r5,r5,r7
>   	bdz	23f
> -22:	lwz	r0,4(r3)
> +22:	dcbt	r3,r9
> +	lwz	r0,4(r3)
>   	adde	r5,r5,r8
>   	lwz	r6,8(r3)
>   	adde	r5,r5,r0

