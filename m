Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFA4A3F20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263450; cv=pass; b=F9/06N8aT7yBmX1oGc0iLTNjg9ip7wzTZGY6YFct3B8x7X/N4tSMimNCs1YPDM5GbHMbUDry/7k+XNYdMaK27OJ8h5tIIakF4FAdV7M1HTyucgqGdcHzL2guucUHlKmFMt2TqihVvEOIkee/pl4TR6q6Gtw2hbepdhOlblFhVLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263450; c=relaxed/simple;
	bh=1m8e2wOsqMrgDPaj/O0eKa9TALGEmusZLoP/vnx03i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao2ejVHkh+qBN7vn70BzLEAjofYWAZABZ3BqLmlKADlDNgSbXbzR20zjeHueSMyQcOBtcdqFsa40kYDUBtPEduM+NSpJvYEGHPpC/82V7nc6mbMBy6aUz67rYq/CiXoddTtDNHxGHKqA6FxwgTI1kUXjBlojXfWzuBbnD86+PUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKFiGTAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF+dx1bq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKFiGTAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF+dx1bq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4jGg2285740
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=; b=BK
	FiGTAaK7AiaGU4i0w/nY558Yucoas9ghxuei1filSjCk6bNgn7VSxk2s8K2gH58H
	Fezr0EOweVAJviAX0+Oo6RBjjBi6R/0jnght5FEMDJRgS9jappmj4c1ienF9LAHg
	ofSOb2yngGblENDPZ9o7j9yEaxR7MloOVi5BbEZ+Lw7Xvaf++2RL4coYqyHhqL4L
	KOMcjg5UGz893ArL05LZcEQB+UxlDd6PbnWDcxAXjF9vyxTiyutrIbQc8sAcBASe
	4Jhr40/h/G8dCvkTw8sUe9vOjzMkT9X7I3KZxGiXooob8zZO8cFfXO63QwL9hc5G
	bafdE1KzaSgKLiBOyEzA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ajcn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8048c813cceso3755128a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263447; cv=none;
        d=google.com; s=arc-20260327;
        b=G2wXNKxNu12PjjM8he5f7ETTvLn+B7sVOA+PRLP6KKCZpLgcJcdr/plrm00InmQVc4
         sTQrWkES7+yP/+O/60xT79DtQo2OUWAx+zvDi+32Irn7gw7OYZRv3APC/j67BCFK85Gr
         ZhuZVWvpfJFakv6lGQwN2lNnFQuQ+Rh78vU+wyy7LXU+3ukutCkdYsW4alZfUknno15Y
         +mKDOzm0fjLOK7o/vflnU18Tp9a5cN9yfRi/Tdgio/vluLG/EWltcuvU8eGx0iJzw8Mb
         oPGkQt2Q0eqcflMd43D7qUjYfJa5bAemF6xXjRbD4t6YHIMiOhSmdWtKGncVJAuU6fii
         rsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        fh=FmoPxyCTv4Z/Sx/VPU09lKqRh46NizuAy7HSkBpe59M=;
        b=l+7/6ChMg4aRPlkhzq2w6fhhfzoOFIMVwKrYx7sNnA3HRt342UJ11XTkBlnLcowZ+q
         ALqap2i2Uvu9kY1c2J2jmd1ENBl4TPRs9LjNN1RBc4fxnL49m3UGOl48N/vPkx5aMVvt
         DPCxT+Zvp7NhmK8m8ifHwqin64lWWhNimpmbZkIXXlwwSJUH1NBwvdTsxHgfXmk7gegF
         l6fjUi7MSriPws3PXHDPbM+Sf3xhXPwZQUJkK388QGrCfEqhHCleu0d6+X3wRDDN1xCR
         /Tqe4YLS2/UD/aoC+TCdScHEQE995cTtubhEvbUp7jo4tZQY0EWOBLTrX5yDsYDGY5h9
         4PCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790263447; x=1790868247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=WF+dx1bqnN9ArGrO/OHg9+/NsTkV35+aRnnoORvRCK6B+UEaqOT61E4rqDIlLtXfKu
         YAAoJH4gQ/YEooxe17S2D2Ou4zMmOIg+qbb5YeoEWgJ9lk7c6+1NUq7wJ+YUlCA7yLLY
         TvLFDTfj5kU3fGgz2VP49xOkZBbZzuauyQzEB7FgU+dVO7IrxsDl8QoHdPA84ZXze7t8
         5TDHnRpABlngowmsthTWW6kK87iH7WzW9rjfNw5Zg5cJZ5lLe36XrAgnjq/ugXSV7A19
         ll2FMkRYlJNV+pstNY8tyve1d2YW6BxazRDwN6BAqlexpim2GJO+SpWRHiACgDRG0fq6
         5MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263447; x=1790868247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=JyMnufQukjueuPIoxhFB9w/f4jZhmSUBv3zqe2cOgqnlqU/XduMtEGFP1dBd9sVISY
         MKj3sHivTT6Sk3C1G+CDfjuqSbgYD7Y9fVqKbTjHJplE9xYh9sg85+udS/3u0puCvkDt
         zds2NbiaU5OtgQdMmPMf218/Z2UzNYk4FG0n+cYsaj60jQ+EdBw+0DthLGkRPKKhdZs/
         fad0c4WAHz+Q3rf+HZxxqsAm7iJJwgD7TOq1KKbWUaadx/hN5+ibcvwcg1Y2eDmEeZ+s
         G7cbidoYg4cXsB1zB0supPNv9Jys5OeheMQvv1R+dkLEKytwTTKTFPZQdieBIJkjDMYl
         b/sA==
X-Forwarded-Encrypted: i=1; AKwUvBz99GjvIlcvK1OBTiP0pCwdtg3WfDhmBEmwmt4wToJSkmJJsoXqqf1divHlwm+2Fb8eSkZyb0BISAGU/Ok=@vger.kernel.org
X-Gm-Message-State: AFuF++mP3ZRYWMivXdvDuSRkbzP2R7kF4hlQNd6E9KrAeL6VOTj1wcUw
	XyNlmi/S+rv9ZtGA0djoRiyd7srMNrsSdItxVCTV1VQVKoJGpoLjMWQneCDS6hxf8pmdafwT7UT
	bgOKs3gqPhmY+wLVE6qKhtKr0gQvKTzpEkqjrITY0wxTwjyGC0JoGt/0JHe/oG+pDS/q6jvUoDv
	pKwhTcjf5TCrsNgPdLwt3FM0/Vy3fOpGy8S87KGuoJOA==
X-Gm-Gg: AYBFou2PsqcTY+ylerB255L5r7KBcpcHmFlIYsmsIt0Fj7nA/KERug+JH4zvSOsxNxB
	uxE39Zmesu76/OqUaubzJfegbZBFBh7XtOY+yiNFAvug0aGjizvcs4uhnhMgIYZttUF4e890OzZ
	7ZKVXW3Yoe5oHQzAf+Kc56B7FdPhZgxhAZhhDwW+fiAY+F1+/nt3TdrqoI
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id 586e51a60fabf-491e6ded9a1mr2702862fac.29.1790263446451;
        Thu, 24 Sep 2026 08:24:06 -0700 (PDT)
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id
 586e51a60fabf-491e6ded9a1mr2702840fac.29.1790263445947; Thu, 24 Sep 2026
 08:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260924145419.47354-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:23:53 -0700
X-Gm-Features: AclHuK_WRAYAvS2UWB0hTgewsu2euKPCpECh3qJVYbGPrKE7NCVbxLwrzOLrmGk
Message-ID: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX4g5TUMO7IDPJ
 81prLLUXu4brXYNnuqC8mmowp2bVHcjwJAM63XTzbDf2XjzD6yMA1vDDN2Rk0ZcDGupfagr0uoa
 N0fTnGXZC9RUonBJuRo06sDpLiXwkz8=
X-Proofpoint-ORIG-GUID: cfLtw1V6-2HTbNzNVyWtuC668376ZP8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX4ObIgKGXvgn1
 GkMsbQnW+KS2qgDlncqS+LRTL0FQupDapPghwxMg2+j0iUwW5xKHiXbphG6v3kcscLIxUciWlcA
 zY/lHkI1IhaXKERCXPG8/aH8EAadoXJ7GfwzTeB85CTvwt5Is5Bo5C4h07JyN5GRYq4lMuonPiH
 jNVLDURK2UfWw7e5od2V9qyd3ub1sRlyDh5Xrv10Inwt5c+y+A2+np+Z37Ny/gAXzGdvHxEoNC7
 UO35ovTCnfpPpkDnuSDW1fKRM4+U4ljzzRT16kMS/ym0OsY9e7b9s4mo8IMvDrjXdbVdzQGwK7I
 y8v5ALJv5ncdcIpOEUTWdlAmpZGYn6XnlBnZEdd9y73ZmYFARt8QeLdnN2kLq12Ak2ATk3q/lKs
 0vp9yKh8+UPszSgcD8sJg+wmSTFPYRf/YQmx/cdcmbzLaOASHhQ26hZJFr4GoYPHPdA018/P3WM
 wnous4/bdug2PEOil+g==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab54097 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=ntJSuBRzbTKlmYc5m18A:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: cfLtw1V6-2HTbNzNVyWtuC668376ZP8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240063

On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> Hi Rob,
>
> On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > So the assessment of what is going wrong looks pretty wrong..  VM_BIND
> > should never lead to iommu_map_sgtable() (which is never used for gpu
> > per-process pgtables), for example.. but is used for mapping for
> > scanout.  And pages are never used for mapping in either path.
> >
> > However there are a few places where sg->length is used (in iommu code
> > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > what the actual problem here is, rather than any use of struct page.
>
> Thanks for the correction - you're right, I mis-traced the GPU path.
> The per-process pgtable mapping goes through
> msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> and sg_phys(). With the wrapper zeroing sg->length it iterates the
> entries, maps nothing at all and still returns 0 - which explains
> the UCHE translation faults without any error anywhere, and is a
> nastier failure mode than the async-bind-failure story I wrote in
> the commit log.
>
> With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> paths themselves: msm_iommu_pagetable_map() for the GPU and
> iommu_map_sg() for scanout both consume sg->length, and
> dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> page-stripped sg_table silently maps nothing. On top of that msm
> also uses sg_phys() in those paths and
> drm_prime_sg_to_page_array() for the page array, so even with
> sg->length preserved, page-less entries would map garbage
> physical addresses instead of failing loudly.

oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
I think using sg_dma_len()/sg_dma_address() instead should be fine in
msm.

Otherwise, (other than the fault path) obj->pages is mostly a proxy
for "is backing storage allocated".. we could just use obj->sgt for
that instead.

> So it looks like this needs work on both sides:
>
>  - dma-buf: preserve sg->length in the debug wrapper, so
>    sg->length consumers at least fail loudly instead of silently
>    mapping nothing. I think that is what both Christian's "we
>    should probably change that" and your "zeroing out sg->length
>    is what the actual problem is" are pointing at.
>
>  - msm: stop consuming struct page and sg->length of imported
>    sg_tables, i.e. build the GPU and scanout mappings from the DMA
>    addresses, plus the drm_prime_sg_to_page_array() cleanup.
>
> Is that the right split, and is there a preferred direction for
> the msm side?

On the msm side, I think we should be using
sg_dma_len()/sg_dma_address() for the immediate issue.

Maybe we can just do the same on the iommu side, but not sure what
various sharp edges might exist with other iommu users.  We could also
just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
 It looks like there are a few other drm drivers that use
iommu_map_sgtable() so it might be worth at least trying to fix this
in iommu.  Presumably if there are issues with that approach an iommu
maintainer would speak up.

For the longer term cleanup, I think we should use msm_obj->sgt
instead of msm_obj->pages for "is there backing storage", and allow
msm_obj->pages to be NULL for imported dma_buf's

Given the late stage for v7.3, the immediate thing we should do is
revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
sorted out what to do about the iommu_map_sgtable() path.

BR,
-R

> > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > but that cleanup that I haven't found time for shouldn't be the
> > problem here.)
>
> Agreed on it not being what produced the faults - but it is part
> of the same contract problem, see below.
>
> Also answering Bryan's review of patch 2, which is in a different
> branch of this thread:
>
> On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > Why is the fix Adreno specific ?
> >
> > Shouldn't this function be ammended with
> >
> >  > +    if (filled !=3D npages)
> >
> > instead ?
>
> It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> import path. And putting the fill-count check into
> drm_prime_sg_to_page_array() itself would indeed be the better
> generic version of that guard; I checked the other callers
> (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> partial fill either. But with the corrected analysis above, the
> page array isn't what produced the GPU faults, so neither variant
> is a real fix. I'm not asking for either patch to be merged - the
> series is a bug report with code attached, sent to get exactly
> this discussion going, which is also why it carries the RFC
> prefix.
>
> > This very much looks like an LLM generated patch - the commit log, the
> > large comment in the code and TBH the solution too.
>
> Sorry about that - the patches were drafted with LLM assistance
> and I should have declared that up front. Any later version will
> carry a proper declaration.
>
> Thanks all!
> Jianfeng
