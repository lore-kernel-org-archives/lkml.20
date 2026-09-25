Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5224D7964
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353060; cv=none; b=exuj2a2jYMV/x5K3c06eQLjqLPom9PgqNftbMF8kXJGgNUlBNY1fiyYLZjPufOQS/TO3i/NE2jVVEmpNAkL6Ch431WTA1plH5/ihfs7kfq84exhJSFj0Vx5Sh4aXqCcP0QPHtxHQWgSuMrN5RNG9F6XqzQwFFvemaPC2HVoTSEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353060; c=relaxed/simple;
	bh=n3OaTTQ8bUEFuL4qBBZlEwXO0QWVTkRwwP//HV9Kmr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/O8OQlm+mDd3mJ0x+IiReH4NzZ6EBrlbLvGHTg5uJkUhZAdwjKb6kEk9b4vAzf2i8u7pXTRngsVjPthD/RL0pjZN9r8eO6uRqO78sh1G7MLksMjwhquqCFp3gCtZv8tRyOCbgp2UQ8oGXq4JVH2ipjKFAKMGOa4UUiP/bb+PiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3VaIlKj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3VaIlKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8C51F000FF;
	Fri, 25 Sep 2026 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353058;
	bh=dXF5FonPJsOGWH5zY3O+RL076bJTH/mSCOISs9AU/m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3VaIlKjwNttguPmdFxO8NkjU5z4yDZ3XYoC+Vj0o1yg2y4hxnbrjoCapJoLS0z2r
	 Jnq798a8ZtMHkX7IKRDrGBpkJYVPCC1Z3Iqdm53NCYG2FBGMHk/8d0/VLexmlT4t28
	 w35TrObQ+qxnVsZZNsdJxAZfXcVMHQoGe+padk2H7zx5sj5t2mqx7aEesR6ti+mhi2
	 gtNIFeMEjaQGFqM1TheI6OL4A8SApPHfoyDTse5PUbwXYC/cnykOgM6Fcsmv5OVIrb
	 xd0rYJwUqwY7NH5iw5TpC6VnIqkGlOC8OMU7q5BIW7dhc7X1D2fqJQ+ojZAfoizFJT
	 yP9ARr7oVNVHA==
Date: Fri, 25 Sep 2026 21:39:02 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 2/3] x86/apic: Introduce a variable to track
 the number of EILVT registers
Message-ID: <arab81C6O6uHIHdk@blrnaveerao1>
References: <cover.1788425679.git.naveen@kernel.org>
 <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>
 <20260922053610.GBarITypxf7zPAB83g@fat_crate.local>
 <arUKzQZx77r49plq@blrnaveerao1>
 <20260925042612.GCarX35LHhl65JavXf@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925042612.GCarX35LHhl65JavXf@fat_crate.local>

On Thu, Sep 24, 2026 at 09:26:12PM -0700, Borislav Petkov wrote:
> On Thu, Sep 24, 2026 at 05:28:48PM +0530, Naveen N Rao wrote:
> > Cause I didn't want to risk changing the current default EILVT register 
> > count for some ~2 decade old processor that may be advertising 
> > X86_FEATURE_EXTAPIC but encoding a count of zero in APIC_EFEAT.
> 
> Do you know of such a processor?

I don't.

> 
> Because Christian gave you all regs count from K8 onwards and that's what we
> support anyway. I don't care about K7 rust and older.

Sure, will change to the version you proposed.

> 
> > Right, the split reflects how I viewed the changes, and to hopefully 
> > simplify the review. Looks like I got the split wrong as it looks to 
> > have been counter-productive here.
> 
> Right, just keep it simple and do a single patch.

Will do.


Thanks,
Naveen
