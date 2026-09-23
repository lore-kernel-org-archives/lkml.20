Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582D47C0E1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154511; cv=none; b=MPsLFhfFZLExc9ohjq4nWROMwQJ8zHN38Byt3Id4F8VO2XEMuDRj3zTvBDgZyyckE/+W1tZ7E7p5QzioWsB2+OGk1rBO2zAvESWtOIgo/U0UK4hPlGyF3BsUvXjoAtS7ThVttqE7Wgl0+cdwK9lAwzsOvOTa9nhagPXKuN0RQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154511; c=relaxed/simple;
	bh=hsZN9w/yBMg3XwXCPTH2FjCd6O3mgOb7hefdaLZK+iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/EygA3wJXFTDjZrMqMMbeeWbOzbNYBULBo//Q3ObPG8BG9yyZ9TxZhWkODNnKUOaibvH/ALPCBCSGGv692AZCvFWlYgp9vA3tI4JhtgJF+K83AH8bX3PepRfw7YqgaI4zqam4+DqFNlia/SRb7778uWWTnhXIQEq4EUQyy+7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPghEJGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjyy/0St; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPghEJGy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjyy/0St"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jr7Y1387799
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=; b=XPghEJGye7f8clxT
	2AKClu46dghCAFZ9pVrRzlG41dpeX/L0882d/BP8fen4JJ16ocq0zBIFx/WfmyO6
	ImvUWfZGOkpDvncfTDuLp9B8WrA0cTf7YlkLa8UeVa6T2t23ioJXsiFCvNdvLVvl
	mglsRomXbiu1ThJ/it0PQduLknBO1jsJeeK1LT7miKmjji6NlCSa5NwnMs6/WRC9
	QPZOLaliGiB2DZ2HYndIdOxwTIW6dmItZlnSp0hrOfyNCa4Cs2gYzmLzQs+0rK0i
	3/OfwqLq7IHarUtzCZgah4ANf1+i723LMyIBkL4vh38+4kQyvrMPPaPEaO+78gE5
	wC7axA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3207-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1637676d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154508; x=1790759308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=;
        b=cjyy/0StWj/30lfeFhkIaDFRmQIjV/LrMf4YZITLwRriB+YTACr4H6X6PR7ej2e2R5
         EWyFIh+DAlkqKHB6lj4P8x3lGwJn0w2xaUIDsJX4xDd/eiU3UZhSH7cQsq/7wlrDABY9
         knj2ck3yPrJdRnCr4v+XxNQrvnYyrhD8fiqG3m6IOmtLjuPLEzuI3DDj/YHqjNRcFGeH
         NNyD416ASK+9ghAUI/egIXn9saYJsqLBhQtW2QOIhak18gsTILN3qjrmdw4NrZvdancu
         p0q3g8OVuQE7iGUyrDt+gwloEE4omrv2CBkd98im83ITqNWv+E37Vp1nnSkhz0hHDsWk
         4HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154508; x=1790759308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=;
        b=lyyesvnD9fMoHYpvyJDj6xEkkZ5pS77TyGcgn9je4ioTxq8AwITGk2kxzErdNJCZNk
         sZ7dCtkzPZd01t5Lrj65s9zR87Fz8uKuETN0tnOzE7iePjrb0GpZFEbztSDH0LROeOb4
         1w8CizMusr65SZLdUMPoRa9foIuXNi9Q0sFA+8oXjvW+qZ3YSbHgtmXnEsjEKtRX0eu8
         aikXMsRVMcS8w6wFdUr70+oujNFI/vZ4u5I+rpqZtIKEu80SS4R9056haYI6CqF3IolM
         UqwB4kuUVp0gcjqaz2lSGSSlEQ8TnWUJhBGJ8MPO+3Bo5vaKDOC+hDWmMTuJP7dMUMCm
         8uBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHgTQcNTbs2pkszyXo2dVfkQw3Pglj/M8gQK5+nf5DxHt4jVPNT2efZ/mEm8JKRfZ8deWU+xq928plXac=@vger.kernel.org
X-Gm-Message-State: AFuF++kZZ182SVQyHMfcVXdSeLNjTx45MjtTgtJl6gAcv3EIGhMgOeR3
	QJny4kzPlFoXJ8WVuxp/aMUSj5JFRqyrLrTFmfIR0hNBfvPKYrfTogWLz1Imkmm4CnQzvKLEHEt
	gyFQUmurIDgSAOOurajPW2pYP7WhwHSXpYO8it0MpVKHyNOvzT+89M2WIgRLHxeSlE3ohX9DjiP
	M=
X-Gm-Gg: AYBFou2n/zfnrPgpU0IPZMLagLMAlH/odNI6WBfA6eWrvla8iYRgM2c6VL4wbqWC82A
	22kxJTLH1hBVxKxIsDeCWnzREcdDSu9YMQO37ieYj6OEggo5n8oGdnDGKVw1c7W5wdbYKzoxZBm
	2G+MnKtTjAlDChSAxICoimIDEZFUyivrhIxpOBsG1jyWPJE26OQDmpRD/Li0yQxvn7SsxFz45mu
	jWxy1u5Otuc9x1ATuyc3UeGiy4YOLSvX/sKWpSuoaigsQqE/S86GzUAPQ1sHnK8IGJHQlUSYsus
	xoM3velPCSoUfRzWN9i5tA10YGkCvpLzNg/yEgO9MRi4Hf1H9ucSGsKhAMhaYkOeLRFzXVTepwr
	+CaLgiYw=
X-Received: by 2002:a05:6214:5c01:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9140c50a456mr32390196d6.4.1790154508144;
        Wed, 23 Sep 2026 02:08:28 -0700 (PDT)
X-Received: by 2002:a05:6214:5c01:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9140c50a456mr32389946d6.4.1790154507504;
        Wed, 23 Sep 2026 02:08:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e5aasm1203497a12.9.2026.09.23.02.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:08:26 -0700 (PDT)
Message-ID: <19e6915f-403b-4dc6-a1e2-8e79c468a819@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:08:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J1-S-Ih3-QiUIPZpGJJt3r0KLFN5yU7r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9kU1Ih7I+otS
 j3rLyafIl/fa1CmidYyAiVjCabHVc+2YQfOH/bG/7v6SUWGUcFvEix5GigEqKKxq/xze6gyMqaN
 Bd9tBRjVwcqhlvNTySJDMQH5TrqO9GA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9UByU3xHAHmS
 x8P4as1Ayl+JAVf/vsKdAjUf+d49wM9gegsMm/HXiZZvTqUbXKhjV2Zu+QlxmOtuogBigHVyYax
 Tuk6QB101KylvNp6yJiQpHPJSR2jWk1IEqIOtyJYwJz8uKgR6zZT6ObxyCL5DS/O6MFSlyct1V+
 eUX4kfKsSWCvgio4kTa9z1BoficSudici02eoV4QOJeg1oyGEc1uIiaGcscXvFfUNPE8JQRzkx3
 /Op6oTdWcxVVczOq8sUk37lSrluGF1KJAx/f3x00IDODTA+Xyzcwy/bj3GwGUO/hFttOuD44vvh
 D9Wm5bbd5GLpFuFjwv1j9x8RFqFEM7Zz4T0g15WysmNRCHxAsk3qtyv6Gc5D19/7Fpy77EnjABN
 zUAfCvKjqFLaH96HSAp9GaFmzam1TtbL/ZvfrhMLw8xTCrU0lCwkVCswigC7QcqCjbgf+hPUqLm
 b4l5MH2XPi3vCZ65h1w==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3970d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=nvMlQeE-hM3dkRo3rIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: J1-S-Ih3-QiUIPZpGJJt3r0KLFN5yU7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/26 8:18 PM, Daniel Lezcano wrote:
> Add the thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> The keyboard area is the main thermal constraint under sustained CPU
> load. Add a passive thermal zone for it and progressively throttle the
> three CPU groups as the temperature approaches the 53°C limit. The
> groups are activated at 49°C, 51°C and 53°C respectively, with a
> 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> The cooling maps limit each CPU cooling device to state 6, which
> corresponds to approximately 1.9 GHz. Testing showed that the system can
> sustain the workload with all three CPU clusters capped at this
> frequency while maintaining the expected performance, making it a
> suitable upper cooling state for thermal regulation.
> 
> Several configurations were evaluated while tuning the keyboard zone.
> Using a single 53°C trip for all CPUs allowed the temperature to rise
> quickly but resulted in a stable operating point around 54.3°C, about
> 1.3°C above the intended limit. Introducing staged cooling before the
> target significantly reduced the thermal overshoot. A 49/51/53°C
> configuration kept the steady-state temperature close to 53°C, while a
> later 49.5/51.5/53°C configuration improved the heating response but
> shifted the equilibrium slightly above the target. Based on these
> results, keep the earlier 49/51/53°C staging.
> 
> Also add a passive back-cover thermal zone which uses the GPU as a
> cooling device at 64°C, together with a 73°C critical shutdown trip.

The GPU contributes much less to the thermal situation. 64C sounds
like a lot for backcover - what is the threshold on Windows?

Konrad
