Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE163557F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815699; cv=none; b=aNGKA5+fqMDJBS+t+eZ9fRhEf00qpT8yj9XEHFzHGas049gFHj6ngXTkLBE+Fspg8G+er6M5Ed+QpRhp/+Y54gZCo3WlaK2/UOXAYUM4ENKkZ5yYoz64CYv8+jljtyB3ajSqgwxa3J/cikqkXwHk8Tlu94mRGpcZ0JmAm5O3luw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815699; c=relaxed/simple;
	bh=SMfxBHHcSbrB5YkFmWYDXY51oOB0xHfU0LWtqCA6QBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmrEN5k3IscMatYnN3e7491KDXUdgAhXKsPsG5CNCSIzckmdmTuAXDZcFD0hKYLdCHTMH/P0It3kdkEPEKBhRlbi4x7Zcwf1JT21Fwsv6QCZvOqhEnPDB/BPB0CWLyDMVB52eu9ha8lGlpjNq/0Mohy7FRnrdIO1LMFXI5zVLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGDHCk/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGDHCk/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1831F000E9;
	Thu, 27 Aug 2026 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787815698;
	bh=oSUKy48mNgpLBoXIJGRi8A2gloyeWZwIEX3wuZOXoug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fGDHCk/2ttc15Uikv9PZ0OuE0So53Q4Ti1z5mVazsUWVAdxHVdpVrjwW4J6pRdV2y
	 uToNFjpl1nUKe2rZ0QmyWnJwHgUDk4dejr/tcHJTSfQiQSFx6XRX4VN7TAuysOXqEJ
	 Q7vZ2ojdtqgDbn2/1VCQFna82aGizM6f1mjPP5Vx/+WSriVZs77AbDQQ42fI4JEl3S
	 6WscetxVXbo54vhK7uxzZj4FpcgdIzgYRYjTGgPRCb8TBwbGOl6U3D2hRnBQKy0Efs
	 bJWwO8QXfHWLuV4eg+FDyb/W68yYErGxQ1BsxVmgzCavDPUj55Fo4i44bbhGMTu2PC
	 jlCk5MgkJivfQ==
Date: Thu, 27 Aug 2026 08:28:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove unused anon_vma_trylock_write()
Message-ID: <ao_nBIAFLvtqbQU8@gremlin>
References: <20260827071845.17636-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827071845.17636-1-hao.li@linux.dev>

On Thu, Aug 27, 2026 at 03:18:06PM +0800, Hao Li wrote:
> The last user of anon_vma_trylock_write() was removed by cc22b9978509,
> leaving the helper unused. Remove it.
>
> Signed-off-by: Hao Li <hao.li@linux.dev>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/internal.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 68db5abd0a4c..9069013d191f 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -298,11 +298,6 @@ static inline void anon_vma_lock_write(struct anon_vma *anon_vma)
>  	down_write(&anon_vma->root->rwsem);
>  }
>
> -static inline int anon_vma_trylock_write(struct anon_vma *anon_vma)
> -{
> -	return down_write_trylock(&anon_vma->root->rwsem);
> -}
> -
>  static inline void anon_vma_unlock_write(struct anon_vma *anon_vma)
>  {
>  	up_write(&anon_vma->root->rwsem);
> --
> 2.54.0
>

--
Cheers, Lorenzo
