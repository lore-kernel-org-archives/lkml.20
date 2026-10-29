Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295144;
	b=jAJjm5OBm+NzMO0EHkVOmnkI6L1jzQ3x7bNBMtnip3PDqRABCy4j1AjG0OuZznFRCroC
	 urcqcTjXCIkKl4vBdBAt5h6zsQCXETvSqOAXPtkLT95xC6OPfR247oKZmFZZjckPP4HLu
	 +AlH3NJ3fgl3hn3baxoVKHkoj8tTQaB+R/kKULKox70JFBR7B19DY3FVVwdwXV0z3p1KX
	 mdnrsKrSRXACTRf8MzW7UjGqO2ZCeO5I7kn+EDuT6GU2lmRqh9WeMS5Q2tlhM0k7Apz0N
	 BqxGF1Av6gfUeX0eWV3SSc6nMVmvF+q9U7tAXarRl0deCE653TMpj76DuTrMAcvNdFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
	b=LQHc84XcuTrYVjNCZR/LcdKh0Bb6S19EkViTMylp9J43E/BqgDnnqw2fhX3bjbMem7lv
	 H1Mf0HR9IAEXmAR0xvBQf9D97wl3O+UMtMpSkdC4rQXX9xVLkiRE/tY8M1I+dI/vefX/p
	 sS2clMaXtLw/qON/y1r4lGpqIahnqECt08pkqD7L/zzkW0gU886jIt3UEQJYSCGlT8mMJ
	 6AWzWfyLSZOcOJG6jm2kTLbw2hvhS+SNjqLIb2lr4ni/wS3Nz0IJMKGpOigqDd0pIOxkq
	 wRfrefzyKZtsaNbH6OWDG0PhR+feW9iQJuK/jqdo0YZfgfQCdfm3BqqfED+6SfwygoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9053A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDgpT3689811
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=; b=QC2V6meyZl4mc2Fi
	Xk7S9Eh6zFOo0p+Y6zQUF34RVIwoVCSM/pZo2ea4+Lq4zXk7LNPjERypZJ40f7HJ
	UvMVpv8EOBsn+KLbcOhJkMp0z6j3x/wHs187VCZrJZz/lFaRmEhCe0lhTj/25Pr7
	WhpX4rLkVCOehgUTamolzVNBlFhGTjYbFuGTjV2LtdpfR798pSGjsGoQGHAR9J2e
	zPtr+wvVF2J/SkfBdE7CwhZychQHTIdmoL+Tvhu8oexEpmrJNvAN3/xGKmL97D2k
	LwrDnAmqV+Qqj/GYLha9C0iZ0HKiVcEO7nmRRdQnGy2L13TQ4+TLkdM92IQFn97a
	qIXa5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5sbb1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a26fe9521so945697eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793295142; x=1793899942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=fJtWcF+GkOFY5Q+GhjJhwqYobyF3suDcOtmEMmqMWiRCMcsQf9iMV7NfDSVqUBGNKK
         TQBBtB6LaIK2CLjVOUZdAwdL2ERgvc2lV97YPxSlFAtmTHyN0taqH/OO3PITZfRx8S5/
         TJby/Is4tdwoSWL+yP0wu8uRMMgnzqFnjB6sz3BJcVI45Qn0eR9tBglw/hmBlgeIQLrl
         TTDf6X6o33hgDrWf2mYK1Qyrod/Ozv7VbK79Fc9CVlJbdYhu+v4eoVMQYb323ElKhGCf
         /GutNqEYp6bkvhI7vr6CEOP4Np8rY/J4Oi7sozh+dqmtkJtN3D1GN1frUP0dnH5ac1DU
         sYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=tRo3kA2PrO8xE4MSE1yMNX6gMX8CI+q92qsGc8F2smTGEYNXo3JIA2YjaxE3+jJZN9
         YFuZ69KfD9y588cRS9Vxgxu5gDiZO7T6+envesDPvIUV0+yZ8QJ7r0a81ySz4SMf97Dh
         3yq5C9ERLmiaccYptLmdi3+2Kc2sMZBup/VEpoRT0F9EMNAqfoCBKZjnmKaOAz0Muiww
         5ZfhA+LEnhq4EpEvnVXyQb5iCotor+T/AYomNGwbLyQcWYZ5dJGXsz+UesgK1kSAglF0
         moV04mIFys8OUn52xaqT27DpRR2PcNnkCS/aq1mnzSn0ChONwFdmhEMtncwqND0B6CYC
         LIbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9IC4PtgVbW+WeisUCDeMTFrRbaOF3DA4yHiEs0xRg9paBWN5p5Lwgx4No04FNsby4OlXHJlFq9uJ8vWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd6e0AVNttK46aJEBcyemlTF4zn9lxWGW2lcHQJ7gYPxDQ9av7
	6JowrmkVpVBoC/t27Nke20BVKZHyQ7k07P8wyhamINlVgkI7ADDyHtGaYiPCdIYmDpYrAgc0caQ
	gNLdEsgY2ALItAIeHgGToIPidKt5NOSAxLKpzLLJUAF0pkaEgrCn6Om2CYrNv/7iEs6g=
X-Gm-Gg: AYBFou325JLWS0fEu/bGOF1vVq93YJQ4rm1U6KciKTE32hWj0SJbPzPrdYd17jWS0nS
	9ifqp/9XNJ5jx+IT3wzx3NxoBq0guqZo49DTHJ61kEPik1yo12mPtyH7P/Ahii/kdDHH89j9XwD
	TllLrsbIbtS4v5kia5nuhYTc/hFMCXz88ee/p8XcFB8ZnRMXCpQT7UOzonju5Iw7tVlhS08KOdm
	VRnYFBOgr+uE92NfmNqxleQHgaCwHarljT7i2ENOrAlU4lg8s1BlEirtX1/XaB1l4GO843gwD4G
	CwisZHP62hSYEH68r7YjUT7l0JhN7dHfBPOCYydNFR3tO9Qw8S5nWOiz/OQcjgG7syPQ6EjHBF0
	dfcVBqd3iAhbP1yuwj0qYMgkdhD0YAmuNU2o0H8cT82bu0i+indTyLLzvqmdCBVqx/jkqlleCWM
	Ou91mMnC6Q
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479412c88.14.1793295141585;
        Thu, 29 Oct 2026 10:32:21 -0700 (PDT)
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479382c88.14.1793295140986;
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm82433c88.9.2026.10.29.10.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Message-ID: <e5a01a54-a619-4524-8829-cc19289c057a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:02:13 +0530
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
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: fix PM ref leak in
 swclk_gate_enable
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX/6+EY+tMpLrB
 uyeL53Y378aVtO0emxnnG6WFQ4FEoSH+TfDUZEdkXrxJtbZvjWpE2v8qWZDCScv54tFMYwxmGAN
 R/qxROhbABKQIwYgAQi3FfbBxAEi4bI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXwlgeL7gxQbQj
 Kk+4NZsULcXVlOxtKigzG8Lfdj5GuFBfCuL7xJnn7qtB1HK4RecB2XbxYqhYJjmxZWADS1egWEP
 0E8Tgt+22yN5u+t+Uio0L5XhN7mtpc5FGzvMaYhZ24NYHK4pgck5dlC0lefyg9CDJc+hCfvGjYL
 dBnETwGmXvJzZ8G1mKtID3Ddi0/RTMYUmmbNtWBgrg+G0jMkGDls4gHSGOvNJNf5UC2uHjegX0L
 m7Glx3w/CvwcOBrQ9k6lNs/AIeNlyCjgn1jan4NZ0AwaUL+i2poXHjPS5UteBvTnTyPzvAjGZET
 nxbmGMqoGfDqCQKEhLiv0//4Nmlg1kt8hLlbDHN3kMozTVLj0xjYpGnGVsUcQrq1elzAt94EM3t
 lC/+/vGa1mzOfMYGy/uuDLreMScj5w==
X-Proofpoint-ORIG-GUID: xyhFruPwuwG64VaPz1MJ0ywbkIrqYBJg
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae38326 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=87T0Mtg4cv8Si1ZwwcsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xyhFruPwuwG64VaPz1MJ0ywbkIrqYBJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068


On 10/28/2026 5:15 PM, Tang Bin wrote:
> swclk_gate_enable() calls pm_runtime_resume_and_get() (incrementing the PM
> usage counter and, via of_pm_clk_add_clks, enabling mclk) before
> rx_macro_mclk_enable(). On rx_macro_mclk_enable() failure it called
> clk_disable_unprepare(rx->mclk) and returned, leaking the PM usage counter
> and potentially unbalancing the clock that the PM clock domain also
> manages. The sibling tx-macro/va-macro drivers call
> pm_runtime_put_autosuspend() here; do the same.
>
> Fixes: e38cbb75248a ("ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

