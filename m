Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364904;
	b=xGK6J3/YJPjiItwF2+HJR6tDyKs/E0WkeE+0CIYdpkQ5WRCp3szPNpRzpVnYangq/kwg
	 ANthuFyasVkSpKNyvvYDcgy44asWW5QkSN+YBI/4Uax2jn3HrDOxdIwezQIx8clxhnQFJ
	 W2lglRvc8/h2JVG0uxtdr0Xo2iDt1J5scPu8p5r0i51nHaS43cv21DmAvloJrAlX+3KZD
	 FOlbZEMW1+Gtakik27S9qNJZ82mnMs70TkUkksl8Nlx8XpxO141tu9kJxBBdBYMSabwZI
	 9bjci7rdENbckpeeVyUrc4Dmz0jc7TYbGU2aCFPG+2CKgyI0gT6NcgU4CJV4KDR81Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
	b=lwv7Gm3sQG+lN6TxkKmZOz8kbVdkwNvL2JiCphAJEeYOzu8rwEPq8MQk5L1yp3UI6XVb
	 c0AnoGqI2pDVfOtKQhZiCDBPAGCKrBrjgQOqoj4ELObzkWcvmCaTvPgtZJUGXquTUexfv
	 6zf7nSNF0QvNUJpIMsOMbnXIMjCRSmZxy0BbbQNbgE045vsYqapJKI6xJxoTp89TcjB+X
	 yLNTtx2j45aNckWyFrPBVmorFoSRRXbSQiu9l91InFuqeQA+PaQzaxgHqqJCoELwKeD47
	 SfTnPkEqvepH95/wRsX9JzNSBy6j2Z7d4JykfgheTz/VTSw3wl4B8wr9EcTkg3ByQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG2JH3089311
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=; b=Aw6eZ0KzIS3gR3cW
	VB9ZTCAbQ1fxcmKH/a/ppSg3VSMx4p4Wkin3E86IIXN07ay5gTsPwkvbDzUdIHgn
	275yA0idrLaqaoK8I2iOjlr7YaeM2rN2GxdxknC1zzU8FlCzW46Y4W9SYvRRWJ4f
	uLAqkrLWBz7Apyu6VHs6EJvnSsN+kEnW6H2KS4AQdn/pD/dyColn5xias6Oc4s83
	9pG+YiMOi/XPjwUlpOgtLcfjrCTPQPMajGLtahTT2rYDkpY4VMbtz50Bh99YsQin
	+sNll43LNCmHktVtA+f31Od6FKWrDgG09HmGwDUjPx+ht//qyDgaqzHdsYRr3uS8
	Esanzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk48f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:55:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bf35c4c78so1703236d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364902; x=1793969702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=GNw6Eesgy3bBWKYZLCRer6+9Fl7NwwfXPBByPifuKwIROwUfOYUdBvRZ//qJ4sjqnL
         3UzVcj5WMICrrMR6oicxNVtiohU5V0wNf+eaWTBg5748iw21K6JNAT8V8spNAIEl1/Nz
         zpR58crhyiT7rs9mNVB9B4x5NbHaFUXYVvbf+J47+uFkABu/swCSxU+FDMbqHHcM6kxa
         P6/+r1ANToRHqu3MGGpf1McF5UyZhvPvnpGsZ5MEh121efdvUBgpOyHRMcPh4d58qy5C
         +du90RdhqlgDo8cmPvHAEeXF4F4eVLbVwcNRy/3fXWDdwv651Cgwca6KQgz3ZqXmsVqq
         ZFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364902; x=1793969702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=K6EZBMbB+9oSmkb0c/sAVd0vECemQlIFPZm1mpT5VymDi6cpim0bfpN9u5AAZ4nbed
         BuW7dV539CovXHPH9nkLe6Svsz9aH0bfMxuYPN77ijBb5laSBvbs+Rg/dznbRtaPm98o
         QePIDwaq5Hw7GrG8Evk0ygTOj2LAxXL2MKoW8I02v+zQVwltxQlRV1Y3aOZLwa+MB8AD
         VB3pw7YHbo7OHmnWgB2oMpJAgc7msB/jJJ8U5wuhOp1jI4BBp4EP8IMk2U8SVz4mNpFB
         2dqa+/F/Ja8xuMVCsz2CIhKJ3OSc9fOpDzfjqp19CkhGhMvuHtE++VfgdWfvgG494yMR
         cUYg==
X-Forwarded-Encrypted: i=1; AKwUvBwQiTk+Gaptlm5pi+B3vIlxbxLSGSfPUZyf4j2UkPvd33+OTOFDmfS5Aap6QTRcIBhsTUhoBHhBB5FiD+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx6gLCmDHaf8CioIkcLkEnm6t05bc2IW8EhSpbW20euMFw04Fh
	kPOLLKJLCkvfProHbmI14slQdSMR42fimtz2ImoKbxUufVRvhrOfdVUOb3A+paCgX7Nei6N0c6+
	z8PrrM3Cj4jaAhhF7ENsQXX6SbQKAccmd4qnNZETLr1zh9yLxgvkgQd/x59HiS9XEdyF2oNHzkR
	A=
X-Gm-Gg: AYBFou3kxO10GtkoYbM2vB8o8jzEmbn6ZGZVxS2FASlNP2cGAI1B82Gn1xny4pFpcik
	V1KUrEC9DNH8QWsaqyBjw7DR/0nBOrOxIAQENXR+m3HNvhu4P6IVorUnXZ79dQvW6PPedFY54Yo
	Csmdc7MIcgQyKRahZAQoO9VeGvX9rwDjYDkLft/tmzSh1CaZEfoxPj/EsCfFlT9otjD/FlP/drG
	UMBoKadH5pFsQYPkWr4/PAQZsh9qqN3czMy+58vUX30OGUS+qUX4qr54pN3k1uQEInGH2HgE6eq
	fKlkG7P+jZWCGl0SYPdbkg3OQ40atW4ByuWMXRd8Sr6BQfYQBSXhhjIaThuySegeK9wiP3FKery
	1+4Pjg6DiuZtnWSTt8wUsD9dHs9LHkg3tRJTZc+0jy8mpBhAekfMR3jG46YR9fS5XLP5aS0U=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372889985a.1.1793364901741;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372888185a.1.1793364901285;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc30sm63788366b.26.2026.10.30.05.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:55:00 -0700 (PDT)
Message-ID: <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:58 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VAaDnuliJpgNsVdwb7REf7iZhyeIYoVp
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae493a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LUNL1vnY_D6g04zkfocA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX201zzl2VeHMU
 VJCUjzqevr5G90l18kTIh0f8X3/b37v0VDmJfeztZlAm9x/c4Iw3qsn/zS783Nysx88GKOyaQFJ
 2G1P648mRltqoATuPEUdbQtvTtrdg6TZb1Wh9NHLGei7iPsjF3DN05U5n7OYwormg89xcod5/uZ
 Qx9Xdx3Xi+zyhB3hXrGiqZd2bpeols+kCMUzRCOv8qjTcKKtQdF0ukkbYMvCW5WY2WO4xqlaZWi
 riKzqse+wiZ2cwaOs0fKWp3uEFv6rvKo6JPe3A5m4emUAd+ZzOZRh86yUZGEn6BplllrTb7SgMg
 GWehS4rMvvsXR8iAvzQoNTGLJ+Wo1y3R25Rs/onrcvNv7GrfZEwXAy/hHtg6TwZS3xtC56HCqnZ
 iJ3bEUP7kntOo66VswaJiA2UP7zpsMT2/HbDZjNHhNXQeBUfjVLmkL7ApuV1/tARkgkzkSXf042
 gh7Lo/nJNDn/pkt+7gw==
X-Proofpoint-ORIG-GUID: VAaDnuliJpgNsVdwb7REf7iZhyeIYoVp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX6WMrBJr1Sofv
 fBN3jPfwEno//+k0b9Q7ht+Rfc6XpcITbJa8G308kYaQvDWf5jzl4sEKn4KTUFx8WmuLp7h4+Rq
 WMYy9IwiaC3CvuTbK7Kqx5sc7RxbaIA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 5:14 PM, Xilin Wu wrote:
> The Iris VPU on SC8280XP can issue memory transactions using stream ID
> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
> transactions are not attached to the Iris IOMMU domain and can trigger a
> non-secure SMMU global fault during video decode.
> 
> This was observed while decoding H.264, where the faulting address fell
> inside a DPB buffer mapped for the Iris device.
> 
> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
> the SMMU.
> 
> Note that the issue was observed using Gen2 HFI firmware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Any chance you're running into this?

https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Konrad
