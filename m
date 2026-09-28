Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B502A4A6CD7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594452; cv=none; b=AxlmEkmTGZyaDFnODQE44Yce1Mb1rK/tqr15/hIcIPwbkJjmnHue/r8haBCA6RpJt5zlv+eRtvqftZ/gySipPqKkWFeGfJ9uexVy3SMG/2Rr2RD1R7vR7lZso5mvV2kIPo+Wcwc7thnzEU0ZbeZ2xc2sSQzUWDUHSfP8EnXwfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594452; c=relaxed/simple;
	bh=9IqF3819j2ygp601ofWPZWHL+evCZnmwp5OcBplZl0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLlb+I7Z4K1YTr++Xs/7CzFlxfsSF+OiUcL6YRKYHAN0aIxVhIKVqHv/q2hFZZKhUFtjUJ/+6Q0blOJvA/WB2YPBMbZHmVrG5FglXzV0H+N6VBgw5+DrNo0ByjWpJ5Gl7hX5+EBE7/vF1W/RPRXeHyfra9oB+9Aja6CIlaLidPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGqUILAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7fbChoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGqUILAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7fbChoW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9cf1433709
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPso9G8Y2iqX226aLF2wFKAr
	aeHtAaZ5eheUmmWUNuE=; b=dGqUILAH89LghPjRZ3nLKZq+3Sb6o3v4knl+ualO
	Pfspx1VVNq+ydAq8PaFM5Mh7DXkIg0EHd9oe8WAVMH4tWVRaLtWHt5MBG50DWcTA
	2JpQkJNt7YjhhOcBrpLcnAf+3L+FHNfQ1Dmi9Q0fcYheomKby4H25rKPfJf6QpkQ
	bME9y57HtCfXQXT53GCZswwa/Jzz6Z9PuxauMUURdyUFtER+a26MlhjJxYJX1stB
	PSTJTdied1meUi73fetsoZY/k+3AhX6gdKgfqf+r5RQ9d36VkqnvTOfo3oY5Gb8N
	BLbvfnsawsFk5EVeJCjptIW64NCKX2aerthbFG5pjDulcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s18yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:20:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34318e88ba2so1045435eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594448; x=1791199248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=R7fbChoWWggoPYxWr7i5VjPjHiwRQ0Wp/j3gX6K4tv3ljZWLtwESTVQkcoHBSwRBhj
         yXnN1DAHgw1CF0K9XasbBrBaGpuYIfFSod69U3tM9iFu26V5jHYdVlWUyYbYLX4wHH0X
         E86cBSEmO5H/hZBlQhZ1Vc7bv27vZKglQzgWSlCj3+BDM+sC4Jc15zawCcUN1POzTj4U
         U8R8z+x/MfEqjDrjPOyNBwnwAIp8mZkkzcTK4/K17YAyw2yYPAuokHN6UJNwmEkZrRQH
         RWqXfI0+WwqzfrDvl0D7hgCthtCYlg1f1K4TaS/iqRRIkd/10hp8N1Y/o0S9C4mV8KfN
         b++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594448; x=1791199248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=mGsa3S4SgIr4VzbM6XEV4+9gSM4UvDd9PZ6S5HSmSO87WTQIIXcjGDqBfDt8aMQ/fM
         RN5j9RwJGTBK/nDqbv+xms/0eWL+leubl/A7Oi/X1/wRHAefKLUXEqxVGGN15aHD2zM3
         N1l44zlF87K/CyzXS8Ht4DfPKt6bmnx0HQBxoo3xocpC3dKpxuJ+X5t815ZfgJICD0s6
         uzUVfOoQleNVOQ57HpyTWxnrq3/lJO5GXITy/43u6goF1lFR+NY664eY7sflXI9n8vUx
         TmmmhHYuvYRrr8btoljvYy/cijGxH7N3cOhnxiMurxWkLH6aa5K95q2EyRumGzdt7OK6
         CmJA==
X-Forwarded-Encrypted: i=1; AKwUvBzg+VXTsmhyvaos0uNih1BHylY5N3PIZpR7bFW+nntMiChm++SgExNl7hcEPjXfy0mdg9gZJspRZnhAkg0=@vger.kernel.org
X-Gm-Message-State: AFuF++kCT4TGXsLawCIpkTe56eOdiU3EykogiYB/6K9QwgfiAYy1+lD6
	PW0VR0f6sWufOA230djDfw7MXvS8QIPRoqFYAZG7eVXZVyHhUmM1ekqHbmPAGRF++Jrv3Zj74eE
	H6NL49S50Y3QJB4zkSf/aPtmX1qkcRnP82TQ01e+xhMymhGDBmtASy3Lq2Lis/ZvtrfTGwDcxNo
	U=
X-Gm-Gg: AYBFou0KK0rb9CipEsQKJ0PuOLvYRD8Qg5stUF/YGgFb89Prg8UUuIoyilm051bFfwz
	bX48TeJ8S5h2H5MfzeY1s4k7chzY2fK4euthLoBieqZEXHvK0zFFafFpAcFwPcDn4H7ZLBVANeB
	1H5kFtzZDcgZy8f8+tZprpp3q+Q/r2JNuVWdJ3ZU7/TWtL0pBSHcGCHqU87K1jPq/4du8Gzu+2s
	6VCymwMDL1Rb5OynzhqrTfwdLwFg/5NmDndk5aD4qlbBAQCkUSfQFza4i7Ct/6UTEIXxVAC4Jbp
	T9ma2soovPYLcpOEWfSbc3/DvML+lzigHJPb5S207ZyVXX+DyykpxT7jbIChg780IqODAj0wHO1
	LtRPJAYuuJAgtuleGAVgGyWgXegTQs4Wa2gwzvykWsA==
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817592c88.20.1790594448311;
        Mon, 28 Sep 2026 04:20:48 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817551c88.20.1790594447739;
        Mon, 28 Sep 2026 04:20:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm20668467c88.17.2026.09.28.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:20:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:20:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <arpNicG_jUzh1ZrL@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX3bmwAVmfXAbx
 f70ElULL3b/uFIl1We3oj6Mzu2vqWL3qWczxMRHkQVyuv/TtBNbNjDoSo1aVItFaA0nYFpNsogL
 bu5h7tbMxPvT8przHGxRhRBvJZkH4KRGRAqPoSDeBjgQZ6rqAyUV/nWvTrSNRJv2OoNgxJ5iUwo
 t8yigWLcxCJePu/0zOW2pVf3MqBx2VZXMLxjEb6Sbhsl9NU7y4uoqL37gH58Y3Z2BHaCnOceI1P
 AYkPrcu3BVoSSo/xk4q9nI7PYlUdOoRAKtHcuG9SUC0Q2Fw/fI1flRVT4xSkd/a9u6cNGc/UY3E
 IEC2cgC41lXkIDJdS1g85DA3oJD1Oqg4iiCxi2nP8tkS2qaj0WcPLsvtSBvR3l0hZUhSD9e8GKt
 LYJp0ZqOpU6j8zylNCs44vIckEfxdlck0ZStWQRVR4LjCqQx4q0Tq5+eN0tTecd7XaYONfds//W
 hQesltDX5Q6rp0NsqKg==
X-Proofpoint-ORIG-GUID: i9gTwDgfaDzoZIlfUv8AMJ_QtgtAz0Ok
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX2OoxkbK+0oUx
 QMj3Lhu5J1bcdwyecFERQu1VpACxPhfBfqChxc0w3Wjiil6tMhFIIG0YHZiR5YEqN+BOK77uFuk
 y3dokz1qTWpYAkDdvKAte5sCc+A/yB0=
X-Proofpoint-GUID: i9gTwDgfaDzoZIlfUv8AMJ_QtgtAz0Ok
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba4d91 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F8PB8KkoD8y9vLVCxn4A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280045

On Wed, Sep 02, 2026 at 09:38:58AM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add the missing HLOS vote clock constraint
> - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

Hi Will,

Would you pick up this change? Or are you okay with that we route this
change via arm-soc tree?

Shawn

> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..214a9c051588 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,nord-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> -- 
> 2.43.0
> 
