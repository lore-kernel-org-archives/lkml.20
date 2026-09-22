Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137D5275B9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067698; cv=none; b=kGKV0q2t4r013f55coy+CgvIOgd2BZ1SHFaeOYa87D6bVW+pLsuHcs96RWEJJLgW80QlhKmkMxr4ozcujyzmlK17lwHhJXD0C/QC2On9iXA20AMEYGICIOHAstyR5j6BpTrKqmnK4e9bNI6UTn11/SgY1s1+B0C7w7DRkYKld4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067698; c=relaxed/simple;
	bh=av+aBO05c6O+92dbe3DKT23RkVy38OVygGx5jUvujcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYrKaaC1WvqU/Z9+ia7cQQ2EOev0YVws2OyWgHeJbyI3L+2BBV6WJENb++hTD1PCFTiKdzmYw15DhkFpUh+3tcb/znOmA6JzbMjrrLcEJSsiBoBW7LmlRcKi92YEqMsjTGUnWXjOkrhhHF+rKftp1yqGkX4LBng+QGeVWpY2xn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOxAcuWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2PJioX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOxAcuWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2PJioX4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M703R13840510
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=; b=DOxAcuWbmFupSuyx
	du1CZYe2dVBXW2Sgp+LibQE8MoSnh83h5WNSBWa910NeSlh0tkhY7XS30kstOep6
	4rsNwMbmR1Xkes+rctyOF7UdjzJc+p6i4IiLTYinqHCQneGcriokaBJeHwnXD5ck
	obNA2I40bIVwjoKBMWfRiRIPZJgqIJOvoWKE8JdpB6hsMZJMk21KlJKa9hlCkRgN
	Q6pQlsbIERB2Ra6kbv0si310NH796/+HF93lcLjfUqeAVmdR24gwj+qcmtqt/xVe
	9vU8Wew1WBTXlfiwTEoDo57VAyR6BSPdgL6GCOT4M2lhXzi8ueiiOJ9HND7RAfDd
	zDtJ1g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v536me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a1ec363beso136603137.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067694; x=1790672494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=c2PJioX43seM/PPPoWN9smYrCbeGR9NpYnbih5RyCDHXbdq5OY4zS5cXP8e+3fAA+i
         SMcA0v7TBZ/Q1Hjo11VFNP3oLbTvcH3GA/TDW9xj0tw4N9y3xcrHmsgIcNWSef2sMPat
         SNQ4bYrRNTtN0ha5U9CcfN/nfWbL51oqsqk8QFIXkqDodsLGcolcFn02qDFs3zovFMMm
         8fw9ESMJ8m2KtrobvRK9t0qlv3R12L1+ESxNG3Y3zWB34wgA8zY67PrHu05DiUPGOTFq
         1EU3q94pO4BM6+CqWpZ6LFPUomNVFnrn4162FdubRCiPt+4U28iJZSLBaKxGxdOipuU+
         VA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067694; x=1790672494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=Gs2mnicGDU7rUFv3XjbooqIUxIu8jHxhLgO0fzXdomVmfGuiUNOEBXT2eea0gYdmrS
         D4OBtK22QB3O/FQj1/QoiPiNTOrSe6m21pc89BiLr94p6JNeq2gABQ5ZEFdnldV8gcOA
         GZu98a4v9bj33Ri9+/texu7bq0Q/lIaDoHqpddmVmtB0vAeEGW47e7eKaL2PQBCckdmo
         KwSAu8T0xUwps1laustNu8AbNgT7AW0egz/M42JPB50f51X2boaFZEzB0LEfICdxh0QC
         w+dfyhRNqtS5XdQRSslxyKtWg6YU64LGI1m2a9J3q3ViqObIFTkJYDEFmk56OSXUU56V
         DKgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBMavHy81x8vdqcyeC0AQE8SkQgjIkaKJuJqv+6ws6BuPAKlssjZbjd+aQhKEGvnRCV5nfZ/XeCr96CZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nON6yNuR/RYc+X2X2MWH/BeNMd7a0zEJXKbKspTLuQmVBSiI2s
	NtRGW4Xz8e89aPMnxNmzlYfSMtyLpS/vqw8Xqfcv6UDdens7Y2CD9Sgj9oyonAHvp9VHrFIXCVY
	XfaXkyxm0iapJja6qrk+RTYMtVigY3qtMv41y+cBasgfJ78HMxGXyU9dzRsEPfzGXQus=
X-Gm-Gg: AYBFou2bhjPSjDq9UnAnq24bqaxk+TYV5zvclsteWic+7RajrbrBWPlVQDAbyePEZxC
	A75L6tQt+6YAi6dP+Mh0CflmbOzvhLJBJUvsIwsNaY//iqZnOdf0Cr1VnDpcwnFiaBK9GRAhFsE
	e07MqXGtcjpnLBXMqDgGV5XZnaKedZCezmeIeY5gOBm0oogiS8+tx2SReyU2oaY59KlUXeB1csk
	FWjCne1X18EzJcEKllwOAjwMLgFkQ6rPyGdaGHf4Jb6V3Y39UTFZWmJJZmzZ7vIiH0rKJN+qcF7
	4tVTkY/COyjjUbZpIHOcMLtYnO8D3Au5siRMkSlXgQfCg5sKX+Zjpwnr3AeodPedeGWlc7m4hg9
	JxbDm7D9b9wo1xyjgsvJOWA==
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087599137.0.1790067690437;
        Tue, 22 Sep 2026 02:01:30 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087281137.0.1790067687753;
        Tue, 22 Sep 2026 02:01:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b2d17sm49927166b.36.2026.09.22.02.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:01:26 -0700 (PDT)
Message-ID: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:01:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QQZtw9vwOrVvao8-0i9f1MiXtEv7io30
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab243f0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2YFxNopJgCIckj76tygA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfXwHHv4qBB3d2L
 /t2hGJk67ey0hDeDHzxE3xtfsbWkJ8OVGaoBMBqHubBuDHTndsUSJ/GnLmRN4DG1b8oxehVauQu
 EnLrtf3EO+A6qR6lZl4OYKli0KZ0ygg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfX/zniRzM+FHtb
 Dw20EkRDrObYTY8pzBgoz3kCOlgbmiAiKPkIB7TcXzNk1Hid8CnEApiNO+lyQkTSX0YZieeeSxJ
 JkK6OCztoPqIDq/Ph45XL+UBuwlFW4RWoMzbm5BMk27qQDScFq8cS1DcsLVg1vQoQ/qwfp1p8cH
 DjugRAhcJYU3EwX2YuO+jB80+O7AaVkGr4gIXmzAG28A2sXbgarxdvrqHqX2saNqyXUqG6wJGK3
 vp7Xy/9V0f5RWXZqo74EBu2g9AlWR5DLm6pLMIXZ4OV5KrktNFLx1SpnKbVLKPuASOefo4OHQIO
 I78/AlDYoky0w+9rnsqUdZVuRghudG2uts+s2w8W5Sg16J91tbdZZbp1MvGpx/nJzMd4KaWfVo2
 q/XPZPstj2avk6PY2U0szhMJzYbdkhJf//7OcfkBkOaLybk6QVT+FmEzk/B+ywdYdGDZ3ozSaaF
 vhcPvEb8vogNEC9HzvA==
X-Proofpoint-ORIG-GUID: QQZtw9vwOrVvao8-0i9f1MiXtEv7io30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220129

On 9/22/26 8:40 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index de7c395d9c35..51fea666efac 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>  
>  					/* note: compute-cb@9 is secure */
>  
> -					compute-cb@10 {
> +					compute-cb@12 {

The unit address is interpreted as hex

Konrad
