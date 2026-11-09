Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208212;
	b=QeFPISONRuTcqUSyYFgjqjCA9jityQphKWHda5t7wghbNgjEmKw7Ae5kTPLQJ4xJXc5i
	 c3kEhI+W4upr/lIB+U4VAqw9ybKnZHnCMg2tcosO73Hav2DLpdbfsPCr82ZHG3zxVpgMH
	 kv9ZgvvzRUy+iIcVoE7HAyA9bf4k4D2jwor7jSvcVUi3oW7JHBHLTSdTyQUlSM3U7UbVS
	 U/i7bchIe2j1K9Ytj2IgvfXRhRp7LItl/BoL50XgoBpJm9JkcGfoy+gjNWUBDdKCMBMxf
	 ww6dLQj9Eeepev1/GyANLRYYLosMuMx0Omxe4wrdU7h6uYhlVnA+uv7H0BVEuADJOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
	b=kmY1NWl7vVt9jUFGfToFGT8DLTHKi/kJ4W9rlblrLeGxpkm2f/hHMJvukV+nATrcsjb+
	 V1/BQE2Pk/c2ceXrSYxFAXLRvdm7p/Ed333bVtmq/BsVjbJTm3nYyJYHDkVotoSuwgRsl
	 atijSA88Kms8aiYarfwZ+BoBbwdnq4PHQdvP0Dm1b7SsHwxUkiDGvnf6DJqhOBzPldvyL
	 xpIlFbgh3B2CGlJpO5jANMfQ+UPkCvWDLajj0c60YKST0yvA1ABPN5P3PjwtB9CJ1kwpI
	 dD01SuzAJfZJddYvLOinjX26jGUL+FDbH3exhRicIo3Wa77ko678T+ZfhpBunr7/Glw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E4606D805
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89E4606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AIAn3634656
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 07:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=; b=ejBy6W1kN3yns1U2
	17zJeRDHK4VWzF15HXswJ5WLq+++LvoYsgJZz45PV2ySKkNzW12sgxZAdZkZb7vk
	FiGzT9m0wxaQw9Yq6Vpn9THhsAaZnBxkS43MFA2hqsbW+n0Ri+ojzPQOKDILzzhP
	474tX/AZztr6UGYNcFnmuKFK/hKBn6XV/CqLMgZgG2oswRkw0zlchhrxZFKPIihv
	PBaqkzVUQSjJe/Q3D6cTwrRC88OPOytzqKbeg+rBWJ06mDMm+RhxxLjh27/7nhOF
	+X5GK5luwYrkpBaGAeLNZYtrXvOJvFUbOIa+/Hpfj4J2Ayio0ZtAWA81JI/zZuN4
	ML5Tyg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2gh7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:10:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso765085eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794208210; x=1794813010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=gGIcPeD4+YT3mxAvVzH1WR+UR1gtJZuBkSGwlwYkIn1tZWNt4bC0+wZz3bh7znik4T
         chdgs/bvEkwBPwZU0aXP6DhDSYXIB5L0sCot7XcJCLmmMLimhMV5vxU6c8h9xcZ8xX4M
         Ne4n1BAr7oQ/zJQ1GEo2hX81UhyLaPUpTlUo7HHuXOG2rz197sDc62kSymZYA0NarDf8
         qspTrBIMl50tbJ3U7cPvm4lWhb/JRMCn1DvWw9evQAzLWX4D1HnuHLOUxNasdvOrDZYg
         sQ8znDHAghb2Up2ktRT6wzti+puqNXXo2VrIm1KD3KPifVvsDW6j4dNhVzgTR31vQgQS
         /72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208210; x=1794813010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=I6rHnOmD29dipQJPvuORNxUcg3Z630ip1/bxLZtptyQCyCjD66Yqo6iwLmwtLQkS0D
         gAJ+FsUZyQ4YmBfT/8+UDP1S6NkRnZLNdqaJxUKPA7kGOoC2QFkpFp/rBERqYkbm+vFP
         DlwNO+1NlJevIOCmfkf5ihbM9J9NTBeNFQ3Iq8hw77F0wuCEp9EGYqS4ARm1x0BQ1PRB
         HXiABhTm+q3HmoEh6og3ABaHwHveCO2Kt76EJ3yPH05Aj4nEpefS5ucuSeN0EtSeZMC5
         HH8j/iTH7F1OHUr2sBoaHf/LowRKSbiqHnPCh/y8CG6GNnfHRWEQE7BCcWtt3jKKwC87
         TSaQ==
X-Forwarded-Encrypted: i=1; AL+hErHnJ/kP21QHJ7cFqfc4hctc6AmW/1tWYzQ13267zoY2Zkv2XIZMj3HMFAnutWbc+T/w+Cn1M0BemmnUfRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u5hQ8038uILkG1eSy5jsU5y/sjwXR2f4wRTMA0MvVSN7K9Vtv
	Q7L2n4a1b6i33GMXF+RVH6/BokdWQQVpVROnru8P0PQL7l//ITo/40C8ZKRCwc47vRPbgozG63B
	Dm6pTvcfxtUd0tzOzzueX72Ewqwj5P04SJt9J/c0D1fkUlXeqTm8Og0o/IiY5oTq1Mog=
X-Gm-Gg: AYBFou0c86kRwrryMD2qCtEZCeISwY0JEc5iNSJBy8ZNvN6KV1oq5pDRB6uhMkEvGvy
	hXm/T27jQSX/igiltQAHdemep+UMnYHiR2hLXyteCaS7ogDCu3U6VQhrR6wykRuET/ha9yJgitX
	l+KHknPSETjtf+r71bSfDa18LswdxIbmhnprHngApnlgjSGUi7I01vmdcyAD4DynJDiy8DtpeQF
	mKmJzo3J51A7AQM62kXEZrkYt5KDZ/rqO9q642l3Z8OovjgwUeQS0YmcQ/ZGqT+yqtHOgwmdDiK
	m+6iFeYdHkXPi+ivEX444p8N7G9Ws1XBAAn/V+mMmHsy8MuAb+geM9XZFUOWYMhdgcx20MCda/G
	1NDIAOklMDq4QjMAgDZVbU85SC1TX1ce/r4CSdgEaT/gd9hIBdjmXlyDx0shguEohtc9TgiP17+
	Q8Iw==
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10704000eec.4.1794208209553;
        Sun, 08 Nov 2026 23:10:09 -0800 (PST)
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703958eec.4.1794208208772;
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm11423638eec.20.2026.11.08.23.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Message-ID: <20300428-94fb-4ae1-8096-e6851f5483a1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:40:02 +0530
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
Subject: Re: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af171d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=r2-LxIRbSL4R5ck5jzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX9mc0E7CI5KW8
 5b9EdEt4gDkFgSR8O2GGMQgvJ1Du9VkmWcbh4PHs+wJuhdcZ5M4yrEyjN2WGDv+c2J9mzOxWHKT
 4+PQYoKJRB8MzQziFQL0IET1wXXZW80dvfHBmrzNRXA+jwLCfYMQy1vbYCUVN/8ApQw8yK8gHnx
 u9+hOKdh7jslOiGK7MhixcBBFZTUx5/uJbXi/7RURQZMBGjtV6l1yHWnLDF94SXBWssBSwJMiBP
 FhXDAkLApCgpoxQpByIIs1u0OtkqCFvG/DUZrh2D1LqldCxQvwD3ALCxsrmfsck/dF2/L6eHD+7
 ZzjDo0SHrEuDtEq5B3QSpkq1Ym8FMwL0vUxQUnvhB6tU1yYg9ujcbb7CtGYR6I6hGctVM73erL5
 fmuqrsKwAsMOio98V37ond9tz9060rLTpuVRZt0zb2COeGTsPScsoNtCBI73416IFC9+QCv0kzF
 gVmBdOEmW9eFxI+or6A==
X-Proofpoint-GUID: OTyWmjR0mTTzz0nNFp_yRLCXM9TdrTyU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX73zWY3UeReX5
 NfsS0mWRrbWkhl16MuKuq2xxBGvhPbsEAZ7e+fLCXhanonYxRTpKZFp4MhFKR2wNCoA10wrLxzg
 vtljNjCdlPGyCVlDcGXBDha50yRzeww=
X-Proofpoint-ORIG-GUID: OTyWmjR0mTTzz0nNFp_yRLCXM9TdrTyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090028



On 11/8/2026 8:48 PM, Mark Brown wrote:
>> This series adds QSPI support to the Qualcomm GENI SPI driver using
>> GPI DMA. It supports single, dual and quad SDR transfers in controller
>> mode.
> 
> This doesn't apply against current code, please check and resend.
Hi Mark,
Thanks for pointing this out. The series was based on a slightly older 
linux-next snapshot. I’ll rebase it onto the current SPI for next 
branch, check for any missing dependencies, and resend the series as v2.

Thanks,
JyothiKumar>
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20261021-qspi_upstream_series-850249e432f5
> 
> That's a random -next commit...
> 

