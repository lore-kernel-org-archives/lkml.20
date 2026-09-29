Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C5566C5B;
	Tue, 29 Sep 2026 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711370; cv=none; b=lIQbdnzmkvmg3aDV1JSM1nIzvVgTFRyq+gwkuh0Bax93/VRLK+3+pZL3cc+Ktle+ZV68S/ZYgF3QrMJprjLlnFxebVQYoDQrqrEOtfoo6ZoskMc5/pH6kcATGvHM/YATrvjdL9V7zMCtwQNZOb7NUADF8/8bRiOfzp4o1B+knpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711370; c=relaxed/simple;
	bh=p/pSnik6qfJ3BXcVmRlbnkpfz25VONWPN9lTOmL/LUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4cXXwR9MrlcbPzxSdLSy50TcxBvuglcRhG75RoX0te30gbwSh/ivcjPJ2UPcELn8Jyp8UIMxDYr2tVzuAjp90kndgRYikfLWgKPONTK5xzBpg6VDMI2mT2iU5OMellSGiMoXtHA8C1catFlUliKC8GzXJoxhxBe+9gEkAaQr2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=Vy9rrSy8; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="Vy9rrSy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1790711342; x=1791316142; i=arc@gmx.li;
	bh=kv00LVWtdFcko4iXwZSVIy395iy1ATgYZFMp7dtzNyE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Vy9rrSy8bZoIkqNLsCV+OZkmzv4iNNDPDN7G84Kkuy7mN6h4oGjYXYE+QiOmkp9T
	 84WoMjqiMQILgfpEb17o8NVp3ZjnOwb71v07SQZOZPFLXeI6hjTy2kpPMOb2erHp/
	 /WuihutbENNnb6v+lkgqZgo4FRkB/AkY8QJDD1dy6WhBvbBs+yTTMCbp3/0WVBFeN
	 QEKZ4rTWEwC+IuxhkD8vHnx9nafo+tmUITwIPS74VoEDdFLkpcLGa+NABqWqGZ+VP
	 sNMre1y9QpBL9+aPv+sgswZppqgu+b/lSVbtJbQ92L2Vg1KZBEeqMj0sJwUEzdobQ
	 QQZwtTUIfBej310ytQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbkC-1xQ0uI0SvE-00Rxc4; Tue, 29
 Sep 2026 21:49:02 +0200
Date: Tue, 29 Sep 2026 21:49:03 +0200
From: Christian Ruppert <arc@gmx.li>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>, Neil Andrews <neil@androos.io>
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
Message-ID: <arwWLwa3ir8DN6Ny@khmer.arcnet>
References: <20260919151840.24371-1-arc@gmx.li>
 <87bj9g19d6.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bj9g19d6.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:78bD2x+ifZLUXWuvn8hDJB0W0JN27LaVAgN7rtJfnHoo5CCb8Oo
 ARYYpb0zi0wNw41olEGjhFwFQ1cTgpZh9RDtY56KfKXRdAvKgHIu96G3EHPJJIIe7fdBzgX
 szZRxjS7/RtYcDF9VG/A/ZhuFoMVpJ5tSBReMq9HPx3VV6d9/rYwztR2z3JXrrlZ6KQupIE
 b2Nb5EmjjyTyUkRN9R8DA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j5TVsGa51PA=;ax52b4X/U1vlGkPfZx9A7kueite
 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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 03:21:25PM +0200, Takashi Iwai wrote:
> On Sat, 19 Sep 2026 17:18:37 +0200,
> Christian Ruppert wrote:
> >=20
> > This patch set adds support for advanced mixer features of the Audient
> > EVO4 audio interface. The code is structured so that support for the
> > EVO8 (and potentially other Audient devices) should be trivial to add
> > but I don't have access to the hardware and no way of testing them so
> > they are not supported by this patch set.
> >=20
> > The third patch in the series (Add Kconfig option for Audient EVO4 mix=
er
> > quirks) is optional. Other mixer quirks are compiled in by default and
> > don't provide Kconfig options but as this one adds a few hundred lines
> > of code I decided to provide this last patch as an option and leave th=
e
> > choice if such an option should be added to the subsystem maintainers.
> >=20
> > Christian Ruppert (3):
> >   Fix Audient EVO4 master playback control name
> >   Add Audient EVO4 mixer quirks
> >   Add Kconfig option for Audient EVO4 mixer quirks
>=20
> I merged the two, but dropped the Kconfig patch.
>=20
> We have no Kconfig for other mixer stuff, and most likely the users
> will enable simply all mixer supported devices.
>=20
> It might make sense to introduce a Kconfig if we build each vendor
> mixer stuff as an individual module, though.  Until then, let's try
> to reduce Kconfig.

Thanks, makes perfect sense. Thanks to Faaris for testing everything!

> BTW, do you see an issue Faaris reported for the recent kernel?

This situation is actually more subtle than I originally thought, I
replied to this in the other thread here:
https://lore.kernel.org/regressions/arwVedydsKxSgpho@khmer.arcnet/

Christian
