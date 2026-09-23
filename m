Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70C4718DE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153898; cv=pass; b=oiUlkmsIGCh2bqM41dflsEVj+P8/fNBOqu9kTMyjfqT0kZD7GibBTDO2CLQouZdYSseOUPiH7LsdK8UWGt9hYyfEXenU19svHiC/SVKOCDzCcxN6FoTPU4mJgjR+pWJf9ekkgdScchAqqcWUARDJu1moO2e/Idud6yg/BcFfaZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153898; c=relaxed/simple;
	bh=DEdHFyUqhIHwdMf7dFxUJr1GC4MxdyoPmBAlHWHF1Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ndd6uQbtTwQkZhsLrwJZW+1idRH0k8DnPnxnaBbSpNxYl4v/QsdmNowCO7gQsfy0lxdL+d6y+lshe2ZI9vUczxLElOWWiHdERAy12U3pUf96yxBSNU5YXTwlJwervfdoMd5uNKcz+K9gvuAxWjh+mhT2cAg268jAzR8pLIiBhYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAgNDQsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zups68E3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAgNDQsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zups68E3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jf233332811
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=; b=nAgNDQsgCam1E9vo
	/wdMED5YTAXYJuHQlykJJd6Y9Zeo9xU6nHLShLzRpnnoAn5lNOmob2t5y/nd+aLR
	LhLWnsMc7HtDQsKsfmdI86bFaNm0JY/NWXMS3VzayZfrJcrmBz+hbkyV8tTDj9oc
	GOiYCUg+g/dzGEpWQP/xHWMI7HjwOc0cfEufmHPWHLdqYva39mRP970AxXbVI84c
	tbr1WEzgoMYp0STCjhh92fR1/IeLPvxX5vFfy1wSULPPO98LBGtqKSIhNwxlrRP+
	refRGJXR16kNqtATzvqHci/H/vqrZL0B8hS4jjRFXq2Gi6UuEhBMTaEMA1TjcPwt
	6Z88Ug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xufwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1188159a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153894; cv=none;
        d=google.com; s=arc-20260327;
        b=frsoEl6EKoL7wzy3OsCzVuMYpZOGQsQK4Gt39vXxuZZrx5VTuF1FFVHLmKNhTCaov2
         r0I7LLf0aZZ96C/3KwXaUZeDD2VmgDt5eEbxfRBUFBKpjaaYR5T21lPuyWTm9E2iY6va
         Ox/Lu8kP0vd/dXIxev2EAYFCcgWOqP/dsuaXrat1CRdqKH97J5QPlT98syMTOG9I3jKG
         ABaRkPt4O2D8+GjmaESutRdI1Vm4lkVAwBtt0j6Qjyokn8KZgFuGIhGnFfmAnAAmDHus
         H6mijpmK3AZB1tEgxxJpevIDC3KHffX75JRkMa7ecxpdxVuSxG2J5Tuot4n1c1woLv70
         syeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        fh=vrqTFuSWBdZxvhQbknCUfdvEA8UumKU9O37ONk649rk=;
        b=oToZunFQmbeYNlao39BuAGlMx5PjgrafLPtT2zUP5IXJEE/TMOuAX4dAhn4gyo+8lL
         Ww1HDYZ6MkXpoBcjXSY59pr/3a2zub3Ss+BiFItVpUxUNxWwfLg91pyHven8aMeg9U6F
         IYr6Pz1sKwLdZE/I2004W/vMxiBTCImUpDl7Nfgck3fyFmatGBW7c+bFhYgS3uOA8fUp
         D4hutAhiS9G0SLHv0vnQD72mPtDMBxRrtYx/9cq+GTypXA/3vKiiSfNEP5LajO8ZVWst
         EIdIAjLUsl4MuZJHMIkNhgHSsDxji+clJs96SZG8paX8lVNQe+hGFxL/tCbRUocKA/QU
         0sWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153894; x=1790758694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=Zups68E3q1jNyjytFGssUhDuSHLhbe0gUKxrmlCgaucYE4iLzmdhed+HlxSvnPfdx5
         Sz4W/W7n0asjV2oS8I+0+iZVXrosUzSCOaLHAEpvy6nWfxlMEmbo7BOqZJ8rEsNZKDr1
         ZPB8zQm6+G2Islbc6ZnrzxNj+A7iBWEVz0Qx9+Visk9ocCpZWPSk8uPknsPlf3N8ySJ/
         Iy7dSfXgCf0ELasUKtUyXu+om8hcYfEylY+Kx18GxVfsrT41r8TMfrKpSHaGY2SW7nYR
         I5N2qBDlMGSGdPL00YDWIZFJO/QY7SBg+WhXVC/ZJDy0esBILEp1Ty7vYCSKUQcgEJS6
         W62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153894; x=1790758694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=Jy1nb8cRugg+Ed2aWcol83pEZMQxMsHhi35FGjt4HjmGjuXwyDiHAj+YO8WUjCOcx1
         mX70kVBztf1JinnJ/TrSa1TNBvsbsYz+5NX75PzAmvighIsSG0JmW7RUcDYHWesVpsVk
         79g3onwBdv/HpU9wZt0A7aZLhp83KCsu1IEvaDNfPgAQ0FUkm+30gXdZJgqnSYurCFkF
         6bsHIsrYPsmbeWaOSQFE1Fg6i9OPZngRF9QBRpWBEjF0h9W7I5ECl6JxDgCPzvne3Sgd
         czdTyG28mBjC9BThPdn1a/3CTgmUlrfiqfHx75AXV2mFFnn5KtmDiLENIhzKjcMse9k7
         uaVw==
X-Forwarded-Encrypted: i=1; AKwUvByraaJgfzwiPWpvHIE8xm9IYIPnMTxr754kP6q+4D3lMeCw+f4l8KbcUiqO3MyAGbhEftFQekKYuWFrohI=@vger.kernel.org
X-Gm-Message-State: AFuF++l4n2fg7LHDFNdElNnmIuAKfSNAvEtqP0eY/dYRyuWjmtSMMd4e
	eDqOZY/4ff9vhHR4gJANmYJaWem7lDyUZDbIDl6G62li6lmjCGv0ylVwzpeaFcuh0NFmNEtApHk
	Wvg3vm4q+Ia9uYWlMmjrStAuFrUebtNoY4kLEWNVWuU3tALVP6kpGpkfOi60woJZiq1cON4QQTI
	Ivovl8w8h3ER0jOsH55+RSdYiQcYDaQIgMrbRP6TvGJQ==
X-Gm-Gg: AYBFou3vRYh2OsffTjAOrCvSNfhnxENXelMs2p+zG1K8hmlcSYAxUDL0DLx0EIewg2N
	Nqskjoi8XOpicDbZ5fPwawbIMpzmS6wpslo573FzkMYJzNWXFgyPRhL8UPKgzhFfAcvrXEkcaMZ
	B6jAPZBrN6qCpcL3taMXXYiavZuexYCvV1AqN42PBBfPdjHBRVi1QTMtSeBg==
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df69d1ae2cmr17991745ad.10.1790153894474;
        Wed, 23 Sep 2026 01:58:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id
 d9443c01a7336-2df69d1ae2cmr17991615ad.10.1790153893999; Wed, 23 Sep 2026
 01:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:58:03 +0800
X-Gm-Features: AcwNN1UZNW0WwmsWNc-3C7OHdDr5-ws6w2MX2XvUgjm7pentkYd7E7-hxDcU_-k
Message-ID: <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
X-Proofpoint-GUID: BtBUdLzJ2GT1D3fKGQrSnSs4yxIHwQcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX7aOKEdukk2Lz
 yDdh1Ox+C9DZhtOw9N+g3ovi20/ZEFrZHpoJmFXhbxrL0FP0xamKHWtvm3+gmX/80v/EW4tB5gE
 R5TWZPilMyrDTGg0CDzHMTxDVNYtvBU801tV2BzKyLAqRmcwEIgUDS2UXS2IxgFvbCpZXuhA2Jz
 m5eAzftLsuEaFXBE1+b/yWeu2Ag4scgZfV0/Ei5bs6dLONcHhmc1NJ246zTJqtZKCQKvr0BbqD3
 vPdMvAkHg6gPC8r5bZEnZTQBxBRQCbQaHQ/g3iWr2wJIIt5B+S9THmojgtnUb1SJykJ4GmsRIfM
 VlUdapkKlUmvFetNS9i8kTu4Ohm9qBcL6GW3xfbDBzeC+UOVGLn7K85htvjYSd+rWEHmjp1BRuC
 GQ1HeEEB3zihH2EiqZ3gxKTIvjOhf4on/qvwbGcV7akI3T4Ye+tfnTBLDS2Sp7N4m+N+1TSuPkC
 A007WJy6Q0kgYNAh5FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXyxM8GOl0ibTm
 0dLSgr6+YzRI42x088bOnutSSXMFiRkguavqevNS+KXSodOUKTlvt+i9+3DQ1omM8vphoEsc8cJ
 bklXnjnpaN+LNBwJUq3I75rWvoxOUFQ=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab394a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=mh0Q8UrwBuG3fYCamwUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BtBUdLzJ2GT1D3fKGQrSnSs4yxIHwQcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> This series adds support for the Ethernet SerDes found on the Qualcomm
> Nord SoC.
>
> Nord uses a QMP v7 SerDes block, which is an updated version of the
> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
>
> The series can be broadly divided into three parts:
>
>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
>   2. Prepare the driver for PHY modes which require different SerDes
>      programming and readiness checks. Existing SA8775P behaviour is
>      unchanged.
>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
>      sequence and readiness checks required for USXGMII and 10GBASE-R.
>
> The changes have been tested on the Nord Ride SX platform, which has a
> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> Mohd Ayaan Anwar (3):
>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatible
>       phy: qcom: sgmii-eth: prepare for additional PHY modes
>       phy: qcom: sgmii-eth: add Nord USXGMII support
>
>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++++++=
+++---
>  5 files changed, 219 insertions(+), 24 deletions(-)
> ---
> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> change-id: 20260923-nord_ethernet_serdes-c486f715f383
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>

Good Job=EF=BC=8C

Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Tested on both IQ10 RRD and Ride

Full test patch is in the git
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
