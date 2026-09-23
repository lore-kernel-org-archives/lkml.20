Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89383876DF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203606; cv=none; b=hlDUyqS8vs6QuT9fi/xao+th+P8dKsZp9nv2FrkzvScBl4S1WBrZt6Le8FpDSTatf83ZpKe2uK42WAID5fNnux33CXh8hasx6uYc+m6aZHJ1XQ9nngSPwtYX1c7ETLqNMip7ebi5r9d0KCmOG1F3gPJ+oB85UsC9OZVE4bZbUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203606; c=relaxed/simple;
	bh=rM7OEAelpUNGegZaELJ5qZffRCqoWvdOYopYcPt9JYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5XOOko29tp3fIp9BnNW/3mz1Zkh39vV1xdeVdPtnstORiG1ZsVufjKPvcPB+7Ime6PFLb9vMySjW9WLZ9e2gZk5zCDKP542WzYVCLCfd28dCzeRinzlx8hUUhsHThClK8WeSJDvmn5G7a/V6B1PVPI5vYPi4fZDQycWgXXD5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=ASauZSyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ASauZSyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60D21F000FF;
	Wed, 23 Sep 2026 22:46:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ASauZSyX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790203602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o51B+YjV5MwOWRxQ+h2P+xT8DGR6gEuVB+iGRKr/vw0=;
	b=ASauZSyXsqyFuYzPoHvKW2mcz+er6tUT/gylb9LzQVHseYfhp3Sq5D9q89LVaKAY8RqpHK
	aSnXmu/ucDJumD3PlWtrXuw/vSd3VGKWFGEgzwBNIlOFMcWlG7tWm2ZG5GIQVDA7eWpbDk
	P4cgulynd20jW+5IXajjFPVrUJetNIs=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 3287505e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 23 Sep 2026 22:46:41 +0000 (UTC)
Date: Thu, 24 Sep 2026 00:46:39 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: jaidevshastri@vt.edu
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] random: publish crng_init with release semantics
Message-ID: <arRWzyRrme0YXt44@zx2c4.com>
References: <20260921-mb-random-v1-1-6af174739807@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-mb-random-v1-1-6af174739807@vt.edu>

Hi Jaidev,

On Mon, Sep 21, 2026 at 09:26:21PM -0400, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> crng_reseed() writes the new base key and bumps base_crng.generation
> under base_crng.lock, then sets crng_init to CRNG_READY with a plain
> store. crng_ready() reads crng_init with a plain load and without the
> lock, on the get_random_u8(), u16(), u32() and u64() fast paths and in
> crng_make_state().
> 
> Set the state with smp_store_release() and read it with
> smp_load_acquire(), so that a reader observing CRNG_READY also observes
> the key and the generation written before it. crng_ready() becomes a
> static inline function so that the acquire can carry its comment.
> 
> Found with MBCheck, a static herd7-based memory consistency checker.

It's "intentionally" like this actually. By that, I mean that I thought
about it when writing it and decided against it. But maybe my analysis
is silly. Here's the thinking:

crng_init only ever becomes CRNG_READY. It never goes from a ready state
to an unready state. And it becomes ready at a quasi "random" time. So
all the code around it is used to various things happening in a
potentially unready state. Once it's ready, however, it never becomes
unready.

So if it changes to ready, but the cores don't see the change for, say 5
whole seconds (several orders of magnitude longer than what's
realistic), then that's fine. They will _eventually_ see that it's
ready, in the same way that the rng itself _eventually_ becomes ready.
So I didn't think it was necessary for the cores to see that it's ready
at exactly the moment that it is ready and not a second after.

In other words, the consequences of this racing are basically nothing.

Does this make sense? If I've overlooked something, please do let me
know.

Thanks,
Jason
