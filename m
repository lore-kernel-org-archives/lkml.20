Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE1417BFE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802817; cv=none; b=ly/ErvFSvw7W0ON1MRgDjjbizUfL6tORWn1eTu9+pvm3AFqGe1SIKTOyEW+1PcRqUS5BeB/P0TASIH7kO+/GmEI3oqLWmv98A61k8CsPtDs/jDlvWW97Bp2S0eN9Z2DlfDWQN+NbVqUFyrVFQHUvL94RYXyhEuwxu5PrtTsN/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802817; c=relaxed/simple;
	bh=DKB0ohoPA10rd8CeWgiyPBcjWXLvhFCdAkImmHd/e2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJ4pNTUv8RkUOeFMZDJaxYnV3YhJ2msYE9H2n0JggAEmIppE45TMrChb5dro4CSIiyODIGJU4AJ4fHN3BCetUnpXztsOOqbO3VTadu8m3RRAsTnX5p05Cz8E4a8pa672Zj6A9UxaR/ReZw5ga7G5WuoOhDJhBSKH8uGg5eoxsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb6v/xeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwR8jJbI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb6v/xeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwR8jJbI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K76K2796108
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=; b=cb6v/xeAjBl1pi4b
	okzUfBrU0Ns3Y/cr+AP0fgVa/yycGpLLp6YN8Ogc/PYU2HX5TQ1Wn/AgsZW5mBc5
	yRVajyX2RXeqcjh/D8QuYv9pAH9FvJN0afqVjuGCQMMtFyIK/tcEj5qBRLp8BUGi
	Y3Mr32p6aDMuy9SYX8NN6Qzh3eGBx6KyDW6ffYBcPHjy+94v5N/WATlUWjje0goT
	eWhLA3IR4A8PBKbhjXH0+xNioQ5wkjopxcko+ROwbiY3BPmIl5z9wJgHZ5UnZP/8
	loZIRpCvBHGIxuynDcZ5WS+L6JfQby9Lo1FFuU9qIRHi+rBj+rH4WTeTuggvyn5Q
	t74KfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gwqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso317305285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802815; x=1792407615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=;
        b=RwR8jJbIVjVjWuZNB/2ExBwKgXDWDiia1/TpEH1FCzOSzcKVo6U/LdRXkm24S1JeUS
         IjQvxF2dYMfAMy0jtous4fD3hjBGY4PnTqXPVSWA/csHNGEulZq6xyonxbKuAUTama8L
         I1mJ+iUSJz4tIhLDcbDI59fALJw6xIwSIws5Fz/ZpA+ATEwo8I0ReueQ4XqSUsL8UiS+
         BN6pOsqXrzx8tfpECEzbMf/JEy+CitKMog6AXHk4ZGi0fZLT5kFn5piv0MZqLzbBJo/7
         ZfPxXWuRjKKs5+7wGg0DdcEnuSq8iStmhx5x1yf0XOwaENuAfOxWgkNS/OGMc3fm5IMv
         czDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802815; x=1792407615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=;
        b=YL/kLZyy5ftdT9iCcgOpH/eS+S3bk+DizgPcKXrMP9YxjyOER0mXZlgFkFBorSaqPb
         pw9DGm5avMk2aJrxk+/ZLzbo+dj54LKA99e8Unlx5lh7pre3GEoIpSg/3/i8p3BmnL3W
         PZ9y6msOmYqk8so2P/7Zt1k+Hcs1hH/ggPY4Ha4rlY/9Vtzro4PuG/ItdTgrSlO5CGFe
         3axkEGreaZRHr3CKwJOLa1l2QgGnCQhKEmmkDmkx9ystqqErq/sJCl9XCo1A+9ukh1N2
         6BWDsoAI3seeM4yqdt41LdcjZc1jNv0efNSMjUEQlFZGQtPaIjxYcnhMO+xw20qQbdOd
         im3w==
X-Forwarded-Encrypted: i=1; AKwUvBwyJlWFIuYf2JsvJxqUzwY5nxtM4dfQQ4pCT4Gh0YdXA8Ffg3u0aaYog0gwKrFIAs+3g6K8h+SyQPeOaOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp6TQdDF9QcfhRQyU12kysLaaU8HKcwAHdBb7Q2r0Ocd5pbzt3
	UAhphHD/GRtPeid3bvl5xZlgnwGlaQWFWR921Wx5KG/gx00m02WGt0Q5H+s/PHgQ96oPlEBGZE+
	NKNQfK6ibidxcHTh5ERI2pgPh5a886X+dDwFbv9xpDgSYr7rjSTnmnhdgab0q61H+m5Q=
X-Gm-Gg: AYBFou3di1fLIQyBSj2Ut2uhr/SHHk9BM5cw4eoljEviPBeORAuJMy1HUqOomZXOTcZ
	1VjuTFB0b/wjdtoZVHb4M5XP1988SUoA/5YE7tdJ8/AZc35zkUVJQGwXWLu6qMLF9sir5Mns+89
	7QgHRNdVlFMi2thLVj1+CJ4xaKlwpDuFYy9JN+HhhOsN/Hv5C6IdcawB972tu+F9yUkDIG9eKbU
	5wuAnONi2P+hgGhhooW18qOteRhTMqxbuceRn838KefsonSKR+aXsS+M9Gz02IjURiPLyBy3AUA
	rTxMTfQTMiP/NC8COpWjpC8ge//vto74Cqpd806XCkD/J0eQsKJtFKFN9V7DQiLDfJPWZHAfOE5
	CjvarN+O9+nvwKslNttDTfNUr7TdO8nHCL8WHlAM=
X-Received: by 2002:a05:620a:1786:b0:939:6de6:9518 with SMTP id af79cd13be357-93ebd2607damr1427532485a.47.1791802814325;
        Mon, 12 Oct 2026 04:00:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:939:6de6:9518 with SMTP id af79cd13be357-93ebd2607damr1427521685a.47.1791802813324;
        Mon, 12 Oct 2026 04:00:13 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm19330608f8f.43.2026.10.12.04.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:00:12 -0700 (PDT)
Message-ID: <c8c648d6-03c2-4af6-99fa-4e20362db34c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:00:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on
 SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916065422.819512-1-hitesh@ebytelogic.com>
 <20260916065422.819512-3-hitesh@ebytelogic.com>
 <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
 <20261012092328.120984-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261012092328.120984-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX7s+tr9s1Xf6X
 lGb8PpeMSQKsjZWOEUGaM2qrWsXRIgNLaOhdZV3xznscBda4R9NJakrdDB2nkdxFZNQHMsbLilX
 DJMTJkU16Vue+CGZsANdAW3s5anEE4bMZ5bZbG8Ii96GSTieJy8Jn1dnipAiWxFCEGMZBOpTjdO
 npw0YKi5o3UOwH7Tn2Z1ZqmwdvxkSeTPSb6s49ouNQ2i1aNaLqZ+8/W+M7wEzyo+PMZ96JX9Fnc
 POu4lv4LnvZAcMPDYs+20ZhcqieJL4RLXGhjRAd14/KtI3CtzGnv1x8xBOGy44qIqKfuR+uxV2S
 Zl/fq+qpVhdJn+sbftLbiksoYwv+l/8oHsTE9fzstfurDUsTD/ykxeSmKuuVisZ9+OMrYcOxaDG
 eOy72dJhYe9sFgzt7dcmyn/c+yQ12/nrvA8U3NuWONoc3VizwcDLlDEaBAuCsL0aZ8HXDa07GMX
 UFFnEjoHbS4JGNKjTNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX91kKIpicDrQH
 vUpr0HVIHWxF0tYASKJNNHzzBh3DAZLYTf44oO9GVKBi3YAeav6XtRa9GCagIIZlhxhRcrzEiw0
 JYSd/6Yais2uaFamzr25ToIkEqANYyQ=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accbdc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yLbyE3pZHTCQhcmTjJEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8_oQ4TzsMh5D502hf8mYFfp-tdyzAZe1
X-Proofpoint-GUID: 8_oQ4TzsMh5D502hf8mYFfp-tdyzAZe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120043

Hi Hitesh,

On 10/12/2026 12:23 PM, Hitesh Patel wrote:
> On 12/10/2026 10:27, Gjorgji Rosikopulos (Consultant) wrote:
>> Thanks i will try to include your changes in my next series,
>> it will need verification from your side as well.
> 
> Please do carry it in v2 - that is the right way round, since the patch
> does not build without your series and there is no point in it going
> separately.
> 
> Two things to make v2 easier:
> 
> 1) streams_enable at SoC level, per Bryan's comment. struct camss_resources
>    already has legacy_phy set once per SoC, so putting streams_enable
>    next to it keeps the two consistent and drops the 15 per-subdev
>    assignments my patch was adding. Happy to prepare that hunk if useful.
> 
> 2) The CSIPHY legacy-PHY conflict Bryan reported on 1/8 yesterday. I
>    already resolved that when porting to qcom-next v7.2; details in my
>    reply on that thread. Reusing it should let v2 apply to current
>    linux-next without you needing the hardware to test the legacy path.

Thanks please share what you have done it will make my life easier,
I will include all your changes in v2 patchset.

> 
> The SER/DES setup is up and running here, so send v2 whenever it is ready
> and I will verify on RB3 Gen2 (QCS6490 / SC7280) with two GMSL cameras
> behind a MAX9296A, one per CSI-2 port. I will run it against current
> linux-next rather than our vendor branch this time, so the Tested-by
> applies to the tree you are actually submitting against.

Thanks that is noted.

~Gjorgji
