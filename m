Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942311;
	b=eHgyasbLuAAR0KWwvIhDYzQcyiWMUlKTJjDOGV9IGpCNYW/tr/RElNKzTPJjjZavzB8C
	 21ePXMwykX1KSbQQ1S8fU6QN44Naza7FcN9BphTtBbUr7917pT3D2WEZUGocZKyan/cAi
	 1MdqSvf03cfA5PXFBZqCQEzVyt/sRm8cE6OP69OPANKrXZfffMlAWMLYkyEe45Wbx7xkt
	 bUd/shsqN5vQ5N1zE7f5tSdfPis9zPeuSv/haFV+/NOm53Q2XmYbn1icQUtt8/LYRykBr
	 ire7FHJsNY4y7CVltojQ7/aDQbV7bQjX+zILRYNZHaDoNhhQho/tVqgxiaHSLhEDhGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=;
	b=lUhxhVSXkUv5C8JVjcr4A3ICw7z46yBrhytkfyb7j0bygN5QTWZ6NofjK9KZoN0z1mZX
	 a6rKc88F77TkQCAmJdEZROVMVhIskKlHjFI0FsTy13WAaUyArgynmBiK+xKzL7Sl8Wetf
	 2K8d8t6SDN0SVJ59ubrds1qkm+D73DO47s9z7uqUbSoMzgR3xH+eEoNSheh0V5nnjAwCc
	 EJCC1Q/kLKf0oKszFpkJJWFJIHKrEmwoQxegiu+CHJPULlp/CX7tZm5xrmQYlZg9kr5/U
	 RIEyLGVF6ctF42WEvGcb4uVY1wf7fO/I6/KWBvStqVTiWeCWBGgYfQNK4XVxZ8nVgVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6hMBRZ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TV/ObCaK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D64D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6hMBRZ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV/ObCaK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A64038h3775737
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=; b=B6hMBRZ07j9GPB7D
	oq9yu/HbJ2GEFAKwfjO9W0DugjJO6njmGlwttciROW1UUDQEuPyiYFeZdwswUHmt
	8yTmMm+VvVFldsvE5zwRMb8HdMYwuC1OdDClvCGD5kJvI25DxjVyzLD8pv3Zg9Lq
	4iViED4YWFLyVsd8S06kwFF3GINRjcTmf6mwVPfL0pmpEtzXEtOk54YLcsqMT6dV
	4KoFSNpg6HIf8T4pqa3+3llLIBf4mcJFMGg3M2IF1af5q093FxZMmHJRoAZoHA2L
	Q2yY1GQZasKRaKCPtj0wX23MEXxjJE5O+jn7jbb1YDvAsD3rTjf+HSzBJmQCeDuH
	nUPUnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9s1w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:18:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso352335a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942310; x=1794547110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=;
        b=TV/ObCaKedDQkoMBmHUAryIKepICI/Kj2Isp/VxMtOjTa1lcADmViUeWAo+E5+rL3S
         uXg/RXODqWP8zE/ugWegFTgsHfOi0OWw3/7EbJP3mJR6aiNxBwdLzBeMjsvYHkcyNcdC
         uoYXOpieYhtsr+cfUMz8gjgGkiA2vLFb9L0WF8L1GJIGrfsG/zUd+WuWRjOp1jHjieF+
         o6yZp72HeOM569RP6jRPRpMLMPwxlX+lhqS0QI661civ0nsuTmJSNme/gSCN54cUCU8R
         AvEntF0sb0fZlDxm9vg4N8qm73bpNnuHkwqsdyhNQoKjaMwGZVz8baIhUPu2p4xdrG/Y
         njrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942310; x=1794547110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=;
        b=2DxIBp6nF5DpVTAZBXEN78zGwfVNdUMhP767V1ua2z1cVBIqOSeYeRjTWOtQNIpIMU
         I6L7WMw+FcQswr1Us9qPeyKZ7sCfx4gkGhiOunVKpkGTxn3jVvkAXHoqvEMRwjY8JXZG
         LlkIQW933J8DbPO8tLzEM+Ol7jlK19Sw/cC7+3g+5ipCny3YjKVYfyI96/iP2uqHJOcg
         El4TyNIyg7g4gxrXhKeLAy4M9Z0UlbPcASfTnHTnhY0FjFlz+SeptwhoOekn10EBeKXu
         meS5VZJ4oNzggxCb7g3bWxBUlQRjmEFwjEMIz4Bm6BD0L4ioTTKuVyoFmXc+EVCLvDBE
         pi6A==
X-Forwarded-Encrypted: i=1; AL+hErFQ5NuZ91SrHcmEV4dlXGCPUt5vuHm2oGqA8gQKU8+GlNsXCkLF0uGF7snz+i4xhdymSVxiRCPl5cg0JhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FXaTpQlceCQesM16m5jqYhdEkncyrMYGzOLt8jnPOGatcyGh7
	k2/zKwmFHS5McDb892sdXJ04TA7ypuymaO8YVPZIQx/uTxVIQjHwvG6zF1CvFAhTmfyv019kdtd
	NOZAC9NZNoFqmUYNanwDUPx87ldT/LYdAfeFsKMY/w9l8DADcKIfcB/Z8Knr4XJ27xu11qRNiTK
	A=
X-Gm-Gg: AYBFou1L/G1S1dIVvvz7hKXlOxKr0L3nlqJiGGYhh3r3xkzoNQXfecYB8g5MT/ce1Ws
	dH3SLHmp8ccXJqUo52qrdU/o7Vcb3xrN5ggnkPjz3yCwyeDZUc6UWxSrAwj7JM6iBO5KRpxxJwW
	2Yw/gYsSK7C++THZZjsb9KVpBPVPOxINm69E9UMfvVX2ofWuFnrJQ77BLTlrQrzXFyiYyscEjPm
	fR2PNOqexIw3a6w+ky+Iv8+qreg+yQsd26YPO8tDLHQkTIFx3rdDaMjThYD5iAa4w9cAEfJjfMH
	AuJuueRPbqGpDbgCKaCRLG186zJmo8M4+VjJMDeT3YGsdK0Aen3tB/eCVOCYYtOxSBLPJRznm7e
	oQ/fc/O/WCIpDaa0VqX7rw7qOjwc/fPdiCZ+SCjLF1XL541n37C50oH76pgtpJKsliEwocJ/M6K
	0eMCThT0AQyMoayVPBVtyS39ffgqGu5+TT5bAYWsp4qu+6
X-Received: by 2002:a17:90b:1fc8:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3b0db6a8e8emr1372401a91.11.1793942309931;
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
X-Received: by 2002:a17:90b:1fc8:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3b0db6a8e8emr1372385a91.11.1793942309450;
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm1762352a91.13.2026.11.05.21.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
Message-ID: <23e722c5-c569-4bdb-a01c-1e58c77c639b@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:18:25 +0800
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
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfXwgOl80AT7Ffr
 tJKMN03itZgt3pN2+8aq2sww90Eqq/JO1G5JwIyiY3P6gDVVx87IOBGTufemUF0XzfpJ4/UasFg
 tSdW2T6oaY97GeFbUWbfg3EQEEtTktA=
X-Proofpoint-GUID: Qr8brGQUGEFJNAWqM2zgNYs0XYRdU39_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX4lvWshHZB8Ox
 KteEPmp7zSWKCQcWyBAnS7rG98FufvqOqJkpFKFs0JqhrhB6DIicMy7dmlLGojmaEHujTS4e9QS
 ZCSgcJiOqPIUobSwz1LGuUd/UPDAxmYEXcsv2UVSMdtiTV2EOCjrmGxvQk+HpwkP2tZKqySO62q
 XCbKkgPa3jX8Vvzlb2wzXJtEif3jT3HoFP+zhaz5ByWPvrevI66vg2sEYT6clOFIB9qiXSEGAoH
 uKibeTVyX919RGO43LJ+WbVr54/b9E/On9J25PzG3pKPWGNQB3uVLMvmbESWbBZNG+rzkDgHh08
 YFHrB40BBn70p7tEXO1IAJ+VVXzIIq/WcOYSCdNCeDZ07r5p6x5rKJcpZp2UKb2TDenIA8z7PH4
 GuGuyzKj6a4lbGpJs90djF1avPBEW63ru8qsgTyBiaPh4+Vu7q+PdW+Siqekt9Q6XjQapCBQVlt
 Wplp0MvcQi8Mv+24Wmw==
X-Proofpoint-ORIG-GUID: Qr8brGQUGEFJNAWqM2zgNYs0XYRdU39_
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed6326 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pKS8v8zPedG5d943xKEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060020



On 11/4/2026 10:33 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
