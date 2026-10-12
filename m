Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054774D17B2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830311; cv=none; b=fnUXBw1SPDQJD5aSxJlqYKpL4MYZT/xyB4Og5kiEEdNzRUsBQw2EKhlBWOhwjUexq/YPUck00UYV3U2kwsRq4R74J2COFhLwv9kjTqE6pfvDobFTNzDCY1XXL/9vI/Gq1oHWWq9fCt1aUncHzQEAt+W8YKNz4zQ1qyNiX3XE3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830311; c=relaxed/simple;
	bh=74X2V7J9bgLh9Ne8Eo41wvRztHcgfPr0OwlUV/Bz7wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThUIR5Fku3rJfMMrh4GNoTs3tMNAKkpecZ3BwiUVX0c339ChXhoSGFF6SMkiS5NX9Hjg6wv0L0lviXtFs7BLb42U/RsS8qHjt2VgTXiqK7cIkN399bNx4z/cKR2NbMixYeOeM5I+JXlB7yKZ4o74g3rPVBi6Uq2iiuFsZaYGvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIy5Ut26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIy5Ut26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531051F008A1;
	Mon, 12 Oct 2026 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791830309;
	bh=n9mBE65GVjIOFbJ7hGQJWa9dJHLVxop6r7GrgLGk3Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aIy5Ut26xaWOdGg5T1QMiKhN5V5Ct4//dUTXsfdtk+CSwTWKRDFL4XbVRJ3y1nQCO
	 3iLeH0Ry8W3rXHeiNc5RWrV0T3pCeIF46FFJwJUpYwmqX0RwnLoeSXzw9Yu0pDwAHY
	 Ok28nYXuO05gyldhihMMndmdxjHOO3kMpyoZ1JMoil7jOsF2nP9cnrs8VHy/ckfKUb
	 mPcVG7cnMzof3I5e8RdTRlzBqueaK6epe22x5WrNvjE3MfkI20PeH8rQ0nE9uptpOe
	 jm/ltSHB2vRcMIssYLtJtHfS+AD9dolZvkRkfgzDd7EIpOr/k6GTQXMvHdvKpUFwJg
	 PWwOQv8a89W5g==
Message-ID: <04d806cb-24dc-4597-ae03-6dbef11d0a86@kernel.org>
Date: Mon, 12 Oct 2026 20:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/lib: prefetch ahead in __csum_partial()
To: Rosen Penev <rosenp@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261012180052.55578-1-rosenp@gmail.com>
 <a877ad04-c4ed-4e32-a1eb-da524146be14@kernel.org>
 <CAKxU2N-VQ9fWGvdNvyZ7te1gp08qMSvbSpgLrKRkqDO+Y+bYwg@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAKxU2N-VQ9fWGvdNvyZ7te1gp08qMSvbSpgLrKRkqDO+Y+bYwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/10/2026 à 20:28, Rosen Penev a écrit :
> On Mon, Oct 12, 2026 at 11:18 AM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
>>
>>
>>
>> Le 12/10/2026 à 20:00, Rosen Penev a écrit :
>>> __csum_partial() walks the buffer linearly and reads each cache line
>>> exactly once. On cores without a hardware prefetcher, such as the 464FP
>>> in the APM82181, every new line is therefore a demand miss that stalls
>>> the loop. Packets received by non-coherent DMA are never in the cache,
>>> so this is the common case for GRO checksum validation: when routing
>>> TCP with GRO enabled on a Meraki MX60, __csum_partial() takes about 30%
>>> of all cycles and is the top entry in the profile.
>>>
>>> Issue a dcbt four cache lines (128 bytes) ahead in the main loop.
>>> dcbt is only a hint and never faults, so prefetching past the end of
>>> the buffer is harmless. Lines that are already cached, for example when
>>> checksumming data the CPU just wrote, are left untouched.
>>>
>>> Measured on a Meraki MX60 (APM82181 at 800 MHz), single TCP stream
>>> routed through a qca8k DSA switch, iperf3 median of 5. Only the dcbt
>>> was toggled at runtime, in the same boot:
>>>
>>>                 LAN->WAN               WAN->LAN
>>>                 Mbit/s  csum cycles    Mbit/s  csum cycles
>>>     before      495     30.5%          439     27.2%
>>>     after       599     15.3%          520     13.7%
>>>
>>> That is 58% less time spent in __csum_partial() per byte.
>>>
>>> The prefetch distance was chosen with an earlier, slower driver
>>> configuration (median of 3, Mbit/s):
>>>
>>>     distance    LAN->WAN   WAN->LAN
>>>     none        370        341
>>>     64 bytes    430        381
>>>     96 bytes    438        397
>>>     128 bytes   438        385
>>>     160 bytes   434        386
>>>     256 bytes   423        383
>>>
>>> Prefetching the first lines before entering the loop made no
>>> measurable difference and is not done.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>
>> csum_partial_copy_generic() does the same, so your patch makes sense.
>>
>> Wondering if you should use MAX_COPY_PREFETCH instead of hardcoding value 4.
> li      r9,MAX_COPY_PREFETCH*L1_CACHE_BYTES /* prefetch distance */
> 
> LLM comment:
> 
> What changes per platform: MAX_COPY_PREFETCH is 4 on every 32-bit
> config except 8xx, where it is 1. So 44x, 47x and e500mc behave
> exactly as before; on the 44x (canyonlands) build the instruction is
> still li r9, 128. The one difference is 8xx, which now prefetches 16
> bytes ahead instead of 64. That fits how the copy routine already
> treats 8xx, but I didn't benchmark it.
> 
> My comment:
> I don't have an 8xx device so I don't know if this works properly there or not.

I have an 885 and might do the test one day, but I won't have time 
during the coming weeks. Nevertheless I have the feeling it makes sense 
to implement something based on MAX_COPY_PREFETCH to resemble 
csum_partial_copy_generic()

>>
>> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> I'll keep this in v3.
>>
>>> ---
>>>    v2: reword commit message and retest numbers.
>>>    arch/powerpc/lib/checksum_32.S | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
>>> index cd00b9bdd772..5a14d45c7b9d 100644
>>> --- a/arch/powerpc/lib/checksum_32.S
>>> +++ b/arch/powerpc/lib/checksum_32.S
>>> @@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
>>>        bdnz    2b
>>>    21: srwi.   r6,r4,4         /* # blocks of 4 words to do */
>>>        beq     3f
>>> +     li      r9,4*L1_CACHE_BYTES     /* prefetch distance */
>>>        lwz     r0,4(r3)
>>>        mtctr   r6
>>>        lwz     r6,8(r3)
>>> @@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
>>>        lwzu    r8,16(r3)
>>>        adde    r5,r5,r7
>>>        bdz     23f
>>> -22:  lwz     r0,4(r3)
>>> +22:  dcbt    r3,r9
>>> +     lwz     r0,4(r3)
>>>        adde    r5,r5,r8
>>>        lwz     r6,8(r3)
>>>        adde    r5,r5,r0
>>

