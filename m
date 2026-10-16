Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28682374745
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139725; cv=none; b=c5oCDCGPYeWENTvWVFaEwQsWOEfX4wXdsNDqKz+spUto6b1b5QmBZ9WHl3Ptcx2VLSLxnGiOz3wyZHNXRle0qLJxmx003xZNhbzr5zLWagPuQv7RV0v68IAx8OiGUiONkh9XJzoj63brTohAbOsJGGGHZcJZddAPWAjRh/TvO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139725; c=relaxed/simple;
	bh=G+jvZB6Mji53Oxuv/iP7a0JCLgGXa8e6zRkHoa1NUhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obINrwV+tlhUu4QZaearzsgw6swOQJYbx0pW71Wvw5sHlHfQdhjse5OPbGI0+6rmVhJAQ5TrbYxmiSVzH+GGyDuPHdapnnf2PVYE2GDCF8jy4/nwNBxRvQ2deGMKU2XW5EdskkCOAt+Uv1Da3ihUCjnNV63oS+4OG+Zhs0C+eqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6TA1gfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD83Bo/O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TA1gfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD83Bo/O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7K05T1635307
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=; b=S6TA1gfJST8b8prs
	meZKZi63tbUd8HHJmfS5+6yfjKRzff0m/7kv4rZAIHYRjGt5otfdFy4/aIrsX2DQ
	H1yhJoclugUPlUnO+kT7Ro56A+RxTfMmw6PuQKLlV/c3JCa0c+Q9wWseZZle7jcW
	uswCnyXzCxH14VkbOSOtc15itfecV4Z+L+MWdrZISzk75U1Kdne6BUFjYfL4s3zw
	UlnSsyTdzxQFUiXYX+FcFZCUgCqp4ifNyLw0tWrcTdH6W+BvdP7byrQoUoxY85md
	lj7SFj1p/FAtV+FS01p1gdlQZsCE97ZujDnYy54rqKbhK0ekL8Zxfgvy5wNNIBfU
	42E57g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11pga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9178ba8eb30so14196486d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139722; x=1792744522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=XD83Bo/OfyRcasKUb8MkPSCMcb+1Bx3alk4Xjd6rTyTZzrqv3x3RvcKcMpVHgrqV9t
         ETsTaw8JzwHgSNxzO6GANjv9pYvyiRhTHaBRA4UNm1izBXiQkxqorwduqGwc6BRaTvxA
         QXexTEqPwNkl37YkNFi01vIFCjIy+yOB5OJIJvISo3T08n6QGNUhDp/OuaiXjAgVj+jD
         c7+MNfylv2AX4HhbI95WjdL7gi6jKedaM/ZDThYV8g3ClIaqjDgUxDxzNcF8atW/7OHB
         Zvty7y0kKpUiM4lCAhqZWOJiAhFVsRhwObXiQVZN1ot53P9d1SZn2Efl4zhplnmbvRVB
         sfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139722; x=1792744522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=klWMcaD5Kka0xEW1BvuWQgKzQweLwpmDIhLT6f2/eALYApV3GBpEH8esUt6p66SNnS
         2rOUpXbSW8BlOzW3Wg0QrAFTIXWFrGsnuGZVl99YKIu6hDMVXLbN0AKSKiqpWRc1AG4x
         1PUwzLOPtul/ChuFsIkR/RE6ONKC5hiMI2IsnKcA2wX/TyT1kBrBiVqV2Uo9FVMAx65G
         JcD2lhffxGqFkyVN9scl9kYzyJv/Idvn33A+5CDCgoXiCQBlVZcof87sPNr2NICWSQe+
         YIs1jcRx6MuP7v9vDdeMdkZTX2qwZsA8CgcJDRn4tBHzMpvZS/kq3gJVn/o3K3/BYBCp
         20Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxp36v6LF0QzY0d0GI6PDSug235ah30LU579WnCysweu6PTBH9wV01MdPalAPMMLlCv7WWyYNeyv1dPEzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWAHMsoivPNg959K8VCToG0z5nnCQdVufN11EYW4FV9dJre9V
	RfJ1NrnNio+Ibzd9ZMZib9+hym2/QjcMvy4YzkhSJQZpy+FCdu9Xvu6F7mtqYZwucsjCGH9CLoQ
	ddfYXvhSWGsMxJYW9Xz8/WcW09j5OK84oE11yPd+R1rAIcRiewdK+AvoSffeSwQoq30E=
X-Gm-Gg: AYBFou0h/i004BIpUl9EeXNrM9QsOLhvwVg2nLLvYAZXs3I/9GvxVFgL6hvSfJK7z7i
	fK7TLIoRDsUTcHUaDy76pVN6I/HMVn3aMHePKN1xYM7MSPj98LuOMw9MjT2x4QsRLLooZs1uax4
	KLBq3iJb3ByTPSmbt/3aUIPWe0TRvLq3+cgJR4L5MfRfbkJMf79SgL7h2WW0L8VE04yoi2W4zG3
	HX9GZq2HGuQLSeH9NCUKFnXmdy7yRSq7j5qaKSkDKxsHA2lrQ8WFaHdFOzxIX6oVx0P0YAblFML
	W5tkAch0oD2zGwM3kOynLIAe/K/C9WSBCQR3jpXp42gEa8p+5leMyUgB71QJCdiXfQE1dvmgWPE
	v1B9QdKCdz0g39okIXEcy3w==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305256385a.1.1792139722243;
        Fri, 16 Oct 2026 01:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305253885a.1.1792139721731;
        Fri, 16 Oct 2026 01:35:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm52324966b.31.2026.10.16.01.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:35:20 -0700 (PDT)
Message-ID: <72ad4c04-a959-4862-92f5-9e07083eb2ff@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
 <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LpylRuEpgCw6TAEVlg-Qvg8thXEatmuH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX1UY5fcsaRp05
 16LYTUbR1HiQPVRGEKFcGwOs+Jn0KvTfjJrU2Vfw9pGfm99d/Du/0qoZTbvd3panEP3V/RUHRH3
 pLKTO210TBrXu1/BXVeTA8HBC+Eh9no=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX2QHtI6p6WOm2
 eT9V7lHzpWNNoNEUvhdRTZEERSBs6V5FIwE/OrgZi5iCj1fvmQMza1z6oXRKNyRozPVud/ZYT0E
 ujjlgneClpTY2pqeA/kK7Ss5q6RIuhBaZ2z798arg4wXECqJWvWvuMjdSF/AT37kiGPA1zlaNHX
 X51aTURdXrcQJlqU4jfs9B7PrUZdpeTrKwI1IK/2ORfqn77s8yzS6nxXzvPXz3xualgqFMx6YoS
 s7cImxAC+1OLOAwGfArDRydWJyMoywWom58fH9NkrIuqk8uU6uf006wVU0gWuRoFO7NV9NurqRh
 ej3tM/laihAVJgb1vsDuSuSA7JC2BKoTOFjElFK+3tUNpTA8LoVHJSOXWxr/P4nJLWLSpaORvA9
 E0XcLK0ztaHx5Qq9f5/xVchjL81V1rTrAVqtdWV7d70K2ULW6NwqDqCwmq8CKkifh5/YavGxqf6
 lAlqeXrcGbkka0wJKvw==
X-Proofpoint-GUID: LpylRuEpgCw6TAEVlg-Qvg8thXEatmuH
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1e1cb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Fnn43W3oJAV-pqR0l1IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 8:36 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 0xc, 0xd and
> 0xe, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
