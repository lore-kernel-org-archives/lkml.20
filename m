Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EE3AFB19
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328158; cv=none; b=JMeIyAHpBhBWUHqhyVTR1GoZ8I9tPhl/6xg5Qo024q5iQsTWo7KB0GhIOzLU6IiXaM3r1ILpJflaFs+Hnnkmzp6zNrZF3Rf0tOudHClQrRLx8UnJw6v6Bys5/35aXLG7adAn/mapXb8YiYRJnjIviTASwetHASl8WORQyTVAtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328158; c=relaxed/simple;
	bh=YtWl7CW8pFM21vVHZ453OHQhGvKLdkG0CdKIGSZX0Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a16fe5gYxheMPg86ApmkJrQ94FIUodLze46CEkShXVr3slwR6FIdxEPXUbSWSWMURr0OEEQ8fzJA0PdMC/Rl4eTWsAu9/YVjD6fDaiX1BlmlloG+sGNo39j+kJSesG8wt9MlkWMWnaAzAFGgFL63z2Nh7rmkoovjNhKXmRFEJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnOLrD4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVuXlg60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnOLrD4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVuXlg60"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ya4m039682
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+natg74el64yLPwZE7B8UFJigLFNT6PNSEZ9Y9FYSQ=; b=MnOLrD4Y2l7RaZDM
	XzoMbZAt8aIn8VCyx/BHKjPbt1tKuFE6Arvcqy1DVPhYS+B8skzGjz8g9iFxaTRu
	NQwdeJDQvAVoJlVt+CCIuXEDpFS0QSu1qhBVfmakEtup7+I5FhbiGrnxD6+kiOYz
	TXs5weBfiA7GisWa6fW3qMSGT18+mrvVFJVGE9g9oRxuo0nra0ARpvEsLwrmINj4
	2qVFpmQrpyTKDBx3EmlSt8nFfdMwQRw4Njbv6VVWUz6B+AntYkop1AjCDrtMOHjz
	C81BrVF1laXT7QWIFLPuQWVyxXD30e2+OQIVUL+325sZSdPEzMkTsLUtWMq8H4Ol
	AiRwlQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46542pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:22:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2696503eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328148; x=1790932948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+natg74el64yLPwZE7B8UFJigLFNT6PNSEZ9Y9FYSQ=;
        b=dVuXlg60L1pE1vnaLahJmbBlGUPUEybbYi6PudHrER7pqkXlI4MEtHYhnXiBOfEr5S
         nJEoxb807LX+vxUdbWJ3DvzYhDE24JiBBkQD8d31rr3RmytWnbhXcyMFDXTEh7Zxw3KC
         dRO4YsN9/Nl2uKZoHCq3+wkITKymoaDOVc2r1kuHW41CPu3aiqwUbHpi56KJZJZ+4EHA
         rthUPOfPJ1U8vzzjIj7DExrxktQjGRIaDwhmP+cQnW080BqiE9GAA01w/EhPI/lRvUqC
         61+p860wXnNkWceD91izgi8JTh1+wqwVu7qiAtKvLOm02nZoaebfnkxHtH7aoHW1ulLo
         n49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328148; x=1790932948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+natg74el64yLPwZE7B8UFJigLFNT6PNSEZ9Y9FYSQ=;
        b=0feCfzo7/0Hj0FbWqB+t4ifD/d0/8q9Qp9RaqiuUBLyKDGHCWdvioSl/iJtTffKK5C
         6GfBa4Qg0BrllimsbTuPPAdFORDSwTWYdTWFhajNmCL2kwP9NCB7ZFjft3Np7jFLjKrB
         kE95IvzrToCwuqwsQoaxBYAAzmdr6de88gpB1zRM4pRs2sijnzzMmyxEGyPAz2Ko6eLL
         S9tPoHEvSAyihCJV0Fo2+jz9FX+jQNtcW7XvemgOlljWAUU3waBrikkiuLL1y2O95Ab1
         3s2z3UHt3CyqpMHNk32BAQlfM2yf2JogjrFEi1dp/maitKJ9k9WYUHseTq8fvpkFoRfY
         W03Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/txbS063ftbQLyDN82nQXVAuWb94mrB0wBB/w29EKMe1Qf+XdEUD590MbVU4YkZDDwVKFNQGBeeYPhio=@vger.kernel.org
X-Gm-Message-State: AFuF++mrhkFYXBoVBst9/aBseXRqfM+482KE/gsNKrD1FHg/QXe1bGbc
	AV9nENs3c567pPEvB7jeg8PVKpWEWBDKNquLX7XT1deN0MJBh52C1IqzMJpe+es1QJ1dqWoze5/
	1anTl3SwzPADRSdJMaaoCDjlcYvxTPGuY/WkhY8D5q3x13c34KVW0iSmg92DOEmrtCCY=
X-Gm-Gg: AYBFou0o/0LgZE7Ns0yxaBnzTAZYqS/GwjJpIoNps1tudye++G/ebaNlyVT7KweBz1b
	TZc2DfNUSst4SLej9jaaE1b+oSVD9Zybawd+rBioS/64dSPzo9g5OSb8+Y3IaljP8eMeUKMeiy+
	qo4mhAMbOK799i+VNcWECCGwpHL++qD+RfJlOINgcMF43o5iqNbM+1VGTlAzUBCwX9dZFnzs6js
	tuvLepbOnOQTu+eXoX7nFuMPxrD75oXq6nXphc9ZdZub6g7dlWZY0TJSBUQimX873fmS/oOMUCv
	yx54AbqNwSv24P2601HvZ3IEE01Inn2tUYxA22T9iuSdLHolYah1dXFNqFTQrmp5kxaZEDf7a88
	+Adhz3gwiLK3W6VM=
X-Received: by 2002:a05:7301:4909:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-340034bb387mr4138591eec.23.1790328148022;
        Fri, 25 Sep 2026 02:22:28 -0700 (PDT)
X-Received: by 2002:a05:7301:4909:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-340034bb387mr4138548eec.23.1790328147055;
        Fri, 25 Sep 2026 02:22:27 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm5125073eec.8.2026.09.25.02.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:22:26 -0700 (PDT)
Message-ID: <8eb8208b-c580-48e5-bbc8-22ecfdb66313@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab63d55 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7EX64IfosqQw0DGvupcA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 09rlk48DItHAVRy8T2OoArVcxENBPENZ
X-Proofpoint-GUID: 09rlk48DItHAVRy8T2OoArVcxENBPENZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX5d/m+VUkwXQN
 UI1NU1GXS5U5/8JLBwT4k9I9WtsriUbE1Ot6P/uuDT9UZe/FnnF385EUZ90Y9OGJioG19ciYVbw
 hhb8xcEzIw9CCgtpLsOccYkMHIDUi1ZSjkuSd+94idszZJAwqBnfzL/cjmNNZtkZLlpj9bsMNMG
 ipS2BCHfTkbsTj38BJR2xa9keC/3ycX2BOPhT0+m+X8FiB9uJ6J0SL2FuFATKu7u5pcXEVc0pcr
 yfmbWd+pcX320gBOVl04ZtQv9nYvTOsgplEpZkBnheHrkjNjxhB6dV+skuFNbCTbZ0CtuAfTg4k
 lnzSq7QxbUlHTt76oE1Lg0rZsvLv1Rd/uMX3aIgvmlO3w1HvwBm0ohvhQtI7+ci2mAWsplvg712
 FkF2fIipWOoLZk6GcFmDuQWA0+lLLDBUPL94lg60PCpwiNh6PTxnpz2iMpsGPYBK7j5dw2GBWV7
 qHY3VOozZ2w0cJNJQfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX+b7+s6C6GEZi
 X7jB69fZAty9tzHMqoj1+wezn3RK+tysA4tuuzGEkcqdGtMBftDfEl1/LaTQ/tGMNiPOUHV10Oz
 CoCl2YbQhWYUZNz5yvGH93zJK0v6328=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250037



On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
> 
> v4l2-compliance results:
> 
> v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
> v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:5a00000.video-codec
>         Driver version   : 6.19.0
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
>         Standard Controls: 43 Private Controls: 0
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
>         test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK67609.731994] use of bytesused == 0 is deprecated and will be removed in the future,
> [67609.741833] use the actual size instead.
> m (Not Supported)
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, CREATE_BUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
> v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
> v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Decoder
>         Bus info         : platform:5a00000.video-codec
>         Driver version   : 6.19.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Decoder
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
>         test Scaling: OK (Not Supported)
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
>         test blocking wait: OK
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
> Fluster results for HFI Gen2 firmware:
> 
> ./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
> The failing test case:
> - Unsupported profile: H.264 Extended profile is deprecated.
>         - BA3_SVA_C
> - Interlaced content is not supported yet.
>         - CABREF3_Sand_D
>         - CAFI1_SVA_C
>         - CAMA1_Sony_C
>         - CAMA1_TOSHIBA_B
>         - CAMA3_Sand_E
>         - CAMACI3_Sony_C
>         - CAMANL1_TOSHIBA_B
>         - CAMANL2_TOSHIBA_B
>         - CAMANL3_Sand_E
>         - CAMASL3_Sony_B
>         - CAMP_MOT_MBAFF_L30
>         - CAMP_MOT_MBAFF_L31
>         - CANLMA2_Sony_C
>         - CANLMA3_Sony_C
>         - CAPA1_TOSHIBA_B
>         - CAPAMA3_Sand_F
>         - CVCANLMA2_Sony_C
>         - CVFI1_SVA_C
>         - CVFI1_Sony_D
>         - CVFI2_SVA_C
>         - CVFI2_Sony_H
>         - CVMA1_Sony_D
>         - CVMA1_TOSHIBA_B
>         - CVMANL1_TOSHIBA_B
>         - CVMANL2_TOSHIBA_B
>         - CVMAPAQP3_Sony_E
>         - CVMAQP2_Sony_G
>         - CVMAQP3_Sony_D
>         - CVMP_MOT_FLD_L30_B
>         - CVMP_MOT_FRM_L31
>         - CVNLFI1_Sony_C
>         - CVNLFI2_Sony_H
>         - CVPA1_TOSHIBA_B
>         - FI1_Sony_E
>         - MR6_BT_B
>         - MR7_BT_B
>         - MR8_BT_B
>         - MR9_BT_B
>         - Sharp_MP_Field_1_B
>         - Sharp_MP_Field_2_B
>         - Sharp_MP_Field_3_B
>         - Sharp_MP_PAFF_1r2
>         - Sharp_MP_PAFF_2r
>         - cabac_mot_fld0_full
>         - cabac_mot_mbaff0_full
>         - cabac_mot_picaff0_full
>         - cama1_vtc_c
>         - cama2_vtc_b
>         - cama3_vtc_b
>         - cavlc_mot_fld0_full_B
>         - cavlc_mot_mbaff0_full_B
>         - cavlc_mot_picaff0_full_B
> - Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
>         - FM1_BT_B
>         - FM1_FT_E
>         - FM2_SVA_C
> - Unsupported bitstream: SP slice type is not supported by hardware.
>         - SP1_BT_A
>         - sp2_bt_b
> 
> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 113/147
> The failing test case:
> - Unsupported level
>         - AMP_D_Hisilicon_3
>         - AMP_E_Hisilicon_3
>         - AMP_F_Hisilicon_3
>         - DELTAQP_A_BRCM_4
>         - IPRED_A_docomo_2
>         - IPRED_C_Mitsubishi_3
>         - LS_A_Orange_2
>         - LS_B_Orange_4
>         - PPS_A_qualcomm_7
>         - RAP_B_Bossen_2
>         - RPS_F_docomo_2
>         - SAO_G_Canon_3
>         - SDH_A_Orange_4
> - 10bit content not supported yet
>         - DBLK_A_MAIN10_VIXS_4
>         - INITQP_B_Main10_Sony_1
>         - TSUNEQBD_A_MAIN10_Technicolor_2
>         -  WPP_A_ericsson_MAIN10_2
>         -  WPP_B_ericsson_MAIN10_2
>         - WPP_C_ericsson_MAIN10_2
>         - WPP_D_ericsson_MAIN10_2
>         - WPP_E_ericsson_MAIN10_2
>         - WPP_F_ericsson_MAIN10_2
>         - WP_A_MAIN10_Toshiba_3
>         - WP_MAIN10_B_Toshiba_3
> - Unsupported resolution
>         - AMP_A_Samsung_7 - resolution is higher than max supported
>         - AMP_B_Samsung_7 - resolution is higher than max supported
>         - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>         - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>         - PICSIZE_C_Bossen_1 - resolution is higher than max supported
>         - PICSIZE_D_Bossen_1 - resolution is higher than max supported
>         - TUSIZE_A_Samsung_1 - resolution is higher than max supported
>         - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
> - CRC mismatch
>         - RAP_A_docomo_6
> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>         - VPSSPSPPS_A_MainConcept_1
> 
> ./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
> The failing test case:
> - Unsupported resolution
>         - vp90-2-02-size-08x08.webm
>         - vp90-2-02-size-08x10.webm
>         - vp90-2-02-size-08x16.webm
>         - vp90-2-02-size-08x18.webm
>         - vp90-2-02-size-08x32.webm
>         - vp90-2-02-size-08x34.webm
>         - vp90-2-02-size-08x64.webm
>         - vp90-2-02-size-08x66.webm
>         - vp90-2-02-size-10x08.webm
>         - vp90-2-02-size-10x10.webm
>         - vp90-2-02-size-10x16.webm
>         - vp90-2-02-size-10x18.webm
>         - vp90-2-02-size-10x32.webm
>         - vp90-2-02-size-10x34.webm
>         - vp90-2-02-size-10x64.webm
>         - vp90-2-02-size-10x66.webm
>         - vp90-2-02-size-16x08.webm
>         - vp90-2-02-size-16x10.webm
>         - vp90-2-02-size-16x16.webm
>         - vp90-2-02-size-16x18.webm
>         - vp90-2-02-size-16x32.webm
>         - vp90-2-02-size-16x34.webm
>         - vp90-2-02-size-16x64.webm
>         - vp90-2-02-size-16x66.webm
>         - vp90-2-02-size-18x08.webm
>         - vp90-2-02-size-18x10.webm
>         - vp90-2-02-size-18x16.webm
>         - vp90-2-02-size-18x18.webm
>         - vp90-2-02-size-18x32.webm
>         - vp90-2-02-size-18x34.webm
>         - vp90-2-02-size-18x64.webm
>         - vp90-2-02-size-18x66.webm
>         - vp90-2-02-size-32x08.webm
>         - vp90-2-02-size-32x10.webm
>         - vp90-2-02-size-32x16.webm
>         - vp90-2-02-size-32x18.webm
>         - vp90-2-02-size-32x32.webm
>         - vp90-2-02-size-32x34.webm
>         - vp90-2-02-size-32x64.webm
>         - vp90-2-02-size-32x66.webm
>         - vp90-2-02-size-34x08.webm
>         - vp90-2-02-size-34x10.webm
>         - vp90-2-02-size-34x16.webm
>         - vp90-2-02-size-34x18.webm
>         - vp90-2-02-size-34x32.webm
>         - vp90-2-02-size-34x34.webm
>         - vp90-2-02-size-34x64.webm
>         - vp90-2-02-size-34x66.webm
>         - vp90-2-02-size-64x08.webm
>         - vp90-2-02-size-64x10.webm
>         - vp90-2-02-size-64x16.webm
>         - vp90-2-02-size-64x18.webm
>         - vp90-2-02-size-64x32.webm
>         - vp90-2-02-size-64x34.webm
>         - vp90-2-02-size-64x64.webm
>         - vp90-2-02-size-64x66.webm
>         - vp90-2-02-size-66x08.webm
>         - vp90-2-02-size-66x10.webm
>         - vp90-2-02-size-66x16.webm
>         - vp90-2-02-size-66x18.webm
>         - vp90-2-02-size-66x32.webm
>         - vp90-2-02-size-66x34.webm
>         - vp90-2-02-size-66x64.webm
>         - vp90-2-02-size-66x66.webm
>         - vp90-2-08-tile_1x8.webm - resolution is higher than max supported
>         - vp90-2-08-tile_1x8_frame_parallel.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-1-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-2-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-4-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-8-1.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-8-2.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm - resolution is higher than max supported
>         - vp90-2-14-resize-10frames-fp-tiles-8-4.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-1-16.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-1-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-16-1.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-16-2.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-16-4.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-16-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-2-16.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-2-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-4-16.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-4-8.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-8-1.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-8-16.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-8-2.webm - resolution is higher than max supported
>         - vp90-2-14-resize-fp-tiles-8-4.webm - resolution is higher than max supported
> - Unsupported format
>         - vp91-2-04-yuv422.webm
>         - vp91-2-04-yuv444.webm
> - CRC mismatch
>         - vp90-2-22-svc_1280x720_3.ivf
> - Unsupported resolution after sequence change
>         - vp90-2-18-resize.ivf
>         - vp90-2-21-resize_inter_320x180_5_1-2.webm
>         - vp90-2-21-resize_inter_320x180_7_1-2.webm
>         - vp90-2-21-resize_inter_320x240_5_1-2.webm
>         - p90-2-21-resize_inter_320x240_7_1-2.webm
> - Unsupported stream
>         - vp90-2-16-intra-only.webm
> 
> Fluster results for HFI Gen1 firmware:
> 
> Tests failing with the Venus driver, but passing with the Iris:
> - H.264: BA3_SVA_C
> 
> - H.265: ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3,
>   ipcm_E_NEC_2, IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1
> 
> - VP9: vp90-2-14-resize-10frames-fp-tiles-1-2.webm,
>   vp90-2-14-resize-10frames-fp-tiles-2-1.webm,
>   vp90-2-14-resize-fp-tiles-1-2.webm,
>   vp90-2-14-resize-fp-tiles-2-1.webm,
>   vp90-2-14-resize-fp-tiles-4-1.webm,
>   vp90-2-14-resize-fp-tiles-4-2.webm,
>   vp90-2-15-segkey.webm
> 
> Tests failing with the Iris driver, but passing with the Venus (due to
> interlaced H.264 being not supported yet):
> 
> - H.264: cabac_mot_fld0_full, cabac_mot_mbaff0_full,
>   cabac_mot_picaff0_full, CABREF3_Sand_D, CAFI1_SVA_C, CAMA1_Sony_C,
>   CAMA1_TOSHIBA_B, cama1_vtc_c, cama2_vtc_b, CAMA3_Sand_E, cama3_vtc_b,
>   CAMACI3_Sony_C, CAMANL1_TOSHIBA_B, CAMANL2_TOSHIBA_B, CAMANL3_Sand_E,
>   CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30, CAMP_MOT_MBAFF_L31,
>   CANLMA2_Sony_C, CANLMA3_Sony_C, CAPA1_TOSHIBA_B, CAPAMA3_Sand_F,
>   cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
>   cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
>   CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMA1_TOSHIBA_B,
>   CVMANL1_TOSHIBA_B, CVMANL2_TOSHIBA_B, CVMAPAQP3_Sony_E,
>   CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
>   CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, CVPA1_TOSHIBA_B,
>   FI1_Sony_E, MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B,
>   Sharp_MP_Field_3_B, Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v9:
> - Rebased on Bryan's tree, reverted the previous version of firmware
>   detection patch
> - Added memzero of the firmware region (Sashiko)
> - Corrected max bitrate settings for H.264 (Sashiko)
> - Link to v8: https://patch.msgid.link/20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com
> 
> Changes in v8:
> - Rewrote firmware detection once more, making sure it handles mdt files
>   in addition to mbn. Dropped reviews (Sashiko)
> - Adapted LTR and B_Frames support to Agatti tables.
> - Limited HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS to be used only on
>   Agatti (Sashiko)
> - Link to v7: https://patch.msgid.link/20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com
> 
> Changes in v7:
> - Rewrote firmware detection, making it more robust. Assign firmware
>   resources only once and under the lock. Dropped reviews (Sashiko).
> - Fixed typo in the formats removal comit message (Vikash)
> - Fixed 'invalid buffer' return in iris_hfi_gen1_buf_type() (Sashiko)
> - Added a warning if firmware responded with more than one property
>   (Sashiko, Vikash)
> - Fixed encoder path to also read buffer sizes on AR50LT.
> - Made iris_vpu_ar50lt_p1_gen1_s6_desc and
>   iris_vpu_ar50lt_p1_gen2_s6_desc static (Media CI)
> - Link to v6: https://patch.msgid.link/20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com
> 
> Changes in v6:
> - Included the Kodiak Gen2 patch to remove extra dependency.
> - Reworked buffer handling, dropping useless is_obp (false) and
>   num_vpp_pipes (1) (Sashiko, Vikash)
> - Removed IRIS_FMT enumrations, fixing the way the driver handles the
>   format enumerations (Sashiko)
> - Moved buffer size querry to iris_hfi_gen1_set_bufsize(), making sure
>   that it isn't repeated for each possible buffer size (Vikash)
> - Fixed gen2 -> gen1 typo (Vishnu)
> - Link to v5: https://patch.msgid.link/20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com
> 
> Changes in v5:
> - Corrected UBWC formats handling for non-UBWC targets (Sashiko)
> - Added missing data to x1p42100 data structures (Sashiko)
> - Fixed bw calculations to use actual FPS, switched to common
>   iris_vpu2_calculate_frequency() (Sashiko, Vishnu)
> - Added comment regarding hold_count vs min_count (Sashiko)
> - Link to v4: https://patch.msgid.link/20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com
> 
> Changes in v4:
> - Rebaed on linux-next, fixing conflicts. Note, these patches require
>   both media/fixes and media/next and thus can be applied only after
>   7.2-rc1.
> - Link to v3: https://patch.msgid.link/20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com
> 
> Changes in v3:
> - Corrected dependencies list in the cover letter
> - Link to v2: https://patch.msgid.link/20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com
> 
> Changes in v2:
> - Dropped OPP patch, applied by Bjorn.
> - Dropped extra check for throttle clocks (Vishnu)
> - Made iris_inst_fw_cap_gen1_ar50lt_dec and inst_fw_cap_sm8250_dec const
>   (Vishnu)
> - Renamed iris_vpu_ar50lt_buf_size() to iris_vpu_ar50lt_gen2_buf_size()
>   (Vishnu)
> - Link to v1: https://patch.msgid.link/20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com
> 
> To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Bryan O'Donoghue <bod@kernel.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Dikshita Agarwal (11):
>       media: iris: Add Gen2 firmware autodetect and fallback
>       media: iris: Skip UBWC configuration when not supported
>       media: iris: Filter UBWC raw formats based on hardware capabilities
>       media: iris: Introduce set_preset_register as a vpu_op
>       media: iris: Introduce interrupt_init as a vpu_op
>       media: iris: add vpu op hook to disable ARP buffer
>       media: iris: Add platform data field for watchdog interrupt mask
>       media: iris: Add platform flag for instantaneous bandwidth voting
>       media: iris: Add framework support for AR50_LITE video core
>       media: iris: Introduce buffer size calculations for AR50LT
>       media: iris: add Gen2 firmware support on the Agatti platform
> 
> Dmitry Baryshkov (8):
>       Revert "media: iris: Add Gen2 firmware autodetect and fallback"
>       media: iris: drop IRIS_FMT_foo enumeration
>       media: iris: skip PIPE if it is not supported by the platform
>       media: iris: add minimal GET_PROPERTY implementation
>       media: iris: update buffer requirements based on received info
>       media: iris: implement support for the Agatti platform
>       media: venus: skip QCM2290 if Iris driver is enabled
>       media: iris: constify inst_fw_cap_sm8250_dec
> 
>  drivers/media/platform/qcom/iris/Makefile          |   2 +
>  drivers/media/platform/qcom/iris/iris_core.c       |   6 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   3 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 119 ++-
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 406 +++++++++-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  30 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  15 +
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  80 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 859 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   3 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  14 -
>  .../platform/qcom/iris/iris_platform_common.h      |  14 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  12 +-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  20 +-
>  .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 117 +++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_resources.c  |   2 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  34 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       |  33 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   2 -
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  30 +-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |   6 +
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      |   2 +
>  drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 370 +++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  38 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  43 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   1 -
>  drivers/media/platform/qcom/venus/core.c           |   4 +-
>  32 files changed, 2308 insertions(+), 102 deletions(-)
> ---
> base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
> change-id: 20260507-iris-ar50lt-06228469aa5b
> 
> Best regards,
> --  
> With best wishes
> Dmitry

Tested-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

