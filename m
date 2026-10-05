Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8203E2ACA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234924; cv=pass; b=ZAqPmAXX2b6o6GRC33+G7lqr2dGYtK8/V1gLsqya3X88qm/9BbmCQOC77rd7v6GPm+9C4lEKeeS+pMrEfViqen09ZhWl5QZb4xqIGTftIF2OFyw19inp9mTww5y4f/3ONxNCsTKkdNyVWGdpGmqt/j5MvlmMK3ZDWlY+isQo2hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234924; c=relaxed/simple;
	bh=hqIWRi6Tpux/2qAc3lWZzGdHe7GnVUNYF9Jq8zwuyMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uu+UMe7acfyExyeQTOeJmvLjWNhvwjW591s/Tod5zrAHSCGmBBxvCO+Kpv2unur1oedkNmTDaaAqiIrQafvNxdcWaXA1c0kSBZeFpkoo/OIL1HXBaWZLeibaLSFomhUJOV+xm4qm6IJE46HrxawoEoJcFaR9vOnlJa5+4v1DzuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAFIFXK6; arc=pass smtp.client-ip=74.125.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAFIFXK6"
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6aa912db07bso1567403a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234918; cv=none;
        d=google.com; s=arc-20260327;
        b=iQXGthPWYXC6CV0e8m9X6P2bhRTIu1g9UEfmTTKkbsJs4YjNH9qt8uiPZOrV93NJAp
         eb2d+p0yDpV+pkyrziem6Lg0VXWtQoQOTNb4/Xf6xd316RPpchTO18TLd7OmxRXJikEP
         V6FNRzRwO/KHOcXlV0p3ZYXR/Ff4t+JtvrXi6a0WvM+N4rvhSC+Jfa/5WxyEBBi15zaB
         NBlNgmed9LZUQ61mIYYiuMHLkB81PxbO8SmcWecO62J4b/wxR1QDxGhIbDF5aHzWEnQh
         jST+ljIlZeJ93iT9C7EYyTv0VbEXs3CxSael1tJ1UmmRNc0pTKPqW5FXYUdVveRce2AF
         iX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        fh=DgzTRW+AM+B0apF0sAszdEH4vhVySa7MSIUNT9TDNlk=;
        b=GS17S3tLRNs0hhdLIUab5wAxKkMnIdw2Ru22zwBxcARxVCAM4edrz/WcCAcA6/3bVJ
         qSNShrRl/iTGcnHvYFZtSr3ZSyl+avSTY4Xo2R4ASMT9w9EEr/ixmq+v5Uygct8FxBUJ
         gykVumLwKxdGv3VoRS4galU9DsAniTaZ/ZAEVC0L97PvRa00b/zQpxf1B2eaN526gQWL
         usf1COmKBPMD4wItjVI7GdGVBp2k67DjVRbusdYGTQRiWdytveg+XU7Y68xr0jijkRVm
         T/DQO/6QbxGk56qyY1m+dQQp70cgePE3pmjVldQ63v24pV5O/TjLjnzYwAerqzXjvd2m
         oqLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234918; x=1791839718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=SAFIFXK6PwsIHAJFlSgsJvpLZAAAaxXXJKBVyGiqvqZBQ1qV/qA02uCQqWCcTBeSEX
         t+DfKN2/e9Ktb60blPSTUhRP3DMqSr26MBhAffDKXCO1cBKLE9KqjtP3KsFv0pTyIHxA
         flHZpo7j+AX4rpp765KRTePnoaK0oWKQq+4Z+/4tcvXmUoFWPHOVeyIeOgpmiD4KnKaT
         BDj+376D567sTBCKAKvaeBqRwnuJFfD4M+QUH+ehf/lLQ6N6RbiWhGuZWAh0IPXjUlw3
         pTnp4lofAIsfNCiGgwHnH65kdXQbWx+FYypBg2Nl4EWOhIl9WB5K4to+AWXCWn/RXY+X
         Ac/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234918; x=1791839718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=Dgm1q9ViP+Egfl9NYcTTJU/PjyvELDz3zlS5DK/qhQsr3m+tny25pBxB9ZxadniiR4
         6KF5MtdZmmzACzZRgjmk076B/26twFNi9TmIFofa77sLqC6fWIwTkLegqD+Oj75ThhTm
         /S40GPSAotMInnOB9KZrIFx0NFV+LstANGcS9vMpZomE5flH5uQfcclLynF61oEPMwaF
         bzo/VNCIRah2o0I+CeU3NqaOY0/tp4mjv5acQ3mwo+8VXRJYAPpSuKGGwVuBG0mxYJbt
         hIyG7PbRepfV2DVX2/SVqkbmp03opwYI4otIlRHmLl064gozw6lUEOPnuczxPEru/riL
         +b9w==
X-Forwarded-Encrypted: i=1; AKwUvBwf/O71Qd3ohn8xCHrGWQG+cOYvwUrNdGopcm2+AeNKSjSNEIVDONwO0jZJVLOSttMHCqCG6lojz+ekCz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3N3LtwfKORYVDpoduhriMG2rAJ/Hr7CDe3OpjTOXnEblkJHXw
	7hnwXC92frZQ2onSEi6dxHp7IQB+r7OFKrcAKPBTQrIq2ikz9XoDKv9ylxJgKRoofyiSOSB2Dyy
	+Giv7PZsf0Q1RJbGetupbIiP6hPAwxek=
X-Gm-Gg: AYBFou3jYKoOszh/fQRDWB80bV+e1ZubB+aldheB21ezu0BxEBuv1XnqkKFM7ZkH74d
	78MbSvL/jUhrtMEtiFh/mH1PtHui0BXEwXLPRdF3ER/wTBN8JYbsGfJLLtlhvWbFsKRGQiX1XGd
	PS3ZYBQp53mmxT5ZkYlIEGAyLm38BJWhyj3Gjzj4T9rDiuOdULTSRPT4BClDRI3Dvch94porG+0
	uml6savvq6pqKmAnywolTcb8/H13iPqLaLJeLX0nb7P8MnIRFJbMKYhgaRs0Es2cMOELpcnTUNQ
	U4yr8JXS1QFfWv7rN32X8+seN/6CYOYvYl4D5rghr5k5E2xkDUi/C9vf4g==
X-Received: by 2002:a17:907:7215:b0:c2d:bd95:874a with SMTP id
 a640c23a62f3a-c2e4ad79199mr1112515766b.17.1791234918176; Mon, 05 Oct 2026
 14:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org>
In-Reply-To: <20261005135939.01ccde50@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:15:07 +0800
X-Gm-Features: AclHuK-hmC2IHermBe0I62cu-4Uo5MfOk7srVIbtbJ9DQ0aB5gykKJWKnA3WMzU
Message-ID: <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:27 +0800 Coia Prant wrote:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing
> > the "rockchip,sgmii-mac-sel" DT property.
> >
> > From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >     0: SGMII routed to GMAC0
> >     1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > remains at GMAC1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Out-of-range values are rejected by dtschema, so the driver does not
> > duplicate the range check.
>
> While looking thru the patches again I noticed this is changing generic
> PHY. Maybe you can send it separately to Vinod? I don't see a hard
> dependency? The code can "converge" during the merge window for the
> whole thing to work.

Hi Jakub,

Thanks for the suggestion. I looked at this again, and I think the
dependency is a bit more involved than it might seem.

The PHY patch (03/11) adds the driver support for
"rockchip,sgmii-mac-sel", which is documented by the PHY binding (02/11).
The DTS patch (10/11) then uses this property. If I send 03/11 separately
to Vinod and keep 10/11 in net-next, dtbs_check will flag the DTS property
as undocumented until the PHY binding lands in mainline. That would break
DTS validation for the net-next series.

Also, splitting into separate series means each has to queue and get
reviewed independently, which I'm worried might not all make the merge
window in time.

So unless you strongly prefer splitting, I'd rather keep the whole series
together in net-next. If that works, would it be possible to coordinate an
Ack from Vinod for the PHY part? Or if you still think it should go
separately, I can do that too, but I wanted to flag the dependency and
timing first.

Thanks,
Coia
