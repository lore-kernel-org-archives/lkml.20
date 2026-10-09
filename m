Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9612D592D;
	Fri,  9 Oct 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555768; cv=none; b=CRgL83RAUybyueEDvPU85aQcpowNgDA25DegUr8h3N3gFs5OZhujGhHXRo16P0OuPz3Ws1Ew8sxo8kvk4lCk5Fa4mGfs9srcRzAZNiBAPw1nDxBLOXlRz2l8s3zic2oOXv+WIqWU6W4y/CTJEncgPWkalJPrybrBFVfTtQmch9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555768; c=relaxed/simple;
	bh=fQbqETrk+6hHLAWxiWRSbCCRBONqw5Hry4DTx6uTvk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS1wSMAD90vsBx8yqxoIylyLQ9Gmf05PxzXzvNs1Pz8gehfUi5SkqnE6e0Rrg6DqIlkB2u3eTOItcw/nWtC8okyppWomI4lyrlnjwwnupDt7CIdEWPkdMa4JF4aOF0NOJz9oKzdDo11TwUG9Cc07Ua9FCMGpum9b/HLVra1aE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qs50c1fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qs50c1fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C951F00893;
	Fri,  9 Oct 2026 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791555766;
	bh=k5u0nEAirOWqi1VCaxdmJQ4JqrSlci3pWXWjeAqH/8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qs50c1fvAAJGbUqZVjnk06seG8+SFM7f/mLMzFePbxQmD6so/orpPKgaMhTjrPUEH
	 ZqYjQ5CMSb0UNsAg+RnaPsTwAyUxN4a5/zUchKuQkk11K7zsamNpDZj/2E7aD5St/3
	 FVZXsiqqNzVWF8vzv0sSt3dXwvOvR8C9sUJJhUiU=
Date: Fri, 9 Oct 2026 10:22:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 1/2] agents: add infrastructure for agent resources
Message-ID: <20261009-nebulous-prophetic-caiman-c7842c@lemur>
References: <cover.1791499378.git.sashal@kernel.org>
 <5dfafd6f79165526fe17774c55b553b7dfe4b3fe.1791499378.git.sashal@kernel.org>
 <20261009134025.GA11438@unreal>
 <asj4FCbBoca8TUK6@laps>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asj4FCbBoca8TUK6@laps>

On Fri, Oct 09, 2026 at 10:20:04AM -0400, Sasha Levin wrote:
> > > +AGENT RESOURCES
> > > +M:	Sasha Levin <sashal@kernel.org>
> > > +L:	linux-kernel@vger.kernel.org
> > > +S:	Maintained
> > > +F:	agents/
> > 
> > If you choose a separate entry instead of adding this to the existing
> > "Documentation Process" entry, let's update the mailing list to
> > workflows@vger.kernel.org. This is where all process changes are announced.
> 
> Hm... What do you think Konstantin?
> 
> I remember the workflows@ list was originally created to share our
> secret/magical workflows, and I'm not sure that this one qualifies. We can
> start a new list too if it's easier.

Eh. At this point I'm trying to shove everyone towards "just use dfn: queries
for your stuff, stop relying on actual 'lists'". I'd just leave it as
linux-kernel@vger, honestly, since the automated patch churn may annoy those
people on the workflows list that we actually want to keep there.

-K
