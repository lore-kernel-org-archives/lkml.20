Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7F31355C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356721; cv=pass; b=WXlxE8eLtKzAwMUv5MaHTf2Uc0NemVc9qmTspXYZonZ4mSOnCUdCFhNBxsOgfWQ+KYk2w3PcClV9/t/gwBJ9kYDs284ubgN7lfrVzTqrDk/9G32L7CgaxUMcMn/+9elv4wV+Yony+YSpi7+cQAxDNEwpqn2DBr16pWcCft/yayI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356721; c=relaxed/simple;
	bh=qo0Pvlant2tqAkK0E4yhyM6y0yWPa88IF+SZ5h2MERQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnxG64fHQjB/o9H0PyH8vkeItUB8ZzzfX+wOqRliXwswNm5/eTYeIBrYcX80qky4/7j2jseiRUrfsR/14QjvGYSn4jCv1oflxv3PONBs0Mru05LApXQqyfEcPcZ/4oxoV6L/6Oo7CD4/9sQGoqxu68emSE/XiTRhq+gDQ8HfL7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCiX7juX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV6c4u8t; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCiX7juX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV6c4u8t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG3jRG801300
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=; b=QC
	iX7juXbh2Qhd4o2YIlA2o1bVApnsTTUkzsnv15kJAoUxv8RNuRFEx44kbww0qe7g
	NULoYGNVCFTJDkbi9DSJrvV/W5g9ebMAeZ8zq1ce02qeiGEaRKDaqPZ1nUC5JS1P
	R/Z8VS3VBCj7QOI38+eIEbJVfIpJ0FzwNnZgB7eu+OEHzp/v25pFfwg6lS4seFHh
	dlHWgFD4l7a0B7WOBkfDZX+y3GcpMMRudxC7bcuzNKiuwAttpAlWHSPpRYMKWCjL
	3VX4zSKjYdu4vvOlKp83ue7WK02cgzakMWkWeZzydIcm+X0XtbXM/GDok2eP0YSx
	jCOdpIfBZrSi5r9XciYQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57g9nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47a8fd3b0e3so1398199fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356712; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHN9aSUJhfBA4lEg2AoMHRoYBDnnGF3ZLzEE16jzZL3E/ZmYi8Sh9zlQFHj4j0KLjE
         C2OiCXS6YwUKv6+n/clGI27ixydHiyGq6YkmGR8hOXqfXlh1+uM/Aj4FPf56Q7DndA3v
         pMqPig5QpMHT9ggqydpP3ZJu767dXwtDkCgTU4QPPp1OwPKPUjKHZFrhUUpdHYzHBoE1
         O24PuSIgF4LQd5MV5Gkwir+uwDtGTn0PeQb46Sj+FCS1LKkbvoZY48lylK4ZwRl75rro
         9w0yzoc/AnQnV5KARFhKIqP0TugN8wqOsszzMO30flp4L4hGWViqp098+pu5suL6MlMm
         DliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        fh=ju5SoAUWOtYRDO4QhI61g8N0nyUjTpLthBRcK0sH8ME=;
        b=d/WaItLF+LL2sMEQkeSdXdn5wQfsFtT1/wXIFfQ6O1Bb8wD2On4uGYjLv7GeLGrrK4
         hm4ehbitdDScPevFG/cdh2JQJ8X8oYqV3Wme6WqRKhS1AgUd5fSfbeImGHTVLGsIvLXh
         iDZsyFbNn61XlFA3JyIgqJl86GIYZ1X9NgaAPvFQ30G3vvUolyJz+z8cSNeXkuPDPC39
         5YIPT8v5Ix5yPzlI9ebdfLeQwUwVwDvXtvljy3rPNVA/+rVURW+DHFEtdQu2nbk7KDps
         Ksgfj7n4lTHWDrOAsnQwqazywuPpvh41FWY2WvLCV325CSnYU+n/oAhn9izhdv6+Yvg9
         8ZnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790356712; x=1790961512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=KV6c4u8tQAXxVbwPJMEI9RbxP2iPBqXapHLb+FISGXoM/1zJOPw1VXNZbjQXiLkJvq
         QVej19nnRJVNrv50pGulZcAqVydLEK7mIZZl239Qr6JjYosBtY+vBw/HUvkXncD/upwA
         FEZFfR14WF8rLBpqsDw1QgM9ISqUmBIyC2KG27CHnJfNrHoJZaxtEBHyKsX/rLsZmNlb
         2pDTgwNpq0zE1I2e9B9TvvI7iex51joFkXZJWxQYTvB+R3PeOXD7KbC83Rahf003H0z7
         dypUDIEAzHPHyRKI90MhGNNmg1/A7mDiLT46FyXgYOKpuZ3i+73c7VYc47V1LGtb5i0i
         X57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356712; x=1790961512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=GRzzujXtnqHuR9Yi9hGt+6NpDYEz/VK6pZFgV37UVXlgUewzWrIRGzgrQLgEWZFJHe
         Pei9GmGvqrSEsPtjklygzIjkoUb9RhNHI2X0fu3RoWptrswfa+Mt7kaEokJlGuiORlFU
         NtytN/Bc+YsmC9plAJP55kBo7NXsPq9t73SRYHVzwJ0iaYOCbvrdx0SlNMo1qfhfVg+Z
         YCdGnaLUgk6m3TcM8VmE7hKPVhoFdUGXWGCtZctG6Fmusa++wVorVvx7/tiYDkgnddFx
         DIRj+mdnFLBNxlsl35QVMKTjaX2Q9eLB+tds4/ESCF+XM7YPkOjZx28qeRz2N3zKXpo0
         4t9w==
X-Forwarded-Encrypted: i=1; AKwUvBzGEjXDj3pgRO8fwFfGi0zK08ylgiWkCRnRV4kS9wktHOEWXGhaIogJYn4zv6r+qof08A2eVI15+r2bvBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mtUFXwRW75CxxrAi7bXaMgFEudQ2b4vpUODethKC/UJdEMG/6p
	p8XAEeKPw+g2ScI88X+7Ge7LUZMfMZUQBjiSzYu8qmis1CXG8ejVlyWoWb+6ZEur8K+/TjzHCcu
	V/L/csh2OD58ZAcQPUThElPImvO/IqTo4OuwMGoLpmXC2F3PURBsVpMSph1t9KGt9l0EF+jBA8G
	DHD//1kLxh0vzTkYQqUD5pZB5cKWMiABBZ8aF61O91Hg==
X-Gm-Gg: AYBFou1sR0Ta2Znn5P7s36cOWulFozpM0ISk3dwNEim6RTHFbRPHZ2j14bwDem82Lbi
	GnVpk5uVwAYgu/PiXf7e90nj1yuOdlGQILupumU4ktbv6ZilWkkGPbltUyNEdcFMyS4pZd2dZaC
	U22IW+SiUv6g0g2WD0gMy2hd1Hvsj/zXGXYXil30DcuHq9mUB14LTsh2Hh
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id 586e51a60fabf-491e9fcab5bmr6173604fac.25.1790356712391;
        Fri, 25 Sep 2026 10:18:32 -0700 (PDT)
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id
 586e51a60fabf-491e9fcab5bmr6173571fac.25.1790356711799; Fri, 25 Sep 2026
 10:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com> <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
In-Reply-To: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:18:20 -0700
X-Gm-Features: AclHuK9fSyAIzoBNFWcWUoZ2puEB8-AtVFFp1mUdAjt1DjbWKFPGlOaH2m00xXw
Message-ID: <CACSVV01wPhaVPUtYCwHyQ8M_Egy2O_P6gPhGkoS04S2+FABSrw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfX1Kwf7bw5u4O1
 I0MSH6d5v7bPsupQiqZGp5ZAfD5ZPDGMW08Y0O8fYixL9obHxrJTdsm2BEmh0xIbs9PRdjph3tM
 hp0xcq3sQKQ6ZZUqelZ9YtHWCdo6+3a11NoALUMPbHPKZXTU7dWOJvtiboqTU4i8eCEebXB9CpJ
 ApJr/k9ARRZWFS32/W2348dqLQO5q1X8KctFlTEftWIHHxXeLSV76ZQd+TwklRtAkTJuPJ9vUzQ
 cFL3fRbuMNbixdyQaxP4RiTY7hjhCDM2fFf4cnGmK+qiuHJmrWqk83R9cFGNAL6nXfwIBsxK6sm
 lceDtr5la6gZ5pv+ozgk6ZYE6fV1lWheQvgpqNoDHlWOGUxd5k1wVP8HIeiBMZianUmP5XCjXwz
 S6m+coJhLXULxSFDS0Qt4UYbS8tlPpiMCA5v90TzHTW+GMK8/yS3Wjsf1L05Ry34c2h8v9Jm2IE
 j7Wh8/GdQ7J9HNlbetw==
X-Proofpoint-GUID: 2N_AV8FDSJ_3qRfQ5TZC0YHB9Y2owm8c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfX4weO8D649at1
 WzDkkiq2CpgelmlEOhOV5nGi3J1E6woxdIvmu7m5tRkYJP24jxUNeFpsA9MA3xlh2xW/iMahcn7
 fHWHHyeTWl/LdZvIUFK6fg3u2hyI37I=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6ace9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qnjczsnmBfoytaMDzuAA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: 2N_AV8FDSJ_3qRfQ5TZC0YHB9Y2owm8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250068

On Thu, Sep 24, 2026 at 8:23=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gma=
il.com> wrote:
> >
> > Hi Rob,
> >
> > On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > > So the assessment of what is going wrong looks pretty wrong..  VM_BIN=
D
> > > should never lead to iommu_map_sgtable() (which is never used for gpu
> > > per-process pgtables), for example.. but is used for mapping for
> > > scanout.  And pages are never used for mapping in either path.
> > >
> > > However there are a few places where sg->length is used (in iommu cod=
e
> > > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > > what the actual problem here is, rather than any use of struct page.
> >
> > Thanks for the correction - you're right, I mis-traced the GPU path.
> > The per-process pgtable mapping goes through
> > msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> > and sg_phys(). With the wrapper zeroing sg->length it iterates the
> > entries, maps nothing at all and still returns 0 - which explains
> > the UCHE translation faults without any error anywhere, and is a
> > nastier failure mode than the async-bind-failure story I wrote in
> > the commit log.
> >
> > With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> > paths themselves: msm_iommu_pagetable_map() for the GPU and
> > iommu_map_sg() for scanout both consume sg->length, and
> > dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> > page-stripped sg_table silently maps nothing. On top of that msm
> > also uses sg_phys() in those paths and
> > drm_prime_sg_to_page_array() for the page array, so even with
> > sg->length preserved, page-less entries would map garbage
> > physical addresses instead of failing loudly.
>
> oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
> I think using sg_dma_len()/sg_dma_address() instead should be fine in
> msm.
>
> Otherwise, (other than the fault path) obj->pages is mostly a proxy
> for "is backing storage allocated".. we could just use obj->sgt for
> that instead.
>
> > So it looks like this needs work on both sides:
> >
> >  - dma-buf: preserve sg->length in the debug wrapper, so
> >    sg->length consumers at least fail loudly instead of silently
> >    mapping nothing. I think that is what both Christian's "we
> >    should probably change that" and your "zeroing out sg->length
> >    is what the actual problem is" are pointing at.
> >
> >  - msm: stop consuming struct page and sg->length of imported
> >    sg_tables, i.e. build the GPU and scanout mappings from the DMA
> >    addresses, plus the drm_prime_sg_to_page_array() cleanup.
> >
> > Is that the right split, and is there a preferred direction for
> > the msm side?
>
> On the msm side, I think we should be using
> sg_dma_len()/sg_dma_address() for the immediate issue.

Hmm, so sg_dma_len()/sg_dma_address() are zero for page backed sgt, so
it isn't quite so simple as I imagined.  In theory, it needs
dma_map_sgtable() but not really sure that is going to dtrt with the
way iommu is used on our platform.  And I'm probably not going to have
time to dig into this until after next week.

Please send a revert for commit 143755bdabaa9 ("dma-buf: Make
DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels") for v7.3

BR,
-R

> Maybe we can just do the same on the iommu side, but not sure what
> various sharp edges might exist with other iommu users.  We could also
> just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
>  It looks like there are a few other drm drivers that use
> iommu_map_sgtable() so it might be worth at least trying to fix this
> in iommu.  Presumably if there are issues with that approach an iommu
> maintainer would speak up.
>
> For the longer term cleanup, I think we should use msm_obj->sgt
> instead of msm_obj->pages for "is there backing storage", and allow
> msm_obj->pages to be NULL for imported dma_buf's
>
> Given the late stage for v7.3, the immediate thing we should do is
> revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
> sorted out what to do about the iommu_map_sgtable() path.
>
> BR,
> -R
>
> > > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > > but that cleanup that I haven't found time for shouldn't be the
> > > problem here.)
> >
> > Agreed on it not being what produced the faults - but it is part
> > of the same contract problem, see below.
> >
> > Also answering Bryan's review of patch 2, which is in a different
> > branch of this thread:
> >
> > On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > > Why is the fix Adreno specific ?
> > >
> > > Shouldn't this function be ammended with
> > >
> > >  > +    if (filled !=3D npages)
> > >
> > > instead ?
> >
> > It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> > import path. And putting the fill-count check into
> > drm_prime_sg_to_page_array() itself would indeed be the better
> > generic version of that guard; I checked the other callers
> > (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> > partial fill either. But with the corrected analysis above, the
> > page array isn't what produced the GPU faults, so neither variant
> > is a real fix. I'm not asking for either patch to be merged - the
> > series is a bug report with code attached, sent to get exactly
> > this discussion going, which is also why it carries the RFC
> > prefix.
> >
> > > This very much looks like an LLM generated patch - the commit log, th=
e
> > > large comment in the code and TBH the solution too.
> >
> > Sorry about that - the patches were drafted with LLM assistance
> > and I should have declared that up front. Any later version will
> > carry a proper declaration.
> >
> > Thanks all!
> > Jianfeng
