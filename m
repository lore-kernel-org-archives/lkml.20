Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27072931F0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433032; cv=none; b=iWTyVDW+xa1DnmaeHdeFpDEwGVYYNdTPXYT35UgCL41KZL8MCghlZnt3l0RCF1dhbKQUYksLLs0rUjRj91tIQSRY8Ciu3Q9w8NQNMvr6kn8D1IeY8KAdIlw3boybwkjcdBbbKurdU1WYgbnpLCwQG/9oBiXv7fb6/5bYxyxnW+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433032; c=relaxed/simple;
	bh=i4+jJTpklr7MaRXn7R7ld33gNpuMMw0CE3QZ5SKGLm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XoCmmc+KB1qpNEv2/8QqiCOO1+CFs17z7hav26io+VFUtR6cEC1umhM1uiykdrPtnTbVR6PwzKJjSaTKli5Z2BUNyEFVCNchh7OvgDK9GUtm1/Woq4Jo5Ypf44kOCaas9Kkw6UcaVCiKJDzhmClhVLpEf/8tV7o8vIrdNELcKRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExnMbyWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJTkzUU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExnMbyWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJTkzUU5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bm1H1433843
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 04:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4+jJTpklr7MaRXn7R7ld33gNpuMMw0CE3QZ5SKGLm4=; b=ExnMbyWnSDIbtVFr
	sT6bjvCr8IvkkkiQMrGD9Z7ei9a3rZq/oTd7bYP4LQdtd6jloRizv7+MqLq/LR3U
	ekwMkY3T7a4BJSwRKnATAJCPv04UJam96wifKzOaV7fX60Z8VwHadPVF0zIkt6Wr
	gzeRo1lQWTw3yJG2qFg64fvV99MJUH+0S1qgrvjFFiNxPOKtX+oTeS7vzQBNoWGo
	SOQbozvYqDuh5qiq6I16HdKGx3+nybltTh6/AUmNPqbOupaa0kxZPgfuSUJ57slA
	cERJ2bAk9xEoQ/xTuwEeaDqhDuMCh44us6pKXsLglibtpgUBjEtiYorl2xqIJ4PA
	cPlf+A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3h5gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:17:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so9367638eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791433029; x=1792037829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4+jJTpklr7MaRXn7R7ld33gNpuMMw0CE3QZ5SKGLm4=;
        b=FJTkzUU5YwSXaOpAo7BjhaxcCZrPvOMFV+ImmNthc1Ns5WE3WhlSKCrOjm0qI4DCta
         iAWZZNuuXhPm9KVqPDm1EwHMzM6pqnFOA+rZ6xVQaSe6VQxfOB3JXxmlC3Wmo65kO00Z
         3SwfuaGHlCGMYCd7bR+s/FISYrntjw82yYAfnsfblu5+Dr+HQfvfv6kj9+nuecjKZo8m
         NUQHkMPgoYfsQ6Swn8LlnyV+22f7bdySicmjtO3pEzGt37u9Htnyy+q4ORvTcDI6X9eu
         LtOzV4qmgKXJkEOYzN2KvS4PdwKSwcWg2lOOoKcPax4h5739GukqgbTax6ouRRQyPRHO
         yoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433029; x=1792037829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4+jJTpklr7MaRXn7R7ld33gNpuMMw0CE3QZ5SKGLm4=;
        b=xMHu5tLk1HPBtpwjwqAbj9TycdxFuxYnSotxHLfuPxJyta1M3bl4+10IMEguMBxCeX
         ic33OqLKMxLT+D2GIRPEILiEqLKnTzCJU6B4EaCynJrNmJ09abIC4UFBY8rOyPsHEhM6
         oQPlrL88I7+8ZxmJzGBie9M3pYcG7+ijwupZ99EmgHw3p6OTQD90+luVfYIT1urV7yV8
         X0siL0IHy6aTcCL3WzkWNd7LBUEtG2+L6BCuPsoKk2ySW4lVw9IaBGj1dImLnAaBYTCu
         HjNCLQUf+YvjRwpQsEhQVxJHOLO/5zoW+TH2feef9m0FJiGGNHJDPKVybwYjPVv69Swz
         nWyg==
X-Forwarded-Encrypted: i=1; AKwUvBxgpgHn3ABudMqwJ0nCqBS9bm0Z7gM69t9xJf5E1KWBPndJr06KRTbNVojWsR4JWjhE12lG0QrNBsaCqWk=@vger.kernel.org
X-Gm-Message-State: AFuF++l64md6Yy7FKlheBUkDX44dRZme6FTI+2ZsKpJR4hd+PpgvgfkV
	p3iz0avgatXAmXe8F/XFRS7ry+y66Hzooia5GYHCPvxwnJZGBxngHlr34IEBkO+5lHL/s4+1Lz6
	ydETmzYDdW+aFJB1rnL+LYRTTpi+NTzPhp0UrfaENiwiJ2ql/DBbl8r0ZCAuBVKZE0eY=
X-Gm-Gg: AYBFou1Zlfwd2f42L5rDIjJKOGlYQO3dMUCDD8o3dy1KOpRzmFEXrM4KjMNtpRkom+Q
	B00xf6rhpGEZwv/Yfxh98XsXtkUwG3sXwToebGoRyyu2aHjjN/GxGD3m6aq7n0hEcw5dJJpZE4M
	dD5A0f1VweWgbR02Jai2O9sKJVTXikYTRvzjFFda3idYqBbNZYH/n5XpVK5hM+LTdO+AJ2rFlXE
	LC9K9Az7iUXj/uInnle25soYELLfRLLUs49cvvClrtZK4syCCnJMKQczqOSnddEdHhmQhqQwcVS
	H5eNY0FUoZBs50A6KJqcFx5rx314lpiHFQs0QQP2/ongRsR8/Y2IbNcGwtaHnXWkYriuaBNJyDF
	ans+GX+9MQdTofGuhK7vcNxSPR6EN
X-Received: by 2002:a05:701b:4584:b0:14f:b8c4:2908 with SMTP id a92af1059eb24-16205bcc4cdmr4369667c88.19.1791433029281;
        Wed, 07 Oct 2026 21:17:09 -0700 (PDT)
X-Received: by 2002:a05:701b:4584:b0:14f:b8c4:2908 with SMTP id a92af1059eb24-16205bcc4cdmr4369631c88.19.1791433028658;
        Wed, 07 Oct 2026 21:17:08 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af97c6esm12469259eec.20.2026.10.07.21.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 21:17:08 -0700 (PDT)
Message-ID: <fdcd5cd9-808f-49ce-8726-a17b3276b382@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:47:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-pdc: fix builtin vs. module build error
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20261006231845.461332-1-rdunlap@infradead.org>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261006231845.461332-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfXz3LmWT0SAU7F
 IhKMJqd2Gen3IuIhlKls7zzjGTYP8pcbFPUkPAcC3s2DxeYp60Vc0yNw6AXEtVubQcyN5OI7CHq
 tEUjPaBZrSClhIBuz51UQn0+6mvf/Kk=
X-Proofpoint-ORIG-GUID: M5e9NEItqqd3b1GgwPZqDBGaKryHtg1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX2Tz+CSevG2Rv
 IqftwRgK3F+aMkkwQJLIkgUELoPKP+ynDm1DX0jH5ZPmEQL80twjo27qvekTSi4ZVmu62WjL1wo
 c0KDqIw33yqaWKEsF2rQpzS9zTPj4j8oi+vUImYS8VjImpakK5MbStw34dz0HCcA5YlM6oDjYuG
 6IlJPkO2fcCSQx2UmVzlTUg1K/M0E7t0rJCp1yMRm47mh0h9JVw26q2vFrjxZrRGHXPmUr76vQp
 VpSupyPL4wnscuzvOZZ1bqFK2XtmIFvONn6Lo8YfVExk7QstpXy7Fo/Fbun0s9Z8UJwqocLQQ+0
 VSIprUTk4p97FxnctjP8b04DSEZslVgrO92rCR1yznjctC9PmrINJImhA2KSuNUB1OYtxzc1XBB
 FKjyfcPvwIlBNponIvbInlmKrECt6OLo1Kdbtqf75n76m+MexxYsjCrq7mlotOtrZCNm8PYI3W9
 jaUv5BuIxQEpVslNwYw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac71946 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X2fZIdgy_p60PtPzbzoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: M5e9NEItqqd3b1GgwPZqDBGaKryHtg1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080016



On 07-10-2026 04:48, Randy Dunlap wrote:
> When CONFIG_QCOM_SCM=m and CONFIG_QCOM_PDC=y, the build fails with
> aarch64-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
> qcom-pdc.c:(.text+0x1060): undefined reference to `qcom_scm_is_available'
> aarch64-linux-ld: qcom-pdc.c:(.text+0x1094): undefined reference to `qcom_scm_io_writel'
>
> [ARCH_QCOM=y, COMPILE_TEST=y]
This should have fixes tag.

Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")

with the tag added,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik
