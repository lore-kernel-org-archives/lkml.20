Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E6492E2D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908723; cv=none; b=Xebnzt0e6pC1+VSAqodX5/RfDFNXnKV06JX62MCnJFuc5ktrgLPqbY021e4BWHMHWna/hnIf2Oq4/bPwqpLk2S93wMVXfQnpXfIV3Y8bfiiXAd1+8z3a8b1KOV/iv5aIG6kQqJWd9B565fiMV7eBhNVJVGPxCAPc6pAkc9HDnEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908723; c=relaxed/simple;
	bh=Uy/e3pYwP42TDDIvFNQ90B89CTw2CPnfTxb4AAbQsCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnLaqj8LhTvBF9Kc6kREbj3558SXYBKeSVWYlivtlxgwykbqI6qXos5R9kuSL0VHRk4p/trC0HQSKdAQYJLULwmgjX5o2P03PTpMVvWg5LWs3Yw61e/HAT5qSDtkzqhD+qyLmH7ULJrKIZANXWz43XJwv4yet50LMixovqQ6mCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmzqmxQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MI+Ip1B1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmzqmxQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MI+Ip1B1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MhB0P693945
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 23:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=; b=hmzqmxQ42BEaEeVT
	IvNKp7PG5jp6hEdrg0XvJzRNv5f6ND/AmKEpWuGd/N5xmhEiJASv/TWngbjQAqzh
	7gCMVK4IQCk3Z8PBOM9Xh6ZkGqqHV+2j+WW8hmFsyWuexQbLjafy+z73SG47xBcX
	vAuyJtWjOgbFifUvlCB9tSXi3R81jy9c33TvL6BpYJg1M5iS8RVvdpjCRTLvPoGl
	UTPT/0dCwtgWp67I0l7aZZViLCVvM+LgN6AZrRF27MyKSN3vxxEiJYL0VbzAGnSO
	R/yKHeK5QEM8WyHi7a0gvAdRlAo/n68JhMLAeMoDRwTKEdMroGjl9mbWdW5fYszH
	KQoBtQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp4bf7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:05:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98055f91346so3547862241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788908720; x=1789513520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=MI+Ip1B1QxY5yeADFO7VaNuzwqTkLmOarRGZ2i9BqPR4GzxDKr1VGj6UgeCBvR9D1h
         aCTFOnakpNeJDQ363XVoubAVdltuD3VJhodflbkIuHW/1eJxxNODg09dR9X4qO2w3o4T
         AAukGaVpAmBOfe7Lr5qOXPjat11aXppY0zYIKt7DWbeAwLoFlfOFNmSVFdG6WMXYx0QW
         uX4LI5HyR4vJm74DgU9Qge6nOGxsWm8t9gtvb11ByAm5HgnafNRUpsGR0iwWdKYH0t1I
         WB5KjpiAH2EW+EJ/VTDQNDChxu904RP9lSqq5QAuNHbeJ46ZV9d8iSNXOc9GPCNFFuoY
         JDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908720; x=1789513520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=iXxn0Hl5y1VtMv2wRjYnxPb34MBPNR/S8aLZgj+v4PFcnIYzIjXa7bUdbsHRSvlGrt
         Z24b3q6lo889Yfv+7C82FiWqMBC1BekI9PK6p3Y6+LXBfHHxghU8nutcWVcAHJKwQq7x
         Q8j82NdlOncu5YfIUe/+PPNwgVn93CObK50ycZGSggHAUMg0y6Va7fatN9o5zNDX8s1u
         8dytxlr2XwFJuUlnJIUDIjTPUGkLhESm78NDnMFpvv5rEfafIv5wSVIVZTVF3jtXYZsX
         dYsfQuApaoH08YZb+LpGKfT3ANqL3wyY+Frs5WF3j6Em0QE2yQvuTdjSZUn+GnzxDZc0
         jg9Q==
X-Forwarded-Encrypted: i=1; AKwUvByBpskRjYWA4QyAaWOrMiFvCyeKiYkM2Mohl+8gH8i1AZ7x3D4X6feVFhUIdIjZZabjBmCsSd33l4QQyzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kvpzjBZv6fJRXEOCraf8pbIxkroLNnWQ9oglw/1652LxotD18O
	ZB+2QwTF9jWB/2cqjXk3waolYtt4D7SWhjsN0XICdCYlUEjcxiFf+x+czLYchMr8cYGVkMU86fl
	59QLT0mZhpFoQzaOf4iNodD7gAj5sEbEKteWSbzzULlGFKIkk7qlcB8eUhcJMWPBMkBI=
X-Gm-Gg: AYBFou0kCPl9XTDAuYL2JmKXodTs+C6yNiWEGg+OW4tgiEK5zWK5M1+oTLTZRtgI+4m
	waXzJqNxUfjFjoCx1O1NZNSw9ZCkIXnV1ycdklGnIJb9vqlya8vmYk1vXaNDwQI5nEP37PXqO5H
	etUGC3nBXKr5O6g7tH9RrRtsxMUwzWNVApauHLyp5ZZJfrgV7ADqnJ4bbZypn/A8SKvQDOJesSI
	TPp8FAUbwyqq57czhxGkrDQWXwUj2U0y+L77bVdKrF3MDGMhNDXaHjyX1fu/2XeiCG8UuOxK/0k
	fXLjzIgMSrrjSK8q3QeF4+ZTaGBfjpHq+ofRprKnILSSK2SDeulvk1X+pYE6IDWTfRcnoffVW5W
	QmwtYS0OflzCDyom+XKrHV0nNI37s2yUHH18AceLZbaDopDv/5UE8/q92qGjoGc1xnvW5XRzxno
	pu3no+sZ/Brl2I
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097730137.11.1788908720211;
        Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097683137.11.1788908719796;
        Tue, 08 Sep 2026 16:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37058669fsm36735161fa.17.2026.09.08.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:05:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 11/15] accel/qda: Add PRIME DMA-BUF import support
Message-ID: <d4ykcbhd2bqisv47s6hutrpdtlox2aid3j6pkgif6tptivaqkn@tko3tts7hzcn>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
 <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
 <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa094b0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pwSLSVGh1Xxsrx2JAEcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Uja1ex-Q2qdlm8ibx8aViX70pEHPQq_M
X-Proofpoint-GUID: Uja1ex-Q2qdlm8ibx8aViX70pEHPQq_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfX1S0Bt2F94T17
 2FH2SRSElRXa0PL5r5/GWxMspnDuFLdMwyRgpkEzYwhTVhkLgejALOHJhXsADbBOPjFBu8xkIgW
 4+UQC5ZnD2tV6eGHt3NzA3LxHhTmhMuC+8jHG32mpMG6rjIbIYIOe1JY0XWf+N3vxCPEZtONBey
 fe1kql1yGkxyEwa5iheGiPCwrYdgLs3rHwzz4ZAwt7JmdGRVxDQP0s9xypmTpu4jTpd4zdN6w0y
 LerVqmQdAL6T1dB1VSBU0REmG9gTPYAThpPYy2exZZrMrk34pTuqLsKzu+tWAXLDVxiIcJPZw/D
 Lc9ggzb4PE8b7KudijI/6wQq7L5alXM76dza8Oz8xf6veY/lOzrYE/FxzP6/S8vXum5ZGJnikKJ
 Cunyk5EpYEBmOIT40CTjS4H8C5yZdZ9LPeV9n8Tcy9NKzPzn+4E57atqGdXJCZ6kh6e8y+BMGXp
 mV1u9cOSmxlnFDqJ52g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfXwmlM2bcjfULj
 DfMn0EhfNc3PEC/iqtF60wQELLDJEOAVSNGbHUUQWXs+GsTqscsz5Q5pt5bj0IrZI9nsGbeo3XT
 5PCrts5hJfu/E0wRe2eo+qJ9tH3j1nc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080252

On Tue, Aug 18, 2026 at 11:55:50AM +0530, Ekansh Gupta wrote:
> On 18-08-2026 09:25, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:46AM +0530, Ekansh Gupta wrote:
> >> Allow user-space to import DMA-BUF file descriptors from other
> >> subsystems (GPU, camera, video) into the QDA driver via the standard
> >> DRM PRIME interface.
> >>
> >> qda_prime.c
> >>   Implements qda_gem_prime_import(), which is set as the driver's
> >>   .gem_prime_import callback. On import it:
> >>   1. Short-circuits self-import: if the dma_buf was exported by this
> >>      device and is not itself an import, the existing GEM object is
> >>      returned with an incremented reference count.
> >>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
> >>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
> >>      DMA addresses are IOMMU virtual addresses in the CB device's
> >>      address space.
> >>   3. Calls qda_memory_manager_alloc() to record the mapping and encode
> >>      the SID in the upper bits of the DMA address, matching the
> >>      convention used for natively allocated buffers.
> >>
> >>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
> >>   qdev->import_lock, storing the calling file_priv in
> > 
> > Why do you need a separate lock?
> Will add details in commit message,
> The lock serialises the `fd_to_handle → gem_prime_import` call so that
> `current_import_file_priv` is valid for the duration of the import.
> Without it, two concurrent imports could race and each see the other's
> `file_priv`.

What is different from other DRM drivers which can use
drm_gem_prime_fd_to_handle() directly?

> > 
> >>   qdev->current_import_file_priv so that qda_gem_prime_import() can
> >>   retrieve it (the .gem_prime_import callback does not receive
> >>   file_priv directly, but the context bank to attach to is per-process).
> >>
> >> qda_gem.c
> >>   qda_gem_free_object() is extended to handle the imported-buffer
> >>   teardown path: unmap the sg_table, detach from the dma_buf, and
> >>   release the dma_buf reference.
> >>   qda_gem_mmap_obj() rejects mmap requests on imported objects, which
> >>   must be mapped through the exporter instead.
> >>
> >> qda_memory_manager.c
> >>   The DSP is given a single base address per buffer, so only buffers
> >>   that are mapped as one contiguous range can be described to it.
> > 
> > Is there no IOMMU in front of the DSP? Can we remap the buffer to a
> > linear are inside the DSP map?
> The DSP firmware's buffer descriptor format carries a single
> {base_address, size} pair per buffer and it does not support
> scatter-gather or multi-entry page tables on its side. This is a
> firmware interface constraint that we cannot change from the kernel. So
> imported buffers must present as one contiguous IOVA range, and
> non-contiguous ones are rejected.

I think the main part of the question ended up being ignored. Can we use
_IOMMU_ in front of the DSP to make buffer scattered through the
multiple pages to look linear? Or maybe I'm misunderstanding what you
wrote. If I have a buffer spanning three non-contiguous pages PA, PB and
PC, can we still use that buffer with the DSP?

> 
> Will add this information in commit message and during the check.>

-- 
With best wishes
Dmitry
