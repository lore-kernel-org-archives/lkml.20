Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41344CB8A0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533583; cv=none; b=ty8u7cYIQkm2vjG/KUCWEBcI5Mriy6w1S4Db+UHwFj01EHbJ/9hzo+8z1YBTLDJpDuxWvOc9vbMAqccsbtOrsaOzVMFT32kQi2EeOWQIgwOsjoBeN+YglCa2af9QTI6zbdQms4/+axKBsoO83iHaAbM3NlvQRlh4F1cvnqlAlBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533583; c=relaxed/simple;
	bh=rgu3g/edPTwgbbF8k4PfHsRNUiMVvw/Ef9jtJ7OFDzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZY4aaonyC+llY9TiHD5UUCYGtomMPFJMdH6xivEDO3AOg7XoRpwrSNXaEmgzWSuzG8+PTdSn/sKRqT7ZP1gHnYSEgVooAKhJ3I4ttnaffrB7hqoWQT9+oqql+j/TP4lFSYDZjlniLhTs4LbeGJVaDN2WwSUpHzieGQ5cx3SjyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtbqZlC+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtbqZlC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09A51F00A3D;
	Fri,  4 Sep 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533581;
	bh=HMsZaOMnw4fKa8U0Sh6WzCKmsA22ng83jsVlZiJ50Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AtbqZlC+ibRTZBMzWYnOHByF8jf9qbQywKa5Pfs9SirPoWpqkSW1cJdljVdmy1t6b
	 boHVl6YehSTJOtaqV9uLzLYAx5tDgAV3tw+3OhxvH7E/5WLUjQ7qSsG4VXOL+wvuCQ
	 JWj039snVXZMk8W2GCnc5OfC9EdbFWojqynctTRQU0IszCzpqjDJgjk9avcH6Gp+jB
	 8qPyeAiwOZdm9rzXqebgacHW/y6yIDULY6EwGNz1jkc0KBA9mufqYdZT2R3zel4jts
	 2wjmzE5d2ZinZtU6oSgOZFSkVXD9uWsHBPgA3lepZZULhrPgw68mOHT39V+jg1LLkH
	 JcJt/6XOfW9rA==
Date: Fri, 4 Sep 2026 15:52:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/3] kernel: fix typo "overriden" in comment
Message-ID: <aprbL_maJ4z3TURl@gremlin>
References: <20260904122054.28531-1-hemanth.selam@gmail.com>
 <20260904122054.28531-4-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904122054.28531-4-hemanth.selam@gmail.com>

Another orphaned email, please always cc everybody on everything.

I can't review stuff like this esp. not for purposes of typo fixes thanks :)

On Fri, Sep 04, 2026 at 05:50:52PM +0530, Hemanth Selam wrote:
> Correct "overriden" to "overridden", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 416758c8a3d4..6d3340d34234 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -3266,7 +3266,7 @@ int ksys_unshare(unsigned long unshare_flags)
>  	if (unshare_flags & CLONE_NEWNS)
>  		unshare_flags |= CLONE_FS;
>
> -	/* No unsharing with overriden fs state */
> +	/* No unsharing with overridden fs state */
>  	VFS_WARN_ON_ONCE(unshare_flags & (CLONE_NEWNS | CLONE_FS) &&
>  			 current->fs != current->real_fs);
>
> --
> 2.48.1
>

--
Cheers, Lorenzo
