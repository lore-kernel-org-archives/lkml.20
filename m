Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF655400974
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521667; cv=none; b=eIx/Oc49iIaaMsQgYqgZP5pJ40K+eleruo2SpG/rjjp/XJH30zm6PQnpOC2hkFFrnqfhUZ5CqS9xG38gK9maHSzNGNmxDWOpdCSDsW0qhYwMXWozCfGC+uKa4Cyve9ywmgEbApIGktkMYAMP8wPuYj2gdn0lA+/kV0VNW5v1yz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521667; c=relaxed/simple;
	bh=4eAaJbGO9n2DCzGCs6F+1rZktUqMWC6Ki3tOcdpJ1Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSPwG5P/9cwhV9eZeftScY3WnN1Lk/IFf0UL32nl0lhJKr5naIscYZFn5cGWLLnhBMhlFgRDVnAnKhskAgp6+qhbq7uiZQl9wNuC7EHLZA2wIR3tv9XogFdlRGCHsE2p8vcYernth0mV75P/UlyBD/7zvCCmTofkNPFxcDFIY3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzkp3ZVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzkp3ZVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B011F00A3D;
	Fri,  4 Sep 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521664;
	bh=irC8j8xyI52ogOtso1++Qi9/+5gUDfx1IlgeyjWZd8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nzkp3ZVcXRWVGT7XHOMyRxt8+0ITVEQaF3/yAsfIY52CIlEeeD38VYIVsoiPTdPpK
	 LYGEEUmcMrq39qXvBxe36aR7HE0WZeXZTkAMi46r6/78dFey1SdJ4bw2ZUT6Meywcz
	 wBBFmBgjCCV/H4bOZ3CqMpgJjEduw893/Dxa9LunTuNQ5+YTzsbfRe9qrTBT7/8AFN
	 Uky9dOfr1JpMb1DWTQ6jex4a/NEuMCxlqEGuHmBNxOmFQdqilthCHC0j2IlgcHJt8a
	 K9j6LN3qosAhh3fnoSBoevUOqj+2RlEojSNItcxcK6DMP227Hw/lx77U3McTksGjdH
	 VsJR6WtgZAZNw==
Date: Fri, 4 Sep 2026 12:34:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/5] char: fix typo "funcion" in comment
Message-ID: <apqsko2qanqFBmb9@gremlin>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
 <20260904104854.25272-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904104854.25272-3-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:18:47PM +0530, Hemanth Selam wrote:
> Correct "funcion" to "function", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

This file has been moved into mm/ in a recent series of mine, but I guess it
should all come out in the wash anyway one way or another.

Anyway LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  drivers/char/mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 63253d1de5d7..f9db486d7029 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -76,7 +76,7 @@ static inline bool should_stop_iteration(void)
>  }
>
>  /*
> - * This funcion reads the *physical* memory. The f_pos points directly to the
> + * This function reads the *physical* memory. The f_pos points directly to the
>   * memory location.
>   */
>  static ssize_t read_mem(struct file *file, char __user *buf,
> --
> 2.48.1
>

--
Cheers, Lorenzo
