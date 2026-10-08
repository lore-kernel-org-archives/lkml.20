Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB313A258
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432816; cv=pass; b=pgDW6u7Vf2EP1nTvE89YQGp1ZxOUXjPs2KrQKzilzP3GYt0mUOLYKJvsYwS6PmlDpsCuaINGFqUEupZDtaNCwwd8m4vhnjVkrb4pqo4F6X0+GOVjdzqxUDxl6Azqzjh1LAGvEnNDjjqwIgPvQLurwM9rC82p+E1Q/ZQaCrp/ZQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432816; c=relaxed/simple;
	bh=7n8n5op5cfw35RUI8xfY6ZFnQUUxNNoloaYlLatrMvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4UFl5ccihujhqLAtyj5mt1SdjXeksrAecGxBo6bmf7ZWd5ARsPG4q9FGUB39qbaHEVC5w1Pjh6aZVG0pV/cAWE9v0fok/Qi51SYgR0CKTOYNd3r/oBDsxsDdEDLhtHmxZ+5aB23jJ94hgIjtEWpBiEbwB5RkdZtI38YIDnCzOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJP00kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdNda9TY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJP00kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdNda9TY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984C8r92146949
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 04:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=; b=prJP00kjzEXd8a0/
	+BH0YUhaZ83tX1bSGFz9j3BKLxAox5jjjG3dcT1WklGPwUY1PddfnfOKuwJA8bU4
	QFNOpZOgDozqIkX4ooV+2Wryc7+23YEqpIr1i90Fr36RohY06Juc8Q7cc1r79/zj
	eWOKNWV52TH2LJQdws1xqmzL25cd+NmX92gmYz/vArAeo9PQV8ME4qe9UTWMn+XF
	2yomndHqUEMVFYNgfiK/DTh4UDijVGgRD7WKBY9337b/VPJtYILM9hQSGzoeQlVj
	Uot5k/KNgIkKtVOjUEP9cuq/fwZNbzsTS92+AljK/1a2CIo/Qe6uFtDsL5sW5ZiD
	D1dyJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe810sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:13:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso33972875ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432812; cv=none;
        d=google.com; s=arc-20260327;
        b=oGY/sSdfQJ7OsK+9Zbb+1K03OR/8MybGn5F8P2BT29KxtUcqfpSY99e9e9OTqPxHnD
         VZR4qP3SajkeXDjfFAC8neK9ycfHzmyrENbX3Gc/BoPPElzGx9VKD2mrUqIw+A7X6F5z
         pLbiYRGZmaodo/hmCrZSNyU/No9wyJ53rAihtHKXKwJS5PklbIRvghWRdBRF52b+4ICd
         zyh+BurMO0g7HC9ed2eZ+m90LkD5yWNwYBfHesKuv0Mpvqaodvf8EstUFKVX1KCQgHc2
         z9ZoF0TO62cqInMOxRewaUHgUg3UMhjdszpwmN82MbJI0XJBHvQoxYc1M8ljabJ8TAhj
         zrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        fh=Q4DNzO5L560DHz2hbQhQeS15C/gvjjGF07+L5nk/VBk=;
        b=gCiUT2xmLlo85SJC5jNUdszi1R3j+mgbiDAF+7+pI8LwfjZMI9Xzxk+WQ/EpXq2UKC
         nPEGsMJKNGFEzbwj01j0wtujY/v5E+uTSNifuQxUW9W69a5iccW1wf6luAG43kAYRV6z
         2ZrLvSP31hDbRB/yqTQZ7aaOwXg7DL6DgO3Zj6uCDBo+oZqTDH+8onujiMQdytdaV5fC
         EL1uaifMZ3s6sHcpBPhfVqfkeczKhs/rlegJcXDOU6OCwOASmNOsE2hzh4dUaMbi3yl/
         /AmsyBJc+VYud/mJ+Yi1zIGnVx4METUlnkOqTwX5qLW93j1KQI8bcQdyDrlnSdgWs+ku
         wgNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791432812; x=1792037612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=TdNda9TYs/H9wnd6rL7daIb4MX+cRAf80KQcM1sgZlr6m026aFvoVi4/UYcwyjSAqP
         wzHEnWZQseuuPKMIkmazA69LslSPuAX99r75P/Lyi9r+v1PcrP1FReKjtuUpEsLrK4B1
         tNIJ8eJrAGD/3a823hS4EpoBaLDaFg4/EcvjkGA3f7AIQBJjN1xaMfuji+SPCDFSIiwp
         ZOAVZgkR4hiBn+kQzvoz7ajK5uzNGk//xVzApuuTVYkz7kdYK9r9ED9hCSxlnU2Y4oMd
         WIfaWlbe9FxBYWR1Kodm8YIkqpdSc1+Bxp/cCCPalJ+TOBHV+GI34k0vzeIRUwjnA3ke
         J/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432812; x=1792037612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=jg1ChSwO3c723YRXvlJ7Jpj0yZdTeQftQAEPgOBORRONXaz89oiswYBsBZaVB4b4n9
         N3n2p8dFYau+tBHj4otcKieOqIPeFjLT1o07CaIHZ/lLPwwXCIj46UuNIx6JR6q9XFo4
         YbNJ8BsM/U1hYj4mA0fqXNqtVYGaYyLLqkIQeN0pL6Q+/3w8BqSc0XbOu4Q/XQmHLEXa
         VnveEHB6bnSMoi2fhuA+pQKpqGgQTmyELCKt/bM7LHIe/PHmLbOh80V8DYveeDoMJKEL
         RHBM+z86X53lrRJbiNzV7Q8aYTps1L+oC7QerlCsY3ouhiPq43y7yEnmL+XbNJQx8g7P
         ZV6w==
X-Forwarded-Encrypted: i=1; AKwUvBxT4CDZ/iJdPmjH/bJu9M3lBsISp7CrFRzIeBNkp6bHx9llGcYp5F5XIFOXIvfM1lrzDMtYBkDS/tS3w4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaI8ZwRORLQhwnODbEQJVN4H2X2nKQ8fSOCGJ4FMonxlSzZTBw
	voLC0RyyK/0Lwy32S27mtekq1coqh0sfwRcMdp2ng155sW4hJuSFeYm6C8uCm8qYuqwOV7dNsoW
	oC9qz2/C59U7Rp5Y56TBQQNbt80LbDAcPBjB6PRNiQDD4/UAy2gXUPMBMgduiNKV0t6FlTBcqd3
	ax8Wl+/XpQmhiLZlfZm3MvW89POw4MCxIsw5b/9+wRAQ==
X-Gm-Gg: AYBFou2gQPOXrw66LvdiAm7hULJeAc2ZnYeKwRdtzOs/Eij4+HzR3rkA/UC+cYZwEEO
	GeVfQjDSyUhgyo9SfIy4ibv50NEMomlWCZt3xxQxxuYwqxOcSvcq7TBBzLglg12Cg1xgL3Fk4MV
	K1VacSwsS5led1kPmOX98T0eoJ2Am6m7C4CdAXlRxDfbUTeLqtFv1FIwRYcg==
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2e6003b68e7mr37860655ad.11.1791432812102;
        Wed, 07 Oct 2026 21:13:32 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id
 d9443c01a7336-2e6003b68e7mr37860195ad.11.1791432811391; Wed, 07 Oct 2026
 21:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
 <20260928-steel-hornet-of-kindness-aa5e2f@quoll> <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
 <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
In-Reply-To: <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:13:20 +0800
X-Gm-Features: AclHuK8QBXqkiOqYuICecJ7KFfILuZyxlgsMgUrPOb-9hebjAdLP4OyLrmMCzjI
Message-ID: <CAFkd8htKJO6rd4EnfjwZ7mANU4n18WMtBha=ZKS+UoF-4gT4ng@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX87rzyxR8zQyY
 HprP2vr+/eEFJoL1wuU41VXtkBz0Gwxy6wfKz3o+9jVj66/0GYX/cssE8fJe+IX4WxbbwZXmIBt
 Grs7mbzHtwbTYbkVKoJWpz7e6jDqvy6up75OqcIw627pRpFHt7KlqZupRRNvsgZ5Of6tulMIOGw
 OTsf81CrigK3Z6+PjDE2O7TsyxwKvOPVejCeCMo1ZnRR+f4iYEDTGNEsMqFV4EXrxzCCkq/ZhkN
 CZvFzN5OgWmw/f3XHc+0cHbw54g0xTO8QHjaEyMnGjTslPv2aSJ1/xqhjs2ujPLeJKgcZVvt6Yb
 OP/af98D/eee3/WCzQRec8E1MIjHtm7Qkw0ak9ZyBAIRdpa3caOQfKpUwl+G7b2spQSfQbri+nC
 5ke+l8gk5OwAyQRQiDbldjycoXRygAPIGtteKsls1V0ksPCPkopwZ/dk0yM9bpIZDYTV2whpCmm
 AJW7C45mzxIL9R1N6lg==
X-Proofpoint-GUID: MSCdEvZIDji89tm_8YTwUkqP0SAfbTh9
X-Proofpoint-ORIG-GUID: MSCdEvZIDji89tm_8YTwUkqP0SAfbTh9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX3CGaY636kG8E
 IR+qUDqIDA8SWM3EE4/B4XGMDxyXfo1U4ReEo+U9j5wyelpKyzoQU+CvpPpuQur9E+8y6xVz1jq
 P9ycOa4LbmaTmD36ah1CdtUBhmBfU9s=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7186d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SvoBQ3C05wZ_be5UkMcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080016

On Wed, Sep 30, 2026 at 1:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 29/09/2026 12:49, Zhangfei Gao wrote:
> > Hi, Krzysztof
> >
> > On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> >>> On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> >>> <mohd.anwar@oss.qualcomm.com> wrote:
> >>>>
> >>>> This series adds support for the Ethernet SerDes found on the Qualco=
mm
> >>>> Nord SoC.
> >>>>
> >>>> Nord uses a QMP v7 SerDes block, which is an updated version of the
> >>>> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The drive=
r
> >>>> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations use=
d by
> >>>> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the Ser=
Des
> >>>> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> >>>>
> >>>> The series can be broadly divided into three parts:
> >>>>
> >>>>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> >>>>   2. Prepare the driver for PHY modes which require different SerDes
> >>>>      programming and readiness checks. Existing SA8775P behaviour is
> >>>>      unchanged.
> >>>>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> >>>>      sequence and readiness checks required for USXGMII and 10GBASE-=
R.
> >>>>
> >>>> The changes have been tested on the Nord Ride SX platform, which has=
 a
> >>>> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> >>>>
> >>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>> ---
> >>>> Mohd Ayaan Anwar (3):
> >>>>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compa=
tible
> >>>>       phy: qcom: sgmii-eth: prepare for additional PHY modes
> >>>>       phy: qcom: sgmii-eth: add Nord USXGMII support
> >>>>
> >>>>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> >>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> >>>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 ++++++++++=
++++++++---
> >>>>  5 files changed, 219 insertions(+), 24 deletions(-)
> >>>> ---
> >>>> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> >>>> change-id: 20260923-nord_ethernet_serdes-c486f715f383
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>
> >>>
> >>> Good Job=EF=BC=8C
> >>>
> >>> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >>
> >> This has to stop.
> >>
> >> Why again adding fake testing to the bindings? You cannot reply twice?
> > Reply twice since I thought they are two different patch set, one is ph=
y,
>
> You don't even try to understand the problem.
>
> > the other is net, while net maintainer said that is too ealry for rfc.
> >
> > The tested branch is
> > https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
> > 9.24-eth), and may keep testing for each cycle.
> > contianing dts, phy, net and all required patchset, assuming one
> > integrated branch will be easier for interal track.
> > The dts will be send later.
> > Testing hardware is ride and rrd.
> >
>
> Explain HOW did you test the bindings in terms of Linux kernel testing.
>
> Then explain WHY you cannot give the tag only to appropriate places,
> instead of blanket one.

Oh, understand now.

I only performed hardware runtime testing,
which did not validate the binding itself.

I should have provided the Tested-by tag only for the driver patches exerci=
sed,
rather than applying it to the entire series.

I will run and report dt_binding_check separately for binding patches,
and dtbs_check for the corresponding DTS patches.

Thanks for the guidance, and sorry for the confusion.

Thanks
