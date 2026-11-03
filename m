Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698413;
	b=THicTlfZParxUI6BDZvYUSYrPY0ZDDjbMSmyEauJiJ92cZMJ32BRmzbi6nXSqL+k7eeW
	 P3j39PFmrc9zA1j6dfqpXlSA0NR8mqlmspS1BuG/qvUBQhklz5X2HkINQWaA11YcFkyCB
	 JZTodWBlMGUg+eiG9NsLoXdqWEMSTs+0VUAi8n9zUCwVI/8SCtaHgVcSNoR7tRPQYMw08
	 0e+EUye2qoMlE/XVaWWxk2v3Wn67iQHTBE6Y7OaPtD0WzUGRzvKzGwMSO+YMGZ0CTtH/9
	 FZ1qfgeDyOKNzgq790AlcLxaoNjbDzN8Xt4Y0uRBeEgfn3+BNNCcJqCESSi282TfXBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
	b=Oz7G4uE7c7VUuGXh/ANHpYkG1GFLM8IL7QuL/z0G9T/Tvo+nKe8A8iD56YDJDBWpizV+
	 Rk3oA5R6MTraho80DNz29FGyAGeXn85uvTDa1Qig1UJ1iJRq7xSLOzgZFwKeLDfEpi+EA
	 AgazRw3dxkoBUxWQLOupmlJETrkk1CCURL9WeRltqYWeWZDgB8xur7fbbrw9x61Dgcnkf
	 LuwT5ZfI9w6qnEuHPiinuzHF79u8N0PFAEcJerWpzJLtP3sIn4agcyggonabqCzYqDspz
	 rx0k1je6KINEQZj0dwfMjAqxNhnP63XlGo11gmu8aFEh8wPe8LOVxRRoZdo8f8+8UYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C5606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8C5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34h42r750854
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=; b=Iv7tuCh44+CGqboC
	S+tDXs7SWnEBRZTY08koWYlhCpcT32OFgJTzKXKgQpTcgKL5Q6Oo94r0v3locmuu
	pjVS0w2RKdDsiLbwtQKbUP3fRhnBhnDXfAEnRyBuqsPTv01ZPIxE0MR3uY4MVaBZ
	v/ygxMKoz+7V+adSNf4NHcYon2Zmc4Qi1WIxZ6n3GAJDcoJx/XyqyHFkaivoRbdq
	xeZFQz2GSmbhfe00ccnyB3km50+XscI/epeNqF3+Da7yW6sxLTX92MTsDDtFLT9p
	b+P1mRNKzXijh//bUfa2Gt36wuZ+0KIl08b8JWMXnC+cVdv8DT9mD/n8CQqgZWy1
	xGdaOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5h39b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:33:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c817b56adso80016736d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698405; cv=none;
        d=google.com; s=arc-20260327;
        b=NbgGVNxhfC3qiVM0P2KSjVOkcZTxVe2e/w4A9NSxu7ex4jisrfKZareHZdExS2eOE8
         eYoBPm3yGSjcjjv1DGdG5q/7zb+/AUPaCdtYj5N2cCPvtkDeKu4iTKp/drOO1oLr3sUX
         SNNntYMiaFC11hpfYL9OyDoyG7gxzIjysfOFNI+GqMfuSqHB3UAR6hGJJBKOOQd4ML0d
         fY0Ku2xYqZYamLqMXGXgncE5UA2RHfF4forBEwUmm9F4Mq9oXzDYyGCXp7+Fkd9EGPOc
         wgasFLlRpaPtNTG5pplBXJjg56Xc2A1gqN6kIY3zwuacv/UjAEU9BqG5r896B4ndXxZe
         Oevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        fh=BpByk+wmMqkOhMEe6A7/SFO9KSAPqzxIqkNNeEWd1qI=;
        b=ZcDkVs49oqWhWemy+atbSmxGzuUhfCd3It3ySmOLQtVjAq8XfQ/q2dSMs1kO8Lf3R9
         9te6l661HDfUaDLFDMfU2H/+qs0i8fo9aDbGFkCpfyHtJubaQksEZK9sDbQM71FaNi37
         uGq9E/Bo4vHPf9ffL1uti8V6WJXAX6C1997yX1LtIog0s4PvU91uavzfkyu3LVlSfXNO
         SEOmQ9pOInhwajn1GeqXX0GzAlho7UWt1gECjfTmN79QyFHHrw5wYqynPu6SStBoYNZB
         k9bRzH2lRsoylgvtVX1YqTzBi/FeWJgEpFQ64axgF9vW0rkHIsipGTTA6fRnjQ6hziZM
         JsQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698405; x=1794303205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=TSP8u4IPna37B++prxYE/LAi7sHIVeGPxivsaV5QKF9CxFQIfLgotVOpSqhDyrF2Ah
         RVErf346Ge4dTRkfqShk4jPcrnWq0VmS/4VRLK3NmSFEs/Nd+ImY0PAG7ZVkQsgLHjgJ
         lnvXnryncBPcUljhqiY4d0fbbUzpAw5QABKsrPPEc3upwetZueYopfcH09hPDYFo86n7
         beASvvMIb/1Bhl+nrvqx65myMiJeO9eBoLfAdyX8GIlZUfecJcZ/iZmh+4ivxhib2bP/
         E+Lq30AQv/Ev63nJkBfYEZoZLwBL5I2IIpYWZayc5sKuNa7VOYABl8QQXMbcLoGaFtcZ
         qPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698405; x=1794303205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=KRfh+SKuMsfwjlYtpC+TQMmAEn9ooKyoYqq4Gdc9G+ZAiPCgGQOlFqUeuYB0SLCeQE
         ZR/SjqVAjWZArCpmi34WgblzfY+iwPog3wdTd5754aNkKGI9j4J7nXERvmMe3KsU+FT2
         B3cHRJq5Th2je4ugAb/rGXSsKyHzyQZ0SL0q6zrmhw+rpXB3MrulchBL/tr/FAL4y4jd
         tA8LP92cE4QpZI8PonyG05LlZurKcQYEBRiW41qXDHDO0yH8eNnhPkGkSvMFeWem6LPk
         jCkNT7M/O7zkkEVFFtBHiebyUt3+T3zE9OIexuWdY5lrD1eiTAgTMCjpR9JKl/2C7t7W
         Fzgg==
X-Forwarded-Encrypted: i=1; AKwUvBzrhayHptZHJ+nN9+cTVPhETGz3BeZ7QAnHspf92ta8mAbaIZ3FXpNfcUKInkC+KKLti3340rvPcb6r03w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dlz2uMp6m9xQz9Vy5z75EL1vNK+6e9h0Qf9x2iBrqLFJOE3RT
	Gq92uyO3SCtv0Rg6zAA+fzXlU6k+kPmE9z+/PPsqgQ7J0BuX+xor20wO8Ihom9ZZrAEfaPJjY8y
	LiWAOuHoe2U3MiLyHfre6LAErmQCoqSDq8t0Kh0SZ2kXGNWaWg3ws19dSHrPHRo9Cht/SxPWDLx
	PjApdm9pUvascdh3eHkleTtd8BpMHb0LLGRP75DlTEbw==
X-Gm-Gg: AYBFou3PJh1i9dImzy68ZkRO7ni2+FTS+WAxg1MhylxGHyTm+QeBRCimiH6WVICLE+2
	pzH4kVgpMwGjjPa5T8oIhY950NKWe4JTpENllZHpaHOOz3BNe2vlyAOMx2EhzR7Ht9bXfudgG3h
	2IDSiyy8d+moGzp8/Lphmm9ZHbNCoIJzcbD9FIYj4nlPmWLVBr9KjO5Ch4OVdYZzcnAjCr4tk1A
	wIC8NfZZb5DfF910mzoG0wiVZjZdyl7gOVGc6tjqxi7oLiBOElEZfg98GuyckmgNcOgWdyGcuk=
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id af79cd13be357-94421737389mr1925345285a.33.1793698404926;
        Tue, 03 Nov 2026 01:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id
 af79cd13be357-94421737389mr1925342985a.33.1793698404383; Tue, 03 Nov 2026
 01:33:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
In-Reply-To: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:33:12 +0100
X-Gm-Features: AclHuK_hAJNMdcggM-t3OB-XwNys5QjccTnPIaxMgSrXRRvM5JChrPyvvoLuA3I
Message-ID: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MwhUpEVUGA6NyeLrjW744ATHFTrpU5St
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX2FpWx64wx+g4
 ZGAuw7LDKqTc6V1cGHgu/IQNpyxUdNZsqIS8H28zC4UrasvULntBU1d3ph59V251QrO8rtrHLop
 A7cwkOvshidgivagnImVC+zIa64qhIU=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9aa65 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K9HSDwGVA6T88df_oCgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MwhUpEVUGA6NyeLrjW744ATHFTrpU5St
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX4GtYPKTGBvZq
 wIueofMcMNrOae84GKf5vZqfi1tHDlO+Dbf1/vbl8MI5y+1TWFpMOLhUJsD2RmK1I5EHQWFOHBY
 aGgHJ2TbH1GfhKruSmT/MNkdnEnXYWxncH06C2lpOOaM2w5mM6DGMC0zOE9B4S/PQcjBoVcCTYF
 NKDa20i9uqpF4B8F2afcxOC7jRHocrMHF28GrxEmAC8q7u5qsk84nuk7Vdn9QD09/ANbj+CZ+oW
 ozb862OxrNSNr4qDu38x1EVj+lWwuVekr1VSXI9HRj7piFV5oYSph3t+ljNfP9XsDTp28ayF/8w
 le73Hz44hTYBb0HWCudVJjWj4/bvjjICGtaoxv+qhlTJP3J9AYBcN2U4eWBq/Z8zOEPscNb6i2j
 ztvkzKVaGX1d3KfNhsesLRKLxfqHLhEHFnnPAjOcyu/miPmfmRHAGBLoIJJroIIKNCzuMj1MEdM
 cSNCC5vrkjTUDUwaETg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030037

On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Bryan,
>
> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > In order to communicate to user-space CSI2 SOF events we will need to h=
ook
> > into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> > implementations of FRAME_SYNC have CSI decoders which support the event
> > always generate it in our case if and only if an atomic user count
> > indicates it should be so.
> >
> > A flag in the CSID descriptor indicates if frame_sync_en is supported s=
o
> > for each SoC that supports it this flag should be true. Since bool is f=
alse
> > by default no negative enumeration of existing or in-flight CSID is
> > required.
> >
> > Subsequent patches will enable on a per-CSID basis.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/m=
edia/platform/qcom/camss/camss-csid.c
> > index a00791b00feb7..e9b399fcb9c7a 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
> >  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +     unsigned int i;
> >       int ret;
> >
> >       if (enable) {
> > @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, =
int enable)
> >       }
> >
> >       if (csid->phy.need_vc_update) {
> > +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> > +                     atomic_set(&csid->sof_seq[i], -1);
> > +
> >               csid->res->hw_ops->configure_stream(csid, enable);
> >               csid->phy.need_vc_update =3D false;
> >       }
> > @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *=
entity,
> >       return 0;
> >  }
> >
> > +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsi=
gned int elems)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_inc(&csid->frame_sync_users[sev->id]);
> > +
> > +     return 0;
> > +}
> > +
> > +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_dec(&csid->frame_sync_users[sev->id]);
> > +}
> > +
> > +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D =
{
> > +     .add =3D csid_frame_sync_add,
> > +     .del =3D csid_frame_sync_del,
> > +};
> > +
> > +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh=
 *fh,
> > +                             struct v4l2_event_subscription *sub)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +
> > +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> > +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> > +
> > +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> > +             return -EINVAL;
> > +
> > +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> > +}
> > +
> > +void csid_sof_event(struct csid_device *csid, unsigned int id)
> > +{
> > +     struct v4l2_event event =3D {
> > +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > +             .id =3D id,
> > +             .u.frame_sync.frame_sequence =3D
> > +                     atomic_inc_return(&csid->sof_seq[id]),
> > +     };
>
> On first look this was looking strange because the id is used for the
> control id events not for frame sync. But on second thought it may make
> sense, but the question is how the userspace should interpret those ids?
> As of today userspace does not have any info for the VC and csid internal
> pipelines (so called lines). So with the current state of the code
> the id is VC which makes sense becouse the SOF/EOF packets are recieved
> based on VC. So i am thinking of two options:
>
> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>    and will be well known to userspace for which line is reported.
>
> 2. Add and propose extension of videodev2 documentation that
>    id of frame_sync event types represents SOF per virtual channel.
>
> Personally i votoe for (1) because it will well fit with stream-api
> support and usespace will have clear understanding of the SOF to which
> stream belongs.
>
> Given this in mind it will be good to open discussion with Laurent, Sakar=
i
> regarding SOF event with stream api and GMSL cameras.

I think both approaches can be applied independently, forwarding the
event through the VFE as event proxy would likely be a straightforward
addition.

Note that the id here represents the interface index. While it
currently happens to be associated with a VC, that is not necessarily
what we want. Ultimately, multiple interfaces can be configured for
the same VC.

Regards,
Loic
