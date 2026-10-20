Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524449;
	b=ihSEMs3Sqx6kvRUIONbys1OHOQAjzrLyTUkgFCdika+VZNekZERLbYFY+McbQ0C2JOY3
	 qlpe4oSunnb7eIo82O7Etqzx6PHPuHYoMrVlaaU0jX8ZpdPlKd/2aMeec6M+goqUeishS
	 p11DbkTDVrvtO/1djlkIIoOYq6QPsJnPDMK9XRTbWYYeXwaH1U9rcOx5NwGE6eYMP7nP3
	 rPeJgXWnkJoLeYKV1jqVqm0B3B7zPwJqbb/9yB0ff0Jm/XhKnzMsHTWe5U1J173xnyzNK
	 XmT5dDC8V/yrcGaSWrXYdCjFmzX8P6djVUeQqjt1i0G/VGuq2kLibwG1Dc7vGVfPGAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524449;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=QIGeEKCQuZuord0JhvxPnP/fBYI1EB4+5HsRfQpynUI=;
	b=a5DF5D3Tu3EyvKKtCAwtRavbEhcBXcwF506DuCqe1q7x3ZVxIjnrBs4i5RoNik6I1Y4k
	 oAksmDJU6irx8aqxEEdraVazyVsOAXgXSeEWeMyw5N2NPSZRGBKpzl8A4gophJfDD7iZ9
	 2WJvXu4ZPvrNU5sxNTsTtJ2x9RVSlwq/wPHS+cIhPKHER2oQp9w5lty86JJ3wvTc+oIQ+
	 Cd30mpgp7LiPp0KCywNTgeZi4LNpGgbCKqjoj1oSsnsEbUmaiGwoG+69usLymYOIVFrNJ
	 OaNT/KLEsXkiXKo9jab1TiFjOLHI25gu6Urlm+AEsojEiundNtqPKJorL2wup7zTeog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=LrITyJNo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.122
Received: from sender6-pp-g122.zoho.com (sender6-pp-g122.zoho.com [165.173.180.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAB606A323;
	Tue, 20 Oct 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFAB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=LrITyJNo
ARC-Seal: i=1; a=rsa-sha256; t=1792524430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZhX4XPPBu3ifKs3j/ZjE7zifF07YpzV1y0BF/UMOv4VEs2eY4LXEMqnywJVjjAc9u7AQyXdsH7B6ccES1dw6F/0LHo0kQbYvl/gBnPvNE8AR80h6p17+eI76Pc7pR4w7971Cw2pI2R2TX4cfcYFjNJndn+t1BDx6xIyRDIXdUgU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792524430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QIGeEKCQuZuord0JhvxPnP/fBYI1EB4+5HsRfQpynUI=; 
	b=YIogthycvxzQHM7b1DX4mtUXSq0LF5VOurncZ9DFj0uFSi2tI5qJ3MdeMtAbGqoSpwdefvQ9jb5L8mD4VWUxhTeVieB7V0z4jnAoUEpd6/BNOGKVVJt9v8RJ6ESK7qZB2dudC+jTtPIoa6Ea2krIjV+iIiMa6W8arG5v0hlDj3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792524430;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=QIGeEKCQuZuord0JhvxPnP/fBYI1EB4+5HsRfQpynUI=;
	b=LrITyJNoQiH3elSOnWyUMGkaMMfRvcLCYuDrblZxmGh7V/VZ1/pMQ+b+tLxvkt9L
	NwtKUVvXu9nQdvmFV5f/3cROEaYo1xG2cMwqsAaj9ZqpdavOaXNzn3tL7wu+nHB/bzs
	KArRcSO+iJi0W9ZmBABulqNhoWktTrVCHhfkiDnLKwcoCHXe54BZRYeZaQRf7VTYXgm
	vcoACh/o4kdC1wvyufY49VtbWyskix3WfLm9QuthJail8CsOgYCA7e2p57dR/S5vhx5
	KcLy7vsQp+N13RaCFwmGV8bIfONrS/vHO7JRtiFTk9eeMQr55dBVPSqFJn8Lw7yLtOx
	Wk6l2I0olA==
Received: by smtp.zohomail.com with SMTPS id 1792524429039410.2113846344032;
	Tue, 20 Oct 2026 12:27:09 -0700 (PDT)
Message-ID: <401ff326ede6d052751a3b624aa9c1ce57377cbc.camel@rong.moe>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Add dB scale quirks for AB13X and
 Xiaomi Speaker Mini
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <877bjch62p.wl-tiwai@suse.de>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
	 <877bjch62p.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 03:22:04 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Takashi,

On Tue, 2026-10-20 at 15:09 +0200, Takashi Iwai wrote:
> On Mon, 19 Oct 2026 22:18:21 +0200,
> Rong Zhang wrote:
> >=20
> > I recently got two devices with insane volume control, so I tried to
> > measure their volume mapping and add dB scale quirks for them.
> >=20
> > PATCH 1 collects the code snippets for dB scale override into a helper
> > function, with unified info and warning messages, and also deconflicts
> > playback dB scale quirks of DragonFly.
> >=20
> > PATCH 2 applies the MV-SILICON linear volume quirk only to the affected
> > mixers, instead of the whole device.
> >=20
> > PATCH 3 adds dB scale quirk for an AB13X variant.
> >=20
> > PATCH 4 adds dB scale quirk for the Xiaomi Speaker Mini.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Rong Zhang (4):
> >       ALSA: usb-audio: Unify dB scale override
> >       ALSA: usb-audio: Apply MV-SILICON linear volume quirk per mixer
> >       ALSA: usb-audio: Add dB scale quirk for an AB13X variant
> >       ALSA: usb-audio: Add dB scale quirk for Xiaomi Speaker Mini
>=20
> JFYI, I postpone this for 7.5, as 7.4 merge window was already opened,
> and the code change amount is slightly too big as a last-minute fix.

No problem, and thanks for your review ;-P

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
