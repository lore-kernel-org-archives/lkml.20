Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BF04E8DF2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412798; cv=none; b=NAPcXOuLwG9b3IpYh+1q2KZQ5Gi3rEpiaJI8bfho3O77u4PX2cNMHtUaZoFxDDE3YOAkLfimx/VO7Rajsfvj+U+a8pNfGLrXrv00u8nwAEuUGKLc6rQ6L/mc3LR49TW0ePogbsP9MuWPwDqKqIKkEXpt05K2c2V/NJuBaSORkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412798; c=relaxed/simple;
	bh=6lFoVYsRVfowxOX1Mjd3NgHg8S9YwW8FmcNL5+NML9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX5BRa4KohcCt5l6lGpJUVrF/bXbxSHPrAb4n/Su3gXdlAjeAvzjpyZAE04AnBSQGOpHUxqZ+jE6miH0wH6br3zBLSidp0c+Dul0TtsMuXXm4Omz494wq9lRete8hkuaKY5qYQNEQGy047QfL03xvm0xHtdN5Rkm5r1tRKkJFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvnqJTJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvnqJTJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527B31F000C4;
	Mon, 19 Oct 2026 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412793;
	bh=C/7+EnVMoMIVI4b0VgEnU66uR84qKC0H5b2MnCMSI6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hvnqJTJB79RHbvYOE0cp/r6HDMuJVdOI36LCOVp9LWG0oqwVsZkaXvtNY18DmaiIJ
	 fWM4jnzwOszqLWi86U8liOQflKX3rYyVnHQbaQIyhRHPpk3l3MGV/gHrZ+rGUEUzOW
	 avKNdqSHGW9nu15tDLC97uA2WCY09rge+7ueGRY9Ey/o9SiCniR3bC2Lc3riNpwXQW
	 lap6Avp1Zr0ziuuXUIBm9/nOVBh3wUghopIYcQyxo5illpFpMYVFbT+p4oPZuisisw
	 fTBRDNWXXYfaeW724i6owIPOVzQ5RY3mhOnPy1lX5v4pdJHq6XktH2Q41MD9AcjKG1
	 I+MZUmxK7AQ2A==
Date: Mon, 19 Oct 2026 13:26:31 +0100
From: Harry Yoo <harry@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add an entry for MEMORY MANAGEMENT - MEMORY
 MAP
Message-ID: <atYMWiyCWqTG3WEW@thinkstation>
References: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>

On Mon, Oct 19, 2026 at 02:34:26PM +0300, Mike Rapoport (Microsoft) wrote:
> Split out files related to SPARSE and SPARSE_VMEMMAP management from
> MEMORY MANAGEMENT - CORE into a dedicated entry.
> 
> Also include architecture specific sparsemem.h headers, pfn_to_page() and
> page_to_pfn() conversions and Documentation/mm/memory-model.rst.
> 
> Muchun, who did a lot of work cleaning up SPARSE_VMEMMAP and extending
> vmemmap optimization, volunteered to help with the maintenance.
> 
> David and I will continue to look after that part of the mm subsystem.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
