Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA749D595
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401764; cv=none; b=pFG8Hi5WXnfHeXpH62TcR3qQN/Si0hyjZ39dlgEN/RXc6KYAboCET31H+CVcVQvfTfugMRZZWiqG9rz8C2pl3LYNUFmXAml4Z//eHAK1g+7CQbr0dzsjzTw3bh+GYUclECX+j6YDOqc0l2yDpdGPrFisvEjM6qNGvUOHzk+k1fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401764; c=relaxed/simple;
	bh=cYCubSM0ph02WkC2ZS38nCooqeUAOCqDt4MTrBrVstg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa8gkJg4GfrIrOVw2xsxwL0ahPc86XhM/OSBhmAuOPV7V9Cu7WmuB0RpNCFwvqEZFEQC7FWxdjY6TR57ffG+oH8l+M66DuvEayPkNddw07uZRNEIe5WG8YS0rVQScnquxxOGvjK8TAtfMCRCl13b2m4KMlsTJtHohx8mkc6iIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4fasP9n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4fasP9n"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A44015BF;
	Mon, 19 Oct 2026 11:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792401633;
	bh=cYCubSM0ph02WkC2ZS38nCooqeUAOCqDt4MTrBrVstg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4fasP9nJky7mpCWRRtp0z/GTPLbOnetjws1WXlB7JSjmHk3wqOanIqV5Ddv7S/X5
	 RCxDnRenxEItlwLbWtT8NF2yjuVRL8Iwymlrv9/NnU3ZVjQHJy2QetXWHfLUZVMXg9
	 6ZpZnp5rHxswxVaFQ0mYb7deb67p0I6NikdYhaVg=
Date: Mon, 19 Oct 2026 12:22:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Albert Esteve <aesteve@redhat.com>, Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>,
	David Gstir <david@sigma-star.at>,
	Eric Biggers <ebiggers@kernel.org>,
	Eric Chanudet <echanude@redhat.com>,
	Francois Dugast <francois.dugast@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Johannes Thumshirn <morbidrsa@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vlastimil Babka <vbabka@kernel.org>, Waqar Hameed <whame@whame.dev>,
	lpcosse-keysigning@baylibre.com, users@linux.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <20261019092237.GA749420@killaraus.ideasonboard.com>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
 <aspYFzgcxfOvOUrZ@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aspYFzgcxfOvOUrZ@monoceros>

On Sat, Oct 10, 2026 at 05:31:55PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> the first few signatures appeared in my inbox and on the keyservers,
> that's great! Please continue.

I've received signatures from three people who are not on the list and
didn't hand me a paper slip separately during the key signing party. Has
anyone experienced something similar ?

> On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-König wrote:
> > For the procedure to actually sign the certificates, see
> > https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all
> > certificates on the list is available at
> > 
> > 	https://openpgpkey.baylibre.com/Fei9keem/keysigning-lpcosse26.pgp
> 
> I added a few "latecomers" who distributed paper slips to that keyring
> to simplify signing for you. These are also on the signature graph[1]
> that I'll continue to update from time to time.
> 
> I also intend to send the certificates that are already tracked in the
> kernel pgpkeyring to the keys mailinglist in a single mail to make the
> new signatures available there with minimal overhead for Konstantin.
> I'll do that end of October.
> 
> > If questions arise, don't hesitate to ask.
> 
> That's still true.
> 
> Best regards
> Uwe
> 
> [1] https://openpgpkey.baylibre.com/Fei9keem/signature.svg

-- 
Regards,

Laurent Pinchart
