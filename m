Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98073932C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540655; cv=none; b=XKkE+9Q+rQi1nIxUTVE95ODqzt2OeDIH9Qk09vfnqJ5retPqCqrsk/gl9fBXSz3RePY+uvmLEPHLTAUq8UNcLUzM1dp6XkSWtU9Y+bPYRX7YXU7/vldovfFUSakv0B2B4w1D6bCE1fEzabRG4oSnInUpTZKsr0Vw13YSu8RFs8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540655; c=relaxed/simple;
	bh=Oza3YAP+5sFyhfrMYS12tMSr/hDhO4p8cOfFjjZ0lf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uotVQJex9zOXzieZHhjs9HuzJo+TWLVdDz1rjjyBaLKldAY7a/DhA/YSB8MpXxaXx8kKqD/M1psp/RgwHVkQzeBpsykqeWMHs5k0i53dkXAw1xAlNd2sIucNhgdS2UDMPUJtdZ+xshk3Q/f0K5uosZAHamU17nPxckIDy6er3ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILKqrp7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3ju3QPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILKqrp7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3ju3QPh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68v2V589892
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=; b=ILKqrp7+N1wCkRrs
	nLsngSEOjVJ4Se7FEQ1iUV1nCgLA7yCzm8iUPx6tsQrlSE+mvCg3a9WPt1Bxn7zL
	KeUXGlzm+v1Ss8EMBjk4K7w9GhzYGcP9meburL+vh5BJGcXaoDUQV7CYJt5zuQT0
	MyMVDiXjbqHsQRwTZSdoyS2O6wAnUpiUO1TnyOwQh/nmZZmJndPMDKuPbQmF6oBe
	QZr0PEnlP2PINYvG4aYJqXvjBNpXITeXRfBlZPFr71GfC+Emzi1mKlMO1MkwSRkU
	ZRxCADeLpv5CmwgeXaTX/iXVZ1mnewDdb52wg2TLcpWo9BPFJivl4tcQnpbuyANG
	pkhS0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9skw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:37:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9102f07f2fdso35838556d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789540652; x=1790145452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=I3ju3QPhIk0kgqwyHhxhC7Rtlg3imbbs/PVW6ID1XiU2BLIdWsit4Vh4r09Hda+FRm
         ggRuNs6D4LQRS1M1ZApnqzR9p+PqFdwBXG7yFntBr7zCtX7+8rFxeSL+chKKOQLLPV7n
         /QTWhJQUcYcgAvcugUadc52PfHd1rroq3NQRnVeSnzO3ozjip66WruERJTf/8jdQrAWD
         81O71iZvkefU3d7FqHUvL4IRG/aXdd+F388RnEc0a4M104dARiG47nIvPjBIl5IiO4OE
         WDQz/k/v9+Nx379sSEyz9/jImMd0/Tv9p9uPhNQGMNAqIeXM0PJRgUtaELIP0uyHHmfb
         /V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540652; x=1790145452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=djtXdjDuObObv7XK7w59Ln/gFHZnACUsVKu3WHrnK+wQJyjhPVY3bx+Su/oCqEiP4h
         EKdjT2AnMRNrl1HnTTt1Lu7TUDX+NgFwn4fsPP6SuMtNFmwY1hLV4qHpr1tr2rsDmTPE
         U2+t43THtMBWZypsyUYc+rUxLhRPmYgomKhIObKdhIn+Z9XhF8Kr3QVXhJmfZIfYPRsd
         X7wWYpM8JshwXPUnibJ6IS2wN8wyVGXtMQlN7LSQoDUIq29EdyExIxAd8+L1cik2MRBC
         QG7aX/zqWSud4G2E6mRWpizBRTAmOdb8FXWRjn2OSoOSyH3RWpBVBEpSgZk4mrNE5kCl
         cioA==
X-Forwarded-Encrypted: i=1; AKwUvBwmiAOne6VZS5vhR3gVvqKPurIXNi3CLGNbmbC9aT862JbE5Qd0hqQyw9UGrNv38WlZwYBLngcozz43CX8=@vger.kernel.org
X-Gm-Message-State: AFuF++n+hjsd2uuMiGsM0sMRmUGd9JADeOPvGfPkIxf4sJu33zM9nWO7
	ogmfNHGItoe2l9UutpXZZaOSyjoC6q13kpxjpEdWSmhvNEPeY1SyW0tthSahPgAWZhZaiuzpr6h
	ugydmx1Z7NXH9sPu47m1Bwd36qS3DbhwpwkS4N5ppNN3dYc+kYHTM9h+DIkoscPRxASE=
X-Gm-Gg: AYBFou06iRGUQQqty44zffF1O+/afOYO3/LHmS7vmNxpdf+wNNMbJWsk1D6dHGNHur4
	r1AhrHpawkPy7Z8C/5vMumVnYVWSK9v9l1b+L/C4n2gRwwBSWOHHf2CXzpt/X7r9nD2loQeAhcv
	akNGh6DYjhgFoiJ7NtmFOAZ8IzmXhA1evuIXTIqlkX1fs+5kk6yIUnTG/BnF0wRSpWclpswuSb8
	iEeU8kLUEgI6KXyjcJObI+ZcuLdnoR915Xkq1A5zRAKnOdUWSOFXKj507rk/00QX+mkm4FnBLX8
	4yzNgLVd6xeDVdWOT62ntJgIpZybuNwyauXN5gxdWG8f2FvWenji7XF1BqoxCi4Lp8ySnmrhzOO
	gUmYd4QsMNbGKSk7vi4edBShufo4e1zgLrcfwe2ZnxznsLJGsAJSz9bRPKMdcU1GI
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063516d6.31.1789540651506;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063206d6.31.1789540651009;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
Received: from [10.38.246.144] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bddcf56sm18155886d6.2.2026.09.15.23.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:37:30 -0700 (PDT)
Message-ID: <ec70fa7f-4e02-484a-b7f7-ced7b81d3e44@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:37:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
 <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX5wVlrsvw/7Oc
 DmqrDuCZRBkkRpYhRINizy0yJJp4KwtKB7k/4Ex3Otlyr30kBhgYyD+cTqlvNwj5q8/BbWKFRqc
 TG7ol5/kPGE0IRP7tK1CrB1TxwTLNuk=
X-Proofpoint-GUID: rFn73cZIuZnIIvrvD-D-7P0PbGk7Rm8d
X-Proofpoint-ORIG-GUID: rFn73cZIuZnIIvrvD-D-7P0PbGk7Rm8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX78WDWsSjXQnh
 lmJ2tlH18g9add60hQTU1Ezr4hEJSvgZbvVIp4GmM0pVUA2VWXXbc0DgGPa31e0k+WW3LCdBMys
 Au9ibKC0F7O2t0byIMORYHedlXpizWUgvN0sBO7Ff4bif1i74WNK96NSwXMuaJ60RiRtkSMR02x
 kKajmxv+TDBii8ZScVkfPwlUfl9Rma09G//OMNeiEuweHqlZATNInRDcK3FwFzAGJGlhAn3dqEu
 Wtt4ATIruy44Xdk0ltIhfoE3znti9d7YOG8ZzGOypaF2OEKpIz9OKGIxslePjBpdlvJK+/XE9gn
 xKTmYdv8Dru/AjxFWCLr+fN4o+chzLqbNVhOQR3ZkgdiQ3t5pPpKeOBFuj2Sii5JvE4OIeTWAOj
 h5oCLeD55hHrW3JfFTNU6Lgkr7y4FjHUV2XFOVqnh8SWh/V4Tfkgym/5VR8vbxQ/rUqPyph8YEE
 T1dMM3+L29A+MX+9QeQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa392c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NHX6yGbTSU1aQjhbUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160083



On 9/8/2026 9:10 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
>>>
>>>
>>> On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>>>>
>>>>>
>>>>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>>>>> The bridge connector framework currently invokes all bridge
>>>>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>>>>> event afterwards.
>>>>>>>
>>>>>>> However, not every HPD notification requires a userspace
>>>>>>> hotplug event.
>>>>>>>
>>>>>>> In particular, DP MST bridges may use hpd_notify() to
>>>>>>> propagate HPD and
>>>>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>>>>> removal and userspace hotplug events are already managed by the MST
>>>>>>> topology framework.
>>>>>>>
>>>>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>>>>> can clear this flag when HPD processing should not result in a
>>>>>>> connector hotplug notification.
>>>>>>
>>>>>> Why? Worst case the kernel receives another hotplug notification which
>>>>>> gets ignored by the driver.
>>>>>>
>>>>> Hi, thanks for reviwing those patches.
>>>>> Let me try to explain the motivation.
>>>>>
>>>>> Semantically, IRQ_HPD is just an IRQ notification, not a
>>>>> connection state
>>>>> transition, and shouldn't be turned into a userspace hotplug in
>>>>> the first
>>>>> place. However, drm_bridge_connector_handle_hpd() currently calls
>>>>> drm_kms_helper_connector_hotplug_event() unconditionally after
>>>>> processing
>>>>> the event, so every IRQ_HPD ends up reported as a hotplug.
>>>>
>>>> What if the IRQ_HPD is delivered together with the first HPD event (for
>>>> example because of the TCPM processing those events)? See the mechanism
>>>> in the displayport.c AltMode driver.
>>>>
>>> The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
>>> the driver as they are, and let the driver decide how to handle them.
>>> Based on my review of the implementations from all three vendors, when
>>> long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
>>> handled first, followed by the short HPD IRQ.
>>>
>>> I have another thought regarding the current DRM API. Could we have the
>>> DRM layer pass only the HPD event information (long IRQ and/or short
>>> IRQ) instead of connector status, and leave all handling decisions to
>>> the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
>>> each driver could decide how to process the event. This seems like a
>>> pattern that could be shared across different drivers.
>>>
>>> This is just my current understanding. Please let me know if I've missed
>>> anything or got something wrong. Thanks.
>> Sorry, after thinking about it again, this idea is not fundamentally
>> different from your current approach. In the end, we still need to handle
>> HPD state transitions in the driver. It seems my previous suggestion does
>> not really simplify the problem, so I apologize if it has caused any
>> confusion or misled the discussion.
> 
> No worries.
> 
> I'm currently stuck between two ideas: continue pursuing the current
> "single API for both events" or implement new "two API for two events".
> I think that the second might sound more plausible, but in the end it
> would complicate drivers much more, because now they'd need to handle
> synchronisation issues on their own.
> 
> If we start from the DP AltMode, we have a single state word which
> specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
> DP controller also has about the same status word: the connected status
> and the IRQ_HPD pulse. Which (for me) points out that the single API is
> a correct way to handle the HPD/IRQ_HPD.
> 
I’m not objecting to the single-API approach. I’m just not completely 
sure yet how it simplifies the driver-side handling, since the driver 
may still need to deal with HPD and IRQ_HPD arriving at around the same 
time, or IRQ_HPD arriving when the link is no longer present.

For reference, Intel, AMD, and Nouveau appear to process HPD state 
changes and IRQ_HPD handling in separate workers. I’m not sure whether 
that is relevant here, but I thought it might be useful information.
> Now, coming to the drivers/userspace side. Let's leave the MST story
> aside for a moment. For the DP branch devices connected to the USB-C the
> AltMode will always report 'connected', but the DP's detect callback
> would rightfully report 'disconnected' if there is no actual monitor.
> The kernel should do it's best in this case and report that the
> connector is disconnected without any interim states. I think we do it
> already. The compositor should do it's job and skip full scene
> evaluation of the disconnected connector gets disconnected again.
> 
Agree.
> Event filtering. Historically, drm_bridge_connector was trying to filter
> HPD event. We had to remove it because for the DP prefiltering doesn't
> work. This might have left the gap, which now needs to be filled. The
> bridge_connector uses drm_kms_helper_connector_hotplug_event() which
> just reports the even to the userspace. Consider reworking
> drm_bridge_connector_handle_hpd() to behave more like
> drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
> mutex lock, capture if the status has actually changed afterwards and
> report it to userspace only if there was a change.
> 
Yes, i want to update a new verison to do this and update the 'HPD come 
with irq' case. One question, do you have any rough timeline in mind for 
the next revision of the IRQ series?
>>>>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>>>>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
>>>>> training
>>>>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>>>>> not about "one extra hotplug", but about a burst of them within a short
>>>>> window.
>>>>
>>>> Ok, if it is level-sticky, it should be handled as such.
>>>>
>>>>>
>>>>> Every one of those hotplugs is delivered to userspace via udev and
>>>>> prompts the compositor to re-probe the connector. In the window before
>>>>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>>>>> and performs aux/DPCD accesses, racing with the MST enable flow.
>>>>
>>>> If there is a race, the path needs to have a lock, preventing concurrent
>>>> access. Otherwise, you are just shortening the window instead of solving
>>>> the problem.
>>>>
>>>>>
>>>>> The amplification also isn't limited to a single connector: on Hamoa
>>>>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>>>>> any one connector causes the compositor to re-query all 4. So this burst
>>>>
>>>> Please fix the compositor, it should not need to query all 4 connectors
>>>> if the HPD event came from the single one.
>>>>
>>>>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>>>>> whole card.
>>>>
>>>> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
>>>> the HPD event to the userspace?
>>>>
>>> The driver revalidates the actual connector state, and a hotplug event
>>> is triggered only when an actual connector state change or a link status
>>> change is detected.
>>>>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>>>>> the caller, such as the connector detect polling path.
>>>>>>
>>>>>> And nothing in this patch makes any use of it. I'd say, it's
>>>>>> questionable addition. Let me check other patches...
>>>>>>
>>>>> You are right, I will reorganize the patches in next patchset.
>>>>>>>
>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>>>>     drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>>>>     drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>>>>     drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>>>>     drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>>>>     include/drm/drm_bridge.h                       |  3 ++-
>>>>>>>     7 files changed, 21 insertions(+), 12 deletions(-)
>>>>>>
>>>>>
>>>>
>>>
>>
> 

