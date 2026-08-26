Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4D4302FA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751929; cv=none; b=iuWm0L+YhZ3m3k6z80D/uqsKZOi20t1XSdu5NV8Ir8inLb+UWq46jBvuvnc6On2AOn75+aLS8bGHQ4PKOJw6ntaF7iWyA3muJb8TqeXGmd4XN1TtxetDbOB80Oq2DEEQ9zY7m/BEtALwFztL8M+eGAnsHWqdhBLElAYbbsmWVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751929; c=relaxed/simple;
	bh=b3TbOLaOaVdbEoxxuz1CQtZAQmDctOUjkFHF9gAxpXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+w6MqsFDebDxilUUJXbJijv2az8xnntYV5grBEiASEiTm7gXbKd8eD1VmS62hp2p0no0QD8TrTH6CgFlCOJ4UbXbtxjfXwm8cFxk8pcZWGiPffPerAN3sR4QYxefiPd8HiuHvz0hoZDeSaWSswhKff1D+kj9upRsMQtvaE6Q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlNd3RgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC/h2+QP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlNd3RgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC/h2+QP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC4Uv356875
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=; b=hlNd3RgXSWmiQxeY
	bbtdV+I8fqLURJiyTIgClpz0Tr8jUPb/86Dv5BytCuvpCkSiYE7mnx38abo6bJMq
	GjE9WG8+JKCJkKlYb0RJS8sWBugJ4FbAMqRouy5blxcv1fQmCGIbm1oml9W6uyTH
	ef8Pna7IoNIgndJZ1ObAEwbaU9/pb0zYQD3t3Y2UWWqkWOu4IwJFSUPGu1aLnhYm
	214P6eaLNfyjtRKPHkvmniCr8A9BwTWFvK0eJ42ay9hv8UG22ttXfiGKG53RNmSF
	MQhJEe/Hv4GgzNS9dwjZUsGE8AREGlMrUpU85qt8eCx75ccDuh9q7j208avufXzG
	pstV8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9ga388-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:45:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1496995a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751919; x=1788356719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=;
        b=jC/h2+QPo8hl2x48C929uxKU8JrlPlct4SnuE4LHjlW4kcFzkTFku/edZ2f4oYQrqy
         FiEt+02bWDEF9s0rgh64D79/lXAag3LEJvdOWOg1SWhrIBNDa26+2tTNw2LskWsLc/v8
         SoOM//gp7Nwm6FsCOBqIp2FiWm7qqtLOu9WEEKV2dcWLAAdDrg9gG3sXhKdNbx2D1hoC
         lCEbzAKHnTwOFRXSEWH5lGPyIRVJoFfqvLlNWQdNooazrMzaqctpQSo3HeuzfEIOSQ0O
         QDzsOyM1camRcV98ZzsMHI0+n8xTJfUPPZW4i6sFmPZEjVSYZCrEBdiTu2bufnUdQfRu
         CDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751919; x=1788356719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=;
        b=S11aQzRNaqy2IfaxEUr0QVQtZ89FIg2P1fzitMKMVT0USJS7HY0bDm2P1uLezYfFVP
         NJZNPq/z9GJTCE3EKKvwa/Aq4AomBOqzNA0aFNvlMNGFJz3euGwhOgdQv7OxZEdeVHZR
         nj5aVufCXI6lxBm3nDOX2Am71tGHYbAgKMWSYHkE40MLexjq2O6F5wYa35j6mAnRoL1l
         D28UHs6UxRDCAWqrugYZwrEyBRJOKwDC+QDKFktbn5NjjiYCvzZwXzbwvCC8r81//E1N
         8CGrmJv9xFYcblPxy56igch3nXrlgEAEkc1a3Gk3eAb+YkTsincdYY3xCU4ctEmTaKcb
         phwg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5HwK4vA3WrDUseiuVNJ/2jmz+ldxwYZQPy3ivcWFt3dRoG9HvlVlw/l9I7Vwn//mKvfEUtuZpWDhLcKo=@vger.kernel.org
X-Gm-Message-State: AFuF++msfmckZbR7yvVJrTlTWOPTg2/xDix2oTk97Eu+le1v6YRJLP1K
	NQRGuQSnxk+b4GqAnP0rbP2l++Tbxh1FTjVlmfNchJ7b48HFHBE3Vv6KVzIUmLpO+wX8Z//FiM4
	/ekXuBvXt356s1A6/i2h8kUdw6Nb3q0ZfueeZ5Hy0JaCkimn4fI/DPr6CRYvCGahYDi0=
X-Gm-Gg: AR+sD12tK3Cz5S0TosPM04e4jkVuBsN55mtRpPDTFAvmhhH7yp8F4Dl0+1Zf9wJDDpR
	0XPNG2Rx14qPVIevkKHyxtCi0n3tyCfMgYwDHelSta/RMq8WMrA8gqQ6LXStLrYOtPLMA7Al6IV
	MOtRg3qMf9FaSy9CX/KChRTG4e3I963OV/iOFEHt42rHg1SsU9CDsRYb66LqRIyqJ2xZBN8fbW/
	0A+ju27ii/EdVy8H8MyVyylbG2GQvvH1GXa2LsdCwjyEy2pBoLPdeKLsdkE/3Kld91+VRBTDhQD
	FAnaVkLfJclLCG4zKT2l0RFYDDK9fnf7V9xayn4xrppTHJtJ3bRzRbd1OF5XXrgt33ZRXQsy6WA
	NtynGsn3YEaq7+mgzEY3HeoMvj+ryOw==
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr15825946a91.11.1787751918699;
        Wed, 26 Aug 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr15825822a91.11.1787751918186;
        Wed, 26 Aug 2026 06:45:18 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm13571333c88.5.2026.08.26.06.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:45:17 -0700 (PDT)
Message-ID: <2febead3-0f0c-4e0d-b11a-8c61ec027f44@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: rob.clark@oss.qualcomm.com,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <7030a8f8-f320-4b09-b2de-2c8e897409f8@amd.com>
 <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CrIOZ0RmymCfnkwM1daJ1nSQ6zltyd7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfXyr7hWdE8k3kR
 NvmIv0fYCXX319EbQ4cIrH451qWFJ1XUZv5kQ9RcjXxirovQdwvGfsDiv+54N3UhOLwxVU+dnh6
 wkg2fZb4akodeLkRcd93BD2diUU6vtespaLGJHvmfvxKiCEsYOWHhpMbe0Ckc3Q06i8Yn7O+29i
 eP20wyVn9/7BrDPguPjWWQKneogQ9gjAlv31a0A6qonPg62QcIHwvWfb2RE2EXaSaqCgrRSgVTq
 3rMhiSIKZugjHWVWyEUy9ye4qHu/LgOzU4A0q8dHOlJY0SLaRVd660w3tfckrA6RxR8IQuNBLWA
 p31rngf/pH5wAGrVnKcSvTDuC2mgxOXQlYvBRx7a2Lo6LbXpmrYg0ZN+KTV01qqD7Jt8XvvON4L
 5P4JDdzK3TZ7Hd07zp2TiCct8SZx+qm8EWoEmD2Ucv4h8vmDtApu25RsAqCuXef4a6qbCM9On0p
 xdJfPIqHmk/8Q9Mf6mg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8eedef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sLzL-2GVjjNmCx-rav0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfXwab+nfOm/pGM
 8VDK2R6AruvGVdThz6m/PYbrt6h/W5I2GM1pyfUvYOWq1zpVPM5T/V74tP31qQ/saZQFCXLNMs2
 VHVPpVqa4ZG834+7HV6neN+1vuf4JrM=
X-Proofpoint-ORIG-GUID: CrIOZ0RmymCfnkwM1daJ1nSQ6zltyd7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

On 24-08-2026 20:37, Rob Clark wrote:
>>> qda_memory_dma.c / qda_memory_dma.h
>>>   DMA coherent allocation backend. qda_dma_alloc() calls
>>>   dma_alloc_coherent() on the CB device and encodes the stream ID
>>>   (SID) in the upper 32 bits of the returned DMA address, following
>>>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>>>   qda_dma_free() strips the SID prefix before calling
>>>   dma_free_coherent().
>>>
>>> qda_memory_manager.c
>>>   Adds process-to-device assignment: each DRM file (process) is
>>>   assigned one IOMMU context bank device for the lifetime of the
>>>   session. qda_memory_manager_assign_device() first checks whether
>>>   the process already has a device (reusing it with a refcount
>>>   increment), then falls back to claiming an unassigned device.
>>>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>>>   to the DMA backend after resolving the correct CB device for the
>>>   calling process.
>> Oh, stuff like that is usually a pretty big NO-GO now.
>>
>> AMD has made the same mistake with KFD and it resulted in a massive chaos.
>>
>> The DRM file is the driver context your process uses and even if there are multiple DRM files for the same PID you should absolute *NOT* share anything between them.
>>
>> The general rule of thumb is to not attach anything to the process using the DRM file descriptor.
> A couple other things to keep in mind:
> 
> 1. drm device fd can be passed across processes
> 2. virtgpu/virglrenderer drm native ctx is a single process that opens
> the drm device file N times on behalf of N guest userspace processes.
> 
> All that to say, Christian is right here.. drm_file is your context,
> pgtables should be attached to the drm_file (potentially via
> drm_gpuvm.. which you perhaps want to use).
> 
> BR,
> -R
> 
>> Regards,
>> Christian.
>>

Hi Christian, Rob,

Thank you for highlighting this.

I'll rework the CB assignment to be per-drm_file. Each open() will get a
CB assigned from the available pool (find-first-available, not
find-by-PID). The assigned_pid field and PID-matching logic will be
removed entirely.

The hardware has a limited number of context banks that serve many
sessions (on fastrpc, via the DT "qcom,nsessions" property), so multiple
drm_files may end up sharing the same underlying CB due to hardware
constraints, but while implementing that also, I'll ensure that the
association goes through drm_file->driver_priv, never through a PID scan.

I'll also look into drm_gpuvm for the longer-term address space
management as Rob suggested.

Thanks,
Ekansh

