Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F6476680
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798622; cv=none; b=fxl7nPp7Jl0bZmgQuSlItoWLMIVjIv7ZiKe5fO8lIdrtjKh/GIotRmrvbvNyyV99tVpNPOXBCcjt/ycksemNXynKUz8IDv39WP6GHlSus4Rpujp6znl2+iuW/HtMQ29NCD16vdhLeFSCAdKOk8nseHgmmQSZh/pWTXjXEKxjaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798622; c=relaxed/simple;
	bh=bkUoku9vvOCC45/xH4+TO5c/C0lBGGKl0K+LjBajYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXNbi/KJjtTNJhwLZ6wxmyKTVPSJwjWpyTF5/9U0hvdnJyx9DPDrSIxhBot3WlD4QFlyT32LbeEXahTD4HxkWtRu5/NVKDUFuBasBgnaSjMwv81wArQkJ4f5zIRXoLh0xHd82IBnzhSTZzW+g1I6iWbvZ/u1/pbErGPFesIt7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct8zVjhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTt+9bnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct8zVjhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTt+9bnn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEV81754766
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=; b=ct8zVjhQxysGhVih
	XneGqg/XFRjbzCqBQQFkh5XFWTiZYRtSXVuOQbrBw1TlcOg2JOV4sRMK67etHbIr
	pQE8YphIJmvBSIE9dkdmMZrMosK6ErNtRoZjOxF3xvbN9EGN7MPnLTQSrznqQzed
	tWctd1AR0vT+wqw2evnJyPf+r8YnzToZhTURIIiTY24IVf0pQg7iMEHlD2ojmqjb
	PGqwpGrt9U3nvSyC815dB4YDkonbX7kum1qrrBZ3qAcmOCaL15L73MtVT9/NTvpd
	Zzd1MJpw95yo0qGmMKqNilfqflBKWwO1aBaO0RSGBrNBpLOQvP0KIGW+0mpdoSJ9
	9fFkRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7126wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2388119a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798616; x=1792403416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=cTt+9bnneodA8YzTBbwWThEz0qk3PMa963D8SusqaQSUbV9mageUyJb6b5HYNqtKeB
         +9SheizQ2sTBsK9jwiqpWXXX5FuLmTPI0VKVmWTpq/R9j86ury6kmIiLnZii9v9nJvwR
         +c8gwkz2lpQigBl/8a/VPnQq3iKY+g1Y16zwi7IbBqp7YRPmho5LdzmiwI3+ek8NI05v
         W11jhpFSTRQcmoIDk63vL89CRRKGcEzT4pOfL6FfQQdylEfYKJEXKkGL64vbfN/cjPAc
         a1iEOfJf9NHrcLqGE/HIee+MA2dINDUpLyf0nh/EJSYn43csGCLvNkwZTNfW0vK6zK+3
         KKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798616; x=1792403416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=sD+xZzZSOHOxDUh9nPpSzK0k0tp2l+MfaL91jplL9l/7B7Rr6hyaZ5t2rd6OWNqEuy
         /DefIvzKkE43WmezMnNRu4x5lqmlq0nfcL7X0EV5QqchFm6Cz8YNb/Zz0cyOf9xPN5ha
         rBttiUhDQa/mihn3g013ndrwknv7xelDIY0mWCCnkEgBJ4P28FEdxZq9u9InFmHYfq23
         Isoodrq2G8VkrMEXcVkU0vvqfKXR/ixc8Z4t2iK35WSR1rCWSKruRkQSLlSjXjaDlYm+
         BuBxL0gpqqVXqwydVWJbyoH+Fcf+LPeBFuD52Lg2Y7SPrgYOPpet9bxwn1n8LYOhOwzi
         vNZQ==
X-Forwarded-Encrypted: i=1; AKwUvByVdsRHMMHoKGcGXt+00rOA77O+J9CM3FBCsLpTaTfZV4ELe/3Z6o7DNerv/0b/HdtdRbX2tstW6w1c55I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9RjM13UoCB59MKxHvSbUZ9RV5b6zoFqHFLZgyC6Cb4A5KhcJI
	V0y5482/NSsR8r7LhOD+9oNgEW1M/9DikhT4VPe6UNhxPeTWwiIj85N9njaNbYBMMV3a12Q64Ju
	dRvb1ilWabbBzRcuP0ZXCHKvBT/N0OjWJ4GI8LA3Z35UhEdLTeqwK+TiSZUfUGV6K5QM=
X-Gm-Gg: AYBFou1xEKLI5VM012bUhWYEy5w2Tf3jJqVQ/u2zYMm1Ftvx1MPLH4BwBU7iQNvN5aF
	w/vZgIpufa/YKtO91Cz7IMeQsgadT2rTcQa5wKCeXrKApSdStVdyu+9P0neyChf73pDfwYxTFkY
	4ckBvvvXcvs7GMUcFxO11Fqk9Vph350Yqd6dTCcRZNlFxwL1Go9XHpNvx3BKNlmznQHhBKXBejx
	Maa8J2vjJNJMnM3vFj4p5UfiPW5EI8aQ3JKXnrCGn82PJetlBrKJSJExUN4+OX2UERPh8ld4zl9
	Qp056uG6T3DLJ5SC1xmzFKwQ/eXyS/VCt0o2sUmnvO7Ixa3rW8Pp66Ew5ar1evZN9hvEo83qj+n
	sZDZZdHKYVVV6+f0EWUFWKJLfxVNfCVOLEOTi5GWhmp7FiCrgO/EIY6DSSi15AbK2Nn00+DOIol
	Puw/fq2nbbApk=
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364587a91.12.1791798616222;
        Mon, 12 Oct 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364571a91.12.1791798615743;
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm16558029a91.14.2026.10.12.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Message-ID: <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:20:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX4ex7zijfG+Zn
 +aq3fzSvyTQemrEs4PZcXox8tNab+3LaEHOlu/OK8N49H9bC6oAnA4P3i6HmXjrfVRL9+GZ6txD
 O90Tdbyezmc5uWQgFKrdHlqqKmqPmmw=
X-Proofpoint-GUID: pjeyNZszlIxAhI08lfiK3bR8DdAsLgY3
X-Proofpoint-ORIG-GUID: pjeyNZszlIxAhI08lfiK3bR8DdAsLgY3
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accad59 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NpMNtq8KyP0wiFrzd7MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX2Kz1OhuyXc9g
 zE9QOnnYe4xIO8CChkEUwIQQTKvP6c7rZkRPyo1bzXMybVry0a3wo4hf9gnwFLfTl3EYTo2Vijk
 bOnfnXMRwV51yexoO0YHbEqco9MeKg+plASD+l8YKxfifoN9dyIJ7LjM7Q/BOrcMhIegrM/1pg6
 ybh7bMHgoHXYoePEfbmffaC/MBDNKfghUqUh3DvYzCpF8ihnyP2qnAZpM4voC2PVdSQaSRyt6GS
 ED4KKR3Vl4U0db7Eh/SP5zs2F99CGlHQfS/4KLNa4x9IpTNLSEUphQAyJyVwVJbT3Aj6R/X0hRT
 dNBVMtDHJQfTQM3FxkfYDioHI587yVZLyQVyUR4vCUAUK3q7PboRnCunxQjgFDwEqk5bOeaKPqd
 PqOTFAZfi+cbK8efnZ/KhasAvkIpPjGs9N5lAiVgGUE39VpmyJEFLFONZY3pQi7r8pOOdxxDO3x
 dyou0Ydv+0mrElF0FBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120039



On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>> Register fixed dump segments at probe time for attached-state recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> Why is this separate from Glymur support? How is your device suppose to
> work without this patch?
> 
> Best regards,
> Krzysztof

This patch is diagnostic-only and is not required for OOBMSS boot or SSR
recovery; without it, the device works but no OOB coredump is collected.

I kept it separate to isolate the optional coredump support. I will make
the subject and description generic for coredump support on PAS
subsystems with secondary processors, rather than limiting it to
Glymur/OOBMSS.

-- 
Best Regards,
Anvesh

