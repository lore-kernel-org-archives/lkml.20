Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116534;
	b=bBbxP1LShBYILsqH6wjVWSQFR++959xVGqh72HKiHOLuDIRnWZLVioAffaawZeH+jIB2
	 eNPqRH2HYh4tb/afSH5L7NsJkyIPxScvi80AhhUH+thYzzQtfSObcxtoV/IPTq9YEWjKE
	 tC3cZQEedGIC7RlW69wyyO8Lf8l/PQNAHN4gbqRlPsTprhFdByTcp1uGw9dXXNvkxyeMn
	 6LABD1HMiOVveHm6DyipjpIb32RfzQwmvyPryYLwYxE+GH+Vf/eA2xI/+BzBgf77o0S0b
	 HnxXERzfGQ64muSPOdZj5/NakaJlkXIKsF/EJ01GtZXDxpaFiYTQM0J6dWs0+Z2uwlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
	b=mR80uBJ+KXDy37VrXtMVJbhyGFrqOVitpIGxolehNztp6Qof8Qb0EkTOsnto3btPvJe2
	 66Q7OqmE4IOc4uK+jYg4rWP6+zW/8LQkSr7ooRcxsrsewRAd9qLcrWRRX4Y5e4E+EjVHE
	 vMt3jo0vqlaUr/FYRR1nVJEAQOAw76lBSdMH1swzSYGFof81wrwkKBpsBQ5JZdd0My2bY
	 nzk/lP9cjMbiFu+WrGZPjjH+gzRxiKSUxAZg9ThN+Q2q7rQ9QundUBpsxT5cEaOxERLFE
	 sTT+/xPyl090WHVPHaGDZbhfON0YU5SjsIVXSHq9DxnSlq4XRSX+ev5XGK+VbDN/DtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYuRibqL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D071606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D071606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYuRibqL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL28m2242194
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=; b=huwPXjlqeu5xpVR3
	5jJsipH1meaqhS+82jJf0aSRmbG277MFBcREcFHooXLPyF1E2bED++lTwRxb9K35
	ehuR+r0ex3ySOknZ+BvefsS4pPFweTklJ+adJm3KHDIi7rxd+ozHvYJMwqy4nGHE
	be7ZuaBGJvBhzcLtgSohSNVpYehUhviqrEUfClWeWrAI1bOK4vZWZ+zGsR6t62GC
	CCh2OFa3aX/AxUofGx1RKrkLUWgpeanzLQJARbzpiHVUqNAUgb/gvVEGghNR9M8V
	qIuyI/EUveJG+drzBUigs1KA904Ikr92Ml1yv3qqqVyqLULnPKu747AsjfumgB04
	shPKAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5t3aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c798d76so95386137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116532; x=1793721332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=dYuRibqLZ8VLQ8X1ZK180f6LrvJnwkb4QjSS1j/mJIAwmzOKrYMpO2tHzIVMDcTw5n
         LmROeCMlBXUxE5ugYD+8dRXDp/EGMLSRy3yia9F/aLBPb6D2biVmVm8LAXhJSBYI0K1r
         0nYDBkXHKyU9URFG20mrlN9j+6gD4Bq3az87CPPv6eZefFUg6oOa+NGOROsnZ+Us5Z95
         X6/BoplVE4x1qf+BaJB9vGDgPRyVgYp7jLAvrqbRfat58cb0dS5RDgtEB7F1vZoaFeEm
         oUcqpt2r9xYybahxDXMqDDWo2ZcGubC5WX4HbEMjOApDsrxh8AnnQssXM8Grog9U3JKq
         QmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116532; x=1793721332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=AufaZ0JFWR60P00NO5cffn6OrNEbjkVeXpvrbLp+0+ZxlO6xlzcNv3GE1B6p3u2NWz
         urCsmimvxjGSxuh5HX0Iah829hYKGTbkn6yFM6v34iNwMNyVkzCb3XkkYRj+vRywUq8A
         2jMn3fSAKQtgBkTi8QzwGsU/lEmoOBQQqgP0mB7qrc85Dwe+6ixLUE4M8WqssVproxJK
         5WJsf8+OZ3jL1dDS0P5G2tSYKATEa+vxlXGYFta3qA9xevRnkVXQzlYUM56tTcGHeMvi
         GlH3CYNB023w1rTzxyrCBgIFdmOWysXU2089QTEOrF1iOOG5GTJ+wifDNT61kM23yGXC
         t7sg==
X-Forwarded-Encrypted: i=1; AKwUvBygpUNhxxzq8RhRY8mPTQYVKawN6QuehTzyW660FEuCy4Irqhsu6xsS0x7wMXjOFj4IbO4jPMAkjmZn/pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiHsrDh4neTSV9rQcgKmT1LGF+OJbGJhQfyfkfMA3hzsgQfJ4P
	oUf2D6/13LowDlLBOjsbsG/NvA7j9GWB3WmwwaSuZm+4ecTP42D0JbLCo5cZIal+bAevr5HBfN/
	IPffLnfI0YjOQDPFCSWG7bu+4INzEnhDtfjhZDnuRTogKbZ2CRPwEuTJXy0MA98eepog=
X-Gm-Gg: AYBFou0YGSb/kJHj/OMBsvxKems4PVbR3LhX+f//KHchTqzsw8FpeGDDeeK6vi3iR2O
	dPyuS6RZO9A3UszRlTDAGcduSvBeE9jPJSfAFihzk5EFA3/nL6x8BFie20kReM1FeEUF6M4RNWM
	iUy/1VqZWU27uAQe75JjSrki///Xg8mkkj0wt8oQrGBuQKq+1WwmxdtD2456S3QTtyvwmD93tjd
	09G8BRXtnpn6vT4s5sqreh0sG+Xbcv6oFqJsGzxluYDFe92aUnPaLggb3zUOuXvxe+hJH4iOFa6
	b+2ry9AYKovCUA4F1ITqVOzN0+tVeKFrIChSk0tn9WDSJ/gadyl67LhSUi7sTI/UezROF00S5ua
	pGdTNlRme0VkkSejgBtDtVQ==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330073e0c.5.1793116532611;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330022e0c.5.1793116532143;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:31 -0700 (PDT)
Message-ID: <06818727-9a6b-4618-893e-5c1a78e00817@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:27 +0100
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX5pJqTwDJi81z
 jtxXBzDaBUd1QvLDdagHNDzLvVJV/rUn99qTiGKMItZyU9UIITI4sm/FtzMlPmzBOiSQhNODu6f
 vda0cjJQ72GxjpVo3PV9m57N+GT466E=
X-Proofpoint-ORIG-GUID: AZBldNMAWSddhchiRgwaN2nAjhtZps8z
X-Proofpoint-GUID: AZBldNMAWSddhchiRgwaN2nAjhtZps8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX0lDJnjQOrA/e
 rRNf0sBrJOW+fhA/mCNj8J74VK7L/5N6xqJJDSGTJb+X0l1nsCHF+qfuDuPKcs35n0xQhJ//8ky
 QPUfduKdrMh26kUeWhg3F8J4lBV/WQ7xJARaP8i1QQMUxvMOaeCC4K9weS+wLDQ6SgS9dFOnGuy
 QWpz6zSmZSDWtpb7P5MV+eVimh5/xO5i71ZBT0t9E7NxdgZhZ9M+okM/pt22YSMIQcefpEX4eEk
 oJYxZtKGWtSi2CpPt47Vah23pvhqYfwI3FSnY4GBpbSjSiCos1rZiNOG4uRgbchaa72EELx9EKz
 /VKeNRWkK2UAVZ/gbfuIbo/UxgPFj4Hb5IrS9PtQ6Z2R3aNzG4v72mc/eZXHTgJnUt1//+tv0D0
 y2Nj0SokYn5u86eWx5sn/VY9iAsudtsiS477AByGEQzTGRjNPUxWfPHwbkdLB91zspgVLoZZEaP
 JBWLYAavPlBKiJFdIvQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c975 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ih_i2Spn5ghOVsltRIYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
