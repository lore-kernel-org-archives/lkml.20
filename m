Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793059953;
	b=lTPHA0NnqnnOTacHJUbcyWvtnHcwroCyr+tjsr83FEIfUihDlpIcDdmDNmSEEnOZwzLg
	 fKh8q0bumS52dNiiURLhsFqaF9rYy6oKxA/gF5XGZJL0ozcwYW9zWg8vPwkB+qLUeJT9V
	 rzn72VjjfUZl9OMJlAmAXPkJxUr8wLKYM/RcHE5GBjsSLS+GAU3X6BXttG38xGlTCpRH+
	 Mxnh80mObqEZfdbmpFcjA/VlyBoZ0hvbJXcrzf1TCAp3cB+r77/UjrHPbgzHl4NvO7zVK
	 PlZIszi/2vYzKjB+rB9F20gaV8BOmvAxJvR0bYvBUzLF6hSw0SnaIWuYjvOvF77w0Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
	b=AGtkNPg+L7oHYR9dv8JshvTFDM/wgkgqDl1jgX3xKuFzPwbgEe6Z4qTGTP0vjlXN3nCz
	 Kjj3FDCyoJ2X3PK17xvBl6z8LD49309mR4lgJk6v7BKdpLP3Kosv8cc8ZX0w8vS8lto9L
	 /Pw0OBWGWtld8Fa/2wJZGFLAZJ5CgiwJy7mEojm3UUmGyiGHrSGL6GGtC3TOWUEg3GxLU
	 yjHjUlZngllblVo48XvhWqaTsHpTxJ028wpd7jITXddYnf+WyS7643zM6CkAY4xx8cfC4
	 n49A0zq5kKGomWcPft9hL9ONdfrNaiLv9HQYqUix+aNmco2TNLrsIUyuz/4Kz+/tWsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3t8Buh5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2Z4ZzmB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3t8Buh5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2Z4ZzmB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMP7kv869091
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=; b=f3
	t8Buh5czisU4ALk79qlLHCKgOEzhNtNKQH3CYBYtvtryyBc7hSuQA6FAEJ16rR1i
	I56gG6PnC2O/4Pcymx8vCN1ed3fygvFSvOsJfpHkW0aaNohCivXvRfG7s24vJ8Pr
	m7cTg0X3BQie6WOIVZtcg2pm+wis01M6/68XOEiv99j7iE/ECjuqK2PPRf3rv1s4
	wbrTZHv4fESaeRHY0UdC9wBffVm7LFZ1ZAnHu/SGmyMPBUW6tq8GA/oNE8WaXGqe
	3BgBc8y52iStNCq7LQ1XbsOQ4ALsJ5I4MjMH8JMeSzHA5IzQkfIrF6UKL1PKkGkK
	KbXMgC+c2EEiEJMqsLgQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s930sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:12:31 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e83fd0663so4096953fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793059951; cv=none;
        d=google.com; s=arc-20260327;
        b=X/6u9drYX1g9x/Ikyn0Mv2ou75kzWzWNO3wcMwXOJanPfaziYfN4MWFtxhLL5arcL8
         z9hSparnkwO6+Ay/QMlGrsyCdgdsGSRze30S4YOKRCdhGzkM9IN6bISItBNZHMtQrMdl
         a6n/XFdclvVtukm+MXnvuK6P5tnLjJwnwwWInABM7KFgEfRqbRxBD0GC9uNPDxX8f51g
         WefyOZEQv/XR0iuKHrUCVO1tv3uFG8/dLQxs8rxGMor39tsECPMlPfw67Q8RFfgpay1N
         4qOaUjbEQolWaIIYokAJQ/m/5cIu/mCVEVzXtK0iSGFijSYQfCUV0EvJ8L8eYVeDWQn3
         2z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        fh=8txM+qvDGi5aWXbd7Iiu7VfL3FHChX1tPrsWv94XAxc=;
        b=hpw1KLbfrhz8YA89LMWGN5/9l4lab5FKFHSLeQe+0hrJtz/XKyAs+AmeJ48IUU+QMn
         d/sL1YxIkGkAxzuABaNdAiaV16itEsowFryXlMcvf/UxirpiphtUrfCek+k/MZHtXCi7
         GBj+rTdnKj8IbGPRJNJQLscOapagocjJ8nswWCAHZWgCMIKG61Do3Q0Ypx2ekXb6EG1h
         knhwHPdmUhDh51g/HLxTFXTC9AT3V6UB0AV3v/z34KtA6dRIgtUrdTNNuIsVuE/FxiPC
         jthTy3MVOmtwxCWdehJzFICyDNHFfNezh7rxowiWMbBqOyLL59HduPNpa7359TpGVstn
         P22w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793059951; x=1793664751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        b=h2Z4ZzmBE/jVvnEfRJT5BZGeM3HKFmz829NTRh9jPBA9neRQFm2ouaeLeLuRhcg0nu
         rzTKoBYLRZ5YExtRvztx0vgBavlIze4yPbcD/+/UT9KT9SXWkc20Mkj+3MK6W1qgJ74n
         AUBR9dfR8/aWjK09LL4YnMI+xOTlCiO2Jk0azIvKakLON6Ogh7bVQmeQ3FkGlWUHOGmf
         eS2oPH0nzuBwYlwDg7qCXKw0gjShU0n5bKaVf8itY+L0XJg9igsmpaYVIfafOdwgvZYx
         CSHKmpJXN5wNSUYJF3r0Tvp3JD3gIWCiy/dj462hjRyU3wanLXpaf4nSsYGNvoBXQM8H
         G3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059951; x=1793664751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        b=ziOeQrXs8QuMj9s2gkhDLZLbwKcUK9RWnOPDxsY95UKTvJwkV1taAlTOhaTTs4dMAZ
         Gx3E3emktU8UHMIYZYaxgXG0CDXxUb5H73mR9TBk/7OlV7a/KCgSOE47QhDPoaW/3ytx
         HojiU1EkKQgq5TGrfxKXTWHmoCz4zxpY5p8XIY2I1MN8m5++GfX01HbszWP0pciF47i6
         tBTXuvMJ23o4d+R5qy/HU9BK49EzRp8cAyzx/ig9ZllWqElKsXXJe5qcub9P7VSrH53e
         1e5V+mhebNxjKWAUO57Etdr54vbqNRC7tCwfgYxEsEk3R0Z/A1v6Ed3u+s35aJxzgMMv
         7OdA==
X-Forwarded-Encrypted: i=1; AKwUvBxPThSYuCMoIQVlNd4OT7Y4VrYd5wi1q6u4iPsMWAI6w7aWn2NXs0AODp7vUquAtEY3+8oy2xowRoRiKi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzIpwSFVtiDlYDP1io73ab6X5PUCdxT9VgHcJ2xs+r5VHLIc1l
	Wxr+/92NQOKmB5BpKAxXrGSkAUiOqnMPcJunnCbfbbO+ixHqduVC4eyOr+iMDV4cyBTdAT+HsjQ
	iJxJq3wFn4ssPHhfw+XvnlAyOZogB6lQiwWjarIim7sv0h5bqMdIf8VCW4na04pzSz666eu2Kxh
	zCpQ7w2N2VQOxAG9GEH/LQO5k6l0rJx+PHQ3jLusnwrw==
X-Gm-Gg: AYBFou2E5qzY/zQ30mrh9p/EvUAlPoDdtUz3wO4mUAdSWHj0yxtD4lecxo0M4S7RcR8
	iqgRFw+7SDop9s1Mc0ojC67kXmW52P1RLDmijZ7Q+/QTmNrmSecWDhR5M8bdiRdHczo21izLeOO
	H0b2C0u9tGSOgVN7n+JtdrILPbGQ0MPjBn9W2yXWxTS2UZ7LuHK1QqfD1kTg==
X-Received: by 2002:a05:6870:3909:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a83f4aedd0mr4807244fac.30.1793059950530;
        Mon, 26 Oct 2026 17:12:30 -0700 (PDT)
X-Received: by 2002:a05:6870:3909:b0:499:6b20:13df with SMTP id
 586e51a60fabf-4a83f4aedd0mr4807230fac.30.1793059950061; Mon, 26 Oct 2026
 17:12:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <FZvwtKTpIxRNzjzcqFf6bTw12mNTJvJZmg6j9lmi8MehHBt91NogIW8oQd5yFHN5DSL8yIWL8p_b1cJPAJC57ZFkoe2BOAh_Y3kwph5SV_A=@pm.me>
 <CACSVV02x=GDTH40C57B1Eg8_CfmCgDGD_BE4f1auwFf=3eQNCg@mail.gmail.com> <HWs63_U2peTA6inCaYP8yY8D5MkYQ_f3KzN9-WXHzURewlVA-7MMJwkLffTUASri-OqRHtp0PI8PFdyUku_7PGxBaEyUbHda176jExmf2bo=@pm.me>
In-Reply-To: <HWs63_U2peTA6inCaYP8yY8D5MkYQ_f3KzN9-WXHzURewlVA-7MMJwkLffTUASri-OqRHtp0PI8PFdyUku_7PGxBaEyUbHda176jExmf2bo=@pm.me>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:12:18 -0700
X-Gm-Features: AclHuK_C5BV37gJkzA48Qc3yl4-u75Nn6bHK14ds3fgZdhSTNmho3RjLsLpW9E4
Message-ID: <CACSVV03k1EkZA1NxG9xRG48WVPuXOT9W7x3oFxfTiKZNp-40SQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] drm/msm/a8xx: GPU state capture support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwMCBTYWx0ZWRfX1lGPvs/wZQPc
 dZN/nDkXrl4DqLSaA5nKPLo0AK8jm3556bE+xc8oVivQKZoo8l8s7SwcjjRTJhANMjTbctmEReG
 ozy7zN9g4sWsWjbE+6WU3vvuDUBGbK1+5DE3ieIPYrmEeYRAG1uOpN08B+yM9PZfoNsj+waNNl8
 sMipfIquRnqsWRg/GEyLDlx30mlolWf+F0a5ur+D5Rgq+A4WJLtFcGNda+nnBmq0L1fWKeuaulf
 qxkLspDW6ZC1HrxFXe62m4YWeT8xF6BOOP0nQ2yGn9BOF1yLBWi8ou3ompVcS1mWpLDHgIXG+LU
 sj45nsr4ULdxem85R2mKXyNUJ32JUKDPlgqiFv41oXQreOO5VMC9nFzrSGJkusErfxFrBGZQpwI
 hbaNZmN5HF4+r8YTxRroLPszDX+MM7oZ4Bw5D2RY1CCb37dSpA58VpjwVm73dI1IoK73L3NxC54
 yTDLxTO5vyv6vx18qRA==
X-Proofpoint-ORIG-GUID: GgqngcHAdyWQjFr9kj6HbUw1lwIIXXrR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwMCBTYWx0ZWRfX+nKz3CAf9Vcv
 8VQk51Ka9ska8GYjwX1xTLu7mdVKGhXlkZTDBVFfH28VF4eJOLyYOqwYRLAY0QspKhcz8RX6FfB
 Tma4EoDfCXZXmzoZUnrNHf/w4QFMEgk=
X-Proofpoint-GUID: GgqngcHAdyWQjFr9kj6HbUw1lwIIXXrR
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adfec6f cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=oZfsDU2LrdIIkRBWPnYA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270000

On Mon, Oct 26, 2026 at 5:03=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
>
> On Monday, October 26th, 2026 at 7:32 PM, Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
>
> > On Mon, Oct 26, 2026 at 4:06=E2=80=AFPM Alexander Koskovich <akoskovich=
@pm.me> wrote:
> > >
> > > On Wednesday, October 21st, 2026 at 4:54 PM, Rob Clark <robin.clark@o=
ss.qualcomm.com> wrote:
> > > >
> > > > I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since=
 I
> > > > don't have these devices at-hand to test myself.  In particular, do
> > > > things look fine after the switch to generated nonctx regs.  To tes=
t
> > > > devcoredump, you can use the msm_recovery test in igt.. or just:
> > > >
> > > >   cat /sys/kernel/debug/dri/*/gpu > /dev/null
> > > >
> > >
> > > Tested this series on Milos, series as is works fine for initial boot=
, navigating
> > > around GNOME & apps etc, but when I run 'cat /sys/kernel/debug/dri/*/=
gpu', run
> > > into an oops.
> > >
> > > That is resolved after removing 0x20400-0x20487 from milos_gmucx_regi=
sters,
> > > and removing 0x0f000-0x0f002 from milos_cp_cp_pipe_none_registers. No=
t sure
> > > if access to these is restricted by TZ or something isn't configured =
right?
> > > These ranges don't seem to be described downstream in adreno_gen8_3_0=
_snapshot.h.
> >
> > Thanks, yeah, there seems to be some things blocked by
> > tz/hyp/something, which are not blocked on glymur/el2.  I'll have a v3
> > soon, but still chasing down some of these details.
> >
> > >
> > > After that 'cat /sys/kernel/debug/dri/*/gpu' works and I get a dump, =
did observe these errors in dmesg after though:
> > >
> > > [   42.891106] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891142] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891157] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891171] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891184] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891198] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891211] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891224] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891237] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891250] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   43.640122] ------------[ cut here ]------------
> > > [   43.640137] msm_dpu ae01000.display-controller: [drm] crashdumper =
timed out: status=3D5c00bd00 (-110)
> > > [   43.640222] WARNING: drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:1=
15 at CD_RUN+0x20c/0x594 [msm], CPU#3: cat/1929
> > > [   43.640419] Modules linked in: rfcomm q6apm_dai q6prm_clocks q6apm=
_lpass_dais snd_q6dsp_common q6prm algif_hash algif_skcipher bnep snd_q6apm=
 panel_raydium_rm69220 fastrpc qcom_pd_mapper ath11k_ahb ath11k mac80211 hc=
i_uart btqca bluetooth qcom_iris cfg80211 ecdh_generic msm ledtrig_pattern =
videobuf2_dma_contig ecc v4l2_mem2mem drm_dp_aux_bus videobuf2_memops qcom_=
q6v5_pas ocmem qcom_pil_info videobuf2_v4l2 pwrseq_qcom_wcn gpu_sched ipa p=
wrseq_core qmi_tmd focaltech_ft3683g qcom_q6v5 drm_gpuvm videobuf2_common d=
rm_exec rfkill drm_display_helper ubwc_config cec qcom_common mdt_loader li=
barc4 nft_reject_inet nf_reject_ipv6 nf_reject_ipv4 nft_reject nft_ct nf_co=
nntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables uhid fuse usb_f_ncm u_ether=
 spi_geni_qcom evdev libcomposite
> > > [   43.640750] CPU: 3 UID: 0 PID: 1929 Comm: cat Tainted: G S        =
           7.3.0-next-20261026 #3 PREEMPT(full)
> > > [   43.640763] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > > [   43.640770] Hardware name: Nothing Phone (3a) (DT)
> > > [   43.640778] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS =
BTYPE=3D--)
> > > [   43.640787] pc : CD_RUN+0x20c/0x594 [msm]
> > > [   43.640972] lr : CD_RUN+0x208/0x594 [msm]
> > > [   43.641155] sp : ffff8000891c3990
> > > [   43.641161] x29: ffff8000891c3990 x28: ffffc3ee34aef850 x27: ffff0=
00809253000
> > > [   43.641180] x26: 0000000000000001 x25: 0000000000000001 x24: 00000=
00000000020
> > > [   43.641198] x23: 0000000000000000 x22: 0000000000000000 x21: 00000=
00000002114
> > > [   43.641216] x20: 0000000a28796b5c x19: ffff000813d7f000 x18: ffff8=
000891ad078
> > > [   43.641233] x17: 3a74756f2064656d x16: 6974207265706d75 x15: 64687=
3617263205d
> > > [   43.641250] x14: 3fffffffffffefff x13: 0000000000000003 x12: ffffc=
3ee5c6649c0
> > > [   43.641267] x11: 3fffffffffffefff x10: 0000000000000003 x9 : 9e145=
38c77bb2600
> > > [   43.641284] x8 : 9e14538c77bb2600 x7 : 2e30303031306561 x6 : 20757=
0645f6d736d
> > > [   43.641301] x5 : ffffc3ee5cb061bf x4 : 0000000000000345 x3 : 00000=
00000000000
> > > [   43.641318] x2 : 0000000000000000 x1 : ffff8000891c3790 x0 : 00000=
000ffffff92
> > > [   43.641336] Call trace:
> > > [   43.641343]  CD_RUN+0x20c/0x594 [msm] (P)
> > > [   43.641530]  a8xx_gpu_state_get+0xdc4/0x2698 [msm]
> > > [   43.641714]  msm_gpu_open+0xc0/0x134 [msm]
> > > [   43.641898]  full_proxy_open_regular+0xe0/0x1e8
> > > [   43.641913]  do_dentry_open+0x154/0x4d8
> > > [   43.641927]  vfs_open_consume+0x40/0x114
> > > [   43.641939]  path_openat+0x440/0x6a0
> > > [   43.641950]  do_file_open+0xdc/0x198
> > > [   43.641960]  do_sys_openat2+0x88/0x118
> > > [   43.641972]  __arm64_sys_openat+0x78/0xac
> > > [   43.641985]  invoke_syscall+0x6c/0x12c
> > > [   43.641997]  el0_svc_common+0x98/0xf0
> > > [   43.642007]  do_el0_svc+0x28/0x38
> > > [   43.642016]  el0_svc+0x4c/0x1ac
> > > [   43.642031]  el0t_64_sync_handler+0x6c/0xe4
> > > [   43.642043]  el0t_64_sync+0x1a0/0x1a4
> > > [   43.642056] ---[ end trace 0000000000000000 ]---
> >
> > Hmm, not sure about this, other than maybe whatever is causing GMU
> > fence errors is also causing the timeout?
> >
> > If you run something that keeps the gpu active (or disable ifpc), does
> > that help?
>
> Keeping GPU active doesn't seem to matter, get the fence errors either wa=
y.
> Though, if I disable IFPC then they go away.

Ok, yeah, it looks like we never updated the debugfs path for IFPC..
I'll fix this for v3..

BR,
-R
