Received: from mail-pz2-f24.google.com (mail-pz2-f24.google.com [74.125.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093E3D413F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598595; cv=pass; b=FFskxYeyyRQ8ASUPAU55/XEfFPxwaeKZo5sWTC1MRAbHWwi6vFnn8DctwwbbcUuji6Eo56CUsBNVRVAtDDCMerUx59VozpYqapjKHLdRgBmkOguMMfyKGK4QRYl60KoXPDNK+UaNrvBXFeSD8oa5mMA4AmRy9DdWGa3KESJL1xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598595; c=relaxed/simple;
	bh=xEL5URHcePqM5nbi5/mukI8PUvnbitE33QoPlYESpEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lN2EXEw27x8MEvgnLXdcnkrxlrSZBHRDmJ39Cj88xbVbswcnB3zMzCf8b1EYoAQv0a7ALUHq+u1VpOHduxos5bbM6pPr9c7SlLpbwCh23kwA04Hb31aXo6gLbIPssw0NmSGd3lcE9bbVpmzbuOdgX+nlZr6vda0vQdqGdqFIDhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=O9ts7O2W; arc=pass smtp.client-ip=74.125.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="O9ts7O2W"
Received: by mail-pz2-f24.google.com with SMTP id 41be03b00d2f7-cc745abb731so1124988a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598592; cv=none;
        d=google.com; s=arc-20260327;
        b=IWCIlLU6nl4BjIHQ+ab4J6aaAuXmQI6UHmpRUMx4KGmG/OmFX7j6bo2nwE/JUYXFB6
         7h8BArI8311EGjtlUz5XaNmJOLZP0yGoLKJcoSo8ltKanfk5HWNfNefdFc5gG4gPXUAH
         Jua7J30PtKTfNxAfVMkwwosOPfzo3XR/IO4AL8HSeCf1JYWKKtyw/y9KneElPkJPn97S
         YnN5ntMjFTNuyfIW7sWS6imM3DYh+e+/4ULtLKdC6rpcHK7zEjXVRyzxyu2epVJviqSt
         FG0Udp6BIx0t2o1bCbqeb4RAl8NLzrnUODfrT5zMb9MFS0J5VX7kxykLNNnOe9slOlXr
         Hvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        fh=82vsYlHOG0xynIxsWa5g53jOjcPm75ZXcx2r+YiufTg=;
        b=eunJSMAA8MZ1ZkdqZJLNN9UekeGSQ0UyZvMtqNPiSbsl/KatgLInRRmsA5GvIoGEYs
         t/ZDpF6py8Rea7RpZxsuASmZuDFsbqYUFNhyncXr/zRAAqrLcMdtGBTPpBH7s3NX1nCm
         Mr1JtzuOJeIJuuBNsY135esE4ZeY+e1XIGbOaGfMsN5hNWuclWJ4Y/vxXLRWr/X9/zSe
         ueSmyIdSrfcXA4vpR21pf9J+sD4gDEsmYnOtBj4sZN++eDDiZMCwUAviiUIEJ0tGdT4T
         3vx8c4gxy+AEJJ0d7Vj/3YcRktN56c6l+EZoFcF8s1WBaZ4CswhQzcnr2Szv7yfTsApz
         R//A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790598592; x=1791203392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        b=O9ts7O2Wr5fi7gySwHhPrDrpQ+m4+lErPU5pHrIE++5dMfKzGxvYu2wNbU5+I/hgFS
         ZucpOsIYfvlPnnP54mHZsaAqCkcfKLMOmj8O5SJcA5Im/vRaYtoqfrPbdq5ZQqkiQdqJ
         27ChfsmcNXNEOvln3r5WtD5GH1vcsPdout3/+s4rRhLRFUjoNwOOzmX7LR3ge9irWduL
         DHc2S8OwcgrJ+yv+mrznjoElhn/3zlMrqCqX3me7I6i91LTW6dWez+ga7gmVDw/LMFdo
         8gHWD61TdNUKf+nU5IsBlZKiUBUM1Nqp0zFodK2COQcbl7IwaXAxYX3v039CNbUfl4Hc
         VW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598592; x=1791203392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        b=2QNddAV/ZNhx1UPukVLalx2rTUr/ryW+8ksNvjdCj+LVGa7QsuWKwRk0hv+JgLruCS
         mEofdJqHwPXA2T68spgpZ2/PW2wr4jWue6ww2G1FDQP7VpLXrD2F2/nSzGyZ7VwyODgi
         qq71tUz13pl59hHw+KNqVE31dUIlCwjmR+GRYxy1r4nYFU9fFXp0fxFouRVe9bFOOBMN
         YLHoMK67LD/82peQh0EhuOtyM43lFtvDIr0sC1xN212XsTsH2/jYBXNetElZneFoHRx7
         eWEPrku4L0FFEDb810wZGfaWZv/4GmPzZeyBxQflParLBP8cGAdBkrgL8ZLuMw0LJ85a
         QeQQ==
X-Forwarded-Encrypted: i=1; AKwUvByrnnvZcs2nMVQl2GXVO+6u0BuiW56LfI3IBnfyqFY+Jh5ARdwKVSh5TaVmvFU4/fsG6wky8GMzVWFnyTM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZmQs/U7ThP3b7UtSy8+xhqVXCnbZPs5Grx7uPgdaMEj7kbqiT
	kv/QN8ePKeih2EBaoPwLMet6GnJPMYIZDxnjXJc3gpAd6oLbR34hORhemVVvtzUqBia6Cq3VgYr
	BeDo6zSOuKpAU2k9j/MG2ME0/L1KFUxX6KHuTeB46Gw==
X-Gm-Gg: AYBFou00zFCYhlSYN18L8MCnQyZCZqLE48wDA5X0sJk09gOuwdWSM1vkBXHDyce9cPn
	DdgGzb20NqcalL9cNbOiho9khnY9jMzTqUQJhOz+9GFkxH73r+saFqLIAf2fzArUYfBnz5r6/ZX
	5faIf1OyAa+VsIEaTVewkXUNOZfK8YQqGs64Gdb3lLDY9XH29zRXfbSOsl2e+S1p0UvwitI2rgV
	DpaDNeajrtmdrj2HgWfPuEEld5ryMXyj28sMSK4T3hn75YTpptRax4Pp60fFtCejIZIjJbiqtoU
	6BGw+rUrQKRnV1Oa/SvRyEfMl4zExrSIzJz44Rc/fqPUbvl4jHSrmQovKfeqKkpECNYS/vQ2jp2
	uhASbEYNDABTs4NlYEBqKZAVrbOKdJDuMRys=
X-Received: by 2002:a05:6a21:6f12:b0:3dd:a196:3091 with SMTP id
 adf61e73a8af0-3de0e953993mr11609993637.65.1790598592229; Mon, 28 Sep 2026
 05:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922125112.2111256-1-robert.marko@sartura.hr>
 <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577> <CA+HBbNG2nGXpXC63AVUJX3KaqzJG+Q=-Md92eTpq7Y-O4CHMzg@mail.gmail.com>
 <20260928110438.unoxnyymg7zwuuqk@DEN-DL-M70577>
In-Reply-To: <20260928110438.unoxnyymg7zwuuqk@DEN-DL-M70577>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 14:29:40 +0200
X-Gm-Features: AclHuK_nzNTo2nwU3xgEirfWnjz5VEDaxc01jJkDIRwQ-q74rDelYXQzHvCKWN0
Message-ID: <CA+HBbNHNdz3TpJRAYt08CnYtA081i-SXxO8ia+tbHvbcx+KAJw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: lan969x: correct RGMII port mapping index
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Steen.Hegelund@microchip.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:04=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Hi Robert,
>
> > On Mon, Sep 28, 2026 at 11:18=E2=80=AFAM Daniel Machon
> > <daniel.machon@microchip.com> wrote:
> > >
> > > Hi Robert,
> > >
> > > > Currently, the lan969x_port_dev_mapping does not check for RGMII po=
rts
> > > > and just returns the physical port index.
> > > >
> > > > However, this does not work for RGMII ports as they have dedicated =
DEVRGMII
> > > > register space with an dedicated instance per RGMII port.
> > > >
> > > > So, check if requested port index is an RGMII port and return the c=
orrect
> > > > DEVRGMII index.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 ++++++=
+++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.=
c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > index f3a9c71bea36a..bf5320c7a6ca8 100644
> > > > --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > @@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct spa=
rx5 *sparx5, int port)
> > > >
> > > >  static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int por=
t)
> > > >  {
> > > > +       if (lan969x_port_is_rgmii(port)) {
> > > > +               switch (port) {
> > > > +               case 28:
> > > > +                       return 0;
> > > > +               case 29:
> > > > +                       return 1;
> > > > +               }
> > > > +       }
> > > > +
> > > >         if (lan969x_port_is_5g(port)) {
> > > >                 switch (port) {
> > > >                 case 9:
> > > > --
> > > > 2.55.0
> > > >
> > >
> > > The mapping itself is right, but as far as I can see nothing upstream
> > > uses the returned index to access DEVRGMII. Every caller of
> > > sparx5_port_dev_index() pairs it with sparx5_to_high_dev() or
> > > sparx5_to_pcs_dev(), which never return TARGET_DEVRGMII. Those paths
> > > are also never taken for RGMII ports. The code that does access
> > > DEVRGMII, in lan969x_rgmii.c, computes its own index with
> > > RGMII_PORT_IDX(). Sashiko, correctly points this out.
> > >
> > > So I don't think anything is broken today. Did you see a problem on
> > > hardware that this fixes?
> > >
> > > FYI, we carry the same change downstream. But there it was added toge=
ther with
> > > RGMII MTU support, which reads and writes DEVRGMII_MAC_MAXLEN_CFG() u=
sing this
> > > index.
> >
> > Hi Andrew,
> > As pointed out nothing yet is broken, hence no fixes tag.
> >
> > I am using it downstream as well, for the MTU change support where as
> > you pointed out RGMII code
> > uses it to get the correct index.
> >
> > So, I thought that it would be good idea to send it upstream before
> > eventually getting around to sending
> > the MTU change support as well.
>
> It wasn't clear to me that this was preparation work for a future feature=
. As a
> standlone patch it does nothing. IDK, to me it would make more sense to j=
ust
> send it together with the patchset that would actually use it.

That is fine by me.

Regards,
Robert

>
> /Daniel
>
> >
> > Regards,
> > Robert
> >
> > >
> > > /Daniel
> >
> >
> >
> > --
> > Robert Marko
> > Staff Embedded Linux Engineer
> > Sartura d.d.
> > Lendavska ulica 16a
> > 10000 Zagreb, Croatia
> > Email: robert.marko@sartura.hr
> > Web: www.sartura.hr



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
