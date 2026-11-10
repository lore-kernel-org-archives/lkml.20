Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285824;
	b=n39x/xouHc567qI4UPERCseR7ivTmKZF1/fgchxi66zfNDMyvpw6RS5NVuy13b6BIzVM
	 Ls7pzTzrickKyO9EBYoz+Ct8LQE6ern2VduVw9bZLbAewBeu1If5W56X5rgJsw0oA0p7l
	 ANrkYXr9ocsi14y66l1ypvN0+nY4UrtD8rftT0AisMqSPQhZoS0Pn2M3oMkxxUlRKWNnU
	 C68vwDMGHR1/0wASVMiSsrjdAOWct6gdF8fpfqBY1WBOY2nm8KkanV4N/XjQXCtXlCU4t
	 d01q2cCovmy0r782Fq4ba8cGKQ7B7sCmZfJnIQGfDTCrrkohcIcG629SG/l2jX6e+ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fjct4Yqe2Yjqkmyxgvaofu3ga8YzMvdjgNfUmi9Z8E8=;
	b=NxlviXwrHlN66+7UrBHeKdoDXg+xYnxuadYdm/Um5Y2ctbBfpHnhlle93OZj5mj5wrDt
	 6CNb8oXuRsThO2yQN9+4L8Rq+UWXEJrFlkSPwDfuN2PcJddfqUz8ryhvp8h7HhALXnonN
	 nxqKM/1LryvaZTNOk4vqzD4C10/r3mJw24bdec/i881WeIzGT5eDm94SPvyEwW5TZhX3l
	 RNTuYK7M1Mcpbar2Y5SrxRvZ+x3Sp7OKYbXcessJ0L/k13hYO+KU/RiiLtORSgvWxKVFy
	 gYPS/FbY3ZUydBeiWVIkfuCHUUgAMjTDlve7LbFXB1PdC440mQ4H6keQnhm6koRcf+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebABcTVV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39092606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39092606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebABcTVV
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso884399a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:43:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794285822; cv=none;
        d=google.com; s=arc-20260327;
        b=bF3l80rejTGlce5E3HbQvZUOAusWH8zsJxqh52KVyrhDkkCqmpblP5O0wbUOSJXpGd
         b/wMMs7cr4CWeX0FJrOvVWH0RGkAlpd0SHKYy9xUcdZkjeOtys2yeYs04ud8fj7Gpivm
         g8mIl22pE7cdmBbnDQwfwm6tOBx7jTrM5VvKRAhwYCDJmSo7Nw5nlHHTGVwjfN29Yx+b
         yOPGEGfWnk+dsKhHkzHG2AbwMYWuFOdOSKlmkbYK47ss1IJoZTqqkZvXyfxzzBopEC+5
         ALQG8lEoCfHwpqYDm/8Us3FiyUE46RNqBPNQwMdgZ5zWGZf7pgApoplQGMJdlBBz/U1U
         l9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjct4Yqe2Yjqkmyxgvaofu3ga8YzMvdjgNfUmi9Z8E8=;
        fh=brRuQV/xUKgTIsW8qTWVPgbmxxrlBqFLWMxPTxJkZMg=;
        b=Y0jqcEerCLlwaocCC3LNaOCcDgv6OKVPqd+EC9t3n8M2tyAda8dZgl1Pws1BJx5Ali
         YJ1+pxmEsUBfHpomZ6fWpHhOXxrmhizG6SMsjHf1UuOOupnAVkpTP2XUckI/4MJ0qRDz
         Zxa1Pi0aFmgxikpFj9G+wVnY8mSrQnMYBviWgq6Qmlrr+w2a3lQ+w76sDc2+uLMslDmb
         60im5nqaLDbKtNnRFDafkkm0UGACPKlVaC/CZpLvWx0b6AH90qUxIj6bN7Oqo5kSLlBi
         OAJ4at78cVO+5mAbRFOA/5mpFtsyzoDfHEfcRugb4Kz3ODtN0bHvpW64q+sS0teTnS2z
         heUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285822; x=1794890622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjct4Yqe2Yjqkmyxgvaofu3ga8YzMvdjgNfUmi9Z8E8=;
        b=ebABcTVVo0JLd7uap5mXB31hZOAY5OM7LOIjdoTRJxnhHMuzGNipJ32WJeuHKMv5CM
         RB8dff5x9E8CvvVJvjQaTiDB/Q3ql8trymLoq27ooEnxLkCAi/p2y9akjIyj8SzoiqB9
         zURvGWlmbZhbM+8FKzZl55lKPsqMoqpsjfehCasfpmwKvWZAt/3Ilqs2BjAJaIxVjMlT
         OxtMXuIvMZ7VCf/SeWy07rEABCWGYaylIb9N8+95lgTzKTGFy02dMYjshnPo3P64rX8a
         zBo9LBWexpICgniFDnOE4L5Rb+5lXxQj1BxYcD08g3R7YmY/mufscnPxSdLqjeDjpRFC
         dVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285822; x=1794890622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjct4Yqe2Yjqkmyxgvaofu3ga8YzMvdjgNfUmi9Z8E8=;
        b=VPitCRKvyA0N70Dgbbl7c7POLg5htWA9g3EaF0exkirUSDhhjqzBT7SyDBpCT3zA1U
         2qqRJwNkc7wcXriWCGNps85Mf9r4UXIm93NIg3wYf9jRtRubPkzBw2JdL3T6lfQL2o4j
         wYSj3YkdC9TzV8CW1hm82DV6PHeB4lKcT1OlZ8qYsfhzjIfVzWdx/KOmWOy5DK3O0S3t
         kr+sDeJczHwCSYreN+s5inn9St78Yf4K0JUivaKOp+olW/1TWXVmxOJ11j4C3PvxLKs6
         fdCZVU+LMRJQkUQ23NJwatVgeKVXbM7HPAOgEfZEatqSx+qCrJc4Esu1WyLnY9GscXV8
         MTlQ==
X-Forwarded-Encrypted: i=1; AL+hErFtGrsYjEsUm+ZEdS5m9RMcDxooPqCLqlJ3TMTAYIpLWmNBNQFhteX6KB1XmBbB8UWUVdBIT1hYFjP1wpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oK2NBCplPlCaBJjZMYaxIEmQA7R+MP9W40+GQaalJ9JZEntjr
	aj22f1SFJD0pOLJ0VTt+iHPBXLf5pGhzSPXhkXNMK33bSRH3MtKhPOl5M1BFYw1DHHIT0WRWKVv
	nZyi3VQ+Fy8yFmBnlc9+Db08nCL05Ew==
X-Gm-Gg: AYBFou3TTsXhFvVphD7CFUbzK8o2+LH4fVKCdEHYlcb1x/1weiAsAieDHKvBTgnl8Nz
	NS77NknAD8/uFxmpfrPloNQXjOIPFAA9WQ8FKt6HMys75YHhihfVhyi1Frck//NTmu4dhnBL86j
	OIJ8szxLyOtP4/OaQn2fr1oUOYyxI1GC7dy2Eup5ehHT1Gmqx5GoqYRPhte4jXcD0jmZqfwfa3I
	n9ZXUf9klRL9PPpwdMZJOUOu9mBNUiD83eC7Ik2ZWXm6TqJbq1UDo6jVdck0PZmMt5j1o0d6naB
	q/8vbrzmFSOHiKMxd+xZ763V3KQm6JiOVw874SdqRMU6JquVv+5OQTCFvrEZDHiKMiZp044rmfl
	TSi7RrcEnLjZI61OTNL6jss8NOTAFa9Tk9oV7ieWZicvCnsFYK8x7iuQu1Zi7r4lN5oFVjrg/Fg
	j+WfoULTRhi8reigVpK8D2/vFv+rqjek0nIuolsnmoEa0qeCFZIWpXfIdVsv6kj4R3CZfp
X-Received: by 2002:a17:90b:5105:b0:3ac:928a:68ce with SMTP id
 98e67ed59e1d1-3b1679f3453mr998185a91.33.1794285822393; Mon, 09 Nov 2026
 20:43:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011220531.2073892-1-mhun512@gmail.com> <20261011220531.2073892-2-mhun512@gmail.com>
 <SJ0PR11MB770448ECA655129850E63866F49E2@SJ0PR11MB7704.namprd11.prod.outlook.com>
 <CAGEsz8H4z7cpJQkmFGcqnCT+H56OuUHQDch6kh13TiOo0b-TFA@mail.gmail.com>
 <SJ0PR11MB7704B813C9011D9478BA2BF4F49C2@SJ0PR11MB7704.namprd11.prod.outlook.com>
 <SJ0PR11MB77049F097D7061D769DE08A5F4602@SJ0PR11MB7704.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB77049F097D7061D769DE08A5F4602@SJ0PR11MB7704.namprd11.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 23:43:27 -0500
X-Gm-Features: AclHuK-S2CyrpHDzG1B48T1dkrk9jP5XLxGwtN3GaVGIEXLXaMOXgB2Dn-VQ2hQ
Message-ID: <CAGEsz8HNs-bqB8we8+J8dHci9okethftp3tLbOv-b6Pu_FivuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
To: "Xu, Even" <even.xu@intel.com>
Cc: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Even,

Thanks for testing. I've rebased both patches onto the latest mainline
with no other code changes.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 26=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 10:05,=
 Xu, Even <even.xu@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi, Myeonghun,
>
> Validation passed, but I suppose you need rebase your patches on top of l=
atest mainline kernel.
>
> Best Regards,
> Even Xu
>
> > -----Original Message-----
> > From: Xu, Even
> > Sent: Thursday, October 15, 2026 9:53 AM
> > To: 'Myeonghun Pak' <mhun512@gmail.com>
> > Cc: Sun, Xinpeng <Xinpeng.Sun@intel.com>; Jiri Kosina <jikos@kernel.org=
>;
> > Benjamin Tissoires <bentiss@kernel.org>; Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> > lenovo@squebb.ca>; linux-input@vger.kernel.org; linux-kernel@vger.kerne=
l.org;
> > Ijae Kim <ae878000@gmail.com>
> > Subject: RE: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs dur=
ing
> > teardown
> >
> > Hi, Myeonghun,
> >
> > Then let me test it, it may take several days.
> > Will feedback once test finished.
> >
> > Best Regards,
> > Even Xu
> >
> > > -----Original Message-----
> > > From: Myeonghun Pak <mhun512@gmail.com>
> > > Sent: Thursday, October 15, 2026 8:36 AM
> > > To: Xu, Even <even.xu@intel.com>
> > > Cc: Sun, Xinpeng <xinpeng.sun@intel.com>; Jiri Kosina
> > > <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Srinivas
> > > Pandruvada <srinivas.pandruvada@linux.intel.com>; Mark Pearson
> > > <mpearson- lenovo@squebb.ca>; linux-input@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; Ijae Kim <ae878000@gmail.com>
> > > Subject: Re: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs
> > > during teardown
> > >
> > > Hi Even,
> > >
> > > Thanks for reviewing the patch.
> > >
> > > No, I haven't tested it on actual hardware. I have only compile-teste=
d
> > > it with GCC and W=3D1 on x86_64.
> > >
> > > Best regards,
> > > Myeonghun
> > >
> > > 2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 =
8:52, Xu, Even <even.xu@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Myeonghun Pak <mhun512@gmail.com>
> > > > > Sent: Monday, October 12, 2026 6:06 AM
> > > > > To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng
> > > > > <xinpeng.sun@intel.com>; Jiri Kosina <jikos@kernel.org>; Benjamin
> > > > > Tissoires <bentiss@kernel.org>
> > > > > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>;
> > > > > Mark Pearson <mpearson-lenovo@squebb.ca>;
> > > > > linux-input@vger.kernel.org;
> > > > > linux- kernel@vger.kernel.org; Ijae Kim <ae878000@gmail.com>
> > > > > Subject: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs
> > > > > during teardown
> > > > >
> > > > > The managed IRQ can access HID/DMA buffers or queue recovery work
> > > > > while remove or probe unwind tears down those resources.
> > > > >
> > > > > Disable and synchronize the IRQ, drain recovery work, then mask
> > > > > THC interrupts before freeing the IRQ and releasing HID/DMA resou=
rces.
> > > > > Track IRQ/DMA initialization for conditional probe cleanup.
> > > > >
> > > > > Disable the IRQ before shutdown deinit as well. Keep IRQ disablin=
g
> > > > > and release outside the shared hibernation helper.
> > > > >
> > > > > This issue was found by static analysis.
> > > >
> > > > Thanks for your patch!
> > > >
> > > > I think this patch is still necessary. It can prevent some extremel=
y
> > > > unlikely but
> > > problematic cases, such as an interrupt already being queued in the
> > > thread before the THC interrupt is disabled. Have you tested this cod=
e on actual
> > hardware?
> > > >
> > > > Best Regards,
> > > > Even Xu
> > > >
> > > > >
> > > > > Fixes: 4138f21115ae ("HID: intel-thc-hid: intel-quickspi: Complet=
e
> > > > > THC QuickSPI
> > > > > driver")
> > > > > Assisted-by: LLM
> > > > > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > > > > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > > > > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > > > > ---
> > > > > Compile-tested with GCC, W=3D1 (x86_64). No runtime testing.
> > > > >
> > > > > Related recovery-work review and series:
> > > > > https://lore-kernel.gnuweeb.org/linux-input/20260717035609.387401=
5
> > > > > -1
> > > > > -
> > > > > even.xu@intel.com/T/
> > > > > https://patchew.org/linux/20260729050145.2272597-1-even.xu@intel.=
c
> > > > > om
> > > > > /
> > > > >
> > > > >  .../intel-quickspi/pci-quickspi.c             | 28 +++++++++++++=
++----
> > > > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git
> > > > > a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > > > > b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > > > > index 89226f5ce45e..0bd22f285c78 100644
> > > > > --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > > > > +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > > > > @@ -597,6 +597,8 @@ static int quickspi_probe(struct pci_dev *pde=
v,
> > > > >                         const struct pci_device_id *id)  {
> > > > >       struct quickspi_device *qsdev;
> > > > > +     bool dma_initialized =3D false;
> > > > > +     bool irq_requested =3D false;
> > > > >       void __iomem *mem_addr;
> > > > >       int ret;
> > > > >
> > > > > @@ -649,6 +651,7 @@ static int quickspi_probe(struct pci_dev *pde=
v,
> > > > >                                       qsdev);
> > > > >       if (ret)
> > > > >               goto dev_deinit;
> > > > > +     irq_requested =3D true;
> > > > >
> > > > >       ret =3D reset_tic(qsdev);
> > > > >       if (ret) {
> > > > > @@ -667,17 +670,18 @@ static int quickspi_probe(struct pci_dev *p=
dev,
> > > > >               dev_err(&pdev->dev, "Setup THC DMA failed, ret=3D %=
d\n", ret);
> > > > >               goto dev_deinit;
> > > > >       }
> > > > > +     dma_initialized =3D true;
> > > > >
> > > > >       ret =3D quickspi_get_report_descriptor(qsdev);
> > > > >       if (ret) {
> > > > >               dev_err(&pdev->dev, "Get report descriptor failed,
> > > > > ret =3D %d\n", ret);
> > > > > -             goto dma_deinit;
> > > > > +             goto dev_deinit;
> > > > >       }
> > > > >
> > > > >       ret =3D quickspi_hid_probe(qsdev);
> > > > >       if (ret) {
> > > > >               dev_err(&pdev->dev, "Failed to register HID device,
> > > > > ret =3D %d\n", ret);
> > > > > -             goto dma_deinit;
> > > > > +             goto dev_deinit;
> > > > >       }
> > > > >
> > > > >       qsdev->state =3D QUICKSPI_ENABLED; @@ -692,10 +696,16 @@
> > > > > static int quickspi_probe(struct pci_dev *pdev,
> > > > >
> > > > >       return 0;
> > > > >
> > > > > -dma_deinit:
> > > > > -     quickspi_dma_deinit(qsdev);
> > > > >  dev_deinit:
> > > > > +     if (irq_requested) {
> > > > > +             WRITE_ONCE(qsdev->recovery_disabled, true);
> > > > > +             disable_irq(pdev->irq);
> > > > > +     }
> > > > >       quickspi_dev_deinit(qsdev);
> > > > > +     if (irq_requested)
> > > > > +             devm_free_irq(&pdev->dev, pdev->irq, qsdev);
> > > > > +     if (dma_initialized)
> > > > > +             quickspi_dma_deinit(qsdev);
> > > > >  disable_pci_device:
> > > > >       pci_clear_master(pdev);
> > > > >
> > > > > @@ -718,9 +728,12 @@ static void quickspi_remove(struct pci_dev *=
pdev)
> > > > >       if (!qsdev)
> > > > >               return;
> > > > >
> > > > > -     quickspi_hid_remove(qsdev);
> > > > > -
> > > > > +     WRITE_ONCE(qsdev->recovery_disabled, true);
> > > > > +     disable_irq(pdev->irq);
> > > > >       quickspi_dev_deinit(qsdev);
> > > > > +     devm_free_irq(&pdev->dev, pdev->irq, qsdev);
> > > > > +
> > > > > +     quickspi_hid_remove(qsdev);
> > > > >
> > > > >       quickspi_dma_deinit(qsdev);
> > > > >
> > > > > @@ -747,6 +760,9 @@ static void quickspi_shutdown(struct pci_dev
> > *pdev)
> > > > >       if (!qsdev)
> > > > >               return;
> > > > >
> > > > > +     WRITE_ONCE(qsdev->recovery_disabled, true);
> > > > > +     disable_irq(pdev->irq);
> > > > > +
> > > > >       quickspi_dev_deinit(qsdev);
> > > > >
> > > > >       /* Must stop DMA before reboot to avoid DMA entering into
> > > > > unknown state */
