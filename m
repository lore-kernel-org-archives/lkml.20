Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050492;
	b=Gw6wMaTIbB1sZvgDcFMJEK15WkFBg1WnlMIhYna8s2aAC29YChoxtdu4oMjnLoWcTSEy
	 ZNbquVR9gSHPrYCKhgoCRP3h6MjPcU/pDIvc51j6DTVf/fWwsom1Mt7zepMOde60d3S68
	 eWHHv/Y/OH62DyvuIGaROm6W1WZerdFlSM+1QaKfPAB0MAMTEl9ry4QA7vdro2oyUd/fj
	 hoTLnS/ID/KqwKXjQJB4O/UAddMMlLMEWVJyT8A/LID/6LPDznD8UwriZMfp0zH8GS3bW
	 a0PE1dU5SgB0/55GK/V+pMjUuCXABJcn4l8Bb2FzQpr1JuD++QKVQe9PlHXLEkaYK8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050492;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=V3pB3AGO9dEv86sJAhd4wOp/MO0lhLnyuc09qYLY7Pk=;
	b=wx/KVQHEtf6yrxKDG81N/kEbQZhvdHpxuNFfvPD1i9Rwu/rk1xG/Ukq5TJNH5AeslYFc
	 T2LCqWyFre3lvP42N9v9aZMdsj5qYPePXVBeXy6xz80nraEzGmatEloBPlV77tjMLCrrL
	 SG5WKhcOaQjyfADrf2c1L0xKjyOCDV4LazSRFyXhNE8Q+lNVGJSyGaWirAHMWhzFmL8+1
	 OsOv/xtPM08Dk0bXiFrk+Z+vyT6OeYYgkQDqvDHAcvb0OgW8NwrRSVgX59jy7dViqIf4y
	 29VccPDLE5kgqOSE6gU1SttQ+TmFOpvHSGZxIkRDHbwV9t/chbS7ULJjW4tigN103/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlYJTTM6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED90606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlYJTTM6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEA91F0089F;
	Sat,  7 Nov 2026 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050491;
	bh=V3pB3AGO9dEv86sJAhd4wOp/MO0lhLnyuc09qYLY7Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mlYJTTM6Xw2nBKlP+gXO2Hp2D+XyOgUpRQ6JiRXPPT+RbcytXScqI26d8Bzek+5A8
	 bw5nI3gO2ndoS2lvagBOTCcgj5W27ibYNIZYaWV4GSeX9jPuodmnxXeKmJjCaKJwqb
	 RWHmzDoyxFvi5REzuO9oQ6peV+04CAWtfs9B2nCFMyY6s1zctV7eVZRDsUllC8tBx/
	 eJ7JiZ/V7Ezbm9bCaFQyYE08y7q9S0iGDqxI9MAF3T2JtutWBKTr+FkZ3wtB9Rfzq2
	 BxWFRYFFGBD7rNpuSk9AJVgCIqRjx656y0FTSfzQgit3WFZbxWTPERrsNvDMsRHVqC
	 Pg7wKFuoecNEg==
Date: Sat, 7 Nov 2026 13:21:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Frank van der Linden <fvdl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/cma: simplify cma_declare_contiguous_multi()
Message-ID: <au8JtLx7T0r9ihPP@kernel.org>
References: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
 <CAPTztWYzN1mkADOAJ3bskqpsv9c7qXNSMUdj_Ovg-aDQJDDmow@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTztWYzN1mkADOAJ3bskqpsv9c7qXNSMUdj_Ovg-aDQJDDmow@mail.gmail.com>

On Fri, Nov 06, 2026 at 02:30:38PM -0800, Frank van der Linden wrote:
> On Fri, Nov 6, 2026 at 4:56 AM Mike Rapoport (Microsoft)
> <rppt@kernel.org> wrote:
> >
> > When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> > single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> > largest free ranges above 4G, reserves them in memblock and adds them to
> > cma->ranges.
> >
> > Replace the current code with a loop that finds the largest free range
> > above 4G, reserves as much of it as needed and repeats until the entire
> > area is reserved or CMA_MAX_RANGES ranges are used.
> >
> > After successful alocation sort the cma->ranges by their base address.
> >
> > The new code scans free memory once for every range rather than once
> > for all ranges, so it is slightly slower, but it is way simpler and more
> > robust.
> 
> Thanks for cleaning this up. You're right, what I did with the list
> sorting was too much, and it contained some bugs too.
> 
> Just one remark here: I don't think you need to sort the ranges by
> base address at the end, I am not aware of anything relying on the CMA
> ranges being sorted. The sorting was just there to mimic bottom-up
> memblock allocations while acquiring the ranges, but the eventual
> result doesn't need to be sorted. I'm not aware of any CMA code that
> relies on this.

The bottom-up was added by the commit df2ff39e78da7 ("mm: cma: allocate cma
areas bottom-up")

	"... to guarantee that the compaction is moving pages out of the
	cma area and not into it".

I think sorting an array of up to 8 entries is not too costly to keep it
that way.
 
> - Frank
> 

-- 
Sincerely yours,
Mike.
