Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794330235;
	b=amV7Mb+4tferjWr5hxG7WGYN4Awi3E6Zr7Q5zBbyt+fRjohD/epb7lUsgvUTPrj1shH/
	 Cqm9/V+nmSG1xqwkRs1F0J8ld/egWFJQl7UlYGq4fAIHxC8PrVxqYcZMUI6inra25ROgv
	 BYGrA9cj3HaU/nqT8PMlrXiQH8MqUff90vTkBNJU+l75YDWfmoDLC5EqjapRiOtuo8w3X
	 cqMTxh19x90PmxBs2bMMH+1/aBJXPfkiyuUtRG5Y9nMOzWly4WAxGl+yi/wMZcSb95W2v
	 qLX6Gz8t6uU3H0JjFGDaKR7u1RO1NiPR6SP2ihIOgS5cCEZ8lIIhzIbm2+a7QJzHA1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hw7I9hsZ96oGDaDIXsGw69ed3kXOBiJKDxRNYwwzkh8=;
	b=0+tDJJzocKXkBROYKBOeMVG6wOFcoSXQqoc0C7W7fMTF1W6GLkR8Tr9YyI0F+SUU37xL
	 NrKOwYBBviNk0Dph+rq7akA9bvnppl+j0BOYTUfaRdF4zsWLiWZRltRxtjD4FIuaodkd7
	 PE5zkPosfKxnDNTiN/e4sEZl+WP1rb0ATXnPdipTPGMrsSIld2YXGyio7RVAwpEcMwPtv
	 nPa7agC3+hYV5lxtTdphChzyJmlUbGhqRZ8FQtYSOQIGOVQjfGM1zBp5l/G12KDFP9dRF
	 ScmN7UTUgjqePS8lIKO5nLQKcwTgCnHFtljWtR8Jvqoa1s+8MRtdkD3rgKyJtlb7zzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+xX50Mf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C9606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857C9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+xX50Mf
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9905d61449cso642859241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794330234; cv=none;
        d=google.com; s=arc-20260327;
        b=lIx3g91yQu1XWgXCNngxya/EY46c7zbclVGtQqJjJYaWWYuPIJoPFOF6SAvo06xCMd
         Hieq5qCRtgUIdgPbv6CrGQhA8eT7yyPdcvNYhbjVgCwv0n7FzI+pHpLh8yAsBm4S+ypp
         yiCgMHDdwnkl97qENbRdV3024nSjw9LNlWoQQCL/jUR6fGdqhmqJvaUcVP7bUPjFO9oz
         8yLXqMbBOrsAeg3mO+IuinRIp/C/Xb8Wtw66mVtlW4EzknrCNigKaJKqSVSQDouXusK/
         fMIIe+jm77LShnFmI3N/X561Qsig/8jFpvWinoi4xr5EAmkakFTJ+pYfB4GawBvDsE9q
         gCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hw7I9hsZ96oGDaDIXsGw69ed3kXOBiJKDxRNYwwzkh8=;
        fh=YP8JseWvjEHGy5mwpjUizD5ndOkdiLLk3DiJpDYuajU=;
        b=ZSNt2njAIe5ajH6nfzmU0kV6S4OGsQJn0tG9/KScjKe9t06NqTHKB1QRTTtbhykZ8B
         9ktJkk0y1fpSUg//F/6B7F/ZKwGmGtih872tRmheEdrbHjXkpcUcRfcJRH8eGgkALVTJ
         xj/HiTveWYqAWFWabvOkz1cR5+sBTYe2Bf9lJq3GAdN3fzAkI4ztGpwHipQxSyve63dF
         e7ibZAvh19qU8KsYWPh3V8njQiEaScBj4HDMIms7R6W6DtiTemjhcEqzWoDXazX77bne
         QzD4exNXEPxzIGgq8P6TfEzQS9gwQLBjjB3PD9L11HgqiAk7pXdm+6AdnIsJ6CJnLyC3
         /U9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330234; x=1794935034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hw7I9hsZ96oGDaDIXsGw69ed3kXOBiJKDxRNYwwzkh8=;
        b=C+xX50MfFTGRaLCaw9FCaInNiqow40dLU19oaQBavHjb+6XrBt6q5sKQHiuEugVcVF
         6dCjelwB8xYfoa3CzbED4beBrLsGTMseiC/8fr5bPwBJZvsrNT06rIAAS8neYM7BHGHM
         P3E351uwr4bel1Dc9qVMvfrOfa1tGbBnH41QTdLlmpkUE2s1pag8FS5cZDhI00c0hdxo
         Qm5TXecpCjQ0ZcYq9oHYFNQUxaL0JkvhC+OHpd/YOL6+GCN+lG3WioxepeUWRo7Fp+dv
         fJowupWxKyXx+iyOsHP0LDloYU6lidBpKgKh2GVx9b69lwqS7z892ojtGlMU8RzePXeS
         r6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330234; x=1794935034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw7I9hsZ96oGDaDIXsGw69ed3kXOBiJKDxRNYwwzkh8=;
        b=V7cCNbN7STsmNCLddJhVAys2YZQ4VcR0NsbG1fMvEo/nyFMkOr8kgDFLLTyGG/RFgG
         Rc8seNaOcfEq06JDAfCpMOjlmegv/cExoywR5WH1cjLyRunmy0eni06dmsFX1DJ0LGtR
         Spe8b9OWWrodxyltjkU63XJcWvvDHXi0G9Ok9ow1PTYq4HU5bgLcSVbciYuKLNtXO8AL
         Mywb5XVOrn3XIcg/xmzybbd/zZXp79Po7zagbkVTy2HjHQoNiTjNc8wG6kikdEhUUsSl
         RFFQeRYwxmejaKEySasdgONdAINI28Gm/S8Au5FXiDksNcbmJgyvJ3QSXUINyFWzWyF/
         lwqw==
X-Forwarded-Encrypted: i=1; AL+hErGZ/8YeGQEwibyHoo72nGYtepsblvl66XHEHPPi0MzshgBstEkm6VOG/CBM+3bt/xVjEDnvuh9j+9tO3/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m574nsW1kscK2qEjntjT8xA7bDJm+yKprVLcp1ixrOhOQTgbo
	U8+Bg/5N2CszmABazcqd2OiEkmxBtoZc7KduwhspjpbnlW9qc9jGLoI64XgxtZChGh2SGOv360T
	DqLzdd8uci1zhpElxiSlwBvrjC6Usrts=
X-Gm-Gg: AYBFou26r5W7/X3hVncj6sKAAg/KCjci5Gvx+4y/G2vGJikoMPUeKYCOWzWsbJB3C3H
	/KNenojdY5mzD+QTsQaAHTsHiwUGKFwIVAnm1Ndlz0QosrXP3ZZkfYW08yIj5k154BAQw9SUROV
	99aRrlL6QZrd8VKSbUm2KnckxEdV66osyflbTB6ebUjPggixJFFkI5my9qH2fs/l5wWz6ExO1j+
	3gzwrGvRZmfweyVCqKUh5dI1yvc3J+g1DquDRFZ1pxvVCw35r0gKYRO/G9zXH8nhGLcGgsgcbHX
	dXl7ILe2fHPpbq1InDGc3RNZPGv2RZHjviOb5l8X2ch+/DZyxJTpgOoVcaGRdQkzvYjwBKdFpLk
	D9TslgArivwMPxRTX+iQg+kzn2FZVr5XBhQK2Ou++MyEvLnEJgfIMjPegsKQmKRf5YAH6KAq7zu
	UI+Vmv/20O5vrx5Vk8eHFYksolfzhzaInk5nFfaZmI6HEU2P+GucfavNecmImlID0VSGhAFgMWj
	8J2qk7ixZ+a3ISEzrp+wfYEauduWA==
X-Received: by 2002:a67:e103:0:b0:7cc:2152:4f72 with SMTP id
 ada2fe7eead31-7d301ab17a8mr1041991137.1.1794330234180; Tue, 10 Nov 2026
 09:03:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
 <20261109-submit-acx00-phy-stats-v1-v3-1-fbc6327c5be4@gmail.com> <348f19e7-120e-4b41-adab-be016c7a6083@lunn.ch>
In-Reply-To: <348f19e7-120e-4b41-adab-be016c7a6083@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 10:03:41 -0700
X-Gm-Features: AclHuK9Z8HBeiil6sej5BA1Wz9f4abX4Dg7pGqCo1nUmbA_AdXdQ7J-TZIt3lPw
Message-ID: <CADvTj4p6q_-QT1R6CAVnhnWerzF3qsPhi8rPTcZBjbrbRCdtnA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] ethtool: add PHY receive frame and byte totals
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:42=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Nov 09, 2026 at 07:48:32PM -0700, James Hilliard wrote:
> > The generic PHY receive packet and byte counters describe successfully
> > received traffic. Some PHYs instead count all received frames and bytes=
,
> > including frames with errors. A frame error count cannot recover the
> > number of successfully received bytes because damaged frames have
> > different lengths.
> >
> > Add optional receive-total counters to ethtool_phy_stats and the phydev
> > statistics group. Count frame bytes including the Ethernet header, padd=
ing
> > and FCS, and excluding the preamble and start frame delimiter. These
> > counters describe reception at the PHY, before MAC or host filtering.
> >
> > Append the new attributes so existing statistic IDs and their meanings
> > remain unchanged. Publish the names through the existing statistics str=
ing
> > set, and retain the unset-counter convention so drivers can report eith=
er
> > set of counters independently.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
> >  include/linux/ethtool.h                      |  6 ++++++
> >  include/uapi/linux/ethtool_netlink.h         |  2 ++
> >  net/ethtool/stats.c                          |  8 +++++++-
> >  4 files changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentati=
on/networking/ethtool-netlink.rst
> > index eba226c79ec3..5528d0f7afdd 100644
> > --- a/Documentation/networking/ethtool-netlink.rst
> > +++ b/Documentation/networking/ethtool-netlink.rst
> > @@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently =
defined values are:
> >   ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3=
.2.1.*)
> >   ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics =
(30.3.3.*)
> >   ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
> > - ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not define=
d by IEEE
> > + ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not define=
d by IEEE
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> >  Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the =
reply.
> > @@ -1683,6 +1683,20 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statis=
tics (such as RMON histogram
> >  entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not hav=
e
> >  a string defined in the string set.
> >
> > +The ``phydev`` group provides separate counters for successfully recei=
ved
> > +traffic and total received traffic.
>
> You need to be careful with naming here. This is a
> kAPI. phydev/phylib/phylink are implementation details, a set of
> helpers which some MAC drivers use to implement PHYs. But MAC driver
> can implement PHYs in different ways, and don't need to use a phydev.

"phydev" is already the name exported for ETHTOOL_STATS_PHY by
stats_std_names[] in net/ethtool/stats.c. That documentation change
matches the existing group name; it does not rename the interface.
The proposed counters describe PHY reception independently of how
the driver implements PHY support.

>
> ``ETHTOOL_A_STATS_PHY_RX_PKTS``
> > +(``RxFrames``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``) cou=
nt
> > +successfully received frames and bytes. ``ETHTOOL_A_STATS_PHY_RX_PKTS_=
TOTAL``
> > +(``RxFramesTotal``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOc=
tetsTotal``)
> > +include frames with errors. The total byte count includes the Ethernet=
 header,
> > +padding and FCS, but excludes the preamble and start frame delimiter.
>
> And what would you call it when the counter does include the preamble
> and start frame delimiter?
>
> Take a step back. Just because this PHY has these counters, do we need
> to support them? And what happens when the next PHY comes along with
> slightly different counters? Do we add them as well?
>
> It is vendor SDK syndrome. The hardware can do this, so lets expose
> it.
>
> What is your use case here which justifies these specific counters.

The use case is the same traffic monitoring and error diagnosis served
by the existing PHY packet, byte and error counters. The difference is
what the hardware measures: successful reception versus total reception,
including frames with errors.

This appears to be a recurring accounting model across vendors, rather
than an ACx00-specific definition. TI's DP83TG720 provides another PHY
example, which is why this series also updates its existing receive
packet statistic [1].

There are examples elsewhere in Ethernet hardware too. Microchip's
LAN9303 explicitly distinguishes received bytes including bad packets
from received bytes in good packets [2]. Those are MAC counters in a
switch, not PHY counters, but they illustrate the same distinction.
That supports a shared total-versus-successful abstraction, although
each device's exact error and byte-accounting rules still need checking.

The v2 review identified that ACx00's inclusive measurements do not
match the existing successful-only fields [0]. The successful byte
count cannot be derived by subtracting an error count, because damaged
frames have different lengths. The proposed fields preserve that
traffic accounting without changing the existing fields' meaning.

For the preamble/SFD case, a counter including those bytes would not
match the proposed definition unchanged. A driver could use the field
only if it can accurately normalize its measurement to the same
frame-byte definition; otherwise it would leave that field unset.

The intent is to represent a recurring measurement with consistent
semantics, rather than add a generic counter for every variation in
vendor register accounting.

[0] https://lore.kernel.org/r/20261109235715.1618218-1-kuba@kernel.org/
[1] https://www.ti.com/lit/ds/symlink/dp83tg720s-q1.pdf
[2] https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductD=
ocuments/DataSheets/00002308A.pdf

>
>      Andrew
