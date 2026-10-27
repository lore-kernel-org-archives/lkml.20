Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793130204;
	b=f2EszndFNK7WObYk1b1N0IWZ7n+OW0++u8/vyidOGQ5QnWDPC2A7m8lozvVvNRhtfBgk
	 b+o6FdXL/5YCIZBVcMKiQXPX07CHJcbnBKRv8SmgWPNEqtZbpRN+o1GqC3A8Pw448vRFN
	 duEEaWhIDX0fc/fgxIxxhvlirh7f9SUSbPF7+dr/VeikE+HofPBB6XI7VJG9P7YVcynRh
	 EpyLjXYwX5yfEKWFC+8kL1Q+fhuJr+yBbWHe5E5JviH78TPiMINZFEfXatj4eYTVDrwJT
	 4Iy/t5+qwedg2ynJx8+/Q1qJGEPByxY8W7y2UFf6LhI9SE58qEw3uCnkjgiUqpGC7NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tvXXxCxPW97KVCYAIPhnCT9o4Z8at5Y2UFltu84JE/g=;
	b=G3eHJwINyBBg3Y1F9kzmZDF0rNo8SuWG+Y2eIRSfwCesWHHBVN5B/gZbBzdlOfMaN7by
	 rtwFy03h3wGx3aYMMllhSNQyiMezHwOgquudDW/lfLIyUMe+OI28eKLniRx3JL04nk7G3
	 HwpVP6la+abdcWCRcweS4vp9UUaaGXyKVUE4WNIaUR5rOgNWzcJQqWLcG9f3EhpX2Ejfd
	 zeZlDq+S/1W1yDZDS/y7av8E0E4WpZW5aR1unxIxdRcm5ZON+nigxVIZPQcerh6aPuLAy
	 oedDnWPvyKlemug2PrhW5TcM2t0dwx+0/nGKMVslXmeVcEL1rnbB03U24OcKw0Dmuhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qc5o1Yyu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBbnbCnF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF3606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCF3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qc5o1Yyu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBbnbCnF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHdVT2998057
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvXXxCxPW97KVCYAIPhnCT9o4Z8at5Y2UFltu84JE/g=; b=Qc5o1Yyul3hrWQH3
	c6zo6pY8Obyy4qzhyCNpozZ5S1sWqcdup0KfJjSM17/0Gs31Eiy9HyJTT+Thosz1
	EyiIExAnSNoCmJa9FaWXp9W2DtWG4jECSDQdgc0HStVZbROKG84JpwcN5DeqdY8N
	TjSnx9BYc6jHVoO/Q0mEhoVzuY0Y2oVDsgr5H4sZLwShenoak4WK6KfvSG7xmd37
	xt7J+awHPTQh1QZ1sDsJfms4KsR64IY62TGtX2DMy2I1INOtCQzbZtX4nXIeXRU5
	IQ47VVqwhHz/CFDK5Ad3t0N9SIQKyLgsfnEoGiTSI/xVYGi3AI+dtYYlekPpvsel
	8G1Y4g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1je8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:43:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so142808a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793130203; cv=none;
        d=google.com; s=arc-20260327;
        b=Au7+r+vX+Il6pAUAKm3bFz5qS1iAvwZt7yZaYzOo8HkjJQ/hgixYxt5PKf9GVbcak4
         Nhyqpm2evZmEu7OBwXp3RVlFccF9kfeweOcupPP8x9sIhSfpGPu6OZN8gy/FNHwMjprk
         R1vU0CdDRS9W0ZJNYEetsoc5oB3mi2pYp4J2XbOwJiTBh15i8Ao02OxxMB0oSFtLtpXr
         /KZQpG4KjuKVXvlSPSLxzCRHkHWU9bhaEme8u047QmRek9CrO7IzHlR13IYFRTi6gcat
         ckIHA3/EzpcsuvUmrZu3IbZ56lGmm+H/dgAP9RHpR01r8aCfuaajCczuYRb+XK9g3kF1
         fbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tvXXxCxPW97KVCYAIPhnCT9o4Z8at5Y2UFltu84JE/g=;
        fh=h5EtJ69honFebrd45qBdlolKk18crsqYHjjkGH/+YHQ=;
        b=IzYs6NylF8Pq35xkPFe60Ib7K3MYmwzbSwOo9MZQ1UmJ0vMmgogTEVtbgO+yE8S8of
         xQiQwT/1h6OUOXA+m25bnJCQ7IYYSf1Pe+N16OdnotFL61Xf5q0RLHT+3aJFx0y9jpDw
         S1fIcN4XaGT5DNR+4eWOWlok+RcfzgmHfZNH4JCLVPIDjzUsw8zm+bCYRDdspZYPA3h9
         ETWRs3JaxsYS9rzYTECJ5FcqiZNIb1kjaXbuKzPj31CeelfQAFD7bbeDxXaitr6VdE62
         osC6nyIKs5qJTNImLAt99GBDkWgkdRi13tek2x4rRBAhTqgMTTlcV1lR7d2jybQwON2G
         CPMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793130203; x=1793735003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvXXxCxPW97KVCYAIPhnCT9o4Z8at5Y2UFltu84JE/g=;
        b=DBbnbCnFBJyGfTO7VnFs8RbwvztWUCMm5415AJ8yIpuwxNIDmnOCMrkXrsnE98C5VL
         pjV13vVKCAxaKP/NUGgvoTtZ19PmqORtgb64mKY+ZqelRdvCoW9Fj78hFWyaxStx81os
         ouPwNExLyr66EvfzG3Nz7GmEwRr0r4rF+QFR/lpjFPmP1xGmZzkAjAaHHPRb3mayUGhJ
         8ku/2kAg7Z0PQ0FvYcqWvsASWGRU6vOTlULqRD9XWTGAMpR/Td6rxuSKDfo4I/QkqdSQ
         EUSH7ecvg5hvMn+en9Yd9w5FD5DZlE0qx/ZkrdV4lSp0VPS+8krs9j22yMLFaUTj5Qmq
         REfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130203; x=1793735003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvXXxCxPW97KVCYAIPhnCT9o4Z8at5Y2UFltu84JE/g=;
        b=piakIn9NBmZ6MKRpJRyAAb1k4zEBlyhztXOhsa0bB+18EBGqrUv2R1IwB2Pyz6ZJXT
         p8mzDXQRC/Q+BkdQYwPaxY4c/ddxD7XeWgemSkRPHbWMdrtd2QhhW9KJJ5FvMCKbzpz2
         YrLh+uF+BXpHRXmT1hu6soIKQcMyJ19H7MYnEZ8TIvC9L9MGAF3tpO7MCvSnEQVOKVtx
         FRAkKMW6QpJNplhz/uA1ai5MkmMvHetBkAMzUAZeK59gj8r91NLbDyoDm/KOgcDa4Wt7
         QH4+53IhG1lpOMUi2kdjbJnFlWgKi4iRz4s9j9+jvyTGGuNWuXMxnDc0/ObhWdT2kMQg
         hPxw==
X-Forwarded-Encrypted: i=1; AKwUvBwAYmdZf1K11MpbShdhBY62SWhwDNOyUZ+jG9D3JnkavAiwanAMNjv3v7xBHUY49ieaWj45IRWegDfXQGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvzWg7R+nyYUVdwUJs5wObkXVz04BRaibIXm9+z9RhIVWI1/ch
	yG97W1Pwpym3ua7nLlOfGntuoJOy1QORxAm7r5Uvh+OVhAbXIQ62lp0FsurTQlRGN3nVpbjq2SD
	2Hqzoh1A9kLv3kPUumUA08OFw5FIqZEDL0eSS4LQFoMoQD9wdfVdMJzBuMapM76dIJnl1NGPkDo
	Ny/FejIoiwMm23QSOW7RzT0cJlBLTWsMJ3OD7PTao5DQ==
X-Gm-Gg: AYBFou2LPf9x/SupxRRvKUMuYQzS6c/RKdMxRNRMcgMIslBd8l4NlHF3Z6/obBedRWD
	FH3GU/pm69okgwPqY6+M5oPoHdGlhl2s3wqrd3cXj0hLg1E5Ku/TtHaTmLMV9tVYEt/dQPhRxJh
	2Dl+Gxki1s/jeEheSwwpKx9PUEvSMAGrekrw2aiIQi3uAEhBvdir0xdWfRUw==
X-Received: by 2002:a05:6a21:4847:b0:3e1:78c5:dfde with SMTP id adf61e73a8af0-3e9025cbf89mr142880637.87.1793130202958;
        Tue, 27 Oct 2026 12:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:4847:b0:3e1:78c5:dfde with SMTP id
 adf61e73a8af0-3e9025cbf89mr142873637.87.1793130202500; Tue, 27 Oct 2026
 12:43:22 -0700 (PDT)
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
 <20261027144051.249211-5-ulf.hansson@oss.qualcomm.com> <a005dddd-a495-45f4-ac43-7d708eea009c@linux.dev>
In-Reply-To: <a005dddd-a495-45f4-ac43-7d708eea009c@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:43:11 +0100
X-Gm-Features: AclHuK9NHHxASxINNQJmFblOIaIeW8hwaZcMMDCwec1w6nqIWEDYH1aTry3AfCY
Message-ID: <CAPx+jO_2mjobdfAwnwRR-NB+ZD8Ohq2H-qWywaX4QHoQXJh24g@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] mmc: core: Split sdio_set_host_pm_flags()
To: Shawn Lin <shawn.lin@linux.dev>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0fedb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=0--HgKMnnlG_k7HjjQQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 29_zGtRDV8i2VrIBymsCFDV1N8txxXQy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfX+Q4lCSJ/Imox
 DUQmInxfGx6/a2fYUCDufv+VF+fTtG+pR1l+X1x4QxvBwYdnr8NyKCGV7dQNLB1SvBofrmK9XBq
 MwrITSaSwNoavSaMeTbapZr8ruAH+3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfX61yC7Q+vz+MB
 mSaR0xtsOmkrCEZU1PXD+XpYPMAnOhYVNAwwzybWKWFrAsOQO+00WaIM3l+gNBsZxk2sTmmAQIj
 XmeGviNiXWYzDL0Ngyw3LOkxnHLEJm2oLn/nn/GeQTLZ+miYz2ykqvxwnD/VMlwtjsGUbeuQtoi
 J2DmhO9jWN4/5GYwLJiHVHrisdC0eLhVzTLDZR9+O1hbwFidfCd3TI8draHnMuNZHJ5eYpkTFnt
 FrN1N1XWkZfuV9o5yC5GyqSvMmIoXqoxVxqNJ/GWE+JWQEr6Ne99tgNWVamDV0binyP4GyIqfXq
 zKfseovw174bKsjS44x1g7919hDKEjnfKF+o0/5dTx40B9tkV7UMcoItsFGWJXHC7j1rBdvBiqb
 TJXdYTYwdW/nItQ301NukcLoz1F8p4qjzQDPLkY+gscathq2NRWMwndRgMXvc8imigTNnfcxoK7
 57yy+RTyiarFMPY2VDA==
X-Proofpoint-GUID: 29_zGtRDV8i2VrIBymsCFDV1N8txxXQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270079

On Tue, Oct 27, 2026 at 4:13=E2=80=AFPM Shawn Lin <shawn.lin@linux.dev> wro=
te:
>
> Hi Ulf,
>
> =E5=9C=A8 2026/10/27 =E6=98=9F=E6=9C=9F=E4=BA=8C 22:40, Ulf Hansson =E5=
=86=99=E9=81=93:
> > To prepare for a subsequent change, let's split up sdio_set_host_pm_fla=
gs()
> > allowing the second part of it to be used as an internal function for t=
he
> > core.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >   drivers/mmc/core/core.c    | 9 +++++++++
> >   drivers/mmc/core/core.h    | 1 +
> >   drivers/mmc/core/sdio_io.c | 7 +------
> >   3 files changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> > index 677e445dc48c..49c0494932cc 100644
> > --- a/drivers/mmc/core/core.c
> > +++ b/drivers/mmc/core/core.c
> > @@ -1422,6 +1422,15 @@ int mmc_handle_undervoltage(struct mmc_host *hos=
t)
> >       return host->bus_ops->handle_undervoltage(host);
> >   }
> >
> > +int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
> > +{
> > +     if (flags & ~host->pm_caps)
> > +             return -EINVAL;
> > +
> > +     host->pm_flags |=3D flags;
> > +     return 0;
> > +}
> > +
> >   /*
> >    * Assign a mmc bus handler to a host. Only one bus handler may contr=
ol a
> >    * host at any given time.
> > diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> > index 9be2875608ce..d3a2ff00b18f 100644
> > --- a/drivers/mmc/core/core.h
> > +++ b/drivers/mmc/core/core.h
> > @@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
> >   void mmc_regulator_register_undervoltage_notifier(struct mmc_host *ho=
st);
> >   void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *=
host);
> >   void mmc_undervoltage_workfn(struct work_struct *work);
> > +int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
> >
> >   static inline void mmc_delay(unsigned int ms)
> >   {
> > diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
> > index 12716ec0e35d..99f857514b63 100644
> > --- a/drivers/mmc/core/sdio_io.c
> > +++ b/drivers/mmc/core/sdio_io.c
> > @@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func,=
 mmc_pm_flag_t flags)
> >
> >       host =3D func->card->host;
> >
> > -     if (flags & ~host->pm_caps)
> > -             return -EINVAL;
> > -
> > -     /* function suspend methods are serialized, hence no lock needed =
*/
>
> This is an API for sdio function driver, should we preserve this commet
> here?

Sure! But rather than preserve, we can move it to the new
mmc_set_host_pm_flags() function as it applies there too.

>
> > -     host->pm_flags |=3D flags;
> > -     return 0;
> > +     return mmc_set_host_pm_flags(host, flags);
> >   }
> >   EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
> >
>

Kind regards
Uffe
