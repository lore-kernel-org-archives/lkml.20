Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3755511180
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678996; cv=pass; b=EzlkDSIG5lRkPVrg9tt8K72kYIUfVk2RZiMORNIRl9M37XFC/bWnU9n66FJb7O0xg2l+fBNp91u8FVquyg0TxjNkl/X14E/ODr6Q2mIsn58uaBspuqXeHlpGKNXOGXzuqcgcp/Nr7O1koMVh8luM/YeKOTnDIONILUZpEDUhh0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678996; c=relaxed/simple;
	bh=jusFXHQSwUzPgCyWA+EDUN4R6SZS9ccq8vL5Y7+Dcrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxwvX/a3O89D/gyXElDYZQsAWM2rAlaB1tCVDHVQwUXQc6mSDWUROCBg3EykCW0UX5+ye9MLbkDRuuMjjfDb0q6p/7a4iz2Z6EqDAUeBLOncNY+KrwC16FsjyiJNOlFZR+uoimJb6mAl6g8zoO021WPD/k1EFF2KsjmnZGje+2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZw8GiML; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aodkQ8; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZw8GiML";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aodkQ8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj5NU335116
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=; b=pZw8GiML1qPDPMG5
	zudI4T4YM5tutdt73UHz/FWZPCeXfJuzD0D+1vH8Qo5cGNTtiX2l38i4M87uGuNa
	i2uhFjwGrtNw5AwBYbjvavIJy6VmWAGu5E2+r0LK64WSKWkhGay+M+UaRcDnH4OJ
	kj7RtBfnzPWocfT+Sllc8cPinbhkF8TIeDtgRbEIZaV1HYQEok6r0E0ttsjTs6+9
	9lzsU+9Ike3iqnqTqLaqPPiZAXKGo5S/fJ1NOyPlaYyZWYOqpLcX3ApIJc7F5yhT
	oyQFdwrjnNUXYJtAtSdQGxfCqD4M9dNCQlH+X5IWRi+1qLHLG3Kjv361v9EB/kin
	+e8hgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew21r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0bcf8b74cso4225028a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790678985; cv=none;
        d=google.com; s=arc-20260327;
        b=QDtBn1PfuBNPx850sLUmujmUdSPTZ1vL4f8X0FxtlclYk1QIN1/e5bKi/iTAkfYuJC
         f6jwR0f7lSZOYyV6k5h4Ze3HFC2tsqaR5iGB1nt+zPt5VZbtoZ0+7DBkjf28xaLTGVrY
         xrNSbC03aVgkr5BRQuDSK4VMqjzWde2PObbwbemJuhT9L71+iAi1nbULcA2Qo6wkPBl9
         5paZ2LJOyvzYBzE1yS6E3iJqLn6EjKm455yGRAjHsM5rmRIau4dc3n3MAmioxpMQJzNT
         dYyxw/NmKAf/d3RYCg+3Ya5DBGbyaNBq+9zk2x1xKRMI7D0um3Z36QYeWYuP4uCehgzU
         Cbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        fh=KaSV0dG0rHww+xPr7q5Qv4fYkHQXbUHq8stfWdXDzek=;
        b=mDA3Cp5FqAEVj19bVsrF88rM11oFtBwGoey93MVlu71n6tHudP6NQlbHvGinHwm9/g
         WnAZ/P8cdLut/j3twqIuIzjNFzlSIYoaqJeomMd0LT7glcegXdHIc9iwDLlayScmlEqQ
         rrrQH4q69FbXijS+H5QZakC4KiTF/byjTK+k6lMFAyUeLmUYYrGISZSTulVhbyCvrdp8
         Om7/rwx7p7wUSoWVLzXOXZKs2FOIKOeoq/mLZOgkmoa2xsie2juikmQK+L1NXM+XbqN0
         eAKWttnaaP2YtW0m5G1nBWAut7jUszhUBa/NP85DJzkWYVtXL4xRmMqTEpz6MIEEDIII
         ah3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678985; x=1791283785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=E6aodkQ8wUIcr1wK1BZudsL1lp32m9PKLTzilkgA2Ez3UDOitOQjLbOtlfPKOkQn7g
         nzWRKg42ad6NesEHEy0xVoX/PhVoM+uWIs+JEfZJRpKfVGDJzmm/3jc7wGRqIFV0bbWz
         frgNF6gw4sbkAnCcMDX7outD/K4FltSqbOAPivskebx/JRT5Q6U/cuJ779Kn11gKj4jB
         ZQnSnmqUFBWfW5hfvxR7GJw9Wtj3A9j5Po5g/GLfcdkXPHs6nvzc+3cxqnE+9YfddZWk
         tHaJha3B3WG0xsUhV9TxZmJhjqVBlWZrQIAeGNrrF7D1/58/+Jtgnsg5BU7lSqiQ7y6P
         sVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678985; x=1791283785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=nIj92btUQpxzsDdSt1NyL+hWDhj5raNltSs9fs37wFwD5jS1FveBVnK00MwDVU/7vM
         ylPnmDatCSK4egps43vqe3fArZHBnDqv87UbP6815zFVMoZpm8F2Rssrbvr1TvjETt9X
         JF8PBtyOerJAhbCVTdrmp037NGm/OSElY8hySWKJGDXU24gj6Vgq4QgGh74deVu21hN0
         4GrcOIk1ZdEkkOJuViESUsJtokvOT9K1ICNTSGhqrhpV3MYNxlOFTZLGhp4bSz99Ikg5
         64Ie5616BH2rvIAQmcwElFoVdmPhBXB73M5u2sltoWOc9/NWZT4Da6CL/2o418YbfYEb
         84Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxMR3M9lpBAYx8FyeCRT5KZr4gwOmg7au9Z4fdoIRw/auEakMtCvxIw/6Cxd/jQDtTRCUg29Epybgp12b0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhHiHJHMM/wVVO3vdrROg73KHO6mp+dv4gAWUI2LCq5X5SHhdT
	2Nm84WHwdUn4IXD9JX1XhyAy+Bu6cxV4yhJbDxUX8lwZlri2A2jkNaHtZjNjtebCfs2ophs3c1a
	IuUn4GliYkPnt1kOWqC+K+ZFlxxQwgUR+99STTkOXNPsH2MTgXzQguOxXF/NVlUNpMG1tGoFHuH
	+Z3/s8Swqp9FGDE7Aeank5xPrP5ikGyOvNjnWyY2s/8g==
X-Gm-Gg: AYBFou3zazPmfkK/74rnT/BI0j8kLnsrX6rXdGK908y3MZzud6531rKvKd/OZk224Zx
	Cm3fBW0tHj80LXoOA0qgMhMPSXvT/fT6o5x5fzdxvbz1MgMvdCbqp3jO/opGWrT1Xd6tkJz7o8U
	+a3P3Cy0CQJx/Q8pY88ZRMt1QnDrTsvkM/NwHAVxnlDRZ3OX5atEh6tzb3fg==
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id 98e67ed59e1d1-3a0c1355d67mr10311386a91.27.1790678985362;
        Tue, 29 Sep 2026 03:49:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id
 98e67ed59e1d1-3a0c1355d67mr10311373a91.27.1790678984858; Tue, 29 Sep 2026
 03:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com> <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
In-Reply-To: <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:49:33 +0800
X-Gm-Features: AclHuK8lK5qr26yCIDEnhIRFlV9znH4XanXV1TnOvthhB38ZY0UIVpeLTmtUFHA
Message-ID: <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX7hZkpYno38Ae
 ma2kWHoo8J1b2hD9WFHpNrUMx+V6tTrjZgiz84WqzSxinhFLdOH0lhR96EVdjhnFk6OwdLXdnit
 rEzWLwz05ewGMX55osbdFOPVZzp+0XM=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb97ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SRrnDWHc4gHVzc1XPIAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfXwGgLOllmcWDD
 spfGER4YrPOMmGIm2nx/tVr+FYZTznWi40xEwG/jfLRnbECrJKwpTD0CKnjBoue7F6brs1mdY4N
 RAhafaxCoJe03+BIsugQPDYB0u+RxGazmEBLGWcfjEmEg73zGXmZmbOJKiWU/2vvKXsaF7Xun6s
 xKO3uKFJQ1agpeoV2uxBmqI2vXhOU5Ef7y+4rTvxtVsWbEqv7SJNpzX/PHUd33PfoLT5RHgqx2O
 PqokYR2K/INXbJOi9AEeGJom5UM89h3bclS3Kty/Xluc7MQztVX9UXzFPj/MpGxDIdlqU8Yd6/T
 baPwczeM8lhaJq8l2kuxxTPg6o0YOctV7GIQPx9lW3daNFVd8M3Kk2HEIJxx1wl6brOGLB0U+yd
 kdGU/boiBcIik3oqrnNLVuVTJ83jne43btAk5amOchZhBFmSLi40Ms/wNF7AkFAZbV6mVLHbTN6
 dOEpfDrYNNHCPnkrQ2g==
X-Proofpoint-GUID: 8T3_JT-h1fozsvTzUgSZaPj9OSJZHkNi
X-Proofpoint-ORIG-GUID: 8T3_JT-h1fozsvTzUgSZaPj9OSJZHkNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290043

Hi, Krzysztof

On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> > On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> > <mohd.anwar@oss.qualcomm.com> wrote:
> > >
> > > This series adds support for the Ethernet SerDes found on the Qualcom=
m
> > > Nord SoC.
> > >
> > > Nord uses a QMP v7 SerDes block, which is an updated version of the
> > > SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> > > currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used=
 by
> > > SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerD=
es
> > > to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> > >
> > > The series can be broadly divided into three parts:
> > >
> > >   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> > >   2. Prepare the driver for PHY modes which require different SerDes
> > >      programming and readiness checks. Existing SA8775P behaviour is
> > >      unchanged.
> > >   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> > >      sequence and readiness checks required for USXGMII and 10GBASE-R=
.
> > >
> > > The changes have been tested on the Nord Ride SX platform, which has =
a
> > > MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> > >
> > > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > > ---
> > > Mohd Ayaan Anwar (3):
> > >       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compat=
ible
> > >       phy: qcom: sgmii-eth: prepare for additional PHY modes
> > >       phy: qcom: sgmii-eth: add Nord USXGMII support
> > >
> > >  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> > >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> > >  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++=
+++++++---
> > >  5 files changed, 219 insertions(+), 24 deletions(-)
> > > ---
> > > base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> > > change-id: 20260923-nord_ethernet_serdes-c486f715f383
> > >
> > > Best regards,
> > > --
> > > Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > >
> >
> > Good Job=EF=BC=8C
> >
> > Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> This has to stop.
>
> Why again adding fake testing to the bindings? You cannot reply twice?
Reply twice since I thought they are two different patch set, one is phy,
the other is net, while net maintainer said that is too ealry for rfc.

The tested branch is
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
9.24-eth), and may keep testing for each cycle.
contianing dts, phy, net and all required patchset, assuming one
integrated branch will be easier for interal track.
The dts will be send later.
Testing hardware is ride and rrd.

Thanks
