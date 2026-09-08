Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED9549364
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881194; cv=none; b=aK8HdIihNSw7Z4d5PfeLlfLazeSGeeI44XxykeRY93T7E7LQOded59Na3Wa5keAhD/N1lsvrV6hDfyG/AvZd5jrIfOscVyt2eXegWoMxQ71zsyPa2MMcfuF4voxcydyPraMhtjFFpVbIFMYLdlfWHr8L0o6gr0nZ/15Rsyv5NMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881194; c=relaxed/simple;
	bh=Gcw+0Dax0TmNRVBGfPPNzmLlUj5k84LOZKb7biIrQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnrUO/tHJihJp+IZvh15ro5Ks9OiLlW5sA3kRoiSvwXMezqvN5MsnAX19Y0bYS4f1o26hXovtI/6mW498qEKlHSG9V+XPigNvHGkWW4wnPEDgtkwWpgqSO+rVHDYBv/ZEcXi8k1w6BHbMu2FdJVg4wA0J+v+qKEq3BzGD0hUoSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgpGuMTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEJog3Nl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgpGuMTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEJog3Nl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FOqbi3290001
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1k3p4OIFm+h9nzyCxBdy+R7myG1VF21hu//4us9owU=; b=XgpGuMTX/3XUUqln
	BUJSH69miBAkjwPYpjg4EH/4H0o5zdOYwgXBmzf4rIo89zE2dHRziqzqHu2bwgfM
	tJrk3mJgKF5OpjDAFu3wnklpB91zlVE02Ijs+VfEvGurk67Bg1WNgxsGPxtYiH/e
	qxKdEHThOhz9uYWKpjqiqOJUjn3VZMrVtSjufQsiSHegx6jMczakq14pNUXOAh13
	47ccPLRLhGZeLX4DRyc/9+Y0EXgU30LDezjNTZHty/Esheh+qUMUF2FP60vvOn3g
	QxCT8qwHakXhNX3O7KskPSvUAE4rIa0jZ+KVLRW9GUVKZPTFcDgqlbmYk/t2kP+o
	E8kl9Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chqm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:26:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so3476726241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881187; x=1789485987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1k3p4OIFm+h9nzyCxBdy+R7myG1VF21hu//4us9owU=;
        b=ZEJog3Nlc/cYWapLhsXo0/y0lvndDgIJ3pSx9jSQCto172Aj8oEjN/6mBanGYFSwdv
         S17tA739eeinI+nUTnFntFyIa8U2uh7b6XHlWhhAFqOVWEMGBb2g+J6ZkWrCNy5FND0Y
         8H37MULTqA4w85eC3TR6CAhYiwk8VJdSC8nwzFZl12AB+WpUnAg2j0I2PVq+4IzhEMmC
         ldqSdBmM+R/uc6HDGP3gL276wz9Qn16ZdRh6lyGNfSNPUI533jU+NN4nmXzXay7Gnuh2
         xtU7NGZ+2bxr0bJMRVSVDhm0awm1Ya3Vdxxo/7AC36wryzj874gXGn6m1/sPWS5yMasP
         xD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881187; x=1789485987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z1k3p4OIFm+h9nzyCxBdy+R7myG1VF21hu//4us9owU=;
        b=cpVss5+9GXEektOhb0DTf+B0CVDxuirisJe6E6dq5FFBQyz7JIaNZ9/ypwBNepVrvY
         5hPdsxE2KwwSpRSONQzSyOXo9fa3gk4heDuZn0+NKJ5haol6Wris6TdrYpIFD3qIsU1e
         AisuPH+RlvD8GPty9u8/GjgqWQDrBmz2sRtEPM6KYvBPLI53rJ9uyPFjRqOqaL2bCVDE
         5Iwt7DWyOqO6FCA+/pqTn9laqMp8zeyFfSGAgNnZLlzCVfyhGURICMFA3lOXADQwg2eY
         cYDwY+I6RUJ3LeSp1cm90b4ZDxJ1Nj8tzjFu0kWgnZ10PHKkvi3gndU83MCdCDCeQnFt
         oufA==
X-Forwarded-Encrypted: i=1; AKwUvBwMa9LLdoz31EmIZKxvE23iJGSUVg0CVKmPbFDv4gxbBvv5P6rhvCyMU2sBs3E8FBtendoOVsmaRjxFMOk=@vger.kernel.org
X-Gm-Message-State: AFuF++lH+2tVj89LYMPsUkcjDnwoHFmgVTQ0drHwaQsRN+UPQIMcsIgu
	f7UI6pOTDL/5A0xsN7cm22YUpSiA0I8joGwqooSFSIrzdDyzn4N1TLPDXzHTblo1ejiPJT57cw/
	wN7gE8NRQ6DPU2Ze6S054Bb9nuDb3XZ856GFfPlfmJS4jfNcuNqUwkk9/cyy8lZzfi50=
X-Gm-Gg: AYBFou1E34YbsQgGfwPYEQ+pNhUO7TKAo2u+zrX1s3BtNVGN7F61mnHXccDyFZB9Pfz
	s2+3ui+5DMEJYcMsDjzjFC5cE3xntf/Y5h3xLHYJoWxWOIuetOiY87tHfp5vQEnyY5BpX6yp4MG
	grc499SNOJ/X6IOdndGI/d0mF8qGtgTw0AQWwjYZsmWuyMUdyaNgBQF8gcX/zfWVxQisRoLPibj
	tWGxtJn54bbhJ0jZ9ueRCIMj1sar+RMiePy4Lxx5d1hN/aswAdow2tvgf1+dq28JY0ONjFd2aNY
	d1HmoUv0setBzUV7o0Dhv11uqxpsrsYMXViIAutTtXMCcn37ek76TNW8iNlzGQraVGbSOjvHPIE
	M0MGF4mXZNsS++iJ1bPVnU+SapFF3WtTC9byid/BKgL90IPg5Zhy7Q1ioSu4hgzoehQ24jhFnut
	wzcNUFn2cZNoOb
X-Received: by 2002:a05:6102:5e87:b0:77f:7df:ddd2 with SMTP id ada2fe7eead31-78a4a823596mr14049015137.1.1788881186719;
        Tue, 08 Sep 2026 08:26:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5e87:b0:77f:7df:ddd2 with SMTP id ada2fe7eead31-78a4a823596mr14048884137.1.1788881185420;
        Tue, 08 Sep 2026 08:26:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616705bedsm3124430e87.67.2026.09.08.08.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:26:24 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:26:22 +0300
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
Message-ID: <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
 <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
 <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa02923 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=oaW757hXQP8N7nSf2eoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 9giKRMLV9mXTMOLwoYEaovuEx6NXLwQM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX58nZCrO9nInA
 HasAGkANPJudxFxg4WvVSqtwh67N5BV9OZX3wFscVwm5AVQ/l+OwVEaHKQlfd5BcWlhNRUNvMLr
 PYIhuAVpn7KsaWIY8OvmyzyYCzdvtSA=
X-Proofpoint-GUID: 9giKRMLV9mXTMOLwoYEaovuEx6NXLwQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX55/4BXZNYxWL
 iMfunpf319ctwbQM0vgxt08BuxAG+xrnxkl5R9jR7r/t8b0LY/N+ci5wgL5+sgFY7KfsWdZw6UD
 YOFV7M1Ovjb1US4OyCNS/TLII73QlEZI/4t42tckrqgt9XLpEdlNkqiPNMALAq5x0UUA0kxp296
 i6vJBSx178XLk+zWXEPc9NNnoBVGcemotmLHrVwmWPU48JuQs1gbq9lnaMYibpu9s87gaCbTQQu
 x/3aba0L+lXKYOJQmLvKH3iY92f0+4cin/oVhlrYsK78c1z/upfLua4x2aiDV6IdKx+5eR1zeEO
 OP9wAIDFyxL+dHhK7G7R95ux9xMoTFY4L0taS+o3KCGdPQ63Gh8LU+tE8v+zVKAYrH6kbhIlvWn
 ElpI/EybqDitZkpVIjjol7nnz9bc3eo1qir3RhqxDWG6owWP5UhLjmZaIhr1Sr2GhBTypz3UBib
 gyYuVZBcM3mWjR02KXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

On Tue, Sep 08, 2026 at 11:09:17AM -0400, Connor Abbott wrote:
> On Tue, Sep 8, 2026 at 10:51 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 8, 2026 at 4:41 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > > On Thu, Aug 27, 2026 at 9:07 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> > > > >
> > > > > On Thu, Aug 27, 2026 at 7:13 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > >
> > > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > > > > > zero whenever the GPU is powered up again and the timestamp reported to
> > > > > > userspace jumps backwards. On an a702 six reads three seconds apart all
> > > > > > land in the 500..1200 tick range, stepping backwards twice, and on an
> > > > > > a530 the OpenCL device timer conformance test fails because
> > > > > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > > > > >
> > > > > > Save the counter in the suspend path of the affected generations, while
> > > > > > the GPU is still powered, and add the accumulated ticks to the value
> > > > > > reported to userspace.
> > > > >
> > > > > This is useless because the entire point of clGetDeviceAndHostTimer()
> > > > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > > > returns, and now you've broken that by adding an offset.
> > > >
> > > > Just to clarify, the timestamp needs to match what UMD reads directly
> > > > from hw in various different ways (timestamp queries, shader_clock,
> > > > etc)..
> > > >
> > > > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > > > would be ok.. but it doesn't look possible.
> > >
> > > Yes, a quick check shows that all relevant registers are write-ignore.
> > >
> > > > Otherwise I guess we need
> > > > some scheme where an offset value is stored in memory somewhere, and
> > > > some coordination with userspace to add the offset in various
> > > > different paths.  But the kernel shouldn't be adding the offset to
> > > > what it returns to userspace itself.
> > >
> > > Ack, thanks for the explanation. I tried to match what kgsl was doing.
> > > It reads the GPU timers directly from the GPU, but for the CPU timers it
> > > reads the value from KGSL driver which accumulates the offset.
> > >
> > > If I understand you correctly, we need to export the offset to the
> > > userspace via some extra page (like vdso) and let Mesa read it. Correct?
> >
> > Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
> > BO we could re-use, so I think we need to create a new global (TTBR1)
> > "vdso" BO which is read-only to the GPU but otherwise accessible to
> > IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
> > (And update msm_mapping test in igt to validate that it is read-only.)
> >
> > (I'm not married to the name "vdso" but not creative enough this
> > morning to think of something better)
> >
> > I'm a bit curious if kgsl handles this differently.. maybe there is
> > something I'm missing.  But somehow timestamps need to agree between
> > what is read on the GPU and what is read on CPU.
> >
> > BR,
> > -R
> 
> I think the kgsl timestamp offset stuff was only added for the new
> A750+ CX GMU counter which is not read-only. We do need to port that
> over to drm/msm. If the offset is applied for older GPUs, it's
> probably another case of kgsl not bothering to keep support for older
> GPUs in newer branches.

I've been looking at the kgsl drivers from msm-3.18 / 4.4 as those
kernels targeted MSM8996/98.

-- 
With best wishes
Dmitry
