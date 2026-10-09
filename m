Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD5372B27
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566584; cv=pass; b=j5J2cE8ub3YjjiDjQxM33VY/yuvngGdQrs3WoDYmC18BRKrtTuf/qxgAMRXeqpNqgBuKpeBMYjMM8CGXRFh3myklqHzEhsjgcUQJR/zMFeTxMWVZx4j2m8nYzQniQ5JPN1OI2Dd1xIVHO8ruR+PZLjlZGUU3FBZj7bhNniHQTGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566584; c=relaxed/simple;
	bh=6YU4XgoArXKK8lKx2eYgqh9xiuQ1vBhQ5b9X5+uvwlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQ7Hq31Tu4qRNsldZV6b1/nxp/6tZdpGmooRkwdTXPYCHuc5K9G/kUJ+pqao6n9NW5OGglPxp4dAsCiF9CLWB/fWRcCyCN61n8sleOoqch9msF0IBexB+9EOXHjYas7nyLBe1FxO1YueMcGMC0ROmbpJXowZy98s7M0qdANh8i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK9/BTpF; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK9/BTpF"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ae8607e8afso42595247b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566582; cv=none;
        d=google.com; s=arc-20260327;
        b=NCj+v+oZtsztDTG7ccjko5uhXMCcqiYPMMdDCj37w8gGWOp+1oG+xiK4izN/iJnWuy
         EGUPa75LNxHkQ4WiEllDcue79q0u3jAvVpB3lDhVwd2Mx7KbwVxiFk8GPNGvuTqxd9oV
         2uGNaDF7lX3Z3jDKYyjB4bp8CjMe0bUo4tlFtJDMdvMKogESEzmdB4MVvVeDSVRt/9FL
         /thQDov+7QAhX3XF2cvsc9k+FuVBPIFy+FcHj60R1rONC9+FxxnIlZKAdSdmDf7CN2aN
         aSHJzFVeg5k2q9Z8qvbRbThhmD9g9LYRiSv//QcHcgpf9VpXvXkBTekfKx4xb2Wht6fx
         4RjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        fh=wFykaPYxgiTxWYQhhvd7JlfdArhytUhDgiClLrgplYs=;
        b=qZ4Ou80alqXjY+eyCY23CV7e9PbbJWhyMMn+S/e3+z+mrq12mmvNoJAU9noiM/1bPo
         MvmvSowXennac2iDIhBMRFVesXuOEVxCDo9TO9EeDN3f243mgtBpS89UcqQobPlouIEG
         fu2hQtCcmcT6oFrgPZb+39JlwhUiBOm0sWRgmc9UOqUhGWq41aWJFl8f9ZsiMbKQBcEZ
         KfbkjM+MpXD3HAtQ4lyEmGRlVn0WLk29ypvOQdZic5dX4ZqlxQssl9DTzAFnY9DviyQw
         KlAB47d+cRtVYDgtYc4FyUe7lBoC1lv3YX+OSMQBm0A3/2KcWTgZY7j12YH5xXrQ3Kcl
         891w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566582; x=1792171382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        b=lK9/BTpF7JrxClZxeERJ1j2HBG803kIo6gesCjGJBJuCGXaA2IncbaaHE9YfurClZ+
         5KqlwPGpD0uzeYiJ59vQL8QN/P5/DS1RSEMbzHbdNPtZKSK7czP0NFWlVEzShkyYRv7f
         mvCzSiZcCJSZJt6x6iu6FfK9wuhlK2tRHu8c2V9wT91CeAWEpubR3XcNtjkq7sVi/8uu
         YeATk2fmsInZxA+m4ZZz+V9zMOelw4398GW8kLYqThM5Cs66J+Mu5JeizNQQ8PAXDT0D
         fFn6OZiFabDm2ALs/d7rIQBCwqtFMHmZcgigViofvMFSi4utiq50shHr3DkW9UCSSnyj
         gDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566582; x=1792171382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        b=lBnJgtVYvCO4w6cmLvA+gWMrO9l/rb327tHzIWyqsxanbxUX3dFN8Rzmd6EEN9WHkj
         9FQvonbBJH5rYfj3MhOcYjY3qDEWF8n4xaz96WxA5YWg2Ce8WF3HJsfOsNuUWDozECtW
         79EUepwRy1xI+VH6b5jPPXMD2BriliDSEEUWwyW5rJR5E/VOtXcxGloqpCS2AGe+voLZ
         2M94/4eRigAhtOCUBSQGDSU3lcUqf3qtMzn128K3BVGwB5UV+pu/q2Qf1NcjpeS48m15
         Dn4o27YYtNNdxhS5esENRK6nhC0DzFiJ6vsBPcqrMBIgN8yyNi0c2MXynIq1UglRU9Zk
         SWog==
X-Forwarded-Encrypted: i=1; AKwUvByaQ63gn8Pa129pwta9bp0xB50xy8uJ++FeZPTc6gfUaTjlX9Rxgqn8Wpj55oj5NspcnRGAHdtckyamSuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2X+6Mj1DtexIjoY4KUxwfnPpLw0p35BFklkk1lN2oMtZUy0ig
	Kvw/+4h5+oJYz2LqyRy42tjAgadM11JcX0F7v5+/JzSddrlwf2XX/5ZvaJCKtGjik6BnLSnhGMM
	XbdYkBjwnOyPrCVSpyqIL2kCVv9AhJ3w=
X-Gm-Gg: AYBFou3Y14GvuTRq1TsLmEaaZO1bS25wXFBPUSMGu/NCNwaSC1l58tjBM5TPPA6ekPf
	FtDxt0a9+jyBUeW24y72Qle5lYljFHW7ntLGiZGFgCfrDJjtpiQUOxqyBmJGD3tul4fi88Rnwl7
	BnSqyKS7UcI2HP+uUjHPck82BYpbQuOzl2Q+YRtJCtXqkHuidvQpy9+vRBSBi1RUqPBv8vb1Hbc
	g2DzTNSuakLb/Km8Uxhr6hdWA1vYNZGaibytm17+U5oZdYkmUuLfst838UkqbPpIhxefhCwE2Mp
	er5H6pjM7QvxEtUudgC6HnDRdszSN2+g9Q/EPv23I//4GgEQlmy+4hBzrxkCvrYQ2JKIDG3uh7D
	sUlsV0K8amNXd0XqvVCp2uDc=
X-Received: by 2002:a05:690c:281:b0:8ae:c724:42b5 with SMTP id
 00721157ae682-8b07ebf60fcmr8646307b3.5.1791566581813; Fri, 09 Oct 2026
 10:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915125226.20579-1-ansuelsmth@gmail.com> <179000484817.707534.5059164498545591038.b4-ty@b4>
 <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
 <asZD79RRF4u5OJdn@x1g10> <askXRONt8Si264ve@x1g10>
In-Reply-To: <askXRONt8Si264ve@x1g10>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:22:47 +0200
X-Gm-Features: AclHuK-SbB5oNH02iZdZMOXyHo-ctNQBKsVcPWGcnDB6my47wEggf0BJ5HZcjuw
Message-ID: <CA+_ehUw7374O63trsUORkfMbhMJqiXn_WkC_KL+hTDnLAa2=Gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
To: Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 18:33 Brian Masney
<masneyb@kernel.org> ha scritto:
>
> Hi Christian and Vinod,
>
> On Wed, Oct 07, 2026 at 03:06:55PM +0200, Brian Masney wrote:
> > On Tue, Oct 06, 2026 at 01:23:36PM +0200, Christian Marangi (Ansuel) wrote:
> > > Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
> > > <bmasney@redhat.com> ha scritto:
> > > >
> > > >
> > > > On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > > > > clk: en7523: Add support for selecting SCU serdes
> > > > >
> > > > > This small series is a split from the Airoha AN7581 USB PHY series [1].
> > > > >
> > > > > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> > > > >
> > > > > Changes v2:
> > > > > - Rebase on top of linux-next
> > > > > - Add review tag for Documentation patch
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
> > > >       commit: 11952173d8a180ac05641775f80bd6946327478f
> > > > [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
> > > >       commit: 4e39820b601221997cb2220edc830f92367cdfc2
> > > >
> > >
> > > is it possible to have a stable branch/signed tag for phy subsystem?
> > > Commit 11952173d8a180ac05641775f80bd6946327478f is needed
> > > to permit correct compilation of a airoha usb phy driver.
> >
> > Yes. I'll have to rebase the clk-next tree but it's no big deal.
> >
> > I'm at Linux Plumbers right now and I'll send out an immutable tag in a
> > day or two.
>
> I looked into creating an immutable branch, however as I mentioned it's
> going to require rebasing clk-next (actually clk-pile). I'm willing to
> do that, however I realized after I sent my last email that the laptop
> I'm working on right now in Europe only has access to my kernel.org
> account. So I'd have to rebase all of the prior commits and add my korg
> Signed-off-by since it's going to change the committer on lots of
> commits from my Red Hat to korg account.  I don't want to do that.
>
> Given that we're this close to the merge window, I'd like to avoid any
> kind of risky operations on the tree this close to assembling a pull for
> Linus. If I can be convinced this is particularly pressing for v7.4 I'm
> willing to entertain the request, but I wouldn't be able to do it until
> Monday when I'm back in the US.
>

Thanks a lot for the effort. No, no need to hurry on this.

It was ideal to have as it's currently blocking 2 other driver for
submission but it's not worth to cause all these rebase and resign.

If minimal changes are possible, it's totally ok to wait for Monday.

If not possible, then rc1 it is.
