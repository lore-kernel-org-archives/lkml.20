Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94224F30FE;
	Fri,  9 Oct 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563788; cv=none; b=UtK9w1tM7wbsVNJFUtoP0T0TZ7arr/M6YbvMUrlrPA7M7s0CyNb0dbonWJb/KgLzM+124vCBhfE5Fk7ilsgeAIN42yo1Zp+QhMeDumnkaTUcwyRwA7u1l/825vvDP45gLfSZUaIcrLJ9xwzXNtLq9KDzzTXbGi1M8SzxzYNEXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563788; c=relaxed/simple;
	bh=tMO6b3aiEb4TwjQopVgaQRTIA5G9uFm2SlKp5jJQxoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDMqs7+qzEIr6iS11je+R7C4WGEWNyNEFnjexgEiX+HtfAFNHu+zZvffhongXYukXBIs+L7CsuOPUVcM1TDR7SGMxjTobKnBaDDXmeBhGkgK8F27hEc2pRYnUkafpE2eUBqwDhIg1XzPuAr5Sr2ckFo1iES9HBAu/DlEYfJp1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHliIY7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHliIY7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5941F000FF;
	Fri,  9 Oct 2026 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791563782;
	bh=FLCIB1FcuL1VxORbnyLrAoSq+yTqg5ybnZ2V+FGxcfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OHliIY7Cvw7EseTXNWKN30qKeXuokOihdK1UHJXnUP1zypHui/Haj6INKUgfA/0Q/
	 9fO+qQPc9TJhMeoC1nXh1KdLksi6pO9Lo7K3fA1RqVgC+w9tU8SmfpcvuMmQPfNXcq
	 25h2Vtszqrd0FutV4Q+qHu07ZnN23bbIJRDqOLPeOm7F0pald7XXro39L7NjQ2sYIs
	 7e+z6RxWmp3kTgYyrNzn9Xf3CZsPFkxsNAto6VTT179m0I46Ecqeb8xB7vLgG07AKe
	 CzrVdknn1pQNmP46t5ii4TyOcnEl928wwe/lYFE9M7T7yg9v+iKxzAUD/lHpbTBdBH
	 hGPzhcW6yEd8w==
Date: Fri, 9 Oct 2026 19:36:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 1/2] agents: add infrastructure for agent resources
Message-ID: <20261009163617.GB11438@unreal>
References: <cover.1791499378.git.sashal@kernel.org>
 <5dfafd6f79165526fe17774c55b553b7dfe4b3fe.1791499378.git.sashal@kernel.org>
 <20261009134025.GA11438@unreal>
 <asj4FCbBoca8TUK6@laps>
 <20261009-nebulous-prophetic-caiman-c7842c@lemur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nebulous-prophetic-caiman-c7842c@lemur>

On Fri, Oct 09, 2026 at 10:22:44AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 09, 2026 at 10:20:04AM -0400, Sasha Levin wrote:
> > > > +AGENT RESOURCES
> > > > +M:	Sasha Levin <sashal@kernel.org>
> > > > +L:	linux-kernel@vger.kernel.org
> > > > +S:	Maintained
> > > > +F:	agents/
> > > 
> > > If you choose a separate entry instead of adding this to the existing
> > > "Documentation Process" entry, let's update the mailing list to
> > > workflows@vger.kernel.org. This is where all process changes are announced.
> > 
> > Hm... What do you think Konstantin?
> > 
> > I remember the workflows@ list was originally created to share our
> > secret/magical workflows, and I'm not sure that this one qualifies. We can
> > start a new list too if it's easier.
> 
> Eh. At this point I'm trying to shove everyone towards "just use dfn: queries
> for your stuff, stop relying on actual 'lists'". I'd just leave it as
> linux-kernel@vger, honestly, since the automated patch churn may annoy those
> people on the workflows list that we actually want to keep there.

Konstantin,

The "Documentation Process" entry already points to the workflow@ mailing list.
Changes proposed in "AGENT RESOURCES" will affect everyone, so sending such
important patches to LKML (/dev/null) does not seem right to me.

Thanks

> 
> -K
