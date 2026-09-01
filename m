Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7523B5306
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268589; cv=none; b=FBArHN118rKHUIJal90yTrXZ9bOvNbGvSgqO2jbicbaxHMPLGH28kkD4IE0j4ezCsHPmFmx2NKfSBijTwR+JufROANGX45Tas8zSgAv1EKvxowWwAQyVPq+OkWathgElvXKMz93pBqQBVx5avnCW9kxmd9BujlJB0niPqGvUUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268589; c=relaxed/simple;
	bh=LQ12SJUBaxMvNbSyq/WSxG7N0fuhvkTI6OyQzsXKTSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsN2R9OCTfv6XkO/VjyjSgg4gw/0EiVcG0DFDm7Fvf0iabKUTQK6b/SSE7+dcmJsyCNGtJc+yXUm/fnRAeBAPBtMGQ/ofyiraDELjb24ZcE54Mr50djqwFY//4v22hdX7vbocKhtv3boaxJE5QkH21nRdaY515y/7nvkebwdduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0w6tk3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3BZuXKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0w6tk3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3BZuXKo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJhOa2494652
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=; b=U0w6tk3id0rNfBAS
	8apj5ENqwbMeBUyf4VZWyDAc8MwLV7WyLghvqZDfjadRanUylve3o1GWTWBzUxui
	YUa2GLCvsaj5X/Z0sKhpO5MPT4isuKQ6JM/f0Cl1sey772Det9Pv7YqjzFJE5mv9
	qPUtd6NpO3knt4liK+GZe2XTXKbSRSX80OOGXfZf114WmWR+q7sPwDKq3iPLZ5xt
	YxyrFLcdi0SO1zLiUWqfpKvEqS4ox18mvjOREDWr0xaK3l16LlTHit/v7M5tm4Mr
	GiRvp349WdlMN5pyrZNAFchut8V3C7C9FMtPSMzyk11nwSBocjKhs+bhIGDco5vN
	FqZ0Lw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh27f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:16:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c67601735eso130681e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268585; x=1788873385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=H3BZuXKogm73wcbJVqkE59m4lR1J+FI4wwlMtS4z1bLGFuizQgL7Y4o7yKx9YVXfCS
         hwsSmt6yjuzSuumHuqvVpDv4kP5hY8pkSrEtwXUB4UwNKh6cwMXMMHElvxGn445n8S9V
         9c3EdwWOrjwHG+8ZJK/8LemlLQubTCSKYrJzyqfhC1d77ANQ+9IiMcTBLSI4F2b3SLVi
         ws1Zfdcno9TyEM6/tsNGeucTM8rSVqv/+AfQXgPcVdsu5+V6P3Qe/EYi9IJ+7RpvEblZ
         Vgwpx3zLgeH4z2svA12O596kyh8Yscgn8I80QOwr1qlyj6VpIZUS30LTGUc6z1eap0L6
         4MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268585; x=1788873385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=SMFhX6H+jPfY+KJ6qbobYqshM3z23UUxwkYy1NwoohwyMr84p+5RzB7JX/BXkkp0ki
         jCUpjCX65gnM+NjUyIWZMnge8+YUPqtR/KDtODP8EjvubfRxZjyzAEd59iCZbgCD1T5Z
         9AeIg3fRbq0XhZkhSjhef0ArQxqhjStVmrMKGTqdh4yQILXIJTsC70pfDSpMWJPAi8/C
         Cbfwv+N/1giQCNOb9io9tmmWIy+55mFPu2AOcSTw9h0Hy9ZqOXQogJdxdy/VpDtlNMLc
         BykIDw/aM/Zfs8e5CC7Pp39MO/tG5/BxFULCAOqvhOxJ0tM8BuKZIG8c+1piAWJqPXQI
         Re8A==
X-Forwarded-Encrypted: i=1; AHgh+RqfoV4xgIZsa6VslsqBfraCVNBaFOI//dnO0nei54tMnRWG8wpFFm5PiU3U5GxihiLh6hoHzyfVVsbfg38=@vger.kernel.org
X-Gm-Message-State: AFuF++kb50RgsMDyoDwVJ/atyEtlBAwiqBT66xMzAbA9TVtm/iAR66SQ
	szYMsXLnlsS7EM/5JgJw9GKwOUJqAiri8GhB0CEkTamPjaoeFRBTTLdeiWDqigfCRjfj2NH6ihu
	c2RBeI74K31HS/prItl/GbqABRTCQm5IgCkIlLqyQQPH2redrI+VJD0LXjwppy6b2QS8=
X-Gm-Gg: AR+sD10HdSWjbPLGSATuu3ldxUvnTrsB7JlZSVspd0mSbP/KCaeN7pD65ccpzKiu9R+
	jg4FGQ8aE0r1IG+6uSr9eXsMwJ1sPUDKk1j32CKlHCU5zdpuH766362mqvLIm1o97ZZwyd1gMHI
	LLI/T6u8qj6SIGGYsU0556pgORji77y+EFrOc/8fZF80GHKXtSNzFQQHVklAvp8uB6ZGggqCT5L
	QksTtVSumlphHp4Tjks7S1fTa+WLM68iAbba12A8nyeD02SBu2TUTpeIkSfWJaZSxFU8D1/1LOw
	Bq6iK8ykPpOu6VtCkZaTqlhgFlNcoptpQvrg+VVkPBoHWZ78RsRKId5T55PqGznAkMEsKzLHVBu
	MXkdA9sSyOflbPqF93H2oJQ==
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560684e0c.2.1788268585208;
        Tue, 01 Sep 2026 06:16:25 -0700 (PDT)
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560669e0c.2.1788268584589;
        Tue, 01 Sep 2026 06:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305386390sm22564121fa.5.2026.09.01.06.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:16:23 -0700 (PDT)
Message-ID: <a1d438e9-0a12-4b05-b154-eaf9d1a6d31e@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX0hV+Gs6qwy0p
 r5zU8QzoypWF1J+MjxGqqWFqpf+HgZ6GTIAc22T/AR3G+eEu7uR7X5v1BkIhxntuGo4jCRe1HXJ
 ihOD+PKtszK3ZxfL4jjHnBwyaqCFmvo=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96d029 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=r7ctpyJW7PmjMhvLdxUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: bFi9LJPOI10o19-JfVk2tnW0tAZBMhXw
X-Proofpoint-ORIG-GUID: bFi9LJPOI10o19-JfVk2tnW0tAZBMhXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXz4XyOUp0wlIt
 5LXIse+RgQj35B/zFTR+WUiR8lJF2E16QT0yPtEh0DXoQD9/8Y/lpF0IaxxIdYtzJGjHw/WPM96
 q3ABsMPx6dg40+Tc7SqkRyW+rg8UPxZKJHCYDQnmQpBgeaxUW7etGEN83ihyt5jKGUg14Z1ejTc
 DMOxQaKqhwfVIJzL8QWdcwB4k/My3CdqypIx/jY1l2aR4jDX+Bvo7ecnAYMbwK+URQ0FyBGAYXm
 IfI7Ws8fVkfHfbSpwAezUYfXg5WuE3cTMvCODfbM4Y5tdvCghWdcvCvBKLOlAIXNgvmLelK4tfB
 Ny31nTjqaXgI24Pttm7e+Zm+DizbU7OdjSmh2r7Ybjn9lbc+4jTMwiveAB1JkQ/gwOp0WB/gt0i
 WXTg5cPOBHzPpWozoRDBe+etUes8WEUTR2qRnIycGTVEh0Tr0JZZdoF9VlDFpHDLyVdMRfrF2Kx
 M19U0oyS4/dXtCvn03Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Switch to using bulk reset_control functions to prepare the driver for
> managing multiple resets, acquiring reset controls by name, and
> uniformly storing resets in the private data structure to enable support
> for future combo PHY functionality requiring multiple resets.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> -	phy->resets = devm_reset_control_array_get_exclusive(phy->dev);
> -	if (IS_ERR(phy->resets))
> -		return PTR_ERR(phy->resets);
> +	count = of_count_phandle_with_args(dev->of_node, "resets", "#reset-cells");
> +	if (count < 0)
> +		return count;
> +
> +	phy->resets = devm_kcalloc(dev, count, sizeof(*phy->resets), GFP_KERNEL);
> +	if (!phy->resets)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		phy->resets[i].rstc = devm_reset_control_get_exclusive_by_index(dev, i);
> +		if (IS_ERR(phy->resets[i].rstc))
> +			return PTR_ERR(phy->resets[i].rstc);
> +	}

reset_control_bulk_get_exclusive()

Konrad
