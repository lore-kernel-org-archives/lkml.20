Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0E3EE1EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101055; cv=pass; b=Zfd9pyXTAbaRJYLhJ9aBc2SqoMK+4eU0VDPz+InAC0iv3hw+I+NymrFDIY3SkvPo7y18seQja9wXgWgbFlP0ybfUCRkKoLoYAHQb4VpNzccfVOUwhgeEDFYIMI6x8Z9P3jIOWdLgrDcsUHUU9tDpTJOH+UDLS5j3HkPLtwFFOD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101055; c=relaxed/simple;
	bh=LHqqK0s3MhegjL5dQ8ANXh55c6tzTb9R7AdWVmwpF9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALpijdVRl+8khKnR4GQHNYWGbhpfM3aVdqzYlC8D2sU1o8lbAGWDVgM+PxxJ+KcmD5mJjOUT547Y23ma1TDOEFx48iS3V2ByOYGdNgpieio12ktff7kGok+LEe88HeLGfAakKJmDomoLhQ+afPcfolF5eNqIapi28ly4uwrrFng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKhr8o7f; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKhr8o7f"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so7760372a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792101052; cv=none;
        d=google.com; s=arc-20260327;
        b=QpAaP0hdUmf/Q+fDc4MTW6So5FveXXgRT+k/3Rb1HczNlqZbsuhBlE89JNIZ24lUv/
         khUyuEv+9WkCVPb5fYBYCA83ZlJAG7uz3gp5XXHxHkusCYAz/p9JTg4lt66TkUMTXUr6
         oQyIiJjC9h7fO8R5VHfqVqO1YtKuB4euMhMZLCt9W5H/hayHHDLOwH1T5XXbotljFe7v
         f5ri4tvSsU0vkUE0cJIarkiZ0y7kMTkIl+Ty6Z88UaVakAYsFlmWuZkRF/y4PuSUqlci
         jlW4rj9x0t4ChCDc0X2E6Hnom06TYd4wmAWovqhVHy4fkvqb5w54UNzSagIFz5myhODP
         PRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z3l/JvkYfEQXOwbbGLlrfyh3SUMFiLYxwMbPJvYgs3E=;
        fh=CmoN2HGRgMkzwmLnovWTYPD/sgZDlAlLoTPYzpPtfKo=;
        b=BZ7gHmGQEGeZ2+lKooJTFgBRdjTwsC+F4XubvlroCLgiQSjgNIw3HL3G2dZAnNZTQ0
         FsASLdYJrgQ69neYJrl7kMKwKYR5kEr7UAaVtID0NjHuQBSXo/Idt3mDtqbhKh/k3/6L
         /aeJL09oRG2ggdg8oOOIAJ2laB/Y+TrIjZ6FZqAWmZNDX/+uy3X70ExJ9/nRCaa+Hr6E
         I22HAthBsNk2MWT2c5nt3CU+bRvInTa6apfRkukDBVTJWj4gnOMIZ5qBDVphBKUaSsWi
         LUro8/OepDqLh4RJRpRDk0Ki6H9aF5i/WToUyYZlXxslwxylKFCWXCff60zUbWDjlCq6
         WLQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792101052; x=1792705852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3l/JvkYfEQXOwbbGLlrfyh3SUMFiLYxwMbPJvYgs3E=;
        b=QKhr8o7fQo6wYd5ci1beGIXQNsk8sdnVf6Vqv6wG5BmhXhKixt2nZGjC0H5tZ5Wi75
         IIz3mlAWF50foHK0lzwdsI0qkNVwm+v9Qqz0ajEelZSxEXhA5Hxgx48jbWGkmmai7/tU
         zlJ7pw2BRXNdhCz20FNc9NYRYql5jwqfbGCOamdGbH1mVYOD61LTPUgvv1y5xPYh0M7Z
         xmspDm3PdcN7FWr+ucN8A8/9KJ3chiBtySVC5fILgdncTflOOLiRg4wZCL99bz0qT+0b
         WJHPNPrBBnWSHIoOIp76qBDE3CaCPLTNdReUJAqJYvcmkxPI0g23lOqf8opYKZdLtY5u
         lTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101052; x=1792705852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3l/JvkYfEQXOwbbGLlrfyh3SUMFiLYxwMbPJvYgs3E=;
        b=1Z8xmg7Z07E11E//OVFuBAR4unYvqx3xlsSILtI9hkT5QE/5qk2w+EzujQSGS6ZMD4
         erJ4lJX/m2lEFGNpOpkhslfUYB5RE29RX/5aNrJ10czof+qg8hAZeAkqvdlgVDu2QmAa
         v6RFcuR12BSDSamdzrM1m5PmhOVteSxccw/H3uDBtJduF8IxQt1xFFHCf3SAIMfKeYkU
         IyXsin6kr3UEaLLFV3n1QN03qLgG4SWZTAJ1nN/iHz+Yx82GcPVl+ml4UtckGPg0rh4n
         iK1S6NFKFmQc/hEDAM0/WgZHzXn1QcaYOE8jUdPjTCwXCkQc57trI8t9O5+lHDT00DF7
         Xorg==
X-Gm-Message-State: AFq9FYJuc9Y7IhKre5ajwuRONDm6Bwr6o0nJ3OfC5wOG2L//FaCv+mwI
	69NFMusrormBAOhi38YsLhTpWXMBa7QxM+F1DANdzuy3wOfKKxUbnGIUcDyOuHvR4JFpGwIsUgm
	aUi1CbjvtE75D+iHqvQRMA44fRb9O46Ysqwd6
X-Gm-Gg: AYBFou2p12euiTTc6el1OuoC4xAPLmWge0u5+7xE2c+98VhJNfHCFt5clTSNfsH/z4d
	+SD7a+ZFCV9lUKkmlup9Gn7QXKu5xALXi9Ht6doBSjmrjr+hrJjwppMyFeR4d+Gd28ssxvYM3FY
	oqFrxuzD/6JQWqQ+rcdTQjsumE7w/YRfSJ0VuqlgDRm1iErEucWsVHbHwREADIZbtP/gn6pm0dH
	PzRePom7nVqkGVNPDXzW746DFCxaIPhs9beT7QAAy1xi+JpMsTY68Zq6Kw3EQX5BO6g7jxPPfkf
	ys+isWzNiEBiaG6XBhQ2sYq2jMFhbDTsthQXRDqKVKALrTWqfrrFTQDumVgQkQNE90Q/XyJHFne
	3XB41Zf/7qmZ22uKa/BywdV8V6t15VIdqarfLgENO9YGS3GAnZdINvKpuq//AqUb0a/X5O2/RMW
	PEcuGPd6W6N4ja/KYw74BZMN+FrlhMvIFVRkyWTSBM1xfnarS2WQhKJ9W0vMqpALaUiHtPJBPhl
	P0s
X-Received: by 2002:a05:6402:46c4:b0:6b1:b16d:acaf with SMTP id
 4fb4d7f45d1cf-6b1b16dae69mr11532575a12.42.1792101051502; Thu, 15 Oct 2026
 14:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015175928.3558057-1-rosenp@gmail.com> <20261015221110.000078b3@mythread.it>
In-Reply-To: <20261015221110.000078b3@mythread.it>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 15 Oct 2026 14:50:40 -0700
X-Gm-Features: AclHuK8liOXgbxfojrksuCyNWz7nnSVwi1wLqz12WnOn5wyiTfwv03gx2MILWks
Message-ID: <CAKxU2N_J0Rkj1k+EutCRZGui0YKMAxeq5KhOH94e8_x0apY1Ng@mail.gmail.com>
Subject: Re: [PATCH wireless] wifi: b43: back off the N-PHY TX power per rate
To: Alessio Ferri <alessio.ferri@mythread.it>
Cc: linux-kernel@vger.kernel.org, 
	"open list:B43 WIRELESS DRIVER" <linux-wireless@vger.kernel.org>, 
	"John W. Linville" <linville@tuxdriver.com>, 
	"open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:11=E2=80=AFPM Alessio Ferri <alessio.ferri@mythre=
ad.it> wrote:
>
> Il giorno Thu, 15 Oct 2026 10:59:28 -0700
> Rosen Penev <rosenp@gmail.com> ha scritto:
>
> > On N-PHY rev 3+ the hardware TX power control aims at the highest
> > per-rate target, and an adjusted power table backs each rate group off
> > from it. b43 fills that table from nphy->tx_power_offset[], but never
> > sets the offsets, so they stay zero and every rate is sent at the
> > power allowed for CCK.
> >
> > The SPROM power offsets exist to avoid this: on boards with external
> > PAs, OFDM and MCS rates have to be sent a few dB lower than CCK to
> > keep the PA linear. Sent at full power, 16-QAM and 64-QAM frames are
> > too distorted to decode. On an ASUS RT-N16 (BCM4718, N-PHY rev 5,
> > radio 2056, ofdm2gpo 0x66666666) the router could only send at 6-18
> > Mbit/s and MCS 0-2, even at -50 dBm, and 24 Mbit/s and up or MCS 3 and
> > up delivered nothing.
> >
> > Set the offsets from the per-rate targets b43 already computes from
> > the SPROM, as brcmsmac does, before the table is built.
> >
> > With this, the RT-N16 sends at 54 Mbit/s, and at MCS 7 with HT
> > enabled, and TCP from the router to a client goes from 9 to 17-18
> > Mbit/s.
> >
> > Fixes: 8615eb2870f1 ("b43: N-PHY: support setting custom TX power")
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/broadcom/b43/phy_n.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c
> > b/drivers/net/wireless/broadcom/b43/phy_n.c index
> > 22359bd9db47..c9b2b7496983 100644 ---
> > a/drivers/net/wireless/broadcom/b43/phy_n.c +++
> > b/drivers/net/wireless/broadcom/b43/phy_n.c @@ -5834,6 +5834,7 @@
> > static enum b43_txpwr_result b43_nphy_op_recalc_txpower(struct
> > b43_wldev *dev, struct ieee80211_channel *channel =3D
> > dev->wl->hw->conf.chandef.chan; struct b43_ppr *ppr =3D
> > &nphy->tx_pwr_max_ppr; u8 max; /* qdBm */
> > +     int i;
> >
> >       if (nphy->tx_pwr_last_recalc_freq =3D=3D channel->center_freq &&
> >           nphy->tx_pwr_last_recalc_limit =3D=3D phy->desired_txpower)
> > @@ -5868,6 +5869,16 @@ static enum b43_txpwr_result
> > b43_nphy_op_recalc_txpower(struct b43_wldev *dev, /* Make sure we
> > didn't go too low */ b43_ppr_apply_min(dev, ppr, INT_TO_Q52(8));
> >
> > +     /*
> > +      * The hardware power control aims at the highest per-rate
> > target.
> > +      * The adjusted power table backs other rates off from it,
> > so that
> > +      * e.g. 64-QAM isn't sent at the power allowed for CCK.
> > +      */
> > +     max =3D b43_ppr_get_max(dev, ppr);
> > +     memset(nphy->tx_power_offset, 0,
> > sizeof(nphy->tx_power_offset));
> > +     for (i =3D 0; i < B43_PPR_RATES_NUM; i++)
> > +             nphy->tx_power_offset[i] =3D max - ppr->__all_rates[i];
> > +
> >       /* Apply */
> >       b43_mac_suspend(dev);
> >       b43_nphy_tx_power_ctl_setup(dev);
>
> I'm not the maintainer, and i also have the same exact patch in my repo
> https://github.com/aleferri/b43-6362-wip/tree/main/patches/mainline, so
> i'm all for it, but isn't the ppr currently populated with 2Ghz sprom
> params for all bands?
This patch comes from work on an RT-N16, which is 2ghz only, hence why
5ghz is not touched. I submitted this since there's a Fixes: tag
that's appropriate here. The actual fixes I'll submit in the next
merge window. It's quite late in the cycle.

There's no maintainer here. It's an orphaned driver. I wanted to focus
on brcmsmac but that driver is really slow.
>
> Alessio
