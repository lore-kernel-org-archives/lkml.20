Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358942;
	b=wZwp3BqTO3tEbRkHMz5s0Q5xpFLCrATWRN/r5wUhujx/FiM7k7gyahZFa51AiCooasWD
	 6ZV3KdZMZycCsvIPOstcYMJEFx77BupqJVPiwyuW1ByKYiW6V1anN5rpzCMdo0N2M6PHX
	 9MkhErgVQzKX6Q6gfJmGkO/Ske/OMJk77cq/8Ao6cDMjXth4ekGlVnAVDDEBYlGCeyG+c
	 Sh3/0ESJmjZRf3UlCbAo+QUEPVUFJhnbXYpzfNdDR88MTKnaCeMVA3jkHc5tZMYvud7U4
	 6kWJ0+yx2gx9uLvFmLMcDKjn60k5wF8/KgEx0aMZcaMLlH031F1VN5wRJMlaCV1O/Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pEI1DAwF3qERQ460nxeTIehetKY+Po8snZJ24ugK+74=;
	b=e1CQbLH6hRcE/pv3qxl36QHV/JH4PEv1SzYXDoVshEhr2FeJ4hJRFIc+rNpi8DmiQ+f9
	 2l+/CJBZiawct5el8JBatrR7h6HbCX3BheNnT87TB+6IVWXcKLPVt7M0R2KxLUeid8ngM
	 2JQHU7t9AeV9FSk9WMcUZf2vjjVFrCOONmEGuplde/x2FdUD8jbDbtOwMPRvcAhaDZ674
	 4oUUp9azG3r7y20y9dxvJTJw+OrURsqMA7bTGuIrzpPCeodnsXrdFE5q5SB0hiy/kO8R5
	 qhlX7W/g9fLaDZ8ZrQsBUsJkwGJ4SY7ykoxUin3oTwR4AxmalxvTec1aqHh3DVIQiVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FK9e3th2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSuDuuj9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C415606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C415606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FK9e3th2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSuDuuj9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FTWF1663393
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEI1DAwF3qERQ460nxeTIehetKY+Po8snZJ24ugK+74=; b=FK9e3th2cphJBcYI
	efuZCh8LkaH7+cuHiHZXumNFSSDyFFUCqmMsbM5bdpv2TxlGmn8nmuj2sAJ0Bzmo
	E3anLE8Nct+GtKg05G+wziT3gy1Jh+7w9HxLJAs6MKDpv0VtfGIbt3BSKo4a6824
	4ETnvAMOt0IVMm2/047L9g8hMSWXu61iW5weLEN0sMBsZUpjKhyQ/qjMsyz6Eyqt
	OOfnp/OTgW+0E79W5MGutswuLqQCrD9dnvaFlWzuZAId1uM8vTHc4sF0PTkLbt3u
	3mDDZlWHR77owFZQIkNOWbc7bwLGDi+DU/brsXCLOQEmJ+6HMNgJrlGNQL2ixuCF
	NRpYlQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p2r7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so125205137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358939; cv=none;
        d=google.com; s=arc-20260327;
        b=pI7l1/kLrbbuXpt/gf3x9QTQPFev3EYtsqv14s5o3q9kruc0ZrtpclvFL2g5tnL6Nk
         uVkgjRlKeV/2jZlL1TybxQYjyfzPHUn0A8Z9MAyc0XVYLlVP1Wg/Lovy9T/b+3Jd8MwL
         B1k/dqytY9tcqRxnc4pkz2rWbENH2rfy0ewR+n/HM4zitrA0Tvp5H72csUYDPdFfYsPV
         vzVhUaRCxrvRBTBlxt8SXOlTAD7M20KOcWLUrcWdBIwQLbbraz3wI4NL7vwsSrQ8tsrr
         A39CEPoQ32fWmTbFCbsL5C8yhDuQtnblZOE4Tmbprwlesq2SbNCdu1yPvGv/7P8sYM2o
         TnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pEI1DAwF3qERQ460nxeTIehetKY+Po8snZJ24ugK+74=;
        fh=WbvhRTtWXl5Dl2d4N9w5zBzyqI0RKLKXweyrtx6+w1U=;
        b=KkmLpaQL6n0kFBylzla+1cGlghHoU09NBWnfkRWBgTjMmI3NEA4i9f6XHfMdmUA6Cr
         zhvwCrpbIE1XvYJeHqc8s3Fe32O70VsyPyUkpR+8Aw0Sro6nb2q3ySaeSatdsQI6RfFw
         D8LhlEDBiLUjTh8NUOZmJ+Yt60eKRilSC/h5m6M6bWvtk7UPvY2GxjrOxEkPhNH+TOGc
         IKIMnrScMPw9OIB6o1IdODxt0qJByn6mW/NxWfJJvnwMVzbLPttTMvKHlznuKWQOc41M
         vwgVH5VgPQaja2XaNHuAlI2L3QmEi+7WvZdanN3Mfz6AY1rfdABnxmYc/67m33NwWLuJ
         cKjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358939; x=1793963739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEI1DAwF3qERQ460nxeTIehetKY+Po8snZJ24ugK+74=;
        b=WSuDuuj9lJSx660xvAOMUJRzs/6bHvs5Xdwx2nADTk6TqQcO3Jc2qxN/muSJgHEvmR
         g0pEKnuhVaQV5XAayDJ5z5i4Ghu3qnJicpKe8D5XBFXHtlOP+rhjFvyxlu/PLoy7IWDE
         i8ga7pgu3LNG9c4Voxzur5TsQQ0YplDBGDgX4g7hNynmnYbHyPbILkmzOF+t3t6eaQ6e
         Ns6je+44UGjI/oANCUkZBsY0sG3ckLAE6dKJ2m4J6SC6OBZFKoNrAbUSI74hnrpQuaZP
         C34hFDZ07yFXWieX1IFrjy0z6friAZSn9zzNOgCtK3MttQjdsQMCJbccoG4WegujRgjC
         jMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358939; x=1793963739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEI1DAwF3qERQ460nxeTIehetKY+Po8snZJ24ugK+74=;
        b=xVlCx7jesvmFw4SU9Z8xHk26XJQ/cRfkysTI0UI5Dls2R6XLQTKlh9dllWrYfltP19
         brHMIk1KGngAYgwDcNsvxasD4jMjhe4COBn4bjam35JhEFEqOisYjsynjbJChSMtaPZD
         XZEN4pcc8oo/zIIQwbeK9Udo4rXJJRbAq7twOIoLetY7pf7i5EA0hzX4RiIU5lJptN1n
         uoeveoy5JduoUVRDYMqkaByHkvzFJe0npbjzY/XvF8oftn5WIp25vVOP8onPaHfX10Bm
         GkBPHCS5bXW571W06ZNPVE81Rglexoza/5Q9qrH6WlsBTfc02wvDmDegstQ7Z8gmesBw
         5q7A==
X-Forwarded-Encrypted: i=1; AKwUvBwnzszOUk/JCaqoLN85CecawVsLV6CPZdKaihQdXHQd5992J/BhFbK+isI0o6cTRtwwMEL/QnRpz6cM3Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJHOSfBuOlp3f9b6qeJfsoVRxzlD5RzpWE95e+Bl93SrE3+ZXg
	b/EcTgwrFplMF8aoeW3auMpdJsza+r9pJ0jrNUp3AvBUK5ioSfFDr7W2aEsSCMiQLehZgcOOxAk
	90qVUZqo/s6CfgluTBcbsX+SkDOUwXmCySGsw4UsIDNwh5gfNCuflkRBR0moh3KMz0t42baqfg6
	JUsfIuFh3s3K+/6Xlj/y/+A1QPyEoKCOOieNsbydGcmw==
X-Gm-Gg: AYBFou3wuyrDTLWVaqUYs0igb3nQiW9h3xxhxwHj2biLik4zI8YB1TzTXzbrCOt3Xhe
	PSZtmTPMJx9YuLLn0RajHLRsJzn1wVKxp+ZxpTydqK/Z+dh9BfOFJeado0bw3l/N2Bx5mvLDU6A
	G0k2vPnQpdojAy3VQ36Mr4VZdhU/s+8gXu//KAtPFVogXq+ADXYbbuJokiGw==
X-Received: by 2002:a05:6102:3fa1:b0:7b5:4700:3a58 with SMTP id ada2fe7eead31-7d072658d05mr823543137.31.1793358939453;
        Fri, 30 Oct 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:7b5:4700:3a58 with SMTP id
 ada2fe7eead31-7d072658d05mr823528137.31.1793358938946; Fri, 30 Oct 2026
 04:15:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <CAKekbet7B=EvD+3Q9PFJAOJZvpz_hCn_dU__e+3=qhsFet=FVQ@mail.gmail.com>
 <CAPx+jO_HUTrMnzNw-Ev0FWfJdgUQ1nU16knY=qC6oCTQh-=Yfw@mail.gmail.com> <CAKekbes0y4uXUsnF3r40ZMj9_bN4q34ci8LNQhaJCDsFQmo8YA@mail.gmail.com>
In-Reply-To: <CAKekbes0y4uXUsnF3r40ZMj9_bN4q34ci8LNQhaJCDsFQmo8YA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:15:26 +0100
X-Gm-Features: AclHuK9eu7OAWbQYCNIi-bIV-iy89JUshpmDN-s_EFR5uqMBG_3j37KWwfhmof0
Message-ID: <CAPx+jO9sM4AtP7Es5_EDHVden9Z7rEuN+wOy2=ZWaoxH0AZG2g@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] mmc: core: Keep the card powered across suspend
 when firmware needs it live
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0NCBTYWx0ZWRfXxycAb7rhgzZc
 571/W9mCCZpJmJbZzWUCMnOCxgYS3Yd83+8BtWl/HFs4qxitVuSRJvaRefxro9sxurhc0t/PAL9
 gdzRQYpJU2XAZjP3NpnrBTSCulE7RpJIY7doN0ibJYR/7R2BGFtD2wtY4rq+DMKOfKUP1zNOxy8
 KcWeOWfJ47ZILJNWLo7nlfNHMxt0z7GAgxU+02IifEkZiMKHvXbC7zwjdXM+qfXVR8C4/NghcWE
 F2YlXuYQ0f/zW/HNdZYCYPclQJBGnGaoEi1OL8gzEvl3x8Gf2uRgpBX4ZkbSMxUD1vI8fYOsXUs
 zOO6LQx+MvRKIfD42u/6itjEWfA+FECN34BcOo04vnSLo90xXDEXJRsLOWpJOPkGYvEN6NB+TDk
 UQPAAwsPlGEc/B0E12/AdZ0m7J6xkslua7RaTVBsYnNuPwT2I6XLauukNSqztrLCIxUoLsNeicr
 MvbOUUuG2O5TvwqvLpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0NCBTYWx0ZWRfX6vZTBb3atQmk
 OyPIidOZhcTtbsj390MY7Abh33sKQDuK30wXoPSvdeVAMNDLpo91GZghdsmNTyjWoAcmt0xjxfG
 /Qx6jqueERL5N3JIQqLFualsAswr4mo=
X-Proofpoint-ORIG-GUID: MtcIYaCelCr5vk-ekDFm9fiIRvlzwE9o
X-Proofpoint-GUID: MtcIYaCelCr5vk-ekDFm9fiIRvlzwE9o
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae47c5c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=BsvTkdZz1TzsLWSvFMkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300044

On Thu, Oct 29, 2026 at 8:14=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> On Wed, Oct 28, 2026 at 5:35=E2=80=AFAM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > On Tue, Oct 27, 2026 at 8:53=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom=
.com> wrote:
> > >
> > > On Tue, Oct 27, 2026 at 10:41=E2=80=AFAM Ulf Hansson
> > > <ulf.hansson@oss.qualcomm.com> wrote:
> > > >
> > > > Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware a=
ccesses the
> > > > card directly during resume from Suspend-to-DRAM, before the kernel=
's own
> > > > resume path runs, in order to load boot code using hard wired logic=
 that is not
> > > > field updatable. The card needs to stay powered and responsive for =
that access
> > > > to succeed, and since it is never power-cycled, it also needs to be=
 reset
> > > > before the kernel reuses it after resume.
> > > >
> > > > Changes in v10:
> > > >         - To help out with the implementation I offered my help to =
try to move
> > > >         this forward.
> > > >         - The DT patches are good to go so I included them from the=
 previous
> > > >         versions.
> > > >         - Patch 3 to 6 are new, but based on the work done by Kamal=
 Dasu.
> > > >         - This is completely untested from my side, please help to =
test it.
> > > >
> > > > Kind regards
> > > > Ulf Hansson
> > > >
> > > >
> > > > Kamal Dasu (2):
> > > >   dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
> > > >   dt-bindings: mmc: Add reset-card-at-resume property
> > > >
> > > > Ulf Hansson (4):
> > > >   mmc: core: Add option to keep an eMMC powered on at system suspen=
d
> > > >   mmc: core: Split sdio_set_host_pm_flags()
> > > >   mmc: core: Move reset functions for eMMC
> > > >   mmc: core: Add support for resetting an eMMC at system resume
> > > >
> > > >  .../bindings/mmc/mmc-controller-common.yaml   | 10 +-
> > > >  drivers/mmc/core/core.c                       |  9 ++
> > > >  drivers/mmc/core/core.h                       |  1 +
> > > >  drivers/mmc/core/host.c                       | 10 ++
> > > >  drivers/mmc/core/mmc.c                        | 95 ++++++++++++---=
----
> > > >  drivers/mmc/core/sdio_io.c                    |  7 +-
> > > >  include/linux/mmc/host.h                      |  1 +
> > > >  7 files changed, 92 insertions(+), 41 deletions(-)
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > Hi Ulf,
> > >
> > > Test results for this series on a Broadcom STB board with the Kioxia
> > > 016G01 eMMC,
> > > which reproduces the problem during S3 suspend/resume with two DT var=
iables:
> > >
> > >   keep-power-in-suspend  reset-card-at-resume  Result
> > >                             no                     no
> > >   enters suspend, board resets
> > >
> > >       at resume
> > >                             yes                    no
> > >   enters suspend, board resets
> > >
> > >        at resume
> > >                             no                     yes
> > >   suspend aborts, -EINVAL
> > >                             yes                    yes
> > >   s3 suspend/resume works
> > >
> > > Changes applied to Kernel: v7.3 + 7.4 merge window (linus/master
> > > d135ab453a74) with this
> > > series, plus the one-line fix I'm sending in reply to patch 6/6
> > > (details in my reply to that patch):
> > > mmc_resume() calls _mmc_hw_reset() without claiming the host, which
> > > triggers WARN_ON(!host->claimed) for every command sent during the
> > > reset. Claiming the host around the reset removes the warnings..
> > >
> > > The -EINVAL in the third row comes from mmc_host_class_prepare(), sin=
ce
> > > MMC_PM_KEEP_POWER is not in pm_caps without keep-power-in-suspend.
> >
> > Yes, that was actually intentional as we can't allow the system to
> > suspend in this configuration, as we may not wake up correctly, right?
> >
> > Although, perhaps we should also log a warning earlier during the
> > probe of the host, when we are parsing the DT properties for it. To
> > upfront say something isn't correct.
> >
> > >
> > > In the working case I also checked the md5sum of the first 5 MiB of
> > > /dev/mmcblk1 before and after suspend, and it is unchanged.
> > >
> > > With the fix applied:
> > > Tested-by: Kamal Dasu <kamal.dasu@broadcom.com>
> >
> > Thanks and thanks for the fix on top!
> >
>
> Hi Uffe,
>
> While testing I noticed an error message printed on every resume when
> both properties are set:
>
>   mmc1: cache flush error -110
>
> It comes from the _mmc_flush_cache() call at the start of
> _mmc_hw_reset(). That call was added by Adrian in 437db4c6e798 ("mmc:
> mmc: Attempt to flush cache before reset") because a reset may
> invalidate the cache, and it is now also reached from mmc_resume()
> through patch 6. At that point the card has just been accessed by
> firmware, so the flush times out. Resume and data are fine, it is only
> the message.
>
> The cache has already been flushed in _mmc_suspend() before the card is
> kept powered, and the queues are quiesced by then, so the flush at
> resume looks redundant. But I don't want to drop a safeguard without
> knowing whether it was meant to cover this path. Do you think it is
> fine to skip the flush when resetting at system resume?

Yes, the cache flush at resume seems redundant.

>
> I tried that, by moving the flush from _mmc_hw_reset() into the
> ->hw_reset() bus op and calling _mmc_hw_reset() directly from
> mmc_resume(). That removes the message. I tested it on the same board,
> booted from the eMMC.
>
> Would you like this as a patch in the series, or should I leave it as
> it is?

Please make the change as part of the series.

I suggest we extend the preparation patch (patch5), from "mmc: core:
Move reset functions for eMMC" to "mmc: core: Move and split reset
functions for eMMC"

Kind regards
Uffe
