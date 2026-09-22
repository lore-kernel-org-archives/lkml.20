Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5F53C3D9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079008; cv=pass; b=EwJ1yHj0ZEgNG2s9ZQESIMF8HGUb3PL68L83W9AL3aeAqgH8NHD5dXw/YWSwWNPoD1b1ViUKAcJ6M5zcRsz2CTS648ee9rRVjdBTlkZqvA+EZqvQFwnJo+0Vuh6EmSRsRHZP0+VyG+9KXZCDVhkT3pBPC2r1gaOLzZ3mu2rPb0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079008; c=relaxed/simple;
	bh=EEicGhaPn1nMCsQoVuKYMwhQ6GyzIikHfbYLcTzbN20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E00Fp/5CISU+zcV5CE28O5bGYwM3IGJLwkJtFBWqV592hfh8z9S1j6DIqSG+EXJNihJgtbEw45X5bbeZrHepdXZG94Pe212eO54F6vSGJiVKxBhZDqbziPTfH3/vrN+1v5++njYIlQfhlYTpetX6EvlLEElU5iurz5tuvbLGQEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=dlsCwRIm; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="dlsCwRIm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso2435837b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079007; cv=none;
        d=google.com; s=arc-20260327;
        b=kjzF5XxXOI4Hfe9T+skNrIdpncJa00CLgBlqbwguLYmyr8B9hMxCOqLQUsns67aAM3
         rlZYCcB2rJeCGFORUWcDQH23cm+uvmzlygUtcnVZ46iOisDp6P8+wAbASpZJpBjukFL9
         migUDU/Cj4miVpWjbDcrKXIkXxZbgaouz8dfJnOhVfO8/ei/D12/P6UK1+JuzJL1oWfe
         ToZVgFFkjzh9AwJuKSAYUE0xjzbSxtpAFk1mjkVmSheH92ztjJ7948VQynspqMMjWJju
         ysvvCmT8CPcCZ/SkL5C8V4G004YD4wtW5YPBCb6h5XJkxM1bEDays0kg/yaBca6Z7SbD
         2uqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        fh=2Jvz183+FuZfGBS5NoV2Tar8FDghSrDKJ8kASNxONCs=;
        b=M5L9wL5sfoMT7PQ+waJBuztJMS8/s+YTIRTQWd+dVnjGbQLmXH0xtfMZx1ddztO6Pi
         ljlZ7jhbe0YfF8Uc64QLF1nLpRxCtAQh4b6foUXw+D269mWD+Mq7Wi7awx3v8Fc0r5GA
         tco4tsbdHjiZTTfR6nSbZ+CebvFJI6bMMFU36asej5KWUB9gn7m0NX2UnI5ojQOBZ020
         O0yKYx980L0ZyfiZETi4XyLGRbZwFRvp/97sgu87nuFTzHVh0Y652FTcx+XwQEeGJDlB
         jJmXpbXYIG7pd5wi2e5xaEtpIEnHLaypX+b0YV6H5/RMSyiB42h2x4P0uWrMJyIqe1EC
         anaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790079007; x=1790683807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=dlsCwRIm4HVRezPlXgMjqL2pwFl3y7jEdYHkWisPlod+xjNJOXLjGgx/ai7bwzBAp0
         4S/E3YvWDP2zUQqrq3yOsIQeU5RwYHMwL8Q5ZpPNoSntHmAGNX+vcHz1CyJ+iU/4QTY9
         QP0DIWJ+CFIpazkjDeUCbJdiTNi43nM8h2xxvR12JmftguwKzG4WRc4m4cb4MsmL8X6Z
         zFSGwDcOeuUNlGfdWN1wCSKmJHk0+tnRnfId7s0EnZCAJHEqu9iflxD/D8k2q/nTe5XA
         QFUR8YG/YIh4ZVXTP+rjpgLEE8nY6EZGEMOngbUIpk2dU1CB905tM6h1tBS4v54QJ2Dh
         gIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079007; x=1790683807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=LjJZmGb/WwSAzOixf90nGF63g2NmUF3ZAW1Muww9kQbkUIQdxWGgumWIUrFjrcnNH6
         6iZyf3ZJ1wBYHZpgvGHlh2R6Oc/q6eBRhWY0zuKVmvKx/FVvzJ2lEz8Cpai8Pwh9ODBl
         HIRwgK4Pd7CH0H0wcJX50QNRicJHJg7NvD2OrPKP0uRySBVNKj4wm7oKSUQ4VpXddhHS
         jNP3rKdpN6huUGfKkn4GzzovwQKIOVDBUejQ7azCaXO7kTEVtEQ3mqUvVKMJGR22Eq10
         VAG1KwA2iUE971eV39i12Y/Cj4gp11s3FbGdhlNFPPUlcw6yEvKfRCO3Y0DldwQHzbrr
         JmZA==
X-Forwarded-Encrypted: i=1; AKwUvBwTvtBswfNbTJUyVZZ06XeVTatpko8n7WQ1mooTedRPyUVzhV3QQYPG1NaGRlgA5LEKbxJzZKQVcBiGFdI=@vger.kernel.org
X-Gm-Message-State: AFuF++mp7kWiQCRLEKcKo7jiAQgkh52PgnNgtQedOzzOC28k5MTxm0rS
	16Az8lGGjHt0MsW+uzt3uFxxTLeDdY/XwvMs8SLVXrwTcbLaoydR7x+7Mvvs72GRpg6z78Ww75z
	NhXPE53Lt1cUpjbBLc40JW7n4I/SDM5cLU2bA30+OmA==
X-Gm-Gg: AYBFou3c2lZEqxc6Z5KtGrUQy8Nq9l4knskYQx0dc+YM5vxiSuqIK1Ika7QH3VOLdLE
	z4fvFZFSqrQZEU5jIHKAvhM4w2+nSquFh3ihDOMpI1IlUhI+rlSFlGR2MWftLaCeDWVmhMf/sdl
	qXjMINbWMdWNjWG9vxzFIEaEGfkGoT/6I+XNwEPzvP48yZckHmYY0CFiFJD8pJHJ0/iLemwHAs+
	NPn7aCvcHoqOh5nZUhdRXb66ElJiBYJCbsY4b/t7gd7JN9udhZxIsVLZ/UIAB9m2BAgFxC4QGQQ
	v+MnynOlK1dwcjBumQ+JxSrvc9Zj7B7Aarvt54vYSDyhM3HsGEt8uHc9cKJ1FYp752xZsuz9VB7
	tnvqNNvhsiINgmGKG/6ORpoNc1jPoBvTOo50=
X-Received: by 2002:a05:6a00:3a25:b0:878:34d7:69a1 with SMTP id
 d2e1a72fcca58-87c8472a93dmr1072253b3a.49.1790079006604; Tue, 22 Sep 2026
 05:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-4-robert.marko@sartura.hr> <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
In-Reply-To: <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:09:55 +0200
X-Gm-Features: AcwNN1WXi_VCQa282Ypqp9POkhX7gCRsmqb0WReRGFy-rkyIzQdlxyeytRee81g
Message-ID: <CA+HBbNHz4_HTMHPv8wPGq_6UP+S_RbfcToAt6W_GN57aB5hG1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, aubin.constans@microchip.com, ehristev@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:42=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 07/09/2026 16:25, Robert Marko wrote:
> > LAN969x uses the same internally generated base clock layout as SAM9X60=
,
> > but its SDMMC controller stops responding when runtime PM gates its clo=
cks.
> > Software resets then fail to complete and the internal SDHCI clock neve=
r
> > stabilises, causing subsequent I/O requests to time out.
>
> Is this a known issue of the SoC?  Is there perhaps a hardware reset
> for the controller that would bring it back to life?

Hi Adrian,
It seems like the controller was reused from SAMA7G5, which shares the
same behaviour.
Unfortunately, there is no HW reset for the controller.

>
> Does that mean unbind and rebind of the device from the driver
> also does not work?

It works as long as we avoid disabling the clocks.

Regards,
Robert

>
> >
> > Add LAN969x-specific SoC data using the SAM9X60 clock layout and select=
 the
> > option to leave its clocks enabled across runtime suspend.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> >  drivers/mmc/host/sdhci-of-at91.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index b7e2a89da348..e7affca8da25 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_s=
am9x60 =3D {
> >       .divider_for_baseclk =3D 2,
> >  };
> >
> > +static const struct sdhci_at91_soc_data soc_data_lan969x =3D {
> > +     .pdata =3D &sdhci_sama5d2_pdata,
> > +     .baseclk_is_generated_internally =3D true,
>
> Should be a comment here explaining the issue that needs
> keep_clks_on =3D true
>
> > +     .keep_clks_on =3D true,
> > +     .divider_for_baseclk =3D 2,
> > +};
> > +
> >  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> >       { .compatible =3D "atmel,sama5d2-sdhci", .data =3D &soc_data_sama=
5d2 },
> >       { .compatible =3D "microchip,sam9x60-sdhci", .data =3D &soc_data_=
sam9x60 },
> > +     { .compatible =3D "microchip,lan9691-sdhci", .data =3D &soc_data_=
lan969x },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
