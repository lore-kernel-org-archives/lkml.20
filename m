Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008143;
	b=kMOsLC4gWqMsskX484ynK5QB7IHFihOBl3o4BUxzPrvYaVmBn/U66xEtJjjh1lbaPzMB
	 NRdc2RGXBspbJ8+ZLMKIPC2wuRizQfj6lXHMWvDbtBff+U86PxVbhBET+jycS8FoVC6F8
	 Xv+vbJ00DkpFSFoUpV9DHvnAWQ4xhsuerlR3UNk2AQF51wmwlzVe/r75d5lFxuxXUOQ4L
	 UJnP78LfFZ0D4YthUwy2bdNzJ8RU9P8iAyqiPc8la4aStC03DWBskZBMWleDbfVoajUBD
	 uwqT8UiZ/9swuTNPdK5NGA7qJg66MSap2kHUajz37VEMB8Djo/OvT+CX4BOfJgM+/UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
	b=JegXivbHw+e+W3ymy/j21J4Fyz2aIAqbZ6UgXKW1mmlOl8jZE2+gZtA00LVnz+tgFZ++
	 1hJb7FBpST7tKJ3pSZ+EieC/FVeBLtAJrWMlwILi/GMwjkOYtz+Loi3tZb7Ynk150pmp/
	 lSGEBXuyRcHm9r7KE3cVKpWRbVre0ajj2udzzNESkrp93MVFosa4ZGKN5WIjPQtBafPU2
	 KG+8mzKXjREn9WTevvyJCDR46gJN+oUZFgvk3G6Krj9lDMjYfkJxxGK/i0CDdxbq0akcL
	 tMDuQUJe+Pt9AXDbGCxD8CZPAIAgCbd3FXmVTsz8GYQtCOSGf4glP4kLIXIalluUZdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7PtfVAo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egoBADJ5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808D606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E808D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7PtfVAo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egoBADJ5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xFHR1911554
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=; b=o7PtfVAoxAtxieXR
	qRcE9ZdSLenSgiIBM0TRYc2MvEukOTH9Z9A7NiC15tPKoUryXat4v3SuvZObO1MA
	9AQ7gR/UwJkyZmGX/5PatiGk2jL2lYjWri/GDgm7FqSiNVI6DVp+FKNkz4Uab9m7
	Is9ISRdBmQyMwCVHrtF6ctgXt2LW0rq0h5F/yvNJrZ5ZUfW/Elg9cNW7uIhIouPP
	s/A03M6SO660JMWH9rGl6TXjODBfe6B+62xJD3B+UfC3FVfoXXOETml8lfRZufM9
	z3n6CVU2wGlwQvfyoij8mzLrZyIm0ObEH82IcdH1Ugzox2nc3N1K3IcW2RTvt1QH
	FxKY4Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u605va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:49:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9178ba8eb30so7297136d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008141; x=1793612941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
        b=egoBADJ5StUpbkhy6BafSyQxOe3H4jRPiKcC757G/T7izxLvwxXuZ3FLUpjoVBtVz/
         T4KwdNtQqSRCXLO1v4gHy+FB2W513f+Pm1Q917BGQuXfhxsbR5J4pkH9swCD6kps91T9
         t5vU34jv66iQY59qDhUXE4BY58jE7ARbxlPITjDydsqhjfbVEAMuldqKXFxtx3lNr8hM
         wuoYcJFGVmcs7AMjXHtF0bic5YcNHnRsE+/aDgB2ST/Fhmy2Sjkl8nSZ65DRuWH1fWWj
         4IXR+MZchXpZd93klFxnnk/3P6gIs3GPk0+rIpxLo3RqnYgvQvG37uUXZuGH0QqFvMIv
         iQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008141; x=1793612941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
        b=Ol6JO9CHPqHq31Mi8Hsj3Pft8Prjzhzr/44JambnpV4P1gJB/T8u4jjWSVhvYMENki
         kMUEtUye1W5Ia1ry7h1ZwvJCfFgNkzvLtelqEAw5M0lYmy29K1Y+b4/UdeRvx3e1uhSx
         9+eDQRoXrTQpid/hqd8b5/ZTt7HVGokum2/ju+YLY5ZnPJX7Mgt+fJ+GwQlZHIWpq0ah
         PwqN8In9hxClHmvooSb5kPQwv5JtMjMusX5TLGVqSU3w7UzHaUP/spHaF/DHmeBymEy1
         frSdmxt46iXr/s56g4ryXZ6g18gR88o+pxaKNZBqjkJG5gzNbrC3PzLNWVXpGyrI6CqR
         EXDg==
X-Forwarded-Encrypted: i=1; AKwUvBxL46HiSS4BpKylh8Uxb0f7D/b+aYb0H7WWIfSMDBDhdBRbmT642PUKbAFqVd8zk5Ufj6S5u7Uq4UQOhwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNM79Gky1RqTfTT8XM7c2LmOAtKOkrnpYFuSeFAA3UyF3m++2K
	DWeqCcfmYUX49VebWj3pLEyrPI/K4siup4cNBbBh6TsD370bn3ycOfK97R8jikxaExDosNaMbwO
	WvNjMpwER1sz8fKC1X0bJmzczpLR45Xa13ypI+4euaTf9NMkHFEFzeAiqqI2Hc9bhQYY=
X-Gm-Gg: AYBFou1ZRQL+kheZEyGACvlNrPxLV+QAoRD5U22aAeqMLBYyp5fmoFvvYaO3peSx1d/
	DfRNaM9GRMEF8l/korUXd2EmsBgxF/xDSiHWL1lTTtcncYY267ENMhFv1izPQgBJbKFc4ONjKJ8
	MNyyngYhOcYN+33KUX3DD6deBtWHjIiX0G/+7yDUtK7I/4Pjm45eHc1EMkViCdcaqisIh266iyI
	+JyNFI6Q1nFC8Hz4ouU58/IEr3Wp0kY7lZflx3TWP+fetr0INrpLnMoBlMvioEUqfDX2OPVgHpS
	PGRz5aLbND2fjOgQ9UR5g7926sUgi/9HGh9WD4kKmhlyyxDPAdDjqIYRq3Z85KPgr3ilJMgbsd+
	CT8C3HNWeW59pogQIZutddA==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr891899085a.3.1793008141101;
        Mon, 26 Oct 2026 02:49:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr891896285a.3.1793008140702;
        Mon, 26 Oct 2026 02:49:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3349750a12.37.2026.10.26.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:48:59 -0700 (PDT)
Message-ID: <4fa0a55e-4446-43e5-aec4-beb6108b9686@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:48:55 +0100
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
Subject: Re: [PATCH 4/8] drm/msm/devfreq: Record idle_time at GPU idle onset
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QE7lvO-Q46F09Ncl2Ews1lu1ZEYhDjBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX2GPHNIvwq7M+
 iYLgMSZqI6jZ0aUNqwtm5A1n/JN+zR2/KZxkwkvewPzU/52za2Pm2SBeKK1/EwYxBcZhwpiAgpp
 TxYwPbfHCGXPJ3YXyCiIxAe5ycFKhHqJTvwjv9DT/zWHQbIOgk0b7/uN5I+5aNAIKPmxClEJFuF
 08+1oaZs6MJceqB2qBRjw9MQczkMV+RIDLCQvHug4QwE56wLHhBgLJLroZxQ5vQUnpwC6kD8ubb
 UEdkwgWvzsTQS6HeIXR7F60i0Biol3PliunzHhE0PyLTJfweVAY3z8V+9OnDes5Etyu1jo5CAhg
 lJK6vnH2V+QyPUU3rDyj+ufPx9V+sLH5iZ1aVj+XOUnPo3haril1DpLntnceh+qGZ1M7x9lDUTi
 j3LKrpWxTMCIfmnsVFB6lVQ8pKPXQ7M0WT3F4+dJWyUjze8LBrY/EKfU3Tn/zyWnqDyL846e232
 XntoNOxeZCMNXHU1dlQ==
X-Proofpoint-ORIG-GUID: QE7lvO-Q46F09Ncl2Ews1lu1ZEYhDjBh
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf220e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXzRwmYL1z53Jw
 /SgXiGW/gux9XjyjIJkv3I3OnEliW5Ujsxkj04qT4hQK+d+7LzRiI5kc0ELDGykwhdDG2/5U0/H
 OB3l+aCvJSwAv5TrUjGcXUU238Vhhr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Setting df->idle_time in msm_devfreq_idle_work() means a cancelled
> idle_work leaves a stale timestamp, causing idle_time to accumulate
> across idle cycles and potentially trigger a spurious devfreq boost.
> 
> Move the assignment to msm_devfreq_idle() so the timestamp always
> reflects the actual GPU idle onset.
> 
> Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
