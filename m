Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619163;
	b=36n+XY5wuCMLbBOF/WQQFbFmpWCDRoB009t0I94ikZZYtPkvpwVQZiK9fUti7sM7sLhJ
	 g7bPFao/C5GCgnCBqFk7R9qy0MvO8EdEMEyAws3/6tl3lQKC09UZ3UzbdEs98zygc1JZZ
	 PZcu34mOAqL+7QUzUMiEpF4HZRlpeT7gtAj1uNX7YC2doHuNqr544dh64Qv5Jh9P5IB4Q
	 8Gm55S8tH7aGh3doOat4Cc1lVAo5VDNSQjja75LTBZf+2sy11OBuS5wvkQLziOBAhVLQ9
	 F3Q1fbT3z9DDYl6urQwaSQWV5hjnEjfUGmNSkSWTDH5F/i7TiI5nljn3ayPDYEUZbDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619163;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
	b=T4yHFjm0exUdlRaYLBRbIwWTUq0jNLcAcqxq/oX1KgtPVC7rSfW20lFK2WBpwUYJT6Zo
	 66o3yAyCs9d0v5+/f2h6KZQLjutHwT9us8kfgX2f28+1UGRjHS5TEifeFNYI0HfucnLco
	 ik1q1STsllL6Y/m7Fts6+BOq2G4OkgXYTtb6pkzAIigNDhRkAQ6fmv70wec6mdTN951KQ
	 wid6bp201SaS4qJbL2aRz6IrxFHNNBNU46yizucUPFnCtnehwNxG8xfqzSUylAeI3al2B
	 GmfJV4x0G0g0PWk0BTvIBeuhWvo9hcVSInTnxX8rojSC3AqN+RXuT1N8jSv48CfZFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3Y8ZWrt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqHYuu5t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E5606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295E5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3Y8ZWrt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqHYuu5t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2wfO077175
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=; b=O3Y8ZWrtZtSS2V5W
	LYyq3iyKF3Jleek/N8UVXIrjoUBfCLs0yUSiB1ehJratC3aKbH6N3I17XXhirxvU
	lFC0rK3OdQh26C+ixDNkIJnl7/LfAd06olQdlZSbeOh+rwnQjgY91hZmyPh1Zn+j
	OpoJBwkelvrKZnIoXsGCEwGwQiJgCKD62pM0liyYipZqWO22PZHVmqJ9vvzrebg/
	DhkYUsohJ06d+tPAxKqG2lPKLDzLTXYXn4Zb0ni6s5Fvt/tC4WDon+pjj7ionC39
	V/GYFVxRkspomB85S9gCsj0MaJAn1DT1GrPpKoAcyWeZEZT+QyBYSs21j9Yw+Xkj
	y5aW0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r3cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:32:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso43313185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619160; x=1794223960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
        b=bqHYuu5tuzYqzMcQJnCM4pl/piQRQTfaHxO2ZIcYjVzxIGzIVUyg2WJ0o6jGx/mmLK
         6xKXklcZljwghhKpfgJMA3BSmjOVjSWJEb0vhbhhlZykX5Sf3Fl1mU8NAY0yAdfItehA
         0m3cfTuuYV4I1nRpV1abVyAm1aKHhtrjgTI6XFxMhESq2KvORmKC9qEquAiK3tETEsN3
         NY48acuvS+cKJlMnxSHtKUwMTFjPYjCjWGtyteNRhKDqFQT8CVzZt/aXdIchYGeVuBAW
         RtG3IMkDfbN54p8H+rnXSklxhz11AW64ktJSnevAXtNHNGgH35yO/2XBGUO2S9prMm4b
         42Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619160; x=1794223960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfN2zl6N/U5Eh5uhKHe71C3cBewA9U9lpLVxicyxkzE=;
        b=HIU/SV8NFjwXz07uZUMVYLCqaUlmTdn2GKhCjE34GJJhXHgc6uF9kijl7DiNizQOqm
         5cMXkAzUIHfdUSupLkNpOmdWr7PajoB1KvieoX4g/sEreWC5KZgUTwULt4n+72kfJbou
         WvRZwyciTdXO93HgsMeIiCyYACCPzKuttOZYR5o5jf98icwxTjVYl41kAiDxVAwejYUQ
         T17JE+OAz+gZimtQtOvoNdKlDZxICtozLYQMXkf1/rrbOLY9CBQdTM4ev/ccHl1MkvoS
         LrDrw+QbgyyayrScMu2gUQwDIbVivj2skhumoaQeyw4E2B6wIYWPFkK62t9pd6tWoG4G
         3ZbQ==
X-Forwarded-Encrypted: i=1; AKwUvByusUa4l54FIXWKcBiNy5W4fH3pL4hzXt2RIzyLTlpk+wmliuE9vOcoNOduX6Ba9rC61Q3j64F1F9ki/RI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI09nvjWhPzXTTsAdID0aUSsbg3O9yxj4cCHvD+nhXspNprBQf7
	ZXJ+iqidzE79zmFw9xzx0o8df/nCeiW2SE8jt6IqVyNxBbFUrKDelqcw96IBuYHvw3zDCX2Gp7f
	kJO2/boHksXwJ8sRkwP0o27/OI08aEdjdJr8qBdB+7B4SJhlBFn0S9gr9VfOUOWYsWbs=
X-Gm-Gg: AYBFou0M1J6OyUjeh2gEe3jD3xwrS6k7x2boUiCOFRPRFK+cWTwUQBKSK61/6EgvcbP
	H99+9WWtJwLLIitUQ6Dnyu4JXVHekrjJdcFAuuWEzK6dBJsaR0lUOqxegtJVWk7Kwmq+9aNtR4F
	bsDNFuwFkUTikb4PJKEFNi7CfiXHBrGgrn0prQpprBYKm6aV/GTs8gPpHzowhrmbX6mk2IwD/o6
	FsLUWSPAjPnm6fOPd/Cg1vosm+EtBZ2EkCvgZEuJ79GI9Cs1vLqIB/iGd+nTR/6b1qJAR8THnGt
	1jvHC9jxodix8ED29+jLj6XQWXod90Fg4jNfizbgNr/fGDATEV8NaiXm0M4V4soSgf8fCQcFmJq
	cGJwfNn0QRn8kvKMhsO35FElgwEg/PJWgdPQvfKNkF7ZYkc3DUkfQBy2t3q6mV7d3fkXQ/nY=
X-Received: by 2002:a05:620a:a40c:20b0:93f:25c7:a4e7 with SMTP id af79cd13be357-9442180ad33mr1570944585a.4.1793619160428;
        Mon, 02 Nov 2026 03:32:40 -0800 (PST)
X-Received: by 2002:a05:620a:a40c:20b0:93f:25c7:a4e7 with SMTP id af79cd13be357-9442180ad33mr1570940285a.4.1793619159969;
        Mon, 02 Nov 2026 03:32:39 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0d1aasm364431766b.79.2026.11.02.03.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:32:39 -0800 (PST)
Message-ID: <4f5b64de-8037-4a64-9729-3f0a3881cc40@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:32:35 +0100
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
Subject: Re: [PATCH v2 1/8] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX4X588NL3jIk6
 qqn7zgtox0D/ezRUMYv2WGeKxgztDcHvYuyJLeN/DUCxkECzuG3lKoZHdmuh66qhuepxGkAHod0
 gJ4ipk8UyQMLpP7szTxYI5li8YDIkV2IkHpN+OTY2aNSd5KCO2ax88JE04s1qHAu8fuc/qWHiAr
 bJLNnFm/wMHRleld155HUZvgMQiupmB5/KAYLqJOKxj+T4p6XYWz4teUz5Iks9o5ZI+JdeITwRs
 2U8Andoti88HeJoV+OLLW6ejPLoyyeUCnfTdgGgiArbvpZHunRRC4B/pVel4BmmmuBsRFzzMOK2
 ez/Gr1YUrQcitAuuQ4yIyeho5pdWwKStVhfsvB5v0aHyxnpXkmmPd3aMJZRdwayeK3ehkTDUgtQ
 /0P4cCTAQpQcuA6oPnN30btNYtkmiXlN6kVX5E/XIr1KHdLTohIR0DuTnOIKvim6mne3W3UWi20
 EcG8VAyMm273+MrpTMw==
X-Proofpoint-GUID: FNasLA5Sre_Mvn7d3AvSNncCafHXA1Xm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX5gA6q9OWDK7P
 CCzabnKAzRpBlZfmrLYZ0zlRJ8N27pb1shXlgVb5juADeCP3QlV07cvjZW/E0j96dBu1Ur1XoXr
 yuvo8Mf2z0ecodIEcLxOZ9jsF+goeWk=
X-Proofpoint-ORIG-GUID: FNasLA5Sre_Mvn7d3AvSNncCafHXA1Xm
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae874d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=67Tr9d3efp1zOqggaLoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> adreno_remove() decides between component_del() and msm_gpu_remove()
> based on platform_get_drvdata(pdev), interpreted as a struct
> msm_drm_private *. That dereference is wrong because msm_gpu_init()
> overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.
> Use an alternate check similar to adreno_probe() that avoids this.
> 
> Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
