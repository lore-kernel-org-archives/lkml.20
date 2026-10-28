Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183126;
	b=ekRBDefC/mH4/Faudag5NbF4R4sefTTAMnXCdBALbeWTf1iqFQBMddMLyBeSUgMInwH3
	 b8Bk2Xw8/9ZoygFDKiEyXFzsOkFcwj0uZ6e2UPlfE6xqSAuWfUnFNiurB1bQWIY9W9TZG
	 iLkUWbqPQFO1A2aB+7UAA/tAk0v8zT0fVzonH8cMPZ/HXB2bi8L++paTJ6zSDms5TgfXv
	 upglsqjfxFo/lgXQAcc5n/lNaQ9Dq2CMIDL2r6zUt/FnQ7uGz/g1setoHTBO0eJi3l4DV
	 A2HV8/YBPfnaUBwguYii31HoTCsGixVrhMFBXcHKAKdGZv9S7ctix0y7GcborRWTNXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
	b=crQddEerpjtcFThzAz1Hs9H0CGrE3k4UAJxYnOaFdCpZ5vZERwF6f3X1s7Xatl4uIHuE
	 SzhtpJDxcvsVsBRNi3mD9RHbcyt3xWpXBwbZVZuzaDFLYvMblK3Dcjl2vzpyN6pHhKvKs
	 XK1lviBVIHieBqOtH9ylKj303UgPQtAaRCPNjGL2R/D8SB3kIF2K//K8hHdWS71KWtIs0
	 c5HVg9AA7ybZdZEgwYUt7uUg0Xgthcfrnh0tGIAWdq5WnKOuFoU6LNyTk5kuDQZMtIeWk
	 5sByfe9bjlihu7vdUDUXnxIDTyd8NsZ0kieEhRAjeAPzuJu2SWQGZQriNgsJFtcXyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KNnchJWO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDqWFqDW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC733606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC733606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KNnchJWO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDqWFqDW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9Lc253430
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=; b=KNnchJWOzM20typn
	qvk8dIaJwseYSglej5+f67IZgWBKrMvqFnmpGZWwMok0sKH2+QBHuS+pg137z7O6
	LKR/GrxUQduZ6O7+g1o/a9h0aBuXmkzFiJu0hoz5eUttEqwskRc5vNUmrGhNSfqE
	deU2yRoPWA7qdorwZaOfVrGJ0THo4VOXzaFFfkbT3+dYTNd7lDmr0ltvkHS//+XF
	ekeAeuJJkk7NWcBHF1ZU9Z2kOitHzdK1JqIJoqyjfkVHpD3Bb+/VE3adFCucwPej
	2cerc+QmOTapsLS/L0tiCKtpYCmgttKqh+QLh03o9R1o8W0U+/tMZGk2zMURgblH
	HGomnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1yy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so134950585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183124; x=1793787924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
        b=JDqWFqDW7fioWsqsPbe/+4U/DmnQZWmHobC7ig97W8pKnAP+zGAKKY80kaRXx6RdK4
         tWESpB/Y2NwJEz4Rtrx0oiRu9LGgSH0NOUtveBGwIMnwXgoC1W7rbf4a3LMVKBvv4/+a
         yVuNCGsFXi8pF3MLYBtWAyd02D2daSGY5pUk/Lq9Y2HAHWoOwpUKnw5UTwYCVreNA46i
         XNqzLaXwFa07Std0tlziB+eEutClI0RJxy/Kw2tpwo9lNK/EmNuMxmBpPDL+xO4p6Dc0
         cl/V3mhzAm/oPBTVMexQ0Nl+VoRaSTDgM8cfyJZkhd3uiuXbQC2ySwkh107giDXMkUNJ
         rV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183124; x=1793787924;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
        b=HoJ3aIKziIoyUNfJvleiOe996UFokLKipJ4piAWvUQCr5EuTSYlDSN8MwEVfZni4o9
         hP+8Adjn5J/38jO4aPtCKGqr5Ad5qm22cxaT9dcr/dtmInztbM8SK13MF3H19L6T8nz2
         Mg3U/dr6JSHZAXEECIywl0PugmiBR+UDINV83sM3CVZtuVnR5cOv2RvIcOG/hua/KpL+
         JKmfJOLlcWaz4zmbqSUoe3S1JLFMk8DOgysWQbuJkol7rIdfsRBe+SrTdAq9QhaImLqF
         mHhXbP69dlGL6MNP8uvX6XWBFdrZNnMeq+PM6ao4IaPaa3cCCaWysMterygzCFI3bf2x
         GBlw==
X-Forwarded-Encrypted: i=1; AKwUvByHWpcobu8IrUgApIkzbiobwlzt7vxkbIphZlrlew77ouS9l3pMeJ2qzkwMHfEFx+kfrFDQly44QFX75e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3y6tOs1cmsarc/SvyeZ582mvw2E1rfrhKeKhhz9QYQwGwYsQY
	vaO+QR2fKeDoaHrZuYBjxnEcIjQLM/UWxbl/ItYhAAWfqD/ILbEOvkBVGNVKTnMygbO8L/xLpkT
	ASfd4UhCdTNSNCJaNAXcTH0hDs+3ddHmxLL8K7mZOIQWEKOIKQTGf+QeDiCrYd3VA7B8=
X-Gm-Gg: AYBFou3Qmt4OgSSc8v/CoCPxwNIqHlTg8NnH2FdQyQRB44R6EXG8kMUm+LbVgfbSF2C
	xbK3O58EdDtW9+Z+1z0M2goXc6iObGuJWcC8gQ+t7gT2O+PzsS6KPfjoB2cxtsjBypd4F0x+2AD
	lR5he9a/6iiy9qnHAGEhWFh6PcY26s42Wfu+1VvBGdFTLCy0Q4CjMlur9/9EyFKlqjXgTlmlVGk
	1F4HbaHPzCzmWDrCAiFo1HhoLYFmX6Qx9GsU231TtMQcsaqHKlw+xd6vL6Gjd8vHleYPrLxxmij
	Hix9q+hc/zJiOfpjr5TFnlN5XBycqr9W3i1OKqrtsnxDjy3A4AdCi0EWIMwCIDFrBFVAt1cNHes
	SzR3wJscZcIM/GCwQT1E3sCvagbDP94dzX5U7Zuu2ckU7HeNj5QzJg2MoY6VzSNCsKJ2HRsYwwa
	c=
X-Received: by 2002:a05:620a:4686:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-94408c949ccmr235476385a.39.1793183124067;
        Wed, 28 Oct 2026 03:25:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-94408c949ccmr235473185a.39.1793183123394;
        Wed, 28 Oct 2026 03:25:23 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm593412166b.49.2026.10.28.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:25:22 -0700 (PDT)
Message-ID: <09f04f21-6200-4db3-93f3-0399259982e3@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:25:21 +0000
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
Subject: Re: [PATCH v2] ASoC: qdsp6: q6routing: Fix memory leak on probe
 failure
To: Tang Bin <tangbin@cmss.chinamobile.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
 <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qgHguUu4hUsiTryoWv74-tfoobwKnEar
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1cd94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=tTWfHTwrCVQG4aLPPI0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX9t5R0gRVDnPr
 FYniW1pOs/S9nlBxjPZFJ9DioZjgu6WrgOt07jetWttGiJMnV0C7Ze1mtXM0nXgH/mvyTJUT1YD
 qpun3F7OnIX+bB9tKNTmBZTc3iKoDIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX6OM1ocMAHoJB
 lGvQMu9vPey3E3KSE0aJKRKb5E96weSoLRR5iRi0TT3aLNnBwRBGPUYPQWceEgthpqgU9byXVLz
 4doB6dlspz51mmtTyTVLpbZ7IN+hs3Yz2kpTMY90uXdhzJX8d06Opl+B1qtC1FHl2PKbUjIoAhr
 b5RV5+AaRKqfM/CgZC2JTbDytYCwstf0fhQifqjev6QJ4GXGUpJR71CFzF7FrHocfRUFvbZRMDw
 VOYvCpZTvi3qCK44ksRNhI2q9jRJjltr9Tf9Gd+v64D48N/f9doEuOp4ZIBvu+H9WXkxinBE0Ek
 D3mglbQCIFiZb7wMRxcPBLA3lQdQQH7GXS0Z/YX2BdQo52G1cY0c+Dtc+4YJUh98yuy3o2OUTaT
 tFipdHmZ0F1Zb3HiQu/WAs8v7F5vOH+XH9vS5RWAl6F18d2PQrKFD3RimCYjScL0dvlT4RKpBQs
 u3nafs6hwYmz0jmezpQ==
X-Proofpoint-GUID: qgHguUu4hUsiTryoWv74-tfoobwKnEar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280041



On 10/28/26 1:57 AM, Tang Bin wrote:
> routing_data is allocated with kzalloc() and stored in a global static
> pointer. If devm_snd_soc_register_component() fails, the probe function
> returns directly without freeing routing_data. Since the remove callback
> is not invoked on probe failure, this leads to a memory leak. On a probe
> retry, a new routing_data overwrites the global pointer, permanently
> losing the previous allocation.
> 
> Fix this by switching to devm_kzalloc_obj() for the allocation. This
> ensures the memory is automatically freed by the device core if probe
> fails or when the driver is unbound. Consequently, the manual kfree()
> in the remove callback is no longer needed and must be removed to avoid
> a double-free.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--Srini

> Changes in v2:
> - Use devm_kzalloc_obj() to let the device core manage the memory
>   lifecycle, as suggested by Srinivas Kandagatla. This eliminates the
>   need for manual error handling and prevents a double-free in remove.
> 
>  sound/soc/qcom/qdsp6/q6routing.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index d076c99f1..4816d4b9a 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  
> -	routing_data = kzalloc_obj(*routing_data);
> +	routing_data = devm_kzalloc_obj(dev, *routing_data);
>  	if (!routing_data)
>  		return -ENOMEM;
>  
> @@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  
>  static void q6pcm_routing_remove(struct platform_device *pdev)
>  {
> -	kfree(routing_data);
>  	routing_data = NULL;
>  }
>  

