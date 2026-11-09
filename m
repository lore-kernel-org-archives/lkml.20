Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794225008;
	b=eTGJwxPLVeg7GDfabYdw/Vjt54LDrrcq2SDmCoV8iAyrN1SnLwPGxWepwY+OZdRGwWTl
	 Ad4OywCBQ8nLi0bUrY/Uyemaox9n+v6XjkpR8P6XL2EhIgt+rLeE9+RFfJhMUm6fQ99In
	 Vbwy5o1YqKbU2UkCxSByC5t8HXJDyl8/5FaVvhfRUsNlP5+J3ManAfxoeDCx2lAY02rZP
	 Aw3HhbH79UHYv3XgI37tB+ZoCf9/iXpy5vst/ooYy8IIka5siT9zxmk0ouEX7U6RpCZgi
	 dON9IH+WuC39tBRgKgj9DT9pPykFopWITQ2BkTnlk7gHK52go+8PtbY42O6C5soYVfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u0TI0VRhkkEuzSSXfjCVwhEWLOzK7uV4x4syO3ophfI=;
	b=ZcpBKAv86g77e2c8C2mmDwrBI8esU3dRtO1uclB35HWwDCuLFn2sG6idBiurWozbeIqM
	 V1SKo2y9M4A39ojNrOZh0IxqniO7C45heZVE8h0es+nOjZKHFXeEUZzKAPeV0VmdVI4bn
	 gxNOWI4xlLHc5zObafxvdF94Ww5rL8R05rHTj3dBfG8gflncBeJlfq+HBJ0PnP3pIWlCi
	 hMldPr9wTLx08aBL+FbVBpfYGh4HlU3JdDdsAHsx6rMj35LmlZ1LNXYm6C1wYG8n0FJRT
	 ua8MWD1+rp/nnvRJSEJucD70k3Mo4Tm6KC1jmKpveDr6aH30FoT28QReubtHXY7E5Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zW/EhxmY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D578606D805
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D578606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW/EhxmY
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so1749938eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794225006; cv=none;
        d=google.com; s=arc-20260327;
        b=T6F7HwJlLKoHa7CiPo6nYtxpCKghrOn9hYQSA7St2u3T5JR2nbeQFCaDWWKlkqdfBB
         Lqj5vlDjjMb4tmDeuvjyNmJlItv9mI1pi+bsG7RdVE3plhILxcvSd4KGbIXoccrZLTGD
         4FC61VlU87FefW0+LD67W7rQjtm5jDhdvATRg+s0GEfr2jdQlCPn4ZBspS2pagB2u9jF
         eX/wYIhxnyHPKbHe1lsETZYdw2lkeWJUTDF4v3z96BLKSdloyyKQo8wJvCGhOQR6YPTb
         jiTkMGsu9m7Z9RXEbcgEJpYpudhkfOeEloIqBt0WTQ5vlta6FL+sC95xtUxaIFfUt0ST
         zOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0TI0VRhkkEuzSSXfjCVwhEWLOzK7uV4x4syO3ophfI=;
        fh=fdaMQuMGJaMgixtcQA7Dtdsy6PjKMTh1v1HtoI+20sc=;
        b=QXhCuHqyMVGy/9jMP3GSRxpar45yoxZq2GX5uyOIxwoBwnv2QC3RFb8UwHb+pgjDmm
         LO5q5CmObKjWIvYIEuuKfmn/rj54r8KCf17v+8D6dewNLwkc6hm9TFoUalFcxU5s9p/1
         q9uCave1zUAZ5xApzZ2nsDW04FzhhCwtrIw3idbl6k7V9+B9iH8x1TskyNWri01hqXie
         zQV5rcT78w12odF1nomY0EWW/a1qgdyZQcZyDbCYkTbypJRrvl2fLuIEHYz91s937vHb
         a0YvykmIMSJ/qqHWL528fw805cmjeIzS1Mr7vxLAk9qFGHXHS9dZz3qqZ9GNQMZ1kpKM
         24WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794225006; x=1794829806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0TI0VRhkkEuzSSXfjCVwhEWLOzK7uV4x4syO3ophfI=;
        b=zW/EhxmYBy/BH6jzgIF4YiDgBBl9udT8iHk9JOMG7UZUecSr8e48+v/LACrv4tmjsQ
         /5EywIHSkdJRWDUDQ98DAZOwkeVv4v52yltTq/WYZWH5K4kQgEMvr7Mn/MEuJpZidd0R
         5mLFGVSepeI/fsd5S22nLYbZSXWLyIGkdcbcsici3dWHXs1K3cSQ4xiMMSeQrLCyTl0/
         eXswSKEkOxQ/dAf9Bj6AL4QIhjdbItOEc/ez4DTHRy+Ed8H3mX0BhWHFlkJw6sTJ6VAQ
         y6jpIxM14f+1Mbo24GNnPLb+jqElocrtQOdMkEEtiwGVYbJtc7u+qmWqQoNKZ53+hVdX
         JItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225006; x=1794829806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0TI0VRhkkEuzSSXfjCVwhEWLOzK7uV4x4syO3ophfI=;
        b=nxyyUe3hz3MqvzPDky+VFs/mbTWSct4Y7SQvD2FDnae7Nsgb9vmfmQKddfzOb8USO3
         mqUD8MiiB1uMskVIrmOOyU2Gk2gir51RKHZH/bmcLVISQjE5j9K0Agq/5UpxBO5Wmodf
         dpsk3xGZhqC2BDsUv+vTM3W61B4+MkC7uzF9euu0P2cqza5qHCo/9BBFkhb0P75OjCto
         CnQ31Yn6vfBKy7/dcygOuVCcFwu3IOl5L7b5YGgLqJsJqaY8idrxujtmkWXj7LzQAHvc
         CMXjvnzC7aHEjM0uRg8+RXItR3nGxvbcib5JKADKHI/NVvOzbqzAqWnL93hDIQIj427G
         yHow==
X-Forwarded-Encrypted: i=1; AL+hErHg50wt0zJ/hEegxEJ51MgBqgcYfabtKHjwv4MqKoOtdb3wSJ/gyIaxm+XiP+ApQibYQPU0z+zmUpalIP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/htjLsfSZZuwCKBQ84lzrfGo+S+HgyRcXN8/mR+3GvcXTls1TW
	oT5aujK4dGUCOTyRQSr5AkT3rovihPX/u1OONnRe2eKDW8ypDGbXOzGff2ELP+rxkdxiC35y1os
	qxCZoaGPLX9TzGU5B7H3JVYcIJGu4dlIqIAb6ick=
X-Gm-Gg: AYBFou3H9+KpbyCQK3FQi4x+j5Iq0I5+2XHX8xW7yBGYzEpvn2ufak6p0IxyjKCGdcm
	8omLIOYWth+nSErhP7x5uuOsU6Zn4CKZtX89Noqg5+Frzvpm5t5OvxqNFkR97Jv1B9QX0lnNpdM
	tKHnOEjEo1UfMQZ2slkzM6tepBKjDhdJRZaoXxrXLxLmeiEHwWy8lLLI+q7bI/pAP30mx3N6xbh
	UIHTgJMdsUYgCWjnftiCUhw3STexU35R/aR092JnIK2nQpEffyoKfqiHrTGgGBEyeohCWtrb59s
	bfxRw8mDk++EL3GrXcHZvuZTwKT0T5dJwjbtpbYm+Zfg8fBYivgUf3zN3eFFnQH5k05GPBubtBt
	bBy4Bu0NHv29LakveqztTlgpfu3zxwGswAtpH7ZkMyoT9+H8g1AcouHDJi7inmIIIrBx9
X-Received: by 2002:a05:7301:d809:10b0:36e:9773:84b9 with SMTP id
 5a478bee46e88-37256df029cmr6649578eec.23.1794225005998; Mon, 09 Nov 2026
 03:50:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109113121.1534929-1-hj351016@gmail.com> <TY3PR01MB113466938179F6797D7406F0B86732@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113466938179F6797D7406F0B86732@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 20:49:53 +0900
X-Gm-Features: AclHuK-Q7RAQrlbltV2_yA6asy4NURVFS_s2TMwZElMAGdCfnMAGwiTLjN8f_BU
Message-ID: <CAGr5VtOoyaNcLbBeZwA1gb08c1_qfvpVvWC07iEHjp5GnWFZEg@mail.gmail.com>
Subject: Re: [PATCH v2] phy: rcar-gen3-usb2: cancel OTG work on unbind to
 avoid use-after-free
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Biju,

 Thanks for the review :)

 devm_add_action_or_reset() runs the action once immediately if it
fails to register it, and then returns the error. So on failure
rcar_gen3_phy_usb2_cancel_work() is called right away, i.e.
cancel_work_sync(&channel->work).

 That is safe here: channel->work has already been INIT_WORK()'d on
the line above, and the IRQ that schedules it (rcar_gen3_phy_usb2_irq)
is only requested after this call succeeds, so at that point the work
has never been queued. cancel_work_sync() on an
initialised-but-never-queued work is a no-op -- it just returns false.
(Unlike a timer, a work_struct has no uninitialised-object check on
the cancel path once INIT_WORK() has run.)

 So both paths are fine: either devres registers the cancel and runs
it on unbind, or registration fails, the cancel runs once immediately
(a harmless no-op), and probe returns the error.

 Thanks,
 Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:45, B=
iju Das <biju.das.jz@bp.renesas.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi hyunjungg,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: hyunjungg <hj351016@gmail.com>
> > Sent: 09 November 2026 11:31
> > Subject: [PATCH v2] phy: rcar-gen3-usb2: cancel OTG work on unbind to a=
void use-after-free
> >
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > The OTG role/VBUS interrupt (rcar_gen3_phy_usb2_irq) and the role sysfs=
 attribute schedule channel-
> > >work (rcar_gen3_phy_usb2_work), whose handler dereferences the channel=
 (ch->extcon). The channel is
> > devm-allocated, so it is freed at unbind, but nothing cancels channel->=
work:
> > rcar_gen3_phy_usb2_remove() only drops the role sysfs file. A work sche=
duled just before unbind can
> > run after the channel has been freed, a use-after-free.
> >
> > Cancel the work via devm, registered before the interrupt is requested =
so that on unbind devm frees
> > the interrupt first (no new work can be
> > scheduled) and then runs the cancel action before the channel is freed.
> >
> > Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in in=
terrupt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > ---
> > Changes in v2 (thanks to the Sashiko AI review):
> >  - correct the Fixes: tag to c14f8a4032ef, which introduced channel->wo=
rk
> >    and rcar_gen3_phy_usb2_work(), rather than 2b38543c8db1 which only a=
dded
> >    synchronous extcon handling
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index b5ba751..35e519a 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -1171,6 +1171,13 @@ static int rcar_gen3_phy_usb2_vbus_regulator_reg=
ister(struct rcar_gen3_chan
> > *cha
> >       return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(cha=
nnel, enable);  }
> >
> > +static void rcar_gen3_phy_usb2_cancel_work(void *data) {
> > +     struct rcar_gen3_chan *channel =3D data;
> > +
> > +     cancel_work_sync(&channel->work);
> > +}
> > +
> >  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)  {
> >       struct device *dev =3D &pdev->dev;
> > @@ -1277,6 +1284,17 @@ static int rcar_gen3_phy_usb2_probe(struct platf=
orm_device *pdev)
> >               return irq;
> >       } else if (irq > 0) {
> >               INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> > +             /*
> > +              * Registered before the IRQ so that, on unbind, devm fre=
es the
> > +              * IRQ first (no more work can be scheduled) and then can=
cels any
> > +              * work still pending before the channel is freed.
> > +              */
> > +             ret =3D devm_add_action_or_reset(dev,
> > +                                            rcar_gen3_phy_usb2_cancel_=
work,
> > +                                            channel);
> > +             if (ret < 0)
> > +                     return ret;
>
> I have a question,
>
> What happens if this return error? Is it ok to call
> cancel_work_sync() before scheduling it?
>
> Cheers,
> Biju
>
> > +
> >               ret =3D devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq=
,
> >                                      IRQF_SHARED, dev_name(dev), channe=
l);
> >               if (ret < 0)
> > --
> > 2.43.0
> >
>
