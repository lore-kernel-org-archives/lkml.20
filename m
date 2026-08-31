Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9F3DE45B;
	Mon, 31 Aug 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168883; cv=none; b=BJGsfTAO+1v62elzxL3YvpUYt+VUicC9dZHq2QUQUlRbxeXO5jl6MbQ2TJieS7dM9xaKzIltfXfdzYghM9Rv8LAsITY+WpmQ9BjgQd+B1xD8cjfIgcekmkU0UQblrdFO9GRxH5jcV98sshx6y3DgwZ3ficRMXLxbUs3ZTH9oBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168883; c=relaxed/simple;
	bh=xfyqhJd72FudaTPH/NiRhsiPSWayQt9vd8otr22LDKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKopnLWnK2WfjMOjt+seMT23ldydYyxujzJlAxIXYiXFQHXSrLXDhdtrpN1Pnq9r14K/PyDacsP6gbJoNmcSb9Q33kWq5Kbe3OckXY25pcc6RUoHsNiRQmApFLLtl572fPAU723uUZPREg/K8T09TUAffIpiZurOiXeRDybMB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsxw37uq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsxw37uq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F112D1F000E9;
	Mon, 31 Aug 2026 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168881;
	bh=4aVpTeV09tl2ZIJXldYxie5+lftJRpDlFbGafsWVa/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsxw37uqF9+SavdgCPh+An6E7UFG+cjRuxWcGRktFZqKnC4w9ip1z+JAVeBVhkIdi
	 SIb9cJoFNYGqjO58A/yKEOqHis8UQz8bmCY2mMLESyyRz7yk+RrqdnDMhcf95sbet1
	 sZBl5bfeBGq1uGtDGh42TUu9GJ4cf0R+TTRqZrnk09SGAJpljX69S0ddWTs8yawEZA
	 kjXLUSVTzV69S9x6zYSvrMAqfXxQGev/jZpEzMmEh8cJ7fkX724Y8RSOEuYLpmPjt3
	 A5g95G7m9P9XDTm7ynujW3M0GPlBakvCDPMGSE3IOF6knLaBtlKEN/p/mucMMbo5VR
	 ZSN2+W1pb7ukA==
Date: Mon, 31 Aug 2026 10:34:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apVKf8FgTG-l2EU_@gremlin>
References: <20260831075635.2244437-1-noren@nvidia.com>
 <apVHXmSljK8HrIuA@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVHXmSljK8HrIuA@tiehlicka>

On Mon, Aug 31, 2026 at 11:20:30AM +0200, Michal Hocko wrote:
> On Mon 31-08-26 10:56:35, Nimrod Oren wrote:
> > When THP is enabled, set_recommended_min_free_kbytes() may raise
> > min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> > With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> > pageblocks for every eligible populated zone before capping the result
> > at 5% of low memory.
> >
> > This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> > configurations, but scales poorly with larger base page sizes. With
> > the default arm64 pageblock sizes, the contribution per eligible zone
> > before the 5% cap is:
> >
> >   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> >
> > Consequently, min_free_kbytes can reach excessive and unwanted levels.
> >
> > Add an absolute 1 GiB cap to the recommendation, in addition to the
> > existing percentage cap. This bounds the automatic recommendation to a
> > sane value on systems with large pageblocks while preserving existing
> > behavior for typical systems with 2 MiB pageblocks.
>
> I would argue that the whole model of increasing min_free_kbytes for THP
> is wrong. This will trigger memory reclaim sooner and make the THP
> availability more likely but this was at times where we didn't have
> pro-active compaction and many changes in the compaction. So is this
> actually needed in general resp. only large pageblocks systems?

Ohh even better :)

I did find it strange that we increased accordingly.

I'm more than happy to see this just die altogether if people agree that's
a sensible way forward...

>
> --
> Michal Hocko
> SUSE Labs

--
Cheers, Lorenzo
