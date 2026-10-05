Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680575477E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235582; cv=pass; b=PqQfbABC918LmU26uhJ4y4YxuZYDmxHT+9GPy7taUc5Xfr1Tso2bBRjDWAzfTl/g3g7K4wEPPQHxB825bIno/uAeFzP9kY+zUdM1Z7snsXZsF7D5cUU1bC+2LISLPcGEXAaVpH50gRfpBb4owsM0eEYuzUIYki8sa+F+FxUKOmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235582; c=relaxed/simple;
	bh=S2vBvVoHVnC1tWQn7yYkVMwt5nPTA4KFwEAWn+1KcrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICTQ/vg0wlu4OJXjwnUZho51zmr86x5dbtdRtRlWuzc4xwRTHVBlwYPixO0k8o85SlLKfcU789WlfbMgr2ZueuSfALXVpyWxEIT1oJ5CrHQrxxTBnTewgUeyzahddm1EX2sA3Ndnh9nv9pHnROVLnXbEVzYu61Ufhy7MWnLnvwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gsq0n0m9; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsq0n0m9"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5351f9dbfe0so6421cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791235580; cv=none;
        d=google.com; s=arc-20260327;
        b=liM7kjCStxyl1So6eCDLw7idiiipcMBOA4vxn1OFu6fptlSwM935OalWgB2O2PWIj9
         EgJMBaYHaIuYm0346M+dg3icc3gWkCnvenMYs5rGVvsRgwO+jvcvqx5h+CMIRNN/cgLe
         2vT2trGmtGxAz7TFDs7U4Iaa9mELwiddG/XTS7KrlryL7QZ+FysmZcrZ6TZFev6Yeas0
         LYxhp70NEGpR8XEvqzC065Z2nSxkiDiMi6gAI4I4FoGbDBqMW5770W6e9RRuNe90rKqp
         K/RW4vk1AZi8SAICgqWShFqXmMk/boiXU3TxblR7E+zb9JwGPtrE2t0mI4pdxE5/cXbP
         gWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        fh=G6F40S4u8edi4hS/GNbZH1t621lNazrMECc+Oh/X5lo=;
        b=qwHUtD2u/sun/QYPUD3Htz8VhQrQHVY53s/Y3rJTHLWjtd7vCVrpYuYMeSS16E4uk8
         lx1tCjN1IxDgpTmMAwYutW6GWwzpYV46tNreNY60tD1WJ+L6OsRFN/bE8G5yFa3VeJJ0
         9BGYtb1lwEi7voDSnOQyOks0SrNAR/h6owllf4yaD81MiWFs5xlkoFU9R9BQHwDvU4FA
         6ASF+gMFkvAQpGgoVWWKOCQyfmatCkAFcBO/t3yPhNXOcLK8QUiSsBdMNc5joBYM7gHv
         kYzR8o3lFgrBXsbui2/Av2QJJ30o6QoHvgMggQ72Vx9xBBOqLB4nXhFUsXiYr40XgKLp
         xYBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791235580; x=1791840380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        b=gsq0n0m9LNcCrfCWdHl1czqVNCUR0HJMRhOEhgNVyupU0HcDuQGCzNdMLNzt8sgcT+
         NYBIEBuatlDsGtDHzURw268OqPNxokzfWkxX/TTZ1XmVrwBTXH/MjmjcNHzJH53Y4s6u
         cI2w73fr15DadQrY1NAd06OSPObxiqHKec5yPL47bwLtWDsAJuIsbLujoQA5Vrb9mq9L
         Q/+FeZPaEMcIatxHe3pmycQdxz+1qhKcaqqwXKiYr3/eFmCvpvlQLO++M2AeqDT6L99W
         gWaRV2PioPO+5Zqj42ULKfouNERUaB3LG+YoXPnUC+ocMAH3lM/7SF3K2iSkq6ZHsZ0L
         IDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235580; x=1791840380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        b=FeQJ7OCmO1lQgj8+RntXX2/shXBId9qp3sxNur/OnD8idDusdcYKvhwI4dfidOiXAK
         l1r56CQwhfE05ygHBcDlOfNvxtJlKuM0+2fC3O6x18LPQFUKJIj8Qpfhrgu6eSPaudDx
         a9NnWNJnx4WX1ciKind1qZKGWyB0/MMXZTUNdRDcGZ/4IATYle5jyRypzpHyq5knOrMC
         4xTtVm2Vx1aGsCTdBcDtT+GYZuUeltxAUx9O0yzjrQ7MHH4LsW/g2R41CfYhKu2h83lE
         9B6BQ4q1sBxZhUr/TzKSrve//Ax1v9dhDdafFsVmFUa7LFJWP0+X09ZZ1VVrrPldshV0
         +7ZA==
X-Forwarded-Encrypted: i=1; AKwUvBznLUgg7JX+UvHECtn1fFN+mFIz8kz3rMz6A4pJLOyArpmzT9/VCBkju7MN6DQI2uEjO8tPkSkzcXmwZfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mCcPe9eVF7T5iUgslsgUPN0yLb6Q5wlNA3m3m6hhxmQTTbVTxH
	/X3gX7ul/nXIBRqrjmwVy8DD3kSd7bzZDpAOtHINTTydUitGtAL4CIzV9xBy+C0UlCgVbE5vBj+
	YfkjrNtq7ipTVDC3I7aZ9PAPAwFFq7SXQGgBckM8v
X-Gm-Gg: AYBFou03gVJrtN9Q5Kgs357AQ4ctP/f3i9R60ZQG+cIfoAe6AhiBPNptY4vbrDj8GlQ
	R2I0dlk6n+qvXM4EAN8RPdTQW6j72Jjw0NaQ67tj4kCUjrOvh95PLFNp/QQ2Qs/NQBolQ7CaXcr
	o+9Nfsl4rgC+z37JtytsEM8DmXt7in2M3UloYBL7X0dGuOL/niHWuvb1HSS6/V58sIDxX8HkLmL
	gr68qMO6KXs7L6WCv962yrYC/zze4VP0zfcGaOjFlraq8EKUcYqzHcQSgTmuJwGGO1gYhn4NlZQ
	OKLaCQ3dYRSwVx16G6m0aiTOmUMjbixtfqFg/i5awTY4AVepvRG0ZWYaGh5xWOce
X-Received: by 2002:a05:622a:118f:b0:531:d8:e437 with SMTP id
 d75a77b69052e-5354229a448mr834721cf.7.1791235579527; Mon, 05 Oct 2026
 14:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com> <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
In-Reply-To: <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 5 Oct 2026 14:26:08 -0700
X-Gm-Features: AclHuK8Ya4qZUHEU4y2SIFN99XMdQR1xv1nuJUxB3fTt2xE4zcFS3toMd_5km7k
Message-ID: <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, will@kernel.org, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:42=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
> This still isn't answering the question of "why?" though. Yes the
> architecture says some things, but if we were strict about avoiding
> mismatched attributes then Linux couldn't ever support non-coherent DMA
> at all! Similarly while the architecture does permit SMMU
> implementations to be picky about their output attributes, does any such
> implementation actually exist at all, let alone in a system capable of
> running mainline Linux?

Fair point that existing implementations have been forgiving in
practice. My thinking here is simply that a small, self-contained
cleanup that brings the driver into line with the architecture spec is
worthwhile on its own merits, even without a known implementation where
this currently causes problems.

This is really in the same spirit as your commit 7618e4790982
("iommu/io-pgtable-arm: Improve attribute handling"), which aligned the
attribute handling with the architecture specification on the basis
that:

  "Although the SMMU architectures seem to give some slightly stronger
   guarantees of Non-Cacheable output types becoming implicitly Outer
   Shareable in most cases, we may as well be explicit and not take any
   chances."

As I noted in my reply on the v1 thread [1], under ARM IHI 0070
(sections 3.15, 6.3.11, and 13.1.2), a non-coherent SMMUv3
implementation (SMMU_IDR0.COHACC =3D=3D 0) in which every SMMU-originated
access configured with Normal Write-Back, Inner Shareable attributes
fails and records an External Abort (F_STE_FETCH, F_CD_FETCH,
CERROR_ABT, etc.) is completely architecturally compliant, yet wouldn't
work with the current arm-smmu-v3 driver.

It seems reasonable to be explicit here too and program attributes that
are valid per the spec, rather than relying on the interconnect to
silently degrade Write-Back attributes to Non-Cacheable.

[1] https://lore.kernel.org/linux-iommu/CAE2F3rACz6Z7X3NNfLWEfjTD9K9YJyYHHy=
GzcBafEemTFGhgqQ@mail.gmail.com/

Thanks,
Daniel
