Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5417484246
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256237; cv=none; b=IKZkDJ0FzktTrOPjgP3D0pQwp/EnL4dgPtB9qZWqlhnjoAhJcONmHm7EnHgLmfsklYHLt5UNvMEqnmeHctLQQaeVE/o94tRTWOZLnvF1gmTbq3OyN7UqzXP8RyD+VLdabXeOTS4U3NELbxqtgiqLfyQBZKdSJsY2qoesadSuieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256237; c=relaxed/simple;
	bh=QQy5B36lU1X5v9eQWk5be9ZcLvThEHoip2L8mmPKWys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GT1BuEO6e6I89kR89FW+nfvQL3CFlC8bdLUTgKpdcgvxz+x3yUqiikPVoQHN0giaODskEWRQT3KPqaa1sUgXDeIVkg2RHukSeMAFrJPs+jbBsqaCZIAld3fA/lU4BGepP4iUrdyRaQuJOeR96XLwlJW4Lu9aoL3KLpxrxZ5JDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRK8wSwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmX6MPlB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRK8wSwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmX6MPlB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4WLB2749207
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=; b=SRK8wSwGlqXbZqtB
	KPcdW2oYhDIhiV5ufq/o9bWhM1eJbYN9uBD7oeHWEBN6nRCHYrjxmwTmuf4CwoPO
	U19jMxUwAiTVw8454KzQU24L8h6gkCRwuv2UcyrawCTSossOCL/UprHO1MuuWSrE
	ceSQVCBYYj4Zoo9/KXKBD1u5iydXCOwW389af3Kr4BvHT+sTmNNUbcTtHtTLR77R
	vPcBemKAmZibb37N21800aPUglLfEPns2YIgiK26robp4H7FtTWmsxKEVVF8aMco
	sE3xrEtrKeHj/y1bQx7LYRjTZO+qPCkxj0re5yWSNkHY2Drq7forz90wCFnQbiLk
	2OZN1Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90r6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:23:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78580a6b2fbso687124137.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790256219; x=1790861019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=jmX6MPlBYFbgSnslMFj29MJw7idbuC72k1uWXTOuFOEpqXCWREwYxQBoabnHbPJ/p3
         5fVqvsxkw0E61Seo0HsbwCEH+XMc8/kvlpDoN4xWIq0ImorGYCykdJovXIv++RLoAkjF
         vt56BlSRzx36C/t4UU5T6XG1LKdPrvzVJZZaGfs5j0hB6bXRE043HFTgOnnZZz9EGyct
         Qu+C2cAOw3QRzPJcLCKsMDUiQatSWbodjHSfYaIcNeIz07Xx35anobL2NgJsagoiofdh
         pmKyqikLu73DNm4BlJSwTK7bK+jtTxUDbU+9YHCyduHSAa+ovsldT3KNFEBLvcfYYoQR
         UE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256219; x=1790861019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=0426XF/BxjfjXfBMXdJsiOA9Fq3r9aRCe+lVyLODBgnSboUSscLxqRPYvBxY1sBMM0
         Jg+Rvt+PFrs4pn8/2nMmITdBuhnLcOrI6JOAHAqtIlrxuFgYUZHxxhxi1kUcEMOGaZDm
         VmAXs/Mf2ZdPUvb2aVs0+VnkLVRrgW5d9un4AoIbt3Bq7BSjKjqN67OJYzp8GBKqRzPh
         2EaLvT7eY8vVoDbKNWquYoEkDEb29v5qKR/cU5mk8ptkSk9ffUNikMU8SHQbbVlU03eN
         NLML3OLnjmeQdqmG2zCu8DUuBfI7lELX8BZ9V0GnI1JV4lvSsIGDFCQLNfSFu8cv/YOQ
         ocMw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Jpsw9Bp9EpD3cyQS7oJj03rwBG5e0mzExDQ3oC7NnR3YuNhY4vGxtlkszZRWq5Mkr9IjmCcaBzEIt9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mUwrlq+Ia/dfzxEr/ddOktnDQXOQXuM6KoxJV4wK4ht995Yydt
	eU2rUTYXjjL3mHvopTsOIA0siiT+iJnJ2RXvVR39weryHkUa7uj/QcVWlqpzlX3SLmT8idkIIK0
	k6HPrL8FaJ2aS42ORQcWYc5GQZQWM+hli5kmmlI9AxStBuIT2kEXgwHv8O9sA9bTc3eE=
X-Gm-Gg: AYBFou2DV6fR6YfVaPM2GJxctzMsaqH/Hf5OM4pdAwmPlxn9h9jU0603oRRk+jyIx3A
	BuvVeaS/dbkfG9a75JPU6GYI0p+Q0ZcbVkdLpM1yuhBjBVINgFMwBQz6jTM0smgTM0QAhPZHbqM
	7HhQ85coGUY668NCtYLYvzFilMlg+AhrHaMwxwPKQB9nvcPww7+qwFqO/ljSSgQAjIGG8tIJWSh
	A00ywCdj20cSidc2SRNSUDRWonq8B3BUe4SZMUqMaQlh6W+jy75lcK92Wt+q+24VyQwM5kNl3CK
	MXIJIrl+H/0m4J3AMnDtDQv9ApVItJynNd2xBerrSbTKtuTnTYSbOZuXhnJzVn1Q3KfxsSdprti
	ixDqZEL6h415X/2HgB6RIZgX19+j41wj3q2o2gY7ordgCfMIxiQXbsjVe
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048821137.14.1790256219147;
        Thu, 24 Sep 2026 06:23:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048810137.14.1790256218594;
        Thu, 24 Sep 2026 06:23:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:31:4ba7:4aae:40b2? ([2a05:6e02:1041:c10:31:4ba7:4aae:40b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm88794545e9.3.2026.09.24.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:23:37 -0700 (PDT)
Message-ID: <3b4b7e2d-8f0e-49bf-a456-d14d8a0f7b76@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal
 Monitor ADC5 Gen
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX2Lq3yAIBBiu5
 g9Y/cbi5NWJqpc28CH9BFjFHderua4OMECgNiiWew4c5tswcyphG4fiyGEa5SDm2pBNznyDte3z
 NqrTINOJF6c7KrezWDjN0k1zINq//Z8HL0YlPDjDGxGatwhVALgk4bU2uAur2w8byAxQu+ktha7
 Ar3P1anK/MIOhwxcainPlm0l2GBOMIltLMnFPbfSwthpM6Eim6uZ4HxCZg3k3XGDHOZt031ZC/D
 vd7iCfqsgeL6nvWdm3GPVkgvr9i62jLgxVXSHrKBzuZZZVa8iZC407LatwrSmvQihiZWfudvizF
 VqQ+jmqmUnSpE5vz5lAx9Okv9uHW0Gu2pQqp5fdZaH8yCRaddfGdhknPMwM1Zh5IxpK9p03XOEG
 yI6d+6B8PUwb2VEDpem/dep4dWvp9R9JkFQ2l8c9u9Nwl8sPw8caIKRioB57F2/yq7hGZD2OjH0
 IGPsmz0VzpndmHuOX/Q==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab52460 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=j3MtvZii-MdXzgGxfbUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX3QQA1trXQ+gc
 Tds3sJy2UCxRwiHAMIfdeo3yTo4GDjvDXs28wwO+1++9sBXzf0lSfDpikQR7uolv35G4x9rUkh0
 SMde1Mf2w1DCGEmb0EBtmKAIzsYW+Bk=
X-Proofpoint-ORIG-GUID: Cf8VzKIg2YDiLxBHEmn92tS7PmXZWKYH
X-Proofpoint-GUID: Cf8VzKIg2YDiLxBHEmn92tS7PmXZWKYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240055

On 9/24/26 15:06, Hans de Goede wrote:
> Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
> necessary for thermal management on Hamoa laptops.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
Thanks for sending the change

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
