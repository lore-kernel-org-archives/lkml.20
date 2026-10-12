Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8534CEE51
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829132; cv=none; b=mTxRDWqP3U1CnGJXbCwpqLpJ9DWgpxr+tWuagIr6siaNmrnjkPR7HowtIm9xi3xH0q1DajkNJ1+4mYbSsBpEEOBL6T4ScKifOuUH5IHMmorDWJkYJjjrcdsLxIlg8S1p/BsBbNLluaA/vgVO1V+avhlBY0BXciZaSKO3EHGwlqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829132; c=relaxed/simple;
	bh=/5HdJP8iSJ48fNPsFLAJRZRS0HJynD08Wpk1N2ucp5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMjUS6Y/uAM5U6hwJdE5qzhivDDs0oC92J6r7LWhroKo4XucCzfd25ebjfDqG9yPEa1nOH5RtF+3g4LPNe+6kGU6P28Ag9unyBcKuSwd832REbAaLhqsYNzJEphrMjQnV5l2AGceMWMH45AF+nteKb/Mey2MYjObc1GF8DGfHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyzSJLFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyzSJLFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBBD1F008A4;
	Mon, 12 Oct 2026 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791829131;
	bh=/d2FRlSLGGY8hw4wwZf+Q/0xEdR55VdWMYO+zuYbCyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hyzSJLFL8ujbkodI/hzNuU34xM7m1LJomhXXELLD+hdG26/Yh1Vtu6/4vqn2uGzh1
	 MfnoKs7j0sMmeI3ZC6reR0ovcpkkG04eqI7oRMQs17afaqgTUcJDlZ2n390A/WEh1o
	 lzQknNYgpmHCrf0PqHPLIcxCDCxm9odJTM4syQjxedDb7+DdWxbQH2coYFhklo7nMq
	 Ifl5Gk8SaoFViWmsZZKFAZCA1TWZgxpXKASpxG6BKvK0Qgc4Oa2zyAGoyzcEhluzct
	 EfvoC32duebL+MOi4MG6VRm32RrcUziwlm/kVTr13eG5gJESiUDE2vq3aCFAnvJ7t2
	 ZhGpSwc4K02nA==
Message-ID: <a877ad04-c4ed-4e32-a1eb-da524146be14@kernel.org>
Date: Mon, 12 Oct 2026 20:18:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/lib: prefetch ahead in __csum_partial()
To: Rosen Penev <rosenp@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261012180052.55578-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261012180052.55578-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/10/2026 à 20:00, Rosen Penev a écrit :
> __csum_partial() walks the buffer linearly and reads each cache line
> exactly once. On cores without a hardware prefetcher, such as the 464FP
> in the APM82181, every new line is therefore a demand miss that stalls
> the loop. Packets received by non-coherent DMA are never in the cache,
> so this is the common case for GRO checksum validation: when routing
> TCP with GRO enabled on a Meraki MX60, __csum_partial() takes about 30%
> of all cycles and is the top entry in the profile.
> 
> Issue a dcbt four cache lines (128 bytes) ahead in the main loop.
> dcbt is only a hint and never faults, so prefetching past the end of
> the buffer is harmless. Lines that are already cached, for example when
> checksumming data the CPU just wrote, are left untouched.
> 
> Measured on a Meraki MX60 (APM82181 at 800 MHz), single TCP stream
> routed through a qca8k DSA switch, iperf3 median of 5. Only the dcbt
> was toggled at runtime, in the same boot:
> 
>                LAN->WAN               WAN->LAN
>                Mbit/s  csum cycles    Mbit/s  csum cycles
>    before      495     30.5%          439     27.2%
>    after       599     15.3%          520     13.7%
> 
> That is 58% less time spent in __csum_partial() per byte.
> 
> The prefetch distance was chosen with an earlier, slower driver
> configuration (median of 3, Mbit/s):
> 
>    distance    LAN->WAN   WAN->LAN
>    none        370        341
>    64 bytes    430        381
>    96 bytes    438        397
>    128 bytes   438        385
>    160 bytes   434        386
>    256 bytes   423        383
> 
> Prefetching the first lines before entering the loop made no
> measurable difference and is not done.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

csum_partial_copy_generic() does the same, so your patch makes sense.

Wondering if you should use MAX_COPY_PREFETCH instead of hardcoding value 4.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   v2: reword commit message and retest numbers.
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

