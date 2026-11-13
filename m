Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794609803;
	b=nyzH8B9E0iEL/Tz2IQc3JxFXsm07zzYSZ/fzb9m8YQrgTrjupJy3r+7A3rnp2G9m46kq
	 aWA+2XeViKX3TzdF4AsgLuOx5s62juyEy1yUXSwW3W+lQ6BrRE+/5gIMXqDdCP3oxWZsu
	 0HYYm5LXtyeH5VbiBt8fmOXzj9Eqr/i+BWbXUC46eteZVZX+k0atSA7iVrO/cQ5iAw9YL
	 SaTzKSnhzEKtN7WhXChws5ZK8ea14UzvDqW5MewCcKJ5hB0bNshcTDmtfALdQrwv1Vu2X
	 ZYn13sVgPPDM2Nxq9xYuVBaJPmRDmHYl/79L3wsvdc09YxOGvcDXm5Jdcy5wcTZ6Wfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
	b=lwum8UWUcOywtD5sR09NN30+jVKg91ZqwDRK+w8JR5z2JGi7EdM9rmUDGQ0Rk56f45TU
	 NiNeMIhtpJ+KXgpeJRgfmi1cjE1SjyzjLlLdOnXq0BOwJD91sasrBBxb2Q5kW9rlG1H5c
	 x9YtwUDdqRZQd/4gbDD88ASpvTaqexRRxsveyXSBAb7NLihS0jyeZT0zOk22qGErJt7Qv
	 OX+7EGKOWlIgey5vAFXGmzOGjWfgRtZnRJ62YTjsiXbVUo0F/9g42NdF01NiMv0YX6DB4
	 +Zuxn+6hoowLF/E0qPF+P1MEPPvYRJddizWCeQtpbI3/Mt0i6lULBlHEwjuuqj5ApGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXNS6fzM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D28606A549
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D28606A549
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXNS6fzM
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9851592ada1so397697241.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794609799; cv=none;
        d=google.com; s=arc-20260327;
        b=JGWLBN6RxrYtMmn+1kZ/83xXPqVIeGCpbP8oSUS0lCkZyD5I2CIL5Nz2knrO2KCO6J
         RU15Yap82An+Fv1eIGpxWSx9VP6h5rkQdbkgzwTuusGnYFVghYUDYe3v5AwVC5V7BlPh
         Gmdyq3qmMN5tIyGqDV/Dqm7TsJvy8jPe1iV6YRkKx6wYOynxCY3M2t/tLGV6/MxNxBrI
         nUmC5Br8hvnUS4KM5ovZ9RDHsWly5uqg8amXRsovSPCZj1uKzDh0Df5yQAN29woXfRwT
         rYxbF7s8zjw/H7gvYisFpfz4jUkBOfjFGsyxS9X+B+ylbdo2qAjsxEr+JpY6j00MeMwi
         agcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        fh=M+g4aaVsi/ehPj84/7XZONGgnhwtC53APfxOywAoGMo=;
        b=KPKtsGnBzXr7kfmcJ4guMD57cmU3H2oTdKmpPUobTIVWCvowtCmgyOdqNETTDJ5MpN
         cJa5K66z38BtZevAi2W3QWd1OLOzrVKx/taQe+0iA4GQNh8o0fIfR8b0aOmjd/qerdWY
         TlRaUoJYZOQlYRodQI1RTQMedzj6v45UFpc7fzZ2QyCtX1p/5j1pSJ2zKIOyHCsroezD
         v9oFBA/U734QBdbZ1F6Nf7loaLuXenJ3GWFN8pEiCmAolxqgZ0CU99Fd92dhTaJ9HD5h
         3cK3nCM4LpMQ+83k2J8WlPkaUgHp4bpkvJSpWng+Wcq8J1lIBxUZA+4eDy3OS6TMYAFN
         nbwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609799; x=1795214599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        b=lXNS6fzML+4ms8KRhgrDko+jDoeFLKoP7/8V9vvA0kngy5RONQDDaSWlykfzxvWBqy
         ba3/RQkLsh5FJA7UziUKYswTcUoLp64Sprh1UKYouGqpRI4Zo52eTG9fTjA419TGXujq
         ioxmWNLa+9j3Thyf7jRbQTEXHmqlt/zskzknrOjWG26iWAH1Jm868zz2hs9QpgTc4UMh
         7aTNKsMd9Fd+lzUjNUj0iqIKUs2rHsbmTDUJJOhbyOKm8W+bzoO03dOKoulBUbuBt+Wm
         PbaO0hG5DWySwdQCyKK6qRZ1lJwXcgfoAIi/koTLJVlNNaqY5YaC9c/u23zPaw4bZOv7
         18Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609799; x=1795214599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        b=AQogYy2SWlkj8qtb6iDmdAT79Lls8spWMu5GCRlXDgBhg2/26pPZlFCpwmBWO8Uhdz
         y0dN0OWbAbc3kPLqwYxRiw/ta5Ixo5TJN09nSEzhcAgcBMH+4qz8T3+a/ZmG6993XZEg
         k7qydiCM7rcMsLaXYbDFbazBoekjgE3MVYgMlbWGYL0it0Q2YbY4Rx+qhscRQ3mD7AfZ
         IG1iE0U6vAHgUyjRTmPqWcObRu6esNu4bVSqHJDVEuei4dWGqJKt1qbEj0HXrYKYaamN
         jCtWZY5kdRhyVLbdD1JCpsLQRY7V4ZuE/0oVA7Ite0RgrWIV/ywKrpzDJ0i5ubayIi52
         ZGDQ==
X-Forwarded-Encrypted: i=1; AL+hErESOlzlkg+a9FcKDrK8XDOCtwu05fOV3jJ3v3gzSdEHfKbt8FB9Pd7uHktxMSs7sWdpVeB5fJ/J29xVobs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jEvoZjBLWoyB6X1d/3QJgbr51jmI0eQTGFPyQ1IMl/7xEfTch
	mJhulhuxQvqK1wbAEimrKtt7luEWWFhpqN1vFLAhkg/4m1Fd/WTZz07iY8Ab/xvfO0zb6dCwKQA
	rcumSr6FxtzyxA6LCxyFlDIOKq5Zb9JU=
X-Gm-Gg: AYBFou1lJ31xOX+Bd87fmhdj/DVl3l7BIefewkiWbG7PSDpYFKC110nMlSNXPEFUSSl
	uuIpASeSpCELw+2D7LRHEi9bKSJNsVC4frO17CV/TNAcAQBMkEaT/itQ5OnK8j88U038jsjHPah
	XOzN1dHxti9P2TDjp9dqruviwFgnAaeLul+puordI066LPSURfaPDlRjMopEEx5w86G9qQoU+hd
	jGHn5vaXEGDP5dw+mbmK1qeXul81lBjQzvFDdiSDwouvxFe0dIdxolo2NL6TFd9CrJP7NBGiA2W
	5WBcI7oLESRYZrGeRL9ZefMq7ScEBdUUOO6MBdoyV4NGc+QaTfBdbjASnhfiNknN9QjyQtPbOSR
	tQunxih93lA10FYW+6kOGtuuJZxzQWcaUuxb9QmkSVvBGIxUGgc5D3FYpD6mx2lIPzEbVyuKq3x
	mBkhLBXoKPmQqdub/TVt4KwWIA7jGFSZB1/4cu+oZ7128RtBI0S5AKOobfSohcmPc6OnyEakEla
	bPvD7dFzNEF8NQOm3FcpO6g3Si7DQ==
X-Received: by 2002:a05:6102:84c2:b0:7cc:ccb:ce5a with SMTP id
 ada2fe7eead31-7d64d89cdabmr1053049137.28.1794609799139; Fri, 13 Nov 2026
 14:43:19 -0800 (PST)
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
 <20261109-submit-acx00-phy-stats-v1-v3-1-fbc6327c5be4@gmail.com>
 <348f19e7-120e-4b41-adab-be016c7a6083@lunn.ch> <avdaBgWc5tpMhtqF@pengutronix.de>
In-Reply-To: <avdaBgWc5tpMhtqF@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 15:43:08 -0700
X-Gm-Features: AclHuK_y5r8zy20zeheg5z5NyDwRpxzoSdoNuCWdWvLU_7paTeMna_98mFT74a0
Message-ID: <CADvTj4q+QuSOre_Z7Kq286fLqrLfTq26oBCarDzx=wrc7Zz_WQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] ethtool: add PHY receive frame and byte totals
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:42=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
>
> On Tue, Nov 10, 2026 at 05:42:33PM +0100, Andrew Lunn wrote:
> > On Mon, Nov 09, 2026 at 07:48:32PM -0700, James Hilliard wrote:
> > > The generic PHY receive packet and byte counters describe successfull=
y
> > > received traffic. Some PHYs instead count all received frames and byt=
es,
> > > including frames with errors. A frame error count cannot recover the
> > > number of successfully received bytes because damaged frames have
> > > different lengths.
> > >
> > > Add optional receive-total counters to ethtool_phy_stats and the phyd=
ev
> > > statistics group. Count frame bytes including the Ethernet header, pa=
dding
> > > and FCS, and excluding the preamble and start frame delimiter. These
> > > counters describe reception at the PHY, before MAC or host filtering.
> > >
> > > Append the new attributes so existing statistic IDs and their meaning=
s
> > > remain unchanged. Publish the names through the existing statistics s=
tring
> > > set, and retain the unset-counter convention so drivers can report ei=
ther
> > > set of counters independently.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
> > >  include/linux/ethtool.h                      |  6 ++++++
> > >  include/uapi/linux/ethtool_netlink.h         |  2 ++
> > >  net/ethtool/stats.c                          |  8 +++++++-
> > >  4 files changed, 30 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/networking/ethtool-netlink.rst b/Documenta=
tion/networking/ethtool-netlink.rst
> > > index eba226c79ec3..5528d0f7afdd 100644
> > > --- a/Documentation/networking/ethtool-netlink.rst
> > > +++ b/Documentation/networking/ethtool-netlink.rst
> > > @@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currentl=
y defined values are:
> > >   ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30=
.3.2.1.*)
> > >   ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistic=
s (30.3.3.*)
> > >   ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
> > > - ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defi=
ned by IEEE
> > > + ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defi=
ned by IEEE
> > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > >
> > >  Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in th=
e reply.
> > > @@ -1683,6 +1683,20 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex stat=
istics (such as RMON histogram
> > >  entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not h=
ave
> > >  a string defined in the string set.
> > >
> > > +The ``phydev`` group provides separate counters for successfully rec=
eived
> > > +traffic and total received traffic.
> >
> > You need to be careful with naming here. This is a
> > kAPI. phydev/phylib/phylink are implementation details, a set of
> > helpers which some MAC drivers use to implement PHYs. But MAC driver
> > can implement PHYs in different ways, and don't need to use a phydev.
> >
> > ``ETHTOOL_A_STATS_PHY_RX_PKTS``
> > > +(``RxFrames``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``) c=
ount
> > > +successfully received frames and bytes. ``ETHTOOL_A_STATS_PHY_RX_PKT=
S_TOTAL``
> > > +(``RxFramesTotal``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``Rx=
OctetsTotal``)
> > > +include frames with errors. The total byte count includes the Ethern=
et header,
> > > +padding and FCS, but excludes the preamble and start frame delimiter=
.
> >
> > And what would you call it when the counter does include the preamble
> > and start frame delimiter?
> >
> > Take a step back. Just because this PHY has these counters, do we need
> > to support them? And what happens when the next PHY comes along with
> > slightly different counters? Do we add them as well?
> >
> > It is vendor SDK syndrome. The hardware can do this, so lets expose
> > it.
> >
> > What is your use case here which justifies these specific counters.
>
> I have the same question. James, your answer mentions traffic monitoring
> and error diagnosis, but not a concrete problem on AC200/AC300 that these
> totals would help with. My guess is a receive problem that another driver
> for this PHY already works around.
>
> Rockchip's vendor driver for the same PHY ID (RK630 and RV1106) reads the
> packet and CRC error counters from page 9, registers 0x1b/0x1c and
> 0x1d/0x1e:
>
> https://github.com/rockchip-linux/kernel/blob/eeb355823a794954737fd75820d=
fccdab4c57af6/drivers/net/phy/rk630phy.c#L430
>
> The vendor driver does not export them. It polls them to tune the
> receiver. If there is a signal but no link, it switches to a second
> analog setting and checks again. It switches settings in two more cases:
> too few frames arrive, or more than 15% of the frames have a CRC error.

Allwinner applies efuse-derived trim on both AC200 and AC300 alongside
hard-coded PHY register settings. AC200 uses one fixed set of settings;
AC300 selects between two sets using efuse bit 9. These are applied at
initialization, rather than adjusted from live packet/error statistics.

> Its comments call this "Long network cable parameters". It also changes
> the RX detect threshold depending on the temperature.
>
> Do you see a problem like this on your AC200/AC300 boards? If so, can
> you describe it? Then we can decide whether the driver should work
> around that problem.

I haven't reproduced that problem or tested long cables and temperature
extremes. Temporary register changes on AC200 confirmed that candidate
tuning fields are writable, but not that their analog meanings match
Rockchip's. Adaptive tuning could be relevant future work, but I don't
yet have evidence that ACx00 needs the Rockchip workaround.

>
> Oleksij
