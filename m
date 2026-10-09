Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B13F1047;
	Fri,  9 Oct 2026 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584897; cv=none; b=XHpKRGD/nSFWp6eMGy21xMmBFwrjlsc7+1J8Y8jya/1wcCB/fMpkDSb/OPechZ36dIG/llLI/e4vNTFe2yh4K7Ucsbzk+geDCSOC/Ymqt+bpSET7FofnaniedIQVx+fagcWekY8oDzKdQ2VXYGcjHhz9hAguJ1OpQMcWY/awAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584897; c=relaxed/simple;
	bh=iAGcTpDba2RVZqCOk4JN/TRjNiwaJuaBu2WoY8euR4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/Kfbgz0DceQJeRKz243tkdriCttNlx7z89ol92Ti8Iz1Ri1nY3RJgbPj0ngx88UkOxk/fI1K3ABgVawDrNoDYmv577ByisqZIj1Vjd0Rxu6516N/R1T3e655AwTUA7gqmr/RnDm4tr9+9H80h1p6Tx98geqplWXMmeiCYQdy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T7QbtMlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T7QbtMlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F951F000FF;
	Fri,  9 Oct 2026 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791584895;
	bh=KG05p9dAhQpWYY9sGgGIohuferLJAQB7IQyWVE4eJGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7QbtMlYgsS+p6X2IpyFdJUb1UAICbcDtnYNZyNEc/igCVpBPGx2F5TOVllAZFizR
	 /54eOXOpUBmX0lnRAvRosdbUyn5x78i1C7tE8XNQy5kcb3IMsd27qSWQCroI+7Bfq1
	 aavvQJrUWmCRj0ZqAd3e0UWMhuFjQnQiB60Tu/BA=
Date: Fri, 9 Oct 2026 18:28:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 1/2] agents: add infrastructure for agent resources
Message-ID: <20261009-vivid-celadon-pigeon-bbddec@lemur>
References: <cover.1791499378.git.sashal@kernel.org>
 <5dfafd6f79165526fe17774c55b553b7dfe4b3fe.1791499378.git.sashal@kernel.org>
 <20261009134025.GA11438@unreal>
 <asj4FCbBoca8TUK6@laps>
 <20261009-nebulous-prophetic-caiman-c7842c@lemur>
 <20261009163617.GB11438@unreal>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009163617.GB11438@unreal>

On Fri, Oct 09, 2026 at 07:36:17PM +0300, Leon Romanovsky wrote:
> > > Hm... What do you think Konstantin?
> > > 
> > > I remember the workflows@ list was originally created to share our
> > > secret/magical workflows, and I'm not sure that this one qualifies. We can
> > > start a new list too if it's easier.
> > 
> > Eh. At this point I'm trying to shove everyone towards "just use dfn: queries
> > for your stuff, stop relying on actual 'lists'". I'd just leave it as
> > linux-kernel@vger, honestly, since the automated patch churn may annoy those
> > people on the workflows list that we actually want to keep there.
> 
> Konstantin,
> 
> The "Documentation Process" entry already points to the workflow@ mailing list.
> Changes proposed in "AGENT RESOURCES" will affect everyone, so sending such
> important patches to LKML (/dev/null) does not seem right to me.

Ah, sorry, I hadn't actually realized that it already has F: entries in
MAINTAINERS. Then my observation is really moot and if you think workflows
makes more sense, especially with linux-kernel being a firehose where everyone
is just going to miss any patches, then let's use workflows@.

-K
