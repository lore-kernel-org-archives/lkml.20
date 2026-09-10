Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F09348C50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068716; cv=pass; b=HbIbfr/9YhEGbw1B49WA3gpQDKIPwaJGGxFphaGM4xNhIT6+Fn4cYnxjjPkNAMrj5BlrPlHmpdmTztVYwBZANlmct0xbVw5vT3jutHZ9Pc6k4LjSgXUbi0+c6+l8XAY5WuCStXS3iKPQJjaf8HjRGvM/7ICiQv2YQwykgnKdMiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068716; c=relaxed/simple;
	bh=BCOD+UDwEu/EcPHRC55YdZVtEVa30m3T52Lv8r6g084=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRwx9MJlo/U8V9LR8FsHqzF32SWaEOoZ1uLlkg7Iils9QAZoRZ30weuQyKSGT6mhasLYYEAFxKH9JHrUYGtFKbuVhLyoFbOEi0llwRUCeSjW0Lme6bMxrlKE6FxtyfpPQrgzqK/iP+pL02g1CW/z534d/rZcKNe/43mJPgsZgzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB0mHArs; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB0mHArs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c262204cc80so21530366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068708; cv=none;
        d=google.com; s=arc-20260327;
        b=J7En+sxM2utwIPbsjLI0xU+hoia6k6rkpFgXpy5v0VKDyf0adfCTXN3+D3Ta7/I4nM
         /31mfuiswzkck54aBy4aUZqv9KatoGrw+y8B/pViuqaBtXpcymTubX+6qOLq2fT37CWH
         09A++sxDgRXSSaqLdChOIE4dgohTOwzpfJdxHgZJ1+nk5m06EnRQ5/ORQK1rkwQe95uE
         +dRxVXkGmjoAfdX+eGkf/xqmYixSL2WklwWtthVmssa7WYHAIxZKvtUTkBeh5KQI17uQ
         kvh1nA29zxOdN4q9aMl6RM+Qzdjaaeay7+wqobw2Uunxs3cl6r4pQhG6rqByW13J+fQC
         8f7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        fh=YvR3ha5WujmxxWQnhK6VIu4Y9Y67I0Mf2OFRl2AFXIw=;
        b=mMj9xrCYi4ulsV2CnrROsdpS8K0WVDfEKSIfXHkt5rCb/ilh8oMRXxJApNHkWiueEN
         EorTdWe459LTL20EUQpaoNHVooqRU7KAuMT7dohNUwiMW8RF1mR0d7bJie6Prci9jvmK
         fSBxM/LRHWIv8JrftXG5gpBYa4GZejfEAXzyJAjZdhQWlAhKKjIJ2eUeLs8KJv6avBIi
         LAM+3iabu/3WQQA/NSgP3i0o+g6hNYJClxgaLGS98J0mwzuE0vD8Ua904anvkqkA13PJ
         650qf9YcoPkbipaeGQSfWQWkEw+rNyAyRXqcFg1zXdBccnK33tisabHyZtNR4QystmCU
         dF/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068708; x=1789673508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        b=PB0mHArsRH34V11B0DZUd25e8Wo7c02anj9VYaYy02s44WxqGZREV7C/qD2fkeVoWd
         KueBTjcnbTuodMCo8kkldRT3CKPylQhE617rzRiSiUHyoTGTf/vlXk5lhfAVh/DVvc7/
         tbAOFnP1W8mb/KlR82eAU2HjI0UlD48nEq2v7W0QmWxdEAi5LtbOMKd0dQq995jn+rFZ
         iOpktpuoA/9YRQTONP5MhEXmCsaJu9ZqeuEuwOdItE+J/H0N4/zBXg6nAPHGewmvK37c
         6r7y6usGEhXusRjFmIbXJWhmSHBBqhUOQOAKoTXQ5srXkb0yzOZ/l2CyG3qwQ7LWHuy6
         OSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068708; x=1789673508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        b=CtRB07XYJqxMI5Y7LVGZyzF5ovuW933yOYno+Op4FQ6Mg2JKIUtHlRf3ZjbUGc7w+8
         K5aR48PVclNo8USNldvrtQtiIqutH6E3PgzJf745/MtE5OnlA994nZ+PRM2m4HMqb1Jv
         ixMAIkuKkOtlq/RsLxuvaBiaNMbZihIR5BM/t84HNh0EdsutV67w1QSCYWpuonDM0PfR
         I3w0mISMJcWG3LOz5xf9sjOfXoILnJCLG+yB7qGc0tO7fZYcuNELwhiRBr8UpT/mpmUv
         cHuwqCjSmtDAff0usSz3k7Pd6B69abtKCpmm8mfRilUGnE6f2SCqvOIydsPLnNoy4MJn
         3afQ==
X-Forwarded-Encrypted: i=1; AKwUvByEqE3Cl6/SqXlwqT96MZD8NJUbpL220E3ssXTlzUlSP9gL6EBL+wzSX9f+czEvZmX0YsrJ4MITRR9qPds=@vger.kernel.org
X-Gm-Message-State: AFuF++lVDiKCYoKZmNtwZxVgnYf5xtBELZ86QlFMtppsXpIjAFLB+LQZ
	lshVrUUJ+WcTkLhGA0rQVmBp3CvhTfn2e/PGYioAD70ybm5BfKf4PYVAh7mzu6a2+z2OXjONFD7
	8uHJqaGrjivAOw8Ga2aCqqDm89AJG1X4=
X-Gm-Gg: AYBFou17lgPFTsmNiqCzOKdTPfA7DMyewnrwgdw3b+pMssvus+2fV5BkGcyCXvrSeq5
	UKMl5R7qHqewMSGECPwMWW4UtFO3VQsoeGJznsZFleD06zAimtPOX8TtnNzyWOeNjYZytPuIst2
	65KYY/OJsodVjBch9cIlQzI2OGvePnH3/ALZ2mfdDhAGwIDIsJd4Ih2W1aLnrLk/0SDQ1/yLEbW
	Gy5GNySKKj6mqJVk76agc4CkA0QpqvohjJ/Ze8AaB0/LkUlwj3vwMwI7E+JBQv8pmDGFKP4VGUS
	Ylyc/01q+wrk78miHHvfxdMzRiFDDKOyTPMogX1lR42cr1dPIba8DB7JfzXTVvr/HBlVuWTH3Sv
	xD5L7imqx3SrK4DUvUOlewopW4He0rvQstTKHimFZFawTydMyWG9tUv3Uo5stOV+/uQR5XlTjYl
	wL0lcju3pnh7fJX1k4Sbvu2DPHNELdEhoRulyZPmJebv1UucWKY+Mex1Bk3Suj5EgQrw==
X-Received: by 2002:a17:907:6e8e:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c29661bfe7dmr10767666b.0.1789068708317; Thu, 10 Sep 2026
 12:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820002816.17382-1-rosenp@gmail.com> <aqK0A4TFCM-laOab@parshuram>
In-Reply-To: <aqK0A4TFCM-laOab@parshuram>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Sep 2026 12:31:36 -0700
X-Gm-Features: AcwNN1Uq4fZ-T-KVq39eU8J9hv5nIL5nrMVLIWG1qvJ4Nk2oF1d61Ro6RMGK7r4
Message-ID: <CAKxU2N_x1cJ2Am1UyBK--Jj+AP85jfkUv7J1_LHLEnmOpgajPQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: fix sparse warnings
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 6:43=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 19-08-26, 17:28, Rosen Penev wrote:
> > The register maps in fsl_raid.h annotate every field as __be32, but
> > they are accessed only through ioread32be()/iowrite32be(), which
> > already perform the byte swap and take plain u32 __iomem pointers.
> > The __be32 annotation therefore makes sparse reject each access:
> >
> >   drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
> >       (different base types) ... got restricted __be32 [noderef] __iome=
m *
> >
> > Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
> > descriptor/CDB structures written via cpu_to_be32() keep their
> > annotations.
> >
> > Also fix the remaining sparse warnings in fsl_raid.c:
> >
> >   - compare the desc pointer with !desc instead of desc <=3D 0 in the
> >     three prep functions,
> >   - byte swap cdb32 with cpu_to_be32() when programming the XOR, PQ
> >     and MOVE command descriptor blocks; the plain u32 assignment is
> >     broken on little-endian hosts.
>
> Can you split the change per warning type? Also, the subject should
> describe the change and fix something.
Would it make sense to do that for a single report though?
>
>
> >
> > No warnings remain.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp=
@intel.com/
> > Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem an=
d cast at access")
> > Assisted-by: opencode:deepseek-v4-flash-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsl_raid.c | 12 +++++-----
> >  drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
> >  2 files changed, 33 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index a35ddc1297ce..524a7329c3c4 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -350,7 +350,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_genq(
> >       }
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       if (scf && (flags & DMA_PREP_CONTINUE)) {
> > @@ -365,7 +365,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_genq(
> >       cdb |=3D FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >       xor =3D desc->cdb_addr;
> > -     xor->cdb32 =3D cdb;
> > +     xor->cdb32 =3D cpu_to_be32(cdb);
> >
> >       if (scf) {
> >               /* compute q =3D src0*coef0^src1*coef1^..., * is GF(8) mu=
lt */
> > @@ -474,7 +474,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_pq(
> >               src_cnt +=3D 3;
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       /* Filling GenQQ CDB */
> > @@ -485,7 +485,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_pq(
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >
> >       pq =3D desc->cdb_addr;
> > -     pq->cdb32 =3D cdb;
> > +     pq->cdb32 =3D cpu_to_be32(cdb);
> >
> >       p =3D pq->gfm_q1;
> >       /* Init gfm_q1[] */
> > @@ -558,7 +558,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_memcpy(
> >       }
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       /* Filling move CDB */
> > @@ -568,7 +568,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_memcpy(
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >
> >       move =3D desc->cdb_addr;
> > -     move->cdb32 =3D cdb;
> > +     move->cdb32 =3D cpu_to_be32(cdb);
> >
> >       /* Filling frame 0 of CFD with move CDB */
> >       cf =3D desc->cf_addr;
> > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > index 748047996bbc..1b6f6b82c7d3 100644
> > --- a/drivers/dma/fsl_raid.h
> > +++ b/drivers/dma/fsl_raid.h
> > @@ -109,59 +109,59 @@
> >
> >  struct fsl_re_ctrl {
> >       /* General Configuration Registers */
> > -     __be32 global_config;   /* Global Configuration Register */
> > +     u32 global_config;      /* Global Configuration Register */
> >       u8     rsvd1[4];
> > -     __be32 galois_field_config; /* Galois Field Configuration Registe=
r */
> > +     u32 galois_field_config; /* Galois Field Configuration Register *=
/
> >       u8     rsvd2[4];
> > -     __be32 jq_wrr_config;   /* WRR Configuration register */
> > +     u32 jq_wrr_config;      /* WRR Configuration register */
> >       u8     rsvd3[4];
> > -     __be32 crc_config;      /* CRC Configuration register */
> > +     u32 crc_config;         /* CRC Configuration register */
> >       u8     rsvd4[228];
> > -     __be32 system_reset;    /* System Reset Register */
> > +     u32 system_reset;       /* System Reset Register */
> >       u8     rsvd5[252];
> > -     __be32 global_status;   /* Global Status Register */
> > +     u32 global_status;      /* Global Status Register */
> >       u8     rsvd6[832];
> > -     __be32 re_liodn_base;   /* LIODN Base Register */
> > +     u32 re_liodn_base;      /* LIODN Base Register */
> >       u8     rsvd7[1712];
> > -     __be32 re_version_id;   /* Version ID register of RE */
> > -     __be32 re_version_id_2; /* Version ID 2 register of RE */
> > +     u32 re_version_id;      /* Version ID register of RE */
> > +     u32 re_version_id_2;    /* Version ID 2 register of RE */
> >       u8     rsvd8[512];
> > -     __be32 host_config;     /* Host I/F Configuration Register */
> > +     u32 host_config;        /* Host I/F Configuration Register */
> >  };
> >
> >  struct fsl_re_chan_cfg {
> >       /* Registers for JR interface */
> > -     __be32 jr_config_0;     /* Job Queue Configuration 0 Register */
> > -     __be32 jr_config_1;     /* Job Queue Configuration 1 Register */
> > -     __be32 jr_interrupt_status; /* Job Queue Interrupt Status Registe=
r */
> > +     u32 jr_config_0;        /* Job Queue Configuration 0 Register */
> > +     u32 jr_config_1;        /* Job Queue Configuration 1 Register */
> > +     u32 jr_interrupt_status; /* Job Queue Interrupt Status Register *=
/
> >       u8     rsvd1[4];
> > -     __be32 jr_command;      /* Job Queue Command Register */
> > +     u32 jr_command;         /* Job Queue Command Register */
> >       u8     rsvd2[4];
> > -     __be32 jr_status;       /* Job Queue Status Register */
> > +     u32 jr_status;          /* Job Queue Status Register */
> >       u8     rsvd3[228];
> >
> >       /* Input Ring */
> > -     __be32 inbring_base_h;  /* Inbound Ring Base Address Register - H=
igh */
> > -     __be32 inbring_base_l;  /* Inbound Ring Base Address Register - L=
ow */
> > -     __be32 inbring_size;    /* Inbound Ring Size Register */
> > +     u32 inbring_base_h;     /* Inbound Ring Base Address Register - H=
igh */
> > +     u32 inbring_base_l;     /* Inbound Ring Base Address Register - L=
ow */
> > +     u32 inbring_size;       /* Inbound Ring Size Register */
> >       u8     rsvd4[4];
> > -     __be32 inbring_slot_avail; /* Inbound Ring Slot Available Registe=
r */
> > +     u32 inbring_slot_avail; /* Inbound Ring Slot Available Register *=
/
> >       u8     rsvd5[4];
> > -     __be32 inbring_add_job; /* Inbound Ring Add Job Register */
> > +     u32 inbring_add_job;    /* Inbound Ring Add Job Register */
> >       u8     rsvd6[4];
> > -     __be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Registe=
r */
> > +     u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register *=
/
> >       u8     rsvd7[220];
> >
> >       /* Output Ring */
> > -     __be32 oubring_base_h;  /* Outbound Ring Base Address Register - =
High */
> > -     __be32 oubring_base_l;  /* Outbound Ring Base Address Register - =
Low */
> > -     __be32 oubring_size;    /* Outbound Ring Size Register */
> > +     u32 oubring_base_h;     /* Outbound Ring Base Address Register - =
High */
> > +     u32 oubring_base_l;     /* Outbound Ring Base Address Register - =
Low */
> > +     u32 oubring_size;       /* Outbound Ring Size Register */
> >       u8     rsvd8[4];
> > -     __be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
> > +     u32 oubring_job_rmvd;   /* Outbound Ring Job Removed Register */
> >       u8     rsvd9[4];
> > -     __be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
> > +     u32 oubring_slot_full;  /* Outbound Ring Slot Full Register */
> >       u8     rsvd10[4];
> > -     __be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> > +     u32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> >  };
> >
> >  /*
> > --
> > 2.55.0
> >
>
> --
> ~Vinod
