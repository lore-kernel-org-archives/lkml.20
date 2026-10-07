Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922FE4119F4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386065; cv=pass; b=Tg9XDvClAyi9QWn8a2FKyVmafP1KK3uMwSMiNgACx4A+dPQjkbbXBSJPA+XEJU7d+8lT6ojZAAdV0d+/yMOZvabuJMkDP1PdGVjtYGGIi7lGJgCDERVubUdg0LxiDQyB+PBdk+RiGmx0eKsQ6xZjQug/wYwYvu57NJW2S3f2F3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386065; c=relaxed/simple;
	bh=ACSYctTuKq0edv1YTfqzWElZtHfVIISbGm+LO+Emokc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI89KydIHCKYbztIp88XHqIgzGBFBRQf3poCxcSQUJJd+rhz2NS1dUchwq7CDr2z3SONmeTPsIGPWlb8ntzp67BwI4UZeFjbV9379UUOJqyhOtBd2LfG2cQs+Yjo0bTgzHZnjlxxqUT0aEhS7w9oRhZ9QVgGwVgQhCTEbSBBePY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XV9JI6F1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaGS3rKG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XV9JI6F1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaGS3rKG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVKK3250300
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=; b=XV
	9JI6F1aO7kD2JUhvL3KHAXP4DYBoiUBuHa/z27oUbz547pz2h7vCMFuZBi/a8aI3
	QkB/k9Of4H/KihDr3p3kDhNxnvVRB3FGfDDdXcy4oGG7m68MoNNjJEkyno2+k8AQ
	E1VGxspJyKAmuYJvn9ULFXWlFfpuT0ILQwL62OIgYSGYGpJxOkMWw3lGYik/M642
	6xFobhZsR+6MZGxvNz5ExyIR22mg0N0cnSVItzD7LlxX/QGPHeS8NfalxpIovXLy
	Z+yr0wpXs4rOQZmB25gS3QGAVJkUo9Vt9b1NHkhmnJS1WNn2w7/EW0CZkBIeNfqy
	obFi5OxyWtOuC3z2tRUQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge11md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:14:20 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-820ce3bb94bso4992469a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386059; cv=none;
        d=google.com; s=arc-20260327;
        b=REViFaAnJ2ySrU09edYkCsUDjDu4GHqB43CSosC/baLSGMflNE0W/mUy/p1akKo5fb
         nhffbJ5mvdUCEfYRoDYCd5Aq161VkLqGpO64tihtu07SMACjptW3UOJuBZUEKc0ULjaf
         LRvaerjbteKIhzv8ATs2rDp3cZsQO+s//us8sSDGk4uizfViHryrECYB+f6zV1LcHUlV
         L9Q7WX8VD7cup8WUDTYO3ltgJ0dMRkSpzY32H776pqEfnHofAnH0xZc7CluD+0REIJVP
         BvLYU89u8LxT6Zzi475eK4RdXFlvWiTkKJ7iG/liiVq3fcZeTdT2VphNnnK2TZgIv17R
         w1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        fh=EmhH+55qL0anQfFurIUmZYVXGRETcoiC6tmSDD9Q6Ds=;
        b=Mnbsy8vaNZbU5V/zW0K8gk57zPvIaVsY5Ge9GKdlc9fRzpgnJx1aEkxhDOBXFlWyFu
         CoY8UrsA3wVy5bn5pgyxejYh2E45bZJfjorHFINaaAYcKzir3JynIHLgBS48ffC6d6Vi
         UHC7cx/QduTZNxqCOCrpDbU9/78rfuMMa+ue0BaBoFAx9Uw6Yk4UF/A1teeJ1+xU8mnx
         +/cz4XgmCU1CA32EfK8wWuY8mNbEsJmxxey3lAroPWdohaoKWYOfN2Yry1huCJRCEpwg
         Our/AavFtIJ2VQ3MhMaGvtQ4YDiCNa4ejHD1AsK0dMFRNVZ17qnxYgCv0MC0gqlygd5i
         lKZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386059; x=1791990859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=DaGS3rKGJ1uJeKfodrubT818ojwNIg0lPKzP7XfSqPgUslHdZQnNdA51T8e7+gPpW7
         6X8LUIGCNYkbEP9GgRq4KFNHU3xgK9jyRXL3TKv330BtJZellvpcfX12foU0wcTNZ7tu
         Ai6BbBNnXP1wRE6oypZLEvoEsjFavM7ZPH4F0M+SuTtSq+lMMkoAAvwp+T2DihGZMLe1
         XlbTj/7SwyGEyhywszo0E05yka176t0upJY5ns89BZFAEFiupT0cU2teGo5qxt0Nyp4g
         FsIW4tNfwi0ravGxceRdoOqPhUyy9ty/USEimivZMqJkBfQTZjTdIR+CR9pxvlxq8+zo
         4LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386059; x=1791990859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=tnsI7xIenvPIgJ4KZX7XCWsZbG8Un4JDRMjj6+cxRcxTceeTjyb9OD3cwcpdxms4Zc
         f+T7AW4OtgsZMRTcGt/ucZJQW0TTgDiu+E/nicXYd0RlkQ2aTi2ywF8idhE4PZ08FuxH
         bBjQrPEor60Gjvn683eCaodGq7E1e/5L/42UZKiqZ0ZArkfbfX1QjgH/9ACjGk41Qltq
         kY2KzVsByKsuboaJwlDU18zRiuJMgmMvgmo8T4aUMASJdr0K53uaipcKt68HUHbC+bKk
         pocVwcbktWBb0acOFtxrUqHQ2AoVHUpi5k86s/yXp1EI/xuMBa744TgmqPvhfijSRcql
         S3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxEtztE68JhIFFBKXhcCUmYjeUVpdfJvDPtNsB0ng+/jyjF4XNXqjkw2octyXhxrfqxWkcZ6r59AYjA3uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lbGlagm9ovClKh0PCR5HvIazSURGF1WeSZejkkoL+kC6Cfq5LS
	5P8bRD4aJl6F7WhXVKZq7H4Reu0mTg/sSXKlTdY14nMkFiJRe2mtjETr53Bm7AAGSnlQSfEYeaM
	QUwc7zFGPAUgWcImLiiU1dB7sJriGAs8KRtrPBjAseAeTxpgmGRSdPJ+IuVI1bpYjQ2+EPDklMR
	nNfQC8bwPfgXT6PYG7e865H2A/K6oGkBCN8B1GWoRbLQ==
X-Gm-Gg: AYBFou3r0hSa4Xp56P3T0XWGk0wmoE2O84eRsGktoxebq+Mvlf476gwhzCe8sbBtN4D
	qZ7FoqD/W9EhxViCde3ZVV2wzIv0tC8OzcOeNaonAz3NOImi82bweXxE2oVIvqZwBg+J2T7G0SK
	X7gEgAN6WmLAlCmMKjYK4u4vl6G73z1tdXFLknr3l2ltBTlDx77T6OneK1
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id 006d021491bc7-6e7a729155dmr2528850eaf.46.1791386059563;
        Wed, 07 Oct 2026 08:14:19 -0700 (PDT)
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id
 006d021491bc7-6e7a729155dmr2528820eaf.46.1791386059053; Wed, 07 Oct 2026
 08:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-5-robin.clark@oss.qualcomm.com> <20261006132545.8BFD51F000FF@smtp.kernel.org>
 <20261007052330.39998-1-kmehltretter@gmail.com>
In-Reply-To: <20261007052330.39998-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:14:07 -0700
X-Gm-Features: AclHuK8EBLwtBO-Vlh8FHgDrHt105FPpsXtmu7CifdypQkUFfIWf2MiobeJA2n4
Message-ID: <CACSVV01gRju3CkSR093Y0-2qL2ghmi=GZXZW0fBZjxjue_e6qg@mail.gmail.com>
Subject: Re: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX9P37uLN70x2O
 IenjpTpN6Yxbzt036k3K2h2+8AMLcwwNX1GYmvjdKpUpVZPqA20o2piByKXAha0a7D4Hn48oVE3
 nUwi4z6GmN/XaIzHfcsMV99/6J6sQjE=
X-Proofpoint-GUID: FSlMuCpZY1Mk7sBAuXZAsLx_0aFKbzEq
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac661cc cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=2Fj81AndoEX41f5wj6YA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: FSlMuCpZY1Mk7sBAuXZAsLx_0aFKbzEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX6X3xm/bPUcqA
 RpKbUpe1RKmWrFXwupR8xCKOfRdQB6c7dsHyq83Nasxnzn3DHDOT1Me91eo4lrIM8ocG6XYhplc
 dc61sQpOpcW5JWqZa/7U9KUc6hfv5rYU9/SwekRGpjW+9v6M+4fFl1DA5UMbQvk+iiwhtm7mT8j
 4ShNHLc4OPxv1raCUCE6wXjt9lEt73quY0GMMWZ7+PENTEyN42l4BsvO4MIcFj5MStfRXyKNDdR
 4gnvCYrbaoWRG3xmrXHJ27JIKs05VoNSqPDtw3E8yJRbmKsISuiA9Sd1kTjUODnfDRa1fFvC5fT
 so9DPWstbeDtYbKlYxIrZlb9ab41QoXAoqYeGGPXBywDSaZ25HWVP+T3OHonyzdE6Z/rzZ60bt/
 bDmTPDKR/vwAMf8wu/l81aN49+AOZw6EFJauaGOpEU1XfxZ2Z9rs6kKXnTeelsVNZUra8G4ehIs
 XEGeByuUBH6X1otXoYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:23=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > By passing NULL for iotlb_gather, does this bypass the IOMMU driver's T=
LB
> > gathering and flushing mechanism?
>
> Yes. On arm64 QEMU/SMMUv3, unmap_pages(..., NULL) returned 4096 after
> device DMA populated the IOTLB, but the next DMA still reached the old
> page. It faulted after an explicit IOTLB flush.
>
> Using iommu_unmap() invalidated the translation:
>
>         return iommu_unmap(domain, iova, pgsize * pgcount);
>
> > It appears this replaces iommu_map_sgtable() with a call to __do_map(),
> > but there is no declaration or definition of __do_map() available.
> >
> > [...]
> >
> > Similar to the mapping path, is __do_unmap() actually defined?
>
> Patch 3 defines both helpers. msm_iommu.o builds with all five patches.

Sashiko is kinda funny sometimes :-)

BR,
-R
