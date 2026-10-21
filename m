Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573988;
	b=vhaHHAyh6e3wRK1HE3CpRCzlAqxg6Zw7S9C4CLP0jnI+5aVJLRFrvlNeF5A2S0NVAkeQ
	 IfW/Jxp6TbfS2l895UMDCvH8ROdcP/T8dLzbqJxG3gkoyOdrtiYGIumecdYRptZsyoaAf
	 pq27CNQfJYEUIjRTn1rsEcW9OOas0ZJ9EGklBmC4h/d4MFO+hRunkfqiIiMZ1zoIyDhg8
	 RqIiCg3Z92NTTEUQrtOJvWxOL3sKuZMcroPu4igf6PaZ6744gnvy9h9ahH57JQT+PMFN/
	 90fiff/P6iydTVJCdmwSxa1gPktpe3oKPaRYcDNt3r7V35dt9aPOD4A2cbhKqtlZcNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Original-Sender:
	 X-Originating-IP:X-ZEDAT-Hint;
	bh=R4jqZPX5alIiyxxB/iHbYUMvL4Tmy64E74qo6XrsUQk=;
	b=3GLMtIepCGBJoS8ba7HKDaWhcY8hsHhlGiHLkq7+boaCEZDIersuG1ubD0lC6tznZSmh
	 hIihb4AMaEs7gdk5o3QTWp0VWvjExswj+pDeNFuT5ldf2yJmj2PDSDTS1VivtFt29kg0d
	 N/IaHwv8fxosw5QzsMq7OxEq1L1CflQ7Bb+hGbrvyvL+qeHrh0rED7g6aoPjU1r9a8Vtt
	 Q/YedudMSfjDTH7bXePVLMUM9zH0vA4sniU60woJ96P9PKPqZIiuI+S07RSdDF8a0kTsr
	 6zqUCgBFeMQWaB7flrfowx5Fgv84PUdKhAn68FAPdWQnxdWexUyKgHm//r9i7WGluyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=physik.fu-berlin.de;
	spf=pass smtp.mailfrom=zedat.fu-berlin.de;
	dkim=pass header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=UlnEftD3;
	arc=none smtp.remote-ip=130.133.4.66
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DAC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=UlnEftD3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=R4jqZPX5alIiyxxB/iHbYUMvL4Tmy64E74qo6XrsUQk=; t=1792573987;
	x=1793178787; b=UlnEftD35DQkGT9rVfeY343RPkWbFjxY5p1GPbr9Q28mwIzmEypv4KykTUmNf
	szkhXTf9cmqgzDBdal+8b1W7futtEYq7oPu5wAvFMb+srOqzchuviYoSMwXpeIeQA5CO76iKM+EIz
	3lElolzaBEK75kD7eMNMaavvknVruiGRJbhY86moG5/EpeYnlLQSPbbo2MEdncImxrvZEc/gknDlb
	xSrwZWe5Y++X+7WvankqiKqXJrc2JPbdY19PkROdzpdp1STfPSKeCdopJ/xVWYZGUCPztu59udVzY
	cnhIlxL0kZo+JNbbT+oWSewRtz+OxHjrnAYj3XNimCQ+E0eQWA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xJSNc-00000001e89-3Eu9; Wed, 21 Oct 2026 11:13:04 +0200
Received: from p5b13a90a.dip0.t-ipconnect.de ([91.19.169.10] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xJSNc-00000003MTl-1uQM; Wed, 21 Oct 2026 11:13:04 +0200
Message-ID: <a0097437824f2ea0b94593770f13e14e92043507.camel@physik.fu-berlin.de>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: paulmck@kernel.org
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>, Arnd Bergmann
	 <arnd@kernel.org>, phoronix@phoronix.com
Date: Wed, 21 Oct 2026 11:13:03 +0200
In-Reply-To: <851e3a8d-dd0d-49cb-8672-5cebc03d910b@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
	 <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
	 <851e3a8d-dd0d-49cb-8672-5cebc03d910b@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Paul,

On Tue, 2026-10-20 at 12:14 -0700, Paul E. McKenney wrote:
> On Tue, Oct 20, 2026 at 08:48:32PM +0200, John Paul Adrian Glaubitz wrote=
:
> > Hi Paul,
> >=20
> > On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
> > > However, it sadly does not permit easy implementation of all algorith=
ms
> > > needing on two-byte atomic operations because there are some systems =
still
> > > supported by Linux that do not have native two-byte store instruction=
s.
> > > There is reason to believe that these systems will soon no longer be
> > > supported by Linux.
> >=20
> > Since this paragraph has produced a headline today [1], would you mind
> > clarifying what you meant here? What architectures are you talking abou=
t?
>=20
> The important word in the second paragraph quoted by the article is
> "systems", which is not "architectures".   To its credit, the article
> keeps this straight, but not so much the comments.
>=20
> And here is Arnd Bergmann's patch that started this:
>=20
> https://lore.kernel.org/all/20260908152808.3928630-4-arnd@kernel.org/
>=20
> The system Arnd calls out is the Acorn Risc PC, which is one member of th=
e
> Arm family.  So not an entire architecture, but rather just a particular
> implementation of an architecture, and an old one at that.  Not only
> that, but if I remember correctly, Arnd got considerable pushback,
> so I am not sure that his support-removal patch is going in just yet,
> as in I do not yet see it in -next.
>=20
> Please feel free to add this as a comment to the article, as the site
> is not permitting me to do so.  I have added their feedback email on
> CC in case that helps, and in the hope that my doing so does not unduly
> annoy them.

Thanks a lot for the clarification, much appreciated!

Relieved,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
