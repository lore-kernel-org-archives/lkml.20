Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F075471258
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255930; cv=none; b=X68BxIW5wQ5IMBBHcT7ptKODtHPHBEdu494GdpAqMtw+Dnwcn+Of0SrrFpZvM2wZMarYw4tm1Gl6ZLvg2UjJNCGdfDI0T1t+185NaLf10TEVI6+Xz/sCLEM5PuXodG/TO7iyUZGfNt5Cu5Sl37XkypDPsJsbFZjVmQc5CYPov4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255930; c=relaxed/simple;
	bh=1zi5QMlOCkuOHVQwes0TjXYaa7cgVBDSdPRT3fzLWAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NG/owFJtiyKaFXXEWrfInMXIMaAWcvox0f8QqiGMjv3QVSGOYHWvqtqKoPQhjkOzYWm+X6CzbUjzfoRR8E55LeuLjdpVVQtOQG/dBFwfEz9Livl/KR2RQFDp7cxWosqQ80cmdURT7lbH8G1WiSl5SNOPH6iViY+kPYU4OfSOKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCJaobWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNjRwFWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCJaobWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNjRwFWM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792JU705425
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=; b=bCJaobWxg8aGVFvu
	IsHHsXDLKIsaEG8oxHChmUrDujzzzCEHGEJ2TteU9kosbNvH5pvaxYvf5ZYVGerM
	uXUs6oKD6fk8+A7AbHIAE49po80n6zPX+2l65n/rcJh3pPnAq9Mms/aMfezdYYjk
	j9s+bY0HBzo6fxvywXqp8VagroUUsgCav5uAym5ync1xo0dBTLHAQmsu0F3Sts4U
	FtcNFCTDp4bFrXEa6KrOlfOceWMwyywnn8Huny789xdRM/F0yvfK12aDj1/x63XW
	EaJh9oIM4eJ3ZQKDBLT4jzT1sfloR8JkhQxiEyYqd+P3LkjV7mr9JXPbju7dad1P
	rPX2aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh529-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:45:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so117386385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788255923; x=1788860723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=;
        b=iNjRwFWMYoxV5C7ERA8+5qSZ5PxRUsLucj3POTbt9CmM4WSIb+w3PZwKQrnF+xvKTU
         HLvXTvfZFOHtIDs6ke/2yg9k+OnLsRJTIxmGQ8qtKodZHVEJm8A9lVRLRkiMCC+U71Zj
         5i93BoMlET7LN0OK19Yb3ELATZ4SjGIARDFx1qZikz6BSDFitN9iThXxn4630vardRav
         jIt64qZfwskyI2y3Ta4dAddFLJoXcyH52y0M3g5l/5FJzRupg3hwfDiTeJR+1krJjlyp
         K/cG+MNglJxQWzt1uSgkGgi8bOyGRIl+tuGwzXP3Gc7bxk/JaSw3fRsvw/Sqh4bU6ezX
         FqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255923; x=1788860723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=;
        b=qeeKG38yh7XvQhAa+zt35IcwUdbH9Wd5cKMlnRxN6uI70kEUlt0nqRFVWrdVmugb1X
         9AYLNlV8S2UgQIVukXL08F++TemMkQ/Sd9GUXFsZWr32LH/6w4A6KcpaC/u1aLElnhwY
         0mu+7mU0Jd2G72LUp3MoMuzMDCvKA/9ptbrQFPcvWoXhIoIzM44PtEgTcG5EpI0uACmf
         KLM/JAv5AnK7hWPbPKxwpOC1bDSXSns5b4GMniH8mHFJPnjiX2gnnU7nP7BaDk/Gq/iC
         KEmU+8DfkjDcYIhtmRdyVFN12piw21DpDuTVYJJOJVcnk7YPb3nFUjy+G/aBPyXY5anj
         eUPA==
X-Forwarded-Encrypted: i=1; AHgh+RqxIN6gj5gxQpby+euEAJfakVwnz9RCVJDBwg+EqIRLcX852IA4+nrl9BoZtrJ4HJ+uHthkNIsCu1Ei/G0=@vger.kernel.org
X-Gm-Message-State: AFuF++lcMM1eJpD5+7CQVGA3mfhXdh9Qv7J+xLc2mOlR39GanrUjbYzG
	Frj18CAH3E60QNX4vKiq7XhBZUh7PvFMAFXjAgeZjjShL26+fcJrB7ZjY4NajxkzMAnr1tgx2Fl
	NjDAN2pJBZd7/zEx0Kzw1lWO3Zij/5oW8UsXSwNL3xwsh6iGQaee5u1J/oYhfO2g7e2E=
X-Gm-Gg: AR+sD131KEShRa7jrefaKWDXWYJWM1C2CCZkGhfcK+jli1L/oKjpUng3maLKVTim5fK
	jfQYhTUg9eBru09ubwPzZ3tid/DvWUqOnQWDYUil0kjc5Ym2UWKcbvXBZ2ChnxMUFO4JB2DqXof
	P602pnZlyXyXUFOuK2PcvDM4scRGhPGasx9WApqOOHH/gcWydR7I1eMfilFK+0RH42pr/xQuZW0
	arQa2YyOWDYDGFoZI0wmZ7AZ13LmovnndG1nkd5xwX4VqhNbXXYZr+ADFanT7mSgBNJvFHBrFNy
	WCz88moAiAZFq2RHWZnAIwKaS69V1JvSy26wSiYVGLXvNbfYJBv+hgePJ5HIU2zT9mAFqWje/VW
	1mtODoR+6G9wUPqMS/25jug==
X-Received: by 2002:a05:620a:8907:b0:934:95d9:85fe with SMTP id af79cd13be357-9392877eda5mr1438612185a.3.1788255923576;
        Tue, 01 Sep 2026 02:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8907:b0:934:95d9:85fe with SMTP id af79cd13be357-9392877eda5mr1438610385a.3.1788255923169;
        Tue, 01 Sep 2026 02:45:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f273e8bsm548705066b.62.2026.09.01.02.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:45:22 -0700 (PDT)
Message-ID: <5f074823-8448-449b-94cb-ee98026f2612@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX1tsLOeBkdBGv
 8apifydUITRA4iW60VC7KRY+8frWmKOox6J51jkOCTsYfWKhj+QdGZqJpvFIItvAFpoR/y5MYQq
 FKCent144PNa+bNbRA5nLrsFIDuaFUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXwSQ2VrC6WxFf
 kIu3MiAY9q4ASzDSTnk2txsLud6x+fACIUXrufmM8tohfhOWrMfe/3GAra9gJmFXTd0vtOsLz7d
 FaLQSOMcuczQHnnTQUj84aGxndqRF+3Yw/tmrtjPZ7+OpFZK/A+45zwP/jrbKHYArDNWXRqH++4
 m6n6OuEY7NhEuXQenqbAtCJrGo6+8UA2dyaVmRQ9CfApuk4eisn9o+e+VivuUGqDo1VLmRmQqg0
 2Ec5MYaJ+/RGpcWoi/cIOaukCK9eN9GN8nJgqB6VL9yaVO8YTCRdYGaXIAcaxIp1y0u84j7aM44
 b1pN4LKFemzLM9SO5pHmnAjkXgpugXGaY8bkw4lUwU9PJpXkRlndKr4vK2TsDArSjiztE188+ID
 lWlwKhBcZ8PmeLVnflgNbFbAaIJNsaE6MdBAjeswXNEopQ60JsGOKACYLjgRELzvCSyqN4lR5GF
 8mwRHUenKAHsodXYS/A==
X-Proofpoint-GUID: x_yrzNDJr71EDWoIqLq-vWiFh9bagKw3
X-Proofpoint-ORIG-GUID: x_yrzNDJr71EDWoIqLq-vWiFh9bagKw3
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a969eb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oSP5u9ADs2d8oolkbGQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010086

On 8/30/26 3:14 PM, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
