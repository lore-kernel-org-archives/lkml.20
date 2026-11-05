Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866650;
	b=QiTNcYltkTCgH8CNaoN2E556QQLP6BQEqBKRf5T+CWo22NJnUIByUfcr7hBwhNrj0ZwG
	 3g435cFdG5uQuO19B+iI9V1V08qCXPKCJ+xr9kpjackZA9f8x3VUcGE7Q2Lv3ZVpgRmZs
	 Jp0GfmmwhB2iezty0GErPbpOBqRXdeJWgLjm7fUckuQ6sHdSpSuN642ltLrtXkUSeUEje
	 0b4yQyIrU3qCn4JIz6s9ReJvngQDhZOhMSw79PZfObcvUYzfJXIo/pUrShZSDsXX3A9U7
	 nnoWCihbKMYuPVxi7R8x9yi+ONAp9T8l35OAqPEj7n+baBxtaeF7/ZOhYP602kYfZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
	b=DJGo32cUlBfDfqY9WOeR3B1ANutI45VCM1TMks06nbvVAqjN7wcFqj0Jj0zGp0aPY69e
	 72PsdNvi7Rw4//tKLy3yWkw92065zb7x4hI9cUHUA1lhnNyEf97F/BzTinBI3fMzOnQsM
	 a0PTvZP9YVFinbAeEns9vnkosXjc4hY7psESjSzROQtos1ffTJVo3T5uKI1IPzhH3DifZ
	 kgRONMgl5yClXvleSWTNNb6jPZUsosSnYkstJWnV1AoOF1HBqzihzqcFagPOZBFIbNjaH
	 cAVHULo53kNePGSqpppumSH0ZBDMkriQtX7HpZ/V4Ev2TAixrND9hX/Wm8ZSV8ei2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5yEkUO1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWxloPAe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA92606D809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA92606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5yEkUO1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWxloPAe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V21Y2588237
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=; b=n5yEkUO1a3p8uX3j
	AmpIH1k4enZhmFn9bgq/EnLzLvIXZj3GwObapkpLpTr1qH4xdJubO/3IjGrGXD29
	H/DrjwtFdDSWNn4f4ggp5ZTq4j0lqMV+NQ6V/PGUPw0XtnTsMgJ4A++4a+PGImbY
	40fmVY4NUBLLo5BGW3gR/6fLx0kXmolH98Y3TrmeE2KHu/JH36yAK34I2V5AtMIm
	HSCiaxro49pxGM+OnVmzQX7TnlLtQXIpKGKJ3y1K2oNCFi/7sLQWiTMVmSZsKgkZ
	y3oHOA42mfH0Pic4cpuC6szq5cT/4D2qEqQ0rvmuy2uITDzqbSLFxe5tUKI8QqDk
	xz4VLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suf1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so47974985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866648; x=1794471448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
        b=OWxloPAe1vgJV2Ooner+Jk40SD6GR3OzR3mBkyYRXUI2c+RcbIXQiJBHH99SrKrz1p
         KFFj/G6yQoggke43zckm9+H4/ITM/Bw9CxtSRZLpP4RK4FRT5nnEjp0dCtdj+y/Pk3L1
         e1MDd1RPPFxC/a49zx7qvgqBOCXRh4HUCp4F6IYI1iRGgCvOZluq04Q0+5XZXWmNKS6U
         5M55U8i9UYBMMJV5iikeCvZp+PXhcqg2SFHjZ7TEfuoP5oXMhPVdMwpIKIu6fqRB/ix0
         AT3di7OJhT1ygweT+jSBOTfPY7WjFz/9afbuhH/FuaSqSLF75GXzRe+xrkrXdnfesNtL
         8l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866648; x=1794471448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJGWFOkAbAvqtC9ZmVuWCIdXA4sNhgkQh3qqt15eZLE=;
        b=GPZEIkFAaXOxkxOGE3Y0BIp5rc1gOD4L0i6IKuIeO79o2/XjzPIfeJ0hW9BpwmRv54
         32SOyKfwRgh2y0Byw4+ZHdYZKo5oeEtKXMex7TFC1F5xKtXCMaFC76vYbP4mpU5zPdr4
         9kYd5qD8VxcdhiR96FjvUb7Qk2lKnzzvLX0B/yAgJxahrkPG3AOLHuBWMJXHxxyisova
         P96YLjLabBYTgGL3mO+vopLmS6kkhvBYm0+T08oR0m1/WUiaF1w79SSEuY2F1dX5LNBR
         BgdHmSJGIafaO0Vu28SECjDUFGnu1zoFfKO2EdubP+u1C5EtQSZ0vssK0gBs7o7h3JAd
         +hGg==
X-Forwarded-Encrypted: i=1; AKwUvBwAjZWkpwkE/ddHe/aRV0buHdjbQP93QId9P5Fb/nMFeUTmhYzQwFbrfTPa9kIKgCu7WnkRKPaomSxd1SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PTw8vq9UT3QTxGnnRnPmATJ/YWOSPGVTXKJT3B4Qs2OQcYn8n
	3eoOcYfrZ8fVjCfIYo0A9nE91PvpgsoRKSCaljf4MKtNxBmm3/VkLZylyMRBJRnlWr55EPivN+5
	smvvBCi471rYeFIJyp9s8pzJ2BH382s613KZkupVDEWrZrKawCaS3l54+rlbAa9oPVyw=
X-Gm-Gg: AYBFou0TSp5I6z6xHz5kjaaDPDsRUW5K8JbWC08FxThmqdjVeRuHfSLNlAU0879NGNS
	wysdTWCGS7UuIhg0OH/8Je58ra7tS6TIBbXeKW0JZXcHJc/TitUFxx2oOCqDLD3nUv381HnkW8R
	JxUSc3kLOQEY07aF14vsb3DR+KAIlb/3exQ2EZ/ZQ4q81hIjXSZKUMfsxwyKZRxr1dhglT0mJ7w
	X3pqZKlbP9aKu3fn7og0MpOkJTPgvSdJxFdrOIYd5FF3ek3vLTqI6kPzJA2ad/gISkBBu/YEkLt
	QVU6Kr6X4QfQkGbbZPXlw2Y6XhzZ8QGF5aLCWETSXuCZUX/AJdCp9AFqJ6xVoUTG6UD8s2Qmxvq
	Nwtxwk1uf3hAtWo/6yw9iREGEghPp8g4oekzShN288V6CRFmhInFt1bEksBgGaQG88zoC
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr3088643385a.4.1793866647974;
        Thu, 05 Nov 2026 00:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr3088640685a.4.1793866647490;
        Thu, 05 Nov 2026 00:17:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4236basm148809766b.26.2026.11.05.00.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:17:26 -0800 (PST)
Message-ID: <b9bc095b-e22a-4965-937a-0e4f9543f874@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:17:24 +0100
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
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR
 dereference
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KGw2FOoIBXe03awAc1Hyv-H1c8dhQYty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX4Xr9rwNBAtf+
 efESEX9WJnolS+VBf0uTnirSfGs1QQzyBTSJjlj2e9JyoHljKuNRdg2GO3s8bMIRqdSm3QITamL
 ESUhZa858pGbvBBzFDaHmpC2dkiopy8EEAbwU6phrLaksSC10XO5qRiWTDbGO61hm38BrykMwQy
 JtziMqUrt3xnjnXzsB+TaxcRZSfFDCxzHLjDw6yGV8n4RU2ETQUAjl/ghf917vTEwcJn3nMWjy6
 5v5eU8+JmwZ1mKNepSZgoWJzYwyz4gYHwQP9XETOCwmwSEKRWYfSj7+8kPynfzkXMAI0TYGX+M8
 fkvSxKiKZ9J1Io+FP7BcgG2+rV3So2Osc91w1mWfAFBD6rZqNcuj2aaw07Ss96iMAp3n4snslFB
 7f2T7Orh0TDx1LAo/B/HU30ahCSSA+m0kty+pOm0H6x8Po+FMw1SHWDnBc/RAq9evCfURS1DQNA
 8rnQ25g1bL9xvQZYfoA==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec3b99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h-WqzLMcamjAHn9wFlcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KGw2FOoIBXe03awAc1Hyv-H1c8dhQYty
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX4yiiLI8P7jJJ
 wT4QHwBdCx4chT/YdZ7VJ/dxCWawVqslTiNhH2FrLEkErtHsRLFcXa+IesWtcVa8oDzEc9RA/2p
 KcGpuClTAJO/wGcfT7DxXrnpAgiNFTw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 4:15 PM, Krzysztof Kozlowski wrote:
> cmd_db_dev_probe() stores the result of devm_memremap() directly in the
> global "cmd_db_header" variable and only afterwards validates it, which
> opens a very short window where a concurrent thread could access and
> dereference stored ERR_PTR.
> 
> Theoretical (not reproduced) race condition could look like:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
