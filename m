Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472AC3168E6;
	Mon, 12 Oct 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821766; cv=none; b=Y/4jp59oIGesNB1PEmcjIXLRDBvGwhBLqusySBjflFOJ2Ti4zeub53phSEurEgnsovnNRizNTL6bjeYZdNoBDlzYpuojtKWc0t43rmYQtNiLyjdXS6fFu0bylV2PCsJG70AuEuaBapZDr1v+e8u6X/jCh6v34rzVAaZDCtjH4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821766; c=relaxed/simple;
	bh=2cbo54MGpBaueIUl7o4jE5S50HqEBGpfnp4KoAN6TSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMSrJynROtQIBsaBemvFtSAk/UFW27Z1rm+bgV8EKTRbLO6viwvTFy+gTPyExE8mhojaVVtI2jL9LqvGe3Yosp82ceKCwPm0FzqfMM7VVbfkgrmJ/xk9D/xm4pNJxcn4Yk/2z1QUYCK/bmHx7pf2EvjdXgS2NMrV88pC6hYWgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loKBHv8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loKBHv8X"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 671671F008A1;
	Mon, 12 Oct 2026 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821764;
	bh=wjNrV/AK5YGHtGX5al4ItV4ojqgiUZomNBfVJK8Ifo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=loKBHv8XXdin9WrxJP1SW9Ny8z0+FpOn23nEDQEONKT70F5eME13umOQEliGViP81
	 u+wUQIwq6Ncns+Esp0uJ5d97EiScZTQhQf++veED/rD52WCPYRWVAc3wiqJNUIQ4Us
	 OEe4FdDoDoeimxwSxomzoQYC7sJ5N3QZCBAQxi4IONDnywD4NrbOksSaINTdo3iACu
	 Rb93fFwrl08zzKQ+KRy7YRKZrCRsNAQK0lQoIh7Du6T5jGok1CgAOUUICRbZuJM2Mb
	 9vvbD0xeWZqepHMmaa/OEDTvFJWkjdsitL0BTKakw49wbVxyft8kdfDr8Qx9qJooHD
	 JEo0HdQkrRxwA==
Date: Mon, 12 Oct 2026 18:15:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Albert Esteve <aesteve@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
	David Gow <david@davidgow.net>, David Gstir <david@sigma-star.at>,
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Message-ID: <as0HujW2cskdsHqd@levanger>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
 <aspYFzgcxfOvOUrZ@monoceros>
 <asyw827yeYmzQflV@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asyw827yeYmzQflV@redhat.com>

On Mon, Oct 12, 2026 at 06:05:46AM -0400, Brian Masney wrote:
> On Sat, Oct 10, 2026 at 05:31:55PM +0200, Uwe Kleine-König wrote:
> > On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-König wrote:
> > > For the procedure to actually sign the certificates, see
> > > https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all
> 

before too many of you are struggling with uploading the own key with
the new signatures as I did, here is what worked for me on Debian:

  gpg --keyserver keyserver.ubuntu.com --keyserver-options no-self-sigs-only --send-key KEYID

And you can check if that worked by visiting:

  https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=index&search=KEYID


Thanks to Uwe for the whole lot of hints and patience!

-- 
Nicolas
