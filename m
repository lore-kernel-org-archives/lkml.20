Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379541;
	b=xifMRVHiBQtvf+ZuKiHF7NtYuNoq2LNjeITAyJ8QvC9uHFiImWLZcr/1akwFCgkTKrQw
	 8S6EWF5M+IB197SPZFzLvWWLgBNYK5WMzr46PML3WpT4T+5nbrADFkvCC+qQcobb2WUzC
	 JQGAWY1KF9vzK8bZcuh50HcOObfTpcOi3I3QhrHY8FmAuu/KTvTXx5etT8AzApP/S1rSV
	 i8cmvAQAYpZysuYF/gOtcuO8aN3Upyb1ofpFJoaQl2DeznS8TSm3gH83T5RPeMEUh7PIg
	 ZWo3b8/PUhubd4xSQiyWjLCbbQHjER3vEPrDTzdS1wXBSdo59ijGD+41hUraaa/knbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379541;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=tXT3VLYjtA8pogy2vMiWc4L4U/Pmo90wtlWq1YzWIIM=;
	b=IyNH2P6klPQie7l2fI0wTWHAY2/rwzylRrx0AbMXntiPTLh6zAJU6epSrBGERjDtK/R7
	 JpHm/S5NZhgh4N2VNiLPj4pZ2pJzhXmrP0ZSYo9rhvxit/XyHew9z0n3rfagFwFBJn8KQ
	 jCiz3/giWBcTl7jujqRgtaf3cZuCytD2D3Ba/ZTSh0TKn7DRewYTAd+zvVzmECkrJbrBn
	 1HDEVGNESDKFykZ+lX9JoTTQa+uluqoFLEd+wKMPg6hGsKq2/EYfwtpfmkVjEJmM1q7dG
	 YSXEcV/v51IGQxz5QeICFjtyE8i0E5qU25iGNnkdZ3ql5iD7dufNSPWJmdbgKkpgHmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QxP9Jn87;
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QxP9Jn87
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uQt+gZcqLg5yhdeDpbR8lZj610GLoqQ3N3quenEOm/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794379538; v=1; x=1794984338;
 b=QxP9Jn87cBQ5/a8iBRYv8HkYqmeMGqesF5eAT6wU0BWxXurqpZr9MgdXUrTFb1h6OeMCSwrE
 6WmarFkng+2Wp6uO8khuAxhxnJhsGDawp2muA6hiqHx3UYltWd0Y6Xeyd+cFlQll/9kpgqOEayi
 Zv/zN0G6ZQhBr1eyId36BH2s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 83ebb53e35329805;
	Wed, 11 Nov 2026 06:45:30 +0000
X-Mizu-Trace-ID: 83ebb53e35329805
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
Date: Wed, 11 Nov 2026 14:45:12 +0800
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
Message-Id: <08C72590-E44F-4DF3-B1DE-E7CAC0A43CAD@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com>
 <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
 <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 11, 2026, at 05:50, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Fri, Nov 6, 2026 at 11:02=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
>>> architecture lacks support. This serves only to avoid confusion for
>>> users.
>>>=20
>>> arm64 support for HVO is conditional on certain hardware features =
being
>>> enabled for all online CPUs. By the time hugetlb_vmemmap_init() =
runs,
>>> all secondary CPUs will have started, and the system feature set =
will
>>> have stabilized, including HVO-through-BBM, which
>>> arch_hugetlb_vmemmap_optimization_supported() checks for.
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> mm/hugetlb_vmemmap.c | 15 +++++++++++++++
>>> 1 file changed, 15 insertions(+)
>>>=20
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 8596a462fee6..817ce39d4cf3 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
>>>      /* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct =
pages */
>>>      BUILD_BUG_ON(__NR_USED_SUBPAGE > =
HUGETLB_VMEMMAP_RESERVE_PAGES);
>>>=20
>>> +     /*
>>> +      * Architectures that need to probe CPU support for HVO have =
done
>>> +      * such probing now. =
arch_hugetlb_vmemmap_optimization_supported()
>>> +      * will return the correct value.
>>> +      */
>>> +     if (!arch_hugetlb_vmemmap_optimization_supported()) {
>>=20
>> I'm wondering if we could put this architectural check into =
hugetlb_vmemmap_optimizable(),
>>=20
>>=20
>>> +             if (vmemmap_optimize_enabled)
>>> +                     pr_info("vmemmap optimization not supported by =
hardware\n");
>>=20
>> then, we do not need those code. If the current kernel does not =
support HVO,
>> then the sysctl does not exist. It's already a common case when the =
size of
>> struct page is not power of two. If users really want to know whether =
HVO
>> is enabled, they can check via this sysctl file. Therefore, we don't =
need to
>> print a log line.
>=20
> Yeah, I can put arch_hugetlb_vmemmap_optimization_supported() into
> hugetlb_vmemmap_optimizable(), that will make the diffs slightly
> smaller. And yeah I can remove the print. I put it there mostly
> because it can be confusing. A command line that gets you HVO on one
> arm64 host might not give you HVO on another arm64 host, and the print
> would give a user a clue as to why.

We already have the log to indicate that, like:

	pr_info("%d KiB vmemmap can be freed for a %s page\n",
		hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);

We will see **0 KiB** can be freed when hardware does not support HVO.

Thanks.


