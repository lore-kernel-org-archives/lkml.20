Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743601;
	b=0sIrf3q7Fuf6oOYAXvQXQQ5bL8VuHIbOR/w/rgU5H++5egKa3pInkwxGys5JgJvQ7C+S
	 ZywPvdbW5pHiE/ixXoz7uuvhdInCEzXTcdgdGHf7TDToiXpr3JvawNQVtmKyycnq5BeU2
	 /HbRh3f73o2/HsQ1is52DtYXLuN5XjBhFMVDv0hzlUkHKgugvJ3X5RXOfzBmvt2uZD8xw
	 qDL5DZlB/HzXgbxchyM3I1lGDywS526I4ujIX4X0wGbkdwbxa3uSa9tHLV6ndbLofqJLR
	 evQ9gVcc0V2z6VxhocM04MPCyZB+K9o9EnbbWwvrpkMU/WVEZ1FX1jX4jXly0/i1kBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743601;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w+uZcRKsV5h7EXsxKjGUwOGNuNwl+VfHuYMNxjipb3o=;
	b=fk16iKPH/DeZCP4m77TpFsSEKexgEMWyKCemtcCUIDYCERwMckY0nj5o8Z2/JTehu1qg
	 T8VUderA5vyW5knJULcw/Js7faSDgdNdZiWMr3V1Y3vCPA7jKFTgEyai6xPJ6kizEo1iH
	 SWnQ4IudOTYPHBG+cT41I7QaUOFcc/AUL/o5JAW62vU1njqTCus4HsbLnivsUMolbAgzy
	 HNUZuQCrHsiv9kdGmsN6GX4Atxb4P+oe5iVfUwlOZoF6/cEBf8ZbY14plaVSiIgI3Tpyw
	 GK5mFLYLiLoCSr+NGhAf4r1UnzT9cyS+URJzMJi+bO2Mbjg+j02VLk4nqaiknEGOy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hC/L1MQ7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hC/L1MQ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739661F01825;
	Fri, 23 Oct 2026 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792743601;
	bh=w+uZcRKsV5h7EXsxKjGUwOGNuNwl+VfHuYMNxjipb3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hC/L1MQ7M1aO8VZ1NXHGDX9iszEeVlPNaBbhvunGdg6YNBPw8L9Mzspsy+ar1087V
	 HmI/6gwOaEEx2Kl+YPdzPJZt36tE6xVjAKtEEucZ7Tmsn7YBZNJaj04xcEv4cCsdqT
	 vU7oHMiREtChPgWu+glIZCkuwamoY67wWqaJ4q9USt5OWNPUp4zvOLwDRVfw9EwNbv
	 Yps23mfbB9M/jv+2MAx6cHKMEPuPmw0tRfdrDDKlr6q+B852EUofQvXDP6WhhStfy7
	 4OfSVa4tbqcjD2OakjYBIpsekvIf0gLa5MNL9qrnUPH3S5/pgVH3oTl4hj32sCWyr3
	 teIHgcWiNO/Lg==
Date: Fri, 23 Oct 2026 09:19:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Luiz Capitulino <luizcap@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
Message-ID: <atsYe34Qvw5oUDMZ@gremlin>
References: <20261023023106.515365-1-luizcap@redhat.com>
 <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>

On Fri, Oct 23, 2026 at 09:16:12AM +0200, Vlastimil Babka (SUSE) wrote:
> On 10/23/26 04:31, Luiz Capitulino wrote:

> > This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
> > after mremap resize"). This commit changed mremap() to use vma_merge() instead
> > of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
> > a VMA that has any of the VM_SPECIAL flags set.
>
> Hi,
>
> 6.1 was a rather long time ago. How was it discovered just now? I.e. what
> use case broke by the change and prompted creating the reproducer?
>
> Vlastimil
> Thanks,

Thanks, I have the same questions :)

Do always include that kind of information and whether it was an LLM-discovered
thing or whether you had an actual workload that was impacted, etc.

--
Cheers, Lorenzo
