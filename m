Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583517;
	b=3Q4DqwQSQe2/KQrb8gHKqUEoziLNjOSyZ/XsU7In4Ikfs581kYHpEb5MqwMX+wz7fa2R
	 tvvgkBAkRhdGHoWdPnJXx9zECi07Vx6dmJphDGKfNg3wy0EQKRfrF9cT7NaSBqDuqfP+D
	 wOlDGXOlZbxpFfeMAo5vtIhsy0tnwvEwOhdHx+v78q+64EsGCSd0IjLCeV6JDIw6geEnB
	 W3M28ru346vrbW3rTUMbMLJX6WiCd93PUdQ7tHZw7QG5R/n9Tuz+Nlcn4nxQRF9ST/7Sf
	 KyAW+VaSvP8oM/7uKrh1WTsSLzZ9Mif00KSJRcffmTDgEbFVL5lidILa89Hw+kSLGaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
	b=XTtuLLcz/JKBcRM+ihRcKyxbtG7qSlAmaT6B7EWFjyZvgXERzkxTh5uJ3bBBBfXlCiJj
	 Sz5SSsCf4Xrxn3s/LbO3dGN0L23rWvXzD4ft86icxVq1qy0kw3p54tXivHRzqQAGYpCxM
	 QpDQy0TQ6S3s8ZhTkEplaEAQNa0saGhbwbF0IZF4me+aoss11LHqX5dIfArPlXqfKG7jp
	 Fj3NYSAPYvkn6ZgDJC1GF/beejHA7L8CCnNhAThqwYcu5yu6Qh8OZXU+Swb3w5MUZLoEt
	 GjBZIHgM816Q+8SEmMciBGLJ5Z1NyeuRosnfe0g4lpgJdlirEwk7A59yOA2RITZPJAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hK9GwvAP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EAB606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EAB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hK9GwvAP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg4uP325091
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=; b=BlhaLsB8tV1S7WHo
	mFG1BNvflm0u9jHBOpjQ9dK24lk8As4RVKB6HBvefgkPRDkgd4s+7nEH0lnZw/Eo
	g+vGNP4oBbJevgXHilXfN8jD0jJmfSNXjBQrKoz62+1pF1q3yfc46Tq3giHe5Ud5
	cJ6sD6jK8A2B2+689kjUIORvtGB5ZUrUAkqb3k4Y/bIHI2NcAMLycPze47KLQDA8
	GQQT/RRDzzd7t6I4jiQCTnUpU0vUOPenxglCglsYYJRPio4+ZqjCnDcF0wNenxNC
	gWQ/sh8SHJ7EIyHjVW4dtS2qaZIL8C5iNpU5W6D+kQtas8mXiqia25NVrWpw77Ox
	A5pPuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3srg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:51:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso6234685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583514; x=1793188314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=hK9GwvAPutuDUlcKMhG54fnv3K8te9Zrts8shDVnHnFPgdJHQfY5T6Fe3PzKx0BZaB
         Lpgd7ex28O3X3DjiNpyQGrDMiroA/GuTMWwP1mYgyCaWnPusLUSbJwyKP9nycdHezgd7
         P/0+7i/z8oJoWb9mCr4jwgm93IZ3XxowXSoHi1WQHMazuX+3nNQaAiNYY9NTqAR5ywae
         vIhFU0O3z8PjZ2BLHxcKu/hrf48/z3S6HZR9ZKsfpKX2WsKCbHyKqgu5FYCg+tJbzYK0
         I8UOrzcd3AhEwtBcx0RqJeeydQQtF0y+VpbTtyszV7sBC5zgG8dTTpf8cBxXJKCnopcE
         Aipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583514; x=1793188314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=oQUZh/980vJBopz6b1Mef4S4tbXQSdfMUPMfqok9Zjb4NA42fs6J33fOCrzzGbEqo8
         /qadwWNp2Ylglhy282tpOW1xJNIKWSvYqh5SrMZQ881jnkQVZ2KLN5tFZm4eFCpoIwyN
         hFlP4YtfiufZ1aip0M8qq/Ebj6OtcltRuQlv3e9yywr+UujlXy5tHArHtmuGmOiYWTJ3
         UROsubbkR67p4f5IX89/cmXsWE2ZWTmvOEEG+HkFY2k1MjXJCKYbcvWjVxnm2c4bAUY5
         IfOduLmXXnn0EiThijuIhhBS5sMENcsD9E/8vzYXfxYRe2GJGO5Fqst97RPHt3/h7fMB
         cojw==
X-Forwarded-Encrypted: i=1; AKwUvBzQBQV3JMyMN3SJEKDJPiNeUF+u97nkkWi9FXbvRUNtT4ZKlt8sWGdXLcSJk++nTD9uQWtg7jiVz5hqEts=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1xz1S7rGQv4a/kDDm6SFMGZpgMC0bjCnYlCQ+G8BHTNxcQvEK
	6wbqRvrJ1sV+G1GA6NdP02big3mMG5DMhKGl+Y40xxNuu6DUpearQQtufeF0iqdY6aVmkhu7FbE
	v7BRWK8gjT/skF2Fr6Yn5TkoLitQTPV+2xNTdjNkOjjzc4Hny63jP7G5bUu3M1hM21Wk=
X-Gm-Gg: AYBFou1xI65xdOg9rYmFbRkxtIFSghozLln2XDvpWcW9v6RUd9CHOQaYZL4xJrEaW5A
	0N+MzjDO/3aNKA8TnL9WWVc4D5+Ak9cNUfF7jjyARDlj0yTQHbvZC1XfE9lFPvBGifFNN+TiKTJ
	fW+EVg16tnZhvuSYGa5BeYb5LgT/kJdQFzfZfuqQmVGm5NCqOg+vR2nLQ+U41Gddijr9FXLvlXZ
	TXtgN40jAhLhdHNSGJDZAVmj0Pkm+Ux2qiKLdmGpIASAd+tHjOUi4TpHx0Uizt2N4U3JDLlvqDL
	ROtAk3DXZasUs+0La98xmECWFVEgmNFC4k+hDshIqWplyi150nqy50GRQfnHI3aknUaHhnpu+E0
	YGyamB89GH+hET5qgIS2HYw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413685185a.2.1792583514609;
        Wed, 21 Oct 2026 04:51:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413680385a.2.1792583513972;
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77ac4sm69148066b.28.2026.10.21.04.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Message-ID: <92642c70-04da-4283-b25f-80369b788b51@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:51:50 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXycMRLn2owO2I
 Hkm3bRRQcs/PqfdMeGVlBKX/m5/VFV2NX1ulzpo/CBuKLEeC+ta+3b27/AAoGew5CMEcqrMjq0E
 ODyldoNdFc14cQvIncofbsPm3NT3Z9E=
X-Proofpoint-ORIG-GUID: 4b0pej6tNvqZ_JpoxzyfjIHTL8VOl1RR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXx8d/PVl7OOsM
 RBcasBuzS3QmM8wFPHjgHmUVtK1U1W0CPr93vh/xbthZNJT2nU9CqPgQ3hgDCcCoMsoFP2AHcjs
 EXU9cOY/TBiZh9wjZTAVKKGicqnvdpdLeMbRKRa4wwxuYkzQTX9aiS+pNdIrrkGnZOAAhduTHMR
 VAzkL9sqFoR44aZ8//VMudSiYg8tAWE2kY+70bzkzxVsPwg97/vxO0Z+69loTTdmMILrGWiNmxw
 cz0uIaCQfYo9oYJN0z6FT/WgyXTsxVRZYdABr69wh2St+P/vI4hvMbwi7Ynzy0ev3qy+03VjS5h
 O/NjBYBgPprfsvnqZG0FRaU8kr7sH51jJLYt+zP8ShBzaV5g9fIm1a82jh7nO5EHDT2fLbaqKye
 AFgU8x9izzxobEuWvrODqodEnqaEUv0rkhwE8oyQGC7j2zYB6Roc7SCcpuuTCrHKJBCK75PIXs8
 A2oTGyd5Cdb2fpoJHPg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a75b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hSA76YPsP928zEigGEUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4b0pej6tNvqZ_JpoxzyfjIHTL8VOl1RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047

On 10/21/26 1:45 PM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
