Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866B38333A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851047; cv=none; b=kUCQT4Sj+yQCs4VtuSiGJkJX1hopGOX8Ef5sd1HjTQ2sH53Xt8AZm+4HTsquH9S9PnlEJlaR5mpQqVvhKi0phR12LtW1QKdWIr2uyuizZiSbg8PaKTK+QABfSZ2uvhpCrooTrlPV61+fbabnE0SbYq4dHzC4/XVoxfxtlSOm+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851047; c=relaxed/simple;
	bh=GtHEnZk9MyBdKv7ubuUHgxN1koWc+wxdG4Xd9W9NvNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HM+IKkbX9NxONNYui6gGFHtNWL1g6Du3lCQqDXlUPxSsEf8sWOIXdOSkFoWhVQ4T7rJiXF2CRVr43PpLGSAFGa17SNiDPq5KvkYTtrmOTqen8r0VJLtBKQBkSIB/yH9/FxOael6MyctyfF5/OS8pb4aws/Kdh6ogaDtNXoqXDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlzeTykR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U09ZI6D4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlzeTykR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U09ZI6D4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M0RK2979087
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=; b=mlzeTykRkXaD+r/e
	qHrt6wRxHQgbe8cKzUm6jbUJKOKQowVaNY/rFVyO4EanxNfPn89LV+es3Txi7ePw
	XKI5EGhjsigTTh2QdUs66wrQjpoJEawOtPYWfB1EyW+ND2tUc97tuQCaqt2bSkqI
	7m0PQYt5aAwusVD9PK2kOAdbkf2dY66qEi/Ohdya4K9qBkyhQfLGC2BwSsdUBFPr
	UQCoBg/54M/JjcfHw9ngzrd0h5zCXmDeAoN02vAEI7mpg8g6FMRpum3yFZQl/gEs
	3ByD0RnGyZ4uYlEltGlPxoxudohx2XV0dxu58WvPFs5HaCWqFNa63r8VSLjTIgNL
	U68zzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbjbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:04:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a28482e4so35676785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851039; x=1789455839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=;
        b=U09ZI6D4peYFqu3z4sbrfBuZOKxIQc5J7JGIwOnNACd5WGvzGI8fIA7IrFG4AGx4ZX
         K1mXS+FcYv2epq6J5OaseKpiMyKLR/RCP8U76iORMYUTThm3U4egzPECZiKshhLH2x+K
         LGjwPMJldIp4X7RIQL9Ew14ujKWZc5+mqa+cqaNGNYIvSpVccB4fGFuexb9JWhLQsnDE
         f4XaE33oCeSoJsRUygExG4mpP2DmIkrQhZYpH+ZDtSlVDNMlb7p+FrU/s+QzJtRiPuPQ
         2gO3rBH4FY9Y9lIRH/jhSV/0LrQ1yUcfxnDFC31LyYjk/XlQw+2k2q+vx3pNftcwYFDu
         hDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851039; x=1789455839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=;
        b=Ei2OXNxa+6vIDBgjUDsKz3jg6gB7GCwLTpuTzOWVpmrN9GvGEbIBVYGzO42qZCoUGA
         F/98coRu6EsQ65oOCQexHYc4/GRSbkUC7tf9W8EXXspOMjN69AKLQUAJVSN+Mwy+olLq
         Yh85taKOn/FvKHxY8n9SbgFBgRIs4dt2V5tSFOw0jIML14elrbkcJQBxJurkcVrcreHd
         I+ZcThz4IZ52m5AZVYP8+ni0e9VGLEYOaIhg7fBYhOs5NHQDrCbzM46mZ2MB8TzP63RB
         HIxik/JrlfDbECfabvY1BHMP0RzfPTJEje2DN7jFVzfX4FQispjG8J3QGWPIvHmJvmhn
         vpTQ==
X-Forwarded-Encrypted: i=1; AKwUvByZsQTVbs0E4T+lUdGIpIf0DuywOMYOZ/xDGVrGDci4kULkNHyfSVc8AyHCbEcDBh6AJr2zJTAgM39ogeM=@vger.kernel.org
X-Gm-Message-State: AFuF++kuJ7ezu9Yyaw6pwxIomxfVMvMMFNMXVzZ1vyLrvZkSEvPfMc7j
	2lUn6IuDD8ZXtJcriEWU5gCd2bTtWleI994zDybkKtYVpeF2s+yTWfGH0oSXqd41kEPWM/a+jZE
	UF+gCf7D9OT09Fsnl+LbJK3tITsvF/s5yeA6wiSMPJMVxl8lt6DS0khOGQJWC0mmMCnU=
X-Gm-Gg: AYBFou2ywaIqQfARZoS3ZkV8y5zzFJH+o4sd1YgYEC8R6z2I9XJ9mOipw94GAqEGgax
	R6zqfVe5i7iyNzIxklMAqteHl9xA66kn3bpArjaGZXAfwkEMmV9TpjSrgc0NzeMWszNI62sHp4o
	TBKsUY4vjD9dVa1yJI1qSGHUxQW/wgIiRjcWIUQ5Yd0BO6sGHpX5bUuka2bOTcFyKb1QyZ2D4Tn
	78mKYi+a18N9dIzWR4omtYTVPwa0ai0qJKz6FuSCIWou4tTqxrzJ7O6PCjvnnow1Um9oUy+CnOU
	5/3Gx4uP5x9svwiExSQUw+s2AXTmjn8hRArq/4MlrIExJmoxyX/eKlUmR/4DhXAsJYBWp2k0hh9
	s0pC4RG+U2iyHHBJKQBbHnw==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr2342013285a.4.1788851039594;
        Tue, 08 Sep 2026 00:03:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr2342006485a.4.1788851038866;
        Tue, 08 Sep 2026 00:03:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm564096566b.34.2026.09.08.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:03:58 -0700 (PDT)
Message-ID: <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:03:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX/zDXoAKnZIwR
 nIbfq38N00E0R7nDN8+xgJRProuZcBi1FAmlPHzVWI5Q+5UULUNLoTRHl9l/rQD+aloc4j0leC1
 cRPSec9XYReok2ylhLLU1Rgz9Wmobdo=
X-Proofpoint-GUID: 2gQQh6NVAZzyWQjE6bskjugFBJXS8hn3
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fb365 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xJso4tAO6kuAywU0jPoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2gQQh6NVAZzyWQjE6bskjugFBJXS8hn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX/oQzOq+C5G/2
 xNBs8r9GWJrOkUAzGTgu4Zl2qkhCbMVQzu3HYzGNV087H7xpyGZI+xpkIr/j0WQRlWAzQDTVylM
 IEoTKK7rVmInp55MUaT56XfJTnSobwtRYDA19SVovOMyWiFfyd8hIJfRReaKCcIeLcw2Gbh6HTG
 GIlkHhvhcrGKzUcLXm/pcr1E2r5DTa+mOJ7klp0H49Il6p4obVJEmrH2SQttjWcSCY/2QnpeFaH
 IZN/1qQh6/JUjExdLVLwj9ucbxTcYql7QtuCMQu7EFNph5/4Z0loMVj9ZUeS3AgIw6Y+s3Kkz1S
 Nv7G2RUbpYYmgRIxxA7ZKA/12pVyqdcadm435tVa+N49GtNvj+Qam9kRi06E4h6m3eQsVVw0/BL
 lzkmgjjMS3gk77RrZ0166t3qV4uie4g+z6CnuDOrAwmfby9yr46U+4DJU2wh9y9VjZcCYmCxde+
 y5pbCATDAawe9rlFQtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080071

On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> zero whenever the GPU is powered up again and the timestamp reported to
> userspace jumps backwards. On an a702 six reads three seconds apart all
> land in the 500..1200 tick range, stepping backwards twice, and on an
> a530 the OpenCL device timer conformance test fails because
> clGetDeviceAndHostTimer() returns an end time below the start time.
> 
> Save the counter in the suspend path of the affected generations, while
> the GPU is still powered, and add the accumulated ticks to the value
> reported to userspace.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
> whenever the GPU is powered up again and the timestamp userspace reads
> jumps backwards.  Accumulate what the counter reached before each suspend
> and add it to what is reported afterwards.

Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..

Konrad
