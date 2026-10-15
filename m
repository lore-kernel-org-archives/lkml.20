Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C02874E1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024573; cv=pass; b=LQZV6Rbp7phjgyux65rj3WVMF/wPsUnrvmBQfDny5AMXWgfqBDuWrmKpi0wCC/MsHgzVaJMisbugLemv1d3YewlMLzNPRzeY0Sbjky+5aheT3/urdQ+X3Q8yFokw74xpbPyJi7aA5xY/e5xEGC0x94UZGQbqnPg1MO/AWcAD4dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024573; c=relaxed/simple;
	bh=xHIQ30qGJc+FXgEM5mQzAPKve3FI5FAHCGNtCGoOO8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArJEgyIKFE5dyKr0hFQm+oQz6oyDK/K8Jev3h5qpVKmAd67fq4QiW5MROKDMHNZa9ClpDaG2OXKwpqAm+XT6GXqi9O5y/r605RIs94RBOCOb0CGD2eo4mnjvEFgzblnbEy99J2HTxmU92CwKRYVKeM6uoutAk5Jdw+axmsIN+1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiG6A87Z; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiG6A87Z"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso828934566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792024570; cv=none;
        d=google.com; s=arc-20260327;
        b=qryGNLSlzKJlRcyFBT1RhmQhJDBWbVnnYXUDou+1kgfWZsXL223b7O5C4cpAp0gsOe
         aZPn3lqEhftXUfPDajgougXFgMM9s3L4eX0ZAXxt4luFGTyCx/p5tf9veRh3FaeKlw1W
         8McqQUumpbpXBPdRoE+rMvIStIpdog4yBgCiAcv/XEfxNQBbsNMg6zBHySKUws0HQvjm
         Q21FjKAfrRJkegmByG2RFZtrhUYyy5eIxulv+tUJhrZbl3VFpP5aR7xWtYCTT8p5N7XO
         Uk9d9kSGn5q/Y0Cof0/H1T8cfDJuPNJ6dmWBlYDX3cx6ea4laYVzu2Z1mQfBGO2Rby5H
         vAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2R0gXEt+P6rEHxwRyXuQ4nOXa7nTp9PwrTLPEOwbe5c=;
        fh=sPYSrh7Qvf1GpHOvxVVeDWf+do0YHfI7+mJR4K5Al6w=;
        b=B182GRETheI2sWESdRmroGddtQDMve0tHjtfTJnoB/xRBT5yaQQDU9WahoyI7YLLUm
         8/97h0ckGVYsKcnJziMM/3itVAgA8eI5y/JERR2ultbCoFUP0dAvopvWCd7dXSDrokP1
         nfTAUvN7Uo2RcDXN1eQY+JauIrTrBIKWEfFaRVbdKlZK5QQakW2PwO7PpVzp17Sbze+C
         trQl+9OnK3A8gN8HYS9mpWUMUamnxvDOP0aoFJGtw24LAK6gEDVJH7PcFUy7GzCEN9IO
         ST3Nr5h/WeXKM3O5+7YFt8eM6NT0euT0pn5f3pJR4qwiH5ZhI6wgjP1JntM5tSvQhcPn
         99zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024570; x=1792629370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2R0gXEt+P6rEHxwRyXuQ4nOXa7nTp9PwrTLPEOwbe5c=;
        b=KiG6A87ZEMWBQLulzKOGegJeEJrkS4oXu2+hlLn0D0SJ3jdPiEWUNZKGezyhT4NEwc
         oAIsbpVf4ynGOTsdJ0C+qjy/ZewD53H1ZRxYojrf1pyl4d+Z2DaJNfSfJrrYOxhsSela
         R+udcSomWV3GGZbEdH+XC9qoQkCwG1COIuLIAfNI3mGnYoZJubOzQq3S1d8pW9hUzE89
         mNx/4vFfqwKrCgUOxwIoKQAKtQpBWrxPTwUGSz9sOgjsLGizIY/Ary7/NAfHE96dbkQN
         ciK7P+NdpojkB1O/Gk6DliWgjyPtoeUvoUF8WE9Qatl0nQGOHWJVuSKd3amhzXkvu3Kq
         Zm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024570; x=1792629370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R0gXEt+P6rEHxwRyXuQ4nOXa7nTp9PwrTLPEOwbe5c=;
        b=musA51OCrCDnYfHR7D8IKMZ05Q+sJI8iKHJmWNKHXStbaDWz7gEPAMg6K5KvZnXoNE
         JoKqrcm/RhMYAJY7oqOPOoKpv8oBNfnoAb3RN2f6Rqe/YcB8Y2DlfnsYjTESJJc2i0yd
         Vm6RNoWtJi4ZGI5WiguvfGzKKc4zlYMYCcZTOetz/us34a9xX63PT2Zqv8osoTNSOl1e
         G9CPN1aR2OlTGZ4Jo72N0ylfaD1HgC0UhL9eT9kZX6f9U9tEzmbvyXMHZ2YBkUj3ufir
         UUmiN373F3Br6RW5kOc+EW52SQXaRKOJe+87+zv8pBlMeuLefsaF7jPRNoUYbarnmLX3
         7J/w==
X-Forwarded-Encrypted: i=1; AKwUvBydm+A3MUhObWLBBJvxufcBHswm5SAGPUGFXaR4ZeMUp7oq6BNRoegVHdu63T4FMzSVztoQLF9tUzrGvuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcfWupGRpD5upsu34FZ3zBefVEEH87ky/T4smvKDI6V3N5G0ut
	Rex/E4GjPpEUatArzs50JCxet0oToHb9JL271fx8de50xs42tKrKmyaVLRMS7qwDZs11eq0FIFZ
	yLoCiCrBR4UZCPI7Vwx9mdYmmTl9LjA==
X-Gm-Gg: AYBFou02urUUO4v5ZMOlwLdnJzN2Mohu545h+BOmQOSnI4agA2B6MRWLSsr5Nuqd3WZ
	M2TAkSE8UomWR3JTExqPr1uJs8J1ABZ2uOVAghSfrdzpYh6u6Cqo06wrqQyKxUyUKgNKX+8PIoi
	8H2RQA/Evdi1zkhoQzhjuOlhdRdh4cgmRqcxkL6/7tDOobr6jj6KAvjhUwAEWmhCM67EMzXhcb+
	9r0glGSFQe4jAfldlPQCou4mH1PdYbxbrSBqERKkT2EZceqUuuG22FrB4EeRFZNH7QauCx57mr/
	CSVN9JWlqJXtU2WZaqOhTj0gyqbaL6BRW2UluLYXaTwEnGnEjS/dfBz0B8ES6nUCQzM04LLUmhv
	2qah4awDqVqIoiiQ7tDLT9jHgiQmn+WJ0C5KFbMGuYz3VeVuSaItb0kAJBPymYetHgi1VD2y5ot
	VqRX8=
X-Received: by 2002:a17:907:9409:b0:c29:f5d8:9c72 with SMTP id
 a640c23a62f3a-c31aa088548mr1508202666b.33.1792024570437; Wed, 14 Oct 2026
 17:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011220531.2073892-1-mhun512@gmail.com> <20261011220531.2073892-2-mhun512@gmail.com>
 <SJ0PR11MB770448ECA655129850E63866F49E2@SJ0PR11MB7704.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB770448ECA655129850E63866F49E2@SJ0PR11MB7704.namprd11.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 14 Oct 2026 20:35:58 -0400
X-Gm-Features: AclHuK_FiO8k2ANUvLel5w3-UBeosXNT17OFpLfw1OUVvRsSVTFeVw-K27VERoA
Message-ID: <CAGEsz8H4z7cpJQkmFGcqnCT+H56OuUHQDch6kh13TiOo0b-TFA@mail.gmail.com>
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

Thanks for reviewing the patch.

No, I haven't tested it on actual hardware. I have only
compile-tested it with GCC and W=3D1 on x86_64.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:52, =
Xu, Even <even.xu@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
> > -----Original Message-----
> > From: Myeonghun Pak <mhun512@gmail.com>
> > Sent: Monday, October 12, 2026 6:06 AM
> > To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;=
 Jiri
> > Kosina <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>
> > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Mark Pea=
rson
> > <mpearson-lenovo@squebb.ca>; linux-input@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Ijae Kim <ae878000@gmail.com>
> > Subject: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs during =
teardown
> >
> > The managed IRQ can access HID/DMA buffers or queue recovery work while
> > remove or probe unwind tears down those resources.
> >
> > Disable and synchronize the IRQ, drain recovery work, then mask THC int=
errupts
> > before freeing the IRQ and releasing HID/DMA resources.
> > Track IRQ/DMA initialization for conditional probe cleanup.
> >
> > Disable the IRQ before shutdown deinit as well. Keep IRQ disabling and =
release
> > outside the shared hibernation helper.
> >
> > This issue was found by static analysis.
>
> Thanks for your patch!
>
> I think this patch is still necessary. It can prevent some extremely unli=
kely but problematic cases, such as an interrupt already being queued in th=
e thread before the THC interrupt is disabled. Have you tested this code on=
 actual hardware?
>
> Best Regards,
> Even Xu
>
> >
> > Fixes: 4138f21115ae ("HID: intel-thc-hid: intel-quickspi: Complete THC =
QuickSPI
> > driver")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Compile-tested with GCC, W=3D1 (x86_64). No runtime testing.
> >
> > Related recovery-work review and series:
> > https://lore-kernel.gnuweeb.org/linux-input/20260717035609.3874015-1-
> > even.xu@intel.com/T/
> > https://patchew.org/linux/20260729050145.2272597-1-even.xu@intel.com/
> >
> >  .../intel-quickspi/pci-quickspi.c             | 28 +++++++++++++++----
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > index 89226f5ce45e..0bd22f285c78 100644
> > --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > @@ -597,6 +597,8 @@ static int quickspi_probe(struct pci_dev *pdev,
> >                         const struct pci_device_id *id)
> >  {
> >       struct quickspi_device *qsdev;
> > +     bool dma_initialized =3D false;
> > +     bool irq_requested =3D false;
> >       void __iomem *mem_addr;
> >       int ret;
> >
> > @@ -649,6 +651,7 @@ static int quickspi_probe(struct pci_dev *pdev,
> >                                       qsdev);
> >       if (ret)
> >               goto dev_deinit;
> > +     irq_requested =3D true;
> >
> >       ret =3D reset_tic(qsdev);
> >       if (ret) {
> > @@ -667,17 +670,18 @@ static int quickspi_probe(struct pci_dev *pdev,
> >               dev_err(&pdev->dev, "Setup THC DMA failed, ret=3D %d\n", =
ret);
> >               goto dev_deinit;
> >       }
> > +     dma_initialized =3D true;
> >
> >       ret =3D quickspi_get_report_descriptor(qsdev);
> >       if (ret) {
> >               dev_err(&pdev->dev, "Get report descriptor failed, ret =
=3D %d\n",
> > ret);
> > -             goto dma_deinit;
> > +             goto dev_deinit;
> >       }
> >
> >       ret =3D quickspi_hid_probe(qsdev);
> >       if (ret) {
> >               dev_err(&pdev->dev, "Failed to register HID device, ret =
=3D %d\n",
> > ret);
> > -             goto dma_deinit;
> > +             goto dev_deinit;
> >       }
> >
> >       qsdev->state =3D QUICKSPI_ENABLED;
> > @@ -692,10 +696,16 @@ static int quickspi_probe(struct pci_dev *pdev,
> >
> >       return 0;
> >
> > -dma_deinit:
> > -     quickspi_dma_deinit(qsdev);
> >  dev_deinit:
> > +     if (irq_requested) {
> > +             WRITE_ONCE(qsdev->recovery_disabled, true);
> > +             disable_irq(pdev->irq);
> > +     }
> >       quickspi_dev_deinit(qsdev);
> > +     if (irq_requested)
> > +             devm_free_irq(&pdev->dev, pdev->irq, qsdev);
> > +     if (dma_initialized)
> > +             quickspi_dma_deinit(qsdev);
> >  disable_pci_device:
> >       pci_clear_master(pdev);
> >
> > @@ -718,9 +728,12 @@ static void quickspi_remove(struct pci_dev *pdev)
> >       if (!qsdev)
> >               return;
> >
> > -     quickspi_hid_remove(qsdev);
> > -
> > +     WRITE_ONCE(qsdev->recovery_disabled, true);
> > +     disable_irq(pdev->irq);
> >       quickspi_dev_deinit(qsdev);
> > +     devm_free_irq(&pdev->dev, pdev->irq, qsdev);
> > +
> > +     quickspi_hid_remove(qsdev);
> >
> >       quickspi_dma_deinit(qsdev);
> >
> > @@ -747,6 +760,9 @@ static void quickspi_shutdown(struct pci_dev *pdev)
> >       if (!qsdev)
> >               return;
> >
> > +     WRITE_ONCE(qsdev->recovery_disabled, true);
> > +     disable_irq(pdev->irq);
> > +
> >       quickspi_dev_deinit(qsdev);
> >
> >       /* Must stop DMA before reboot to avoid DMA entering into unknown
> > state */
