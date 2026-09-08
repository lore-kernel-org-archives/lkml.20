Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA21538D9B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882556; cv=none; b=bA6S/tsfmUBpvnN7coKDocdE7fqA4ACrgWZOf+xpEvaN27gulW1PePTTXZCtOx9T0yWnN8BNVC6VeZdtPS1jwGO/gf4cNQEGJQNobE6JBa2jw3Ffb7bg32LWtaA2c84TA9HqwZoveb5ftDp5WJA0i/+q5rUjDTBhJy176LGUb90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882556; c=relaxed/simple;
	bh=oLRRWVQaJunuo2Pn1JyDUPmY5bk9k09Er8msNBqYKr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glTm1Zhetsap44r9ImkXgHTUpSpdWs5QfygYD3aM1pN2QVZQVuJkZEyuGsazH+7uK0pE6iOgDbV9M1Pe6TdEKH0u8777oWCHZHvs158AEDY1TeNUxuxny1/AZDwoh4oHEBzBPxNz4bfETJo3/p3DVJcUFvXH3o9mhw0ItlZbKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNWX1qtY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czjfzEr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNWX1qtY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czjfzEr+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fe30C3614102
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=; b=MNWX1qtY6ooLU0Kz
	yUoaIGny/nQtxaIuLcdFZcplNomrPDveZVAEa2EoAwYpGegeWrC+UDyX8UyqhGru
	yJqv/wlimM3IdBlFPrqHvGr2Ywd1keoyWgSI/6Rkrq5vGBS6NUeyDJgbx86mGypz
	f/1F2sQjjvwkiA+PnQ1cJZie2vKhTku8Fd0rboSF8i+o/BPSUPkPi2Xys2665QMo
	Vu6/wvWNm9SiYCFZyTTHbjlagH/XQs4Jjit8GnXeXelskYQlDFu6RoUGnAdEIIYs
	5V3Le4DH/mparl9K61MzAuq5SBuH3yqFEgLtWTAPD4Jbb74QJBDgTdFREZYv3JK6
	EKOvng==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujxj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:49:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738627c7908so1009305137.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882549; x=1789487349; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=;
        b=czjfzEr+JRP2VLTw38wnaVZufdK7UNyZjh19NH38iW2u02rd3B0SYnC3StGgs4qyoF
         CYuJQ3TfhpvGYA/ftjdmNAyDLSD8C9Mm9oBx+3vAnsdW3foaPJ+vpIOSnS8hMLkfJXvS
         J9NPhVPAnyDT86xnp2PI0D7P+SknBkk/kChnUUPUkxWojiYUheVt+tKECijjVMncsxdF
         cs8AW++/1cNaf/+wtCt1qE3e91+y92dx6F7gP8kuUQK7ZKyQaD8fvx4bBKBn7VOLi3Gg
         3n2qA2syV3fJnnKWBvytdO1kyMcRMZ1aK2hVgJ2zqbsxCGQRDsAtbtaFpTFOrx2nBrXq
         oeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882549; x=1789487349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=;
        b=PmBHMjz60HUEADmEQz/9mEqVBraHfSX0MCHYgAAdoxwYmJPYwnu/5vj1bVgA/mfJIF
         kipGEdKDAY+OBhBdnsfJKEN9uVQLXdpS4Kyfb0XYJNXhzqpJfWR7f/tGMdiFf9g5UZk4
         db67N5lbU6fpDg84y51bROHrYrlQJCU3dPdatBVFcV0ajmeRhr10eNQnszQP7nSnD0xz
         +t8QtqQUU5AxEQ0MkJUA+XeM6hLSY3v36rQugFE2HcahWwQrI/v9FhXOX/Wk8tYhTPhF
         K45Eo9NF3QZN5/bWLZfEnHCuDSzlBIgXsip+mJVLSn98e+6Dq/zbYb2Wtdvqn9G1NznE
         i2vg==
X-Forwarded-Encrypted: i=1; AKwUvBz1cMOLrzFKvZwKASWbHT4YFqR2PZVEU9P0U7eMVhMtAV2Z1Kfk1zA8YtXBr+2re0D/GXpdRgXdwe6GGxg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmjazRRN4TMj7gvKXyzSC8ZR7ynA6va3dKGyRpV3D7NX49mC7S
	1/6CNNkgsVd/H7JraPADm70ytvGXhU9ER85l/qvE4E2oGFZvD2YDwGHDoXJnKSQ99odpJpkxo4q
	dXLohpARnUAufdAd4pzmEk8qq7vcN7cKFpFgOo6GbEJ1D05WLv9wkDhhy/MfSVlUhhRE=
X-Gm-Gg: AYBFou0fM5mzFQir6rlc76NxTnkXE/fHeBtH3Us93/wQCZ26npEbnNr24xr/FPJo44g
	gkUSlFs2kPcSCbzWoHtAN0/gr1+eZK6CXDjx3u1P0bJwyW40Y8Mm/r8eGk7xv24eJQBdXAAsaEU
	b8ZS26qYDPOWytSIkzvbsYQ3GhMsfNISOCoVzwLincqYRkLipXj/sV88ewLNGUk80lcPy+E8JjB
	uwyio8GQ+O/4ioi9IGvSa9AnqbeEBFVKUw916ztV1fMkjSsQDRWL09pB6yArxy7TAY1iIePBJ5A
	6Nz19n6k+QgoQ4ldqVX6pcKKY13aWrcK4GS32uhj/8z6mlBZhQRnyV5XhGTy4C+QaeF/x8aajLz
	Jzy+YRTWmx7GVEdc8DldbzsKbAOD87bea8016nvbeC32FaEM10YFaUkOXVB0VyLb3eIUE3/GfbZ
	Y4vt/gC7npYe10
X-Received: by 2002:a05:6102:8697:10b0:784:5883:9cc4 with SMTP id ada2fe7eead31-78f75e026b4mr32262137.11.1788882548604;
        Tue, 08 Sep 2026 08:49:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8697:10b0:784:5883:9cc4 with SMTP id ada2fe7eead31-78f75e026b4mr32251137.11.1788882548074;
        Tue, 08 Sep 2026 08:49:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm2648080e87.75.2026.09.08.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:49:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:49:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Message-ID: <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
 <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
 <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
 <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz>
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa02e78 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=hDB9YrpZ_UtSDjAhP4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ataoMAkXQMdB10s2rOWxAJAuC1V8ceAj
X-Proofpoint-ORIG-GUID: ataoMAkXQMdB10s2rOWxAJAuC1V8ceAj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfXx5K/U9Fkhfwl
 Hop7V/lgj/NMTLMHwWsWN48zu09CBua0Li7JUvTk3FZc8OBoAxfMcEtcpF/hVgeMTNs+gaCZUOO
 g3uq7L1mHX6ChblesFx2mDuD7YuO7xk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX742B05r7VBp5
 qymHi4yYcIOxGrscOPBPh57YpaAoMHXiTHAyuXjdcOkUY9HvXPUvcYeqjU4HBIEpJ+0BBguHEmJ
 Tm+nVsRGhKEdr9Wf6Iks5vOcJ5rXUiRk87L7mgPdwWqkQj6Lydqfxx9AQeU32IvwmnvI+SKBKoT
 T/BrA2779JttQNVbGW1P2sWl/Pl2XnXAVYdXoibFMJWMyiZJgqi7gFrms+pz1fhIewkWLNdQv/F
 YmYAC4CD2ptoG12udW/zn0FNDcA7dTValeqj738oS58MTJYDxY3cix10RSYQoFuIKfqPH/P/Z4h
 4MmSWouzj2N/cLeooEufzsZ1E+FxP/xv8asDxU8DguDKe5xJMrB/omJNHqHJuVfVo5TLZTroWhS
 fNI/xhmKHTw8YcnaDPV/tybidYdxVJZzPYV19Miju37sCfdww22qO+ZCGNybleFJrj+OReqxZyD
 PK0vUQz72zfOrQyYCgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080170

On Tue, Sep 08, 2026 at 06:26:22PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 08, 2026 at 11:09:17AM -0400, Connor Abbott wrote:
> > On Tue, Sep 8, 2026 at 10:51 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Sep 8, 2026 at 4:41 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > > > On Thu, Aug 27, 2026 at 9:07 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 27, 2026 at 7:13 PM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > >
> > > > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > > > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > > > > > > zero whenever the GPU is powered up again and the timestamp reported to
> > > > > > > userspace jumps backwards. On an a702 six reads three seconds apart all
> > > > > > > land in the 500..1200 tick range, stepping backwards twice, and on an
> > > > > > > a530 the OpenCL device timer conformance test fails because
> > > > > > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > > > > > >
> > > > > > > Save the counter in the suspend path of the affected generations, while
> > > > > > > the GPU is still powered, and add the accumulated ticks to the value
> > > > > > > reported to userspace.
> > > > > >
> > > > > > This is useless because the entire point of clGetDeviceAndHostTimer()
> > > > > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > > > > returns, and now you've broken that by adding an offset.
> > > > >
> > > > > Just to clarify, the timestamp needs to match what UMD reads directly
> > > > > from hw in various different ways (timestamp queries, shader_clock,
> > > > > etc)..
> > > > >
> > > > > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > > > > would be ok.. but it doesn't look possible.
> > > >
> > > > Yes, a quick check shows that all relevant registers are write-ignore.
> > > >
> > > > > Otherwise I guess we need
> > > > > some scheme where an offset value is stored in memory somewhere, and
> > > > > some coordination with userspace to add the offset in various
> > > > > different paths.  But the kernel shouldn't be adding the offset to
> > > > > what it returns to userspace itself.
> > > >
> > > > Ack, thanks for the explanation. I tried to match what kgsl was doing.
> > > > It reads the GPU timers directly from the GPU, but for the CPU timers it
> > > > reads the value from KGSL driver which accumulates the offset.
> > > >
> > > > If I understand you correctly, we need to export the offset to the
> > > > userspace via some extra page (like vdso) and let Mesa read it. Correct?
> > >
> > > Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
> > > BO we could re-use, so I think we need to create a new global (TTBR1)
> > > "vdso" BO which is read-only to the GPU but otherwise accessible to
> > > IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
> > > (And update msm_mapping test in igt to validate that it is read-only.)
> > >
> > > (I'm not married to the name "vdso" but not creative enough this
> > > morning to think of something better)
> > >
> > > I'm a bit curious if kgsl handles this differently.. maybe there is
> > > something I'm missing.  But somehow timestamps need to agree between
> > > what is read on the GPU and what is read on CPU.
> > >
> > > BR,
> > > -R
> > 
> > I think the kgsl timestamp offset stuff was only added for the new
> > A750+ CX GMU counter which is not read-only. We do need to port that
> > over to drm/msm. If the offset is applied for older GPUs, it's
> > probably another case of kgsl not bothering to keep support for older
> > GPUs in newer branches.
> 
> I've been looking at the kgsl drivers from msm-3.18 / 4.4 as those
> kernels targeted MSM8996/98.

If I understand correctly, for those GPUs glGetInteger64v(GL_TIMESTAMP)
reads the ALWAYSON perf counter through IOCTL_KGSL_PERFCOUNTER_READ. The
perfcounters are all saved on suspend and summed towards the current
value read from HW.

-- 
With best wishes
Dmitry
