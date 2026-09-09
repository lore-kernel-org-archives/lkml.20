Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EF470451
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942740; cv=none; b=RQnSL/eMJJYnQU+gmFoBxNYBJwMvLQBQ3hWja0z9Qsrllf63LIGWs6Ivvxd4YgKlLCPEfmqnziDVZQugAljW8Ljelh+5WLNymb+4Q53rtJC1GZOS6WO0bN3wxfOblT6z5RnahI2FseDLVOiYwVthd+snuJLz2CGKJhFTFyJkLCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942740; c=relaxed/simple;
	bh=4tFSvEuOX/RHQ7bRkVYoO0P67HVklbPp3cLUHTKDi/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNxnGEnIsIdTza/ev9zWnlki0hM8RSBXvYvtzWfSHvGukJ+migCKFA2xtV3ZQcZotXYHC1wMQPqCmNHN6omYMexAaYf3YNjDNx5uLVole+pB9PmU9BUr1umuLycYaGRJtM+eEda8+mQ/KCPmjtDArXB0mbcSdKGZrqTaewgLEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpRVrNuC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpRVrNuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A3A1F00A3E;
	Wed,  9 Sep 2026 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942739;
	bh=gQb5JmxZ0Qe6CqSOm8aU31RKgc13uigRQat4ijgMv5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mpRVrNuCbiYPGBCXwIl2Uck00ne1+/3Q/Fv77IEuqy37gWNELOXyO7MJgYppLb9mg
	 jq4HEj2qp61rmCuPGx9F1DCsDvzjR4RCQptO/5nRmDMNnyNz29I/2bpt1NhENdbi1P
	 2o1z3zZF8+rFKXtQT918yG6wN1OjE6kNUnQhLn8ijp6j9Bny9GlJxme8rjO6Jn0h9+
	 rRZ0i70LSRCJYbEsp62gfc+8Xc3C39F6Gf4En6htyzi3e2DFufaBlfyOXzdqICuX5f
	 NSOGKNB6xKIXCULSUa1+bZ2DMO9iLU9hlMIJBAHnPAn6H39VxpgxK2OsDYIRfiBDwz
	 xGcsLHxA2rsng==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 04A9F198003A;
	Wed,  9 Sep 2026 04:32:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 04:32:16 -0400
X-ME-Sender: <xms:ixmhapBAkuku58ph4ImY5x8HTVPR-a-GHKAjHxGYs6i6BiyvN3qKJA>
    <xme:ixmhaoUBIzF2-XTqz7Q7XsZGfUlu1qp45g0XksgG4xE2nvHasOECB1sdiTsl2pO5l
    5GTTpQq5vkhAHq3zb82uLYnekB3t8N4-_vt0SV7VfMF4kFYptJbgQJR>
X-ME-Received: <xmr:ixmhajJkKcLS2mz5yC2nM9WoVWg0BrBys96tr8i4aSAb0w6YWN2RHC2QFDU>
X-ME-Proxy-Cause: dmFkZTEa2vldEggdEtHpw8yPdhwCuH7pRJBb9RsrLsD2yFmnjIBvi4LSmi1+fPsBQuYbj4
    E1kgGLriuiXtzGGyPjxHIE8WkxV1amP5nSmc2hlMfnzYczx1VVzSWXfiUb+MMAUCaO+wBf
    kngiaudPMNXdGDaTdWhzYha/rQRzY7G7hO2gKWvcmIITfUr++w+fz7Ts74FLZQ8G5PnsFA
    o6nqU0hohLcc80EVsNQJj162+Ryg1GuJrSdu4MyDXdV2qNQM69VAIDJTKqQoGIjeVRiPkA
    XPvShuHApELamEYQhCPs8BdUdTtGsNF9ExW2oaDo4YBPLv7N6gCGtu/4QY5C3a/ra8BZBq
    PHQW4ZN0AD8FCgPiZ6uvULlKEm26eTIuOD29lLn40JxD5TZGyOPSZBPeRjPoR0RPZgqNSG
    GASc8/TMxhnUJht36f5AV8dZHmgy25t+BdhiVQcGMYiu8LzO4p0TO1D0DCsbGeSwwcOt/s
    leuAPDN+XeIxUwVRn/+JeqHi+vyV1ztJxLkeVNwnCPklvWVhKh99UE/l5DaslnlbpdT3Bk
    HJugQYWSiF90Eo2xUFb4h/6nDLcUBxMjXNnFf1plkeU8WH5SAW/UOtaN/Pt/TppS5AniQj
    ceYi5Jw4bc8XDT2qofLQV0N8qAgtvzT3d9E96PCd4VLuH9L/s5yreuo1oozg
X-ME-Proxy: <xmx:ixmhapnBRQeKBI6JefPUyoGVKdLmRUfd0mee4Z6wkbE_kF5KZhx_GQ>
    <xmx:ixmhapbF4_h0SWwvVgvjBuFYcMTM0Y4EnmGfPv0xqI8cl9xP0E4SfQ>
    <xmx:ixmharjVrk24Ly5lce_-Ir_xpNjsbaLymW8W_sU2dY5NnSp-mDd6gw>
    <xmx:ixmhamR_iJQgddaEJeo83whkibJKXPIzgBVxT4Su9buLDfaZxIPKyA>
    <xmx:ixmhakMNi6fJ72wgmOz3jhfeJDxhBWXrW3IrYidVt2TZmtZd34Op3lN4>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 04:32:10 -0400 (EDT)
Date: Wed, 9 Sep 2026 09:32:09 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 17/17] mm/huge_memory: drop the redundant mapping
 argument of __split_frozen_folio
Message-ID: <aqEZd-M4x9lmyMqy@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-17-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-17-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:21AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The mapping parameter only served as a non-NULL check to detect
> whether page cache entries need updating.  The xa_state pointer
> conveys exactly the same information: the anon split helper passes
> NULL and the file split helper passes &xas, which is non-NULL iff
> the folio is in the page cache.
> 
> Use the xas pointer instead and drop the parameter, along with its
> kerneldoc entry.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
