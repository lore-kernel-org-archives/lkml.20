Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593452;
	b=AXodLfFcDYUjYtoAHGQEAd9YwyOkZ+HU/KKpgJSZtFQmoA8+3ps8m8llfBAYDd96x9lq
	 BrVreCsLZFLTgNxPWU469DUIXFjNnGXdu6gSRrK2qPKXtSTtIgGwIvZtJcuY+DOS7tnVL
	 75YQCbNlD5g2jNbNWAeV5kSNsin77z3g7bV/8UTO15xhEkG4RKvvw7U2JopwMVRjf76n0
	 mGE+skoaUOFBxqiKeCzWxTpfUXMKiZg72a3HvZiNBpEJWlvtmVvDfrPjoeFNw3cA4BS0o
	 80bGRUSDR6Xk4zpbZdiMAUigHE6gf3b0PNARWBmcdDvoUi9JAdZZvq07jEEVKa8GExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593452;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LNqUh1ctm4UHtwJf1BYt5KCSbLCVqB9wnPT3dznMsCY=;
	b=lNAge6uWpRu9wesD+NWzkX4MM1KczvJwpWMJiQ0CnPkr1Iw3838ActtP05CRlBlA8Cdo
	 H66YEoGsc7Vz6d1QmlJuekvA0/APgehgKdPSmn3A8sq/Rqzf6WQiq1LY7MXMNe/Y237rR
	 eMlsJY4rWZdjOnnkTEighqGlHQnczVNjkHKK5l7dQyg8QXgBGOLdK+RDRKwCI4XcFdX07
	 riaABqMKYuKcwT1m/yYebtDLFRoDK/fUrM7bq7RHCojOfP6KiGYpcgqQGqx9HxZYYWLaE
	 UkLNdXGzZ5/y8J5X8Ved0joJGNYLLbqXzHol6RNIkHP7njkMX7C1MfaQHo/r0W0GB/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F08YV3Vc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD81606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F08YV3Vc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED61F000C1;
	Wed, 21 Oct 2026 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593451;
	bh=LNqUh1ctm4UHtwJf1BYt5KCSbLCVqB9wnPT3dznMsCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=F08YV3VcVZcG1A937aiiuDbtWGBbtf1gdDJzjrWCoFJmAYy6miP4DAvelUBbaIlOe
	 4bXSMFjLEECp4d3z7J8eM9Vhf7+ftCE0SniWXthZDaer7ipB9DQ1+kz/GxsMY//q5e
	 8Jtd5z1sr9R9x5IamdwCnNXs91poBcPdvRtGWFaGyT8GMoi0HjYZUnlHs1RqvRB+oX
	 hFpL9VJbihZnVp5GYWXiOP0/NESkbebp/1fejrPh+66HM78oXbbMAA4E5gR2aDlMPF
	 zMNhW+G1uZjEkl6JlL8eajTMSfpxCSqtv4/FwWFhL9qSgrGHRqwOq25dTnG89P8tXW
	 NP8n9R82cv52A==
Date: Wed, 21 Oct 2026 15:37:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/39] mm/vma: fix mmap_prepare file handling, remove
 file_doesnt_need_get
Message-ID: <atjAgZCWdYN77C4n@gremlin>
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
In-Reply-To: <179253282492.1207257.6426479952081115792.b4-reply@b4>

[ cut cc list for sanity ]

On Tue, Oct 20, 2026 at 05:47:04PM -0400, Gregory Price (Meta) wrote:
> On 2026-10-13 16:04 +0100, Lorenzo Stoakes (ARM) wrote:
> > The map->file_doesnt_need_get flag is confusing and the existing
> > implementation has holes.
> >
> > Drivers are permitted to change the owning file of a mapping. If they do
> > so, they are required to take a reference on that file.
> >
> > The mmap() operation which ultimately invokes __mmap_region() is guaranteed
> > to drop the refcount for the original file the mapping was made under, but
> > this is not true for the replaced file.
> >
> ...
> >
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Have a nit below, but otherwise
>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

Thanks! :)

>
> > +static bool map_same_file(struct mmap_state *map)
> > +{
> > +	return map->vm_file == map->file;
> > +}
> >
>
> Terrible function name :]

I think let's leave things as-is and maybe chase this separately as a
follow-up ;)

--
Cheers, Lorenzo
