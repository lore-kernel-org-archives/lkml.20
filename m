Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500119;
	b=NEyYWug5upsNGEmx5pu3n2u2i3N61xc6G9cxjuithbHlLCr4/Nn66C1nSPK83bPL6WFP
	 54p2lmVNX4waj9NDAfL8b4t4/BcE4X6bP3zIu8745lmZi9XFWdCZW8jsFtRKslZDubgrU
	 LPhGK2oTBs39tN9+gXNQQzB4JnY0IUPJTw/wTdLI+dq6AzvbsL93kahTyWOYdplM+FdOe
	 wNIBpT7oHeIb9lez30bi3kmH8m5wU6gqDQf6PW1pgXeMwKRl0oaG64SXuhG9AYtv95inp
	 zxpggJpQwWt/kPj0y7dLLox+X2gxURqCDw6p2tO6yEMxEiALxHDwS7cBKueXH0Djthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
	b=fRw36cG7F7vdg++mhcIL8o7sAxzdOIYZL1j9iRAYlK7gHTB/w7DY7r8PPjKNbHcXmZ03
	 ud2iMU6G2n12pTWInYFs2L4GBXAhpYZBeJuz1ISyAsJtB7DrpBNm3Ep1o/lbZpunFR6V1
	 Qi6tEZ5ZFkzVEs2QjzHfG5RjT/3TvzhmEyAYOY1Y/2Jmf22rZSR/p5gHpTw193uxo65WN
	 V3TdcZnFj1TPpQor0IV+vpqgVVL1AMMnmSn3J3X0sQJPQezhPvRjmf9wPAhpMI/vurUOC
	 HkI2i/qatSBZQnwI5GklF1jxRPuTAxM06DOfW49qiOXejGf1R0QYpBabcPmojXXbI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10BF606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10BF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx29S599715
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=; b=dmMPfEsxr3Yvy9mp
	lfVOSRCaeoTcvPMCdqQbJNOz6g6NgYX97nh+G/FKaK7cQHYTrxMdU23wImycdA76
	3BiGTVYNxcZUVS/E4fUiYC8qVD45jf005NqkRn+jbb6dS71+6QPWvqSMouyaVmXo
	hxQ1xRELTI2TDYmuhwUPUPKIzsj+b/DilaNEduoAMfiwC8/i+10Y4oZAtkJRBS6K
	D4k3zRPU9I0q9aifNPTi7DPaZgM9jQmxHCKgeMtdCXsg/dgURLSNDgUQ5/GdU5Xh
	iEhv/mVEloKfvTjhKWbTuwkwIqjxiO22fkhX06D17EVXVv9dm/ezi3lSvbq7sXAo
	nDJeJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2fcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso441788885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500117; x=1793104917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=NXpNaWByqK4GCgMHrFUI5saJSihBBt3qUPZjXUi01qGQXJLE2zS5RoqFu3zzQcMnuE
         7PxQJVPsShln9ZW4eOGzdQXSXB29/Ugi7TkAll9TALmOLDRjGFfibLycnEBG37AecT1L
         u5zSuShpcpQsGIX34FEy3lH6MGfHiaZq5BZjHn2a9O3uyF/Ntw2cs3TsryMHr4KZbC92
         zByVjrvuxGrE4A711QIBhs7IaIqsUFlXHfqMm4RU8ZP1N5tWAYdYD+G4UKxRWxkA+L/9
         SdztBuz/OYS5JSgqxz3JWSxvJKEjdbAZZr6iiKdcl68hYwHcA3qayzunprHb4V5UzwgM
         o9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500117; x=1793104917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=lf4CMB/Czuzd7lWIzsCZCkpMxYQ6x0MTBse37UnuQNivYVs4cwr93Kq5boHg5DwFJ8
         VBmu//VZ9S/KQdu1pbnukae+67TnjkpiaRXWgDWRqSzi3IxBbTXXio/XxxvMmFfOwHAm
         KVB8fjQZe7l4c5fMvOCBoaQR4n0OJeWzjsbDanOYXCgA2OHeDm8I280kXi+gElQYS1Vz
         Z/LMkFGRqPSvwOgdwwWsNULBSkVqNfkjrb2gru1UxuAYSZN9L1co8EfyTSZQIVd7kkA/
         /ELANwwOE/RaLE1jQWaSPeyTUJU7DiCMJISO0EQP5WdlQXOjm36vGr/0tSdgbh8xFh10
         xT3w==
X-Forwarded-Encrypted: i=1; AKwUvBxgBBIaqvGS3tP8mrOunaHh5nTu9DZjoeid7BXF5nqKB623H/RPnacFUNeJQW4APWMZbrSTytOMFxM4/Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcUNoy825ACGSuygfgTd2nWImuC9EGtZkkKz+h1MVcUbNCKaBO
	17HLfHNgUGH503HShwyvklvJPJdcCOLdV063MVON3JKyP1TkJ79jxClEcaBYr4Djs2MrfYmfHYI
	JQgqeX2/bQpD3VNyxEa3VptvxwX8139FeVmkPSbXABgpqEqLepS4l2yT1J1cVAweUCBiYKut3FH
	Q=
X-Gm-Gg: AYBFou0QaP1/0buYMpUiFmLIFGWRZze4R9q14hN3LPAXDhGVcu0fbOH9LpCFDS2dxAi
	taJ7/PX6Q+vyL6jTXfjgIBlC10nZKikI4awI+ibdfFh9oCB/FGvbggHqF0E3eIbu7KBmWZL9Z4C
	BEmpv5mCIIwAkl/xJx4/WJuTRbC8aVyEP+HTgO1e4F3YMen3dzyR9Qm7tona0K86fvAxiXHVMc3
	5AIRURi5td75c5GnB+1GBzSgFTz+LvqXbs+04BYQyLA/tEqBF19XiunraDQhGqiypKNuj9PzerV
	EIgcsBull7K8uyuNhyO1ient6x97dWS0eDf1mBB7yiHJEsay8FaeG25vpwjvBKfCVT2RYU0KvQF
	zeTftZ0GCd+PaS+2N
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660119585a.5.1792500116887;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660113385a.5.1792500116235;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd482bsm69803725e9.12.2026.10.20.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:41:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:41:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad76196 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wx7Y5S4uw_J0ShrtzzkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXzXa7YO6XrP73
 +7ERWbvkfW3Yt3LLQUIiR8O77evkyY9sjIs+3tdY6PhHAkxfH0LOSFcc9pN3FhmiGzg6ElOl+s8
 qpqZXfwcTtSYzSCcxbcHsMDKspTzrXw=
X-Proofpoint-GUID: 8CD2NiPXUZsbFyAOC90ClYvuZHQmk482
X-Proofpoint-ORIG-GUID: 8CD2NiPXUZsbFyAOC90ClYvuZHQmk482
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX3pVkJ2C4B7R4
 rSXhs6c+GVxOBrWX8RdH78uKg1lbnS3EG9G8fmXmvRS07ued9A5KJ++vemFe5d9Y/5gP0igTuAw
 tBHMP8meE2fW3GmF00hFmR6fHfBx6BWe+O1C4sa7RX/B61PE4KF1PZjZLJOQXiLgZE8Dt7VJfon
 IvuMbnU9Vpzqmj7U94JsiftoNCaEgNSoWcWsB7456OScFeHE77nUNmKaDY1BlkyD4uLYPm4qjrY
 7In1k1mOU+blmEYofhr9N1HDD/aj+KvfNLpBB7GssolrYT2M2bcLFpZ/ItEB/abfRJxIH486Qoy
 bn0+ckAWWyqE9A1v+0sc09m7ibQEXujMWKMJCY9PoJpG8ubjVsd+HJNnAZI3p8JzNOtmxl4n+YA
 zfErimT2JxwuNVTXRB0xr9xhQyXoxgsr2x4DuwQ2vFtDyMHjZMkRSx3vsxmrIWwkv0W8lzMicjR
 XR1ZO2OKxuqR/unWFHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 26-10-14 14:09:04, Loic Poulain wrote:
> On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > >
> > >
> > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > gets stuck off when powering back on, preventing the system from resuming.
> > > >
> > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > state across suspend and allow the system to resume.
> > > >
> > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > >
> > >
> > > Hi Abel,
> > >
> > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > collapses.
> > >
> > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > >
> > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > >
> > > Can you please try if above changes are helping on Eliza also?
> >
> > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> >
> > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> 
> So should the retention configuration above be conditional on
> CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> CONFIG_HOTPLUG_PCI_PCIE?

None. I think QCOM_PCIE should select it.
