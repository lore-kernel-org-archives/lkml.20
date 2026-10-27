Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109870;
	b=UMCogZqLio7PBz74Ci/8WGqMOhnp9HKeGYoMmPx5r7MrWOvVME/mTXzwOrrFuLCVmZfk
	 uEFG7TFyuA9Cdx4LHeoLd8Sphb5gC/L8Mrk5SW0yI/41yx+ur+e11Znvef7AH8g/jM9y0
	 moPIGzHboY2akIFfdRmfszyFVBlZ9Pw7mBI4cbZfx/KjT98PtWMRAMzh3NyQ09kD0jWY8
	 65GVB17C8RKFmT3W1f2WOBsDuoZEeGTJ5zi78fuNPa/qQIJ7i7+PadxORKpOTX3y+2/oM
	 jKnVsqgGPKUCjzcJnwFEv9tFjvCJoxuF1VKZV+UXmVQfQHpDpa2qS7qyLsuWRHuqE8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109870;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=6EV0y0rZNOrxKdLbmUoelWmdjOtw2TON5MFmaUpTBGs=;
	b=agalJOjsw3apZEpziMwCQJibKVT5owAxpLLDiOIhfyNyxmLeFm/w/3oLYvjgu9pqMrxC
	 o8k2w90VD3LM0WcKy74R4zTD7JeqK/p7i9XyggLs3Mh/tL73JYG9moAZAkiBwfTI6CLaZ
	 gQpD/HAHOfPJbCCEELQxbajCYTWmDxFOXTHRSsg8ZdBzzaa4DW1gCxN2sQavWQ2r8EgEN
	 wQ4sKJ7LhwaURy6R8q5NuX+gqkoZxzch390dc6fw0WM34hYVgoWq+2LFnr9eRK/2igf5n
	 hPzcCKN3LvihIMqQP2+S1/eULI9cp64lqr/22DVMoJRIkTIqwJUtCkK2CJgvmB87M0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVpSAE7s;
	arc=none smtp.remote-ip=91.218.175.141
Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CDF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVpSAE7s
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6EV0y0rZNOrxKdLbmUoelWmdjOtw2TON5MFmaUpTBGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793109862; v=1; x=1793714662;
 b=JVpSAE7sa/CBBarlh3S+abLMqE64/O5GkAFR6jFVMMd1YPsboVvsspq0Iqqumk4aGOJjzy4D
 DUjBLrBmcg6VGTf9Tq2EpIcDEdEcR1JKYSpIBDwOiHlcDvyWfVdL9y1Gj58CxhQH7rdh2K7LNdk
 PYf9iCvGMGj2cOyqnqyV7n2E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 094579383d15bde2;
	Tue, 27 Oct 2026 14:04:21 +0000
X-Mizu-Trace-ID: 094579383d15bde2
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
Date: Tue, 27 Oct 2026 22:03:54 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 21:35, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/27/26 14:13, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>=20
>>> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) =
wrote:
>>>>=20
>>>> Right. Without HVO we would just corrupt pages in the single folio =
(which is
>>>> also not nice).
>>>>=20
>>>> I'm also questioning whether we need this RO protection all the =
time active.
>>>=20
>>> What do you have in mind? RO only under a debug option, or switching =
the
>>> tail page to RO some time after the remap?
>>=20
>> I don't think enabling RO only on debug kernels is a good choice.
>>=20
>> Within ByteDance, we once successfully caught memory failures using =
RO (because
>> we backported HVO, but some missing commits in memory failure caused =
write
>> operations on tail pages to persist). These operations triggered =
invalid writes
>> to shared tail pages.
>=20
> But would you have caught it with debug setting on in initial rollout =
/ experiments?

Possibly, but we indeed didn't catch it during the testing phase.

The likely reason is that we hadn't anticipated issues in a corner
case like a memory failure. Also, it's worth noting that during our
test and verification phases, actual memory failures simply didn't
occur.

>=20
>>=20
>> Under the old HVO schema, this invalid write only corrupted one =
folio, but under
>> the new schema, it corrupts all HVOed folios. Therefore, I personally =
believe
>> that for the new schema, the value of RO is even greater.
> But doesn't that mean that you would find serious bugs faster one way =
or the other?
>=20

Good question.

> Silent corruption of any folio state is not good.
>=20

Under the new schema, an invalid write causes massive corruption,
which would likely result in an immediate and noticeable failure
(like a crash or oops). =46rom a developer's perspective, this
definitely helps us "fail fast" and find the bug quickly.

So, let me think about what we actually lose without RO.

I believe the main difference is the debuggability of the crash context.
With RO, the hardware intercepts the write immediately and throws
a clear page fault with a call trace. Without RO, an invalid write
silently corrupts memory, and we might only find out later with no
clue where it happened.

Of course, losing this debuggability doesn't seem like a critical
issue after all. Thinking about it this way, restoring RW permissions
to fix this race condition seems like an acceptable trade-off.

Therefore, I am kind of leaning towards removing the RO protection
and restoring RW permissions to solve the race.

Thanks,
Muchun

> --=20
> Cheers,
>=20
> David

