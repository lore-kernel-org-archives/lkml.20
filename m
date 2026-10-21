Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599070;
	b=Y9BFLthvvTH/dKn4yHEQvPW4J5JZztRkcYthyc34OJo6tM1vqzQCk78NsgBLA9i1FM72
	 g4QAOojzL2AZ6vHucmOs+lqnYhFFlQTmsUWKyZdLpJfcS1XnxbQBgiiLPnqsktFoEB2nu
	 3eQXJEd9lMelxbuensJFD9F2tr9XCB540QO469IGN2tSKZH6AAWsbzoo7EfgJ10m27aoL
	 AxYOT2FKObqrG3jHS0mHxd33bwLa+O7j/YKHYwJgkAiadbvAmVAb12VTVAmolsLL6ozdg
	 ob7w9Caq5rnWBM4bAiSWjoHNKQO3m+pjQvq6cMJGb668HWZXwJ1zLRZivPn4e2gHNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
	b=Te0uaRBI0PAa+wAmiWl+EeMvhqdqJOtYdlmxmbux/hZs+TIbgrRPGjVRgHBc5qBU/3r5
	 X5PYV405prWOmDRluMib3xQWvR6yjk1AeRIYQ9QQ61Oo+iOPDlEgVtLn0xpFB0ydFp7qG
	 fTMIx8busOMfUBK7bh+AbvqdeRxXXtN/pmilKIE67wdeyNYNZb9YDGgwz+Ob9tIMW6nGt
	 Oy3dTI2pMhQ8zzaDDAwyuSFCSElnr0DdQoOEeViYVJztZiYuqxRH60cZPVWtP0SafbiwD
	 xiHDhpCqKA2Y2UdDABvpsREoA49NsKfnQabcaE2r5+29SQgmsXSp4Swdz+SAHaw4vqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19852606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19852606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTo0X141140
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=; b=V0ihCasmkW/aMZhU
	sJcKm5nYfBNgtmimC6O7UbcbXBSTyusSedqc2yEm3bxa7yo4kC/bwTzn6LtAiUmu
	AeT1V8nos2qZSefaZ407+Xb57Cqu4fP1LhYtXy0jzYOOiDnTFYP64nFLSJJbZ30f
	gvGmQLRMS8Tu/KcL7unDk5qS76Xgpv4KRncYh6RxVaJLdZ7lmUqxvMp31bI1OCfS
	JZSEOprQ+ZWwAPZFP2PXPW8nvdtSxzSK76NM3OKetaWL4LvJimIjkmk0Z0uSTdfr
	FFAyJzzOm0e7Czj5+SBx9B1KD7CHqZI1VgsqiECI9iEK1vRTB9EWwnjk1gpHNyPt
	CtddPQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex588s8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso636982b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599069; x=1793203869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=F1l9lRz+st+JFp1wukMvXHgwN6aZd/ZBZdwdPeP9xFepSh7WUVfwWv0LH9N7FuiKqN
         zR0p51614FH6rkClZrCyaSSuZHfNQ0oOPrqAzaJq5ouZVRXA2Myoe83fTIe26jEmZzYU
         f5BBfWvzArScGXlfoduJEgUm4kKDK5Er8DjRs5XVBlePR3olBVrJbYMmS/Ak1+h/2K+m
         NzTeycTF6RE6jr6jmYa+Y2zHCIeIB25xpeGplHJfX/wT/UIQxytGG+RA3O36Ub/Fx6PI
         +c09xZZhtSOoWej9srmOmCeUrx+7zfYQJ3fcnvblJCDtmbPcDWNq7aNmWkhX+Pb2huY1
         b/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599069; x=1793203869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=nSgNANGg6+VOYnJ1hWI2GWk2FxR4M5MxJX3oVxvA6Zo4Ncsh82jdwb4/Xcoqg3piGF
         iniHvVrwjbM/GH3dOZFM2XmD9YHALc3b/CYvzP36C3btUCUwg2cTYs7gRQPMog+SLBpy
         RONHjcngRK42OJavYvs5MH4CUDsZHJt7Wk9fKgHSFD473jrjFH7UPEBTA+4RvrkhAW4l
         aPbTALi6Kp3+JFPySeiQINAXdrrVit/Wx85AqZysC3LNTw/c9HvJWAEa7nMBgtPDtnno
         m2CiB35OYne6CpYd/8BlX5saZWPrh3rNBqdTK6dpP4pwjs/EalbJFZtFYxu3eT5eHbFP
         090g==
X-Forwarded-Encrypted: i=1; AKwUvByEXiIy0f4pxYaciJJuIqfO54tJ07E1Bw9GLTP0fO5JnuIq09dCWyg/N/2Wxm4E6CIOeidbRs/sNS4o6Qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1FC79mzogxbWCBN2PXvupVFBNOgoxCcmi4AVrmg05YjCt2bvd
	Nn7dAVTPa/7kSLvGfFe6SZch06TiO7PPeiCL2aO5rcn1AoXVk8nw0bRS4WMX9RY0cM8jB7c4l+h
	xEg/Ox8bLbCTuLs8G8n63+nOZu8NMbylBYVFbMBt38JvL0rClLzDA6ghvyIhT1HKCCAQ=
X-Gm-Gg: AYBFou1x3q4U/0T3D62RXyGKMuX5hjMPDfC9tX7eZDRmS3A44jdKe67BGgvam0vNEVc
	5g/prAaVrcS9eu/Txi4mprPzRQDQ/8p2anFGzQZVNQcm7hYziyvIU9baqx5afFirud8AFIzYpPG
	K+0M2itX1ayOK5Zpr/AQYwg6qfUMX3nnhqmYfyzu4KTJ40gjNauORZHpHYZBRO8cXQcw+jNKZi5
	MTcHwXmzBbR9A7tk72aNXJkukx4wmAoH7+Fe4qA6qHvFlvOZsDnYteenOA4Fs1VGMqvlQtTdrRq
	3p0aihbyA1QvVNGfr/NZlbFuzOjxrvZp44BWCPQMlU7RbwayNNQ98s+POBPGfibnRz2wRixMQJ+
	O5Pj3zILrlfgh4epKki1NeWcTleO+CB7Jm29zi0zGuWLB
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918091b3a.20.1792599068629;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918081b3a.20.1792599068148;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm1095569b3a.13.2026.10.21.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:11:06 -0700 (PDT)
Message-ID: <a9900595-eed5-4e5b-ae8b-212597601aeb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:41:00 +0530
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
Subject: Re: [PATCH 4/4] clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
 <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX/oOKUp0dd6uH
 UQEf7ueDrKipBbp4WUb/H7a+6z+uT4+8Vp4uDWYVzd8b01OUXJnYNCM42OeDts/CqoAUJK10IfH
 X8i7FOOxnm+DDj52CadGqfRyJOWOugc=
X-Proofpoint-GUID: 3t-tUlhj9x4khSR7MAuGCBVPirXWKF8j
X-Proofpoint-ORIG-GUID: 3t-tUlhj9x4khSR7MAuGCBVPirXWKF8j
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8e41d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OgLFbhcrQp8kNKIItaQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXwUuJDutCXFS0
 Uc4zV2KqhtCxhUU8mhcU1AeL9NYqHTVnxi0BHl0HHhccerFNp/uEIC8lPDsljK7Itn43BEamPki
 sl7PJqMo6+Zr1ly/Me5ParDvEy7T5JKj8lH/tz8VyAi0aeC1eEjbOV6JLK4uYQR/AYgVfCasW8I
 BwlgQ+zGrg791uN5MDoPhdnkmN8kxEFI7YJNiYZRxdntrA1Q20L5JiZCtCrO6LggRPLnd+uLhn/
 JcUabt3dC2xw+yGYgponW0inxp3DQOKhVb0K5WCWFrcNjUR3jsJH6fK2GzX1XwzhsuJh3BKibhO
 X8D8hRvnNg4zlepl3h5Tfp9Y3sLwJCFAeFxU+AKSHHFheWZ86Pxz8XsGfgLkkRTtMPl9iwhGEWx
 +ATnm8O6YEz/gStoKn4d/Jv4Azne57pwg6LERcV5Ov0upWbI+IDETb13jklvB3IkGWBVDVlFx/C
 NvnF1WKdu5Y4EFjrBjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:22 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks.
>> The four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the
>> L3 are each clocked by their own Zonda PLL. Each clock is selected
>> through a glitch-free mux (GFM) whose parents are XO, GPLL0 and the
>> corresponding PLL. The gold mux can also select the PLL's post-divider
> [...]
>
>> +static struct clk_branch apss_silver_core_clk = {
>> +	.halt_reg = 0x8c,
>> +	.clkr = {
>> +		.enable_reg = 0x8c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data) {
>> +			.name = "apss_silver_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&silver_apss_pll_gfmux.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Do the clocks have to be enabled even if the CPUs are offline?

Yes. The bootloader leaves these clocks enabled. Marking them with 
CLK_IS_CRITICAL prevents clk_disable_unused() from gating the CPU and L3 
clocks and hanging the system during boot.

>
> Konrad
