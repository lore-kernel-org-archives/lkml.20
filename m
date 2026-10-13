Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F353B61F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919935; cv=none; b=V+T2+hYogI4TRXD4PdWB2qSGke/LMotp4v0+A9+lHUo+JM3dXb4eZ8t8YP8Z6CdZvRsQzffP8JNrXsJA+SQbt5TJn81SwbjwQHpSjbR8q63iCtKZzZPWQbGowvfKFA6dsNTF8XXPSRGqVSnbnVDsi8gJVg160uV/PYUNvDb6eJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919935; c=relaxed/simple;
	bh=KKnKl+kEpHM9Q5slF2orkEHPjvUeCE+p5oGRss8bTY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt/mrNmG8DcnbmBucS0UcGWh5ifFzecYKybESlpYn8lsFdPgUk5v6+1mRqrzrD+oeQ/iPzCF0r6k7bJc4AnhoWME06YGUW3AHBo2JPX6ZAQDQ6mIgAugdHq8FnXh1loa1Azl/q3uiKyO9ibxCPJi3UC4qQXel3BsWynnGoOdC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAMFoMXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8y6yCmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAMFoMXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8y6yCmn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkmXB3000934
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VqPMTRpakh1qxvavIfVW4CR/
	DB6TqX3Zg53T4Y+hCZQ=; b=hAMFoMXLp/ix7dIcAEaqhhAzic+JM5Llo66WMrRa
	2jqmKNRtgTti08cropuG1N16gaRP9X4eyC1Vgk6FhziXISql0CrqtkR7zi/zOs8l
	vRK1CuplQ43kgddSNjUwDNKgC4yBcRfpK54x4GeEijyyZFPgkDSeve241tKxkPzK
	yEwDQwVpc5VUJyXDtbTcvD39dg14w7VjJLrQIsoi8yFs6vSNV+GKtUiIYRVOsONo
	rc1GQbxEiU2dy4AYGdr10FqA/4A+074+aq6TEv7f6QAfMzE82Pn0UA8Q1rbcW8cj
	ncW8sFQ6B1TSeRlkPUwtz14tjDG0oeUTeIazdX4ZgO/jDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberg9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:32:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1046504885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791919933; x=1792524733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqPMTRpakh1qxvavIfVW4CR/DB6TqX3Zg53T4Y+hCZQ=;
        b=b8y6yCmn8Bd/XoaCuc8tszqbdYaG3923b/4VDQ/6xjOoXzfbwDvl1B2MRifOvEw6mb
         upd/dH2cGLeH7SL0y6cdtXM9bwpmhxCAFnLyQ4az5ALmKTzjfUaizD2H5BZ7axosUgBH
         GKYexjkCh2pd+l6y0+O36rybJEa4Dmgw4c1PuamhRUZt7Hxhv3mFuYpWwNQg4v690qbz
         z5lFCIDf6asr+PTpJOWsWVUSzaedSk2FD0ByNixnS0UAeKEMCJJ68UKVAo2oVxmoZhBG
         xxo28KaOxWs/SBbPIr543QscgHwO2ss2/W/YTqyQD+wgcjL7q+VSk38a8ko/Kh7QWyX1
         T9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919933; x=1792524733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqPMTRpakh1qxvavIfVW4CR/DB6TqX3Zg53T4Y+hCZQ=;
        b=cJI6Q2igvZDKfAkv0DyGtdajIX+z2vV2yAxEJdqEoSKx52mAB9+LnjT4MYSC+NmGe7
         uHqVD1qXk+5bVzgtjJPZA0hMYWlkp4QdtZd1H93T1MAdk01lfUjYZCXl94U5rYIaKpYH
         0dc8P2iZ//PGoHx2ENBeS2a6hET29dXT6nPBjqt54oSGw4Wzs2y1+Ug4lfrJpGgicwMn
         7LCn8eMKgesaw83G6OuEmY/qVPp2+UTW1kJF+9R+MojI29j0mRjOeHejuLf1Mmzgg07m
         zqp3QiqPpx/o8DmiiB2iICm5l9ysUqpThx0wjDzHHi/IA+gU4Eox4IbFDkGTtcQrDVF/
         15hA==
X-Forwarded-Encrypted: i=1; AKwUvBwCRwvePoM24b9erNifn+sNCQlyHtZhkS/DKjpP37C8cH2PIXgaRtPcBMC7xZUhJrq5+3Sl5vxCjnP74i4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQIqNr/njIkkJxZYoUs+Gxs/YmDnjQVMe0iHYJnnyjqs32k9SG
	SKh703OcKxeM6GRJLx7trDQDXCJKrHnWOciJ3CwxFlZY8hkkPM/g4U2YXxjuUYx0jNRak+joeVt
	RB9xo2B+NYz3R7B6pyYwL73nhpofKb3419ovE8QRLagH0UAUS515Im2rMjcdn1VjYL04=
X-Gm-Gg: AYBFou3qP0QhCuBOETaldquRgsUy6HctIwSXa2OkC0NM8rs5XIZUX+yY2yuJNkveSP2
	vnN4Qs1C6uiRLdKa76okHqnjb8Iwzop1oknXHnpd8ukY66SnWZiidJqbGzXJkdQ+MCgb2xjCE7o
	0XTVvYIy0uybmfmVuWsWY4nzKWRtzreb7LaAG0uLROzuLwD1perZKOBgDCODC8ZK/CeGWwlmW9Q
	T78fO7RQ/5gu06KrNbM4q77xgvnDrxZl0OzEqtClPt2kC/Eaz/x9gOWKVQcTsq/yWnFQoGEZF5o
	JGJBHWGagClMkX1Wv/dt6kYCTygJHpwFdZKTpeCjB/FgzkVTVqzRDgQdBejfnmJ0OMX5JWK7Jq5
	DAZaOFH2hzBw/WJJNirtNGE+TmS7erx63moJ74yXHPgFw33807jNPetnDt9jPgjfTcybHKjb7Ta
	3tdp78Mblnl3bF
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr2162591385a.23.1791919932734;
        Tue, 13 Oct 2026 12:32:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr2162587785a.23.1791919932103;
        Tue, 13 Oct 2026 12:32:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7fd61sm132144e87.45.2026.10.13.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:32:10 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:32:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <e2na2pyjjlvnnolgz5sv26c22pzcv75iz42wtnaqnixzxmyf27@f7v4ljtsxb74>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: d6gSmCyzEqtwrD2Wcsok9W7Ntfo4RO0c
X-Proofpoint-GUID: d6gSmCyzEqtwrD2Wcsok9W7Ntfo4RO0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX6goD/QlYUtEf
 lC7Jrt/QdYMvM5LaNDmK7pz7NRAIWLd+QOMl5qE5qLad2Itlruh4sJGSgm6S1BHgVLairxRTt0B
 0UkDklxydw8irajpXDrq/Pgfj7yMej6u9XeNt6PkQ9d+mDxgmmVq/5t6DvYcHa9mVK/wpfl5P3D
 n/xQjdx0PW+6GrnWSNUdGalBM4UnofOJLhDKwuphniU9mWFv6cjcCkLFKBC6kcxNVHGBCDIUH0w
 vNz4jL8pJNoJgWWZZJ9D94Hm7PPXaYGGjtjiNllo3qgJkA7+lp4EztPfhszsO/ZS/MeekfoS7gW
 y7aPi69qs6SUDyUq7xDExOk6arU3bOXx6bSXbE1Q7yx/vhExJxyir8XV3mVdHQXfNcs6oKxMc4k
 TAxWDNkuw719rykdpI7eK7vSpt2iD/whu3nUiYdHxuUitp2YopgJw3c5ZB9OfbeD82cG0VUMt8E
 euggeK3Nc9EvJqCVvpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXwRCnXf0ujhuS
 wYPLm5WoPDOvpcRUVB2U4hS27z5pHUCiY/h54TvOr/FFmzARhsXw93bCwwBrdUGUWR302JThlEs
 jDQ3R+OMSpROI6ADlUhqaA+cx4b0F9s=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6ace873d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jKzDs__1sFnS_SVA_NAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130077

On Tue, Oct 13, 2026 at 01:34:49PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 222 ++++++++++++++++++++++++
>  1 file changed, 222 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
