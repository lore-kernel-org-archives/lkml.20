Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCD4A6CF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440652; cv=none; b=XTukskYEUUSCkGV2LogC1TZ7oqQKiQCNoIYF5lrSJQ3EW1F/ZuyEJR0sqAdHx0AW72bP2IGpE0/tYltWMr11Rthz/ARW3MBnz7ad+GueWC+T3bFSWr3Ilmtxww9lJ3iPwNDvHoYbEUPY3gsH+XXEibjbG5tqkMhPEILSG2/eZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440652; c=relaxed/simple;
	bh=uKlKDCO6lte9oquheVtNrXZEi++5BjURmRRXHWT7JWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR5xy3Hzc+Xkip8TLursnMB7xHpVl3InaiCMMSNCGsg+c1rY9BjhQ6Yh/brWux91IxXGtUV1x48Fr/KCRxy+27tcEqf0I/4+zKBxni56WzhhiI4mMWCW73DRx7h7JqBy7qPInKyUOhLN4bb91iXFHU4Bxo4/ps5F71h17LZGguc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE3SSoes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZy88raU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE3SSoes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZy88raU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH9mQ3203931
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9o9tfc6MP2cm/LhJj6iD6n2
	2+6eraXxnRkI1mIVuDE=; b=KE3SSoesEq1RzZ1pOwC1wqNPDoVtj8xjf4xMQ5JX
	X0oTrmpNrQbbB8EQMzrbok2QLWOh4IemCFx2EE9c2GxumFPPjFDWSZBCMNVCsGP8
	QXGEBNW5//RzDkg1wPyzOyVedlsz8o6iNBItzsWGVl6119FmOAoF0W5EixxElqpM
	Ow0If3sMF/u1h6kN2VpHW/fkyehJUHQMp8RvErVy9ZoOHAs9p37Qk4vg580tALID
	lP2e5U95WZQtzEqHl4xiQZs/oRFQdg5SuD+BLlPUFGluLW/5HbWK/kckUqaZKrPe
	Qys5ifjjWZEcWEKC7lQ6DfUObrenE7vwe00AQvV/uyW3iA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d111b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:04:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73760a7cd83so1818787137.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440640; x=1789045440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=DZy88raUAvuFutIoXXOn4vaeM1+TDULaOPgXobfaALcttPQWyL59ixfIB0s0CNQQgQ
         20gQnV2yBfTKxEkzEGe1RgQ78IDs7fQdxU6XWcOJ3ul9gYfdsRoxGYpWTEAvYtMjlIpq
         0Iibs8BVFxmy7IZclH4Aj96HzgEDQjhfSKOkzli3bFXVDbOzRySV8zmMpSqsP2JPPluZ
         Sv6VTtySQp3Giqy09wsQfqjtMxA8/2tslNf4Z/5CyuVqBCHL/WdwpPr66yfFm2CgGf44
         7MwtIrZHK1Np6PaHmb2zLPYha9knElcetqEI34nYo/wyyPMrMnMoxz8RZFzHm13GaJkE
         plfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440640; x=1789045440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=eAInXjWb06RLZjeudrIJJpyvM2HqEp+dyYWTIG8AW54sLs+gTZJu4XertDzdar2+uk
         i3nHf+nZfYg+kYvKZrc46IXgFoZppIsysCMvuHYhTPEjd0JhLlcZfWivt62+FrtjSm6j
         DWIzzPuyZ/DyBbonIWYvxsHhWnwNS6qrQ8E/abejxtDIlz9d2j0zFwycOL3TAS0hBG2p
         GqIbtYX57TzWumQMplY/Y+gH5wUm6lqeyq3cUYSRbqSpn0yAjJnCNgx3RPwB08hCghWe
         WSGYxUaG5tpRRdzR6QOT4zQ0OSyU+8wLQadThLym05jc0Irn1lYgXUmkyGNda2Jns3Gw
         MWBg==
X-Forwarded-Encrypted: i=1; AKwUvByp8MWkxUAt+YiTVTVIK1Vs0F+ox8M/S0z4vDd/lDX1scItthD7g9VL09Sf6LRfUUxuIJU9psi+l2ktVW0=@vger.kernel.org
X-Gm-Message-State: AFuF++kmtQca/46nOPvDo/L6e4WvFe6+7oxAjiYVWpoEwKJJ2Z8jkdzI
	3PMkGYlp4Yn6WqXZWRvCUj+uqh8Leh+sMucCfVUwHCSmLWyLpF85pXIbYfz7fhuYGl8xhDSfs+a
	GJWy9snEMeMdJPN20aTfRQnjKLdjeLck6+HM7AlOI5UUTSD+DrBpDeb/3TM9oVWdqKe4=
X-Gm-Gg: AYBFou3A4T+V1iLzs+dRJBods37ek+tU0/mojgN+UzHE0igPSNo3NBDOw0IaH2zk0XZ
	NlBBouxTSsbGbm8RG4lhr2qgj8UzQ3GGW44uQCp8prB1b/HX7mYimijSgF4OpmAG6Kjachi86Y4
	p5Lttjl3/5JUfVqUeQiR4JEhaZyjzxRHIwN7OQtJz9Q7CAmW9WeoR7FwtAF4RxNCctD06SIjip6
	lZE351E7ZVG6JMeXymhVMS41GNE53oxpU4nMi9gxb1zoybVpo4ODUtsreYY9qLrDk5QL+dfKmty
	nYoXxOyTv64B901SfiQv8Y7W7LwlTjdf9RjYZfF5fECvWuuHTv7eezHFsumplvuALzHXYhHOG2c
	1xsXW7cViOLMZ2A==
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307728137.9.1788440640411;
        Thu, 03 Sep 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307694137.9.1788440639785;
        Thu, 03 Sep 2026 06:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm13755345f8f.28.2026.09.03.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:03:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:03:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Message-ID: <kx7vvg73j64dujbmbhblwr6wkoxdkimvw64uew4llzvleo74sd@wywugwoqv5ks>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX+hUq1jCprzzP
 +gzbFzj8WZqM8rPkvpn1OiOPXJpzXONbKAwmRM3jvpdYG6julJ4zpArwMVkCZU8IR64nbLvSaDS
 SXBdDeaib/iZv9EQuASqh2AKTrHkVkHQmGm0taZ5IYmqf/+O6n54nduHRMIhaNDa6CpkgwXVWB1
 7q+Avh1UZGt37zgKcEVNOyjHhYtMMbMA5XWE/BitKJNjkza7Ha3O+nR+ExWghiBVRVXkLhH0S9H
 iitzmpg6JfwlGmFgXQW37lGCRv50jTehCpKYllAmU/rpp4Of0Xk2i1WNRNJ9eRLZQZLAvV25sRz
 BZGdF+xQ6zb8U8SWp8U0+C/48lj4m5m6ssRFrgfFYjtA/uf+nsUiwd0QPh5nkV/nPA1bCDIt3++
 UeDHUfKHgcfd8Jl5KG7TB4s2VT8LiDMCFCXjrgonrMOKrvNAc5yT35tnUdhq3k1tA0tMzCI6nRj
 6Qkj/UgvyQjF+1V84jg==
X-Proofpoint-ORIG-GUID: QsJHGdP6EP3fnAwadw4MHRHhdQVW7ANe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX5d67K8WR3xBG
 l8q62EqFGhICoxnRfckbKHKUkrstdQ2N3BmHyGPIWSjp+sAFZTPYKUF7beflq5Ek9bZeKOtqUUL
 IBQKzxu/Fnr1EQPdbs1V4VE1Z/3Zhck=
X-Proofpoint-GUID: QsJHGdP6EP3fnAwadw4MHRHhdQVW7ANe
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a997041 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1qdZy_LgBuSf-aNzAIkA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:16, Luo Jie wrote:
> The PPE (packet process engine) clock is derived from the CMN PLL
> output divided by 2 and then further divided by a configurable 6-bit
> divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
> NSS clock but uses a different field (bits [5:0]).
> 
> Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
> helper introduced for the NSS clock, passing the PPE-specific field
> mask and reusing the same cmn_pll_div2 parent selection as NSS.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
