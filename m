Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E684FC346
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027445; cv=none; b=U8ek989bgDc/2gZwKzNvsr2/JSJfvvQD9sthCFvUftRmfluiZ2FWlBRGrXhXSQ6Xou1padGOg7l5d66gDKtWNcBujnjmjv9JP+jn28M3+u4PF9fXqgaU1p3ciw3X46CviggIaTkX6lNm271aX/7x+vvyRrjMAJz4ZdngXyFAS+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027445; c=relaxed/simple;
	bh=zJzIDJiXvGtyLLMT1WXA7RveYOh/i+Cip3IQL+SUZdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5U+MbhpTSMBantTrYANZs0hpj28Q85k4lAg0dEaZf7Gam/5snzzT62ZH0p881H/1hzz9R1UlBRVitR90+kZt/OtNuT2m93VxNKe4Y79TvpF6p8dXgH/1jUGLkHtBBZN0V0zEbhfDiRRB8jNjiuJodgQ2oO4JPerK9snNnBBHPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtVG1muk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwjarKNf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtVG1muk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwjarKNf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeGKc3260499
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NukD7rdktvDAyUJwA17oxg3O2ziC3zrwf1rnlZ1rnKk=; b=MtVG1muk6ETHdWS4
	MJHLsWJsd0Ei3rwp8uHJSwwjdReuQPFP/8qP4S2GRCNcuYHEliTEToWh7cnJHCX+
	Ye2ZKCeWduizT+jQqdw6748R2+0XesXztOklNPnizbqHjhrtBnie8NB7YW22BT1d
	29gFTuzN4sRge9I+cjJHkDTTEoIQ4MzH8nITk1kyQZhDR42T8jQQ2BQI0Q5oN7an
	xfTjDulDB66SCqqoGARX1vsynyL0G6FXldWB/lcdQOznQhIojKfRg/alLouimKir
	rBibJx4NPqzuXuEJaLTyr3JoqRq72f/RSuX8RNhBfFoG4Od8N79SpPTULrM1rtFP
	I2rGsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vh75e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:50:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so61900885ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027443; x=1790632243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NukD7rdktvDAyUJwA17oxg3O2ziC3zrwf1rnlZ1rnKk=;
        b=iwjarKNfnbCYGWHPJ+geoiVARbjb4bF5O219li3+RmEgmY3zdGx15EvF7hTJX+vI5G
         LSzGyqxoO4sdnBToQGAdhK/EFqYQgiINDM/qytk08TIO1aPwbmUvW3G3jdkUr5t00TbL
         Qakhk0BmyZASg5z/SQRsX5mOkwSzF7/e3CLJmVZVT/G26h/DQOXT02tm5JmaA9f+dAyD
         XzVpqdLYT4LJnxU4iNBDgMbiDjvlejjjBccjX95skMJwlTNmWmC+INgfkNfOsW81l+yZ
         4itj3CFO1orFSPsMoMjTCA7MJdHmo452dxn7meWhRWwM5TQbloFFY/ASiFjAHMGfmQJL
         pjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027443; x=1790632243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NukD7rdktvDAyUJwA17oxg3O2ziC3zrwf1rnlZ1rnKk=;
        b=xVpffcJSqVlvFKOuH3jCDmwU3npGsTwkN4/RVAy6KgMuR/aA355cIIzRcQZiZPHyFC
         DSQKES/5OVSACcC351qwpVYHYROVziX++WUnpZo4oUvmSW/6xmgiSonLF+lsYXEtzN1v
         tJNfAhfkzN1ARlWwOpBmDFUo2oy6bX4OBXcrfPTkSOS/gzJKITOwQrjNd/ZtIoQn682y
         MrCeOSGQX1yaOyxAWm4NMZ8Eh1K6Vt4rfhsI8fbpwhRKRl4tBqHKnvIVyg9MVJGhci7Y
         PZT/G9ts/Op9lAYwwKgnL3W7/c7XtHpP71qCvgZ/HzLnfpHmnt9km7RXsJhwywSmTyhi
         uw9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcsfugJK3Y0Yhx10DeIrH+20fS3HjyJ/ToH6H65e1ezx0dzaGe0YWTfUgR1NehTBLou3GAVxEKAbCUlNc=@vger.kernel.org
X-Gm-Message-State: AFuF++n9I6FPqwz/cjH/WlBoiDVoYVLuQfbhJMBfgjPMyQMMJ33MNHYu
	oK6li7GLNo4BhotBywiNGjT8oOfySNk8sbwj11ZtY4foxAThxdCjTGdFPQaIBqY2QH6Q13zNj5a
	APYromBU8VCEw0tKV04wHUBklL4G4SUyRTHjkRx5h0dpDjjhu0+gIg91MzpAU1jD+DRo=
X-Gm-Gg: AYBFou0laXSYAeoHJA8boA7QQTR4wsUDPk12aD4po/VkiI22TU+gh+JKMyWBQJjqGD0
	3B8wD3leVAUzkUvrlMCSYFWv/X2Cv8VDNu2A7bDw/89CNirR0F9EGj8LQevL4raNul7TPiDGM8A
	qMOdXPQFtnxEcVLwDFquiYEtxFbcF2LheORa+fgRqDdmj2S6M/SQJWcdCQwORPTSo/AnpEdWovL
	gci6srPHTwVBKG3sedyiPrwifh7C91p8FmB7haBjWk8W46js63eMqew01Y6Gp61Ndhu/J5VSyfv
	KDZLENY73O3eBGCMonN+zklYMknNO3j/GeHlWsDHlv7CQ8t+XT1G266DXrqAckWAlSJ/2MTQ+JF
	9wjwiYVZg+S7NvpJ5qEtX+EfB4/50XIta4vf8mPFV2v753GE=
X-Received: by 2002:a17:902:cec8:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2ddb7959d15mr159878995ad.21.1790027442568;
        Mon, 21 Sep 2026 14:50:42 -0700 (PDT)
X-Received: by 2002:a17:902:cec8:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2ddb7959d15mr159878805ad.21.1790027442090;
        Mon, 21 Sep 2026 14:50:42 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc658esm800393eec.12.2026.09.21.14.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:50:41 -0700 (PDT)
Message-ID: <eab1470e-ca12-4a7c-9a0a-47ac906c527d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:50:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sg?=
 =?UTF-8?Q?vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Selvarasu Ganesan <selvarasu.g@samsung.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "cpgs@samsung.com" <cpgs@samsung.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "thiagu.r@samsung.com" <thiagu.r@samsung.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
 <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914154656.56824fbd.michal.pecio@gmail.com>
 <TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260915100136.38b4c31f.michal.pecio@gmail.com>
 <TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfX53/bZIIk/erZ
 AmcSfLgG1a2u05z7w/cKM5Rm8JvVJxWf7iSivgx3glw3CNWmK6L0zZAeajUTLirwkashVSpgNGy
 MGErBrY1uwWZNdP8IyfZtmLfL1dy0Mg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfX4TmSJ2hPITuA
 5DUH32zhOdY6XWO8vtU0GEFcqmctZwsuBY+fHBRlKEzFMAJj6qrykBHa1GDrrhfAcp1JptAH5MK
 te2HoeoaR1AKmLeUEhRS4jdGQT9+GURMp9308J71XiEGKal/akVMyIrjJzlP/+1FBMxpMZhdaFK
 Y4UV9K2L9wPP8WfjRvYDa6SImWO2DMIJbG3pw2SnBiQNrIMEf2Wc3gOs+1ucS8WZU70L6uR6ZsZ
 6Plx1SDm3XimlB3BTFDWvXBFkN2uecAXYfRvnErcYcio2ZPhH2CAPjch8Hm4fjyZX8knr5Scv5N
 fnyGFEvZrzN1/ew58KSYgBI3EAhgFbUsW2kdmRoHcyefskThTy/RFtcymiHHKavdwgt/c0v0S3Z
 7pT3Vnz3tuoaMa/4iI/Ju/3fJVW09DXBs8mzNfur+FAeWJy5U3wW++1yggRcKLC+BPUo1udORdj
 wsaQNsnQ8/UPMeUzGAQ==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab1a6b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=vZc9wmJckWiLiXQqhvcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4-9Xbd5VJVqHz5NBK45lmBXkXSWD7nah
X-Proofpoint-GUID: 4-9Xbd5VJVqHz5NBK45lmBXkXSWD7nah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210319



On 9/15/2026 1:35 AM, 胡连勤 wrote:
> Hi Michal,
> 
>>> Unfortunately, no. The reproduction rate is very low, and we have
>>> not yet found a stable way to reproduce it — it requires the
>>> device to be in a specific state where the port is disabled after
>>> autosuspend resume, which happens rarely in the field.
>>
>> Why are offloaded devices being suspended at all? Obviously, no
>> "sideband entity" can be using a suspended device, so it seems that:
>>
>> - if the device is unused and meant to be suspended, sideband can be
>>    removed before suspending
>> - if the device becomes suspended while in use, obviously it's a bug
>>
> 
> You raise a valid point. Looking at the code:
> 
> The snd-usb-audio driver sets supports_autosuspend = 1
> (card.c:1347), so the device can autosuspend when no audio stream
> is active.
> 
> During suspend, usb_audio_suspend() calls
> platform_ops->suspend_cb → qc_usb_audio_offload_suspend(),
> which sends a QMI disconnect indication to the ADSP and waits for
> dev->in_use to be cleared.
> 
> However, qc_usb_audio_offload_suspend() does not call
> xhci_sideband_remove_endpoint() or xhci_sideband_unregister().
> The sideband registration stays active during suspend — the
> endpoint pointers to xHCI ring buffers remain in place.
> 

Hi Lianqin,

Sorry for interjecting here, but just wanted to point out the detail that 
when we call qc_usb_audio_offload_suspend() --> 
uaudio_send_disconnect_ind() this will ensure that the audio stream is 
idle/not active.  For example, if there is currently audio playback 
happening, then this will issue a command to the aDSP to stop the audio 
playback and disable the offload stream by issuing 
handle_uaudio_stream_req(req_msg->enable = 0).  This will invoke the 
sideband remove endpoint path.

If the audio stream is already idle, then we shouldn't have an active 
endpoint registered to xhci sideband.


> This is the root design issue: the sideband client assumes the
> xHCI ring buffers remain valid across suspend/resume cycles. But
> on reset-resume, usb_reset_and_verify_device() → hub_port_init()
> → xhci_discover_or_reset_device() frees and reallocates those
> rings, invalidating the sideband's pointers.
> 

Should be only mapped when audio offload is active.  Also, we explicitly 
take a runtime PM reference on enable_audio_stream() using 
snd_usb_autoresume() and remove this reference on disable_audio_stream(), 
so minus a PM suspend transition, we shouldn't see the 
qc_usb_audio_offload_suspend() callback executing when audio playback is 
happening.

Thanks
Wesley Cheng

