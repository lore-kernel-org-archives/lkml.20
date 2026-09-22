Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2E549376
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085102; cv=none; b=Dt8ynwIyts/KnR8/h6XA4kqJC9v36KFfYb6AvG2uURRIx5mrJPBHXs1o6WVlP33uyGGGiTUjLkipFcRvwljecIlDzsOSh+mXZ4+xOArGWwxaJ5NYO4mHOLgSKLKLm1qIjpNjwSxT2o4nZcsntRMWGDFia12RoWDBbxlW5XbOACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085102; c=relaxed/simple;
	bh=exbDvCW6zscOSTFrNqipgAyryDy+MLtmidYj8IbQmq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLMrU6dHNBfwa1tgZA28/rI6cNM3d1NwNAzE5TuudfjzJ969WL9rJAw6FI07e6jgLLhNf8hAa4Z1v06QeedsyhuHc0NLWmh1gm0Nu2GiLoMng/YRnnjrNgWQLUUN7l16COwqPc4iz1RsO6KUSESQmIE+mwhpf0keOsk+ZcKXu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3vxQMTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4R8on0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3vxQMTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4R8on0k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPY2S461240
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=; b=c3vxQMTh0N8lp2XV
	0w8PJs6Z/IhJxCovX4k7jwcXzyLnP/p+1sG7S4scSBvVPvvVxbUfL7HsZ+R8jTji
	3LaxYzkm89Fu5znDyL6oAPLUQsKPInaDS9acnHmsyt+HBpJIdHF6+s7f30/BTG42
	ZWqJh4G/5IJgEgxCxNdEHGpAJSx2pTRGTVLxLKVJz7CplvXB7BmgvQsljJbNZEos
	n5PacQxpzF3m9diQjrcluDp/3WxcBDCDSBcnwVClBNgu6eupIR8oQUcoP6yKdR0/
	W57ucSDVM65bNG0AZXTJJgO+jEKJJ4k3GqtTcfGTsrg6eFUDMZBZ1ls04cHv9ULh
	AbRY5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybk18b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9714302a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790085098; x=1790689898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=X4R8on0kcSOsTsPHfGY2JUcDlEcgMAHcGBXFKvTLj6JLO/cySfcvsM7oHPzC0uJG1B
         r/HeUcH8ON4bpk4Kq/EC12Ez3S8AZ4N6OfVUqC5YHOK4fIs0DiFgqi3qLDCLovnpqBdh
         QPeaROJMydv50zaRPhuBe75n5tl9s4eX4FIprevkknKZjjhUpAc+r0IKto+InKWipYJJ
         eAJ0sdp0l3hFTrUrF7JeslyDncOJ5bcKij0Y3D+OS8+tOdKisSpru2cLPji4VBheR7jD
         CU/vDCd0BbPyGPIsicdWWsccFwf5XkiPdtLayun3CmW1VPM3whjyfETe6kzKwQ4/jTFn
         S87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085098; x=1790689898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=DHf1g+is4n72GlWxt4125SJJ/PTzw84kPP2e8hMTkJrFdySmiFrtjuf/uGg9UfQRZ2
         RTF+cAkWePSzBVXcffbrSuOgQwB1dlCQDeKbpwZeCvaD4jCfeyw4TT3cVcXuJpYbhQZX
         QuDRQdWt4LFzV2wU5cJFRm4bg7XgyHfh0iSuIcX3UHNJzMpWm2JYxZTERJeInKuRCNQg
         kbGhxq97brwPqckjfW+V6aq77nHXUHODT/b9/1+Fa/8DCvVX9rP+eotNv+YNn9Km1bYP
         GAMDAKek33uCoguknNGawCI+6sP7HZRR/+fEJSFk0tbKOxLzAC6/ETZBkiQiJ2c8z1JH
         lU2A==
X-Forwarded-Encrypted: i=1; AKwUvBxoEBMumJPm3xG1iDiVua1UsiQxNkqqP1qCLh9e7FNKQX8ZsucShMfAK9zU/vC1gZk0Py+31dleLF579io=@vger.kernel.org
X-Gm-Message-State: AFuF++lNeGahBbpA3Y9miLwYL8Lo/ZQOkEeTxb2gMYkw+nhOM+XlfTwa
	qsoykQqn1/zYlGvg+U+h9OZ83ZEPGMUYgDCpcrdgYDi3c/hNzOK/ctF1ZUMyjWu1eR8YKVibZzN
	cPqOIvog1G5NOIbSVn/JGRCS1+/IpdV5qCJ1OtKLzewgU02GNhB7LWFPOYRZsrl3ep5E=
X-Gm-Gg: AYBFou0F1sDgouFUHMH9LusZqRAfr0NCJ69Dnfj9hFBjdqig4ijdPDcKfcSuUrEXxrK
	QrJ7GRpclj/x+BQpSITRJWwPGf4U/0/trsq2Ukut5wU4+CF9C9G/L72T1T9jNuqfSbzzcODrxsp
	MUlSPDHIBrl0AZ/in+Dzvf3eT7RGZF3F+qwgPZ/m3Ne8XF/VJr5gBH4jFHTqfU/p9JS8OZCvL4K
	4Vlz4kd67RoE/5i+9WOwI5qrSExeDJ0HtpVw3VIIeXZpVyT4fjHRn2VeGVuAxs6WQlJ243zwnh+
	xcMOT4aqyQAVw5cBND8xEBDmpUWHCYDvAcmVRkd5d3SrM4ERnR8bHWD8cbA3cP9A2DY0QimfIU1
	VmMjl6gZnGvN5vN23f7+UfMIG6mlb/XI=
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443312a91.55.1790085098323;
        Tue, 22 Sep 2026 06:51:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443260a91.55.1790085097761;
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06741d485sm5032091a91.8.2026.09.22.06.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Message-ID: <8cc02f82-43b2-4ef4-9110-ccc775de0e7f@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:21:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add support for vbv delay
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
 <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab287eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oKMEzaGHhaSyBDVYNLEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 8rySytiMleqMU7mVfkbPx-mAwW3lQhhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX9d1r1HTuoKf9
 2K+MCTBI8SeZjUtbAjsYYnpjkBCOLJS17RhEQaZR4oCs78I/UK2YV//gzPK0u24XD60ctIypH+4
 5hcwIGaYDC2j3x3qymnhCTH3/dOdWKPQf/qcNi5lhaSNtcGIuPXTB0MyZW5pC9cZW4WsagX8SK2
 LllxNhnERP64z9hi0QmFCKnaZFraxFFHYRpISWwgEfs0f8DJ6M+5Z/cxxIvg9/qwTZ6vsD3vo86
 Dsyvhui35t1RzzKdAwZdw4TZXhqYj/ximNIqHRv3k8I25FdHjrxYJbaFnIQdJzIYEZcwGLgNHtQ
 8ioN20cvMeiEBpqnbPGo4A6T8ow0gBP1Q8C/7Lx2fX1utgCnEbgsKF6Gwt1+qITHe0VXeRI6X6I
 XtNyw8HfKW5oFZ/bEzrx+BLPWI1eOe6VT/rwvLeHIXU3ZUMuhSeXwWPPZdVMJRO/bHTZCbfeJZB
 usZVHtfYqGJn5zUXuAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX3252e3cP87rX
 ib125aqMfy1OOE8QkMA63BR+c2AJPK47ysXkdaZxvVtkWlccjs9kgKjoQsyS9pJBzXZKKpd3C1u
 ePJCGQUMLqhzzNLzb61nrvbu6pzaOTs=
X-Proofpoint-GUID: 8rySytiMleqMU7mVfkbPx-mAwW3lQhhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220201


On 7/30/2026 8:25 PM, Sachin Kumar Garg wrote:
> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> is only meaningful for CBR rate-control modes.
> 
> Low VBV delay values (34-100 ms) require the encoder to run
> with a single video pipe, so extend iris_set_pipe() to force
> work_route to 1 whenever the configured VBV_DELAY falls in that
> range.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 31 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   5 files changed, 45 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

