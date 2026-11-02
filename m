Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618149;
	b=1J4gdJqCHpz+52PpXxuhvpu2lyG15+HR0z1fKJKgT77jKygD7+hg+nnFGL0BJ6fo9pJr
	 CGI/ZOgRMX729U/pFD10EBjnz3upTFxHYrORx6IZkSltrngFGfyQqGvg35UcCOSuRiicA
	 846QfqMvC4CR2h669Ug+Yt4VWuC+xBS+zbBr0S0EGaX0h6lzSyvCJCXjVxrCkCnjyFv5j
	 ZOE3rLt8ITSVdRAImjNjjv33ioXH0Wvd/0C6rW4EcwXFnx3zDKhh6FqV+4OfpbQvF1xeR
	 NL0Vqu7QuZZy1mbDxeq9nWK9gwx5qou+2MqaZsPRNS/0/GToU2rxwXq37XTrBlpQYqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
	b=s12IfS6wo9Qljlq79+wql1WvnboQat+Mog95GlMuUvbnQGEwmYIgTlqAL3zVz8KCSnFc
	 3gM3jaNJImYsNUCDE86y1Pd1i2+hqc60xfMd5LMUUfXW2x/HQSFvBZGGgGps7XaTnTNAL
	 kleOSTQcQvCMXIhp4rU+haS89RMdaglESzZ9AyWi2qyi8/w4Uff8of4ahTEkuvVGbv6jF
	 P38oOwTInVvhD74sE4tqvyHmRmCTNUNmVaDUmfcQL+mgE6y1QdMfipyo6ldHZlXweqT3K
	 ELNGN3CACT72YuWyLCVJgar6aFlVN7wxoa8URKTySxV+fpdf/SC2ARFY/F5wePsRSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXntOdJ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCR95iZL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15760A2601
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F15760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXntOdJ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCR95iZL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2vJP077082
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=; b=BXntOdJ5XkVp8UT9
	7xS/6NWU1BgmZ/iXf5O1G8HA5eohJdXJuJ0xVmgpthCTllBFQrsuHsvSPg9WeAX5
	1YHaYSMQQW8t874bYzsSahIVBCY/EWgjMf/NqQEynAh9pOL1V4Gj0IL69nAep0vC
	MceTOSH4zvlpDeTszzc4s+9Jk2xY+kGZLOPskI5ChUKkgmJd0JFKJeCvrqMeX6EJ
	47LKIf6OIdo5tmPs/uYHpM/nKyov2syPmUIJjGEhk7Yzg1jicxMJmjcY+DflsEwJ
	CDkZVfirs9WpVkQ8XcXIoXFpAnqcLXIwVmgq1NogfAychqD+cHcUGDwH5TFGXxRB
	AAgTdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r1m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:15:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so6695611cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618147; x=1794222947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
        b=FCR95iZLnyJIbl4bk87LIlRphqiVeYDcWDGZfPVkL8VqDLw6F7KP+Ls5vkfvLJyR70
         6fWpCrgd46bdB8Yg9i446kD9GgvDjLN38Xzes0caSe4Ram0SUhJ9EB4sZmA+0lUWd43M
         JY3zjccmh9yiIupW33ubutrQOXvMTCUWgwGV4wWE7FMNRqh6Q90NLH85Tmr/zj+xckYL
         l4BRYB6ARL1WubK6NljR1jKJRhOJYvrUiAJ0vEWuV7x8xB0DooWY2HsQuvGSqEQto1R8
         Xrl3tu4cGcOFoxsXXLrSTRioT2LpWN7wI4w+k3sjVSa5Gt3Z0wZvqCYchSaI+8TvyA4P
         ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618147; x=1794222947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
        b=pLCr5U8O/x623EvhyDEVrpWxFUDUk40Cn2fzsOgcf9l80mj/PIFZGjOmzFwjiN5hoO
         FSY5LHP3YBeRxrKncDiuz2QZjs6+IxAeYAZ5JB1QRZ/zCZPKpVhV6ytwod6S2zf7b8De
         9bwDh4A9uu9soaxy5lGpG1SQrPy5Jht8DIfYnjXU7E+nDxENdWLw3/PIgICapzfVLleN
         A5/4YUe4ZfGRUZGvuvm9yAZ+Sv8X+28BdwGyaVcYsCH2hjQPNx7VU5NWb776UrLmrmuk
         evp57IonlWJgcxVKRsigRWRtVx2yP89BnRmeP8tfnu/xQi+KmsqWj6FZvWTSkVtTltcb
         9VyA==
X-Forwarded-Encrypted: i=1; AKwUvBwrencW6jEY1fDf8Q6HyTN8fbnXtI/DlJE6JhNTHais/OTHA+EGFO9eEKd75Ax2xIQ2cjJ2q6nnceeOf4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzyfXNOiAc/QEyaKDK7/uoBWB5rCBA7Z01gnlL/P/SmZaCHmGw
	WfxTMzbBL3KAVGr0X/x4FH37jJDYDSeubib5EtDa02q3sMlDoYYyCv4GLpyPBRDy47603WLFKKa
	ra3Zj6eEU5ZzwbvIs1EwKgRitxDobl+kAlSXD1ZCOiq/fXbQFNN3e2nlvdVWyfjDMh0E=
X-Gm-Gg: AYBFou0G2j9bCh/9lSi5OMHJA6FYUwTj9A6ozTm8sLTucEBNV8mxkioJgfe5fidEIQx
	0pyLdFTpfL7RcHnJ2ImQsmsHPqPayU3XHJ7fdcNLi2+z1+NBghbumx0ocIwNXBNWeq+DS7Y3Bce
	DyWyMvhwxV3WbPl/2fJHYNhvAdEu3ONtI5aJ6AFXu/84jOf8XMF89ej0TC4gsaN8t/qbEGCeqrS
	Z91JytBRY60mTUY8ZE4pCEix32r5G81IYpB6kwVZwhUEL5nfMFxcBKL9dvFxyruovbUlr+eOeFI
	nvDk0HxSRwmYbdqDmBkfwfRcwiTNYRbvaOqRDlU6Q+fYfW7UaVoDSRF9O+GcX3jqzHD6qOk0Pc3
	G3BzfsVGcfodhT7ewUw5S34HKe046+md2Dd7Cmw6aeIoBeParlboithvZyG3/rT4AOvSszKU=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532192885a.4.1793618147169;
        Mon, 02 Nov 2026 03:15:47 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532190185a.4.1793618146747;
        Mon, 02 Nov 2026 03:15:46 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10081sm378131966b.42.2026.11.02.03.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:15:45 -0800 (PST)
Message-ID: <ea962f7f-b06a-46d2-b6d5-f3c1720551d7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:15:44 +0100
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
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix use-after-free of work
 items on unbind
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX+Qzze3pIGJpI
 KMm2BnTSTtHzvaGwZtsdTOd13L2KbEaRY2NTyopvc1YCMdWcvUwwgKIAeNNZTGAFYU0ZnQe//Gc
 QTZ1+C8pyVKzlK9k2V/jnTj3PCJZ9EukIrR37NUJE1dDiMzFFWja9dthSSws4FLLrnJpItkyhdz
 lteKp2yFy7P6EipiQ3WLyh4t6ycIpQmFoFVTTmP48eCgotLJTUKR9Fh1pXVcfgvruJSzQ0rK7X5
 ddEq0NcfNmczZ2HvlgLfNuDs2vRVoxu6jo4Uu/cKAb+icG0+ALazrC22oWkkCQriYvEohvk4VSi
 RcMmpV1fHfQ/XCyyaq+Q9pSquON+gm+3Kb9ynqLrocf/e1JYchkhatquKuN4tQpnTFvaBi4uLLX
 1Nsv5TLhgo3w/QCinUdxxmNr8wLSEoymAouYkmGavIvxVJ3wqbNwjiwLOMSyJcpJRfaWt822ogk
 9LJVBt07BdibC9amciw==
X-Proofpoint-GUID: ImeW8jUQNHThFf6cm2ZrfKunnD-3cnPl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX4+0w1yPfXHk9
 F6AMZfWjyJvqqzDiyOTfhRBDN/5mLInjgyHoqFKbGCuByDgyArv2c6hZMRWuOgzmldgMnfpHcMb
 iJPizRMQvnRgBv+sNRYUqP3TavJtwxk=
X-Proofpoint-ORIG-GUID: ImeW8jUQNHThFf6cm2ZrfKunnD-3cnPl
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae870e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E2KS5iVw4tJVt3xiAdEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 11/2/26 12:07 PM, Abel Vesa wrote:
> The altmode context, including the enable_work and the per-port work
> items, is devm-allocated, but nothing cancels the work items on unbind.
> A PDR or GLINK notification can queue them on the system workqueues, so
> if the device gets unbound while one is pending or running, devres frees
> the context, the typec handles and the pmic_glink client under it, and
> the worker then dereferences freed memory.
> 
> Cancelling the work items is not enough on its own, since the client
> callbacks keep queueing them until the client devres is released. So
> register a devm action, right after the client is allocated, which
> disables the works using disable_work_sync(). Devres runs actions in
> reverse order, so on unbind this happens first, waiting for any running
> worker while the client, typec handles and bridges are still around,
> and making any later queueing from the client callbacks a no-op.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org # 6.10
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-762f89d1-07b0-45e1-9557-bf643a826aa1
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
