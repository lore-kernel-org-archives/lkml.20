Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547943;
	b=YY+nkj76kyMIgB5nsLJj48V2UaHXXFSPcuaIWsEWOQQ/7VaVREqxljT8TSqPGb3egKfs
	 kDCV6iQfns+3Zy13L49ehY529+egGNfSuQ5teeElava380qbQ+0aPCoHFDYva/LxmPno/
	 cSKZOwMtBMGDfPSQMtgwtUac1e+jGPLUr9VrM24WBhYpkXTAUENY3xaR7bIMr+RBKGunA
	 bp2KLdxemp4bZXMFGMpxNHPvfDti9IVG9Smc4rr7kApq9Qwkr6+oP5g6LJmP8rGBwE3gH
	 Ky/Fs5GhqcmyFhdPMOKnsArLzsSySUt/SooL5TEGDJnnf9WJhr4y82DmOI/PsVOZVrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PMkxrO97b4yYbWVhj8cUtAkoX0Am73APWYvTvRhYbIc=;
	b=vYnpOjrWLQGZ9TXR6VC0ghObJLa4xiHDqMnP/OEOCLxxDawLBuw3mPtbUmk9W8i53pnM
	 kqV9J1QNogS2VlzZEd6rC0482OPfb4agdzFzdCg6SPgWgruq02MB5zYFZjZT8RyNMengd
	 VKuTqGheROWlS0lWGrdIB2D4SP0qs0T3r3NKkUKYZJ92B1rGrR5UT3E366SMUqoooNS6X
	 frTJLRLnX4juDXJtrA4l3g0fB3bL9eS0BX5UwqfeRCVV1kHXJHK30ny2LgzZat/DVo+nq
	 fwmw/2o2xyfPi6/HtqPbcjVFDPs55reMkNF0F5c6MceBD1TlhiG2wSq12mtSxh9+b4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7Bz1cSG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C4606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7Bz1cSG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so108564266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547941; cv=none;
        d=google.com; s=arc-20260327;
        b=nDYbixFYYUKUhSvfKQIEOy2G/xCCNQmjVIc9O9Kfk5Ywd/DFLXNonyd4/wTDmfjcFw
         cwK/1n44C+2bplT1Vkc+nws+5lbsNOqODaWVkRL2M90rF9N0dxniZ0hVWLbmsVFfdSGS
         b1VEJd1Lbv/qJvErxPGDBFUp+ECPQ7xCbLqAsyEH3s74GHjyGhyL1ez/b82eJeqhBkwV
         mixTDwjSqV5QaMbbSKsuGj7u8AluPO7rpRX7fMi7SWiuic2wyeXrcGxHtYtKxEXZ5n8I
         XnSOCqh1plwcx2pG3XVZ1HMNDN2Dx5faU1DDh/KtyEYZVYvHFBdWmo+MIsY8xHWWReyq
         5vNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMkxrO97b4yYbWVhj8cUtAkoX0Am73APWYvTvRhYbIc=;
        fh=uWjsPH/DAX1xBkJvd3ZlUPTRxeA7sM4iO4mV2GmB8Y8=;
        b=DVMjK5hPm4nUO/aPExJ1vdvRHBXYwgX6sQXqfMRHdWkgwedoe8W8w+N/7ssxlE+DYE
         Dv+c0Tr0IaC0sdEQvwV9qkOE9nsDJUwTLJUy6bWo9xt5mBkRpHFBad0+87KVl1I3Qfs5
         tOyAytIQAmyJFFfSdKYDXs6BU1vRET1XW6O0qf/7O1E1OXAxBu160OLe5Pn9KvWKZieP
         rKVL+LQYfzKBwRupkBK7jUP+R6n3v9NBRAQ86XNbZjBixze8azRvdXaog9p0dOVwLTIC
         NlojmCb4xCsWEAzPeiUoOrXGM02+LTPXFm0GIwHhWkGapNIhrp6OjTiDqa/cHrBI6Pn5
         E/tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794547941; x=1795152741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMkxrO97b4yYbWVhj8cUtAkoX0Am73APWYvTvRhYbIc=;
        b=i7Bz1cSGySrpRLfuA2G5mTTDTcA965wGlPtRw04ytS9JqqYi4jWtdPDOc7qlTXQO/6
         D0i4sQD/m0/DQRp0MDc0+cYAXqGLbhFJaNZlS/iXQee9ohRuSTb1foJ32qK2vCtogbnR
         xcW4S37KeBsulUEk82WYoEhAxEM3cvqfQ4Yo1iO5UZmb84UClIbd6LpIulNLBeCjHuM8
         D1hc3K9YvSEqPKc8GoK4axF7VKyrbtGI5d6st8BNcRv+DK+eA0izIbUmJ/dLpz4DMPgr
         yRbI8lAWwSb5RBR/8LsM4Bu020xg8/eIeBrNNduTnrw0YqervkxBPcZkdRNUxtIw8Uyi
         hApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547941; x=1795152741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMkxrO97b4yYbWVhj8cUtAkoX0Am73APWYvTvRhYbIc=;
        b=MXsXAumZERe0ihkClrTZulIA2G8vl4o3S0Sz9jsPiBe67fDxfCG2Wm2WuraKwPtj+X
         wAS6tCilrBb5BEKdGHd40oYSufxZpWxzeoersvLSD5gaelmJ9AMueOSQ16RVuACu6Q9d
         nyKj4lpIJujjWFmMwYhuOXnbFEc0M1pUXhCB+yqeOPmJWeXAhbCXNyo9JEg7Z/gojQC1
         YrX8t6oJbaNFiSQo6JGQdwSiSnaL8k/3ErmKc1TzzcoRGDu9UV1tazDWR9a4zMdKT2U/
         lOR543r69JU3pVlBNEDh4IEzmZ3CzMwgbAvCaW7/28LC9vhKI/FUsY395LD3LafdHVFE
         OlsQ==
X-Forwarded-Encrypted: i=1; AL+hErGBW/z8htV12iCpn/D1tuKost/O8Bc91SWkaKcV3M4CxsD9q+PKut+J+C943VdcFUUPG7w0Wa8KVqi1Bj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/52jUp7BIuc4PuX5pngS1WGJh/PRaTBuIUtQb8/8A9gVdw9Y/1
	E/Wmsry37SFlU1ct/VNRrtjvK1HQjjltHonU1FMhcd7ChNFw/FxkOetlHIHzQsMSsSmdfcUaYcv
	GXpP2+ksBe2+bELNmz+fLAXiopiY4T3Y=
X-Gm-Gg: AYBFou2x5ueKya0mZ6Z5vDTn8Btx3DhEfiLk7Asu+qC0zYY4OqVFoB4d2iAnO76KHS4
	7HIdZ/MyTrxFUDt/DVHhbK1TpZse4w+X/Iep9wFZfe0+P6fDB8oVWeZ0iweWieH94m5V35w5/sq
	PPdyh/Ef8yuJVzVSy8Jw70uAelWvACBfij1HG5AAOiMjLaLf1l9xSlkV6qGemuvB2LzB+G19a4Z
	7Eez62dhANJTlTeqr/JQ4TYSm/3JQtT6qwf7bixMeTqi0PvExMD2++9MrDxezdv6d02W2oJqSQS
	uE0/CkwzFcov78GDZmkmN4+wl4x0vDLPpegZI9qIL2gxqiBm+RcBd+xwKFdlhEDDoN1nnHzx2Wo
	FKqmHGni7TGMYTsbQbo2PMERj37f8P5W4QcNvB+ggFAD618dw15C/RPEQPAUbLJD8y7kpzxEZIU
	kk44Vazhzvf2av3vnQmlP6VZWUNBcqpUuORGfi3xn1ubO8Ng+0G59lmNx1OQztqY9G4V88YuNzV
	oa9gzlT5hOHVwfII8p6/bczRuTOfPAMOtJ77VCKa9Yb69nrZw==
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr139709166b.48.1794547941457; Thu, 12 Nov 2026
 21:32:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110014313.1586633-1-rosenp@gmail.com> <20261112120835.jhn7kbktc6fpcbof@DEN-DL-M70577>
In-Reply-To: <20261112120835.jhn7kbktc6fpcbof@DEN-DL-M70577>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 12 Nov 2026 21:32:09 -0800
X-Gm-Features: AclHuK_Oj6JOWF2brwq_WBXYttccflddgxa3n2BDAOW2bY8VaPvLi0wYucZWSm4
Message-ID: <CAKxU2N-TdAD8uCK5FJ_bNcFDhUggoRSwXVow2dasMSoX-sGAdA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ibm: emac: fix MR0 write in emac_rx_enable()
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jeff Garzik <jeff@garzik.org>, 
	David Gibson <david@gibson.dropbear.id.au>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:08=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Hi Rosen,
>
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
> > Replace the open-coded loop with read_poll_timeout_atomic(), which
> > stores the full register value in r.
> >
> > Fixes: 1d3bb996481e ("Device tree aware EMAC driver")
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: use read_poll_timeout_atomic
> >  drivers/net/ethernet/ibm/emac/core.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/etherne=
t/ibm/emac/core.c
> > index 1b95b4d5deff..0311131055f7 100644
> > --- a/drivers/net/ethernet/ibm/emac/core.c
> > +++ b/drivers/net/ethernet/ibm/emac/core.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/string.h>
> >  #include <linux/errno.h>
> >  #include <linux/delay.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/types.h>
> >  #include <linux/pci.h>
> >  #include <linux/etherdevice.h>
> > @@ -248,12 +249,10 @@ static void emac_rx_enable(struct emac_instance *=
dev)
> >       if (!(r & EMAC_MR0_RXE)) {
> >               if (unlikely(!(r & EMAC_MR0_RXI))) {
> >                       /* Wait if previous async disable is still in pro=
gress */
> > -                     int n =3D dev->stop_timeout;
> > -                     while (!(r =3D in_be32(&p->mr0) & EMAC_MR0_RXI) &=
& n) {
> > -                             udelay(1);
> > -                             --n;
> > -                     }
> > -                     if (unlikely(!n))
> > +                     if (read_poll_timeout_atomic(in_be32, r,
> > +                                                  r & EMAC_MR0_RXI, 1,
> > +                                                  dev->stop_timeout, f=
alse,
> > +                                                  &p->mr0))
> >                               emac_report_timeout_error(dev,
> >                                                         "RX disable tim=
eout");
> >               }
> > --
> > 2.56.0
> >
>
> I think the v2 conversion to read_poll_timeout_atomic() looks good. But I=
 wonder
> why you dropped the tested line in v2? Was this version not tested? Eithe=
r way,
> the commit message should say so.
v1 was not tested separately from other changes. v2 was not tested at
all. The whole point of iopoll.h is to prevent bugs.
>
> /Daniel
>
