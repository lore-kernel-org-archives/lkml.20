Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19D4AA02C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556290; cv=none; b=m9lEOv1LRxyF92molndcMfOC6rMctxFISCRXc6G3LBgpubhE/y4UCqJ2lv/75nHsriDP6crAiMd1OpNKjv4o4AAj4/CQgRJTmrKUvmr45rn/0nsU21aBptQTcW7LsUdztQs9Lp3yq2G7Q3oNMK/l3Y7OTfXQeGzw/eDCBbVzQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556290; c=relaxed/simple;
	bh=OV3wyHhaayNQTC4WjVNcdURR3xbxXd+E1ZZUf/4ov70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyXbob/RnN6d3EHlmAlXhFSqRlCeqAbFgt9mU/bdI7dFLy2tq+fk9KHPD8eOA2up+UKq5P3T41ojGtMQJSf/T/9hGCh1pzuw9KEK8HW6iwqoRYdtWOZeTM6/qQMEDE8ZhxqGzP21r5HuJyQnRDeKYFGNBsJHQOFXG3cpTOAcl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvY/DKKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3oo54Em; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvY/DKKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3oo54Em"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eZI3169101
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=; b=YvY/DKKV4DWYjclx
	I1cG+koc29eOnYPpj9sCXfbLUr8yBCs9eXAEMNGwympZdsrz2uSo3IL+UQaESejt
	lyw5HfJC5j4PMvGu7M3LrhqooZMs9mlY+KgLgMn7lA3SxzvCXmMtjiSp8Q3SG1cW
	BBov5R4fzwUtSzVo+eTHfAZsJFjBlC3M5LdnXQGT4yZsgNOC/MHo3LPi4nBfvPtQ
	BaOoYMyC1ZIGo9HExXpPIhbMw2fPNevhy9WSR/+LZsZ1xKKq66n8TiPFON2MziZv
	Q/iIYXSkBWidMI+auJ/JNnieOckjov6gjt2ZLJ3vQkapfUBErQYcJDIBd6fxsq+C
	9ZnYNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rsxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so1740005a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556268; x=1790161068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=c3oo54EmEHMTU1F4kr+DxKAGljOyjt8MTjSaeTo2dOJ3ODeGkZjZ2jjwpQouDpfFel
         t0Cx33ZdBsirlX9nNMiO+mdv++t8FYCpBFFa/e2wxR4bIzRj7C8X5fX9HFNFcbAfM6EP
         guz/Qu6WOtQHtpULHewfE3F+WVuUQEkMJM+jdq5r9N366MjAJRmcrRFpF44eEVxMrZoy
         6VsR2QT/76IQvrFWppgWVS16BEJWXkqfLqQmjIr3G05Bx3MBw4V+kq9edmhRy7ooEmkX
         r86pqPzmuog9A38Amt+ximx+fmt5pYsbQSvlim8rKnL1klQAIkx8XE6ZCBXftqhN9BXU
         s2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556268; x=1790161068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=gR4X68xfpNn0vZxms4v70vShQJDwABM+Q9DZH3p81tlXYnEDLigMTxxcJnq1t9IRCf
         KwoH+RcsB9EVfkZZJg61qQP+vqSdyDgFU38O2X8y9APiYgU33UcAPWxeQd0UzMiCo9bS
         m6/8PzMoi5Jgf0NCSGCkj1T5KFgQg9/F3FVbIYeVkMVDPZaM/YqwAVfQySsp0UhSJiRd
         KR3BeXGcb5n4RoqPJZFxTjs2ty7VziZK8AZD2/+S4qt2/VzKk8/CMpN4nMwEnWKwIWWk
         YzMZQyAX8v1RsnzFl7QoYCcvkZplI/2u+V6mJY5A2xH9ThX0aRvcY4PQzgMLd+rvwiEp
         0ecA==
X-Forwarded-Encrypted: i=1; AKwUvBzdeVSZ3qU1OiEOUq23FYylrqXwnpeWhqIPkcJl9Qosx2giGLd0ugEevmUdaYqWBt3qvffhVj+7Xhwf0zo=@vger.kernel.org
X-Gm-Message-State: AFuF++l7s1H3n+chuXVC6dKWVecvT54p2SloDTUkqxsoVV0yBEHx1jX5
	LTEJEx+m0NOMgOwER/7aX6WbAl3+JZ6YDdxjbILUSBasvD1WJwi+Zw4uXIZH1VAJ7ML3I3mfCj3
	5X68i/ux6X4/zHlWhEPGnsUlLOzkCHltcEnJiiF+DkyjxMIjHSQ9omNEOEshi3NcWDYPyTlZIwJ
	o=
X-Gm-Gg: AYBFou3F990etJsllBV6thgy+UxTl9vuDoAXYVci+KsaNO6HvdS1tl6R4e9eBi/SO/q
	oaJuSAl/ieYNTqe2Zy4fQ9IdVwHpxSv0CLD27t5S8pL307I1RVER0yVr8z9j8H96RRGjU2yOtwu
	qzgzOx4g/2yY0kjA6zhmxP/KTvg0vtXuJmSTIWRv8ns2PMZbR9RVSFX7asH7ULPRQ2dXFlyQLXh
	7c9O9MnFS3wdNtEv7GcsbTuP7MMeXnUe76sGVpy1fQRj/5+jAKZ9pUFSUizS6ugJYyQgTq2CtCA
	xwBbynWtqs/j03CcpBcH0fhXMyHAJ8YBvyYXxFFtrPn6BXyM0xYayy5VuV6OpYdWtnaEIR+jf4r
	ov39fj9ccdq7K9Eimsri5ehThvGbw
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9041015637.4.1789556267845;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9040986637.4.1789556267394;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm6144623eec.19.2026.09.16.03.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Message-ID: <3d6cffb6-2442-48d2-8c40-c5160c649ad6@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ORKmrhpw8vWbk61W9Csr4VMv4GOwZi3m
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa762c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UlBIJfxCiRem9hGYObsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ORKmrhpw8vWbk61W9Csr4VMv4GOwZi3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfX9eTRXXSvNPFf
 QMEhjLYzAIzzHIbbRA8RHn/xdqkk64dhjmvFRT51I9i/3YHtdNXxeSa87KTU1JPI9Hw64W2cZWK
 XLjnIVz+JVtmpB29Q2prhiAEK0SzQ6Ptx8oBAY9Bct9Ez3IJD5pZa0DLej0i1Ak5GD+7ChZA5//
 31xOgH9b+tgSWseY4rIglIl7LZ48njHoMot34nHG6SW/ENKK7E0wZSE+AYdLExPIS1PObwKYhG+
 IJ4DH1ePlkxbzwMWD9Dl7M9AddQubyQ2MaXXRTR4P2Uzze/iM3YW5E3lwKDyvxakfL0DBc0gqNc
 qj3Ye4xKzgk6EZDEUznW4Zj5NI0liEnNqiPUFifG6y7sIaFFa4iRL9tIVemPI26Yo5NJbnvfhNO
 fz9SzNuBn7Mdq7kfLUhU3GqwlHVlIej24Mggkfi+LnnXJ+QEHmAytvoTxCW6S8hu81RRNorYzGl
 9Y+jxMhBTF1echTmE7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfX+5dzzRxM6uGZ
 /Gv1AoQw/7dQYGjyg8f+OO+k7HVNWPRfWYgTJ6rrtd5NP3VcJ2K9YrWfd4dxt4iaeEnZfi/NVAc
 FFyH1sQm4Nvauh+MDe2Gr1G5sWTskN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160144



On 16-09-2026 03:31 pm, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/gcc-qcs615.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f32..1a6a1e74e805 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
>   	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
>   
>   	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>   				       ARRAY_SIZE(gcc_dfs_clocks));
>

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
