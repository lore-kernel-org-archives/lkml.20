Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150110;
	b=0MwSRTR7lZkXTWUIDZIsnv9ZclnQddDYm4b4L8i6XrrSuqkqeRlMMkLEfQI+NiqI2tsd
	 Zcjc/Qg+JnbaNPQbw9W1kEEjgzJNgopXy+ndcJ5sibEpca/0MEln53S9bvpc0pSBrzybq
	 gIRd9u5JtD03tSFqeAbN9NCBT7cWU2Ls/sQIH76DJyL98enxVytvtoUMrYd3kEJsNNJxW
	 8RBOhHnx5R6AqKS1yvkinFdkM1XziSxir5Go49daOBur5mmA0EoW6x6aRpwP8hgFwNGEO
	 dv83bjT59HY5jpkMP27sYlCLKuFVIujFLu0AROJ9LoSSD102ga0XdTV7OfK2vatAYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bm7wec5B1UFJK2Enj5zENUBnAS6DiTmj+CBBwH6eJIY=;
	b=38daqK/+aQAJtIHqO5kglGmsHWJS5PbUMhGQortuPahF2s+Pz6aUEtNV4cBcLjWuS6C4
	 yCwN7KMxsB8V9jp56NjqZnhw7X1+tCzy02yoYOp6T8V5DsgrPY8qDd25kfo/uTf8Lpex6
	 hy2BIAWUhBzcIhy21tGnxofwPMXx2I7IQF8w7pKi4Jbj2g5X68pBik6mMZVXoRSjwinJe
	 rI8ef0V3PZRPYHV0Be02PhNZzIhakoGhuqKpWk4JHOF8miuOM4D2HOxuLsKWhLRutVKZC
	 koUPDG7y+0+mXKhkdRsHdDjVvjeSztEp1xeow8uI1beo47S2LIXfJ91sywTIxbpztlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=QWCEa5r6;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF97F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=QWCEa5r6
Received: from macsyma.thunk.org ([104.133.198.41])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69S1ENuL016217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 21:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1793150069; bh=bm7wec5B1UFJK2Enj5zENUBnAS6DiTmj+CBBwH6eJIY=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=QWCEa5r6aHnQVDNXR26SZ1h5zufpgEkvKqpUqIXTkQq5YbtavWp5uXTRxqh7u4ucN
	 5WZxNprEspfbmtUVcSg9evG1NB/veAHJql0TU9SSNsdoBrUT1diZGb3Y3Z59CNQTjc
	 3drrpsVmiGadf2cYndUxZgbIiExpy+GzfIOJBovWkBTKSKcwel2d2dFAnY8WWt3EV/
	 ELfTsRZ72+Mg+53LkySENxC2Xbh1mNp5PXFdmWIVAEhkzqGGUVfBdyHLdAJHddGEne
	 rIXFXXpimKsi5sjTRYOZqcPc8l1dT3mAmcGBKgZQ2Ar5yL+KI4pGLVwFGLd74ByGrY
	 cnMMzeLteGG7w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 9FF442321DDD; Tue, 27 Oct 2026 21:14:22 -0400 (EDT)
Date: Tue, 27 Oct 2026 21:14:22 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
        workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <auFH8o9FbxprB40A@mit.edu>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
 <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
 <20261027122346.GA2133989@killaraus.ideasonboard.com>
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
In-Reply-To: <20261027122346.GA2133989@killaraus.ideasonboard.com>

On Tue, Oct 27, 2026 at 02:23:46PM -0500, Laurent Pinchart wrote:
> > The problem boils down to how to present work that touches multiple
> > target trees, and where some parts depend on other work that is
> > not yet finished. Do you post it as single series, so people get an
> > overview? Do you split it in multiple small series (which may still
> > have interdependencies), so everybody looses context?
> 
> There's no one-size-fits-them-all solution to this problem. What I want
> in those cases is information provided by the person posting the patches
> about the dependencies and where to find them. I think there's value in
> specifying that information in a machine-parseable way.

The problem is that "one size fits all" and "machine-parseable way"
are in tension with one another.  One approach might be that the
patche series fragments might be sent to different subsystem mailing
lists and reiewers, but the cover letter might include a pointer to a
unified git branch which has all of the patches touching all of the
different pieces.

Another approach might be to post it as a single series, but different
mailing lists and reviewers get cc'ed on the various patches in that
series --- and everyone gets cc'ed on the cover letter which also has
a pointer to the unified git branch.

A lot of this really depends on whether you are asking for reviews, or
whether you are asking people to apply the patch series in their
subsystem trees.  In the case where there are a large number of
interdependencies, they probably can't do that via patch series
anyway, and it might be easier just to get relevant ack'ed by and then
send to Linus with an explanation that you've gotten acks from all of
the relevant reviewers.

In truth, this case is actually pretty rare.  The more common case is
where there is a single set of changes that multiple patch series
might depend upon.  For example, there might be an set of iomap
changes which will go on one branch, and then various file systems
(xfs, ext4, btrfs, etc.) might pull in that common dependency branch
with the iomap changes, and then put their ext4 changes on top of
those.

In that case, what's important is not just the base commit id, but an
explanation of where to find that base commit.  Normally that just
goes in the cover letter, in human readable form, because I don't
think we have a lot of automation that tries to deal with that, as a
subsystem maintianer, reading the cover letter is just fine from my
perspective.  But if someone wants to propsoe extending the base
commit with a repo and branch or tag where the commit can be found, I
guess we could do that.

       	      	       	      		     	   - Ted
