Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06B4457C2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146264; cv=none; b=sq7bs2Bd+g7OZy/gZFVtXBn++wZZKn/RMIzbeQR2GsAEo7dyfPL1j0U+OB8zk1wHcNAnqH3YKaINUAK9+ElIFib9N3oLE8D4+yda4nlGS7B/MkawPpDBlTVll2d19cYI9+ZBmONDeoyuDhSaLrvnzCgzoYDwahZSwpK05GAUOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146264; c=relaxed/simple;
	bh=1U/pS52KTORHRz1FVOPnZs1ybhsXTgMYLPt7vErK77c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiC6gyfi2bbfLd6N/hdZB/JFdAvanzajF6imxeTAk2TVGIyf5nVfk6L3Vg0N3wHGBY8/JeKjyVOIQjUUjzjNP19/WCS3iXp1zCsznz+B7vVOlkQRPs9vnc/F+Pn7m7Zsp4e06dqQGzEaNfqOPuRCIoWjQMjZQWiwKuYEbW5sm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyvQHgIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWr/xwah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyvQHgIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWr/xwah"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iWLw3096176
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=; b=gyvQHgIGJ9a/wWJG
	PJZkX2j3/laISwHXHTPHZ47PPHMKwdNJNANf71APjgDv/RfzrkNJH1NdN5htNHOT
	6epgO9shh8QFw0TjXd4/85zb7UHZhY3MLu/OkGD219aiRO7rAUIMLifhmhNG0dmW
	x4z97rxEtZAHRaxUE9aRhMROt0lyVmLfH/uYobP29rnZIyS10CrMd/o7OwDzuGpa
	+IP7zEGdq91p4jV+ktDQJbyDd39wxbyYh1g2M0S8Zmk8F/P9uNa8Yyc4NrbVTIux
	oVsYgcWNbk9zO8WXUIoaDyNhcKXU2yciaSIoWUQ2mNh479Rze8igHYVKdviwehUP
	i2iv/g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428sa1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso892297eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146255; x=1790751055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=;
        b=GWr/xwahhGLLISCRIvfRD9Ry8aOlxfWawpV8K2CQTm9gBEf8DwZiSH85goq4PXmncB
         1/wLSM8e88QHKB2c0eL9yqhlHCQTfYm+U4KHCVLjaH21e2neJIrYSHEGIj1MEGusU7e2
         XqFuVJx6Q98PHLD7GDCF9C8z8AuRcmLVjk7Neq2uUYL9/8PX3JVVaWsYQ2uYnSiVGSQX
         6a+HBQMYp+wjoPKy7fSlEqw0tKckUcfn9y5IKeKp7H2/ZFRERi3m+1e3Oym12dE9CvAH
         4uCURnQFJ8PMmh/R0dUB4wQ9t2zFSF4unCsvskkKypRG/SAkLkwJ6HT/C4LSM/Tw6m91
         +Rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146255; x=1790751055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=;
        b=mZ4l0fDxoFEsy/xdMlfs5dY4EEuYbabzsO064BwnFjxFn6X53Lnfq/YEPGLIwtJTqH
         eOsJv6OrRrr2PTaU3olOToFI43gb2Zzj6qFlQftfL1x0AgTFAEDYcTLSSDL89zy+Tqtc
         Qtc/bQXXsw88hwy4+u+roJYgA83C/6z+yFp+WnWOxyhGOpJYwesnW3S3COvL6CouQl8s
         ye8nqOBCMBcqBZAlISVO2NnUMqZXZozidEqxOL3Z5Y1X0P4X1/xOHmp+I9M8ga9hLcZJ
         7Mzx8GaAmngMWEbKPp3PS2olK3LAFGRZVaPpqOJxvd1yrwJtuSRGeDpYrstMTQ4cyBR7
         bVOg==
X-Forwarded-Encrypted: i=1; AKwUvBzc18svDwajdsxwwMd7Aes42exv2rSnxCnA/CmcK4P2VfsCLNZ2VxlkJP5ULyBhvVfbJtngb6R76bM+TWU=@vger.kernel.org
X-Gm-Message-State: AFuF++muZwBNB7wWKaDHAbm4Egzb3/BG4Bu48ucMqPjS4WhCPfXFPvqw
	dOIRab/frTJoWpfroFpjSqQgtr79qm1q3DYFdv/KbJL9lSbYYIUgaXDg0X5Qc/OtDxthhv9WtZY
	m4nZ8hW1myHkwa1a6uz/JLbYnzu3gQYxF264nbVv7AFBt6D21lzc+g9C79fJt+MClRAw=
X-Gm-Gg: AYBFou37Sd22DblAnfgqFCb0dlrxleJmoIGMUL4w6P71W3jCKuFhLreRdrP47Fk2EHd
	BbN0GrInb4x8/P/d55FxyjGok4xajeM8dE0qyJZFJkPM8mj629O3RzShm0oJFyqHvkaYlhvi1Pv
	DT0moOJZtiSM8RNQLXXdg4CgxOHwNc9fX4ncwIeDyrmo9BrhrohSajpDOxVkJoEquT5/CAoVvZm
	BQ86M9wGh4DTdLF74WsUMChgpezhIp5ykhLgDwiQm6TSWt8fdfLJl+ZS/hYWGG6xObdRJZMGb2n
	W5xe9Pv7wCfB83hNXsEzJzzZt1oYuvx7OF68qYxWz19+gmAIAmEl6VtDV03gyQaR4B8PXAE0iaM
	uR7h9YkWS9GNigjNZClbeT4jymT0agx8=
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr1526306eec.27.1790146255002;
        Tue, 22 Sep 2026 23:50:55 -0700 (PDT)
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr1526275eec.27.1790146254421;
        Tue, 22 Sep 2026 23:50:54 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm3603663eec.17.2026.09.22.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:50:54 -0700 (PDT)
Message-ID: <0157421d-986c-4a3e-a2e8-069a6869059a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:20:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPU4x encoder line buffer size for
 rotation
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab376cf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=61IncRaRvCNq-QmzfB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: KhVXWuEA01YZpaEfqw0IGlsvp2SzrD08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX5k0DcJmvY9SN
 pqAu6bMLGS9zebey/gXQoInyVQi2pP3/DqVjxfQey6y9TUPZwvRzKJ8FXfBepjsEt2DVfA8N75p
 v2wKe6oaQf11iN5Wxx+sjEbHIczcoEBwZo2RnNeP1ivhtu3zydWbDzfLQ1ctLnUpMJOB04MW1B6
 hdfbMzhWRYxIpTLyB43d42mbbEfA31mVVX729rISjpHXcCFvyBHYBz5tt3qIjF4lPTiyaUU+2Zb
 MD1mhmDm17OBsQusywEuAd9oPjsJbkFcmfWK2bMFRDjZxTe+Gl3YetVCzvV7J7yg3349B4fOnw6
 GfbzLU9fMdfKo+Sm/hdh/jDYvaO34Fz7HLB7UI9D30dxEMd8rdxj/ETFkR9BYTXkvtbBQVwYEgK
 sBFlo0fIrEMHbRNKDEx7IP22CRkayXn2+P0jxtwWP+cCXtkqt5eSW7C6/yVhnBQqP6K0hqvb6nX
 0su13PSP8WI9Lw62ALw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX+aUqgka8xgGF
 VjhV59CRXXgaWGRmrXv+YKn68OdaG++e9syQQ5cZEPO/G3Pv7mAswHZ7K9izbO+tqLdJkvTXuKp
 yacycx/kIM4fGLHRiEoLmmuX/zmUufM=
X-Proofpoint-GUID: KhVXWuEA01YZpaEfqw0IGlsvp2SzrD08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230027


On 9/22/2026 8:58 AM, Wangao Wang wrote:
> iris_vpu4x_enc_line_size was reading resolutions directly from
> inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
> account for the 90/270-degree rotation case.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

