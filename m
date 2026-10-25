Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792971287;
	b=tuiHN9+wkCW15SDuI7d3R/pIO8PqtdZjAc8cV0eTXJZ2dR4ECvdbVa5geByWp0obQYi0
	 RaVka9T/mH/vBcvcyxB7paUuPU65LnS1owCGisFGBapIoxiT7/YzJRzwWdB4z5oJc8xkP
	 3yO6yxR2oWMT3lsJ956VsfSChZP7w2t1hKxvTe6UOpUHZ4EP+fiu7mlG4TXcjfT/LKHtC
	 7srePoEwlK/Xdo5tcluQ/SXKYriMlV6aXe9afbQPznCFLgceWh3xqwKXcH92UhcK7qPXV
	 E6f+lXArqVKjTpX8tnEVDex0PyJZgR3PvKGWdBMzkGQ7O5BgR+WrCg5JTkmrdkXl4fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
	b=zvc74dbIK688XIqxRmmjGJpmivJZheKTRfeE7RfHKBMj4blxe94FfaekFzieOIpf8eJc
	 5EmjzYqpW3ErEhwKkDMs+w+axfzCCWoVppKEEWpvHeAtI2Bvgm6/jdKHpL+DNwj/zT/pe
	 gHTGP/ysd+m7sVQ9uci0Me5N6Zz5NOYiOgRwHjC7CG5sKry4Re+lirMf8ry+cwqMQqoZv
	 ICDk+Qqtzk0QdNT1ztsXm1EMe72Zfmu0cHn+x1J2EgCjGxTI78sgUw9X5tqlTWM2UQSQH
	 mv49KlA6jVSHOfDlGrGIR0vXHYgCxHvfsyjzMB3aIL3+2p1eySp27PA3gBFDvTJa9Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iqlZybVj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A499A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iqlZybVj
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5337c7b9937so279791cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792971286; cv=none;
        d=google.com; s=arc-20260327;
        b=Cq4huJpsT9JQJUh9+C0PtutFNAqnpbdO/niEBUfF8tpm1BHzQIlaIrk8BMO3LKsMcM
         9kOiPg/EcJAy0vMtxNSV+suTARq/fGA913IEuSPAGhbK5noVVK3dGJPv3p/hPqTRNVGd
         8HbMY6Omk4iVUoco8Ybe66gsc97TtHdQt2qJd/6joVy54zuAyEpRJTMSEjJQj36Oe+f3
         IdcEmwze54VrwcaIFpE9pDS+P2jHBsxCQJkT/a19bk56mCXXoJuOgNZ2JwOmvw3ok9/P
         XWc5BIb6sVkWfxMPSAMKVVGW4bukYIluDQTNslzHeKKbKEFPDeEYQ6p4N9ltutKhJqEq
         MAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        fh=aGwqol3QAjaabpXUet9+o1QTv7FOMIem/umZMh2L3wc=;
        b=NM8bdeC2/aCBPKaHwsF8cTGhkrvPYAd4NzBE8KTN8ZPt/F+3rsHyHAMFKC3qmEenFR
         eRHwA6Mfrf3W8Z7qdc6di+06LbOqiBfWkH6wbHl6SY5OrY6YI373MRvqclZGUYEpScZF
         s5Z95xtpkjc7LlpcBF8FOzDCrYfatYmZETtn8k/uPp5senRLam6NM90ZGDEUTY56vT/R
         ewQ/1K6YIwCwiG078+0SO2c+5GAhLACNWuNNX/lLgT0lwm7QKxMCPNlrD7nzu04Y1dqN
         UGgU6kKa8KcYYnwJmQyKmcIAluMNFtK1nP750ICM+BrBv5A+FZ3vy7bibBryPICHqWGL
         X9JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792971286; x=1793576086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        b=iqlZybVj+2vOlRgWpaIyyVOlo08A2IPhxmJKJh7+YA+8L895uSnHrmRV4nOlwiLHdo
         8KPdjEsCa7evkRgSS6MNKyvQFR8Y3wO0CTyIYdojyb8AN9WjIa0mLwq69gWbZEq/R0NZ
         pntL1n7ZPNri460X2BEnunsg4jz3Rj+CZLmD6cUdXFLHaMP4TS2qNoWYR8JT3jyrDFfJ
         a3BGEtLCUZl3kMDoJajFO1xDzWXAYzAFfwS3QuN82hbgHrFMtV8zZ5fhm2ehdUqn63Og
         Q8w6/AMvash+kG4jPAhdAi7HaB1m+K68WUbj2H6ExSU7p9T+aaWKPJroLtFo/S+ZH2BT
         J7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792971286; x=1793576086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        b=V/muAMp1GlUuSXJ1oOB1/2NP/9Ov5lY94a0OFV1IMzrp17K1XI+cl+5e2JfnFSLqAJ
         gECEJUsqyaPzV4SG+8iI4IxXRdYi9Nu+/luX+hGfXgn23itltajLmkX6SZ4zMV9HurSA
         3Ui7wFEnctn6bAda3xeJOChl7lWI3Xu7CQq+MjoqjxuYGUCyAAQVi5wBFkZ5GVM4eOPe
         dTYOHBnWjtGu6fkkXj6cvZDgexGaPbY4sD/0IT+rSlZ95dXSkCOr8shrJV2JoBjk9WIt
         uZwQhJnhdLZPOM6V3a6Nl2uZsifg6GH114snohyNrFyvbnXKmGO9F63VxNXXrChTJEuQ
         ZmjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL1gcw6gariktDNZU0IRwTqGeV3bMNGgABJKWmucgJZEQnv9EhXuemntKpHO+nwqR2seD59H5J6kg8PYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL6eNWJn+ByVvYeZaOEu261vx7lu58+GGJPmdOY2EhLBETOUVN
	qeWxGJA4ZyDCRvuvXar3TYnIc7MjJtYmCNR8oziqR+eAYtvit2jEM1W/l+wx5zHvVQ90FofLuoC
	yJ3hEY8ckdmGYNO5Gt53LXP1qmbvFQfcDlxeEnI8g
X-Gm-Gg: AYBFou0ByKayMNARp5oKjhn7PfCWlACNrd6oboqMo5Ho3UR4rprTKmt+rcmrq/qtqT7
	yTFNRFC3PIex5QHx63OSyWI5qc+FVGGMU80OL85eDpcpyUWeyuP9TqC220eFYQIRdqhkKV0vFNI
	0gBmaHtjf4bhRrF93FL07KUJ4WwJ7QEWalmqYV1/xzdrpJUkyV/qrpfJ1r/LRqjZFgaz1zGibcg
	5ulagcQgg0xDUCG0h65C1y0Zjb5t0Svf6p1cX/atTRF/h9yb6LxfJ01c+k4oqbXYHtFhmqUtzQp
	0fcAExpRWZCxYvTp0S3qNCUlzQnyFLd4NZOLk1IIDETetEO1TQe77C8FRd1KJ/d6chUhvU0pR0t
	BbRiZ+TDWsTLf7hUcyrs9Dx2iX4o8A50iNA==
X-Received: by 2002:a05:622a:5806:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-5383b53f3afmr23124761cf.7.1792971285094; Sun, 25 Oct 2026
 16:34:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com> <20261016180521.GJ14213@ziepe.ca>
In-Reply-To: <20261016180521.GJ14213@ziepe.ca>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 25 Oct 2026 16:34:34 -0700
X-Gm-Features: AclHuK9W-YhajRJtMqxwo_KiR_knxSPaf7RrqxDVchqoNSjrX0LK8PI-lTwz6Ks
Message-ID: <CAE2F3rD3WPfJYBu-HPwppwjzdXB1v5gRwu6Dy7rCrgBAs1JBnQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:05=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
> On Sun, Oct 04, 2026 at 07:50:27PM +0000, Daniel Mentz wrote:
> > The SMMU specification defines several types of SMMU-originated memory
> > accesses, including Stage 1 and Stage 2 translation table walks, stream
> > table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
> > fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).
> >
> > While the memory attributes used for Stage 1 and Stage 2 translation
> > table walks are configured in io-pgtable-arm based on whether the SMMU
> > is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables=
,
> > CD tables, and queues are currently hardcoded to Inner Shareable,
> > Write-Back.
> >
> > On non-coherent systems, however, memory for stream tables, CD tables,
> > and queues is allocated via dma_alloc_coherent() /
> > dmam_alloc_coherent(), which provides CPU mappings with Normal
> > Non-Cacheable attributes. Having a non-coherent SMMU access these
> > buffers with Inner Shareable, Write-Back attributes results in
> > mismatched memory attributes between the CPU and the SMMU.
> >
> > Configure the memory attributes for tables and queues in
> > arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
> > ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
> > table walks:
> >
> > - In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
> >   SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs=
.
> >   This applies to stream table accesses as well as queue accesses (CMDQ
> >   fetch, EVENTQ write, PRIQ write).
> > - In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
> >   non-coherent SMMUs, while retaining Inner Shareable, Write-Back
> >   Read-Allocate for coherent SMMUs. This applies to CD table accesses.
> >
> > Assisted-by: LLM
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Daniel Mentz <danielmentz@google.com>
> > ---
> > Changes in v2:
> > - Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' i=
n
> >   arm_smmu_device_reset() (Nicolin, Will)
> > - Collect Reviewed-by from Nicolin
> > - Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.353224=
7-1-danielmentz@google.com/
> >
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
> >  1 file changed, 27 insertions(+), 10 deletions(-)
>
> I think this looks OK
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Did you check the spec that this is every access? I remember there is
> a table outlining every access and where the memory attribute lives?

Hi Jason,

Thanks for the review!

I checked section 13.8 ("Attributes for SMMU-originated accesses") in
the SMMUv3 spec (ARM IHI 0070), and all other accesses are already
covered:

- STE fetches (SMMU_CR1.TABLE_*) and Queue accesses
  (SMMU_CR1.QUEUE_*): updated by this patch.
- CD fetches (STE.{S1CIR, S1COR, S1CSH}): updated by this patch.
- Stage 1 and Stage 2 translation table walks (CD.{IR0, OR0, SH0} and
  STE.{S2IR0, S2OR0, S2SH0}): already handled by io-pgtable-arm
- VMS fetches: governed by SMMU_CR1.TABLE_* (and not used by the
  driver).
- Event queue, PRI queue, and GERROR MSIs (*_IRQ_CFG2):
  arm_smmu_write_msi_msg() already programs these to
  Device-nGnRE since they target an interrupt controller.
- CMD_SYNC MSIs (CMD_SYNC.{MSIAttr, MSH}): the driver only uses
  CMD_SYNC MSIs (CS_IRQ) when ARM_SMMU_OPT_MSIPOLL is set, and
  arm_smmu_device_hw_probe() only enables ARM_SMMU_OPT_MSIPOLL when
  coherent is true. When non-coherent, CS_SEV (or CS_NONE) is used and
  MSIAttr/MSH are ignored.

Daniel
