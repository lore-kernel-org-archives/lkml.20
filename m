Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7454EBAC1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563459; cv=none; b=Lb2hc5P7qcGqoN0pzSmS7sZ0shNk+UhhcRjSTTiBsB0uUUh5fTGtucGZeGTQhpqvuzn2UgYaDJWUBHeWcLA1Idfd6uxbZCKUWFOTQMpkQRUEqiVErqX6zskeS0IKH4KS19+e0XcGLM5UIwNhxTfMy3cvjrxz8PtW969Bxe7vEjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563459; c=relaxed/simple;
	bh=tcmgkuhiNN17EugX4RUpYEsyUNnSbw6ABrqH4Thixe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6wFYCVcfxRFv1zMoZd/rNDbX/VhxiiSajCGPaviPPhLhXbp+qDR8gHBxgCTAeGGwb6W2O/ze4aXAwnMlNwTBLmV8mkY4VaQQa1PBXzfCC1+XaWVQMInVDo/hwpqGKSfaNCI10g/M6PZwe64JXDatJ3ymNh8F4KZtdueNWVQwuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=OIqWkl5r; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="OIqWkl5r"
Received: from macsyma.thunk.org (99-196-133-108.cust.exede.net [99.196.133.108] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 699GUAvb004081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Oct 2026 12:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1791563429; bh=ZM0CvUeJVuI50r1AFpimp14FZHjiiFE5U0fKRuwYWA0=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=OIqWkl5rivkO9/94TUUQ+4lRjfaFQaqIcdZ8GYc97A4RclY6iBe/HBRdaV9q+YQ9E
	 Dz48C7cRBS2bxqAsKVQRQAatJEbMlVDzwIZbc1VAn5Ba8v+M5Uo3iUMaAR6j1QVKcw
	 sJJcmNIgsOGrT4TmiE26OOXpebxfsYsWiWhCMEfuNPTC1H97Z4YgYRL2qU72jFxpYr
	 +Hnwpx/r/ezZacryM/AB38EtA0Ol5kGBesLWiymt8lKM/yjb8rd0OJQxxvSffa8QAG
	 GZMHfDMHZ7LlP37VCyoEidtWSw+hEXAWO7Gn+XcJGPp1uoVSsFfDmaQDPP+BWNQfoe
	 QegKAK+8EadaA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 8D8C41FA0BE7; Fri,  9 Oct 2026 12:30:07 -0400 (EDT)
Date: Fri, 9 Oct 2026 12:30:07 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        broonie@kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <askTmFZC6RJKAE_p@mit.edu>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261009094237.GA693830@killaraus.ideasonboard.com>
 <asi91eAf5veKEUA3@laps>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asi91eAf5veKEUA3@laps>

On Fri, Oct 09, 2026 at 06:11:33AM -0500, Sasha Levin wrote:
> 
> Ted Ts'o asked if we have a way to handle incorrect Fixes: tags in our stable
> tree work, I pointed out that we have LLM workflows to help us determine the
> correct Fixes: tag when we determine when the issue is first introduced, at
> which point other folks showed interest and asked to share it.

The context behind the request was from a conversation I had with
Hannes Reinecke earlier in the week at Plumbers, who told me that in
his estimation 15-20% of the Fixes tags were actively wrong, and were
often due to contributors running "git blame" and just looking at the
first commit which modified a line touched by the patch --- and
maintainers (including myself) not having the time to verify every
single Fixes tags, or adding any missing Fixes tags.

Hence, having some help, either as a standalone AI skill, or as part
of a Sashiko review, or both, to make sure Fixes tags are correct
would be really helpful.

What follows from this is that for people who are doing backports to
their own kernels (if they can't depend on LTS kernels), especially
for commits before we have Maintainers regularly using the AI skill or
Sashiko can start suggesting proper Fixes commits, they should not
depend on the Fixes tags to determine whether their production kernel
might need a particular security or other bug fix.

						- Ted
								
