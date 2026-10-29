Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793249009;
	b=xd1+ulxkLDz2yEb14s/gyv7IwWYAfqakHWr+ZjJMnbeO2yypZEYaibstpJIUKkfPBHBD
	 CDjc+YTkTnt/m+PNu9cn/NCN7RwO3dSBrJRP9/OfrW1G9Aaszscx+mKFaJtLkreEp+zXV
	 DHeRh6yYUuz0SFZtHpGM9uq7+J+noJOBTkyPAC9HMQ4KSx9poZCdo6DmEoKoqVSU6E+Zi
	 bj+PafTmEOvol/Ub2eBzRuBrENoKSGP16xIl8csuD7qBPYZbMk5qFSEm+ndHeR2bvVrd5
	 tBmabsTt0UZCuRh6Fyebky2yRT1bXb6BXgXnyeedQRKE3x11h37qDpxLBeKKVQY9aoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
	b=4T5E3mlOyXbfFin2UXgep93AqaWwIyPH0jreAElQ8b/CIzEWfrUcz/r72H5142+8+Gcg
	 hSgYnqU5j7ocbLcU7jNnqP1hyoIRXpYaGAk7hKvmWcg+7wUXU9MNU8wKx7mYbdRHvzsYu
	 20Wrhxm8BScwUAyN/bt1vSavGddvfgklFUzl72Wx7GjH0cWFcxMGmet4usly1MIPEflNF
	 LhmSuU9GdoUDKEt/pEhVBS2JdgRPwEWqK2OBeIPmou/pPC7h8KqX2RXz7GzvHGXZ3Bwin
	 tFbvebDH7ftZffTs/9RBAHjurcgwkiT+ycwCI0+/B4Ur9zI8uv7WQZB51t7YDnNWU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jd8W3920301
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5uHNMI+mYwqaa6AkEWaTgDK6
	tIel6I/W1KNWIPq9vxA=; b=L1QNesmOMfxm4HJEsyioci1+1ty8vabSyp63YJc6
	Y0pm/BVQ/U3WktR+OmxynvrRZ5nseI1131WcCB4gQkJaF96caniWT2odYjmk7ApB
	8Q7V/PBVzGsbuvxswjKaVvmd/UpzxV32KFcf8cnr+grakLQgMiilhj9XrWHhnJRu
	D84aIsGpIJetIyhzEOKYA0GbL7/EUW3Hv5bNRymyOOfN+v8OUBA6jecrcV4hxV6U
	9zQu5Dzyo1IYUjx3cTYK+YLa6cRVcRlC7uoy8hHlfxKEzXZ2qtcUBrErXpNdSPgp
	OVfxm5VRg5jcz1IR9Cg56PHx745tEoxNBwB4P0k1CP2fGQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehtwc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so1433388a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793249007; x=1793853807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=U5IRYPwfyOuGTQIRf2U+4vvD0FDb2PNkaf5zse/xHRdpM8SuqIWcd/9e71zhEIHcbV
         A0SLfHpIDsXs1/zBmbexZktGhuT6WKtxrKXfwc26OtOpVrU+Sh2/rP1oxuoMBD7dL7QD
         tQ839aC5MV1K1Q8syJvyYnvyXSf68a0KWPvFKtnX5HCkY7s99A8xKx6uA4qp+lFQEFvH
         F7E9M7LFj+FcleB+MjQfxIv6ZcVSBECLdc4njTWSU1xPONV6H1BxRxBim8yTzVw4aebB
         HL/R0Tc12aWIXNHKURYapGqmcS/kzYcvyvrjXWnzi0uHTNYH4ktHjauAV4XvGJ/SGD2V
         n1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793249007; x=1793853807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=LIhEiXZFJ1QhfH0qCJrvP4Oy9ns6lY5z/agn4iTfPIyB8LrbqCIzuIyemOFaC5WPb4
         5WEHZIkO5MBZTqDWQdaNle0Yus4ULBcyBoJOhCosUWrN1bjtGu7/Qj7LPr3C6gVHCGMg
         3soC1OSWYFGxuX3uE6WV57Q/lbWGao+zQMrHfI3FTYCkF0vMTy/hDTmuODXF7ZPb7JIp
         ygMK4WP4be4g+pdIgAG6bOHAsvGcbxo+R8C9lbVH8VOsDatCKtfm0uZxQTk8SrkPZSAI
         vAPhzaKbbt+2Jqb4uxc23JiiBXMxVjcpCHGML60L8RXAyeQIn7E3WhtzRaSblI8pggw/
         Pbag==
X-Forwarded-Encrypted: i=1; AKwUvBz60iuYyCJ5jSf+DLl2UeG8cDfmRV9kperROLV36ZgTilosIH4NmopK5m9FybpnF91lQ1leuD/64kzQ1NE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhFhE0QA5VRbH259QMJtWy/vuulupmMNJDR0G+4ozISyco+B32
	0ISJuPIkby7Sn3Dp8W5ZRNTGgBhekS6ubU0lzpcg5Rkmu2vcjCtaZK1Buny/dMsAJktYYcmc9NY
	9Cg+ROLUFltweDPCtJNwL7NFFMG8fhPBbWvuZzXaCleja52vR/xJV780s7s6GYOXjDs0=
X-Gm-Gg: AYBFou1nWjs8eUYk0zUG4hDgoo9bdGiFbV7e0gAHIyjsMfHN848zCT2t8oS71YHmVFg
	dlnLh7SwnnwfWG4/q1sgd8BSy7gXQmnYjAi7pi50P/Ko65jtiDeNHBd2HoNF7pOy4qalO6/UDAk
	b3aQCf57dEP1kE1JC4MdbMtKTHDPYKjtXm9cT4MCPui+4FLUdW+JEe4qNenRi8sTxUTWYzParOx
	7IVOeIXcFtCcW3rCuzw6UyWHpOuG8+ShTckwFT8fRoc3YvRbY87mTsSyQq9Rc/d2E8B6Lm65DRp
	VRoAzRLmXIk938bAPgUi54xeIx0I7P6vJDHnk85A0rRHDujgJm/nEc+fPJ3k+vuEtDoq5RzSSlR
	A3+fISPjia1Mrc1RNuzaDUwQliQRf8KUtse5mmetfg5TyZf74wtZxEui9jHNk2Q==
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341880a91.36.1793249006550;
        Wed, 28 Oct 2026 21:43:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341852a91.36.1793249005981;
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac878sm2108575a91.4.2026.10.28.21.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:19 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Message-ID: <auLO5z9kXDaHl1ka@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
 <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Proofpoint-ORIG-GUID: cvmrXgWZG27id8fr4drsksQpPWGurnYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfX1Fdw6BN/BNJ+
 ZQnaZDP+o1Dz6L0wzwHKmevAMk4BivcESYlfFzovg7/+SFjGztJ1CsIRnzhLChuDHHO7SPsgHZu
 FM3+Ax1tHpsXOlVmO4CfTWO5dYFxM/CBLKdOs8XvWRtwuHn6GHkEBo645St/ULffTK3RXZkDZVf
 a3reWHLGo6tkyipYBkxy8Or0GB7WHIvJSdY0D1wAMvAhglsjelaSty6pesWhMP1WZ5HzdAQHuI6
 4k6+rdqEWZ3lVg2pIHzezEs7HRvZniM2XPMtOxxLPF+Gxahkg+n82J+55eloZCEFVdNYPFUtS56
 X8sj/KokQiqdaSJZx+rOmJJVHkj/a57ORUBZQ0f3lBpZIbQWMFwRDpY73tI4dxTiWAhJWQwZ+xG
 NzfFmGAnEyLRCcO9ifWVFPZIgRsdaTcp8Plbx2z+9XYznQh/I7wt3jSTSaDZmUzizr6HnCLAUWu
 0FRdxCt9aNMzbky1twA==
X-Proofpoint-GUID: cvmrXgWZG27id8fr4drsksQpPWGurnYu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfXzyz2nuSKCBtt
 lONNj2OO7Ab19kHdrPO7YR8nY6Ik5cIpkOV8CSv0m6HVvvYTNOkEnWdBDZ2lOwqULZTRv5y76u6
 Ys+SJOVTNLYm3opjUaKex/JODvSe+U4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2ceef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdjW7vFeMs898lxTiF8A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290017

On Wed, Oct 28, 2026 at 04:43:36PM +0530, Manivannan Sadhasivam wrote:
> On 2026-09-23 05:34 +0530, Mohd Ayaan Anwar wrote:
> > Nord uses a QMP v7 SerDes block which is an updated version of the
> > SGMII SerDes PHY IP.
> > 
> > The SGMII SerDes PHY supports multiple operating modes by programming
> > different SerDes line rates. The driver currently handles SGMII and
> > 2500BASE-X configurations only.
> > 
> > Add support for configuring the SerDes to operate at 10.3125 Gbaud,
> > enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
> > driver compatible for Nord.
> > 
> > Select USXGMII as the initial interface mode for Nord. phy_power_on()
> > can run before the consumer calls set_mode(), so this ensures that the
> > first calibration selects the 10.3125 Gbaud programming sequence.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > ...
> >  static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  {
> >  	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
> > @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  		/* 1.25Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> >  		/* 3.125Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GBASER:
> > +		/* 10.3125Gbps mode */
> > +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> > +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
> >  	default:
> >  		return -EINVAL;
> >  	}
> > -
> > -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  }
> >  
> >  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
> > @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
> >  
> >  	if (submode == PHY_INTERFACE_MODE_SGMII ||
> >  	    submode == PHY_INTERFACE_MODE_1000BASEX ||
> > -	    submode == PHY_INTERFACE_MODE_2500BASEX)
> > +	    submode == PHY_INTERFACE_MODE_2500BASEX ||
> > +	    submode == PHY_INTERFACE_MODE_USXGMII ||
> > +	    submode == PHY_INTERFACE_MODE_10GBASER)
> 
> So the driver supports all these modes for all platforms? The commit message
> sounds like only Nord supports USXGMII and 10GBASER.
> 

That is a valid point and something I have been working on for v2
(Sashiko also raised concerns about the possibility of the existing
platform using the offsets/programming sequences intended for Nord).

Going through the programming guide, the existing SA8775p PHY (QMP v5)
only supports SGMII/1000BASE-X/2500BASE-X whereas Nord (QMP v7)
supports SGMII/1000BASE-X/2500BASE-X/USXGMII/10GBASE-R. Therefore, we
need something like a supported_interfaces check for each platform.

	Ayaan

