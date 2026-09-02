Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F34A1DE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356983; cv=none; b=fB6m4O5Hwft+ilG9jfSl/9RD+6f+QnyFQGxif5xR/EFpSm942ycztXIJHyAi96kOINYvN4Ur0ZSLhSHQYp/YbK/53n95lSdijy651kMSlI6owWY7aKuROlXQdrRsGk7C+x3fq1INeSPDznnqFcnUupbdlenCqbJr9MDGlcRcvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356983; c=relaxed/simple;
	bh=h38puJP55NohaqQoEAHKVmrRg09DfjV6DQi5WL725/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4NJwpOQODc94hvBtaGOmZhTE1WQiseJ3vvUpViI4tOpuxFKO4mWUGOaBnWtYViF+hmN1HndjHh2Niy9z+8SW1ay+o0kOmqhku8kE9kPoLxLFCaY4xZlnbzh0i1k30GugxDXLLlEUd2r4An1gs+A6eci5OtfmoskQAFaeUAp0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMJtzfGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epjgS7wx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMJtzfGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epjgS7wx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682D1w7W947872
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 13:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=; b=dMJtzfGd1Kr54bQu
	GD9fDz/rWV3mgwOWyiYN72VDTrGVMEAKxtKEQNq015+px8fvVGh0pD9Zm3rgxI8/
	QaggsYobxVfvXippqUDvaVE3K3KtQU3NVZG+XX5Sx1ZduUUtv2fNxbCkuVcl8g7Y
	0MHu0maN5SDeuRPy+MOsm40VBDEC4QzcfyhVd1v8nQmM23qmyywpJlMmpgV/RZha
	X0AIKDbNu0FGvDsScMD6Ri+liQO4i+9JAU2hJuVcVRbPOp/RWTxiyxEmLyBwIVie
	/KrvHxhyX/x3EazV6zlui2qQyDJY5ROgh195qMY5aCzt52rnF/gAIKt37oeNS+UR
	pMS5QA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb005vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:49:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7824ec38da4so39156137.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788356980; x=1788961780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=epjgS7wxSX3H3xyhq/a7Fhs3+UQwWgX6P1jpbIQp8cBXmFm/rtYC9LZ7QMT7FsmR3P
         R6fcdNbcjOWPu8DY3VK5nvEKrkA1EQ2CPMtUc97JKIUkGpKAy7onxZ7VC209MZMpka6K
         extSfOcXEWPr4bxR3DOg5IXwYePX+iNtQWQA6sBzLeqYxW0YBgQp6dq52Oh8iZOPG3kB
         SVkIqGLy8biiAalN5veN0YjzcsgngK1QK+TBYrOPYcyxvHzgtbdWXy+hIibjCHyFsiuB
         tJRCB/cEjvdv6ksyCDiJ3fMShrrtOqNz5ErpEElb34bvgkaLXqhaSvY4XT2mUecUJfiJ
         EI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356980; x=1788961780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=WxxjDiYAxOx0/pbjF/R94O1Ho2MONgQw3YxMYa8mivmt/rAv6QlbpdvKpTa8o5NBRW
         MMBgdY/okHnX7IGLt+49K6LntRCzcEp4mFYlvAh72zgv6HwZzmkZ8rvKuMEIX7tGbDEH
         9nUSb22+IwsdBXA8ZBxNpX1O4W9dpkJGzMUmc4Zi4G3/bJp5/ZR2bLU7o9Jo2dFilN7e
         ofJRCE5QfObkZvq49Dl4UNBE7gLC+lYyLrUqItoKrNIJuWup78+cjVhjlTU8PX9NuPLz
         C9jykT5GFik+wYQ/w18bqcFhC6q+21F2sOH/bmSTeyqtmoLO3688C1SNAaVH5G3vmmHn
         +SAw==
X-Forwarded-Encrypted: i=1; AKwUvByVUl9MeuGU7hrU3mIH/5a9fh4v/pQY7E3ilTwbyFUqPoVp8rghsRRiI93CuRAZYwnIaxY50BlyU3w2ins=@vger.kernel.org
X-Gm-Message-State: AFuF++nRBWOwEjVPL9DnfGt0UcKaKSkNwzx4Bg7Mou41A6WBcCyoEgkN
	fW00XSsdCtyHsuM58wZFtNYYeA4bAn3Sk1FAs+DsRXxRVqA5iBG4I6US3TM2kcddjpeVFxnkpfK
	shj6rUIIUiuaPdWsStl+aJgb49U+IBhujcuavBPgksTmT9cr40hwovuhZMnBdO5pztaY=
X-Gm-Gg: AYBFou0SBVioDxxiyi1yFPQ4E5yCka3a54T3BH9EwY2oXP+KYrtMGdLTacTqiBMKfAw
	txVhUrl3SdPFCjrP4Cc5OTXT89hTkcDqjpx0b305gdt97XYayxbhUuqaJoZMRnpA+1EmJYFg6lh
	j7E9OoymuwkI4tsLEhgmSTZT6+sT78ckchQs5giE4PL5QKV5HknbJNitWcvvvDUDwGEORQrVdmL
	qd3WdhvDbwKo95YLeFU8X4s5EP2NALcnt9daesq+tYtTDSQOJZl7KhavjKn0KuZ9xV+L2d4Ia+p
	DNMtM0Gdg8N1/uZ9EfQXVAmv/HSzl7bCUevangjV1PA3ydirCD1zKA2Vi+ZnvtZ/MZx9QMJSWP0
	S13po7Pi6J53CJnAvUKnQqw==
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519687e0c.3.1788356980534;
        Wed, 02 Sep 2026 06:49:40 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519675e0c.3.1788356979816;
        Wed, 02 Sep 2026 06:49:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad015d1sm5649791fa.22.2026.09.02.06.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:49:38 -0700 (PDT)
Message-ID: <fc81b75c-a76a-43db-877d-1eca69da2736@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Eke55WjCqzjLtRz3jJTiU3JpJEpaSTkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX0S0Z57mjZQ5Z
 VTlzdKmdoywZrIT5JWflxKFJ8/942+pM4h7MA0/5syat2nul4NBHKkyM+YjXlMWPPttwyRm+mZv
 tNQYaEHIeBh9FdJFVgrECTUCMrg6w0gDIDFXJt26pl/Ace4XizARq80rBapMuS2n7HYG0sOoHxj
 eA0CQ6pxLcSL7ac22zXazxe9oJr2jwuH5n5H5OGxELH7DOaoVoHIaltzYJAEhmKLO0PTDszx/Xl
 aNbp/gc6pSt7CrdqnPDXdHCF8Itj905PXptvFqdUp4CYMYPnlH62Kx0MpJGPs6e66/JmGZ/GdyT
 wxbFYT8+YuLdy4O0I3o4zKS0nQXOz2Py5vZQ2Fokfe0/0hQm4kKSXtNldVJv/DW/O5MKHm8jEe6
 DWPWhENd6Ye651IX2hbcr4+ksHtRN2Ag0VHW9mFwWxXnSZSs6CxcFfgkYu5DMzXUevVA4Baw/N/
 w04XB539ScgZZv3yBtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX6KEkwVeLwjFs
 +2lfEdalIDqxS3Z/qMOUWL4N+AcQu0W+ji68skWdY0mZuN3/HsAs9m3QV34hc7xRXTtJ0o+TVFT
 6r4k75RVLo9EgdPb+icpQpxfv9DRN1c=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a982975 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EiTzJyzHe8GYNTRMAEEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Eke55WjCqzjLtRz3jJTiU3JpJEpaSTkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020122

On 7/26/26 4:30 PM, Pengyu Luo wrote:
> Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
> based on sm8750-qrd.
> 
> Supported features:
> - Altmode
> - Backlight
> - Battery & Charge (Full speed)
> - Buttons
> - Framebuffer (Require mdss and dispcc to be disabled)
> - USB (Two ports)
> 
> Downstream supported features:
> - Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel)
> - GPU
> - Touchscreen

This paragraph is wholly irrelevant given the tree this is targetting

[...]


> +&tlmm {
> +	/* For CDT: <32 3> <37 2> <77 1>; */

What's CDT in this context?

[...]

> +&usb {
> +	dr_mode = "otg";
> +	maximum-speed = "super-speed-plus-gen2x1";

Neither property should be necessary

> +
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * USB2.0 is shared for two ports, set pinctrl eusb_mux_default
> +		 * to select the repeter. Plugging out one of them will reset
> +		 * the DWC3, which causes both of them to be disconnected.
> +		 */

Is there a hub inbetween? Or can you only use one port at once for data?

Konrad
