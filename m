Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19979377EBF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170294; cv=none; b=ISFUHgpeLvndGp1djM9tt9bhX/ztEnUn/n9QZKSGcYEI15GHxVf9BM4Bo4GlvVFthx7/JaY+C0dSsxOrbEJ9/vOi/igHFDhI79uFu7kQbXDBbVSbsNgaNTs6C/GylyZWJmaU4sJyIxvjPIPFcF5AScWXkV/wBY+E8GgtzUPK8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170294; c=relaxed/simple;
	bh=ASCO0Lh4SYfqFZo+QWVw9DfS6fnJxkZnm06PI6d+M88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNBE9cdKgqgZcqzHKOfIp8ufLyyzp11XJ8gvk4zxb03IQ8M9b7sU8BPLBcfT3geiZqtXmqvIq3DwUjluqgH8plWXOeE9qpg4AwEORt4yICMeWKjbAvqZU8ikZuF5ILTdWvqzuggiMBTSyaphzflLs8E1mNzodlxGPG9EVu6n8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe7bp9sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYriovbz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe7bp9sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYriovbz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLv423842809
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qq6xeq+5N6XfyP0fS9pBoOWP
	w0EfK2lsnoPvPTiFh/k=; b=Xe7bp9sbIhdsqaUU+Tp+K0Y+SLJ+Vscvz99AoTUM
	JXaeKQTGH7Y2onQk0FVAHZd7oIZxf+r9U/22PbkJ+HFqBn+hhnY6D4NRMDSsOJjw
	UmFVWC+Ft9yf4ZBtuGLaH99BwdE2GIv9MMgxol+PhoYAk3e+VJtlPpSgUuUMNbu9
	bzJk2jbU5YYUQaFMoSPgyss/rCskrML562gC4vToTHNy/NJ3HS3zCN91njsZ5T50
	x06PJt34V+fDI90RaNbbz4mU0QlIuCsdg4w8tl+VVR8a+gzI64QLHBcVbkyCqon0
	V2D6Zd8YLVfX30mWUn5REjYQf4nFSXPfaOXmqy8XUhccdw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbg12n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:31:31 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66fae2bc827so1160805d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170291; x=1790775091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=kYriovbzX41ksgH3RiD8fBPLYA2dpM8rWtGplPzbDhBzYqkzpGkoo1c6ZdTLWVbyFv
         Wqxc7cZitQgASM8AwbDKfPWigqCPEKYCrgYjm1kX4BqkMBot8DIoHFbnI9SXqGKTVGh+
         jcn0+qBVAgilNSXtvRM5u5BMDRxhXk2mnpsOMqt4+2ijU9ltnqWo1S38bDm+HMGbFhvw
         JZPcuS6Sm6VaRFhzMtC5Asy38OJxKls28DtDE67NHtzWZhnr8ONcYfe/uKa0qVKfQW/A
         IFQk4Wp8jH8XAZ+OQEvtoy4cbW27G0CMdrYnaMFey+rZTaUzE3mZni3vvzApxgA8UhV/
         wJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170291; x=1790775091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=iegbYWbBR8n61xM+gR1Zwm9+YnukAo6+BoIIPeUS9QbI/Y7VMA2OmZ9IibScC5SB69
         ISSdI5vselOgH1CZQtDC8AERxNiBYgc8YWeC40nQ4qbcXGBha2yDDsw6d4inNRo0klnM
         Y1omcCDC2mNavsUCPk0MAFaMfNrrlERqaAiNDAF8egnQaQ8IOAcdcfwnoIsjbj8hgHk7
         oCcibR4EF4L81EEq7EzQNDiT2zAJlsgte8ZuV1jbo0bYpifwP9vUKrbP/ubD9a+4vwFb
         bMqg7Aa6OMMopE/cY9Jmuev30VE/0SCMYF9wdSDJbpAsAD93dA/XVqpiCLTVdKfiXr+f
         xBTQ==
X-Forwarded-Encrypted: i=1; AKwUvByHS/iA/El9CZMMWPUhifIiKPDHtHlCn1/DOKYbDyGK69Mzhtb5PK+UShM9PzqfcEDO3k5LKFAnJzWFdhY=@vger.kernel.org
X-Gm-Message-State: AFuF++m94z9y+4PCJFhIojOI9iOXKpSknmqAqr3PARAqt06jTAVDjZo/
	CAIIuBbpMkwbA2reYGUNq3qb+CT+OI0w8QCr4dNbkXEuJ4JFM8eXzv96IDf+HRn124mYK0yxhNP
	WmosEHI1qoMQDktIcY9c0qc4STAzgAa2pTBmUDEEiZqh5hD9uyoMbk4zqW6rQkNBwvbk=
X-Gm-Gg: AYBFou1lYaxAcqtIKtPjKtAMexXfCylKJxiy1zP9J16nt/tQ6eIvGigJhv6ckUaViLm
	RFMRMg2R+pxC3GyMvUWwV8fTHmEZPcKI1cqtezUAd5NXA362pnX8AzjxfOIwR6NFdUKaUQ/MH8U
	l3WSEU4LNwMUezsGT2bh0EtdE+ax+s/aVfpdOoFwOyfmirTAyenD0ATUvSXKJG7hKs3lJ50Hb9L
	UuiSxYHm9T6AfZ+dF5xwAIvhTyu3UPmBG0g1JHaSKslq7IdcF7UZkOyTUrGeOwLOBvwVlDcUhdY
	p1JkpNV2smYVoVvWP7qqPWGnP1hKY3edH2VuZdmIWkOlmcBQj0Ph5EaEeS/9xATZ6Y0SSa0D0w0
	3F9MqBSQ8tvVC
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011764d50.6.1790170291119;
        Wed, 23 Sep 2026 06:31:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011687d50.6.1790170290514;
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c43b6dfsm20549436d6.31.2026.09.23.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:01:18 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 2/9] net: pcs: xpcs: add USXGMII Clause 37
 autoneg support
Message-ID: <arPUpiLe/y/aKR/a@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfXwDO5Mt/2In+g
 CcI57/j6popNNAJ1CLGBOFTsYEOavBZ2Odgv4AaDnlHMNdOMmsEjC2ycfZBPhTPa+WveW6KN9lu
 lUdgSd9c9vNNA0QNSEsM6JDQkm/cjc8=
X-Proofpoint-GUID: GxnXGTRHjxNHosuT6jEBZf9QEi4STtjY
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3d4b3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=U1nmBBJXYHZWlwlGUpAA:9 a=CjuIK1q_8ugA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfXxV9E1/3vZlin
 yDd9yyvcHUPmqe12HwsCIWjaFrdRao5rRhrrKj2B/0uG5RyKNXw1J4DG6vWeRQpMkrIVXCI3prF
 Pnh2LVzUOEFyTw7uJFiTSK7wipOd3DEfoy/yVjrzf3kMA3PNagnMBRMfxIKWB/2Ab4Yj0KKYZCN
 UBjrnK93Y+Jf2DB/1cNmruSj28Pb5RRJy6Pz9Uj7HeIoIDPR9taa87L8muZ0RW/IxLrTSkE7MpT
 /ssY/qFPxEmWIjAn7mPTldckKqHf5zih2NJPqPYB9C2psmW6e7XiVgV59eA2zd4SAJiT7Ez3peQ
 RDVey8CXcsklLkfQ3yaVq1cJa05a0L5lrgk2lPqJY26TCARvRHR/0UyK4WzdUTlReDTJND1rRAT
 uhdpcVO/URha60bbI1ovqOOFhMb0Jfg5JZfWjG0dcFM/BVs3xzBfV8n8vw0iXGKcuLyswYuk4bO
 p3aISwC5sYOTC8LMa7g==
X-Proofpoint-ORIG-GUID: GxnXGTRHjxNHosuT6jEBZf9QEi4STtjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

Hi Andrew,
On Wed, Sep 23, 2026 at 06:37:28AM +0530, Mohd Ayaan Anwar wrote:
> The generic DesignWare XPCS support currently associates USXGMII with
> Clause 73 auto-negotiation. The XPCS integration on Qualcomm Nord
> instead uses the vendor MII register block and Clause 37 control and
> status for USXGMII.
> 
> Add a separate Clause 37 USXGMII mode which configures the PCS for
> BASE-R, enables single-port 10G-SXGMII operation and enables
> PHY-side Clause 37 auto-negotiation.
> 
> Also decode the negotiated link, speed and duplex from the vendor
> Clause 37 status register. This supports 10 Mbps through 10 Gbps link
> rates exposed by the USXGMII status fields.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Seeing your question below, I think I should have probably mentioned
here that this sequence is given in the programming guidelines of the
XPCS 3.50a databook. Section 7.6 Switching to USXGMII Mode, point 10.
states:
  Set bit(12) of SR_MII_CTRL to 1 to enable CL37 auto-negotiation
  (paraphrased).

So this is a part of the licensed IP, rather than a Qualcomm specific
addition.

> @@ -687,6 +736,7 @@ static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
>  
>  	case DW_10GBASER:
>  	case DW_2500BASEX:
> +	case DW_AN_C37_USXGMII:
>  		return LINK_INBAND_DISABLE;
>  

This is incorrect and I did not find out its side effect as I was
working with a firmware managed external sitch. The XPCS supports
USXGMII with AN always, so this case should return LINK_INBAND_ENABLE.

	Ayaan
