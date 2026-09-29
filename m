Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324543C9429
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649717; cv=none; b=gHTq+z0AG5g8sO4Kp+8efBJEo9j6RUwoWLNGLdXfI2gEF8g/Dh+/dxfPIysUlgf0RRk82n/PtQ4MfsWML6ApXn7eqbf7Vr0ZDDTGCV2QzGHEqfe8nTDnjuHsdAJ/a71q9ssPMTDDy2K8jHNAQMGv3NJlCRWKWvgfo60BRD30rfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649717; c=relaxed/simple;
	bh=Y1are3mbL4HzFRhcH1XRj3+Ni3ZLwFWBk8+QKOYxCfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UH/g2u1bgs0MJMHOUtmAN19zBn+ihrmvoyyFef4wYECXE7ILPqh9UDms4FTRIWEf7xWwJqK2qVjAVMzPGDrLLM9UvlSG2yWbg4ZglxzChpZVSH/g6ukBGsWfKsp0uNTNT5wJI5KsrMothqpda5xDUKUu4QnDVq9ZRF9Wc3YSsoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeexUya7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbXFF1+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeexUya7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbXFF1+y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jFCC3459212
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=; b=jeexUya7nf3GsHgg
	wh96u81TTJHAVvJ/3eZRDBQD1c3+kH80N7vJzga6h9FWIit7Bwh2YtfSUzZFJWH6
	5h9U9RwQsGHPRSgIjk+PTSq5gchnJnf/jzb0SD13Y4gYKjQohxxB8TytFqace5EF
	Zvb1bZxo24RXMj3to/R7M2XzEWkN3MWKLrPcsxi1sZBA9cFUlJ/qDGq+RXgYGkRc
	J80JY6MkfKZNyQx9XrPWHbADJkhdSpqKgHwQCk7QKp+KYEON6z14bNnHWI+2rZHU
	MxyZZpl0LinvNf15wfqLgA080ZbJr68BrAKK6vk6UczpNspBcbAJiEclUPO1TnWG
	8gTd8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkus8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:41:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc78db407faso466943a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790649714; x=1791254514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=;
        b=kbXFF1+yGi2o7zt4FOLtcwQSXV7S00JPAPNe3gJ1iIOL2TnCCE4U8aGiWtnCRczDRl
         DvzK/XaOIVszJ4TRnawWVy8Xdo6yg/NiJnUQOxuXfWE4/XYUe8dyZCUPS6uQx2BWmpdO
         DxmuY8H9dFQFFgAHbmhazP+9zlmZqUXiNvTTFFz3utytjk2/PmcNUuhRvaznW8pms10l
         iWBijrVrZVLYg/yHPTVZHJmd/xd6LYrv/KF8HN/6hNCl4JcKCHbp1Vvac/onMbxirFem
         YBjOv1wwpMJKQAdxlt6hPBph5pdTNYGHoOi+OP3sFfmgDfktF64gy4Mj8LD5vX+Ktor8
         dtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649714; x=1791254514;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=;
        b=Y+/cZMDi6ZS9tVuv8D1KmXYQ3SCPrUVx8aZcETRHJb0chh4YS4EnR26p4SXiN52m4i
         aeEiMwXJI98j7ZaaUt6WpUEfJ7enOJaF0ZCNNrfZFYxbDLKjSWaMpJDbIMUEzXoOU/TA
         /djUgbsB4lKzKfpP3GiClvDjCG9/vn+ARTFwcU2iprBC2utF+4tclLIq3YOoDfKeAsfN
         lNQiuY4C59CrMxZ7OyAW365NBPV3vS35hXrmOuto7SKb71FlcaoCoEucTq2IV2+5xslw
         tfT7dY4RFK5KOBnpRoCXJX32/FjoYtezAivB1yW3Ykkamb3Wf/zMmzeviC27iaLxEs23
         24AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP5Tgi18UUosto38qVZSZ6fcooxoXcuiUCQoMkEfHHB7qxsH6+3/XTKzXrHc4LsC1DDCxOM+qrPoZlRoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2vYXy/hpkLMx4g9Rdru1nFDAB1eUtZwYIYzPQtLbtP6/gFtYx
	YjfTvKWh4kiMJBzJaU/l1I2BNAZsVQ+s3o7bXBRQIGJRCwjrciWu1hIZ3pkEw+4QluOk5MNP7+b
	RrjBAstfFNCqXxqPTikzg9QEnv0X9/917Iwey/VT54kwJ5/cZ3xx4eJ1Y0CRu+eHAEfB1/yijmJ
	w=
X-Gm-Gg: AYBFou0x42LK4OyHIDYcrPGd4JWrBLF9RTbx++DiHIrKxcy8jbuUVnFK0XnnpycZlBe
	VcwtrYS3gu5zLOzMCP8/PYqR1fajyX68mGT9WhjpZaHznqwvJlgVf8UZXA50t0RQxX2vXSA4oFG
	ycbG6FSX/GkPBD52b5xcWVlo/ypjgMzFvAn3aHZCcRMPj0Quzudc8C66a2cqePf384ll6DOK5iH
	GBOBPDfgIPV4cmUG2OBgT5isqRyFp1Wc4sgAA0BG9uruyX/GzhdAzOWDzjJltou/5DOQKtWO9Ig
	uROlZFIYrjLuICNaUPL4LCAu4V6dsP+JMLNLpT2iOda5QbjnqBiVrROtKzuU4byT43Olp7UjKHN
	T9FPoL971JHJh+TRXIfDH5UBk
X-Received: by 2002:a17:90b:278f:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3a0c162528dmr14743035a91.0.1790649713922;
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
X-Received: by 2002:a17:90b:278f:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3a0c162528dmr14743005a91.0.1790649713354;
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498596aefsm2611251a91.6.2026.09.28.19.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
Message-ID: <c951ab85-eab7-4783-a3ef-0b299b64f641@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:41:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX+t/WPBK5Ks//
 kXSdNYA5fZ+EZHWQqzArXpNOgNNqaTMuj5hPfsPMTFShr5ThVMWb9Oj5TvjGVP7CWH9umokfLx+
 wNQxklrShoFFKa/c/fR+2UXlGB7diSxuOL5KYjEPW6p+l7fLP/ZXlr6YeFXhmyvKfwiDv+gpBqL
 KqbJLTK8LCdl7EOaKxavJzNSMaXpDzsGS8izFjgkltVLd7ga60ZbUjFeghY2M7Ok/KMrZwp7V/S
 wcAZh0GB83zkGSsJ71Y90pQbmBFa5fDZvKkdkuxPy1sbR9HeIMuNVCq55ikV3p7KbLDfSCsOR/Y
 w8VVXgJsDsQ+hXAIcETWcjvVdt7gyp6WIhZ0Hzr7BlY2rSqw6AeOcA8qx9WgG2GnAOQXmja09jN
 yKflfO8niDObT9F+TD4PsoXG+kmo3m7SQe/Vy4CwH+smwSnC5YJAYUuESCNaN45hinXetQ9/gHy
 zICbEpTSZ6gIjB7leAA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb2572 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NJCT-5Zc7viJPmw2IsQA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Yyv4jLpID1B1zCAp_tP8GbXvLHdKmc8P
X-Proofpoint-ORIG-GUID: Yyv4jLpID1B1zCAp_tP8GbXvLHdKmc8P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX81O2YYvru5AX
 mRbEHWnLuplU2uMf1+HMibt9XJnp9GvYq2Z6u+sIkwJRXwZm9tLw6xiCKoJefFg3tndTElDB4rn
 ErQclqyeIna+VwMQLkQQN9NZMoZ7YKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290010

On 9/7/2026 4:37 PM, Taniya Das wrote:
> Document the CPU Control Processor (CPUCP) mailbox controller for the
> Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
> mailbox controller and uses it as a fallback compatible string.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
...

Trying to be a polite ping here to request apply since our device tree
series [1] is waiting for apply of this patch.
Feel free to let us know if anything is needed here.

Jingyi is posting the Maili device tree from [1] and get dtb checking
using this binding. And with a newer linux-next tag like 0916.


[1]https://lore.kernel.org/lkml/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Reviewed-by: Maria Yu <aiqun.yu@oss.qualcomm.com>
-- 
Thx and BRs,
Aiqun(Maria) Yu
