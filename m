Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996041D4FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071536; cv=none; b=KRycW/ubpuYr07+dQMz8HIKcPbwTXpS9mLZFGW999k5vV6Rhjy7Oc+NocTPLqgXSx/tjByOPH/JxZ3G5Uunj/zRlfIHw2dJ7mN14eofLHnksh6l1mSMWRdHVKdBdAcFQFmuDpftv5HRWp8jTV65U3n3TOFvYZiPfingaEeMnAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071536; c=relaxed/simple;
	bh=A+P/uS/SBd4J4/aBwwRg95rS3f18qizD+C+/cjUGpaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtYrAuqfqMhYNBzU03KVy4sAtQMmeyxcVGkJ5Ts/FEWhtl+BouRyEXhg+Vo+mm7jzdrjwed+TfvgrqWBJ61hX2Dmd8taROAbRmxf+KbA/nNnPur8OkgmmXbNVUsUMSIWoB6kUC6Nwm/MnonB1qZKCnMZ9WCeYG2gNLUdo3B+QS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Sq9cqj4D; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Sq9cqj4D"
Received: from macsyma.thunk.org (pool-173-48-111-204.bstnma.fios.verizon.net [173.48.111.204])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69FDc3jc025529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 09:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792071488; bh=hGUXqsxkhpbopsDlKJlrjUnxIoRHN48sbeSfA7LeTlI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Sq9cqj4D7nlHPDyTVk+2j9dXuVoKcFcl3IGICP3e1Al6mNOXTYBUCIb936XQDUwCq
	 r4zK5/zFOH3Y2vyHCHPDDKqU+c9vZ/BKOarv0br7E3gi7j0HgSPJcTwlUjjMmkZVB/
	 rUdQZISLbLELLwhe78KGN1cNKLB56uGm+9TXJiy2bBrExF50h3tEjTQmNTQYdRZo9g
	 jipVVtFSCN0unNP13QO9xULlpgP3xeddJ4bnARQsCXPLy7KTBearV6OjHWP2sLkh2j
	 35sfzGBnnThaxMrJ22gMzTIX1d3AAWtD9n3PGB6AutVhruGXlfEy3llP8T6UrO6oXz
	 IGLUcC7IgreGA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 5F87E20F151E; Thu, 15 Oct 2026 09:37:03 -0400 (EDT)
Date: Thu, 15 Oct 2026 09:37:03 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Kees Cook <kees@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leon Romanovsky <leon@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <atDWaGJegsI3_Q8K@mit.edu>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
 <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
 <202610142149.C3CC39B22@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610142149.C3CC39B22@keescook>

On Wed, Oct 14, 2026 at 09:50:47PM -0500, Kees Cook wrote:
> Exactly. And the rate of frontier model improvement has me convinced
> that there is no need to spend any time writing documentation to be
> consumed _only_ by the agents. If an agent gets it wrong after reading
> our existing documentation, ask it what would need to change for it to
> understand it, and then see if that makes it better for a human too, and
> send those patches. :)

We might not want to assume that everyone has access to frontier
models.  At the very least some people might want to use things like
Gemini Flash instead of Gemini Pro, and there will also be people who
wants to use local LLM's.  Even if we don't care about usage of more
modest LLM's, there is still an economic (and environmental!) reason
why we might want to make sure that we promote token-efficient usage.
We certainly don't want to assume that LLM's need to read *all* of
Documentation for every single prompt.

					- Ted
