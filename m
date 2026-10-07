Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1B45A295
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363223; cv=none; b=Ek62NsT7y8KJZhuuvng5ELjoPhZwmPGjH+knJpMCJMZNpTDtHW7qFVQXVbHnKvkC7w9WA2uRDPSVUhVXyOTy3CFYxJR2BiPDDnQg2jZs0YGMUYbZQPyh8TyuF+ZD6XjNORTrIWU+fqIbBpuK6EXsqp/KS2dFF0/ZxEyfIwjjyTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363223; c=relaxed/simple;
	bh=WTVvgTyFxqPZ1cVRs5+G5TuhvBcCfAZuVdQtmFu7emY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHZ1MH7/8qv6pdzCLDuF8+6o8aMvUiERjDE9axFsocHOFOYaTNQkxK37YMMpzn5fY4sk+vdAlo46M8+xmHiuUhCoFCYuyGPyjUx1WyNd+anps+LdAELwbn2BX+BPpPsn0zXoFmK9/SrGJYCUxMuplc9yO1AZoeljZvuzOId6x4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si3LRGom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnKMiD1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si3LRGom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnKMiD1w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jguU2969763
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=; b=Si3LRGomJBkswzF4
	FEsHiLfRGE/1ARlPkJsHTW4L3Ik1E+D2u1cblV3OBFyMX81tB7ItaLEMxfOBdC08
	NMBThEXeyYJ8jhDXwtDK+Oizush4NKYyM+ngV3Jkx21fHGkSjnbfu3Pkd7LnIw1N
	QhZLpdznME4jAB8bu2cexTOk1RvCiWf6sSE1hrlfS41scJkmkkZbdcS3FNXkk8WT
	tE3cb1ijOLfmWbwjs2xQTVhO9AIo260X4eI65VK+00N08kCkt1xBPVx94RxwYeY5
	OUvutugyRpaatT1gOZq8kJJkbPk9+2Uk593e4XemgdJPw0k0YFnH2TidmxjqLJL5
	qYWK4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679atf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:53:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso663230685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791363221; x=1791968021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=;
        b=KnKMiD1wYerbNDomVKS1dIxqxwrL2iJFtmJJez2coYDmUTrsgjjlsi1bpViWmLv3rH
         7X7dkarrZ0objTTACBT44gvzl5w5CouEgQdBJavHZHIhcMPPRw7rPch9nf4Q/2WRckSD
         j4wJ6gkaRYTF5x+dhK3WGu+QvTqWDTwNTmdgNZfi3s52vQsGsPWd2zVf2lPrlzbPVNfG
         aZolVB2YMlt263m2NQXUDHFoSfRd60niDeWBB4H+ARnggTfSaGezRGD8r++AU0pddQ4G
         j+AHezNba1Tcj27hjhkcOMU5P56NMPnU1wJ4z0cwrBpv5eKliXsm1B6F18aRhKIUTi5l
         E8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363221; x=1791968021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=;
        b=noNJlm03RkORVmgjdgG/iGNmmHCfl5yelGtlM3jHzDk0xYt7a8pQifMg2vnnY2vTLz
         ACCBSMn3DsN1s7KZJyJDbnW7x4Mc03U3oxVBOlxWS+UdwkCCY7l6VKqy3Y9vhSXOns3N
         yPO2IhQPJeAOsbgTahezFGvofj6KTBDGYpADk9bilwunCFFTTrA7hERXXjUkx4sIJmLQ
         o3ooRVgA3AMbaz8FbCRms1tSxEaanuVs12DwBmTw73OyP09xP8O47b/wvvskREQD68NM
         FGOXiMPZ12S86v4qqA06GjVS/MftijrTrotTmfSxH+Gaoh92C3CfgWU6Gt1aCaQpPgBf
         2sCQ==
X-Forwarded-Encrypted: i=1; AKwUvByXHToraoYLCt+Clzq+VMGSVyxAOtwxjyZrso9zRT8abkexwAorY7AS6P+1uPD1VuPgwX/0/KG61KLach4=@vger.kernel.org
X-Gm-Message-State: AFuF++nbhvArJmdMY382TycvtBcgx+Z41XGpdZFu6uE9Oo0KgOKjbbN3
	R/RFHu5zDgpcmnFwJlwZADle4tP/YcHMK5xieQqnhWOBWsYCIXnswN6c1kLP/4cax+cIbWJ2Zlm
	+ZCy6KPcgYVUnjy0mspqqWascSztFEKcbbcMvBSk3ruyck/7FFgZCtP5tFpxwxgMZhTA=
X-Gm-Gg: AYBFou0NqJ+n07Ylghct52YlsBGIYj0YDrXuaKnRsLkci5WBeY73wmdMfSOUmNOVcqR
	3dGDsRYytSPLjj+wgLlqyo4ptoNXpAmmvnAlOvoLl2i6bATB1VSuv0Pv2G2Ap1R3Rx0oEf4RKqk
	PGyqxLB4UWClazxW4CntiasjOQQJnwBn3B7d0mbnkrrCmxpZDZUKWLFqyf/akpr5QJnhgJUQ+V2
	qrE721zwghfRLYS2LEi0TC506svFM36wCRSfCsfitorRxp6cf9hpEWRQQpdQEwdN59l2ZQk6dKY
	giaF7aHR5YGjxVrH3Ah3FR/4Q8G5K1qnXS3C5nzRI2TJRV/vrE8t3Dr9td5tLPYKI+cEkRG/mwd
	c3yFgnBzai41R0LkG
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr259045685a.76.1791363220508;
        Wed, 07 Oct 2026 01:53:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr259040285a.76.1791363219916;
        Wed, 07 Oct 2026 01:53:39 -0700 (PDT)
Received: from [10.40.4.24] ([37.168.19.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81524535e9.2.2026.10.07.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:53:39 -0700 (PDT)
Message-ID: <37c88c2b-e500-48fb-a982-9a56540ecac4@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v16 6/6] Documentation: Add sysfs documentation for PSCRR
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
References: <20261007-pscrr-framework-v16-0-3642c277bebb@oss.qualcomm.com>
 <20261007-pscrr-framework-v16-6-3642c277bebb@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261007-pscrr-framework-v16-6-3642c277bebb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7LIecmPtsdl0
 Tcl/HwDWMGqkAC7+e/gkRKDWHX1/iu6nDygb2SzUMA4xLJt6fFxKBfum9PvF0mD83shXCBEsAFZ
 I7gbjjf9t/BIxohgzTJIyCHqG98uPZk=
X-Proofpoint-ORIG-GUID: Wh3vjky0hNNVG3i7nRtH_kcXGhV1v4uW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/w9XL2Ck8Pks
 7yCG5kD4mMj+9KYZr0hmTGmDdGZGC52W9thOSEFu8WtgeuYgBjuFofi0CwKsf7HASJuvk9ebSbS
 lPPq4oWet9FjnD0vpi4EYgZruRnbj+KjL36hg4XCF6g13O98E5JVKnRZVO1S8ZZUHv3vulX3QCd
 5Uz49X8dOrZNePNaHouuITq+EnrQTpfRnyNJOVMm7r5JhCGb1NHcZYXeMSJjC9XHWr+LkhqOgql
 lPzAvKGpqLApZIZfkFK7Og/ImmWqciqDBIrBgpYNd9Ixc6BxnhbsmGBLrEDXzwTsiIkG7vgn0pY
 c+hKhmPWPbN2AL4I/QhTsvnov73yFtWgvOPSZo29mclXHW7TGVF5sRG1y+XQyJiStZEuwE8zvpL
 GK8XR8IIaUMJWLFkhYUlb+vWDYSOdZ3KUcyf62DahB0AsP/EpKB2vfER9B2nyBYiPCfoPKpOWXf
 rLPp+VqeqRJiYnr5wGg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60895 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=YKLnzF1Vlz+PFNxJOoRadg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IOfPLNtac2teg-F3z00A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Wh3vjky0hNNVG3i7nRtH_kcXGhV1v4uW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

On 10/7/26 09:06, Faruque Ansari wrote:
> Document the Power State Change Reasons Recording (PSCRR) sysfs interface
> under /sys/kernel/pscrr/: the per-provider directories and their name,
> device, reason, caps, supported_reasons and record_policy attributes,
> including the stable reason token values.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> Changes v15:
> - Add Reviewed-by tags from Matti Vaittinen.
> changes v12:
> - rewrite for the per-provider interface (providerN/ directories with
>    caps, supported_reasons and record_policy)
> - rename the file to sysfs-kernel-pscrr to match the sysfs path
> - refresh KernelVersion/Date
> - drop Reviewed-by: Matti Vaittinen; the documentation was rewritten
> changes v8:
> - simplify and clarify example sysfs value comments
> - add note that not all values are meaningful on every system
> changes v7:
> - document expected values
> ---
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
