Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576465;
	b=uc78jqy7wo6mGL01JKGzUfKVfVQS57rq3tvQNDNBtZOqbHR5j/BZ7GYB9Sd5DlTq3oaH
	 z96TU/6NwA/+7N7PvOLRY61Ssb2aTiv7oX45wmTKblA72bfAYdoCjs4Crm3OB5YZWFAZH
	 AMYFtxuqp8EEd62XrZWoYELUhVwYEfZbuzWbNUc9gwiT2feKjCKWeOxandpN9aUSpbayJ
	 vA+CNX6o31cUOjcqJhSDZix/9eRHdqnUvvD5kycKLRQvni7plmOxUqK7LNFzW+UGnGyqp
	 EeyTqnSILlE29zODA4/cx+es/udUniJq4IJC6oHu/SIbkV+X9vmXZ3dXpZRENFelhFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576465;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Ph5jOO1GJkWHfez0YQCFb1ckQjLY8JeVKtFL0PrDBnU=;
	b=gVQXXiKs+MAxZllK1LwnK6nM4lK9UCOuEETrFEsRiuFlACdPxRYdNQ3vyNCNBTwtF2+k
	 qGC7aZwYb0eIdKMt2S7tgrmezKj9ngfVAVMnnwa2DWS70F+HVBj0SZ++81hX8COiQYg1Z
	 Rauf4qowPQVU7vbUUfIsJlMl6ID0UBl4SzL39XfSzH5oadhXk4p2VqalMuK0+4g7hsyLL
	 QgxcKSjwcbwj+2wyHR6KDOrcNgwHhUgc+cEn/ddGgVPy0/0XV2CkB0sK9bTCFT45bt57o
	 5Z0bVd8vlXKp/UZ8waPbiYLXRckN1o9YYXZ59NBbLf+adPGGj7WplPHnjGlNh6NKcWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LAHQOhdr;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA837606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA837606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LAHQOhdr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mtNnOi1A0NVeWv71nH2FKskD2CAi32/TwrkTagWD074=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792576462; v=1; x=1793181262;
 b=LAHQOhdrACH2uKpTmTwpy2nnJvEuOsPIWIWFykGDycUbPghtcFhl1t35CijPXf67YUiojPN/
 VOQ9emlN5v9k6BxruqAvX8yUBYPZvPuCJ86irQQ2s5NY9LPw9Q8B1ZZUYBmynq48VmEWbhrRjzs
 n4CLIH99Tc41TwqOn9hEdQUc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f8890043187a53cd;
	Wed, 21 Oct 2026 09:54:21 +0000
X-Mizu-Trace-ID: f8890043187a53cd
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
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-4-jthoughton@google.com>
Date: Wed, 21 Oct 2026 17:54:06 +0800
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
Message-Id: <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

Hi James,

> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> vmemmap_remap_range() can potentially leave the vmemmap in a partially
> optimized state. In this case, a TLB flush should be done if the walk
> caller asked for it, even if the optimization was not fully applied.
>=20
> A follow-up patch will more completely deal with partially-optimized
> folios.

Why are we dealing with partial optimization cases right from
the start?

I know that in patch 12, you try cmpxchg 16 times, and if it
fails, it leads to the partial optimization state. What I want
to ask is, why do we limit the maximum number of attempts? Is
it because during testing you found that this kind of failure
is very common? If we did not limit the number of attempts,
was it because during testing you found that the scheduling
latency caused here is very large? Or is this just defensive
programming? In my view, scenarios with such intense
concurrent access to these struct page structures should be
very rare.

If your testing did not find any problems, my suggestion is
not to set an upper limit on the number of cmpxchg attempts.
This should be able to simplify the design of the initial
version of the code to a certain extent. If we want to
determine whether an upper limit should be added in the
future, I think we can add timing monitoring in the arm64
try_update_vmemmap_pte function and trigger a warning when
the measured time exceeds a certain threshold. If someone
reports this kind of warning to the community in the future,
then I think we can improve it at that time.

What do you think?

Thanks,
Muchun

>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb_vmemmap.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 0057fa2a16a8..1a2645c382ba 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long =
start, unsigned long end,
> 	ret =3D walk_kernel_page_table_range(start, end, =
&vmemmap_remap_ops,
>    					NULL, walk);
> 	mmap_read_unlock(&init_mm);
> - 	if (ret)
> - 		return ret;
>=20
> 	if (walk->remap_pte && !(walk->flags & =
VMEMMAP_REMAP_NO_TLB_FLUSH))
> 		flush_tlb_kernel_range(start, end);
>=20
> - 	return 0;
> + 	return ret;
> }
>=20
> /*
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

