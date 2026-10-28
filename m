Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188653;
	b=VO0+VFacAhZgOu7YZ3r27kcIJFiaFsc30RmtnQlaYnQYkBMRqHGlu+FXLr+mdQz9U70U
	 73zsTyd/XmDC3a4ODKW8ibstrCWkPacflsDHnPumYNh0ilPUHnrjhtXzYjFy8p9FmaeWD
	 h8koBgzMxaV1rQbSqNKoXbmTMkqKQzc+YvJn3ub6PfdhdBVRbL60QmvbHsqYKTlL+GRgN
	 os9G527AXL62wUaTjjGCADs8K8rMPpfv54Z8cxz2pbxSTKCJRdLB1wzjYEubzW6Y01JJb
	 ClolQ2DEZ0nwNKm0x2V8wZw2VHJoFJvM1A+zQZAJYSvNSJ3rTJy+SVobjPT/QXKoDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188653;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qiW0xBkrGwxrr6G2qYAuGESnkge3qTgda6VZZem51Yc=;
	b=taB+jqTxPvOkMBWGnsY4Zt8KsRyhjEnEl3gy2Qe+ooIXtKuisOGFMVRyI60jnu2ofu4a
	 +M5AZ7ZnQ0mOJNhcLEgjU/hqw62kqasriSweCaAORZBbvwf0znOcKH5LLx4zfQdpkJl3P
	 kUl9zNAD2AS/lINxuDmjFcXnto7PMUt8Bjzf2K+ZWxuEBtdZs4HOfxTZ5DHGkIhKgEq8Q
	 u4M8pw8LMB+xwmqlxJrSvdOFNqMFSO3BGZ5J0R50li4MWJrBZSTWVIz3AkUMpsqwSN7s0
	 yFCKA/YrUSW2CUBebWSl0eojZZWbPSFU25oKmmAJi6hb6LQwtadwf4BOllXjCdrKd/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ev8RrmbM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9704606A321;
	Wed, 28 Oct 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ev8RrmbM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D49D1F01828;
	Wed, 28 Oct 2026 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188652;
	bh=qiW0xBkrGwxrr6G2qYAuGESnkge3qTgda6VZZem51Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ev8RrmbMYhR4lKcWzj5wRE5kUpGwPKf0SL2N9X4i02sdq8Tn3ptoDeVtQagfGQaHT
	 b3wsAq6VB1XYNNTjC352GNDxGeZGJpb57Le8de1ls5pqxKEWIqhw72ojFZDkVYaAK3
	 SLbOGJzt2gkq3h9Q73ceCU6qHme+kxlZRFAbHy2ReheSWGKgvuwevComD9zlAjaCPD
	 oQrcJha6A19ufPEib3ddTLBxhQFHc/MlRp5L3NipdwMbRvEYCNEZegTZPTdcczz0O0
	 fkmN85IsuxgGWbPV+1hxeb1u7XVgMqL8v5MCirMTUmb7lkbm2Et9qBbaiBanpfWvHw
	 ITdlF/je7722A==
Date: Wed, 28 Oct 2026 06:57:28 -0500
From: Rob Herring <robh@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261028115728.GE3598537-robh@kernel.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
 <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
 <20261027122346.GA2133989@killaraus.ideasonboard.com>
 <auFH8o9FbxprB40A@mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auFH8o9FbxprB40A@mit.edu>

On Tue, Oct 27, 2026 at 09:14:22PM -0400, Theodore Tso wrote:
> On Tue, Oct 27, 2026 at 02:23:46PM -0500, Laurent Pinchart wrote:
> > > The problem boils down to how to present work that touches multiple
> > > target trees, and where some parts depend on other work that is
> > > not yet finished. Do you post it as single series, so people get an
> > > overview? Do you split it in multiple small series (which may still
> > > have interdependencies), so everybody looses context?
> > 
> > There's no one-size-fits-them-all solution to this problem. What I want
> > in those cases is information provided by the person posting the patches
> > about the dependencies and where to find them. I think there's value in
> > specifying that information in a machine-parseable way.
> 
> The problem is that "one size fits all" and "machine-parseable way"
> are in tension with one another.  One approach might be that the
> patche series fragments might be sent to different subsystem mailing
> lists and reiewers, but the cover letter might include a pointer to a
> unified git branch which has all of the patches touching all of the
> different pieces.

b4 can already handle that if the dependencies are listed.

> Another approach might be to post it as a single series, but different
> mailing lists and reviewers get cc'ed on the various patches in that
> series --- and everyone gets cc'ed on the cover letter which also has
> a pointer to the unified git branch.

b4 can handle that too as long as all the patches are in lore.

> A lot of this really depends on whether you are asking for reviews, or
> whether you are asking people to apply the patch series in their
> subsystem trees.  In the case where there are a large number of
> interdependencies, they probably can't do that via patch series
> anyway, and it might be easier just to get relevant ack'ed by and then
> send to Linus with an explanation that you've gotten acks from all of
> the relevant reviewers.
> 
> In truth, this case is actually pretty rare.  The more common case is
> where there is a single set of changes that multiple patch series
> might depend upon.  For example, there might be an set of iomap
> changes which will go on one branch, and then various file systems
> (xfs, ext4, btrfs, etc.) might pull in that common dependency branch
> with the iomap changes, and then put their ext4 changes on top of
> those.
> 
> In that case, what's important is not just the base commit id, but an
> explanation of where to find that base commit.  Normally that just
> goes in the cover letter, in human readable form, because I don't
> think we have a lot of automation that tries to deal with that, as a
> subsystem maintianer, reading the cover letter is just fine from my
> perspective.  But if someone wants to propsoe extending the base
> commit with a repo and branch or tag where the commit can be found, I
> guess we could do that.

That would be nice as it shifts the whole problem of applying a series 
to the submitter. 

However, I think there would be new issues. The base could be old or a 
stable tree. The base could contain a commit to disable all those 
annoying warnings or disable all the failing tests which then affects 
any testing we run on the series. But all of that is probably much more 
rare than the number of series that don't apply today.

Rob
