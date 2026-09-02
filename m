Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE39420479
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342166; cv=pass; b=NoT17D+zdKDBJiUmw9IDECGq1WZ/afO7jb4E3IvftyBK5M4VUbSq0eOFKbRNAERu0yGu8iVsN5HeIySuAbBWyGz+ZoFH0yW+AzQBu4x37h9VHRwJ2ooFjmhiQS3LM12ScLwSSDeLMEZs1mBriNjIpEP7INjJoT0ov1o8pednvV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342166; c=relaxed/simple;
	bh=aWe+No8ZS19hz230sh2JorbsRWoGkguobu79Z1ROYkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/ULscfkUpJKWyXVaut37VxZ3oFocVPMwZRvgU9Vo64h78C/Ia6s8ovu9n0MmbHu0Va4sUo2BYY/R7pzr+OQJED0Fpc6ovLXD9EFIp0vG7bcJctARqEnWFWFchV/dShvq962C7P/g2/pi4c1R7WmguIaH8bY3QffCd02g/iiyMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEL+W6so; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5lLRxUq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEL+W6so";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5lLRxUq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829Mwmt1590049
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=; b=VEL+W6soir8eJes1
	BA69BHOtVllqXafA8ynp5/KFX/T7Gl3xJhtBesDN81kWMiizTe3IuDjE7mlvKU0K
	tWoH2QbZsGPyZmufhtS2WyrZqkGEp0kG0Ltfs9BPyOQvF32ukpmm6sD2SL1hCgjn
	WxckySLu1VMFbvmXXpCFdIbyAoblaC5CQg4UYvVaBVphVBJoZWNMVb3P3rAwKKlv
	xsaCWQVi+PyjsLUXFUT71R/ZEGOma3Inoxgout/EA9uFAP9ThFoadCtTB9qzzwok
	NcrcctZDzrdznAwRW/mfNjnyYenz1jUXNtIvchEz4KvaEd4gos8boScikaiYclpP
	RJWO0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy04pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:42:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso523880a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342162; cv=none;
        d=google.com; s=arc-20260327;
        b=GJS4pXG7nkPxH9lQeQM6Eha0O+l3HBPbz779egVJOBacPE/W5bzHcEYG9aXTxw+YrY
         Rzw4wFZbKhSoWogQXB/0r/ObYH9yrzPix07s0jQlY7oxolcGpzKl+LPXuW++fWDzAW/5
         bV1fH0WN/mTiSo1jOwQi9ZHGlT8FhUT3N0AdGutlh5Hj1J+T1yCRtp7kfOjujHGXQUZZ
         Gjc98FCC2UjiU1NB3wGy0GGVkNSIiAKKAUV0hA4xAAUY2hIyQbOs9oU6NAm+UHKm8/bu
         2hoiCitN/OdB5KR3IALfb2j82+NmTGzY1oW7FiEJXxT6XUnD4H2cNTP5RL29NMv3lTjH
         o85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        fh=EArtsD9Khwee6d+tvbj0NYVx72Q9JcEbse9ohJPBrlE=;
        b=Ds16zOyjn9X1WhiThBt0rYVF+oIABJdgdxZZRGzbhmAJKM/vCiqxd8dJKsMNgKzo4t
         rCBEM0t5ic6lGncSu2Ng71V0/pCHYWTUVlL04L3PnV0oF91nuMhz1WvaBzVpGFWGwh2S
         Kf/SXQ/JlhAcLo79CapGkfwdGPKjexj/nIwag7yGACKwdtLJVbac/gV1VRwQ9IIEGpBK
         KSx7/2xcOOFDhwXu1XA0v6k8cZScn7NMdFnbp16sFtSmipKCiO4L3/KYLIaVxT4Zi1Y6
         UepSYVRyI8qDvK0FFSXF60Zl919UkMPgFpnDIEJi9n831M0J/o8IIdRWg1qlzEXxkJus
         WQvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788342162; x=1788946962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=K5lLRxUqbN7Reyabz/FqxDjlgHkYe8l1/G1jI6gEtdOBEgi/l+SAN1CoEkjv32nxLA
         KqoAecs+2bxYBJKtLiuM9h+pmeTzeD5qI9CVznRN2iQfk0JQTzQeVTytIXWjrHX5/EVD
         lAi13xoLtURRynQvfIZDsTZB88WYNKmIbTIFt6wGkgrL7rz4l5kL6Dt3OWVwdBG0jJe9
         qdnl7xUD7c0lCdzYQA3wwTGOftrbjJEupx9MocVeF1wFrhWkH7zIRRpRlEM6TK2T1cRe
         wgRUjSSxdgFiNe6MsKSmBiM49qfWG6npVinltwclqyQbVeFMOpwzaH7x2z60dOeGseu3
         p9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342162; x=1788946962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=PqxJkTYQzMWB0thjES3ygJVxBbphWEZYpO5iMCOAParAhFbe7BLK1+J2+PbzR53ETh
         MlIt6xE0AIOF5Ulhvg4uT/gTRMmbNiYOqtbuoEbtaK72UebkxVWiArmbWLSLk3icn91k
         2sfZyap4hyrVNuD8OHH7Uzl9h3iXYUrjLtzbh7XRO2YsM8H+OfZx+FsOP5UmpndLiUYR
         7PCt55NU/q3PVsVWMg6+2n/7rwrb4ntnBf2zYEL4D0O0pJ7fCTgE3IldLNveNprGO7Xl
         SLBCiCGJDX42rYTD9fgt0NOeX1jDh6WgRgfjB9EK1ZhNtpAEcxiPhzSY8umcpuZyzPjw
         BS8g==
X-Forwarded-Encrypted: i=1; AHgh+RqQm/uzE4/GeDhVEe2wPSLXjYE6AXFjw5CNkRxFjIq8il3DT/951hAHaJJsdP6pGde+56+F9kFTGaldJnk=@vger.kernel.org
X-Gm-Message-State: AFuF++kHAgscpev7ZEoFppd92J7xGwPUlwHmYHf6j0ADkuFKwqPvLoLC
	BT1jiGqRwT29XlJxbOJd14x4VFCbDrNt259/lbv8ehRaw99pHCXgCkIT3ex31IoGFb4+GA+BS4F
	wSdLXgXFOXfUBGOK3KJICSfTmcGf1QTnoEE5QVB+6G6bdrvrBW4mnyjvGT5knOAJO6Vo00GkzGn
	sOqTpDKgJrUzEwDInVcwiSTuB3qZmz/Lef15s39RwLsg==
X-Gm-Gg: AR+sD129dG9kIvnkQUBjJqKT4h075G184th/ynDWxDmWPdz61Tz90S/EaEevpNUU6YE
	iAiOk3ByC9ufoq6AVItEfvfheqkHPqE/ZFtVjrJ+jc8LotLvxQkAc6M9L20rQ8hkXBAQeuXyxTT
	nMJihpiDBRnVWa3f+1LTu8uaVeO0kvNxcM6u2P785bjRf9yv0PfheKnUchQQ==
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3d9ad268503mr5043427637.2.1788342161547;
        Wed, 02 Sep 2026 02:42:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id
 adf61e73a8af0-3d9ad268503mr5043383637.2.1788342161086; Wed, 02 Sep 2026
 02:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com> <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
In-Reply-To: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:42:29 +0200
X-Gm-Features: AcwNN1WALDMALJ5RAAfaqSF_k5ijpG9fT0E4A-HNX6PvS4KOXseUtPzRxqcGeEM
Message-ID: <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a97ef92 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VllaWavPb-a1161Ruz0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UVOtEu6p7XPSWVQvMEc58vw0xlTjoQnw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfXw0foESKQth0/
 J0u1E+YZS7187Gq2lpyXwGAoSgpNK8OvfClNNcBJnIoXbZEwmDU4ABgeJ7TxcoiQ/hMEOUdmths
 nQ0bogm2cwP7RGARwBXPFqCfCLut2YM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX8OltbByevRAb
 /iT9i7ekxYmeRGBFj7rmFrLYmOINl7f2pDMknAQC3PbFLj+nGLfs7mCbfoNcuo6/E+r7OEONEeG
 mTMD5PUWx8SiQfrhA1zL8iPue/cTmXg/Qzl7nn9A0HUZeiLdR+Fwqx69qCeNPgZCLw5AFd8y6QN
 RpF8Vp0KUpwDsc/4aFlz+kY2TUo22jLi/5RTo0rDJkHtRLPmJnvFC7X9dB+Rn5GH2wLX+xpVzH4
 drY27d2sMwbjepl1t8+6hpUcU80Btr+W9Dg2AHI8wxewnfSjgY5flniaa8XhQgjNJVnQ37WPTKT
 s7uuYZime80qZl87HYAQIs1bBXpItyygag5T64g6z08dXyZhqdH1GM4Bixc5WTnMjCsZ4jrzH46
 5bYAZJprCPYiPEyddPYBSR9XqQ/WgZKqaBelfKlI7KQmF5NOSCWYQDy8kCMaBRTDWzf3ZmRF1Qc
 5FUfCyC9FRAghDrKyww==
X-Proofpoint-ORIG-GUID: UVOtEu6p7XPSWVQvMEc58vw0xlTjoQnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020085

On Wed, Sep 2, 2026 at 9:52=E2=80=AFAM Shawn Guo <shengchao.guo@oss.qualcom=
m.com> wrote:
>
> On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> > On Wed, Aug 26, 2026 at 3:55=E2=80=AFPM Shawn Guo
> > <shengchao.guo@oss.qualcomm.com> wrote:
> > >
> > > The Nord CDSP subsystems do not take their memory rail from the share=
d
> > > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > > power domain table.
> > >
> > > Changes for v2:
> > > - Drop remoteproc changes since "mx" of remoteproc is just the name o=
f
> > >   memory rail input which can be wired up to NMXC power domain in DT
> > > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-she=
ngchao.guo@oss.qualcomm.com/
> > >
> > > Anurag Pateriya (2):
> > >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> > >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> > >
> > >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> > >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> > >  2 files changed, 7 insertions(+)
> > >
> >
> > Applied for next, thanks!
>
> Thank you, Ulf!
>
> Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
> dependant DTS patches planned, so an immutable branch would help Bjorn
> to resolve the dependency.

I am always applying the updated dt bindings to an immutable branch
called dt. Allowing SoC maintainers to pull it in, for the purpose
that you just described.

Kind regards
Uffe
