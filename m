Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423738;
	b=sE1YNRLYiz4RiC7UtT027ZH1ePNy55GTmTdl4nu15Una0IHAAjAuaFumBI1N9EN74YuD
	 q+IOP0FcYqLarNw6TydfZdHBY8hdrUOoc3O9VClPVsDRqL5MdEFwlDLTaDpshxmPzoJ0y
	 Ecj47o6ILcxAd5qlP+bfWwvujbFWQBxo+bpK+TFcJrWDaPsq2cmjE6GExD4a7AMa5tHKR
	 PhwDNiLgseou5ioXXorASgrgmySJpyhgw7W3zN0/gZeo5MprHNbTEaZAOsfEI/eYVQzKc
	 bNaOZKyOOcPA+DzoA1m5go1fqT8P/rmFSgvWYoJRg+76ySYMzwqg7OuNTYAGfUgh0jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f8ILvoh/vi1rbgZZAsfd9aGfdfYOK1aDvQwo2LOCRgs=;
	b=hYfJo62gcg13wzBZ0LW7Rq2vbnIsErnmAIAmOGroyQwbYdCYy0UMgRbpImMaqpPGofye
	 wbiXe1ZhoexCYv+RFK1agsD6KQn0QOllS9uF9H7qihlsygAIdFId3XoqlzrB5EQsUS8Yq
	 pCll/4bmKjLb1AxBlfAz38jTOGZI4Zx0yd+mOb2Mqh7E7fBQ9WVGWVpSkXg893PJ5IIqP
	 Cxdser/HCdA7QeMFyOYud6BgJABiVe/yYVMYCZIouvVajvCrU3WVxmVtAmgFUZZnBmvGo
	 zCnAyWjF3Eqk6vilTA1voS4vMlM2B8vQM4uLsdjvAL1DNdGr4W6pRApcaLrWSl210uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcOK6Y3b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539360A260D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C539360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcOK6Y3b
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c0bd676eeso3437958d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423737; cv=none;
        d=google.com; s=arc-20260327;
        b=fcETLMzYKe884ip2glWsYaASnUkwenxuD1ypNfk4owRo4aeVvHf89IaNkpfwkxvZ21
         /Gr35kaOkYZOA1SrD2Ttd+Z6/vIVGUfSrSRU2sMRsr5nJZDseA1160711yKWzZQikofd
         sNTKR1eCtTlY5T9WmZpMTmTLHU1X6CIxl+tYt8t+eL9J6/rLqfdL7JjmjOe/IkfZpmds
         y6M/OpQq4GLEBZpP+X2hgQ+NDR5CEAl9FGwgzJN46xcaGvOfU7C299GUXxfP1V/iti0j
         /NqhW9CdBqvUb8PTWKdfS4BJiisbXMw9k+aQEyx4cJkfXRfyqBPNo3/3zouGU45hxYsn
         fjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f8ILvoh/vi1rbgZZAsfd9aGfdfYOK1aDvQwo2LOCRgs=;
        fh=l3wZgduhPYN/UD3sfCedGsVFhWF+MuS+SXfrzU4ONBc=;
        b=FieIN2RJns8QLkLhaxSbOZVpZPygfO1QU+Tsk3ksM5h6G8MNLyoxTI7uf/WsTrOJ72
         N+LHbpqfWmpN2+SXLQjwWtBV1kNXxaffPkImicgRpwx42c0jEF90MeiyafTgfqVtH6s8
         n0lSuOFP6rvS3cDLUCLBI6z6jcQJUfMzPRyzHmgKLWRh5i8XemMkQDMu7f7dCQDVsPef
         rVL4uIuwLokK3uqUf5f1awTQOAfdv7yBBiTdJF6Nepj8jThGuwsZMwR5zIV0FLnSYxO7
         5MxjC/GxSYrDJPrUAzTmQbEbU4X4lSq9/DQ7bCaddEt5g7N0p4KLOe8tbgfC4EsBr3AQ
         sj4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423737; x=1795028537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8ILvoh/vi1rbgZZAsfd9aGfdfYOK1aDvQwo2LOCRgs=;
        b=zcOK6Y3b9syADQIM0Sqg9Eq3EmlE/T0d7QK3T7p7GsfxvZ5FEDkiDmEDVuzNMmgNE4
         UsQizn3jDLPiUjXFlbBcF+ONsk1i6RIUs47IeRL0wBRMJEenDu02D5U8hujsAiMmH5gu
         JBfds7Iw8T+5C2yrnokQsPouCEqIpbytzVCqbMM+i+PWKbYJ8c6m8/0tswkXo59G9g6Z
         hI6XvLGdR9oaVsFiGju2l5dmXiTKwdNLmAxPSaHnea56UlZuW0QR/hCkldXQLGxYC5C9
         NHoMVzQ/1q87PZfklFhLguDN+Xg2bOzCuVWgjdwZm2HOimbIJsZ7wdVE85MErVuzlxgV
         7LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423737; x=1795028537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8ILvoh/vi1rbgZZAsfd9aGfdfYOK1aDvQwo2LOCRgs=;
        b=FFC3L7Szof+kNN6F2dM9yVrnwmz3PHWyhyYq3j/An44xEpbGTFnzmlN+MGynY1caHS
         KpSzYel7YWQ6wn3kU6WUGnTCnIZO4DINY6lGXOepyUdWm8pK+/KRuHtYatIg+cDT3ZVv
         tXfrbpH3DqHb/zXgjcxvgj/CYqsxAeeJQgfC8bmNqywKKZMlqsNEyKPTlbgSEV24MVYq
         ivvjcsxPnY5Rsa4LRTJrAok4FON2b1W9A1dj1pixkYRDFJFrpXapkNDdbylz1lZ79cNP
         rCmMF0zKGYuN7IDkcVkJJ9ln+S2QPU0d98wrLt3mrDDiIYK0YXNDfrZFzYEyQwsNr1TD
         s8gA==
X-Forwarded-Encrypted: i=1; AL+hErGTJIFetPPurqZHgkBNs0pMZjsMEj0NMpprr4Vl2typhNPlNptnxZ8we4QzTpCu3lK/vuAHAuBb0OckYeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mjcJy3x7eWSOMdJYNyixAf/ejMKBjKzExX4ZkFsjCUPzkQamU
	6/D9wOFhD58pfa9XqNKhsIBh06hLCOAYcoNLVoJTrs9inaqwF2MAPp7txv/wVT518rWUT7uiSam
	GTIExlsgytl0fOga27ur1VoyiirGthVg=
X-Gm-Gg: AYBFou2hqTKRKhECAR3ClKB7WUcimikSmW2tan05dO5DtESUyLiPacFpff0r/nkkGcA
	S3voIC5Yrx+S0qpC0kof/GUeoYRDba+4G7itSSzylufT77p/MYoEIkbCrJ5BvYADs7LzJxtsByr
	AxpUuSmvyhayKwG5mpwCzNO/lXhLd4DvWaNfprrqXB0GDySc+zhqYXL/6VG5zj6N+OSm6ksobfg
	lBcCPC1ut9CdgD3VlSc6YpJVVpKDb9m8yPRtbSfH89H4gBPijknCgFuDw5h+6Gmk/wVEid2qwx3
	JoeZmHlfx3r/7hGnFzaeTdfyCRdBS49KlrA1ss0bYpX3Gi0wXEeSeVHOZr6yD8W71q6+8bCHTvS
	UUFQSZHGYBYL8ivZYBkA+KqG2OifMq4XumhJGomWw6wn9jBov6abiGCSZiujFX67LQm6kQrzwxB
	8knYtcfyGS9yzeJlslRv3YfNpnl+SXfWfZDtbprBq9XtpvCahn1HeFehF45yC7fOsHqsVxFE/xI
	QOcM+OudOGaPd8BIBjcPJrj0aj6z6eafem8GNhc
X-Received: by 2002:a05:690e:144b:b0:67c:6e1b:84cd with SMTP id
 956f58d0204a3-67c6e1c0b42mr1329959d50.74.1794423736621; Wed, 11 Nov 2026
 11:02:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
 <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com> <52c38c53-7806-48c7-a0a4-9e1aa40cc55e@broadcom.com>
In-Reply-To: <52c38c53-7806-48c7-a0a4-9e1aa40cc55e@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 11 Nov 2026 20:02:05 +0100
X-Gm-Features: AclHuK-aiQpJhTmoeaJ2yOCbm38LSRZiZYmsE5_eZRJ5b-IE4UzI5KOzWB-Qxl4
Message-ID: <CAOiHx==VFEgLf5Zs+VGYdhdsznSwTz-8Hp_aAF6UuGnKT-4=fA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Joseph Telaak <joseph@telaak.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 6:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 11/11/26 02:11, Jonas Gorski wrote:
> > Hi,
> >
> > On Wed, Nov 11, 2026 at 7:31=E2=80=AFAM Joseph Telaak <joseph@telaak.de=
v> wrote:
> >>
> >> A BCM531x5 can be connected to the host through its IMP port (8) or
> >> through port 5. With port 5 as the CPU port, b53_brcm_hdr_setup() puts
> >> the switch in dual-IMP mode, in which frames trapped for the CPU, BPDU=
s
> >> among them, go to port 8 when they come from a LAN port. b53 sets up n=
o
> >> WAN ports, so that is every user port. On boards that use only port 5
> >> and leave port 8 unconnected, BPDUs are lost: STP never sees its peers=
,
> >> and a loop between two user ports takes the host off the network.
> >>
> >> Mirror frames sent to the bridge group address from the user ports to
> >> port 5 instead. The multiport address registers cannot do this, since
> >> the RoboSwitch data sheets resolve reserved multicast before them, and
> >> marking the user ports as WAN ports stopped forwarding between them
> >> when tried. Other frames trapped for the CPU still go to port 8, as th=
e
> >> mirror matches a single destination address. The switch has one mirror=
,
> >> so tc mirroring is refused on these boards.
> >>
> >> This was observed on a BCM53125 board in real use, when both user port=
s
> >> were cabled into the same LAN. Tested on that board with a host sendin=
g
> >> BPDUs into a user port: before, none reached the CPU and the bridge
> >> stayed its own root; after, all of them did, the bridge took the sende=
r
> >> as root, and forwarding between the user ports kept working. No
> >> selftests were run.
> >
> > So on your board only port 5 is wired up, and port 8 is unpopulated
> > and no way to make it work?
> >
> > Be aware that more than BPDUs are broken by this, as anything trapped
> > to CPU is not working. This also affects traffic on ports outside of
> > the bridge, other trapped packets in the 01:80:c2:00:00:0* range, or
> > IGMP/MLD snooped packets (or any other L2 protocol snooping).
> >
> >>
> >> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> >> ---
> >> Sent to net-next rather than net because it takes the mirror away from
> >> tc on these boards. I can resend to net with Fixes: 8fab459e69ab ("net=
:
> >> dsa: b53: Enable Broadcom tags for 531x5/539x families") if you prefer=
.
> >>
> >> Only checked on a BCM53125. BCM5301x boards with port 5 as the only CP=
U
> >> port may have the same problem, but I could not confirm it.
> >
> > They do, though there it's "easy" to fix by switching to port 8 in the
> > device tree, since all three ports are AFAIK always hardwired in the
> > SoC.
>
> Yes, I have a series of patches doing that, because using port 5 is just
> not working for everything.
>
> >
> >> ---
> >>   drivers/net/dsa/b53/b53_common.c | 24 ++++++++++++++++++++++++
> >>   drivers/net/dsa/b53/b53_priv.h   |  1 +
> >>   2 files changed, 25 insertions(+)
> >>
> >> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b5=
3_common.c
> >> index a2a5754c413c..6b33775c7598 100644
> >> --- a/drivers/net/dsa/b53/b53_common.c
> >> +++ b/drivers/net/dsa/b53/b53_common.c
> >> @@ -797,6 +797,24 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, in=
t port)
> >>                  hdr_ctl |=3D GC_FRM_MGMT_PORT_M;
> >>          b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, hdr_ctl);
> >>
> >> +       /* With port 5 as the CPU port, a BCM531x5 runs in dual-IMP mo=
de and
> >> +        * traps BPDUs from LAN ports to port 8. When port 8 is not a =
CPU
> >> +        * port, mirror them to port 5 instead. This takes the switch'=
s only
> >> +        * mirror, so tc mirroring is refused.
> >> +        */
> >> +       if (tag_en && port =3D=3D 5 && is531x5(dev) &&
> >> +           !dsa_is_cpu_port(ds, B53_CPU_PORT)) {
> >
> > So this should be extended to all dual IMP capable chips, because they
> > are all equally affected.
> >
> >> +               b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
> >> +                           ether_addr_to_u64(eth_stp_addr));
> >> +               b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
> >> +                           (MIRROR_DA << MIRROR_FILTER_SHIFT) |
> >> +                           (dsa_user_ports(ds) & MIRROR_MASK));
> >> +               b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
> >> +               b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL,
> >> +                           MIRROR_EN | port);
> >
> > Have you tried a catch-all port 8 egress to port 5 mirror? If that
> > happens to work, it should catch any trapped traffic. May not work
> > while the port is disabled in software though.
>
> We could also try to use the CFP to perform a full redirection to port 8.

CFP isn't supported in all bcm531x5 chip variants. E.g BCM53115M and
BCM53125 do, wile BCM53115S and BCM53125S don't. And likely the
presumably lower cost S variants will be found most (at least the
board I use for testing has one).

So we could at most use it as an alternative path where supported to
free up mirroring. Checking if we have CFP can be done via the Bonding
Pad Status Register.

Best regards,
Jonas
