Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB44A9D48
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867721; cv=none; b=jFpsms7pFLWyIOQXu4soL9n157Vi7yVGhF9hHfKs/pLF0ajMG/WOvhM9m3ebwRU5rrEpXGDfdgANImV40vtXbL7Of7B1j+pHndYW3TlL2seRmO4rm/5h9EK3i3tFBuJpmbkOAczNLOeUpk4mn/NbKe5s0gORa43h4HYLMgrVm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867721; c=relaxed/simple;
	bh=tSJmeU33PeyLzDvyBHs+j6Z663ewOVU8TXNb4ulkiYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbWqLWYbOuEFBO4LliAJXUZjkb12CGrWuIOKsi8pEvWlDkELx4fWqPP3RJI2EdP90uCxTaeQ8mSaGQ9FB5CPrb6Cm3mEYDhXiTY2Vk2M6YS/EYdWrAqwADDj6dRfzcArFU56de949LuFwSfULMsk1zZDEFT42tX3pWkoNREae+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoqdOlb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjWPNcO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoqdOlb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjWPNcO2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADTlY2005805
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=; b=EoqdOlb9tpch7yFZ
	C54PVTVRxYWr6u7w+vdXvC8ojefp2+j8mJzcDsiC9r6fuMOlxigg+RmplSK61RYG
	odtFe6n2VW3/XYnklcXRORQzI3apZzXTIoJ6/ZFvwzjc+vG0TUQtTg0yPDjabfz2
	MY+hFq2ymJlcg9irGqEGBLVXG5ra9vTpyzWAA8EMUN15bwhaJ3caOrYbYGRRNh6n
	BR1FhxO391BBbu3nwy7mlHRX3rZdPyxiybEWDjbQ17LJh97jx5WG2GrNDPIiLL3M
	t21+U7AhOLPigN2syXVFcNqbv8PcIRtVOor05s5JF5RQBrLxBVQbIrxB3XilZeFZ
	xOuy3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjhsmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:41:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7800607543dso3852161137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867715; x=1789472515; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=;
        b=GjWPNcO2EwP1+m2LLqEFguJuM7pRuUAb6XQXHTFP3TXrt5yxZNL3npHo54JS3rb11Z
         2LtWevfxEgaf5+QjRIIcYGMu76VnKqHeCN6PUdF1l6VN7mZa0DQcnd3Lb48xEeZIxAu7
         IvXaikfdqllxaZQvWy8Uwuu0Bv9Xl46f4+NO5LQjaJlpKUpz3g6OjhSdmuvP7a5VoO9c
         eatJin8rQvT/pOtyj8Pl+YYN26Rlc+tC31zyRT3cMzQ4/GI2U5M+Qw5QX7owxI/KvWG1
         Hz/5pvnbNrtvqtvygHVokOUIyYvBF7ALUUSv4AsQDnje7HSSEukrqvUyvao3MCFcHNxh
         DJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867715; x=1789472515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QV+zIsOLcXKbaqJsaB3LhZDmxFIlCQEKE/EB4eMCTJw=;
        b=MKJt2lq7MoJcHWvIVlhRGD2Ng7IS8vUe9ox47+B3aWTDQchQp6JtT/xBQ0n+44GM2E
         b6OEN5B66Tl5vmvnYNIgVZkLfzk68CmPDVNr6GIJ0OPl0Pjc3LHxWdGFzjghwaOCcvRQ
         eFED3ulpmLNKrANaHmzTkYpO4zBpQNeXMFvCm/Oo7+zusUhR/lYjC6U0yLpoh3MppIX2
         GaOcmyF74o23+18syALKR1r3Aq4FYeQqpR/QRa+h9lbFy4+tub28tyEhJbbShqz72dED
         JNWWIfeqlO9Ta9q9YNmY4PQ0F7Bo2MASXuXOPUzY/hnsO/xE0hx9pjCdBOqc5E2GFnnL
         TqaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJhtH0zxNBBdPVzFS2mofuJWYtujfVAnmr0oKFMyHnsR5Bxj08nNhHI37c2RG3PkMesJeST+poksumIR8=@vger.kernel.org
X-Gm-Message-State: AFuF++lTv8D0aoMlT7qZvGMiWqD4ZzNJ7LIvJ6ofoADpnMWmEr/N6bhO
	WmQ51V0JaxrYVN4YJGwuHDcyV1aad5cfnCPr2gHkh+SdxlT4MSVSzyW5nYYfqaaHUMcHaq5SwJf
	adOXXohHOMDc1iMjP9gD8NQgpiYtV9dDpqGTHwsokcZSKdNGQJV/DY2MVCQyOe1FW30g=
X-Gm-Gg: AYBFou3qQpC/s2/8BmiE1MY6HYSuMUo34RPMSOvoJE9JgV88k5eBtk71Dzr/TCtBrcU
	QvEgfe9eCcCQ28cQ1bXFF/PCG4sAlZE9liXDoQprvTOkSoh7i9WlncKKua0e0h5Ih6jU9CzamUT
	snNOBdw+o3askCEPi7EvaPqReoiuSZaBgjeGFbkxT3mxWIKcufkjq0eFia9kNMBL0UPOyvNfSRc
	EBn4TfAAIhfiAiu2KC+ZWWfHFZFFJuqwDQv3OeuVnui7DBRaAK2g5iOet0Yo9YTXnrqaaFfVBj8
	PttvVKrSPYNCFrT3KP6BH9L+j7xhap374CfCZ5MBP/ulCnVsoEX+LAyTiwJnmy/iKSDGun1ImLc
	9lu7uLJQBg+cY3oxnWcQHoSBKHf6vwbecBrPixTDDxsLXukRwsHKFatcTr8bPar2BMJclDk1mcC
	xBK/LPTltaXq4M
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr11094439137.7.1788867714047;
        Tue, 08 Sep 2026 04:41:54 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr11094401137.7.1788867713514;
        Tue, 08 Sep 2026 04:41:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecfbcsm3048299e87.13.2026.09.08.04.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:41:52 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:41:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
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
Message-ID: <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX8lzO+s2mF02q
 wLiF4RpnL9Wh1ba8/91K5YaK2FvnfZ/ql1H6ObWfWWP26JShZRH+/cxBFT2RLwf+aNw0GsyMUTP
 m8oD+Qq3MN/cd3QdiWu3tlhCc5FuBy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX3US3b8KJ3l/i
 14JpGmoqUEG2wmmnkKJx30YqvqR1zq5ED8qg0fdaaGIs9Sp8x4mdj7uBloj8+kFtvF68TodML4U
 +5qWhqiaakFFcUzDYfMfVdBQiPicHaQTzXO7+Xr4zeavS6aBisbc0zwT0jWdnQL/bmexFhkj9J5
 FVvGnPNoPDH893e1O3bDCs6aCwh/vSiStaHIbiNb15U2Ahv6GUl3+Xe0kMmVbb4xdM0JPxqb4na
 qxG1BUd1uH8evMBip+auokfIhlxPeBN3v4AGIFFuF3PVBv9DipQfVsSWp3TG5oc75wskFkYLt4E
 TrAyQ/Eqmhnd7lckS98hTgwfGs0nlHp7iY+3WoxqdYW4y/8sZG72yQjAT5L6MyumGUQf7HV0gXd
 t4X2iIYoMy4f1wlPbhi5M5fFSPSLAduDWWmE7Ekw++/zx0YzBGa1NQ1WMm8RAx/gQgurlt6QK04
 Ez5GBzryt1jNToTmESw==
X-Proofpoint-ORIG-GUID: kvO4VY7T4dHO7wXFbXtZcYef5fYJzZou
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9ff483 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NK-yGmZRxCvKOhKFziUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: kvO4VY7T4dHO7wXFbXtZcYef5fYJzZou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080125

On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> On Thu, Aug 27, 2026 at 9:07 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 7:13 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > > zero whenever the GPU is powered up again and the timestamp reported to
> > > userspace jumps backwards. On an a702 six reads three seconds apart all
> > > land in the 500..1200 tick range, stepping backwards twice, and on an
> > > a530 the OpenCL device timer conformance test fails because
> > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > >
> > > Save the counter in the suspend path of the affected generations, while
> > > the GPU is still powered, and add the accumulated ticks to the value
> > > reported to userspace.
> >
> > This is useless because the entire point of clGetDeviceAndHostTimer()
> > (and the similar thing in Vulkan) is to match what the GPU itself
> > returns, and now you've broken that by adding an offset.
> 
> Just to clarify, the timestamp needs to match what UMD reads directly
> from hw in various different ways (timestamp queries, shader_clock,
> etc)..
> 
> If we can _restore_ the value (ie. write the hw reg) on resume, that
> would be ok.. but it doesn't look possible.

Yes, a quick check shows that all relevant registers are write-ignore.

> Otherwise I guess we need
> some scheme where an offset value is stored in memory somewhere, and
> some coordination with userspace to add the offset in various
> different paths.  But the kernel shouldn't be adding the offset to
> what it returns to userspace itself.

Ack, thanks for the explanation. I tried to match what kgsl was doing.
It reads the GPU timers directly from the GPU, but for the CPU timers it
reads the value from KGSL driver which accumulates the offset.

If I understand you correctly, we need to export the offset to the
userspace via some extra page (like vdso) and let Mesa read it. Correct?

-- 
With best wishes
Dmitry
