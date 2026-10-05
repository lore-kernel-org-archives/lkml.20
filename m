Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D0436DA03
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184659; cv=none; b=IT0J4uXmzaZ0HOMupEzZO/P0bigzeZUafY/r3c5STKxyuMGg3WkP33JRotKKmqjE8xOU6mSYuzKwrTA99jsodGxT4KFE0nq3/cCDdSFQrK/B5+HMOKz01Yoqq7BBJz1ISBiMx3S8yr2UYSGweRpMa8tZDbViEbUwYQOSkgp15yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184659; c=relaxed/simple;
	bh=xDSwLSw9jQjM4t1WpbTdcaKoUkOq1JTx7zT+H6MGRyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pblu4PhNjE65qDXDYzkomp28Ri4ScBPP5Ya4znnbgROB7vIKSK6OLR5Zdt943X3AmSHAofkemQhFi+6RHRWBVX0gZqQCSogSuIlzFljijgAemPAc78fMuZfHVFRyvZ8ouT1ODz6Kshrf9t1RsXi1fTi7oZ8jpuks06X3j6VM21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhedRyIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoK8t1Iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhedRyIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoK8t1Iw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951039N496789
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=imz7x/wVPwZKLDpg9Q4Zq3lR
	2I09jdP4oGd3XJ8uP7Y=; b=GhedRyIlw7haVqBVnqmp2l7uifqO6PKbd9210YZB
	cSCFMhS/3A1YOL3KY28GZESOHRLCZOYCAg4b5ZQgOP5pEt7PQrfQCY9Yi5Hxisa4
	DZIZ+mDXEPoRwUSQtbc1hafFj9N0hvIBnGN/JoGOBgQ5enME2nSfcswJ71gTtnNW
	CQkFffhrByP2qiZZdwZgKyhADm2WMfwBMzb1VSP1sD6qubXIqDKKNoqI9oEINg6G
	9EHgH2fTGgBDYdb0uaVCuPcJCemNi6QH+nL87UcDRyp2noLZLP3c71q1FSk0IWWH
	x0rBrdLn51DAYLtN7JwxYOUscgKrZu8ifBWNNxCQHn74Yg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgys41n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:17:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337b591609so18116211cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184656; x=1791789456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=YoK8t1IwnJ2Hny5mEpEpoThDzx6n+joy8w6LeJk8a7GOC9JvT9VqEcxANga7pZhTIO
         sVUh4R8P0LC/JlMFBaLuoDNrfgPm0Ax+OWk+ENVIubqmBu/ZloKTHww9h90zCdwYhNsR
         5nPqqQX35pJd3hELv13JZ+lzj8MyciatabLag06VWuu3j/FjlDxpbnkx15FLiLNp0aDa
         fg2ZGb9vCH6+fSRFS4X0p/TwgFPig+AXlAwZnEEIcDmXIG26i24bw3YlBXORpWcbGEVS
         6cEqzZmLrwpT59F3dO+poKx+P95411WPx7gfGIySwl4ai4H8m+kgQaebKPCNvXmnV6mL
         siRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184656; x=1791789456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=OpLphJvSCrYvrpbneWbclfQ+HgAFCYimAeN7LU+0zaTI66S7bDfNFRD689tJ6MGBgH
         UMmQbz4vCJ5tWl5IutyO8xBNQIjbd52hojCOrmyjGCaPD+4VJgfweenrz99VrB67xnUW
         eQXAefeY+iTwrMY4+uZuJVXbXNm1Y453wo+ebFoSDH/SqP25EuRkeOE9lpcQIJJrFUAX
         oV3rWVhDEAEhnj/tBrGu9uqx2TCCWDZBeslwMOUi59ZKFK9Jjau1ATgSNlLqjW9K3xyV
         ngoNz92obROY+0sVeCgovvruYCkFAS4BJxNGlZm6nLh8fmCylJgB0AybMYD5aB76w7uC
         oE5A==
X-Forwarded-Encrypted: i=1; AKwUvBx00o2RcYyHOzxPY5hSX43ZzrvUYK3AeIoxxE3/3ToGfqBQISWkvLSS9ZWS4+q69iswpFictCWN4IJ4V9A=@vger.kernel.org
X-Gm-Message-State: AFuF++n6hsfJn8s0YiOFqWKTpPQwqF36bWonKr+ZEjlR1UZRAmkHCv/S
	YK06G0sEiKgqheoWd1Yl2s26OZVHsfzH4cDRj/L4B+6LHs7uabZebk06zRGy1btYo4/hxQ/Rrhu
	QM8eOumPxVKZfXR0Q6g3fjm3WOarGlPVbr0Eg0PoNo1INrAU0n73nGanpo6pf2ZyNoOY=
X-Gm-Gg: AYBFou38n043o9KuIVTixF2STjpBD9SYmNdSwXwKrCQFiOdQ8Y6p4k+89QVZC9dFoin
	NiLehor9DUxMWL/+vzBO+Bu0zftpsrtW6biXFmn0XzdZdXDBqSw6ewXJomiy8ltfbWdPC0vbpPI
	cBLLPKujKwkaHJeLkwJVYkn3N/bTeoWi1fJv2ZhpBjFFrsARV5rPLs+WacpCi2YU8ZpHdjZS/3v
	CuTYh9jCln1yumDQEkyLa36/0opUPXISCjVyTbYSRzK95b+rERRqlwqbZrBEQQxV45/jFgVVaMM
	o7zGjy7Dn3UhFiae+w39al8DDTzr+1NplzllAL2HcQ7uEb8ZJtmBgUqPn4Pzux8fDJCquuD9iZF
	U0Lj2U4xLBVBCq8Jvxn85ABlaVUR+qtWqW0F51bu5/7k+bexbyWtukhOzxLrRdKHKIjI4Scz0eP
	5deglWFY7Vbhbm
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146323785a.41.1791184655753;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146320085a.41.1791184655217;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb704sm3043111e87.79.2026.10.05.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:17:34 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:17:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-GUID: NzrWVCGqvBPt3tj3cG7NJq4f-NQSMhXv
X-Proofpoint-ORIG-GUID: NzrWVCGqvBPt3tj3cG7NJq4f-NQSMhXv
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac34f10 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=unmdmSOhVQtIpuyIt4cA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXzRCSaHLq/RST
 R3IzDUxFeW+Iwy+CEtJY/t4k69SDemXVOq83f1f+r2lHxrUJbGX+Wk+DdP9EP2NrJGRvPXs5IWy
 OkeL5jcIwrwDECsYnhY8ymxKSOMW9toCOEiIradicQ4i+TMEPDNQwcydL70pn2LDUigdch1wtsv
 gLZfX9bvF8wlZ7V6AsrDWQla2HS0SmjX/kTQYKC+Ir5DJ1RQ5aJB5kFdr/5l5awsLqbZQ2zv3v0
 6iZtvS+XA1DNzfFOBif3fm0FR/2yOSlS4F4B3Oe6z3mT2RG0DmhvP4XsPhsNTnd++E736XijmXF
 kY4jRl6b1n8v7j++H+m5kN5fg7hVIe92ymYVEnKHb8+nU8OjOK5YdZm/oY3D3ku5p3u+i/gr4Gh
 LjZCEc5FiLFp+UZFdDokh9xfQV5AnWMuRScoiJuAxRb+/nEbw0EZpHjLHv8E5//unAhanlxzDsx
 dzaqAoJ+9aNQAePJQfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXw1za0Be/0F9h
 rtgs9GvPb+c5cVSkV1r86QfyMYnurFxDQN98XnUCkBRQSb3AQRtO26BbgunQSlOc4iSo+NwV9cz
 spek2raG8rscxrOMPoUSi2dco3+/6Ss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index b6bbf2b570c7..8957f208bc51 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -29,12 +29,15 @@
>  
>  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
>  #define POR					BIT(1)
> +#define ATERESET				BIT(0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>  #define SIDDQ					BIT(2)
>  #define RETENABLEN				BIT(3)
>  #define FSEL_MASK				GENMASK(6, 4)
>  #define FSEL_DEFAULT				(0x3 << 4)
> +#define FSEL_24MHZ				(0x2 << 4)

Use FIELD_PREP, please.

> +#define VATESTENB_MASK				GENMASK(1, 0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
>  #define VBUSVLDEXTSEL0				BIT(4)

-- 
With best wishes
Dmitry
