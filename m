Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609368;
	b=Mg280KCb+fwrN+8L0Q7+XOWnkaLTmYdacqj7wQ3niKTtoqa/9I7hUGvkuD8Vq9cdfp4p
	 oxTe/3V3M3GprGS0tEP5TuQfJA6EQP+IQ/Re/Ezv1/ViLPY0Wufy2FXU2hMLeUQ1DcULk
	 xIK17aznM6x9jnxauJKyLbdRs+XKpycrM2OgCtowThZgg/Wv9pVRVLzKfdIOUfITjQ9xw
	 nMumRAsmhvwlh+2F0f7jVqniBLOyDpB+OWqWSVOgP+ULpBi+XMTsrWwnROaDiypQqf9DD
	 KFI1WTL3YRI5GA9elvyMlaNGxWnSpwA6eo8SBq0bUYZdkQ7aTfWPDpSXKk1b/uUx/Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
	b=YVU17WeF5T0osRInk6uACTVtCshDs8Dxfne/e0qMvki6AMUoiP+cliwodwQU+qW5FJkp
	 XLg+I6lhmGIFCe9SkFVNi0yFm3RzWHe5pzVQ2+wXwayLMFSPzT7l6n0uUhF8dauS5L5Xy
	 oPTE5o1qJTlouVggYbGY7IPz3rPrQ/Uv96IZJfzXT0dqxSWiFNEB76o4YzB+Mr42QUOcy
	 Eot92fkE3lYigqRh5YFClctKY3+YY9x49Y0iADAc9J9f7tFr9y4rUFpmYSKi21Dx04nMC
	 nDzaKvOKepqpXF00/b3T5dUNXB2lIOiwp0vC/kkT9P23jYLp8zJqAPQZGar9qAgNfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmyCEO9L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkCeuaW6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmyCEO9L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkCeuaW6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DQsg2433842
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=; b=SmyCEO9LfONwvSRt
	StLn2azwSGrIlW1gdqNpXc4w2ltHWG6BFIVQS09xcrvLfLuX0g/U5V658MkpJtDR
	FBMNWIj3slwsmU4vLr9i607nIuWj50MMpB7oB5nqGTU5pLozF5zX4UMysIbrfeLk
	0rrxpsBYnmLdxVbnhuVZCCfG0oFNZ+aqt0nTuEQxFmnwL5MrWzrOH0ch4X5AeEg0
	JLspSwCoRT1RfQ2xHMLitDk64Cci6JVldDH7uxf5h2as34gXY8BfmTE7w1v8Geer
	35uqHn3GLBLMxVlZyxqtjXaL0wGN2dBSdw9yhzUTbWGt6dxUW29hT8tHvyTxa2I8
	u9Pxqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60xe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:49:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so6465701cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609366; x=1794214166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
        b=PkCeuaW6dncemdAGyaqXh8lvbsDOrzQZJuYPL0G8y4d1UotW2U5bDdgnHwUr1bOJ8w
         jzGDY+7BqZZ49cLe5pEwlsEqwE58/9P2qeIgpAeduThy+6FwLnD46UqhmQQO89jo/PjF
         uvA/U0pqA5N808/8IIqfKUTGgTaeH2NiZYugffgMWAUn8gnrf1bnaXqzmDfDxRyEtryq
         JOsrG2an0RBXxdV7v4RnZPkbyT8JEWLD//kxcS0qTVkqCYs7DVHcF8X27wjOv2+b8u9u
         SCgKP9AvpCLmKwvdFe3MScQ+Fs8ecugCs1F49El/7HENWaEN/29HFVJfweec5y4Nvjp9
         v0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609366; x=1794214166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
        b=vwzKloAaCMAMuNMqmHEbeYE6/GAj7xwoVH1GIWVcEumhLk4VmGSgfzXO9TcsJLgSwB
         3LQCwS2GAdpvpaozfZmOuJ7HYY3ifKQtyzBwdZJd1dsPrEnipoxMEQsUMgubQfsvTIOI
         YS8pm3St7pKJ95EXowy0jJW8aVnjaOLfe8dZAkI9XGbzHYlodmm28iOG81rwDcyRAjtw
         taYwn8tWYzVSsUAKztohNdC0WRUH4PFqBWak6DYQ8vAP3Ts43dPcT5nOfIYtvMWYCVnU
         YaMcAKjdkRCdBDEJMp6+egbLf/GfzydmEIWK1nsqTMoVAdhue2UKgSMLkr/CeIuq5StA
         mXvw==
X-Forwarded-Encrypted: i=1; AKwUvBxSq29yaEPfaNBncM2YYuOaK/0e6TTSmHbvuwqbgwjDDgDQBzeMCKeyH3noh5FVrOGJHDWREGQquWmfj0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuAw5uUQPTgIxDs14N0qmY6++UYysUVIAa6ntTEsdO9vDhdtP5
	Db7AcTNl12UGgTqUUsQry+nuXEG2vQNAfLzupoJBw33LYvbyl+1/srAkjLsOPMxfuHtFbXtOTEb
	d8jrXNq/9/AxfxirHj57oQZfY/MUnya/zFehrwjioaUBWL4dJd2BWu6S0Vob3ZoghF8g=
X-Gm-Gg: AYBFou2LbndWgdBbeOX8lhZAbtXiZHNn9NnjkHR2OtP9eMtRcs3xDTyl0OLipjdUqlM
	3Yd414MSFo7fF3WMp+VaI7JYNxcRQn82s3tGbJ5Rvb9/02MXKIbtyfsMXfeAfA2+bQA+YfAFPmZ
	XCEwtkR2guJT6nT1nb4dW0k5BGKqI9RPDbS0OtNRf+DkXnFmAb3k9CT8mpSS6IgxFheZCuGXt3X
	pGFeWfoEsG4lX7YhwvTAQLtRp+18Kz7aU1wzvmz8Np1wg0HsShCxPO7GswhKevdbePC1oyHMU6y
	ATK9IBmFstFpeFSAan5g4oXDINRlH7kW4XYmUPDcLGwj50Jc/6MOGsN66FucHeY2zNrlIdKbCxi
	0TSpNXSvs4BdkrB+viEnpvI6m45b24YsAZosAK5WqumegaC3FQdapt/io4XjdPqh4lRr9d74=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1689166785a.0.1793609366189;
        Mon, 02 Nov 2026 00:49:26 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1689164985a.0.1793609365758;
        Mon, 02 Nov 2026 00:49:25 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabec09fcsm355582466b.71.2026.11.02.00.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:24 -0800 (PST)
Message-ID: <b1443310-fe55-4a26-b12e-6ff4aa64078f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:49:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
To: Asdlerto Korry <korryasdlerto@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102003508.341309-1-korryasdlerto@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102003508.341309-1-korryasdlerto@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0OvPOuZlVexqej7PobmG7bMC-FccLXKo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX3Y9KrT1GdLVQ
 8McfkR9H8LR2nVkFY2To7ZtWamypW+dadKSPh5H1W3KLMPTCB4emUpLUi7TVEbi0swWon2LNZ6z
 n/Z4phKNe7i56hC9DHtTQOU9LdJeNUo=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae84e96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=V9RLX921IsFKZjcHrcIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfXwAnWe4Pj7l9l
 1Jg//POmHVR9hqiwx//N1bdkkPUk2vV0XSmAyvH7/Jn6xPO3xdYsTvD74ap2eUiNJFy4k3hD7lg
 00lj7uiRMhZC2leMgtBvMpyQV7jW0+uGveoNI9QeCDYnmkoMADdnCwfy9zMGbUUuShm2Ftpy3Sa
 qR7N+ntQzZcF2oU7f19apNn2vrJwSeh/KkNfc+uWZrqunAkB2L3HY877HatTCeujGL7AgZ5fP4k
 0bKA1TRpKZ1u49Cl0qJ3BI6HieyFAaV6KSR0GwD5SI9HJFLYEfJQt6vXN8ncZGMlvU2VMjCOumn
 FgXPN/xLHkS26BXNwk72axjrdSI+d3PlYTxZ7W8qMxb+zIUmfmejKGDGSvIzYlzwwww9Ro9GY1W
 olVVjSp86CqxzcI12M7NRBJ2Mo3mV85SsytUmH0XDAKEo7J4A2z3ixY4cqfVTjOX9i2wPHtCzUD
 iPRfZHq72PJ5lHUX1pA==
X-Proofpoint-GUID: 0OvPOuZlVexqej7PobmG7bMC-FccLXKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020034

On 11/2/26 1:35 AM, Asdlerto Korry wrote:
> ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> print it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and calls fwnode_get_name()
> on a pointer into the middle of it, so the "missing reg property" error
> path oopses instead of printing the message (seen with the same code in
> pmic_glink_altmode on a Samsung Galaxy M52 5G).
> 
> Use %pfwP, the specifier for the name of a fwnode.
> 
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
