Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794096438;
	b=hIYZG+Lybom/Hifs4wajIgtV9oEBTdEJ+XL5/45cib9igMkX8JiYnvIdLrZ25PSdNTJo
	 TZNo0cqRkpVCLqy3zIUhfJ19QYiykBJAccuArY0Bionblte2tbKLew01S2ILDeJAd5aJ9
	 laUOtTMvHwjs/ipzyUYTWP2hh1eh5xwV2nYQ3+2AHp8CLDvHHLrXGsIvbBqwrkGcidYGw
	 NsBUFUxNI2AD5LEiMcbMQh8JR9do+3h1k/h+gS7BtPfXtB2Q5eo0pBJASdk3nnDnhW6mc
	 Xc6Dm2YlSRNF+7JBDK9dSXyx3XfXYRoe7PiEeQcVbPRXcmgsht2VHw5UmKkU8fwKhNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aLLoc0xRBwl/ZGo6WGJQ8sG3lRdUqK6Mnkv9+kWc41A=;
	b=S90xprcCofl69fM9FtFmuivSV7hKTRIFwOLoS5aiFOZ6mnGQSRWN3p7u05kE4fMoveDA
	 AbOwAjOgT6tB3dm7wa7Yqe93flCxyPvM3lwjCCStVsV38/z2aVUkgPt/CC7FkXLXPqNsH
	 ALmMz5oEwrw2v0gs2g8ilYKEpW0DXylK9YQtgpBjfYdoSk0z9OiVz15u4hF8L5+GawQwn
	 TvNw6BySfi1xhup8S5oznPFs+1Sv3ut1MTchvsnlKmCZkZuGqvZv2W/Fz0ZRDa6rcmZY8
	 mzS8Eu1ARX9qTsedDzI4YkK8qXafV6fIeNEkv9HR+WA15PEhG2aZWzLBKUBDGKVqR7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZb4taJP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D9D606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D9D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZb4taJP
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso160037a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 16:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794096436; cv=none;
        d=google.com; s=arc-20260327;
        b=UqTQ+MExi0ARe3d3ReJ/l/zmwSYTOv66/dPgVUUdsV7O9MsNQMtQL+vju3Ztv2oULh
         YmAPqFkA+lNzzqC1da7hHywlNQHF6Cl0MZGVepw3IO1FdI+s+EgDcSuKPMxBhE0SYjFU
         VhwUIhk/cB5BTgY7wToPEB6ph90f1DIHs+FnnYMrSEfzefrwTpiErOXv2UpMVBivptCz
         fZpahdFbX6M0Aiqr7ewQViFNyvwUqoW5xd4+c3t0hMj8n2eB1gODtzKbSp9DYxXDs0rj
         k6RhTzOfGZTSRn/4o7dasozzi9y6Hjc57uTgB/tVoXBjIRrUKhbWscvqRxT7SlXRVnxe
         xdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLLoc0xRBwl/ZGo6WGJQ8sG3lRdUqK6Mnkv9+kWc41A=;
        fh=XVrh8xo2m5sZIKR8cTdfz60e7rhf0+ArxlDc5fDk+BA=;
        b=oohIWXaURVvjDZnI41rscLoGqk61QKu4A2yVmiv3HXs+M7E5z4O3u17MYbkbg7G9k0
         GhDWh8mvZJxyajgUQexLa53t+5vB8MIBylA1apCZ6hN9FNsWHqG5xentGIes1wwAvpGz
         FUrFcc7TsNVX0MRlE5nVvFoASCl0bk0M5FAAZaUaOLjfdWCUBAXJvbDDqL3zU1aU68NW
         0SO2ocX7G4Cd/18BiY3YWwJz9yzh2sC5CWQd4ZlZ7RRsu3cXkewaHvWUWoDKW+Zy5Gql
         d9ALGu+qfyuRoFkdx/Gh8661TnxZeOYQnRLkbOwejQ/6KaMWGTuimCYMWZywX+SfpKq8
         Fumg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794096436; x=1794701236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLLoc0xRBwl/ZGo6WGJQ8sG3lRdUqK6Mnkv9+kWc41A=;
        b=AZb4taJP7QgpmgO+zRWdgaGa927bsAhxTloCpxEcsGhNdMqWGVnqKMmKRHAc/0Y1Tc
         i29BzOVJ5ixxRepPjrsRtZVc9XVjymSiUNkj553b9r1QVvMj6KtZOiYgCroS5sdeUvSS
         YzGF2zYyiUjFqJUo0Zcmwa8M7xFnZ2LgYyGoYlrDH/BQHSG5y0pEWt8UO3NLhcmycuva
         241KWSv6edpqhuSAE3S/tG4l0mdC+DgMDYAv4R4dbdK/S5GmfKW2NYKDItz03y53V5bz
         VJJ/UGkteqSsWuwDeVjX7vPx20xI3EuYBoiA/d7u5hKG2nxwxMncRrAyEj1z7BAmVD+a
         xvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794096436; x=1794701236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLLoc0xRBwl/ZGo6WGJQ8sG3lRdUqK6Mnkv9+kWc41A=;
        b=FFdyaziSIN/8M6Qox9t3OaGAxYMnXbFrzHvUhWmr5jGmLhSNcfojhdae82r1g3LEk5
         yWzEo2gtY0m4BSvXn4jzlBSiXdkPZD6TKpO4J1TT19zn36IOi6lt1oRjSD9idY9G6dOD
         2W9q4WiGqUuNzpRnIuxeMmU17k5/LAW8Y96/TkYdBIs7lOY6uFx945VoYiroJNJAg5px
         k0NUMTa06rNfQvgjrng1AedRl0BSGJdt63wSkb4wrNFUvoN0oaKzRdmpOOklbbi8DyHJ
         P4Q2l4kySz9LoJ7gqEXwu0Pm2rLVKK/c7y6HoOuhT5iWdiGvFQWbGaXfT+K/WLRm1rGp
         K/DA==
X-Forwarded-Encrypted: i=1; AL+hErFbxoT+XVn2FgZ38vl9MhvBuNne2N2FdUzNQKFzCvtfRI0goHPdYUJtjW+IfTGQT7ROPJSQRJvXPBbfpyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A/7nGNoCZuGbV+iy8llIILvMwKPEAL0cMKXXQvwyUh+kPYYzx
	kFrCn0ZW6N6zUbbrwgLlJ+CM7sTwhBJVwgTEUa1bdt6iVGqxBWd3ViKLjEWINpjcmwUd/rOoqt9
	3HZMzm7Y5hn+VJpmZLVf3kq2xpoa+J+k=
X-Gm-Gg: AYBFou1rTR/EkcgwQgOCO3p0NJG5RNmCi05elZ+FIam+RINw82Okf2Ejtb+s+/dx4YE
	IaEdttIrpUayTvG7Ei3h5rTcoHJt+feifbKwBysrmsrLzQzCX8LcMHp9IEs4Dn3+kfnRJFHKG3W
	f0PPq+q3QZkgpiAGQ8PksyGczhOkkKdcRDqE5IuAdSWLDuIOCGR2W04ZhkRxgQABOZVV642on3H
	z1KmcpqcXcmntHuaXaUoAyQTchjEuSJJKsowt+2scjp8jU2qJxYmSbfwE9S9K4lb1EuSzGt3tSY
	GEe15x0/DY7NNp/1OKFee8lFf/oU73klplxXkkMRPahcfzYPq0TaIfAfuvmwOXkKyexCXJZUAZO
	sxnjcTsS6wGgctSgMGhmkx46lrL/9Xu3rahkTiBvG2tuuqC6+ODggJCTrQ/WNdk+zFkoLgRDUim
	26ARwxXMrNz1l3+iyrsPPcz6C+x+iC7W0wN5JaH/IcpTml0lIm5Vb/ibKuQiy4YCzbZoI8AWzZK
	ZJaFmdAijmWPSWgbajWt7bBAlePvd9Js8nHHzXSK8WX4IAtKQ==
X-Received: by 2002:a05:6402:3202:b0:6b5:646d:be3b with SMTP id
 4fb4d7f45d1cf-6b722462c1bmr139907a12.18.1794096436370; Sat, 07 Nov 2026
 16:07:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105231417.119930-1-rosenp@gmail.com> <59326527-5002-483a-b418-fef18eeab5d4@lunn.ch>
In-Reply-To: <59326527-5002-483a-b418-fef18eeab5d4@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 7 Nov 2026 16:07:04 -0800
X-Gm-Features: AclHuK_6K2L6LJvgG9zaPsn_XSuhmhRlq2dPAWbQ9XPKBewY97fg0FWq5sGwZf4
Message-ID: <CAKxU2N_wqu_HmX59B-M4htLq2HbBpdcd_f2cChn1QayANPUTFw@mail.gmail.com>
Subject: Re: [PATCH net] net: ibm: emac: fix MR0 write in emac_rx_enable()
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jeff Garzik <jeff@garzik.org>, 
	David Gibson <david@gibson.dropbear.id.au>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:35=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Nov 05, 2026 at 03:14:17PM -0800, Rosen Penev wrote:
> > When an asynchronous RX disable is still in progress, emac_rx_enable()
> > waits for MR0[RXI] with
> >
> >       while (!(r =3D in_be32(&p->mr0) & EMAC_MR0_RXI) && n)
> >
> > which assigns only the RXI bit to r, as & binds tighter than =3D. The
> > following write of r | EMAC_MR0_RXE then clears every other MR0 bit,
> > including TXE, and TX stays stopped until the watchdog resets the EMAC.
> >
> > This path is taken when RX is restarted after an RX descriptor error.
> >
> > Tested on a Cisco Meraki MX60.
> >
> > Fixes: 1d3bb996481e ("Device tree aware EMAC driver")
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/ethernet/ibm/emac/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/etherne=
t/ibm/emac/core.c
> > index 640618c0a09e..b676b286e339 100644
> > --- a/drivers/net/ethernet/ibm/emac/core.c
> > +++ b/drivers/net/ethernet/ibm/emac/core.c
> > @@ -249,7 +249,7 @@ static void emac_rx_enable(struct emac_instance *de=
v)
> >               if (unlikely(!(r & EMAC_MR0_RXI))) {
> >                       /* Wait if previous async disable is still in pro=
gress */
> >                       int n =3D dev->stop_timeout;
> > -                     while (!(r =3D in_be32(&p->mr0) & EMAC_MR0_RXI) &=
& n) {
> > +                     while (!((r =3D in_be32(&p->mr0)) & EMAC_MR0_RXI)=
 && n) {
> >                               udelay(1);
> >                               --n;
>
> This sort of code should really make use of iopoll.h
I agree. Is it appropriate for net?
>
>         Andrew
