Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102501;
	b=bN2tkoM1pyfqdCbkAvQvSFQx1kjOMdmMSDBv8s1jmrm+ZKr0vBCxK1G5zJJSB7dp8KO8
	 j4IcDL6yVE20ZsNw488wxF5kODgrRtCS7PxIu0hIaDTKJbxMnynCcYzIi+a6Kr9IxgV+c
	 Yqi1mzSQQwxEgvAkCgPDHp+agaCrJIstZo4/XtxYAxQZtREvP88zKHS6FGbsghdGC9Lq0
	 YMa6uby0xxXidkP1JSUOV/u019kQeocW4qDB+IQORERVdiY9ni+i9Zav4LK/tUIf7s76l
	 PicU3k+Ftt6St1nxqaODHr/2mPKfr73y3YW0XULgRWM1qkvrwydK9t2nui6WuMXu3PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
	b=Cwe/5dCP0L8knh0TJ3nqVH+VoR4FsJkN497yPQqwTLB8WkeNjbuckAR+R++05vsxKi6S
	 7pKhxuwSLPq/ojHggvJF45DhbcNHSFZI1KJtp8AVgbGguVRyq3kCQ5mcOf3VBswpU60tC
	 6Xzb1s2ZRvWPvyIF8B03c9Q4dCJdOPbt2jJdF9rDju+dtOhgYd8N4k7QBxAaDz66OW6jF
	 1LG5ld9gPoHeAmcpRudb1C9iRdIDeApDNBnYauq5zxq5yPvEYg7LaO8e6UHqtTNEPsbRO
	 qNRKwcjDoAtuq4Xek6aWkt3lQzD5gl4fzvrV2CCOA6TQcAfdnNDOBGN3jFyPM0GVJTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AM8/7diD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSpO1Gve;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F660A2633
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6F660A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM8/7diD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSpO1Gve
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCio3012104
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=; b=AM8/7diDpv+9jiJO
	xW+hkOOA3iRMMNC/fCSF/EM4k3qg05txs+BOHZ8DIrXJhOonH+sbV9wzl3p/Pbw7
	jZw0ES6VYhzDmxUPub7vwEIId7FOaL3chc64mEilXT21PaSdZFSICFH4TxFXOhjX
	x2/K3AvasU/NAr75ns4qHvGmg49cHKNYxXBkYjtAWjlJcVmG3KF1A7fK5EdOxaYy
	8GAgBhJTvb+g3eNUNz0Sb++jonQ0mvcPIJcdUYBB4cefdHXIlkUslrignMPzmg76
	LRE/vUi0/+meZzaUE56PJiBSkLgues48LkDO3Gx+9DqRkGl9kCKbvaJdAiBnYwqg
	A0zg9w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3davpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso203692137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102498; x=1793707298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=XSpO1GveXehBQypnFwhmkuOC0F3Js+TksRZqRMKsdK02Ywdze0KmdeWwTDWUnAyX8Y
         veZZb9QJqLTwVofpAIOeymIuwr3Gp51SArwxUjuXSugF9jH5IqxJXoaDT836rwmqboox
         JSnWGcRf6WHe0VhSkkILZaLYaixMZKPuddfJcbHwZgAVBj/5atPjV+ItNWnxsOdcb0um
         DMLGTytkk4NAUu3NKhVraluCz5GD9zaD/003Qxvrl2UVAuv0r3NZr52laNVef/to+due
         j5Ym94Sg5HJPFUrlMWxPjVRz4fUs4h6sk2HbegdUY8rJvxWoBhxJoYyRvQRVqwW53ywI
         B0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102498; x=1793707298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=tW244QgMaaEnUeivqLqhQDxP/tFRO8OBex0OdRDPhPxiFnHO2DV0bfB0ZFKVZYaqXC
         JPWGMb9K9syjQy+OGTLW6FJ0cn9SFOgs3GZ1w1KqVNFO+NynQRYxlpDLXL+6LxPivbfU
         MueCwo/1cYWPJTbt8Y18lPt9sWBjeGv1uPtSYJmdh81EuChOzI49QTgxhYyAeJHpIXNg
         M/cy7IOUgQ3z0Iaq1Vrg+brE1HLepURKtmWgMWqn2W9f2jHp1uBreal9HfIDOQTakEqH
         hZZ5HNNv4t52rILeGY/4UrocM631wj3tpSOeTLWPgUkgRGASdxnuvMFylAi77kl9v/8X
         cGEg==
X-Forwarded-Encrypted: i=1; AKwUvBwSSLvWBNUcp/82j90cBk764H3hi2iAjGn4UGzz+SPh9lAxELCFz9IqTfK6S4ueqAzLyn+qu2UFc0FqrjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmXiDPZys4hwBWaaYAauSR0TQbBeEzSnEif8k129/oPP1jmUWK
	7Lp8edfyslTXyAlK4fJEfTpK2FD7ofJutGeE0VwBSsiSbp01GghXCiXzVawFhbpfuqx3yreB8Yb
	OfJWkAph2Rvfjn1Y/W+6iJ8UGUYMn+d3pGIb4oFnTuyJ77T92uDfuHa0v6njYDU7gdXs=
X-Gm-Gg: AYBFou0mr3kRWUEsqwCybwmZ/sOVhrHOnMf/NXgF3lMIv5P0eZX6dfMNXMI2+qkLXAb
	sHF7/w/FBx3oR/fXBTEU91sy/MS85ekpm7G+l3qGZvhxej/g0KdrDsz0+Jh+MY29mQjKzJQMH3Z
	QaiQfMR5+XoJW5AtmAV6oQiinf+atGGFGIrgbRYlAdCmM6W8Hm8MzznBreZZDKOLDX20+VTXn2g
	jbeWMbbmR29cSEQDc5XL45+gW9yok0+8iESpcEHl/XR4oG+6HDuGULx14B/IIy1MC7gPpY4pgQ3
	ZEtPH0w1SHDIIc1zlb6EXlMPQ64Y8dFac2vk6ql/2hkgUijWsJWu48/LIKe0nWyi0fk+mcYU8TH
	2WjhnaTGaqNdTalqchCRtoA==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306424137.2.1793102493918;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306341137.2.1793102493232;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm4967957a12.30.2026.10.27.05.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Message-ID: <803e3f62-d894-403e-95af-3f6765c6796a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:28 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX35Ots1b+2kNm
 ASvUC55CZW4NVHg+qlxbSzS2rEPWAKuE6+tcbDjTD1WN2VY9SxigY/5HWen1pQ9IMJNwxKn9oVp
 bOv+HloOqtQ9rF1S20DyW5zMrNEQSik=
X-Proofpoint-GUID: DCL5WzJxJsQzTRca4mr-VdF0gEP620qu
X-Proofpoint-ORIG-GUID: DCL5WzJxJsQzTRca4mr-VdF0gEP620qu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0EIo9XE2nB9+
 75AhjwkWSix9Fpd+Yv4PAmoo0rumMgjVr5kFCjxLTjExs5Njt9rM65q14lDh3HpPpWA/NFzKWus
 vZoxhbFi+TLs5304L4TP01qFt9a3n8EeU3v8Ojk2tyiUk8nPjAGd1opx7rIFeWn2NXq8p1DOe7K
 YNx8ZnDIekAw2Rvf8BekE86m2FDDxeu+eemqHthidoCNXJkBuAvtegxTBP7eD+nkzkwSHswSO5B
 K4M+D/mpXjEBYVB52yDnsHCik5I+oDv7WWjFvTnZBc2oKg80K/iJldEydZGaI5UEyJ451JS2rRB
 7V2eNrhTPhO5UY4DDuV7tOxlnYEuGfuLTUVQyoJsnK/MDJjc7bwK/C1h1DW55H8Ln+msEtuPIAV
 LSqk4oAUJ55eToH8AiajT10Ck39KZMf0tUXzD6aGbFD5T8oJakbWvfJlC+qYbPvmvTn9vh/GeT9
 CZqzKzq5viLVgIwNz1A==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae092a4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +/* eDP0 */
> +&mdss0_dp0_out {

I think these are self-evident by the graph connection below
and by the naming

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
