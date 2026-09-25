Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8C3AFD02;
	Fri, 25 Sep 2026 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369376; cv=none; b=mu3J5+erXjCIdfiOgatkTlvifYcclZhkguJuJpP+kxjF26vo6nzzvUeK+t+Z903xRTuH/RayMy3ZX9ddZxvha+qhRi97NeGEpZwVvd1Wal1p0J6Kydvxtl1szkbwHsMxekoQ50mbGvJlmwnmgsJRXCVgTbj1PbPVBJXyzNVF2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369376; c=relaxed/simple;
	bh=4KK3xmmHWpEI9jMvazPQexOjcLXettTimiSjPCeXIMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udeUH5k+NdO0+YhmZ0pI5Y6/APLEfNSleQU0dc4XSkC44I9bL1t5kdzDz2sk2NKqG8VTZBQrzgBWgJd0PkTGu3w1FarWy0iYWX3Hv9Rs8qU974y3NaMBW0d9djQh4l+zrFWNwG++fZJs+OUcCt3ZdLKAqE8QyWFtDixoJGcNrrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Amk8NJgg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Amk8NJgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299D41F000FF;
	Fri, 25 Sep 2026 20:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369375;
	bh=bvChTGi1l6CAYkQeNOpF1SLZ0wxlUUnNso5jxBJ2DLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Amk8NJggTrHsAeagb6ErN1oMg8l6KFTZlDPvUBj3v43a9mrkfOecYnXP90EbQkW6/
	 GzYH36JG+jGweFL2BY6kVGu07pjDWdPU2J8s2fFItWcNPtLb9Z7133N4Q9DKTlAYk5
	 Paht7pVi5Cf38thfo2CwhrLnhjLFsnykfM9RICkTA/ACQMGkViL9KftwCSP5kbT+mx
	 90DfD0JinyB7AJdxROQ/hj2ESA1NwWbMIMApGZsOlmlRY7tTLrfpJXwpjLLPTX356w
	 +Cla4TkRsJOVroNtp56v52AdASamP4owWK8zMOF+gnVYIyFSyderad4EgyCHAf63V3
	 HnM9Ci8KewAMQ==
Date: Fri, 25 Sep 2026 13:49:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	tytso@mit.edu, krzk@kernel.org, maz@kernel.org, cassel@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: document the branch in git T: entries
Message-ID: <20260925204933.GE5511@quark>
References: <20260925120047.1093617-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925120047.1093617-1-matthias.goergens@gmail.com>

On Fri, Sep 25, 2026 at 08:00:47PM +0800, Matthias Goergens wrote:
> A git T: entry can name a branch after the repository URL.  The first
> to do so, commit a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem
> git trees"), added two T: lines for one repository, one per branch.
> Today 109 of the 846 git T: lines name a branch, and ten entries list
> one repository more than once with different branches.  Commit
> 083bf9c56d06 ("get_maintainer: add more --self-test options") taught
> get_maintainer.pl to check the branch with git ls-remote.  Neither the
> MAINTAINERS preamble nor submitting-patches.rst mentions any of this.
> 
> Document the syntax only.  What a named branch is for varies: many
> entries name the branch linux-next merges, others a fixes or topic
> branch, and some subsystems want patches based on a mainline tag rather
> than on any branch of their tree.  maintainer-entry-profile.rst already
> asks a profile to say which branches go into linux-next and which one
> contributors should submit against, so point there.
> 
> In submitting-patches.rst, say that fixes for the current release cycle
> and new development usually start from different places, and where to
> find out which.
> 
> Suggested-by: Theodore Ts'o <tytso@mit.edu>
> Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

>  	T: *SCM* tree type and location.
>  	   Type is one of: git, hg, quilt, stgit, topgit
> +	   A git entry may name a branch after the URL, and an entry may
> +	   have several T: lines, for example one per branch.  What each
> +	   branch is for, and what to base patches on, differs between
> +	   subsystems: see the P: profile, if there is one, or ask the
> +	   maintainer.

I would hope that the convention of one branch for the next release and
one branch for the current release is common enough that it could be
documented as the usual convention here.  But maybe there are too many
odd subsystems that do something different.

- Eric
