Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236770;
	b=kvDnWrtqOkdgXXS/uO4tNx7/77R8cuy9E5OZ3amdp91cuoHgodRpVZET6rvblqsMPsEc
	 X7rbmOts8qCnfAGhU79fLX9xX1sAzdEKiNQ7KoOIwG4MRk+LUcHPyK5uOGPetxJEqYWrq
	 KmHKdl7XHsWsZGErsplMSa1CVGy2T5nKcxDBCaDZZDppZTo4Pw14vFI2RdUOfxyNVLnWX
	 3mt22h5hpiID2cSsfrbQdFpLEIai5kxYB6ZQSIVpo/R5BIl0J2qkNE2ry6a65fGzDax06
	 XIM3tjSBdGqBYsSgEfyvSLfu6nGCAzAC2WYPcUn7sL/6pcs4oGKSurlwC1gfCr9MNdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
	b=zLzTK6sLfDkzntp6Vr1ifGdgNXtbQSjsCgMYM1HfQhavRJLAGOlqLRTEWBeFy3IMlqUJ
	 zjm8Sbg3Sj81nsWeBP2ToXmox3QpVDRWsILk82AunfV4h8PmrRWUx1KEoZ2swma8m7ekf
	 JushUX8nVqZQFma6JGZHaN9ajI90za1i4rZJxk6bz6on/eWxLL1Qp8eOp8Evj9eGBA+UP
	 DdzEhGxgI5/kV0QbFOGdJDfYRoTYagHOERAFXkIzDaHIFPVCX5pESUJzxNXR8DFqec5WN
	 8kH/G7yGhzIujCmx+vgd1hiqXiHOz96IeqDBe7pkSqVsxVxGQUfk6OFAkd+dTE9xzyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1CE606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFYWu335804
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=; b=mTuBisDpOzs/Pqni
	WxP8gaoajYwRE8TXaHfk1KU1nwzlAlbBKnoKLKw+p5iynqnJ8O5WCk3eFZzB37pz
	KCl4Gn+XmIcIioE+D2koa6f75VEqliU2VEoSwD7nzxCoWzsAxTZSfmBks65GF6L/
	7mk3N5SO+YWrv2MZch5sWt+/82q1tHCBtsLSrkIA3gjWzsVL0ESBPKgk+Nc5UD8t
	SRmJRnkaQfASQa8mUNX9lvEhKtJpGnosNe4+eDCn6CbVJgi5fk1VOlg9OP2UVh3m
	T5X2KcMG9fYTD1A7FoNheWHcqJNNWt8CJsFVrK9AU+qExEpbNWritCf8R2sLNXS7
	QU5RMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58qv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:06:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso929274a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236768; cv=none;
        d=google.com; s=arc-20260327;
        b=V5QIdnPaC8aTn7r1H0cmoQRtf73oyPMuFhrXpxSLY8xNWRzJU+72VsYPlQwFtigJML
         gcuuCIrtjrP2JLjzGWdcfhnYT82Br3TeHUi7s4tjb0mBoEIjwe5tR5ySwoqdCoT7IOfL
         xoTzRziYO+xed39rX3GyhjFSUHCiGpmik2kIrFb6bvrtLpxoZRYGYT6nuFyTTCp+Mg5K
         XjmQp3fsfdnz6b31fgeEt3e+m6JMk0SEt+sOoGd9AsvNPxCKgSecbkpaLlhV3EeNzqjp
         AFK3fHKwz0KlO+dZoq59YokHBnjiiE1dPfuSDTAXYXUl2A1bxkdCEjsWOdDiAoepwhSE
         qlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        fh=/685HoWehp7TWBs+x6rJoBPPOaK4hyTvbru0cMWy42Q=;
        b=DOdmGlogAnzM+h5IIy0PugHycMvgkgrcUv7fNta0GvkiMzEE098kq7Ol2kNBuIHPd6
         5P9yhgwCSNWCpaU816hsvBn88Law7HIjpaPrOSnkDBBnlhdicUG2D6Gj0nU1Lqna4z+F
         h+cZmRdKBxWIgQdxsMJlbHCaaPTTVp+GzwTqM9JH9M2Q3LNCA0XtZ9xF+qQtAvzgT+rV
         jw7XtdDrusxlHEotXzIqkLdRb7tfLk0fSe3PNs3XGV4Vub+HsbhJAT1Zeg9O8y01LZCC
         0cVockSJ44oVduRx+jFiEOucIRRF9V0GuZ6DJJ8wdgkkK/HYrpud/hrE3tzrkSOY+UDZ
         9FZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236768; x=1794841568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=MFPP7ujNg/vMpIHHh51wPKSs7Nf2d5v3fTZd49lDI3A7uXPRuU7eyga0QO/fEexKlu
         p7PXE3pRqjpoYWGH9TEuKLp5hGShyVT3mi2NuHPDJmbQ7MsQXcsG4urybz4iyN02lfdi
         1Oqz7L5oABFFfVyw3hko3FAIwwL8qH18CsMll9kvP2P9tvW662Xz0ERvhF2asGBot7hH
         bWUztO3eP8EnymbdrIecB9At6aGLejM2d433vUv1Ek10iwRT36XEhha+2+g2oVIbRYjP
         sK8wIAogiBUOrMgrRRP8ggonQNFpXU7lM/JvNP6MouQ7VK5yWdf5az3Q+FbOCuAPcVXh
         DKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236768; x=1794841568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=svSZIO6u8i+rsm0gN5fP777X8MJ0kjrd4NoPDiaoWJtCgGi/8It+pgryvNqCOZKEus
         39IL0hrJj2zxp1Hei5aVfyNrgb4xSKTwowaojhdW3X0v/aHCUVb8nQ/nx+wfszHMI4Yf
         0T6ZHA9XQ2o7ex9pxy2jhEmtfch4EOhxna+c2qWLSrjirFos5SzgyUNYSL5gZ2GbCrVz
         GNVYXSGKRzhnuVF3KI56blWU581oSGDPN/JpMyFMtHT0DhHgva4kjiIrXlbxhb+aVuNw
         8hKNc++SBfVmDIRhM9iN1rNJYTaVbwcYxDYeGYYMdmOklguXrU0AgcwIjkihg7FnzNlL
         m0wA==
X-Forwarded-Encrypted: i=1; AL+hErFI6JVx/Jhq9zUB6ohtHljIV067U4H7lrV3Lr8RfxWXsmbYIvvdtkqB2puMBftjYHJUg92x5adET+R/Vbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VtpbCuJ3sg1jzL3QJLmXrS8gLe1Lj/8LRJZrx7q0sUl7wKq8x
	O9pv4xptvjNFD/IV6WZ3VCZ/qX1K0v7A+AZmUWXcTX0AFRPRQUsQsacWBiQZq6Xxk5KXGEgMliY
	6QxJbB7dnVDMycjabeHkdQuNTjXSF5qyO/jZva4cN0yEtYhPFNnl2Ggy7JUVI6y2qGGjzDh9q2m
	6mSLStfYrjc1XqTTRLBfVqTD6FD7yFqI4aEHO4ouMwPw==
X-Gm-Gg: AYBFou1Ibhe7TfbkDyIiHo/InJnd+OhNPiDOrkiWYSkmzg7YAIX83pVTcDTDSVHo4xC
	1UyhEQrYhGV8FCChcqlaYueAc7EiQVLYPUskQHBSAfEmiVDNswhuxkbnbwjFhgN84MH+YpuYrbM
	EkcFXx6z7A5EVuvZq5KM5s8ER7RIVu2sy7nygDZrHZ9FZB5EdxU4pvLaOoOQ==
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id adf61e73a8af0-3eed36563c1mr4958047637.46.1794236767899;
        Mon, 09 Nov 2026 07:06:07 -0800 (PST)
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id
 adf61e73a8af0-3eed36563c1mr4957967637.46.1794236767237; Mon, 09 Nov 2026
 07:06:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla> <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
 <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
In-Reply-To: <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:05:56 +0100
X-Gm-Features: AclHuK8jpxK3ADXusNa2gKWHm_wiTVU05IoTbWbQE5kB1SpSxHfIgN3YPGrgsMc
Message-ID: <CAPx+jO-0Vmah=2mewp-kspV7Nqr+Ay_nnO9fTFB_TMbOoHJp5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6L9SEpVZUxh1_S_KszyvKt-mRZLma_ZV
X-Proofpoint-GUID: 6L9SEpVZUxh1_S_KszyvKt-mRZLma_ZV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX5YkLkIbJ0Y5q
 K4Gl45EDXOPq/TKoHJSJgO+9jSYXTT5s1lZArFeMA3Nn+PR9FpCl6ODR0UGATGHqMJ+uXge6NuV
 iHjWq4wdYtoVekMB+NwiiMe38wUijSw=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1e161 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=dNvpDo67dldnF-GfnbgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX62nr80KlwWjJ
 s8w/8wgCrB38lawowCQqnh9rhZOGTMNk+T3B0v/TJgV4GhrBKAKkdyAumGbswEp/6G4KP4mL+h1
 NWESqiCAfqQwgR85oZ8GvPY0D2L9BrX2RFgN0iEem2DIr8X5AbniLVDzZbUSeAWjzX4qL8UWuz4
 AFwoJ/vHXBoAVaychWFwidwVnGDXDO01aWz+yRf9ZwJFCV4oJaCbxYpF6jRRwIQXlmwQ4Q1vOpc
 2YZbhThDcTQI25giSYfL+E7wmQfI+o68YMLLBRzFCU9inWy85dXyIIK+h1PJB5ZPmNAZHsRuTSs
 LpfaXlMqG/kAHc3fT+9PRy2Wqbty+3147TOf+4HevoivWXXQXWqLBju/J3lbejRC3wb9vrUqeB+
 bJKpmDNzhSh8AoHp18mfOOy9SR3fGCq2u5iT5XyF4JWqInfqiJZ0wLijlGwfL/Mk4XdJZ+bRBcM
 Q9C6St/tPv5gpMuJuLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On Wed, Oct 28, 2026 at 12:48=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.=
org> wrote:
>
> On Wed, Oct 28, 2026 at 11:59:58AM +0100, Ulf Hansson wrote:
> > On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > > > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@k=
ernel.org> wrote:
> > > > >
> > > > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
> > >
> > > [...]
> > >
> > > > > > If that's the case, besides that the cluster PM domain topology=
 must
> > > > > > be modelled accordingly, the display device should be hooked up=
 to the
> > > > > > cluster PM domain it belongs to.
> > > > > >
> > > > >
> > > > > Ah, I thought that's the way the whole domain-idle was modelled a=
s we
> > > > > started this OSI discussion a decade ago with an example of CPU c=
lusters
> > > > > sharing power domains with some other devices. I am surprised if =
that is
> > > > > not the case already =F0=9F=99=81.
> > > >
> > > > It works fine today, I was just trying to explain how it works,
> > > > considering the use case that you brought up.
> > > >
> > >
> > > Ah OK, good to hear. For once, it sounded like that's not the case. M=
y bad.
> > >
> > > > >
> > > > > > Beyond that, it's the corresponding display driver that becomes
> > > > > > responsible for what should happen during system suspend. If th=
e
> > > > > > screen needs to stay on it may need to call device_set_awake_pa=
th()
> > > > > > for the display device - unless it's a decision for user space =
that
> > > > > > can control the behaviour for the display device via its sysfs =
node.
> > > > > > If things are managed accordingly, genpd_finish_suspend() may d=
ecide
> > > > > > to keep the corresponding PM domain powered on during system su=
spend.
> > > > > >
> > > > >
> > > > > But the s2idle and s2ram anyways suspends all the devices, so the=
y need
> > > > > to vote in for the power domains to be turned off. If they are su=
pposed
> > > > > to stay on, the system enters the state it can based on the other=
 votes.
> > > > >
> > > > > > The above said, $subject patch doesn't change any of this. It o=
nly
> > > > > > allows us to use more states (deeper), which are limited to sys=
tem
> > > > > > suspend (s2idle).
> > > > > >
> > > > >
> > > > > Still not convinced, if all devices are plugged in to the power d=
omain
> > > > > hierarchy correctly and the domain-idle states represent or carri=
es
> > > > > the entire system power domain topology, we shouldn't need this e=
xtra
> > > > > information. Having it make cause issues when it conflicts with t=
he
> > > > > topology information IMO.
> > > >
> > > > No, it's still not sufficient to model the power domain hierarchy c=
orrectly.
> > > >
> > > > These "system states" are special since they require additional
> > > > coordination in FW/HW, to take into account votes not directly
> > > > controlled by Linux.
> > > >
> > >
> > > But if Linux doesn't control, some other entity would vote and until =
then
> > > the system shouldn't enter that state. Without knowing that it is sys=
tem
> > > state, will the kernel be unable to choose that state as it hidden vo=
te
> > > is invisible/not tracked ? I trying to understand why if Linux choose=
s
> > > that system level state as part of idle loop, the platform can't down=
grade
> > > if all the voting requirements are not met. I am struggling with that
> > > and want to make sure we are not working around a broken firmware.
> >
> > For OSI, all the FW would be able to do is to return an error. But
> > that doesn't prevent Linux from trying the same idle state again and
> > again.
> >
>
> Now I understood the requirement much better. The core issue with OSI is
> that it fails unless the platform downgrades special system states to
> non-system states during routine CPUIdle paths.
>
> This leaves us with two directions for OSI:
> 1. Firmware Resolution: Handle state transitions entirely in firmware.
> 2. OS Intervention: Enforce the handling via the OS.
>
> Though I personally prefer (1), I don't have strong arguments against (2)
> now that you made me understand the requirement. Sorry for taking time,
> but mentally I was assuming (1) even for OSI until your above response.
>
> Since PC mode relies on the firmware to manage these states natively, thi=
s
> binding isn't required for it. Therefore, Could we restrict this specific
> binding exclusively to OSI implementations ?

I guess we could, but that seems rather messy. According to earlier
discussions, if I recall correctly, we deliberately avoided OSI
specific DT bindings/properties, since support for OSI mode should be
detected through the FW.

Also note that the domain-idle-state DT bindings
(Documentation/devicetree/bindings/power/domain-idle-state.yaml) are
generic and used by RISC-V SBI as well.

Kind regards
Uffe
