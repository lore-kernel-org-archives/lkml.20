Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A451CF79;
	Tue, 13 Oct 2026 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898158; cv=none; b=ZZhO7tEe1V7TWID6XajICYF26AkQX3ZrhKDhb1cj3jkS3/yddCyI8frGJtUzfNZItVwBjGlgwDUiZWFcCGph6G/pyvpaj6xf2vmrWcn5nELy4tVVPvR2EXR7KV2j8wh7jFG2jeO8D4M7PZlzIvwUlqHU9ucYlGF/677ws/B/qyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898158; c=relaxed/simple;
	bh=YV2Q5Dnm8tPi/Aqcd/05NvKriDAlm50orcRk0/Q0l6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCLfZ87EDbxMAwRMaz13Pa8He+4YVESoC4exwcSyEp+cSkofd+ASL+WOZajpDH39MTeTzVk5LClap1FqD+nK+PJVMXUjuNQ3YN/OdPVxQb04tDUs+smD6/S4QTmM4gURFaL7vz1BieHyDbnvIiQm6rLMJrYZpRryFPhdgxiiw60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGacsjXn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGacsjXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D141F000FF;
	Tue, 13 Oct 2026 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898157;
	bh=YV2Q5Dnm8tPi/Aqcd/05NvKriDAlm50orcRk0/Q0l6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XGacsjXnuoNJexgznEKHZ2j9oK4fFtTfd47ggBzgoCE9m6dMKscmginpcUOYJBtGn
	 +tpZTbNLqYxuezq08mdEGk3p0s4jW3W0k/9RFGAyAmqMVTVmmKb9LnLueyBM9DC+W9
	 Cqkl6VQq2pVvrzI8JrJILIH7tVyyxiip1FEo5BU/HPT+xCDifGrJ6c5meokonpMfYZ
	 FV9yem4m9dYJH9+8Q/j6G6Pk3rEoXy76Xt8UhBElhhfGkRokYxnSDZvCQZ2XvjanRM
	 yzTAIp/h43R1qfCeGdYpSfG9sScucsf41QI29jFuBQqT8D45f5YHTOPc+EF+4HDYwA
	 KqTly7TxeGBbQ==
Date: Tue, 13 Oct 2026 14:29:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <as4xMnT8a75pIw9v@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013131243.GM56180@killaraus.ideasonboard.com>

On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:

> > Ignoring is the only workable long-term solution.
>
> How do you decide which patches to ignore ?

Anything that looks schloppy. ATM it's very easy to tell.

In future it will be newcomers who do anything but the most trivial work. Or
they will at least be super-deprioritised.

Yes there will be collateral damage, but it's that or no more open source (we're
not the only ones going through this!)

--
Cheers, Lorenzo
