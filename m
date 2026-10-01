Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968A4189BA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874976; cv=none; b=m3i1QdkePkLlBNme5nea9W2DiDa0BCC+dllLRMBPXuWqJ2ZnpfBmSss9o8Ai9jluwqmGAhMgIGGClJ3tEYeuZHVlArqy8HDMwDZaVeVRjvSIjsKbrmEEbO3x0LkNN2sn7UEUrF/3NVHFNeBhAOWHTu68V67d0bB9USoMtqIQ9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874976; c=relaxed/simple;
	bh=l25allTpr/VRWW98pGfFBUrs4v4YN0UoHKBuz51aLzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBRWzK7mXAL7ivTSawQBWOvqk0uFkq75EHE3jiWZJZT9oExursypT+gqEwWVPbDa52DSOf2IW4LuYI5sja1jc6AERbpJt6ZLX9sETQAds+kuho0jRSEjUMvtP+laFI8YWL6wU0c9LO/KmSOGrn9YeHsHeEZv5bhy22/iKxzcLL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cF9YU+Ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cF9YU+Ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA5A1F000FF;
	Thu,  1 Oct 2026 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790874966;
	bh=iUTKRvNOTHlng4KEjGJBK0PfAqYkMV4bCQ9acZUX904=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=cF9YU+KorQjG4T79Axzuc24gIh+MTw/nUVl18TsHvIpSL8CQMRRHTwsu2E9LeWmMd
	 /7V/T3oUoCetC9BKtarDVgYOKBG5JHNWVT4bHjGKT7x8x39LcLFjZ7WD6G+3JMu68d
	 a95HE3CysFLsf7Q3viyHr3yPWncmsiXE5KhtLS7xcsNsOldeEjekuNNXRa4b1a8V+n
	 +mqpMPD4q9BJwnfN088YCrsGa3VDzu0fl+59LnWht9iC1vueCZdYzOSiKb0D95QtlW
	 NfLYtHM5Cb9funbKZ4B0g0npoVnvkUg4PQHh43FEFIWKfHqnk4PmaHC+AlST6mMfYa
	 SecRFo5P0tG/Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A2A95CE0CAC; Thu,  1 Oct 2026 10:16:05 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:16:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chris Mason <mason@kernel.org>
Cc: peterz@infradead.org, tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] futex: Fix private hash use-after-free on resize
Message-ID: <8efae79d-4ef6-4b2f-9fe3-231872c593b1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261001135022.2220288-1-mason@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001135022.2220288-1-mason@kernel.org>

On Thu, Oct 01, 2026 at 01:50:22PM +0000, Chris Mason wrote:
> poll_state_synchronize_rcu(mm->futex.phash.batches) is used by
> futex_ref_drop() to check that a grace period has passed since the
> current hash was published. This relies on batches referencing a grace
> period which started after the hash pointer was assigned.
> 
> __futex_pivot_hash() sets mmph->batches before it replaces mmph->hash:
> 
>     scoped_guard(rcu) {
>             mmph->batches = get_state_synchronize_rcu();
>             rcu_assign_pointer(mmph->hash, new);
>     }
> 
> The scoped_guard(rcu) doesn't stop new grace periods from starting, and
> if one starts between those two assignments, futex_ref_drop() can move
> forward while a reader still holds a pointer to the old hash.
> 
> Fix things by setting mmph->batches after assigning mmph->hash.  The
> scoped_guard(rcu) isn't needed, so let's drop that as well.
> 
> Fixes: 56180dd20c19 ("futex: Use RCU-based per-CPU reference counting instead of rcuref_t")
> Assisted-by: kres
> Signed-off-by: Chris Mason <mason@kernel.org>

From an RCU perspective:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  kernel/futex/core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index a061f54b606d..095f9fe440e3 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -213,10 +213,12 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
>  		futex_rehash_private(fph, new);
>  	}
>  	new->state = FR_PERCPU;
> -	scoped_guard(rcu) {
> -		mmph->batches = get_state_synchronize_rcu();
> -		rcu_assign_pointer(mmph->hash, new);
> -	}
> +	rcu_assign_pointer(mmph->hash, new);
> +	/*
> +	 * mmph->batches must reference a grace period which started after
> +	 * mmph->hash was assigned. See futex_ref_drop().
> +	 */
> +	mmph->batches = get_state_synchronize_rcu();
>  	kvfree_rcu(fph, rcu);
>  	return true;
>  }
> -- 
> 2.54.0
> 
