Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181C49A3C3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818598; cv=none; b=RNSNPLGp/IMVjdEeuzNiP0p7K9AOGsX+skLfmKw31OwZIta2YAOZ6+8QvRD+MzVML5vFUgjzAsLlir6gPJyBp/RaZQO+oqBNil3SfDgD7WsH7wqNW5IB1dje3G1jRvK+uMd+tztRiArSJHPgub0VWj1MCESYRetFdmz1AtsRA6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818598; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPf+tr5POS6/LJmywAKgNL7WwqAgjbC5hMrBQAWOO9QiMPaTK3rUi6bZ6FWWtiaJER5I+9CmFdBcmxTPDn55hhVWRwrvllWTNwBhp80qQYfsiMl5iqZ6WMPHWFHnJS4lVX4OW1y9DosrqznraZNHWcosYRpJgq/0nGH3or3q20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhhYHCwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0x5pe5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhhYHCwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0x5pe5o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Al3292283
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=bhhYHCwfiJKUic7D
	YaegtrCdVkBm5Ca0kuHxCiwbhCux8Z4Q0BjSiDc6OQlqQPw3PTtRCJdTsOtt5HyY
	GmvpcUazJywS9Huz5AnUdPIq+EfH0I7Czc6OOOqtmrSG2aBxLyTPjSC6kn7gQCCc
	Qq0qlOrfbVUW/tD/MVcKzGrxXasUTDaxbvsTvPLYKCVX0uEG0FH6sdNS03X0j2vz
	hJi2Xz0xVQzs2Y2pHGbkiFPC6Kz1n1XYETIsuC/M9nbGUSJmLT5opEqWmvEOmER6
	dXCWrVndxaoFr1D84Hw5kan6HWh1bsRI2DQg6oKLta62QduZ4iZEHcMVcPynPn0H
	mx8v4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso22029185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818596; x=1792423396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=U0x5pe5oI8mG1AgE3ABSwsCmYD9VL0QmlG1Y4F+TVRQNC/sw7PzRdpReJLx5iytBBK
         vmlkMfXFuEPnsKSsj7kmtqxzvsHTI72PFBN12dgOshShiSCvdZbrcFZOJ6Y8jwMr4v+o
         3AX+h75tzhg9pVyrOmHcNGeLsaxG4BXlk/zgXg0cBDqzGTSFGbRaej3NH5L8nVdasvmj
         DrSK2xJ8PXXvw4uQWAd5soXF+r0OIgLMl+9yqq0XoF5t2+m4TP6K21nYSFJgg9Rt7pi6
         RFMGqLs5jT1nDBvYsR4D+SHyXb9IsOOHzBiRGseLuopzzV2GKo/eCxW4nUM+hvNAzClJ
         m78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818596; x=1792423396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=dGg1TvlwzW3czWbt847XeO8U5eqPJJ/ew+S9EWF3yVjDNaCQOAT6DijPLE11LmJzP3
         G18k1Zi+PV14SniIMlCCDRX3zAULKvJMDc+kiBkMuMNjZmviPHEmyvRVysToNOMr33lC
         1a7HFG8NUkfZeIY/rsd2L/Vo5/sp2JzsQYp7r0XBTvTkxdOBhsA9r/4F+ohTfo+WGmqv
         em23Tx2Ysc8t0bCbcN5+RfZ5h25v1zbM7JjvTuGl9ArV+dMx8bjPzKBuK0eLFpObA5GL
         Oakuj054cMBgpbGgJfJQbdJFjHtHVNqcFFwwZnqmF8yZ23dXAyLEQzcZ/kpH8S4ZZH8W
         /mNg==
X-Forwarded-Encrypted: i=1; AKwUvBztnduN3lg2/548oqfFbbMjD41Stwa1GYnrz/AEI0K0lHBukWb0slqCGZXfyQ7nvMCvKHvqdAFN7EG03qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHK8lA90aNX/hRvv4HR605NTG8voEGUd8+gQHpmqQqdNbpjsKL
	XNjVxNuQC3W+CkHFfaLOG9X5GKXEDlt02ovbmnKueQXx7YKXOsV2dugiMxpKYZkUMBhERfZDFe6
	yWHtBJunj4fAn8TS4HDO1I3J8h4iI6Sie9dsh8cbFkmQ2mE1GFej91fn0/QsL5tFnAGw=
X-Gm-Gg: AYBFou0VQMokpnQ98UM4SELM8ooz/ESppgiP6NenSN7md1HpUvaT0JSCc76LX4pAneW
	OJ9oitHP60KS5t1+LkfyWxCzMeU/l7DUOL0vfX8+c5d94CGgdnhX7pCoOtImLAcKQvWIzK0H83T
	Jt8klWhImDz5N16U1C3uDIJslA/3XG7SBdZpqatnDJdPHMzZvJNiDpOkG/ZE6FpC0YEZYlRs/hp
	6wRuQBeLtGmH+IDTSYI/JD3sflHZtKC8Wc0mijt8/nToRAUbWsGyqvUXkSM1ePeyVJfOgo8M+Zh
	7/QjzPyQi877mdrRtCZ++H1tXvxZItdGU5OySykxyHzqH3W6onlAz0x2+HUJRgLqnAAkwIbBOyY
	TDcKyptMI3Rwvq3LDgav21A==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1990277385a.1.1791818595841;
        Mon, 12 Oct 2026 08:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1990272885a.1.1791818595394;
        Mon, 12 Oct 2026 08:23:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm476153466b.4.2026.10.12.08.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:14 -0700 (PDT)
Message-ID: <ca8d0e1f-1e43-48fe-a2e7-14fbcbcd22fa@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/38] arm: dts: qcom: apq8060: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <ef0bce23540c24088526af1d686287d74e14b67c.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef0bce23540c24088526af1d686287d74e14b67c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX9Fqx9NRbJD6O
 IU4fTsUZQMjxsMgWFQQlIQxgre3S602wMUcQH4H6V5V9KRF3Vdvy+eKOy2EqiSlnfayY4uL5AkL
 HsymZIuLrovM4RD9uMRXRljGSD04QD/R9bcpO5opVcBsJP6Hnw4Tj2e9Mp7eO3S5f2IcAYgiGVb
 4kxTgH8ofR6SpMsILq+73U2BJjH/HhxA9cY3iSDcO4Uo6Qk9kTFfK1YpXLiwtPRIJl9tEFnWOt2
 aZkFpG/WQDA0S1BgcTziyasd5qABlwhs1af9E8uawRVeQ9KPQwmrFn/xdxDut0qBbipEh0gVav7
 Bp03HJy+Rk306URC8iW7xq8K2fVmvuQnIt43zq/Yh161oQHZufrk+5vgZTM0A65mX3tD6IFYy7K
 Vfq68gD0vbIt23WO6kUR7vZXU8kBXX32sNpHSegRHcxZpW8rx6F1NGjESVHpPUR1aQO04Qq769A
 s2PDevy7PQwjFCqxn0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwv21nQFwmxBa
 qdc5MqcZvXUkdGiq0VtImSLEoEa5KtKFkkXPzIxctQluTskct3bAj5C1c9COTsEx2Xod2JOrmrd
 2jmXZjJ6oroj4Mf8ZTWg3gs+8YLT4dk=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: B9i0Cq3OKORi1sodZDZxjkrqmk8-aFCY
X-Proofpoint-GUID: B9i0Cq3OKORi1sodZDZxjkrqmk8-aFCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
