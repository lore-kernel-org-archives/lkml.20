Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098782;
	b=Ru09+M39TtNBXPKq6JOz5WIs1pyeilkiwN2iUzDEoDkrNuyX70RgGbFiwephn0ZLVhpY
	 AtKo3pmuLaAphOxMsgA3XmzOvH0ceell+LNOGMo5GLMl9re87KzI2UKCc83Bw/+fyCEEA
	 Wx3JXOm8yBKw3gULF2iY+78Wupp45qiXSXjVDGaxfO1oVDQPtnl93sV5MmC0tNIZPVFfE
	 8AAnFCaSu3xDjOdvyB9JJAYY0HFYNKk2YUrkMyQYdlwGfmB+2OSdYQ8F+3/bTcn36AsZc
	 4rDXQCUHgdK4k4COvyYYNitmVGl++s58Z3mHGTUSGnfoW4BfyGcMkr5wK4GVFfFL4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
	b=oREIKE5rgMh/ZSLOqAC8oB8j5h1qgGZl8bCDp/K3sAlV89/t/AGqF+ib+kFo2ZRGZ4q3
	 5PPAqd6Tiw4rfAWa6UbK8GmWed+z3TfYwO2o63QjLg/nQCLnWYqx9mZ53l47b802BO+dU
	 dmLOPwkrT/u48ZE6HfHIEPrqooNpZCiC5iiQ0DQAkqc8CQTbV/i4QshAkfpKLzJ2hqyVj
	 W/rvmjZSBWmwI1+5R7Yuo+6nPXy4CGr++jBAJGWdEVBiVVybD6D8tirzUVs1FQQMD2b3c
	 l2JcNl+6X/kOWN2Kir+sgVT6arWW4rJ7UfmYVG6Ya/gDXbeizxD22Dy4zjLma9MLaRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1ED8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdw3K1061095
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=; b=CFt4gceTanHmuKRI
	CHJVPXo7/JyqGvGJucuZv7Nuj9okw3JQMmlQv/8OKLlGWBn9uwqU0SIIsmCggkDu
	R+dvqXwLCGyGCwAw5EaW5RupWnusaBADigjAxrkdys2eGMu9tKDdAtNbyfBnnZgt
	b42StvxTf6j45kaztebp+T8nqvTS4jQX1+9GiBNnV1KbG86UhGcozOWMT4fIA5MC
	zXMpXPrMS2ufCP4LED81iCfgDNNmjzUzs3OhbgVz0yNyYb+9qLx8ldJuUEKsuQ97
	n1ciZN+0r0ABGx5B6/k0YjJFsc/v+GhTYc/a/yEj0U/oYRdMckwDunqf7E8SkqhM
	R7pqtg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t95g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso12901201cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098780; x=1793703580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=hmh8jTANgqk+4t/Y+c30HwqXAmDGrjspn49L2oJndDazaSHNAhQ/1icKsxiK7ksFWM
         6prUMeM++Tux+RP37NyRJ9z2JSfscXivpQxwIiFIzLXCy2456sQdaWUYB2Kfs04hcvEk
         qly6LbGT5GF4IMYgnQytzXbP4eedfu8HxHqChatmkJLaztzvnuCFJLM1u+qzqHEUP/bo
         IOKLWcSIg3LljsrkEkxoUGBCv98kR0InDCqNp+a+WaXD8JK5Lh9DTabneWityZLn/cwy
         neC+MAQeTMFQtkxKTnNhxkVOGnY4FXoeSPdBgq4Mz7B2JKJYEEywclnyDsyk5VAaHnhJ
         iCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098780; x=1793703580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=fjoZ1VI+ql98J1UMH0KrSAqxibrjoVPVQEXArFoNqdhWNqcdWzBY2+4DOe47RUw7X1
         ta3LKcA7TiYVWTCiTrpCIrvihJ+9aTC97CXS59aSClqfCXeXEhkd/2D3KrS7j1CXdgG/
         jU6fc/JbmkzT77D/UhQp4X4tkrjwuBUQh4STlVjPcijZe+27gJ4hq3oYqT5ojbEK7FHp
         Dr9yfwXSbCD3pLtgReAK1lEEi60ZYiXl07sApH4PHWBgmiNnacOQcBLNM0WmmfNqZDjZ
         e9fVdnaH8k8BzdxLDlkilsw3EEyu/l4NaDt5ZaDZiITi4Y1V2F7+roAczZn4GFxvkx6X
         X+Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzX0sd2aeuLtlZsqGg6PAUwmo4X8Tot/XjDyXTSoYuNK/yAC47dKuFqdrBru3jxfjlN0jC5JZWnEZCZdrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8j+9hSFGVplxSmTzEZB2pdOGptAvHwh6nV+8eCWbM7eQKYxqR
	yEgduk/ox1y8PdldsVsX9TihQnMRP9SS5+OguxwpK8cmyZU0LqbDMD6ugWG/5uRx55hNWg5ev59
	f8UPz+uxLISFlUcRFMG6jzldqJJwBgI1rNKHVbR1fGcw5ZBm0csifdPk+Vua74BG3oI0=
X-Gm-Gg: AYBFou3nLbJtBjlZGVfnTcCoZpeV+fVf92FE+h0yKVwftrxlsGlZKR4y6Pd7ytLbROk
	IgQRwx7g0DHOMwdUHHrXwoWpNUZl20OXuIuyT21wUKl4WyAlkW3FlIKNI++ziw3+BpHwxymJxJJ
	wSZFuHjF5ZqBJEK6J9oRVhutaIpEAsfONdNXLZL7DqNE02o0EB0i8RJ5552HMX4LQc2UakMgopm
	Unigy0T5JEvxg91ZWrpMV2a+HTzlTxBe9sdtwaNbrQmmdEiVhyvXq+f+vAEm7dF8aVE5jXeMFIl
	EiMLW440ucGk/lhZNEeylskx6lBnxzHyUbXM2p0LLme+pUzzs17Z9a+06yN7LvSOvNKHz33RzxS
	B9dZB8y7VvXTst3OjfLPSEZfMmKKjKywg3m4vaAfuWot3LEjw5K3Ef03UWxHY0cX4MRuRBPE=
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438985985a.3.1793098780215;
        Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438982785a.3.1793098779662;
        Tue, 27 Oct 2026 03:59:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4704987a12.3.2026.10.27.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:38 -0700 (PDT)
Message-ID: <fd27ac24-e96e-49d8-90c9-019275c1b541@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:34 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0841d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RnYB8WQ3oujroR9yDwEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vk1rVkhXDtHhLBXTmewVRJI8BRdXcQeu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX9iQfWsbXvCjc
 WAxgm5QuV56aUSq0VlsN0yB20PEIYM+ZzkR74J/0QIpOfkPRe0pyVXjmLaMM2xfrt+jCIG0Rwxf
 kSNeacA5ZdjGRceDOoBgGYbb34Cluiw=
X-Proofpoint-ORIG-GUID: vk1rVkhXDtHhLBXTmewVRJI8BRdXcQeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXyfo0xWIdlRrj
 ORYRo1Cabu4793WXuMz0wpVnVj7AcEclTx2TDutqGHYwTGbCGg8vB/K4wxveKI+QlgtmNOX7Lxq
 BwoIhhvV0o8TcR62BRB9CAKgYVoBXLgH9J4vnbqVcRMbKLBH6uL7Zeq4Szx/hshZMPKwQW/zLKA
 zC5DqEmrccLeqVOLNCF1SBWLBUwUuikrj2Akv+UzDBIaGMVsfiFqSC/TiyigTpM/35NmiGW83F0
 nAzJMSL8OWN1tHqe28kpHQLZDjPKkS0sIoJUusTlQOaeUwCnmVPpjqFrrWoeAzjOAXdqLkIWeYo
 5yOLe+NEYN3CpeMksqqh9BH4YGScL06uu3mUBPU40LqMCZd+SMNYXT/fTISzWlZBk08X0Ns6yqC
 Ah4E2f7m1IJmo3VOITA9vn4vbQgEhnQ4Vo52nqPJ4U1Nab/lOn/YwszkhKvCxENWw6rZA1kEq8n
 zupCIXe0m5YBxRwXW4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
