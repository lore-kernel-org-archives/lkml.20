Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81542558210
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924347; cv=pass; b=kMPGOYt/03VRpVkhjmzliXbcYJnCA5zOTBMK0W7hyfq1DnHnwkZlkGf0iRAw9GtLJeKCKTpuK2boB6YRp9viRZPDaJDCpOHR0pEeBy80KCIl7TUw79RvtVb8gwwIm5scwDMCt2nZRr99BicmyGvdduwhW8lz594fjZ8WPMAhaJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924347; c=relaxed/simple;
	bh=LOQJGUd0tb6sLwP1Tz4JHSrE5KDQUrXVw/iMmut2Skg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxVXxKecZ357fRsBq6Y0FDl6vY93divDoYhD+hCRreIT0JXS0ValHwUNaeUnitaa8r1gt0AnF1KaCbQqv7PXbfoav4Oa2bagUVep6EjMEKBEDh0IyHPQCJ1VApM48e/We36Vle8MbE6Pwqa9Gla3CxmMvvEOfvStHexHvTc5kFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB/B90oS; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB/B90oS"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67694513f2fso2680191d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924344; cv=none;
        d=google.com; s=arc-20260327;
        b=GlsWEYOoaDdxQTLojAfV8qrInpZ0lTY8NC/lxXueRWn5lUKQOqEo+8BTwQ8YLxmfAL
         lgj1orVy+2hmmw+7a5d9v9fwPCiAqUCFfijepUY1n4CmTiZav9LJUKpFioHOdglOSaka
         yLlR0OVozSLWJeSAJbWJMtpFad/QetCh97WytLL6M5BPfgxThX6Z81AWlO7N8vk/qKF2
         zflyU42xP5hPHUfhk8kcBl0MdjGame/V9FH7Pjm2f0eybfK/r1oHqg2l1cddnv/1OtuV
         ooJu7xNL00bWfWe7sWdN4mHcWWeQ2hgX9tigBXFtI78TAmlBF7y5fQnA3Qw69N4yKQ9C
         Gihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fWuW5Tulp1PkJxc5NJ3dJaM8+S2XORNyQfLC7kk9yRk=;
        fh=Tmd4c2j2aV2yi13pviQNFPXlmeOMP4hZPzhYGlBf6sM=;
        b=suWzvyCTnZaM4HH0lmsD69OOiB6NEN3QTBCTSsuf810G+4ihZ8uen6y1orWFJiK1R2
         c/RicCTf+jxCafuGujGAQsbV5mJZ30yGwcjYQe6KifnOBA2N8ynapbSd2kE8nBFhxY6r
         ciZrfipRXJV7HdYBL4zu2B+/Ug4goqdQoHgFbibt7iGoO/YSssoLv16c+7CRerXeP+x8
         xFC3YOWPl2MsU1VPJUTtvAWOsBs53JBSaQW8zHEttb1HRKPC8PBd2W0ynzZ5r1Cd0GMF
         xpbl1EQCA8Q6tVLe1/HS7XHVpndi1Lj5aq7nooj60RBGvMrRDdeyXcbZ9skx8NjIsXDw
         FnxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924344; x=1792529144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fWuW5Tulp1PkJxc5NJ3dJaM8+S2XORNyQfLC7kk9yRk=;
        b=NB/B90oSlA3coXq6rsIfpju1Wy/mGE4vhSI6eACgG5NAXnH3cbMb70Y9IbriHYnNpq
         b2iixFyxyAlQ5kczmgQjPqX3khfTqqX98OfKnWOkjDBxoh1fQ+qjdtzJ8hUsTZy8ZD36
         q4Dt14CnVjIGrKXAkM1224n2Ra4uF/3vNWSPOOcOObXVP9kiwKR1hzOSUOlDtOHCXEho
         T4v1S3rnsKsXpQFK5uVY7Q8kqH8yTpDIUknTaBF43iMMHJ1GNCg/OS9lZWCJqbRtblyN
         AvY1Vl8pqbAzNYsebvLZkMnx1TLjgqNc2IgEQAfJuUPpZgm045rEMjgd16+YwyviDEXR
         mwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924344; x=1792529144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWuW5Tulp1PkJxc5NJ3dJaM8+S2XORNyQfLC7kk9yRk=;
        b=KaB3d6IMZ6VFykWSOzxOZUC3fdKzCvH6Y3lJHN7M7u0JPYTxIKpf7YeFedtSNdCVs0
         vmJWGbzDc8p9EJBMH7e7dv2i2yvI6ppS9O10QkD7ApymvgciIVAM4Xo+lvqoM4nqrj+J
         OkjNPOZD0iqmwrYWZsPclb63WH77+/nrCl2McGlfy18Dy6Jbe4qZUJ+g2MWKYEXf0BtJ
         cH3XImLkgHy1SO5pzP3Dr9FsjP96BGcHXmjTXGYPUpY3HYvHQC9lq0herDNVPxXsHTq9
         KzD5cArpzZn9oEFPgzp617vAg/sOMH1Nhlw58whFwWn0ypLPr7RG0lVh8fKOkIgysYlZ
         xUIg==
X-Gm-Message-State: AFq9FYLlpEs1GxD5b8qLuHy30WaSi3oDrufACbGbxRUIY0+L5eFcH3KN
	ECzuIGkU/zaaJiMnzrhJzNJoS/6sWOj0Ud7gHGUlEFDvx4dNAlHfuOHcSZrl2ZYiHsVYRWvfVEf
	chWeigfShDSwQAbEkOeeRNWl5+61Owf4=
X-Gm-Gg: AYBFou0DmrtcREHVcW7VDmplUFEs2oXEBtLi5qJiGo7OgesQ/EOAZebvkv+xjs/teyT
	CpOFYU3qDYw3G+eEluAi5c9qUuQ2RgXhfgf1MmW9adDQemPw3r1iJ48J6MH8Q9j2zEmooUd48Kf
	/MPTFXt/GiAJWO16nfbgwdZF3QDGwqXkF+nQbqBNVTbfMHCG80vrSI+lZaZ5zmecioeKoCyLKQy
	kC/jbGab4oeI/sDjkxhUfS96eAByUWbPQx/CSe2dK01WdOdDsopzMo6wEPdSRVRbYSFV8RfroUS
	lmMB0jFq/iTtqr7A4auDI/+8exML8rYKAd/3AUFGi11e2BxWXQQBgOFgaA2Lcl80LKwIxHbblS2
	PdJ/gB6zsaE7+zTn9MxObVxD5G+RGIBlQcKA+PoZZ
X-Received: by 2002:a05:690e:4391:b0:675:3d40:3c34 with SMTP id
 956f58d0204a3-679362b7b92mr2567508d50.68.1791924344382; Tue, 13 Oct 2026
 13:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com> <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>
 <20261013070549-mutt-send-email-mst@kernel.org> <CAF=yD-KdTn2rHyp_j8ORr9F5hpm=TzaPRan5+gvLiYBd9HP-sg@mail.gmail.com>
 <20261013143335-mutt-send-email-mst@kernel.org> <CAF=yD-Lz92nGVFab1Dq8M9VusDsKf-ioda8KrZoyh28x3Xtg4Q@mail.gmail.com>
 <20261013163706-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261013163706-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 14:45:07 -0600
X-Gm-Features: AclHuK_JpsMMVGA2qpRX99GQPNBQTbwUfDE4ZxrsneX5jMqoFaA9d7dnLCSivEw
Message-ID: <CAF=yD-JKeej85t+sCc_5K0b122uw_LiKWwX1fRL2V-QLrGA8QA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] net: resolve uncommon partial checksums at ingress
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Rusty Russell <rusty@rustcorp.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:38=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 13, 2026 at 02:32:26PM -0600, Willem de Bruijn wrote:
> > > > > > +
> > > > > > +     if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_t=
ype, inner_nh,
> > > > > > +                                            inner_proto))
> > > > > > +             return 0;
> > > > > > +
> > > > > > +     if (skb_is_gso(skb))
> > > > > > +             return -EINVAL;
> > > >
> > > > This is a risk the commit message will have to call out.
> > >
> > > I tried with this:
> > >
> > >         > > > We can't easily "complete the checksum" for GSO we don'=
t recognize - GSO
> > >         > > > assumes knowledge of the protocol. We could segment ign=
oring the
> > >         > > > checksum then do whatever csum_start and csum_offset sa=
y, but that
> > >         > > > seems like an overkill for something that should happen=
.
> > >
> > > I guess I can add a more detailed explanation about what the risk is?
> >
> > Let's just explicitly mention the consequence: non-standard GSO
> > packets that previous would be sent may now fail.
> >
> > >
> > > > I don't see a simple way around it. We discussed segmenting here to=
o,
> > > > but that requires intrusive changes to all callers too.
> > > > Alternatively,
> > > >
> > > > 1. call segmentation, but only to see it remove the SKB_GSO_DODGY a=
nd
> > > > thus verify that the TSO/USO packet is valid. Still drop otherwise.
> > > > This also does not add overhead, because it would be called later
> > > > anyway.
> > > >
> > > > 2. a failsafe off-by-default sysctl + static_branch that skips the
> > > > drop when set. Messy, but so is the situation we're dealing with.
> > >
> > > Tack this on top or do you feel it's needed straight away.
> >
> > Not urgent. Can even wait until a report appears. But worth taking a
> > look sooner if either of us gets around to it.
>
> Maybe if people intend all this for stable, I'll feel safer with this in
> there.
>
> Just to make sure, the branch would just short-circuit all checks, yes?

Ah option 2, the failsafe? At least any new failures (GSO) that could
cause regression reports. Operating entirely as before this series
sounds fine too.
