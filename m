Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280506;
	b=VbR3JMvYX8E7CXaz3T7AajKDmZkM9X25N5oIawCgpiWavYciTsimAyLpLUqpsRDlyRjm
	 iTaolOTB5tZ99lxZ2S0ebIEEohFkBPjj1UHDMfCgdBcn3BIstZHb1Q8UKlfKWX/UTw719
	 ofFT6RabKjoXXur3Q3pCN4p/eaHBUVGbYXkZzuQJwLHbJojS0AsAK5DmXjsu7xFEk3+U5
	 EZc7xImqhBCHR/liTYUaV81cSAc5N6qC8ghZD5rF0ZH/oy2AzdHdfq8/7aLS4abDUSP+y
	 z3a/UyRgSphmySaBKZjNn2cmqmZeuYMIiecxImocxyrhmNtwoQAeANB1tLsVD3cNfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
	b=ZDR4/Urt6RetqeyDghU3U8+6CDvkdL07f1n85DJCRVQrq9ck1VCO0tt1mrI30uvq2XYT
	 jd7VlanloIRafbzy2FygNpUffys7wNTXw4+IEFhyhNJhs7RgB04hfu+U8R6iqJGHjZ44u
	 sKXbBp56YTuUuVmU7SPUSmCN+DXxRTCWqD5LKFmKhhUicoFe938RskhrEWjbwozs2lvax
	 wfG2kbesdUR9jtfnruV2rIS5C3oTUzf78xzm7jZuy0HXzHALExFiq+Yur6vX2qsKjSvlc
	 JmgTczbbnoz0dJ85IlAziZfyWH20cCKrDZ6aLSYBnimlVUFNxy4qcxNCocZi54fGuEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByEH3LXx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B448606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B448606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByEH3LXx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCePYL3215086
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=; b=ladCPEJ3fJGgNUnu
	Q6vslGflvT/5r37724+q1QME0Y5rc95Cwynv0h6HFvuyIEN2qgmE4SzB5SMdWhE7
	3WwOgd8+1pouWOpm5bsomyb6HEcNAdFryo/GW22gUhTVtVgLfDMlTG9XuRdm2Rqj
	gufdSBnQDlP0G/jjZdXm7s4GV8bV1hhl4PvQm9rZTr9T1PhkZrptQzMnIUsEy0fM
	pMUDmaSvtMUb/IFiISVbRKESXJT4bavxk3WRf7KuiJRG41O/jKRmPnVEXEhbo0Qt
	uwM9pZ2sC6SfdahUmAuO47uPIksnblHG0ylKQRlQIm1tcciYupA8/Px/yx7jycK9
	Z+64KA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9vfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:28:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so356780885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280503; x=1793885303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=ByEH3LXxiM2BV9DuR7adwNsiDE4ezxn+twqqyAuL7FspUw18grACV1pbr4AzwmhzOh
         BVSyUjIVLzRVHOQSPCctsyp1ONUEiXtDq/elUL9H+LskC63bim7iqrNnRuJU8u5QY2tA
         mlX2P6fQzpFMLJXB7BrjFf3Tvxh4Ue/+Ide0BsaH6EkkRqcFXIclHw0au8zOV1ZrEDnQ
         VGwsgYg5bzSps+u+GBidADmrXffZUtjLTHrY9mGf8FoOsTaqE3kKawQB7bsmPFdnj3Bp
         0c/JfH+ZbrLF56LfZ8rexxTvrcZQk5dP0l/XRH2Q25Z9L1MozbJxNTfoOaePUlloKS+N
         6J+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280503; x=1793885303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=Nh4DURNYMV4Mm8+n6jBHH2nDx/Ga2Ka7NlZghXalEDBaIRAj3SoyWDDxdT9VdUuseH
         syAkYXAdsCmTgdR7kh1FzW3oStOIyPKYhbUzNpvepIxh96nWYlTyxvSaGiqRiesCyyI2
         rt9vFbsZAxFELHtsUalmgwEbg/fRwJ9WETzzj+YI9L6iJVDMllrItdEdhJBqCaTcmoXG
         uS9AoGAsSGSXy6fwmc06PijJqyJfM3Ii7RFHz+xhZzJuq/D4pHFy8EnUCj4mfgpyf67p
         9h58LZlvq6xwwx7RVijc+AxrDD3yxlrkjLnjKNLjS9VnaKHVSv+UApMyED4up0nYk7aV
         /S0A==
X-Forwarded-Encrypted: i=1; AKwUvBwdg6QxFNMEmp+aaTOqPEMSN348a4vgNy9RfZ91KYpxFwn1TNy82gpn0hUg+V89v7GIxMZNxrj2XeHfpJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0qYCj8QfLAHYPM/lxw3HTn8Yi1Vz7ussmVYOynMPclc7jv1Hx
	ggd9GOgmnR1YrduYQ6RZphd9GO8oHQFw/Q1ER2heO+T60Yju1kiqXiHjiL73u6ZLRXQ/kA8Bb3j
	RIYoGucKsMfCqLDnU2gbx0kfXaZ47sr2WuJl7g6+804PY3XKhNV4b3UQHVo1UXUEMke0=
X-Gm-Gg: AYBFou1x7LCAgIohgSmZzO7M0Lfs3hHyl7g2psF9ilidJTtiaTOER0gDrhDYDYsCm/h
	2FI/4h5WIVnbZWTkeu/ftiwYrHvK1phUc7Pdueudd4HbncxFyrrY390Jr9297haTduTVmLBcdkE
	ErqV93EBS+TaJfM/Az19UgNoDW6C2I05dYkPgPQIJs7fUg4xpOxuW/nz7AL4LkbbzavmQd7mPOe
	o6c5ADC45rSQclgXxAqqlF3YzrcSMFmctL92L85KTDx8bVGWxODKMsXPJ2JzCnEfeNp/dj7ZkLj
	abuT7Ln/xWYHKJ9beqZLxqkI/8GEylkloPTRtyqggTVIzAOP8j4uWwK/IRhll5XaYOP8nxEvO57
	jJEHEIbk5gwDOMSevta+oLsYa98n4Y7+khVJxc26tHf4SgGh57YmJjV7FDXG6thBj5GBANmRxMw
	SPj8Oz8z8+VBBL
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826049685a.28.1793280503545;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826046185a.28.1793280503080;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm67364985e9.7.2026.10.29.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:28:22 -0700 (PDT)
Message-ID: <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:28:20 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfXxSH9Cpj5zCm4
 K86Bd17BkV+6g57awnTngADorCU/cUKFYEZ08RPObE8d2JaW+0JfKInStizuCaaEZoxPETbm+A4
 87jVw3SdWWx7m5Kt0kPdo7mDB48XG2VOowT94WjmIhA4/6O8FlEFHNHVU1OtktpS+hBlFrFtnHX
 O0Yq+nMPokUvrvxBVnKsYPtg9Wxscm2VeJ/GbR9I5grnG1mCD3gtTEkkOpxrgu0G+cQFlnYDw97
 gUXWU1mUuF6Pj3env7/PUvZuEmy7WCMBdTfyFOPZ2DZ62hIRFgxUojqmZPZRpvy7mzwgsS9HL8e
 meWclqVw2+OWy7APjzx+/kCuu5vsGklD2LBgD4bCtrjDtsgfx36+yLNdWUR1ALHIQhvSMaOnC3v
 0L3ClXTa7Io6Qt0dmdi8gXTi/ueCmpcx0DeU47tMkV1ubVTdWpd5ezVQ86KtyO367dxE6rpZXRH
 ViKl/2Vp3wHPMzZgYzA==
X-Proofpoint-ORIG-GUID: 8fCjktajmHXTDYPHCTgKAjW46Nf-bCuD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX7ukPwOjhpdwA
 dfH0w8Z4GcGM1+bVjXyiOkj3DepL6azJi5TAMr/pC5Vh+sZ06ZfCnwTdhNBycVBmApcTJ89Byts
 xBy2O5xpW25fOProLbRlfHw9O9FPjzM=
X-Proofpoint-GUID: 8fCjktajmHXTDYPHCTgKAjW46Nf-bCuD
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae349f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=382KtSWcDXd1BgHnxQMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290052

Hi Bryan,

On 10/29/2026 11:55 AM, bryan.odonoghue@linaro.org wrote:
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 

It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂

I would like to share my opinion on tagging vb.sequence at EOF.

The EOF event is received from the CSID decoder when the EOF short packet
is decoded. In contrast, buffer completion is reported when the write
master has finished writing the corresponding buffer.

Because the processing pipeline includes buffering and line buffers,
buf_done on the pixel path may be received after the EOF.
Conversely, when cropping is enabled on an output, buf_done may be
received before EOF.

That is why using EOF to assign the buffer sequence may result in inconsistent
sequence numbers across buffers.

I would propose:

SOF
Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
for userspace.

REG_UPDATE
Once REG_UPDATE occurs, we have a guarantee that the configuration for the
new frame has been latched. At this point, we can iterate over all active
buffers being processed and assign them the current sequence number.
The bus-write active-status register indicates which address is currently being 
processed by the bus-write engine and could also be used to detect frame skips,
if necessary.

BUSWR_DONE
Complete the corresponding buffer as usual. Optionally, we can verify whether its
sequence has already been updated. If it has not, we can determine how the buffer
should be handled.

This approach ties the buffer sequence to the point at which the frame configuration
is latched, rather than to the arrival of EOF, which may not be ordered consistently
with buffer completion.

~Gjorgji

