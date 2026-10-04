Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98247F3DD;
	Sun,  4 Oct 2026 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142557; cv=none; b=V/CrAFeVNGQcztAAOnZ2CyUyOLKNbJUuroyorpzu8ZvEDgNKvfSlGyhZNjjK4n1qU+R3uipCyVSv87uvwn6h7ygbzoVzvICDv//+N/Ob5or/ok0y3D+9vFUbQvDYn/oSr3j+HMgRqkwPQB560fgR7a6JofghY/lpK9fEQYGZmRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142557; c=relaxed/simple;
	bh=bt2JdkcXMBehZKJasoAZGjWRpnEzVcFRF57GBH0wCq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csJc1S9lgl0lUWoUTQeS+orVesvsVmiJ4/1R/gjCPgICtS+kQx8vKXZHbwTWp41K7HdR+0bMSL4JxD5W/T250RtgfNUqBYr3NiS1gKmoa9xJbZkex9r0n5jMlSzWLIWW/3EkZP3dGBK7zK1Rvn6t3lJQj7r0s0OgLVKUksryBxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEGLs4Y/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEGLs4Y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740C71F000FF;
	Sun,  4 Oct 2026 19:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791142554;
	bh=bVzs3nKi3STeEpl2UyULOorVsImcNQe0xcTlZn/ds2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UEGLs4Y/E+ufn6rjORVJC4qBwgayQk201Ab5LdI8A/H7kAObN2X4rwybWoGYOlAWn
	 LBFThAKr195RP5Ck1itiVbU4NaQfSVJXpD9eWcyhjrbUqsu0x7xZ/jqkZ6Rrfy+8iC
	 XY5u/vO197mG/W9DHiQnps2O8KPAOKyYUHhZ4jzAbChKXRhthIlKDCnBx7jrrI7h0f
	 FbqfrInglgzFvLYf103tXFSztmxkW3vvJp6wgmvarLpcqfi8LnFJ3yyiM+G4/xXnxC
	 aSW3xwivPyy21guZRkVkIeXFzIXsA6Yu6PoTuwyb5fGwR4jNqy2x2jqcccHmb96IMS
	 2dt7+vLU7bbnA==
Date: Sun, 4 Oct 2026 21:35:49 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] docs: kernel-parameters: adjust reserve_mem build option
Message-ID: <asKqlZFS_A42w2hb@kernel.org>
References: <20261003213457.96408-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003213457.96408-1-rdunlap@infradead.org>

On Sat, Oct 03, 2026 at 02:34:57PM -0700, Randy Dunlap wrote:
> "[RAM]" means that the command line option is applicable when
> "RAM disk support is enabled." However, the reserve_mem command line
> option is not related to RAM disk support, so modify its build option
> relevance to "[MM]" instead.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> 
>  Documentation/admin-guide/kernel-parameters.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20261002.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20261002/Documentation/admin-guide/kernel-parameters.txt
> @@ -6693,7 +6693,7 @@ Kernel parameters
>  			them.  If <base> is less than 0x10000, the region
>  			is assumed to be I/O ports; otherwise it is memory.
>  
> -	reserve_mem=	[RAM]
> +	reserve_mem=	[MM]
>  			Format: nn[KMG]:<align>:<label>
>  			Reserve physical memory and label it with a name that
>  			other subsystems can use to access it. This is typically

-- 
Sincerely yours,
Mike.
