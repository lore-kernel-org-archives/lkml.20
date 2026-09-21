Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCD4A43F6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000990; cv=none; b=Y6NY4GJL9ZXCz3amdmdwIIzy0vlok6vV7cU04J29yJSw5Th237HTDvQGIpA4764BQERqdL8f3dTw0BqS64e+DK75y3pHd0c2wydIqKXhywkRcXmdj6KUFgz5hcqGXFzTJO9IGPi3XJWsu1oXtsv3gJGP0AuFsoT81lKDP+SS6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000990; c=relaxed/simple;
	bh=EB+e27vXkjFjqptW4gsfCinDdpvlRpRszmTPbLlSRL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLIosThnXK1faqxlYKQeyLhXtvnYUH68FHRCpy+rWx2sBIn+rtIXSym15YS+6fwMvLhps1iqvXE+bsxur+2ZFrJ9s8iJw2jQ0Mlb7BQekAp6m43cnjS8vL2CYkqasWfFXMT+wwlKc660ZI1W0x1K958Wv5fnOvJ1YqGOOeODwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0rd42kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDL6N+uU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0rd42kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDL6N+uU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGXqp2042147
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=; b=f0rd42kSaQMQZz7W
	8FiDHdQhty89VlB6nROO+hjbiZJgRDvwCSvhGirpiUoTQxhq2WCL53ZSD16NChJs
	5lzxe7rnENs+YE3q1UDgbWkPJIXG+uzMJMn7FrUL8K4I234jvsS/UqBZX85w208P
	pHxUE59uGvQTjk459tx7aXIkqETo1MBx7m4/fYT3aXqDzicVqayJWgoqirb5byVh
	vm2WJlgSEv6bdhNYONlIcxacZArWyM2uHf7CVZUZmmnLCC7QOfcRtJP25KFOfjvZ
	tH8GNPHkByfD7qSErrtZWqjpX61qLLpVx6HrxvhDDdXPcjRqDIswdP2FSHwBp1aT
	Wqo8iA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw1rhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:29:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a9de094143so7191137.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790000987; x=1790605787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=;
        b=GDL6N+uUEvnbtEVVYyyHIYNb0A3HSTrvNilW5vnEzvk9n9c2ze66rF39HWVBZ+WQYT
         6fZEDkb4YM6GxpMvi/yCoMxGPIHW8q2YclNWusi5FhY35rBAScYW+T+F4NxeOJfKNALd
         Jgcj3AfR4UO4c7+irYwErdu26r4EBrNkmx5MkYqiypoUtfntDC//jXNdwCMEBLOqb8qZ
         DPqOyjdRxMKYdTZdpCnYsCsBXpFaKgQd/JHTTAlRtkLVjGs9uyvc59cE+av1SUbwdn83
         pCCUV8pkocC/wtu/6KDOvf09mI/ASfaY/Cs0DQbw51BYGmGn/Tgoxs15f5F58W7Hek+L
         pcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000987; x=1790605787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=;
        b=kYmGTNRLn/Exs3srdAo+8wK5ddNoX1bf/0yck/oAyzoqBAuju4YT80tPkS3ZDzlrNn
         Mjuh/5xCy4mxt1ePgFbTbu6zc3Uosa0Kg9kYv+fzVeLlK28XgvYaaC9hFob8wXJjFdSw
         OnkcdZNCp1DKUIT3Piwfrezj+TYSFvnK1DzT8BvDw1TQp+CM+hW0ZQ8kgbDedMtxllXD
         eWtbRS+jNOTNuf6N7pO33zINJo0i0fFowSLflkjQ12sJNr3l0i8qQ7q7FSOYH+fflsL6
         2wAsFU11itw9HG09fztHVxh9zodoDdYzZa/qqO6j1g+aV7QeCFl3MgLGXGefGiRzLF/u
         aVLA==
X-Forwarded-Encrypted: i=1; AKwUvBw6VoDAyi81KigRlDoerfXaXZQzNDJjpI5QTClDNkVHKGiutr3oa38clBq8hAZ6/rxiv/bIHqBVwxMFRMo=@vger.kernel.org
X-Gm-Message-State: AFuF++n5JpYSs2kNXm7+Yo6RfnTyxx6DgUAFjTM1YkK2NTLyoKDHtMFj
	f6yDPS7KHCjJe+CSfanM4jLFaaImoKyTZ+hr/qx9GPa1fJeq6e2Eqpvgz27s2jcAwu4/EHkxmzN
	DB1GOXMWwSsqHvOX3sw8ljUMbo/UWOHZjA52so+ajJGV2+Kbh9n6I4FQ+Nv6wn+L6lUI=
X-Gm-Gg: AYBFou09NYdKVi/7vjQ8zUYZjMgxdDYEpbK+rAQJrTxFFXUbPQVqVG/B7BNQU59ST/z
	2wGdch+pcw2Ulh/iWi8DDDoLVsbgdp0BMN4vtr0SERsWKoiKETZsOAm38b3JKBWK1qXa5No3/7p
	MUQ67ghJ6RJDc2HmWFEsMcFw9oZ+sHLSZ9iMMaMLaBNkPObvA5t7rEXUWPtBvIy2T5zCcjIPU01
	dyUGdhWB0skZKMhxwQuLye7+G6TSvECcng6Pn4kL0KcvsLgT/aJYpza/2bOmto8ihoOi2w9IU0x
	DndsVMi48ODGQGYOPy0KHnmMio0oKcCsGIQgvsXH3N0Ui11IX/A1pMVpib+8LWqB9srL4dSSkpu
	UVu0fY9wRF5wEqkCHdyMBPQ==
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr1217886137.1.1790000986918;
        Mon, 21 Sep 2026 07:29:46 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr1217842137.1.1790000986500;
        Mon, 21 Sep 2026 07:29:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3572d4d5sm316686966b.33.2026.09.21.07.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:29:45 -0700 (PDT)
Message-ID: <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXypNvmPQKpwbH
 26DVkqvkUaSRvKgEOpgQjRArBcn818jq1bEtuwXmkQdVd61d/+Jc83G2AVqwHbZNpmdnnwphL3n
 jLqIZfCZvv2PuTCvzgHxQW1C55MJeMW8MK0e3R9wncX2eQAQpKs58UT84vV5evw2JmT309MADLo
 iOXvTa+cUYOetJ5uiaj+rvoVyzOPrMwLG/iD09AtN04AYTID+VE6KjvVo9tPZwepO8qUS940Ix5
 ApZn0nrsrPpzkUmJATyTrX7iCsiWQgq891JSNtk19TmpLSeWg60eIGqzreqUtjEmQkdVEx1qchu
 k8xeW2EZ7FBbyMoyUfxfhYQb0c4ICMDNbRxj9Kw7/7Sx3pHpQ+c9RrRZsJo4N8o1BcHBKZwHBuS
 Wg/yxMrHyjLZtCeQrusBdWuRCdyse7mEv+Iq0+oGoU6OZADvA8aAxRs0wYkizqYKLHGEB6HwPLk
 vBItT94MWAD/J3B6B4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX4lJGirXWDX/z
 NhiiXvPwYP/Vh1rIiKAP1Yi3nM38gSDFliSD1MpzZK2d1+uTHRMpZ7RlPdGRGaQltcp5KUj3fnX
 7/wRu3qz4M8Xq4XLWTAOUc98WSFlyBE=
X-Proofpoint-ORIG-GUID: pCSSwnFplFonk0Hy2W3BCC9twxkmlLNW
X-Proofpoint-GUID: pCSSwnFplFonk0Hy2W3BCC9twxkmlLNW
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab13f5b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iXOO5Yp-wZ967jpTHC4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210211

On 9/11/26 11:08 AM, Maulik Shah wrote:
> On some platforms AOSS do not respond to read requests. Read request in
> such cases will consume the ACTIVE TCS but forever waits for a response
> blocking the subsequent write requests.
> 
> Skip issuing read commands on sm8150 and sc8180x platforms. For such
> platforms return success to the caller with the resource level at zero
> to avoid the caller taking any action on error code.
> 
> Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

This works as an immediate fix, but I'd like to get some
comment on this:

https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/


[...]

>  	DECLARE_COMPLETION_ONSTACK(compl);
>  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>  	int ret;
>  
>  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>  	if (ret)
>  		return ret;
>  
> +	if (ctrlr->no_rpmh_read) {
> +		cmd[0].data = 0;
> +		return 0;
> +	}

This should be -EOPNOTSUPP and consumers should handle it
appropriately

Konrad
