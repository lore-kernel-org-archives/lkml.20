Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0B521234
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059011; cv=pass; b=AemIVyTs5L3soXOTNC8LyKw9TV3Uwcciu8HY2PGdWHnCvDXmWiqi66TNO1TnRc4YtaCZBIpnHzhsDmwH0bqz/pxl4K/MbpsXNYVo3Qc0Oz10tMT0neUQeT2UN3bRdkHwd3/fL7G26sfeiftfprAT4aAW4XoYVUmnop4hB8lSPr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059011; c=relaxed/simple;
	bh=+HKUJE6P85XJHh4t+ruBGSw/fPns5n/Fki/8ibDdu/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xo6qp946oHPtCbUcJPrgkzNZLPInlSTLDW4kCQP0c6lwW2WN6jm50WP6lGNfhihhxezf3Ta/0W2eRA2MQgZuseCWeguYVh3BoCIK822SB/+lEmeyNoQCs6sugBQPoG65ejUj9JJFYIeuHmYIBAQQdFncz3P3CYeUgIl54IWutpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=nGZq0c7r; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="nGZq0c7r"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-857ff9fef54so72900287b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059007; cv=none;
        d=google.com; s=arc-20260327;
        b=hPrModxOweDm1IQ1gVCTkVhNTJpAwHCLcuknOSe+844w0i/Dkdf9Ashj9heG1l++EU
         ghKTEt5j4eKzOzmgyaA4whOneUPxL+1g3HnQCwLcN2lbKE4RoL0tYNhThs0m+eKVF/y/
         tznhIbhxla2b13gYdQRsusCnqWDgLPEzNgKLA5s9g7/xOELUuwiK0+lzkmyCqJ95gW7B
         gTHuSh94De6h3ynqs0UGZbvXWVzvCezpwpSUuxZmVvAvI4OYZ/a7QChbjnkmlxE0m2NQ
         4/zOxKCamcq/iMdegRtzddy9HNVevVXQPkb2wJeWu/Bbt2Cjad9PTAJ5vSuh63BJA/+J
         PQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xno3TEY+GFXENHJM/t8g6PbysHqcDlXxaL+1MiwWtY8=;
        fh=YXLQxd5qk1z3LHwdQRJ8BW1A4PWUCHSgXCiJy4KD9BI=;
        b=JfDivINzOtQrviaXQstRWUwBoRLRHTyWnp8YKUEogL55UrstR/QpwK3bi2X4HZeWc3
         0UhzAhGkThF7HjMHTOzESTcNlsu0s+NaXaRTogXbTl2WhsrObfOmcYEmPxn0+wkcr6Rx
         SM15EqnTPkS/Euno1KlqlufxhjLO4rTkmU5kR6u2OiW7MrNJ2cjTo+9elxI1W9LeZT/L
         1I8OQBJQcKmrn7kqR/UnD410iM3Nfx+fKXgCdlltJvLk7kpezgZN4vgHqV3IUz8L4ieW
         D/XumcA3rLCSDtjQO6T7Qm+mROPS7j1PxHS26WAOsm5gg6So6Eq51R32rC5SPcpvS5px
         DXwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789059007; x=1789663807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xno3TEY+GFXENHJM/t8g6PbysHqcDlXxaL+1MiwWtY8=;
        b=nGZq0c7rsOI31QlSRDtELBMbHS2uGfcU+KY5uItyGhI0HV8Q6gsdD4uYxn8lRTZXcz
         gdFEZL3cqpOeY6EAEXiNGCUqxfZ11ya7G1KeYUbIN9qh7RVS+/Vv4tPhnry29lmkLG5s
         KZDN6GHv9DABpsFtfrm6sroCyOhLcjx3eVMjoMhb5iWeS5P50Hj9b4IlVAIBFFMOem94
         EAzHxA0EpvpJ+DlI5hKTX1QaKEEdNRE1gJkNnoo0BtfyQIpQrdaDewUm39jCQLRmgryu
         Y3pBmWfwgqd0878j8dN7SlfBvqIlZ5cM3HxHQhIVAmXDOnwUusRPSdlknPqU5rmXKYJU
         YKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059007; x=1789663807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xno3TEY+GFXENHJM/t8g6PbysHqcDlXxaL+1MiwWtY8=;
        b=SOifrHtARbsEfm3zTyCqZJp/01nnNc3dy9JElOxrsPJSFn0J12KPm58bzPA8b9ruT5
         I2yOKF8BnE2/WFl/4O3UsH25Ub9TEIuXE/hJA9sLLxWIlxUQ/cHvJ39b4ZOhrDfKa9WU
         h1uA+irgq0SE5ObEmLaunXrDtp+Bmg0+eSD0jGy/tVdF8wmtYrs/U+k8YRJqKHFETYVR
         KuWFaykGb6flrPP+VzMesIRuD9pKhxGYxGKI7b8jU5T8IVm0lPmrsvnjl35QFlNKcldD
         G4MSIeF+nJeCClGtXbVGLYh7kMP0R7CiHPbmEh4qPCW/cD1JJEnsebfcb3MVrolT1bSx
         +DHA==
X-Forwarded-Encrypted: i=1; AKwUvBwbxM1H+U9VxcplWVJhyGsQISWsHjTOcq4VetWoPFFozSAjkT+ok2sabWVROax5WLxXsKjxjb2rIt07XeY=@vger.kernel.org
X-Gm-Message-State: AFuF++mVAFl3i8R7eWDD1cjnD9e+6xfJc5O1F8RFQInPMXuZO2/L2kWR
	tghQPaDYY37jzXtgHeW39enrgvvG+Sh04J0Y2jT6vi9uBNsiM8l2jnI41rMN7M21x5sUrGMUIZJ
	rs8xwAyKdzo5ShIxdWREbIRBHh+Fb5VHlypfWd4lL
X-Gm-Gg: AYBFou1/GxHm7DNViob48ry5f0FL1iNbKbXINaqqCZ0V/E+9DBHmOWrf0sFNzO6xb1G
	KfQeTamR7LVBoGe6NXhmqiIcgib5NY+uH4dfuXMGSVwsgMViQKd4yNZsXQN+teqzdo6jNGBdVog
	gmSOdmvgGHnrg/8bZY7qT3wv7pBwf+wdd2818RDEBDO5yBNEl/u/tEIi1CabvUq0U/FNNA7uy5A
	dRqysMnhTTPi49r1wnJLRdXZMHpYLmUe4m1lFzOlITiPoOgzWMciutvwsKxS6HDxJb2y0khUNFY
	roZWq5WqinzVvJEyHLMIyYceGaRayWeGCwixDjYJMs2JqhfzGt6wxWSJ2eou58m0ccoQfsf+oWz
	QITHqS0vIwA==
X-Received: by 2002:a05:690c:e3c1:b0:865:7a80:36b7 with SMTP id
 00721157ae682-884b2104374mr581967b3.6.1789059007209; Thu, 10 Sep 2026
 09:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <50fc5e8a29e3a5e9a64c64c5f775d758dce39b71.1787603965.git.sean@starlabs.systems>
 <CAPx+jO-TodBfjkJ6SV39LHWyTKDRj=P-Fq-VnfT=kin4VBKkvw@mail.gmail.com>
In-Reply-To: <CAPx+jO-TodBfjkJ6SV39LHWyTKDRj=P-Fq-VnfT=kin4VBKkvw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 10 Sep 2026 17:49:54 +0100
X-Gm-Features: AcwNN1WAn_D4uG0zFEIPWU8SqL3y7X6o9ipW1UeAOApWdvc1we7lE80s0UDXMUk
Message-ID: <CABtds-2y94frC+4T9nsDzO8oSBE7CjrW20=MrgiTGUoFqZFwaQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx_usb_sdmmc: start card power-up at 3.3V
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sept 2026 at 17:05, Ulf Hansson <ulf.hansson@oss.qualcomm.com> w=
rote:
>
> On Mon, Aug 24, 2026 at 10:39=E2=80=AFPM Sean Rhodes <sean@starlabs.syste=
ms> wrote:
> >
> > A UHS session can leave the SD pads and SD18 regulator configured for
> > 1.8V. The power-off path disables card power and suspends the regulator=
,
> > but does not restore their voltage selection.
> >
> > On the next power-up, this stale state remains until after the MMC core
> > requests its initial signal voltage. Restore the SD pads and SD18 regul=
ator
> > to 3.3V before enabling card power, as the old rts5139 driver did.
> >
> > Tested: StarLite ADL with an RTS5129 tray reader; repeated 1.8V UHS
> >         sessions, power cycles, and tray removal/reinsertion.
> > Tested: StarFighter MTL with an RTS5129 trayless reader; repeated 1.8V
> >         UHS sessions, power cycles, and card removal/reinsertion.
> > Tested: Both systems re-enumerated the card after every cycle.
> >
> > Signed-off-by: Sean Rhodes <sean@starlabs.systems>
>
> Applied for next (or should this be a fix and tagged for stable?), thanks=
!

Definitely a fix; did I miss something there?

Thanks

>
> Kind regards
> Uffe
>
>
> > ---
> >  drivers/mmc/host/rtsx_usb_sdmmc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_=
usb_sdmmc.c
> > index bf37fab233cf..d9b33aa79165 100644
> > --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> > +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> > @@ -980,6 +980,11 @@ static int sd_power_on(struct rtsx_usb_sdmmc *host=
)
> >         }
> >         dev_dbg(sdmmc_dev(host), "%s\n", __func__);
> >         rtsx_usb_init_cmd(ucr);
> > +       /* Start SD init at 3.3V, like the old rts5139 driver. */
> > +       rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, SD_PAD_CTL,
> > +                        SD_IO_USING_1V8, SD_IO_USING_3V3);
> > +       rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, LDO_POWER_CFG,
> > +                        TUNE_SD18_MASK, TUNE_SD18_3V3);
> >         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SELECT, 0x07, SD_MOD_=
SEL);
> >         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SHARE_MODE,
> >                         CARD_SHARE_MASK, CARD_SHARE_SD);
