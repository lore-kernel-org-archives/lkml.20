Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588094;
	b=0bc6aQSl5iJgxkzhDNaya+hkLSAUNXmLAV5id5yUN0KjMCs30rcnz8mLrNW7aXqRIsvM
	 xCr3lYQ78NuWpxn/6/j0fNwQJ83a1HcveZlUwcY2kDNzer/Krc9vOkNfbyWOq1sFjVoFy
	 B2WtTl+nf9rd/mJZ3jaCIznfPtxNJAvgz9zkPXPinuU8TwG9SyqHeYad7AJuJjdQ+mv8a
	 EnsBrGpDoRm7oVbklsNr2CY89Ri7vlwQmNtd3VEAc2NSUQoLs9uUUPhQUOZafDnx8yPcK
	 X03S3aoWHShQgzY3rCMwD5GQCpiO5f0cLY2t1URcOv92VJUgdxj/EAdlL1FJgYtfCnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588094;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P8qKb9rlg2aEEkV6QVCRnchaPwP15XP0q+kkFlBQhaA=;
	b=PNiaThI1d7iCf5kQ5PiZ+8jyQpIDp7YVVEyJB7GH7afDxokzAB7mx3CDtbquF+B2JqOx
	 BjnoeRrFQqV0lUrDlcJjQpzz2emLUNrAvGxEeOVYOGXjC6dutG3bEtH1qvPQizZxt3Emf
	 YFZdxYCPzZ1StFU6szs84YecBK9t6hZEvI808B1xLug8qUBA03scj/X6QU7pdQZlAaAR6
	 uG00BOkgI01bgiLiJq8MXgwEUeH4O6v6L3Vc9As4MU/L71ajEyqiREbaaZvlRmRJkmrhG
	 cY2OQ8VUZZGQ9FWTcmBrnjfdw0RCOju8+tLD4daMSNdytWYeaTvWQWG2GJ0wDZuNqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJiNj9Pa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A66606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJiNj9Pa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A797B1F000C5;
	Fri, 13 Nov 2026 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588093;
	bh=P8qKb9rlg2aEEkV6QVCRnchaPwP15XP0q+kkFlBQhaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TJiNj9PaJ/qxzwLbB05GnqsYEczTd+Yl61wPH3YPhqTn8BdVHQHXle7Mzm5+AQzOH
	 Tl4EfUMus6L5YSKlnAoZFwvbB9lFjUYJCVJGVOsUeNWmiU7F/DYBgv70gaTWUYaLUx
	 TLrqxAChPkOn3Q9NlNDmDPYzzmMM955V5JbZNeZug2MPXsH2Hs4Jsd2ndPeRzygBds
	 f45cCvv/EhYKYgqlBbS7DCWpc9n4c1lQYZzXfnAYYW5evLxouoAek6ry184IixfdTq
	 PV5ekTHu/jSLnufJDf4QQ6xzCPJtOFXcrN6Z5rmAQ29UsVTxzGuCEWDDocwiG+w0Vy
	 Gfsr/w1kTYAdw==
Date: Fri, 13 Nov 2026 16:41:23 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Eliav Farber <farbere@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	William Kucharski <william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, 
	Alex Williamson <alex@shazbot.org>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm/huge_memory: don't warn when a page table
 blocks a huge pfn insert
Message-ID: <avc9mjmGUcPd8fIs@gremlin>
References: <20261112051440.16140-1-farbere@amazon.com>
 <20261112051440.16140-4-farbere@amazon.com>
 <avcsfhWktvKxQlkW@gremlin>
 <9f98dc84-a11b-4885-b414-d751c0ed68cb@kernel.org>
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
In-Reply-To: <9f98dc84-a11b-4885-b414-d751c0ed68cb@kernel.org>

On Fri, Nov 13, 2026 at 05:26:16PM +0100, David Hildenbrand (Arm) wrote:
>
> > I also don't get why an existing unexpected entry is totally fine if !write
> > let's not check anything...
> >
> > It feels like the real fix is something more substantial.
> >
> > Maybe better for me to take this over...
>
> Please take over the entire series.

Ack, will do. It's clear there's no understanding of any of the code here.

--
Cheers, Lorenzo
