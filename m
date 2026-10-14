Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F45328C6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984768; cv=pass; b=ieQlLjHCPA9u31YfnSxRhAa4yHQDc1AT3J9mH5zgr5Oi7BNOZh/wfuTv+d+ctqKSN05ClGdKcgMzkbiJmvPaxsA0oEw/eft6++uw3iYQVeZ50MG5m5Tn8CqRettlVMnpJK93F1KlrmRJqvWNiavGiBA/079oGHG48+7uniT/Eyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984768; c=relaxed/simple;
	bh=V7L0U99tvHTcidmbzjPFzdvF7D2gTMvorlFarKDKzI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5HLt8qUS30ZeD9JJ79MJ+QJ+Y0Y86dWLwgCK8yFdU+BeKdYWqw5vGGOw/YdrJBB5LOICnSOntlyyAqcxMOSjoA92O3PtsKg9yQjJO6xPMFGiGzE0rAQ843HsbYqDhtymT+3PztTzWGhsbjWt+1gyqQue7MtgUUFDclWCDqhuNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwb/F3+b; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwb/F3+b"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4877837890fso2111488fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984755; cv=none;
        d=google.com; s=arc-20260327;
        b=jjQhlLwpGaAMotC4WXpzrk0TVl4pSk/AuQH0F65Cm9J+M3gSdyk4zQde9x+/cev/3v
         5bWkjegM4KNoXZPbEo5AP3UXChd2YFEGK1DZDCF5RIf1I6CXwY5F1pignNIveNM8bW1o
         60lqma7PPT4vwX4Gaip7UGSiM5U7apVKWI0M34sLmcc/vu97BlTs18nBKP6eLgtY0F83
         FznkL/N3Uw4G9BQKQIj7oLRoLjSVEmnIkeIoWxONNlda/ze+fug+zQjjjlRN47Pxks+T
         3AZreyz+bMZjPY7GE/IxmQjFVfQwFgxMYLoTj04NAIbHXOwQ03nPHkBrLgbblCYDecTG
         65cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        fh=jTYdIyJ8kYyFBwZvxM+qSLTtN02WWlXM2qZu9vPDiYU=;
        b=FKYx0ta9fSt0OmsBnMkdXV4afRyDb8ujmxLtNQk87aSdlblA+IQnqMXm4U8+EnCsZK
         wGKwtQD4hbP9SEn/RRYjcqb/QV6PWJp2JwKB4pJCyJKGyoDYSbqFmG114EpoOrCXwxWa
         put1Dc6jz+YvPgq26Zps7PpcfIpLiPTJs76bixZxRfu89iQddx1fuLdIVqO1Iyv4oPSk
         L8dgKOY0ovoIfV0gbuIjNldMBFcwCQYS4iLc5xIxu0/ng6hXG/Le3J0V3dNqhrFliVzz
         n5QgO0NPPib9/rkGjvV7Z6E+1IGg29aw/NkgU5AWYOG3xLmXWH2Z3dH9iMkq5krdwLVl
         Zq0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984755; x=1792589555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        b=gwb/F3+bhzEANoW8ytOJFrGW9BaO92DVTwjHSnHe0vfQQgYYeOdmOmIHo9Muo4a7YE
         Zn+0tb4foXBcrn0gJepRQib0Q2diRgzsfkkUu7EakFANYm6GEfSNtjAJATrIeXdqM66I
         kOuOoBcvGG0jEf1rQtRK/INo6nOmATIjoNeVIqkKK0DFrhKvIDNiz6QiG74GIRtt193s
         34u5G1mEEAihjPIESS+I3+ww4nHQC/tndVf6B4pwuG5SgEYMquwWZrPG+q18XZgWHNMf
         2376sF1DKXJLKnRWgRnrLIhom6XoJq3hWMBBDfVvM1x/A0VgKMHm3V3OkJKXcxRZP1ZO
         Lg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984755; x=1792589555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        b=I6xCzrSkSZWN7GRIxgXp46MBZ5wHML9oyvzf/52Y4nDkl04PK7ajG45056m7T9artM
         AQZ3BO4SgJeerSKQCpcqaAgheXt47uq88VrSa7Q0NL7J5islvVmWqaJ9Pm7l71z/dvEn
         lmZLo12MJIQZSTABLy5mV+mD8/3Ga6VmBU8C1orWMjO/pcvWlrbxkWEk1emeo9fXxVr/
         jJaOCdqLCmkY7cVxG7IkIZ/vGQcx6yT6QUdD0lbjNavG77BxTP+vRZnOFYTDr/V/LeU7
         b6pfbfDAPFK6WtDTKKnVenlaOAOWvgEOB2Jikxy44sef6fCisJ4JXU05tnnCiAQnXI1O
         kdeg==
X-Forwarded-Encrypted: i=1; AKwUvByYw2isiVMxAkAh3OCk/olLpPoB8pgWMlfh0OEGMXhNJHS3akPra69/IHPcev2YqV0OM6dhps25bqtsJrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEBAmqsC4VRiAqoyACKzvR+/QBiVIJPqNk1+QGshK7aqTuu/ZW
	VIn/rND3DYY/DF0Ad21pRDC5VADYCnoFX0qOun0ZgGsWjz0Y+bk6w++Y5vLZtZjJsNE8PvnFF/D
	5AX2jCjxoJdwQtNjXmQULzbUWYv/g1+M=
X-Gm-Gg: AYBFou28FzsiB89hWbW1pvUY8FpmTNY6o2514lyrsmzOGDC/VOx69YYkW3LtK5XS7+r
	6bFzNdi0wMuBMi9aw6OChqUt2URQ5j+aS4NYVVI9z5PU/jRiUvKwz+cgLYSmBEmbic1teOGnvsm
	HdVBwBqoGpU6AK7DmZJw3Z68+Iw747lR6X5zWngahXJx0lAOZFIfPMDqL6W0CgIkM/W7lN6juW5
	4dg+XahAEOAnKRKmpOz8jlWgq2A5z/vMEnem5+16SAKLtSUR57Z4wKsgNgqTVcD9+JYGlzyKuP5
	wPrWxm+kpCmvx1n+amI5xukXqXx9W4Fzvkk6XG7BcGsOYaBFU0BB4Vx3OQEuGPjD8zKHwQF2NAL
	d1e0W1nCQ5ITP
X-Received: by 2002:a05:6870:331f:b0:48f:e24e:6b6c with SMTP id
 586e51a60fabf-4a2a8b580eemr14205687fac.61.1791984754940; Wed, 14 Oct 2026
 06:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804142800.4326-1-khomyakovilya@gmail.com> <111e94e9-79c9-48f2-8976-70470e59b89d@leemhuis.info>
In-Reply-To: <111e94e9-79c9-48f2-8976-70470e59b89d@leemhuis.info>
From: =?UTF-8?B?0JjQu9GM0Y8g0KXQvtC80Y/QutC+0LI=?= <khomyakovilya@gmail.com>
Date: Wed, 14 Oct 2026 16:32:23 +0300
X-Gm-Features: AclHuK9k2427IzCFQzfxk5ijt-NQbFahalRCOSjfqEOAYJAuXMNGRteO6GZZ_0o
Message-ID: <CABrBgxdQ1Jn40wR_yEzjxz=BO9YvM530fqTG=F4EvC3m=6RoZQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: mpi3mr: use DevicePage0 link rate only for
 direct-attached targets
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Ranjan Kumar <ranjan.kumar@broadcom.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	mpi3mr-linuxdrv.pdl@broadcom.com, regressions@lists.linux.dev, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.
After sending the email, I didn't receive any response from anyone.

Regards,
Ilya.

=D0=BF=D0=BD, 12 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 18:48, Tho=
rsten Leemhuis <regressions@leemhuis.info>:
>
> On 8/4/26 16:28, Ilya Khomyakov wrote:
> > This patch fixes a regression in the Broadcom MPI3 Storage Controller
> > driver under drivers/scsi/mpi3mr/.
>
> Ilya, what's the status of this regression fix? It looks like it fall
> through the cracks. Or was there some progress that I missed (which can
> easily happen!)
>
> Ciao, Thorsten
> > Commit c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from
> > DevicePage0") changed mpi3mr to prefer the cached DevicePage0 rate.
> >
> > DevicePage0 stores negotiated_link_rate as one standalone MPI3 SAS
> > link-rate code, while SAS PHY Page 0 and SAS Expander Page 1 store logi=
cal
> > and physical rates as two nibbles of one packed byte.
> >
> > mpi3mr_get_sas_negotiated_logical_linkrate() currently sends both forma=
ts
> > through the same high-nibble extraction at its common exit. A valid
> > DevicePage0 value of 0x0b or 0x0c is therefore converted to zero. The l=
ater
> > minimum-rate safeguard then publishes the value as 1.5 Gbit/s.
> >
> > For example:
> >
> >   DevicePage0 value:            0x0b
> >   packed-field extraction:      (0x0b & 0xf0) >> 4 =3D 0x00
> >   minimum-rate substitution:    0x00 -> 0x08
> >   Linux SAS transport result:   1.5 Gbit/s
> >
> > There is also a topology distinction. The caller uses the returned valu=
e to
> > update the parent sas_phy. In an expander topology with the HBA-to-expa=
nder
> > link limited to 12 Gbit/s, DevicePage0 reported 0x0b for every tested
> > target, while Expander Page 1 reported 0xcc for several disk-facing PHY=
s
> > that were operating at 22.5 Gbit/s. The cached target value therefore
> > cannot unconditionally replace the local parent expander PHY value.
> >
> > The original failure was reproduced on an eHBA 9600 controller with a
> > SAS4016 IOC and a 46-PHY Microchip expander. Before the fix, a target w=
ith
> > DevicePage0 negotiated_link_rate 0x0b could remain visible in sysfs as
> > 1.5 Gbit/s when a replayed topology event contained current=3D0x0b and
> > previous=3D0x0b and therefore skipped the Linux-side update.
> >
> > Validate the standalone DevicePage0 code and use it directly only for a
> > directly attached target. For an expander-attached target, retain the
> > existing Expander Page 1 path because it describes the local parent
> > expander PHY being updated. Retain the SAS PHY Page 0 fallback when a
> > directly attached cached value is invalid.
> >
> > The topology-aware variant was tested in an out-of-tree mpi3mr 8.17.1.0=
.
> > build. After boot, Linux reported:
> >
> >   PHY 18: 12.0 Gbit/s
> >   PHY 19: 12.0 Gbit/s
> >   PHY 24: 22.5 Gbit/s
> >   PHY 25: 22.5 Gbit/s
> >   PHY 26: 22.5 Gbit/s
> >   PHY 27: 22.5 Gbit/s
> >   PHY 28: 12.0 Gbit/s
> >   PHY 30: 22.5 Gbit/s
> >
> > No tested PHY was incorrectly reported as 1.5 Gbit/s, and the 22.5 Gbit=
/s
> > disk-facing rates were preserved even though DevicePage0 contained 0x0b=
.
> >
> > Fixes: c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from Devic=
ePage0")
> > Signed-off-by: Ilya Khomyakov <khomyakovilya@gmail.com>
> >
> > ---
> >  drivers/scsi/mpi3mr/mpi3mr_transport.c | 46 ++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3=
mr/mpi3mr_transport.c
> > index 240f67a..740fccc 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > @@ -587,6 +587,30 @@ static enum sas_linkrate mpi3mr_convert_phy_link_r=
ate(u8 link_rate)
> >       return rc;
> >  }
> >
> > +/**
> > + * mpi3mr_sas_link_rate_valid - validate a standalone SAS link-rate co=
de
> > + * @link_rate: MPI3 standalone SAS negotiated link-rate code
> > + *
> > + * DevicePage0 stores one plain negotiated link-rate code. Accept only
> > + * negotiated data rates supported by the SAS transport conversion cod=
e;
> > + * reserved or transitional values must use the existing PHY-page path=
.
> > + *
> > + * Return: true for a supported negotiated data rate, false otherwise.
> > + */
> > +static bool mpi3mr_sas_link_rate_valid(u8 link_rate)
> > +{
> > +     switch (link_rate) {
> > +     case MPI3_SAS_NEG_LINK_RATE_1_5:
> > +     case MPI3_SAS_NEG_LINK_RATE_3_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_6_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_12_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_22_5:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> >  /**
> >   * mpi3mr_delete_sas_phy - Remove a single phy from port
> >   * @mrioc: Adapter instance reference
> > @@ -2292,18 +2316,26 @@ void mpi3mr_expander_remove(struct mpi3mr_ioc *=
mrioc, u64 sas_address,
> >  static u8 mpi3mr_get_sas_negotiated_logical_linkrate(struct mpi3mr_ioc=
 *mrioc,
> >       struct mpi3mr_tgt_dev *tgtdev)
> >  {
> > -     u8 link_rate =3D MPI3_SAS_NEG_LINK_RATE_1_5, phy_number;
> > +     u8 cached_link_rate, link_rate =3D MPI3_SAS_NEG_LINK_RATE_1_5;
> > +     u8 phy_number;
> >       struct mpi3_sas_expander_page1 expander_pg1;
> >       struct mpi3_sas_phy_page0 phy_pg0;
> >       u32 phynum_handle;
> >       u16 ioc_status;
> >
> > -     /* First, try to use link rate from DevicePage0 (populated by fir=
mware) */
> > -     if (tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate >=3D
> > -         MPI3_SAS_NEG_LINK_RATE_1_5) {
> > -             link_rate =3D tgtdev->dev_spec.sas_sata_inf.negotiated_li=
nk_rate;
> > -             goto out;
> > -     }
> > +     cached_link_rate =3D
> > +             tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate;
> > +
> > +     /*
> > +      * For a directly attached target, DevicePage0 and the parent hos=
t PHY
> > +      * describe the same link, so the standalone cached code can be u=
sed
> > +      * without packed-field decoding. For an expander-attached target=
, the
> > +      * caller updates the parent expander PHY and DevicePage0 can dif=
fer from
> > +      * that local segment; retain the Expander Page 1 read in that ca=
se.
> > +      */
> > +     if ((tgtdev->devpg0_flag & MPI3_DEVICE0_FLAGS_ATT_METHOD_DIR_ATTA=
CHED) &&
> > +         mpi3mr_sas_link_rate_valid(cached_link_rate))
> > +             return cached_link_rate;
> >
> >       /* Fallback to reading from phy pages if DevicePage0 value not av=
ailable */
> >       phy_number =3D tgtdev->dev_spec.sas_sata_inf.phy_id;
>
