Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18765208C0;
	Tue, 13 Oct 2026 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911303; cv=none; b=LVb07loNYiq1l5E5ZGEVtqH2iJEpvVtNZheHNJvDYl2fonnrIm4FtZKIgK0X6bs24tX8GiNxZuyhVMMzJtDb1V309j9z0+AzhGj31sAW4Bdi8YShzSq77yhrV5jpupe1wG9n9rGniv0GokL6ItouaBtYZqPEvL2yo0IlELSfOdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911303; c=relaxed/simple;
	bh=8nbflafELeQMTAbQEbq54eMNfI0wxGYkx/1EViVCbI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUUzRzo0gPWX2z4tM7/QMc2rDmL0GTacb2MH3JrM+yyzxB7V0TusmIPO/1JexTNgP/mETUcQjhpbnrcYZ3tfSQRje7ey1muxK1yrd+vAPVA7oL6xz4MX1CUF+kGM/vOKvjMfoTSwZ7cpclDhv//zKwyzGAf88qNmzU0aAPg6TGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HKGvXKwS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HKGvXKwS"
Received: from killaraus.ideasonboard.com (85-76-151-95-nat.elisa-mobile.fi [85.76.151.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E652319C;
	Tue, 13 Oct 2026 19:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791911178;
	bh=8nbflafELeQMTAbQEbq54eMNfI0wxGYkx/1EViVCbI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKGvXKwStrpegeuK5C6PP/g89+Ltjx392daQ79DQpCPBpEDFpAxkFOD/WOJXSPYFw
	 H/AW6vDuZubZCj0QeHy7sC9XRm/gg2ffpJzjEBGNk3mxgtjUBGCIXB733FOEB8WkfQ
	 5lRcjS01wNm83osC0yVpAG1gNrVbdRXgp+V+vNjc=
Date: Tue, 13 Oct 2026 19:07:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <20261013170744.GA178151@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <7524f3d6-02c0-488c-be76-23de8afc2b76@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7524f3d6-02c0-488c-be76-23de8afc2b76@sirena.org.uk>

On Tue, Oct 13, 2026 at 04:18:32PM +0100, Mark Brown wrote:
> On Tue, Oct 13, 2026 at 02:55:59PM +0200, Laurent Pinchart wrote:
> 
> > The absence of the tag on a suspicious series offered a low-effort way
> > for maintainers to push back. What's the proposed low-effort replacement
> > ?
> 
> Greg's suggested asking "how did you test this?" or similar, a lot of
> people just throwing stuff at the wall simply won't respond.

I've done that too. I still find it better to have multiple tools at my
disposal, I want to be able to tell people they're expected to disclose
that the code they submit was generated.

Maybe Documentation/process/generated-content.rst is enough. As I wrote,
what matters to me is the disclosure requirement, not the Assisted-by
tag as such. I'm however concerned that it's even easier for
contributors to ignore Documentation/process/generated-content.rst than
the tag.

-- 
Regards,

Laurent Pinchart
