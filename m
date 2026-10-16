Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C89046D569
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150551; cv=none; b=goDRYU6paGwAQEpPyh27VfrCZC6v4j/FxnHDL5D+s1uE431mVozOSgE4zVqAyzhST7eCUHUta1NSphoaXHXKxa3GedOUfUQqef97uW3erLMhirlwg29jHOvEd1LbtnQ3B0xDWl/Kmd6UwsLgLRHpiOw9yqQBwnWjy/cVWNnYdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150551; c=relaxed/simple;
	bh=7rGnLQyzkLwTnL9Ma5ihnIWswpQ+yiXAUh1TvP4pYi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LULIUQ1oppEgn47sd5IEqECtLHMrlCWNv000e0VV7/7DEskAFJ5D0p+uDDeN0gBRAJ3C9yOyuJBadORRg85qV2xoVstiZNMHT63AOGzXMFn9Y7WLDbarIKJhf/cykApKUVjzHhWLR9JjJjOCiMCdZLPGproySYVxKrp1MLV8tk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDIoMF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB5LNymY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDIoMF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB5LNymY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAATNV3069372
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=; b=UDIoMF+3AKQJpFsQ
	N/x3DzaGyPlgboZYc0tR4E5T44I0ha7A/G2h6BxyrbGb7ZSF+G3L7/veJRUAJ3QW
	BTAK7knRif21xfKRaGdP/AHY+akjW9ZTNRFnoYA4GACa08xjQcbHH/Uqtiecm6HY
	t5Zy6/IPjf7dI4rKIeAmv5Kd56vK5IZxVjTnlKKzcfgkKyQgDV7BdT5DOSI+K3bp
	0hu65RBdJFr/SvaCB26hWBU7qrL67qspevVgQbNVNwCkVWxRUuVZJcG2kvMbJbwu
	XuKJXeliFeRKTj9jH0rtnKXq4EjPk5JSNajkIXtkPK+1NYqSXanVQsGUm62hsTjr
	ugeWqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2623rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:35:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso4204753a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150548; x=1792755348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=KB5LNymY4yhgSNJXxCaldQ3EwzjEZCItDGGJtka3Hm4jLFNNo3W14YQu2Zue/uyx1B
         mG/LtycRyaxk0T9yx/+2P0L5+IoAuedH7EfBYpS+QFcx4XmVO8ZkUGEkQlbaDrz9AsvY
         cTydDNNcDb5J8hqi2Pbimvwm4rkU84PPNMxWBMHY9c698Pk3SlzeZ4MC9A0WPn31g1Ae
         4w8QGLh8ykydFey04QJ4IuEXxY1CaRgjfeYaZp655yOv3JXoTwWv6Q679YNDu/N9FBQY
         ZdSmGWUG//kY+/+hzeQFUTVfpiLSX8I7owfgsZvjH3l8JmfwU0RTVJlkkIBJsZ6anJDh
         RQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150548; x=1792755348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=Zsf1qjlqN2GF6Hvf1vtvnWl72BqYOSBe6MmK1NAlfhiiz2MSpE2uYcFbh310Wk2eZI
         MQTfd3BFr/nMshuYIgxnqjEoZVZ8aNuZvaaOaRw+o9ZJbn7X8YrORTtSWz2QmcCCdqty
         dMBHAfchIp6K9lT0l78Iazxw5vDtMh1QnFhcOE3xUo1b/1L9NDweL0RRPepVTz3JLE8P
         FfS4iouljg/T8dsVWbjgFlGVDHF2WMNenkJFDAGyaN1hSmvWKPqfNjRrqXKoNIu3lDLF
         CaKSIU8JXlctHaiCtXLL40Yy7daCA5AcBjdE3kR8KFDzLktLIvbxJ8xTIe3hmOZpUMOu
         xDrw==
X-Forwarded-Encrypted: i=1; AKwUvBx1v7VnMW54F3XExs1Va6fj052TzAD7sWds1KsZmPP8VWVFip6JMROag5luAG/3CCsKZd/04niJX0otOU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr7CBYCY9fxi5mpT1G8kOm4rKYCnI4zaM60qEfuTKW5IEehfd9
	DONoycKZzKRgkygoTjBcaVui7PEcDvEVlPg9IFg/7KgYGXERfLPXDnDmcETqqEgxtwrWYdPDhUH
	DkNGk5rCJkX6rBjX7BQAUofYxRBSXQnTrQGtbLYyriImUzdHO2yQ0UOKw/xCxiEClFdQ=
X-Gm-Gg: AYBFou3cJuR83st1hKBwfNKuRxczdK1XjhFWdJpbqp9FHKFgVmv5eQQhQ4kPlPzKkfQ
	KyhL8UjCoS5YyJ77th0ZZfpwC0qhnYi+OwcO4Ajkx2xlDPKkGHlWphlTienXsASNLerrtHg2gvF
	CPbnDO9hvQU8X67rDKMRryMjACDhMZLCa+JED+ZhXNUS8z7nYKoLd2nFGeergSMwbSDm7QgTOwN
	74fb4wKkDgnOCkLRUYw1xhUOOVA+6xufJGu+iGEZM2XpyEQuEMVFeOWXm0YpS+Y+WydvuTMaLNM
	8glF6qlfpZRjEwpj7NXj4HAQKpkA2M+3yYZ6TL9fOmf+R6BgAOI4FOPOtvtUAdbvaaGNuNO78zX
	daRFQDYwqrjyYsKr+pnePMJk0X0k=
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527918637.68.1792150547950;
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527889637.68.1792150547498;
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm970158b3a.48.2026.10.16.04.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Message-ID: <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad20c14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=F08ZnmPqtNv272u8dioA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX6AFp3iq7TjiJ
 8F+Ywkh7iKkluC/lyzU8NeK71SKPYTMV65FvdyTEgUrhqWVeTTiwvzbMEJC0wsVUd3Bxx5BKEyU
 TbNGxjl8gpFPfa+sWmNtHySczkNw4pKSTG4OAX/LZmBOROZgQ600+h6yiEjCJ42VEdOBWQ16Mnc
 8ZLNFjciVYrg5fAV84Fgy3Olp1FJAGFW2Sk66inehgHXZaacuQZFHnM+MDlF3rzjkaY30P07RRg
 e9JCYl2Jch1iIqrvkKry+a6Mc4vhOvk8aAC2AvCWqmCdJ2ZSRPB4fqQXObwRiKyuO/MJuSB85Zx
 9Qxh72MycohEP5JWfVSqamY2fTSm1weBEwWtmBkMdv4UaNnC/lUsWkl1DxWRb1XwP8qUonBZeUd
 fp8L7lDJTxJW/aDmHdGehQ4JVZCBnVN05Rb5vFAy+9pXMYYcmyotj+DmBYl041vruOuCcEZ6Vrr
 gXlQvwUTIK0urfRYN4Q==
X-Proofpoint-ORIG-GUID: -Uiu_XJuocOY4DhmIKMAxcKdWnkGCsPH
X-Proofpoint-GUID: -Uiu_XJuocOY4DhmIKMAxcKdWnkGCsPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfXzohfbKhvTnBv
 8lyLDUaxsG9OLCPQNUKJBsNdZatIhnBI8uqWRaDRaF08dVW0BDFBwrPS24z3UmerfMxVnm3PGzt
 y2zZXwDjbtRyxHKlo1HKnuXN+rjYsvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
I checked the register settings and they look good to me.

Can we write the delay value in hex as well, to keep the table
formatting consistent.
-- 
Regards,
Nihal Kumar Gupta

