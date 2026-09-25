Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11260485505
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330010; cv=none; b=j8aS4//FwMCPeeDup3UeaUyD0XWyDg3YMJSxnYBbOT5BR3P73Sl5uvZl6GSux0bXjjvf9Vv20H5s45bBpY/YP3cHFBKrOjmfiYndpzKHcAL2xFPcRkv+9a67Fpg/vEdeVV0y7WKC8IG01KReI5NjJXNpSykD0VDxQL5qXSUapDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330010; c=relaxed/simple;
	bh=UbOWSOBmmDVHMPzC04bMAA2Gcq3G2rjLuFC1tuTZzB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekwgpQmtC2Xq2ve6zt7jHo1CsRvik28WFoXwdzqfbeicDsJJf8Q20WjZMCv0tkIgPPqV0cjPupwGHDKVxgsPUQmOpyLmyfHhmbET9QyzYnxCsF3b3kpU15og7sG+hYlExlNCZpClNT197V1888WHrN8R768oKiFbriAQMtgN5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prvVgdSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+Mkq2m5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prvVgdSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+Mkq2m5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yah1208432
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGc+8CkkF1V3JlPxH4i6c8oorYtv8AB3WerR4uXxO0s=; b=prvVgdSDmE4734lr
	yYD8zzMsw3bj/kA0IDK884Ij556kpTaYplqE2CmeDwVYSR61HgRio/ErfUTGhrj5
	DsxEDurNAFrMKsj7LMSOeK8m6bpdndL/lbsfoi7ynX29pe2mBtA1vl6ed5O008RC
	LjQYi687u6Hk+rdeOdm1AoxsiXQ2Y+56xUA7s2sOEXPYEaCRJ8KWZY/EPDesfxrO
	dpjh+pbjbcSnzyjX8GzjJgdnY8A7vbCyeFxuLE/paduxBs0r3WiynjhiK1POkKt7
	6zz4e3sZuoVCtSZCDZ9g/1tQ9Ccye95EQpVF+jWzgMozJR2jsFMTAI4FALdBvOXR
	Scq1xQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tyx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:53:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1243137eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330005; x=1790934805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGc+8CkkF1V3JlPxH4i6c8oorYtv8AB3WerR4uXxO0s=;
        b=f+Mkq2m585I+2Bm4pAfvE4Lp9uPUx27mEgE9KytCA6CviVdQOYaSNR++PJeFRgbAaX
         sR8InjcHVZAKzTtZqjyjfCUOr7fYlXpoVsDeCNtmHABgC7BYn4ZZzGD4FMp7caSbvctk
         ewlVkWBNjLUfr119hjaTczlSVxROYfmLOhIeUWYh7z7pNZR5sxTP1Ze7c0GwWQyaLBXe
         dD09UJsWXz1dN70IBax6Ktp6WH4aTKxBghpJcRaDKRP5sfiL2w3DgnsSr/pkV9MQ5fxz
         IcbGFeR0hla9SWY65xqY424dYYVqh0vawtkqvcgmmqE77tzzLqkk1LI5H/KYFF7XLfLb
         dUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330005; x=1790934805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGc+8CkkF1V3JlPxH4i6c8oorYtv8AB3WerR4uXxO0s=;
        b=TJKs8JPP7GZNTiWSpXJlVQQYIQOdbo9Y/XO7Djh18zI/sQ1QyQYnJNeIeyVM0IwMhi
         t7RMasgtK4eUt8fIP/P9Euk+SlO3UBubsQa9EezYVehbmvpNihvaZ9q98qXm1F3bcZ3O
         afSKDRYHlyWuN4x9c7kO1d4X8RhHllLk+w7zPGCSkaMm/vlYj+YJ/PX3L9sjvllkVNr6
         TMhABlWoIi/aMpiFI4rjfCKkslcQHqT9NRGakHMQqjFM0MWLxGNA4S2tqrhjFKD5T11j
         n1yAryjVHAi4AeOYnE7MzUFXeiwQ2IwLpStKT9XvkSb267W8wemyMi1TrIPhsFSJLQL1
         oftg==
X-Forwarded-Encrypted: i=1; AKwUvBwogTIb2wk6bArxNRjoJWoi4WF1nPGsy4hacBy2rwleqSKG26u6tymA1KH5It/abK2ltKR+60jxAunZRZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mPEsCclA9g1K61e/Kx9I6gg8LuXcHxjk9PG13k7ylTl32s3SH4
	pYdiowIP7c01BWpXYz0RuxihB7GrD6j+MC1m/LAUHE+qEKkF2f2wCnAMpAz8f7sIFdyBm/lu6sA
	+I32Uotcx3gHvnAdPTAYKGq8vSpIg+aY5E23k1yFuKygls05y6zNuJY1PKusOy7IKXLo=
X-Gm-Gg: AYBFou0wGNZbf3pUVlvsBB7wU+WQD/WzFMcAHDF83Tpjy5iTh3Ch0CCcQ+hGD3r0u8v
	T9teywjTRMZUDGzInQy8sSTaYx9+/fKn8rG9Oy+FCDJzueqAUUuLoKxNeeI2u0nwXTAwdGKfTLW
	4wWNrSMwqNtax9QHraLF/dGnSjalmNXM/OJn/7fAJbbWEFfCpacd3eg5Dc0gi0aOR0EhnkOBxBP
	nHWgLVmMPAuRrlkqgYPQvs+3+9qFWWJaWya7dZSDjKcxyBlM2689u5RKaejsVjVhHsNcOcMSWna
	6Uq4iZJIlClDs1m3ucat7gx/7gdwSk7jmTfOiqNWzYuEcgU+MmsVMoN8ut1w/UI88H5THF9rWha
	KwDMuG/8p75mNLhI=
X-Received: by 2002:a05:7022:b042:20b0:143:8829:5fbf with SMTP id a92af1059eb24-14503fdf3b2mr4285604c88.28.1790330004859;
        Fri, 25 Sep 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:143:8829:5fbf with SMTP id a92af1059eb24-14503fdf3b2mr4285451c88.28.1790329999467;
        Fri, 25 Sep 2026 02:53:19 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm4752730c88.0.2026.09.25.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:53:18 -0700 (PDT)
Message-ID: <418e26ae-d511-4e5e-910e-7d42b8b9283d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:23:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX3Rb+gtVb9Gex
 xevhYwgFzkLMgSp5FjjO9VExwkUXfJZDGeIYnetTr60uDNnYgCN4RKT7W9FGFzUUdMsrBBp/80/
 zb4uYT6HPpus6CBbqMGiNc+/y56MKBbV74IkO05ocx4UMQVbTZ8knMe7gyYtuCfN3u5YmUSHSDk
 sqzfRHUbeI+NxsHL3R4koIqWL8OrdKnYLNUiXC0KWK6+1GBSdr8V2yRDz/MVp2UXpTRGmOEkgQC
 BqeVNV3zxuLi9AdlQx3BhB69R7kaqsWefTStdUHaQBlDzS7/CZAvIRqBXxB+B5wmvShvEXwhHQi
 m7ppvsTEVFHOouM64BODCGJQwM+zfK9n2yyTMQWK34shpXLDQATJrHaTwppcpTOn8EreEzMeDlH
 ymZkqf3dDAVOQ8ZVA5AgR13/r3Ug+jsZ4zidZBoO1MZ7n5hO3QCjat0SKULC6i+FkudiXI8edrA
 ahqoXWQKq9UHxA4orHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXwjsQmRdEhgr9
 8ApNWm24QBPAkUSs3fbP8o+Ewq8O6cNiVqbZ8enT1Z0awGb/6rGMclLp5aalwk7EdsMws/Jdzrf
 WnYqCq3w8U2miekEtSaiPSSvH8NQE6Q=
X-Proofpoint-GUID: GW3V5G9iMSuuJSJyTbRnkdPOER5MUAic
X-Proofpoint-ORIG-GUID: GW3V5G9iMSuuJSJyTbRnkdPOER5MUAic
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab64496 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EdVPwVkGDUSVHLgzv6EA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The nord platform integrates the Qualcomm iris video codec hardware,
> which is compatible with the glymur based iris implementation.
> 
> This series reuses the glymur DT schema to accommodate nord iris
> support and adds the required iris device tree node to the relevant
> nord device tree.
> 
> Test results:
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Decoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 7.2.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK
>         test Scaling: OK
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
> the input file is smaller than 7077888 bytes
>         Video Capture Multiplanar: Captured 465 buffers
>         test MMAP (select, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>         Video Capture Multiplanar: Captured 465 buffers
>         test MMAP (epoll, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>         Video Capture Multiplanar: Captured 465 buffers
>         test MMAP (select, CREATE_BUFS): OK
> the input file is smaller than 7077888 bytes
>         Video Capture Multiplanar: Captured 465 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> v4l2-compliance report for encoder including streaming tests:
> 
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 7.2.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 64 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0
> 
> Fluster test report for Nord:
> 
> 77/135 while testing JVT-AVC_V1 with
> GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
> The failing tests are:
> - 52 test vectors failed due to interlaced clips: Interlaced decoding
> is not supported.
> - cabac_mot_fld0_full
> - cabac_mot_mbaff0_full
> - cabac_mot_picaff0_full
> - CABREF3_Sand_D
> - CAFI1_SVA_C
> - CAMA1_Sony_C
> - CAMA1_TOSHIBA_B
> - cama1_vtc_c
> - cama2_vtc_b
> - CAMA3_Sand_E
> - cama3_vtc_b
> - CAMACI3_Sony_C
> - CAMANL1_TOSHIBA_B
> - CAMANL2_TOSHIBA_B
> - CAMANL3_Sand_E
> - CAMASL3_Sony_B
> - CAMP_MOT_MBAFF_L30
> - CAMP_MOT_MBAFF_L31
> - CANLMA2_Sony_C
> - CANLMA3_Sony_C
> - CAPA1_TOSHIBA_B
> - CAPAMA3_Sand_F
> - cavlc_mot_fld0_full_B
> - cavlc_mot_mbaff0_full_B
> - cavlc_mot_picaff0_full_B
> - CVCANLMA2_Sony_C
> - CVFI1_Sony_D
> - CVFI1_SVA_C
> - CVFI2_Sony_H
> - CVFI2_SVA_C
> - CVMA1_Sony_D
> - CVMA1_TOSHIBA_B
> - CVMANL1_TOSHIBA_B
> - CVMANL2_TOSHIBA_B
> - CVMAPAQP3_Sony_E
> - CVMAQP2_Sony_G
> - CVMAQP3_Sony_D
> - CVMP_MOT_FLD_L30_B
> - CVNLFI1_Sony_C
> - CVNLFI2_Sony_H
> - CVPA1_TOSHIBA_B
> - FI1_Sony_E
> - MR6_BT_B
> - MR7_BT_B
> - MR8_BT_B
> - MR9_BT_B
> - Sharp_MP_Field_1_B
> - Sharp_MP_Field_2_B
> - Sharp_MP_Field_3_B
> - Sharp_MP_PAFF_1r2
> - Sharp_MP_PAFF_2r
> - CVMP_MOT_FRM_L31_B
> 3 test case failed due to unsupported bitstream.
> num_slice_groups_minus1 greater than zero is not supported.
> - FM1_BT_B
> - FM1_FT_E
> - FM2_SVA_C
> 2 test case failed because SP_SLICE type is not supported.
> - SP1_BT_A
> - sp2_bt_b
> 1 test case failed due to unsupported profile.
> - BA3_SVA_C
> 
> 140/147 testcases passed while testing JCT-VC-HEVC_V1 with
> GStreamer-H.265-V4L2-Gst1.0.
> 
> 1 testcase failed due to unsupported bitstream:
> - TSUNEQBD_A_MAIN10_Technicolor_2
> 
> 4 testcases failed due to unsupported resolution:
> - PICSIZE_A_Bossen_1
> - PICSIZE_B_Bossen_1
> - WPP_D_ericsson_MAIN10_2
> - WPP_D_ericsson_MAIN_2
> 
> 2 testcases failed due to CRC mismatch:
> - VPSSPSPPS_A_MainConcept_1
> - RAP_A_docomo_6
> 
> 235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0.
> 
> 64 testcases failed due to unsupported resolution.
> - vp90-2-02-size-08x08.webm
> - vp90-2-02-size-08x10.webm
> - vp90-2-02-size-08x16.webm
> - vp90-2-02-size-08x18.webm
> - vp90-2-02-size-08x32.webm
> - vp90-2-02-size-08x34.webm
> - vp90-2-02-size-08x64.webm
> - vp90-2-02-size-08x66.webm
> - vp90-2-02-size-10x08.webm
> - vp90-2-02-size-10x10.webm
> - vp90-2-02-size-10x16.webm
> - vp90-2-02-size-10x18.webm
> - vp90-2-02-size-10x32.webm
> - vp90-2-02-size-10x34.webm
> - vp90-2-02-size-10x64.webm
> - vp90-2-02-size-10x66.webm
> - vp90-2-02-size-16x08.webm
> - vp90-2-02-size-16x10.webm
> - vp90-2-02-size-16x16.webm
> - vp90-2-02-size-16x18.webm
> - vp90-2-02-size-16x32.webm
> - vp90-2-02-size-16x34.webm
> - vp90-2-02-size-16x64.webm
> - vp90-2-02-size-16x66.webm
> - vp90-2-02-size-18x08.webm
> - vp90-2-02-size-18x10.webm
> - vp90-2-02-size-18x16.webm
> - vp90-2-02-size-18x18.webm
> - vp90-2-02-size-18x32.webm
> - vp90-2-02-size-18x34.webm
> - vp90-2-02-size-18x64.webm
> - vp90-2-02-size-18x66.webm
> - vp90-2-02-size-32x08.webm
> - vp90-2-02-size-32x10.webm
> - vp90-2-02-size-32x16.webm
> - vp90-2-02-size-32x18.webm
> - vp90-2-02-size-32x32.webm
> - vp90-2-02-size-32x34.webm
> - vp90-2-02-size-32x64.webm
> - vp90-2-02-size-32x66.webm
> - vp90-2-02-size-34x08.webm
> - vp90-2-02-size-34x10.webm
> - vp90-2-02-size-34x16.webm
> - vp90-2-02-size-34x18.webm
> - vp90-2-02-size-34x32.webm
> - vp90-2-02-size-34x34.webm
> - vp90-2-02-size-34x64.webm
> - vp90-2-02-size-34x66.webm
> - vp90-2-02-size-64x08.webm
> - vp90-2-02-size-64x10.webm
> - vp90-2-02-size-64x16.webm
> - vp90-2-02-size-64x18.webm
> - vp90-2-02-size-64x32.webm
> - vp90-2-02-size-64x34.webm
> - vp90-2-02-size-64x64.webm
> - vp90-2-02-size-64x66.webm
> - vp90-2-02-size-66x08.webm
> - vp90-2-02-size-66x10.webm
> - vp90-2-02-size-66x16.webm
> - vp90-2-02-size-66x18.webm
> - vp90-2-02-size-66x32.webm
> - vp90-2-02-size-66x34.webm
> - vp90-2-02-size-66x64.webm
> - vp90-2-02-size-66x66.webm
> 
> 2 testcases failed due to unsupported format:
> - vp91-2-04-yuv422.webm
> - vp91-2-04-yuv444.webm
> 
> 2 testcases failed due to unsupported resolution after DRC:
> - vp90-2-21-resize_inter_320x180_5_1-2.webm
> - vp90-2-21-resize_inter_320x180_7_1-2.webm
> 
> 1 testcase failed with CRC mismatch:
> - vp90-2-22-svc_1280x720_3.ivf
> 
> 1 testcase failed due to unsupported stream:
> - vp90-2-16-intra-only.webm
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Vishnu Reddy (4):
>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>       arm64: dts: qcom: nord: Add iris video node
>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
> 
>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>  4 files changed, 131 insertions(+), 1 deletion(-)
> ---
> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> change-id: 20260918-nord-iris-70b17cd16a77
> prerequisite-message-id: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
> prerequisite-patch-id: 15b7e40d16abb923052d14832a468b832822e02c
> prerequisite-patch-id: a127e821eb3382d30c05fbcf8f3fb520263cbbc5
> prerequisite-patch-id: 2d52b8db1dca030ceb064f13dc912eb5478b7d63
> prerequisite-patch-id: d21f937c2939a84117e7f4e1473875412914f9a6
> prerequisite-patch-id: 97b755b1bb9cf6e3bd0b402bcec890161cad6868
> prerequisite-patch-id: 97f41c3ba82d7a7b866b35e7aced283e8d0f699e
> prerequisite-message-id: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
> prerequisite-patch-id: f8fbc6150e3c9173a58c51b21aa361b4bf427ff6
> prerequisite-patch-id: 914292456c91f83f83d078d3ed589e87ec1961ff
> prerequisite-patch-id: 8b04289460ffc81d540c383255e644eef8e7cf6b
> prerequisite-patch-id: bd8d5373421d6979f63ca6782dce3cfc8f7b8878
> prerequisite-patch-id: 5dcb5f0b6e62d524634f4876b33c0ef3482150ad
> prerequisite-patch-id: 4ec69028284b5b4f1d727d600ac81f9c91eed63e
> prerequisite-patch-id: 91d92d9d408bc5722e5eaa7f615269e64e459bd9
> prerequisite-patch-id: c7b1e7672798e47c66d645c14bec824b2eebed9a
> prerequisite-patch-id: 008c9c85a07687ae136b5cc62ad8aa2ea22fc2af
> prerequisite-patch-id: c90b7b7096decd328219c71689e95ffa4127e841
> prerequisite-patch-id: 112cc818078b668c3a08b8011a22cdaa3c965cf7
> prerequisite-patch-id: ae16d3341438d6d49a5d575f0e8d67465cee5d41
> prerequisite-patch-id: 521ccda14a5f47e8c231912e82ed32a4653e8805
> prerequisite-patch-id: a22fdd503289f80720b26f8244185226e0417115
> prerequisite-patch-id: a3dba98903fd87c5893422fbae7c376a77d44c30
> prerequisite-patch-id: 86e23f75f4b0f169e537ab6430cc33a2a4ad43a8
> prerequisite-patch-id: f93d80383550a3b1475356ddb725f3d6c2d25634
> prerequisite-message-id: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
> prerequisite-patch-id: d3621342d373b4e41ca0d0b9eb4648bf0187cf7b
> prerequisite-patch-id: e8b7e40ce305132672ca5d10063c1b20bfcc8361
> prerequisite-patch-id: 2d02f5f60554a49da2d030e507bb9a27ad99f092
> prerequisite-patch-id: 7c326dff78934f41e92cf662989b1d11fa670387
> prerequisite-patch-id: 7ad3809e9f6fe6fd47b95a7fd1dfc27fc290f457
> prerequisite-patch-id: cbaf2c4a49ef854d3f908de5d8871e9d49ce4a99
> prerequisite-message-id: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
> prerequisite-patch-id: 654ba807f2ca53a3b580f4990c28fa35fa7fc4fa
> prerequisite-patch-id: c9f7632f7f31b1fe6e40c2df354d6047553ed967
> prerequisite-patch-id: 95df9bbc25e2f96c3bc8090543bceed0a31527a2
> prerequisite-patch-id: cb3907b10983b3a473cb01fbfde657114e468523
> prerequisite-message-id: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
> prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
> prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
> prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
> prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
> prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
> prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
> prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
> prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
> prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
> prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
> prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
> prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
> prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7
> prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
> prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
> prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
> prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
> prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
> prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
> prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
> prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
> prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
> prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

