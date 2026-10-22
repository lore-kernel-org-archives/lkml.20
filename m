Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660721;
	b=dLABioKd4cgJp03pUBUvatlqDJd0lgVHX0ATpw5i4IqMf4rXlIS2LobMvWfuKaMDPDXL
	 4m8pn6n4BPP5M5mkb3msDz1uCuveJmQCXUN3vSVDO4B2jpsa1q2hkqhlWRz5jEHBFVKSK
	 oNchWbE8mp9b9iGWP4YcOjlOmZZQhSWvWqVDYVbKmDaDQm3fLyo3fJuAx2uvb5tLJyMuN
	 2Nl4Ha01LrQghhQAkURZ1qwnCKoAd7UtxjQ/a+RaIFWVqt1Iy+yH0fDZXyF6xipBoH3GK
	 twwyJ8iDVsLPspTdPpFZO4kToHT9FrCDOkQvJvsBK2M4/IqsF0qK90DYPMsQ87ZGs/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660721;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=PIP2wew2boNsbO2jCY9QS6pi4IH2031MB32CXAZbJYY=;
	b=dKk4w+gaTc80xjfQFnK5RiK5d9iuzDi/a/Pr0ji18FpGH+HZF/Pb3y1llEB7SFrcjZOP
	 YHTRJEtsbNrAi+H2P1vY1mHCh1KMquNCyxJvKpgj6bbuDV+wR/0WfD3wdikYM+532bozK
	 ajmpxAgHZuogQyiRtwgYKQiy4NuRapTYSO29VIt+jNhExWogpMUZEBXkBq/vuiAgsyZrz
	 H7GxvgCucYiQN9fQ/o5wow2uCnczo63KtJq5S3knyhhlHDBLzS6fu8gzKMrCnzFcCKSwf
	 zcLjZ3DCu6hm67IIwzkIyepfFFnSQJhcQWcS7rwBbiEq1+pvqCOX1rNASOe87aaVdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwIAuW2x;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BA606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6BA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwIAuW2x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PIP2wew2boNsbO2jCY9QS6pi4IH2031MB32CXAZbJYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792660717; v=1; x=1793265517;
 b=PwIAuW2xhT18typ6yIM2xFYWQglrpK0p4byP0s6wMqy348GHuH0JbMddiYT7vUFqlBO8fl0/
 Tu61RLV0d9rSQf3MBJT6j+9trRlxHdpa+gnL6+mhkWJHqMUaJNZU9xOOm+MXDSVp7T0bMSot3k7
 xLd9Ty8MtW1EEAoJI7nIT0H0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 59d4a31ee7773685;
	Thu, 22 Oct 2026 09:18:37 +0000
X-Mizu-Trace-ID: 59d4a31ee7773685
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
Date: Thu, 22 Oct 2026 17:18:15 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com>
 <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
 <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 05:59, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>> Hi James,
>>=20
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> vmemmap_remap_range() can potentially leave the vmemmap in a =
partially
>>> optimized state. In this case, a TLB flush should be done if the =
walk
>>> caller asked for it, even if the optimization was not fully applied.
>>>=20
>>> A follow-up patch will more completely deal with partially-optimized
>>> folios.
>>=20
>> Why are we dealing with partial optimization cases right from
>> the start?
>>=20
>> I know that in patch 12, you try cmpxchg 16 times, and if it
>> fails, it leads to the partial optimization state. What I want
>> to ask is, why do we limit the maximum number of attempts? Is
>> it because during testing you found that this kind of failure
>> is very common? If we did not limit the number of attempts,
>> was it because during testing you found that the scheduling
>> latency caused here is very large? Or is this just defensive
>> programming? In my view, scenarios with such intense
>> concurrent access to these struct page structures should be
>> very rare.
>=20
> This was done defensively, yes. With 16 retries, I never hit this
> without fault injection. (Perhaps I should try with no retries...)
>=20
>> If your testing did not find any problems, my suggestion is
>> not to set an upper limit on the number of cmpxchg attempts.
>> This should be able to simplify the design of the initial
>> version of the code to a certain extent. If we want to
>> determine whether an upper limit should be added in the
>> future, I think we can add timing monitoring in the arm64
>> try_update_vmemmap_pte function and trigger a warning when
>> the measured time exceeds a certain threshold. If someone
>> reports this kind of warning to the community in the future,
>> then I think we can improve it at that time.
>>=20
>> What do you think?
>=20
> =46rom userspace, you could use kpageflags or page_idle to =
continuously
> access a single struct page over and over again. I think that's a

page_idle does not support HugeTLB pages, right? We should only consider
/proc/kpageflags; reading this file requires privilege =E2=80=94 unless =
a privileged
user intentionally creates malicious software.

> pretty good reason to have a bound. Also, the AF can be set even
> without an architectural memory access (so a mispredicted branch can
> still set AF, for example); that also makes me want to have a bound.

However, I don't think this scenario would cause a significant amount of
concurrent reads.

>=20
> Catalin also said wanted a bound here. See the bottom of this reply at =
[1].

I see, but I'd still like to explain my reasoning and see what everyone
thinks.

>=20
> So I think we should leave it in. The extra complexity is pretty much
> entirely in patch #4[2], and I don't think it's too large of a change.
> I hope you agree. :)

Because I personally feel that having only part of the vmemmap optimized
is a somewhat awkward intermediate state =E2=80=94 the all-or-nothing =
semantics
seems more natural to me. At least until a clear problem actually =
arises,
I'd prefer not to consider it. At the same time, we can also keep the =
design
simple.

Thanks,
Muchun

>=20
> [1] https://lore.kernel.org/linux-mm/aoRn3Fn1dhTdsk6d@arm.com/
> [2] =
https://lore.kernel.org/linux-mm/20261003002123.505555-5-jthoughton@google=
.com/


