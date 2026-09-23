Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8009471274
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154503; cv=none; b=ATSNqu0d5TriF2tnpGIlMrIQlQKEct3+XwxqXDC5J7+NFCCIBnoyEwd6HTUYIzPPUscM5iJzasbeS1yD8A3TI9Iexn9GTyvHCyGwZMhzA1fwAZ2x9kc+KMN3M/YGzrXe6BcJxng0EYpB3/Q+wDNpO6sN9YJGm3v20DWkSDlV4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154503; c=relaxed/simple;
	bh=HmufmJa573ysgcyW1CEuJjyNusgAqKjgAObGCw/c8mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLWK2E2WCYst60b8TExmgC/IJR+xNNUbSdbgGC6OasIKL3XKH5M8SzhMKXPjvqw13Bz5e6Ntt9avhV2IvBrht906CP955yYpsExHtb9Hy7ZQLXngc9uIYnMpMyGiUxFV1sepvxICu6TZyPn8BzWKeaCnWHYbk8yQhTD403TQTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXDeY9Wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5cSHzjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXDeY9Wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5cSHzjo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8K2wQ1388763
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=; b=KXDeY9WvLIhUXMoA
	3WDdAypjF5G9norND4P/ZssfTXFOjDOys1dhEZ1WmwuCJPscQz8AZf1yBsC9RaVh
	ZRj3j4tYaN1S6tf9UwV9LrZz4WcqF44nCs1+TNSp+QtK4+rWSJkxhDBeNnmFocig
	H+0Z398e5xpPxRDJdmruH3xmZi/BF8s3nKW6Hcvhu/PpOfCSoQ/l6uq/BCnRRLAh
	v6qjtdwInEXtdhSFeNz13bRydO52Zezag04Xcol7ZK0VSR/uw+fItIT2pU7rjb22
	gFrTf0UH04o1njiE7qvMVsR2yiz9UsJEppD44C0/AppXosMX+APmeQzCEEcXIIOx
	Hg/AyA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma31yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14371f7ba1eso1072017c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154500; x=1790759300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=;
        b=h5cSHzjoYAkXYII3aNRMzfxh6Eff8275eqTYeL+1LbI1bU9iEt+yNTC0n56vJO3T+T
         LJZNkulDUuwMx+14BIN+Wf+ZuwVw+uEkoK1W5dIkIMgzV+9o3vte4ZglfyS/vJiVA6jE
         Uah1v4GFtXej+Akoa7yQJ8vVyCIEMrukKJwnN5zsNEtItiw7gLz2KZ4uTTUr+st6SZHy
         yk9e7ROYxq8xC4R7oedk1SDk29PHQzOmcYZKYlcUoJjcYQoVRmIqxNGewx5hXANRJfzp
         XIWe3h5i7Qn4GBz4h0wwNk3O/AnGhN3jy8oaOijDoVw3dWN4GBfnhVPW5nBzYPYRbF08
         aUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154500; x=1790759300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=;
        b=XqdvMuIuHtZBPwZL0mtZhHAWjh7+H7wbiMARg+EOWMYkl9jWGcNlwHY+TLyARUKtw4
         61TV4Qd0ZUAf/3h7q7e7b50BO2GaxKm++xF+HwBXvP89erb6V/tM+/J93lLqozxlqM82
         PXjf9pV7nNg5svtR6h9gm0lsIm00olCntvQYHSOZ7Sl78cXY2IPT3NutdJNZLTyDdKht
         7mw/lVplLOUOXKrrmUXeOhdKhJL4Yx58yDIEv0kztcmOKQH2u39UQTO1ucsKqigWTT5l
         1F21yGO9Q0vwlAVkjrNyFLFN10YBAg5bYXYN71059A3zyoMfEcyJ25pTKFUR8cjtKbpv
         cb2w==
X-Forwarded-Encrypted: i=1; AKwUvBzYIN8sKvGYCN4t8xxTAnZPg//sWHZy6hPqAQp/IB9xowkkSFWmZF9CuXk22yOSAw0147jZ/c3eT1UE2RA=@vger.kernel.org
X-Gm-Message-State: AFuF++mhU46eUBCSTzeRAkbqGyALqLWetwH1lXGFmNlS306P0UdH8uNM
	6yQDcKNZNVA1YjOENty8GBvFGRIclRzMKnAoycJSVwH6tC+Xjjeq0oehHj1lz1YTwx2sSS36dcl
	AqR0dHsm/zqw8P2ZuoImwvzowwvhVJt15eyeA3COL2+2uVzzxr939fg4K8y9KdYAHdMo=
X-Gm-Gg: AYBFou1hKH95sT4kKQJcL+aGBpO/jR7HF48BCYn9MrLKju719FmZisNFePx7wcs+f/D
	rgXA4NDEAHekMWN8trqS8utU9vBx0+YkQPkW8p2BifkEjYzC6WC7b6uREeA6uRc/RVQm2AcrSpX
	bK83A8ZtEZFdyZA4qxCgemw75qBZgCkh2ZEu3ynKGZzh0avvGRMXNoNgGwj4PeBSrq6sQ9nGLjx
	1IfihwJ9lolXNM15bwJ7cCtOUZmHLVPXYH8Jm8LLh72YE8+0R3OXsIHUTW9HcTxaSg9/Exx64wo
	XunfxZ2F+qQlKk0++BYzcPETL493re/cuJ04izsuvzFDqd+X4wgs9ngs56TWPebC8/cMnsA6JPe
	6AA8jVn0Xd6PXe3CHh/bD6Vnm061pUawBH9Gw0WRNRC2UZvsZaqFzgzAXFLtV+PqxME/OeBEWjA
	Xzk9lAqm+EYWxjSbY2
X-Received: by 2002:a05:701b:4294:20b0:13c:d318:5b91 with SMTP id a92af1059eb24-144f90a701emr2586513c88.13.1790154500305;
        Wed, 23 Sep 2026 02:08:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4294:20b0:13c:d318:5b91 with SMTP id a92af1059eb24-144f90a701emr2586477c88.13.1790154499532;
        Wed, 23 Sep 2026 02:08:19 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98bf501sm4941273c88.14.2026.09.23.02.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:08:18 -0700 (PDT)
Message-ID: <4bd5d1ad-3d97-4ef9-bd46-790bcffd5ea7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:38:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kt-8WXZhRPqgUbO5sBUX31uQv6qzyNW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX/6Ry9C/HKLW8
 nfCCVBcROL/bg6Pi39gaDbgqjXNr+mcLBPRs67+eZIPlH+EXQBhzuNZX9LDvYxIsiab5rEHfdm5
 2wNNgDcp9lpY9giulBAzX1D8zUQIn8U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX7UI5bnXbx3Bh
 /QSZhNorB9zELvw3Q0zJ2Zp9sEpKtVMMJdHARIfcLrC3866gkVKHv9gfBvFUDh+J0lNYdKhBfAg
 CVQLFadgCpYH4Q+US56NOwYRtm1ynYwkIYj3oVVIPjPsJrmjTk8nkeCq+XRI5m4iJyT1eaejX/m
 2cX4r+hM4Q2qp1U/GKyypmJGp3ALSJxfNWr8+CiG6nv7RUXYr1puInJZsxS04BgZZkpcDCmJpex
 NBbEk/7xO1pwQMHNLvcUDGuq1SauuezWuehbNUZmaUyaM+i8K+ZMAqt6dUeveQaDWqyUpmT5dkR
 y+Ks3CIFPq/yo/nKAabLAhWn+ZmO6c2jmFqI7UGxoXhAR66gaEVTpJvL6PUvh9gZokQ8JJM6gj+
 Qtxyxp7ZAriW0SRWRqfOmFNSorBFK/lQCOv9NV89fN2w4NZKxRwABmQaLJuhm2ntgFkG1R1PJfV
 C7rg47U4QBMW9B2MV/g==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab39705 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gcWZ9kyA7G0WfbYWDhQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: kt-8WXZhRPqgUbO5sBUX31uQv6qzyNW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/2026 2:47 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Dependencies:
> - LLCC driver: https://lore.kernel.org/all/20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index e0496fd40c30..6896bda14ef3 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -2071,6 +2071,46 @@ watchdog@17826000 {
>  			clocks = <&sleep_clk>;
>  			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
>  		};
> +
> +		llcc: system-cache-controller@21800000 {
> +			compatible = "qcom,nord-llcc";
> +			reg = <0x0 0x21800000 0x0 0x100000>,
> +			      <0x0 0x21a00000 0x0 0x100000>,
> +			      <0x0 0x21c00000 0x0 0x100000>,
> +			      <0x0 0x21e00000 0x0 0x100000>,
> +			      <0x0 0x22800000 0x0 0x100000>,
> +			      <0x0 0x22a00000 0x0 0x100000>,
> +			      <0x0 0x22c00000 0x0 0x100000>,
> +			      <0x0 0x22e00000 0x0 0x100000>,
> +			      <0x0 0x23800000 0x0 0x100000>,
> +			      <0x0 0x23a00000 0x0 0x100000>,
> +			      <0x0 0x23c00000 0x0 0x100000>,
> +			      <0x0 0x23e00000 0x0 0x100000>,
> +			      <0x0 0x24800000 0x0 0x100000>,
> +			      <0x0 0x24a00000 0x0 0x100000>,
> +			      <0x0 0x24c00000 0x0 0x100000>,
> +			      <0x0 0x24e00000 0x0 0x100000>,
> +			      <0x0 0x20400000 0x0 0x100000>,
> +			      <0x0 0x20600000 0x0 0x100000>;
> +			reg-names = "llcc0_base",
> +				    "llcc1_base",
> +				    "llcc2_base",
> +				    "llcc3_base",
> +				    "llcc4_base",
> +				    "llcc5_base",
> +				    "llcc6_base",
> +				    "llcc7_base",
> +				    "llcc8_base",
> +				    "llcc9_base",
> +				    "llcc10_base",
> +				    "llcc11_base",
> +				    "llcc12_base",
> +				    "llcc13_base",
> +				    "llcc14_base",
> +				    "llcc15_base",
> +				    "llcc_broadcast_base",
> +				    "llcc_broadcast_and_base";
> +		};
>  	};
>  
>  	arch_timer: timer {

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

