Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551400;
	b=TOgQSp5iCiC6g+ezdOBNwfGFxnaIBG+3Mgx7/D9QBwrd5y/3GjqSPceeWPQC0+NalkH5
	 Jg63XZBUEcq7PoQctETB6h2AUxsZcgIIs4rE5DaoinRNmfHIHysJeZAZS1WCBhovQY3G4
	 LGBA2pUbgrQscFVqQXxloHFk97v6zQ2jfFRq+Mr4lnDz0MbzyfRxp7dU+aaF8TV6BMTiE
	 noTHQ5Sfqnm5sXHXX45K05zVnPdd+drpmUyemXBylNUueofT0cydN8SdJG2j0rb2ICZqL
	 Pz7bZxSOFLTxzM6hMxXuSFxuyziQqwdAUpnBjuqqoQxo8aP8jHbhnVyxdoLORTMS8EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=adBKmkAuQPG1pNEqNQsG9z5fLXrMmEzel894oEpnrT8=;
	b=g5V0DZLaZDxYB2j6R3lJ75SR4K7FmITAxg9aeo/L5e3ZFeTmd3s8Tp1Z97Xuk222TIjv
	 +zUhy1AvvSAaeoEmFNqAJ2MvMLS0vcghomevPqbN1L6vbbhOMd4+UiB9LOMQ5S9B9dgh1
	 MkYfxYZ5JFBBOVIwcRTUznqsZ6QzmkkKG5sCLH8rxeMEhA5aovWZN+zkn8lIU+Xlo/dyJ
	 +K9hfXIruO83hfoZyWKotwAU1FHYbiNx345NwkGEUapTsr/XgBZRSXEbf9WpaxHaHDvFn
	 ABhM/RAslKTB73PTWFmB1yQ4Z07XbFTwZDUYx0VaO0S/f6ORpVAwl3DcUMkwLHz2zsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UHDGXmxu;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UHDGXmxu
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69L2tfaT032022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 22:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792551351; bh=adBKmkAuQPG1pNEqNQsG9z5fLXrMmEzel894oEpnrT8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=UHDGXmxuazjo9kg0UJBMosrzyJJQ0GTYgx9rT8vBbYtt1yEdHYvoklxa4vdyHRQnJ
	 6vDWhg5S/uuxmRw5coSoUvvHFJe2htO1nXFxGFCZg2EmlLNIVkfZRukUG3QOBhEV/1
	 6FJQnYs/Xqcd+MSvYsgkwGArnqXakd4fNMAWvyFh+Gdg17IST3YkGJfqF+KkkUdqQ8
	 rYfUII2iGEx0y+XqD85X5xCo6r1q16/MXlN7GtZvLza03pIAuKtNLE3us7XLz2lRa7
	 Q3gRg43M+YPrdYwYM0ZWJSc4ZM1FA8Et4o2GES5cPhiJJsblvciW3SvaXwm4g0WZ2Z
	 IIznWg5R7Njjg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 04FB821CF0C7; Tue, 20 Oct 2026 22:54:41 -0400 (EDT)
Date: Tue, 20 Oct 2026 22:54:40 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Justin Stitt <justinstitt@google.com>,
        Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jori Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atggaWq0EU6Km8r0@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
 <20261020211532.GD15441@killaraus.ideasonboard.com>
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
In-Reply-To: <20261020211532.GD15441@killaraus.ideasonboard.com>

On Wed, Oct 21, 2026 at 12:15:32AM -0500, Laurent Pinchart wrote:
> I fully understand that many maintainers currently feel they're too
> pressured to invest time in the next generation. We need to find
> solutions to make that possible.

One possibility is to create tools and/or procedure to amplify signals
about which newcomers are most likely to become the next generation,
as opposed to someone who is just sending drive-by patches.

The reality is that the vast majority of first time patch submitters
won't become part of the next generation.  So if we are getting 10x
the newcomers, if we can be more discerning about which newcomers we
invest in, the project won't die, even if we are ignoring, 3x to 5x
the number of newcomers.

> This is something we really need to improve quickly. Over the past week
> multiple active kernel developers asked me if I thought they needed to
> find a job elsewhere, thinking maintainers will now ignore anything but
> perfect patches and dismiss contributions from developers who don't use
> LLMs. That's a wrong impression (at least I very much hope so, and you
> clarified that you're not advocating for that), but it's a disastrous
> impression that many people got from the maintainers summit and the
> following mailing lists discussions.

If someone is an active kernel developer, presumably they already have
enough of reputation that they won't get ignored.  The issue is really
going to be newcomers who don't yet enough of a reputation, not
"active kernel developres who are wondering if they need to find a job
elsewhere".

And if they have a job, meaning they are in the industry, hopefully
their employer is willing and able to hire a more senior kernel
developer with a reputation in the industry to help them out.
Fortunately, certain companies like Oracle have graciously been
releasing a lot of such talent on the market, so these people *are*
available.  :-)

A senior kernel developer will be able to help introduce more junior
developers to the community, both online via e-mail and at conferences
such as Plumbers.  More importantly, the more senior kernel developer
can help the more junior developer write cover letters which better
motivate why a particular patch is important.  Half the problem is
that a lot of the "AI Slop" patches aren't particular important, and
in some cases, the business case has been wildly exagerated.

(For example, there was the patch which claimed to address a very high
severity "one click exploit" bug --- but the exploit required (a)
tricking someone to download a malicious file system image, and (b)
running a fairly obscure "tune2fs -U random" command on said image,
and (c) be stupid enough do it as root to justify the astronomical
CVSS score.  By calling this a "one click exploit" with an extremely
high CVSS score, that engineer and their company has been forever
tainted in my eyes, and you can *bet* that I'm going to take any
patches from them far less seriously.)

Anyway, all of this might mean that someone who has zero prior
reputation, and doesn't have the $$$ to attend a conference, and who
isn't able to get a job at a company where a more senior kernel
engineer can introduce them to the community, and who can't get a
position at a mentorship program like Outreachy or GSOC might have a
much harder time to get a maintainer's attention.  Yes, this will suck
for some newcomers; but so long as we get enough new blood from other
sources (such as new college grads working at a traditional Linux
company), it doesn't follow that just because we aren't engaging with
*every* *single* *newcomer* that it spells doom for the Linux kernel
community.

					- Ted
