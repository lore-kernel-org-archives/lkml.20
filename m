Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752A3ED13F;
	Sat, 10 Oct 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628002; cv=none; b=bN9N+qXY5WRppnc1Ab7QYHqqLUV+3lhpjjZNqO/IwuagZv4spPoHdBwyJO1oqWW9Z7g6geC7QNG2xvEkSCnbaAXVz6YZRmALIdbICfAZANDzP2VUzpxh/oOs2CE3t9FWUUKVPMLupXkzhaO+dFmni0/8BZGfY5C9wLe7Kncegtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628002; c=relaxed/simple;
	bh=lKTCxYkXgNBbopueZfjb34ZteSP1u3taHN+Y+5gmK/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlSXO9uiPqFPmj3U0OnbPdMvbN4dZ9l49ZIUHAZDe8il2MpAhJJFBeQTOgNtLEhryWbQiHjLBZCww+KBvVT33XpOwDMsC+YDUqJUSkIf4N+9s3O08joCXl8b8jK4qcc3bWWO9UtCJtgsJfkOvAHfRu9M1YVFgWnuEtDHk5wngis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBU+IzPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBU+IzPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BDB1F000FF;
	Sat, 10 Oct 2026 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791628001;
	bh=mMea6TjD+pWzK5X7wJzS1+Pbrk9Fwh5lT5fibQqVIRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HBU+IzPmN0MilGNtztAl2ljb1buIaG85Fy0aoBK/wt3j7+MmDqooAO/vvdBM475Zk
	 JH84DC/Wj0KrHuM8FLN4okylYWFH19MGSEVbdOZr+Zi1FOYBStqx5fX50xXWXe/kbK
	 hum7qCipLor6+i1S1/JcRnO/m2oQ5ajj53lw+8qT8seaFslQfk/2vSqvmvtT6yUkJD
	 BpZEl87oPLbAIm7Fzzrrvlz6HAuM+tHcXlrXPtHU02jMVSt6lVmUdOH/n8uN5mROXg
	 xMon4Xge0AJVLTtYsHgVBXGZCQ3xm8JK/MEXzfGFb48P8NcaV1jJ1malZdzfc2VnxH
	 v6txPSX/weh3A==
Message-ID: <620331f5-c576-4895-b4a8-7bd0baddbde8@kernel.org>
Date: Sat, 10 Oct 2026 12:26:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Ian Rogers <irogers@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Stefan Kerkmann <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/10/2026 à 23:28, Ian Rogers a écrit :
> On Wed, Oct 7, 2026 at 4:00 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
>>> Cc+ Arnd
>>
>> Thanks for the Cc!
>>
>>> On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
>>>> Hi Ian,
>>>>
>>>> On 10/16/25 22:51, Ian Rogers wrote:
>>>>> Type punning is necessary for get/put unaligned but the use of a
>>>>> packed struct violates strict aliasing rules, requiring
>>>>> -fno-strict-aliasing to be passed to the C compiler. Switch to using
>>>>> memcpy so that -fno-strict-aliasing isn't necessary.
>>>>>
>>>>> Signed-off-by: Ian Rogers <irogers@google.com>
>>>>> ---
>>>
>>>> Is this an accepted trade-off? My understanding is that the kernel is always
>>>> built with -fno-strict-aliasing, so the packed-struct type punning was well
>>>> defined there, and the __packed annotation is what lets GCC generate valid
>>>> code for the unaligned access.
>>
>> The previous upstream version was the result of endless discussions, and it
>> looks like changing it to the memcpy version was premature. At the time we
>> unified all architectures to use a common implentation, this was the only one
>> that resulted in correct and fast code on all architectures, so I don't
>> understand why this was just applied without including everyone who was
>> involved in coming up with the version that was replaced.
>>
>> My feeling is that we should just revert this. I'm not sure about the
>> motivation for the change. It sounds like this was meant to be
>> used in userland code, and that clashed with assumptions we make
>> in the kernel, but I don't think that is sufficient reason for
>> regressing kernel code.
> 
> So the original motivation for the change was that the perf tool had
> an OpenSSL dependency for the sake of doing a hash when copying jitted
> code into a fake ELF file for the purpose of disassembly and
> symbolization. The kernel contained the same hash function, and using
> the kernel function allowed the perf tool to avoid an OpenSSL
> dependency. Linus asked the perf tool to minimize its dependencies, so
> we pursued this change. The kernel hash function used the
> get_unaligned code for unaligned memory accesses, meaning the change
> required the perf tool to add -fno-strict-aliasing to its build flags
> until we could have a strict aliasing safe get_unaligned. The strict
> aliasing safe code is what we're discussing here and when originally
> written it sat on the mailing list not really doing anything. To my
> surprise Thomas Gleixner picked it up 6 months later, and I believe
> something other than the perf tool motivated this.
> 
> There was an issue with the original series on Power IIRC, they had a
> char global variable that they knew was an int through linker tricks.
> The change caused a correct compiler error of a 4 byte copy to a byte
> sized address, and I forget if we used pragmas or a local packed
> struct get_unaligned implementation to work around this. I didn't have
> a way to replicate the problem locally, I was glad others were helping
> with the series!
> 

I can't remember any special issue with powerpc, I've looked into the 
history and couldn't find anything either.

As far as I can see the only problem we had was with your version v1 
where you were using memcpy() instead of builtin_memcpy(), leading to a 
VDSO link failure due to missing memcpy() function.

But if you think about other problems with powerpc let me know and I'll 
look at it.

 > VDSO build fails with this patch:
 >
 >    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
 > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
 > supported
 > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/
 > vdso/vdso32.so.dbg] Error 1
 >
 > Behind the relocation issue, calling memcpy() for a single 4-bytes word
 > kills performance.
 >
 >   170:   7f e4 fb 78     mr      r4,r31
 >   174:   38 a0 00 04     li      r5,4
 >   178:   38 61 00 10     addi    r3,r1,16
 >   17c:   93 81 00 10     stw     r28,16(r1)
 >   180:   48 00 00 01     bl      180 <__c_kernel_getrandom+0x180>
 >                          180: R_PPC_REL24        memcpy
 >   184:   38 81 00 10     addi    r4,r1,16

Christophe
