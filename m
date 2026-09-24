Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93F2D8DC4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275811; cv=pass; b=gfAmUQTFLU1yQa1fkvK/MNbtQBeAwKqDTXM4Y6IszxM/+q18eHZga60//fzdos4EMVLpSiQL1HnoJTyi0f3PgeDmgc4qSEl/pNkqOJcSb27bSmBpH2Aw1tBwvIP0As7lZTah/zszTUL44vpseaW8UbaoxsFhj18kV07HsfgRZaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275811; c=relaxed/simple;
	bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZafhaRT1YplkQUGfpvBhUcyOB6ojbP55rogPeXMHBaKrKnbjOlKonxCkRbNYDGi2cjKXUcO8jBhPqHk1hJp0iXyl4QL744n8A9bFvXiLFoNcCZ0+I2+35C4KvYfTO4DpMz1khm0Y1ABDSQDVP06tGRU8B5T5AsVaCvaDVvxPGAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GIq8vZW8; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GIq8vZW8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53113d72966so33151cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790275803; cv=none;
        d=google.com; s=arc-20260327;
        b=Vq+lwvzIkzj7Op9dqNxWeqXLLsAzwQndPDe90zPbwrIUh7sLbCYRpUVZwYvpSl4Bsr
         C3SQXBEN8wKc20mIxVLlKe5h4AvDmscSYuYqYfoz3y9ROZdbshtmgtHaC1UzdQx3EKiQ
         bCHcRVSYH1VTqzLrx0fPTJVeVGgiqY9qSABXoRusTvQCS9iwU8Dyl179nlwemsl2xB/l
         cyURVmwmEXtBzieXxjKhtqMW+McVPJH+JWVrQtTzjRqPAeDmGtj66sOmFLwhPonG3boW
         o3XomhD/6ZNryvIfr3ph3jEEflciSp2wo4L9BI1yYBw/YMP6aP7gnDsvC3m1TL0ZqWKi
         C9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        fh=fbGd3cSA4u7TxpsYEsQWOwtHdOuRqA7Ahd/Dd7I3SJ8=;
        b=AvZO7lME/ybNErTbyVPzd9rR+0SOEJw+NnBzitau40WSV1BOPOlL4/hjIvD1LfyTc5
         NT4yG/CYfn5Ce+CErgsLrIlkLOrQrNi0+KqUorr4apnszKTHMUf/g9GNdJ4BSRMKDoQe
         l5EvgxRcGuOQ5zMu0ZnSIESdcrPwXCkSSORyJTWKbL2s2nVNWCOumvagJAhdDjSOHygv
         P2rIz+ExTj6solG/kNXlhLSEh0Af0GjFhTwgIGd54dLxmL6dhCY2ltAqkk4NcRX5R2Ko
         6f+xuNzFgmdu1tTWIYbwcHAAOwru7dtgwtVadJ8DsQvmd/w8/lyWEyi1NsN8kxk81aVf
         4ONA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790275803; x=1790880603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=GIq8vZW8vAAe4PbsY8eSdwj1L2pi00Yiy7APVT4FO4Kvrr7MmSSSyK5AosdEvC48BI
         PLRi3mpAtmEIQT6HkiBOQBFj1djYb+pOZxWYC7vkxRD6rVcZnxfJ0/9E5on8bU2sUdT3
         9WlIpbNvt5wKnPJ+A/1pMipXLRKyQ3tIr1hrHzZ7qBcciklV+HS08pulcubmBpd+g+tS
         /7t3iWc20ly6kkYxCZxGR+5TOyftl+YKc4OjE/Npk2JzTOkkstsq05ei6pNA5ZJI/nvS
         gIvd/pAZ4YUd7nyuM+t3AfYjoi1CjQQRPDe6KtXsWi2z34U3hMBJzzsDJiZOa2nsqcky
         /Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275803; x=1790880603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=aCV6tk4GKrZcHzODt/mUiFrTYdqNruakPqN97M9UH1kNDUSqxUe6uGtjUwzeS/Qg2o
         zd7joyDVnVU7HqOge8iNmj9pP0+NykPtJsZoGx97S7Jat1xDPo7VQb1XqmeATzknaIU/
         tVE2Vs8wXUorsRx6XLumaJYfjppi3BuKoNSYd1igfIcFDiCIkRNrmkl+739xxeopdrxW
         hUTXQbHI0DP+4zAgiHJzWQ/wSc1J6Ca65WPGTfxDOEutptv9P/fGwCKHibjdpnbeZQ0E
         X4uawmM+vP0rniVJdu52ud49S06tsKIcKZqKdnKwX0iIBAYBonFRbWfZwP1PidkJzAKP
         kpKw==
X-Forwarded-Encrypted: i=1; AKwUvBydbMarP+xa1gTocIDgwVfGsJmFlZRHq58H2GqHM1CiViaXssb1fYprSzJrOaCc0soiNZsPsQxEXpUEA4k=@vger.kernel.org
X-Gm-Message-State: AFuF++nMznkCIGoY5JwiCVxawmP+/j/Jwk6mIFqZ4k0KmtGf8RKWLW4f
	orCw+Z2VwWQftrD7aPZfH8ljGQ71tm3ulmCcCFUOcwmhb00BC+jwMj0PBT0SlEXyemTUrjBWKzG
	E/8zPRzzo5Km4vvbOB1FsdT11S4tDUVXhciWKcBCf
X-Gm-Gg: AYBFou2/ncrQSYmvpyPZyM1K7vqY9hhLC4Kgf+XqLlT4S+fz3wjZKnQhnJ1a+Ls55bL
	LaJlf8Avkf/wIcyzzz6m7N1F6/EefHMTbKqJHlE0PSEC1rdoLOGSXY8WB6h5o+Ld4mipAtzH0Y1
	ryJpmCjAnXpC4vMdaW/mlTLJdtD3X18NCUDvQf2q4Rb4XUdXgHYXGjamC1wX70UXw48I5eeu0Lg
	qWNiCk7J/agX2Du/6X4UIi0V506Hvzh16dwnc9CM3796iWTr6QYkMexvPAhG+NLns9XINKSgtoS
	mJ+ZiNGwqps8vO3XuSqshaFomXG3NR22ILAIxxjIND14Lmufza4k
X-Received: by 2002:ac8:5a47:0:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-5330b91b69amr764001cf.15.1790275801917; Thu, 24 Sep 2026
 11:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com> <20260924001502.GO1540250@ziepe.ca>
In-Reply-To: <20260924001502.GO1540250@ziepe.ca>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 24 Sep 2026 11:49:50 -0700
X-Gm-Features: AclHuK8NxjjK4LAAInZh9B-AiWvxMmczV1znpTfWeKjoAyhZX_I7iFt3P7YZv3g
Message-ID: <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:15=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> >
> > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > When a set of consecutive PTEs map a naturally aligned contiguous block=
 of
> > memory, set CONT on every descriptor in that group so the hardware can
> > combine translations and improve TLB reach.
> >
> > Advertise the supported CONT group sizes in pgsize_bitmap. Callers sele=
ct
> > those sizes through the normal page-size selection path; io-pgtable-arm
> > then installs the corresponding tagged descriptors directly. A partial
> > unmap of a tagged CONT group is rejected before modifying any descripto=
r,
> > so a rejected request cannot leave the group partly unmapped.
> >
> > The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disa=
ble
> > CONT support for hardware with implementation-specific errata.
>
> smmuv3 has this errata, it must be disabled there too. I didn't notice
> it in this patch?

SMMU is an architecture specification. I am not aware of errors in
this architecture specification that would preclude the usage of the
contiguous bit. I understand that Arm MMU-700 has the following
erratum

3777127 Under invalidation in TBU possible when using contiguous page
table entries

The recommended workaround is described as

"Ensure that contiguous page tables are removed using a single range
invalidation. Arm recommends using range invalidations to remove
contiguous entries anyway for performance reasons."

and I believe we are already doing this.

Which specific implementations of SMMUv3 do you have in mind that have
errata precluding the usage of the contiguous bit?
