Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690303B8BA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486788; cv=none; b=LUPoOq+2j2xIvRUh0bZQxvRLy2IQTIgNw/mPP/tK7YQb0TprP4KVT/4245NGQSvJoD3Sz+eCC7IYjzMFntNQcL9JUCfH7N+uzB6TrwwlFUSQVdOMwXXfembSHGL6rx2TJP27dAgxC/UOGhondy4Ilr9dCaWmDWYRPBffiiYR9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486788; c=relaxed/simple;
	bh=EsG+067bb217qUQEWA8/hszA9nlOO111GMkVPl6tJVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijwJKj1A0Ex2cdwYBTR4wO6CrRybfjz7XDW0XqN8UAbQKF2qipSvBBM/lJ95jxt/qWYpfuntcqvZAZTxM2fr8yDjudv/Zc/D7U6Qjz1a2p07CMtjEc4XbWsbPTAxBOpgkN56cxI5WzqMFKH+OFxRUokyCj/PiAucNbO/FoZ97WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: dlan@kernel.org
X-PTX-Original-Recipient: docular.xu@gmail.com
X-PTX-Original-Recipient: pjw@kernel.org
X-PTX-Original-Recipient: palmer@dabbelt.com
X-PTX-Original-Recipient: aou@eecs.berkeley.edu
X-PTX-Original-Recipient: alex@ghiti.fr
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-PTX-Original-Recipient: spacemit@lists.linux.dev
X-PTX-Original-Recipient: elder@riscstar.com
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 127DD2059C8;
	Tue, 15 Sep 2026 17:39:33 +0200 (CEST)
Message-ID: <7f227c6bc72eb93096e77e6158e394b79801e997.camel@pengutronix.de>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Alex Elder	 <elder@riscstar.com>
Date: Tue, 15 Sep 2026 17:39:32 +0200
In-Reply-To: <20260910213442-GKE2346@kernel.org>
References: 
	<20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
	 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
	 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
	 <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
	 <20260910213442-GKE2346@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-09-10 at 21:34 +0000, Yixun Lan wrote:
> Hi Guodong, Philipp,
>=20
> On 10:09 Thu 10 Sep     , Guodong Xu wrote:
> > Hi Philipp,
> >=20
> > On 2026-08-07 19:51, Guodong Xu wrote:
> > > On 2026-06-03 09:34, Philipp Zabel wrote:
> > > [ ... ]
> > > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > >=20
> > > Gentle ping. All tags on this one are collected:
> > >=20
> > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > > Acked-by: Alex Elder <elder@riscstar.com>
> > >=20
> > > Could you take it through the reset tree when convenient?
> >=20
> > Second ping. This is a MAINTAINERS-only change and carries your
> > Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.
> >=20
> > If it is easier for you, I'd like to ask Yixun whether it could go
> > through the SpacemiT SoC tree instead. Unless you object, I'd suggest
> > we go that way if it has not been picked up by 2026-09-17.
> >=20
> Sounds a good plan, let's give Philipp some time to respond, if he still
> unable to proceed by that time, then I will pick it.. just want to avoid
>  collision that both of us picked accidently..

Please feel free to pick it up into the SpacemiT SoC tree.

regards
Philipp
