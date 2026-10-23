Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715634;
	b=ED1f1gBShXHlMzU2EgJc3wQIxtUpbUcXJ8Qs/Dj7si+bAwjdYRmcu5fTevl1a3fZvU22
	 ufRLaAQzLA+Uu1m1Ui5VTTmWcxaJuIhSY4lmujrZ+n3Z/dPqn69dBFyQNnvnnZwPeoK+O
	 fgY08NMGKZEBCGUHKF1VMCp8izV4RbgN4v2JyUeulZMuwebZ0IljbUWcZq+aFnSkKn+0E
	 jL1eL3rV8BhJR0cEQA2nAZaHeClkhnRlyjDZR3ihKCaWMCZ8qMJtidwkZopbff7Pl+zIq
	 5SbwSa63x0TerSyIasObY/Xmd3wKO/g5kkdH7A/YFD2MXmYDypsPatew/908DKAwwpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
	b=o/tz15AHLnVejnSUUw5ql9OUu/B4ASOCGOR13a6BFZFJsEjhnXjC9mIikMOs90FHpBhy
	 F5fXKxRcNpiRFDcwazEyh+A/fQ+GWAIvUw136qOOWLAHGZKBGdrWOONWTAhR4XdiEdXBr
	 gl7tWi18t6CvyNBruEM3fe9I+Mr4cc0QXPTVy5IARqWhGvC4iyWjtdMwJfaUTGE/+dDFr
	 xKWD2gybEKpwQvDMQK14Colh7ctxFGRKIemUK94BSKNkszZuj+LBFNHIkcylGuoYvZl6h
	 4sQt5s6UYdS3FaFPYyQLt7UKZp6WCyjMnkk+/VSeEftGKEYxYkhnowAZjpz+I6pa4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcniAxqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3sMAVl2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcniAxqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3sMAVl2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MNn05t1688132
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=; b=fcniAxqiAREpru5+
	idc0NbAK8O75LU6J5O0fAOkf16ay/zqAoI8/cLH31J+0crCWmfY0+f324QfZU42P
	+k3kNkW3/rZtWiyb4REkHsPmHh5Bgr18AUDG2r6lNt7DH9PWks2CcT2pMAya2r7/
	i4yYX6t2fn07zJ5ogfMEBy+tK8WRyMuWCjpms68GR2g0ZffeGC/kWAnMr7Ei58FV
	e3CbgJl9O3WAkjHlRv4qN8BvrSm3+64+xbJLSylBsAxNa5Ouliq5Uzs8Rx5sUsVx
	4uKlMKdi44t8/U12+xf8/ILC/wY7qXzjop+ypfeEnvJqAPevyq0sRuv1ZqlX0zY0
	ZBVnDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj970m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:33:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so922910eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792715630; x=1793320430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
        b=L3sMAVl2KUfqAyuFEHbnldlUqRWi8u6SR+ixtubkVNqP69cVRIRwiwT10DxdsmDB4K
         AmhOsoRleskXNyRsUMtYg8FVju8miDFRGOHOTe1NaqXvccGa54Vss9Pl2v8uvzKoRJqv
         GJWOs8R1uMbbIJ2zVK3VgyOu6dqwE5feyKDOkpqxeEAU4QF38ISkn24phU2Vc2K298Xl
         lUHRRKfhlj5GMIOBkmhzlBcFqLq3IUBMOazTDD+BZX8KkY1CVolBY+TSpc66Dw27eplZ
         NJbIMGVGMv5QYujqGB+6lng8Bcc/An94whcpTzNOI/9YOtOi8+KHt4smV85D/XGCK+4I
         rY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715630; x=1793320430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
        b=y1YyOOJNUBsCGRsY5SDrAC2amJr8qdbWVZkyFisebcxPcKyRcIHVwPUSm/ro5mcd8V
         EBT3fS7ClCv7GkhvnQlJ0UEyxaze34baJVFTsmckv2mBUunDrM4j/Jsu6PDpgUxkzxbi
         2fNXrzJv782BfVT1dYPTFicM4e8dcIjWNzh7rfvYjG967QtryMV9ELFbQQeGvQBjipXa
         m+8+ts+r1PGpkSIKlYuqkgrmgW5cw1b0Naa/PzNSDkgaQwbiOGc8HZJbjfBLk/6geT5F
         OEThEYgNkJ7m77f7nJstSCoSU+zUw/qcby+DaoYuRK3NV/BG73TAbBidQ3gpz+1Be15K
         2G5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8B22GUR/UJaDERYcx/K60OK8yv2KhIht1xyc1XfrZEwttww5PRams2aWIp5gYI+9XnzkwF1XZI71Pu6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyr0tXRQW9chzeW3s94ZNsjPaiLJaVjAxXX/r1amU8Pgi6Qcqi
	RJReNaD8WxfSBBfPrM9vojqECID8UVFEfhZ3ShTMHcaDziMFYZkTFG8MiqWsDS6pVlwBkl0IjqX
	G54zej04b3nrhxYc//SjOX4317H9yOKFiRpXOnUSjUSKdJXl9wyRkXlwTz99UHbBum3E=
X-Gm-Gg: AYBFou1+HUReoBUzPDWEWOdGU+sgHT8NhyuS9TSDrgLEzlsa2fcAIhjjV/xpPU2CW5z
	I4RHMmmIqYmHLV1SGXZfmqfSn92BZZSupZfBRN8VPmilqANKXhXQOy32LKAG4yzfE3G2VoJNvcA
	nHTVCL0v2RYrRQYL+A6MrOkojo3SV+z6P46jzSm48VGx95pN8sWFKfcvhxlRdNc8I+SDBE5Wkau
	hP5z4TH0paH2ltYtTa66Q3OFYRuFPUvSa8WcdEd+11gXSpxS1tcLYJVvfEcvTtGWe60sFI3ZpMG
	kSAbm8gmXCrPYLVhm6TSD8q8onDAfi2/GUgHnyFogRZ9V4s/LE1t+pT8MLkZpdw+NRoTKIW4kKL
	5gll/gs3dXgZvbCRw1D7xOsvb3PZ/JBotd68He9f3C4rG5RDYj6zGvjfE
X-Received: by 2002:a05:7301:6f09:b0:359:818a:df2d with SMTP id 5a478bee46e88-369d9869323mr785151eec.31.1792715630126;
        Thu, 22 Oct 2026 17:33:50 -0700 (PDT)
X-Received: by 2002:a05:7301:6f09:b0:359:818a:df2d with SMTP id 5a478bee46e88-369d9869323mr785110eec.31.1792715629330;
        Thu, 22 Oct 2026 17:33:49 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d8978csm2283102eec.13.2026.10.22.17.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:33:48 -0700 (PDT)
Message-ID: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:33:47 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _cvWCqSKeblFoWl6GkihgzV7yTZK-2ue
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adaab6f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dOq9m7WOZSnMFsiCC74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfXydNSD77Vprvy
 BFk9wT087S9TQf7HmmdZZ3b5SDiUlMg3hwVzPvMVYtxpr3V+de6XOoFvDsgYE/+SMvQfKbgA4tu
 8B6LzSZ9w5WF/Cu32TV3ff8QY3nLvcA=
X-Proofpoint-ORIG-GUID: _cvWCqSKeblFoWl6GkihgzV7yTZK-2ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX+Reczfvrqxws
 hD4ywlgsJi1zFjsoc99YOOrEb13P51p1DQd9hZFoGI332yC4ppDI8FZpfLQCMcGKQjC90SttQ+3
 5ApX1fp5eGs/FyFa3xkG6nwtqlBybiwKNd4dStErgM6bwtuT1MNfLSrz2ezU5IXKJvwufhC7jJG
 TlDjBZMmYiFX+jC59ZvyFjj6i8oRV6NhbLIaICjWmTIweBRS8mxG/Op/LDQd+woT4PnsgdXbeHU
 ybpViKjE0mHayGikqrOS+IRWFCbm9icsZ1xWw7/d2x3d3l686+Ron7iRajAqa78Rju2E62VIe94
 ngsRq5bTRzv34SdLqVoSTki0UD/ptGvwPCss1TrUg8skTmRGw2dzB1/hqtDBXLu+65rvEF2ztlA
 ar4KtJEKwxFCNHqrQRzxkTsqpmmXfKnUQudIe1924CoppVkgkHUNhn2jhNq1ANnOudP3McwwTSi
 6Oq4fJwPC1EmCuVv3yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230001

Hi Bryan,

Thank you for your analysis and comments.

On 10/17/2026 4:00 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:17, Anusha Arun Nandi wrote:
>> Add PHY_MODE_MIPI_CPHY, struct phy_configure_opts_mipi_cphy and three
>> helpers: phy_mipi_cphy_get_default_config(),
>> phy_mipi_cphy_get_default_config_for_hsclk() and
>> phy_mipi_cphy_config_validate(). These mirror the existing MIPI D-PHY
>> generic configuration API (phy-core-mipi-dphy.c) so PHY providers can
>> be configured for C-PHY via phy_configure().
>>
>> C-PHY encodes 16 bits per 7 symbols across a 3-wire trio; the default
>> config helper derives the required per-trio symbol rate from the pixel
>> clock, bits-per-pixel and lane (trio) count the same way the D-PHY
>> helper derives its HS clock rate. The timing fields are filled in from
>> the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> Operation Timing Parameters"; unlike D-PHY, these are not data-rate
>> dependent, so phy_mipi_cphy_get_default_config() fills the spec's
>> minimum values directly rather than computing them from the symbol
>> rate, and phy_mipi_cphy_config_validate() checks each field against
>> its spec-defined bound.
>>
>> No existing phy consumer or provider selects GENERIC_PHY_MIPI_CPHY
>> yet, so this commit has no functional effect on its own.
>>
>> Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   drivers/phy/Kconfig               |   9 ++
>>   drivers/phy/Makefile              |   1 +
>>   drivers/phy/phy-core-mipi-cphy.c  | 131 ++++++++++++++++++++++
>>   include/linux/phy/phy-mipi-cphy.h | 177 ++++++++++++++++++++++++++++++
>>   include/linux/phy/phy.h           |   5 +
>>   5 files changed, 323 insertions(+)
>>   create mode 100644 drivers/phy/phy-core-mipi-cphy.c
>>   create mode 100644 include/linux/phy/phy-mipi-cphy.h
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 19f3b7d12b7d..a6b0749a40cc 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -46,6 +46,15 @@ config GENERIC_PHY_MIPI_DPHY
>>         Provides a number of helpers a core functions for MIPI D-PHY
>>         drivers to us.
>>   +config GENERIC_PHY_MIPI_CPHY
>> +    bool
>> +    select GENERIC_PHY
>> +    help
>> +      Generic MIPI C-PHY configuration helpers.
>> +
>> +      Provides a number of helper core functions for MIPI C-PHY
>> +      drivers to use.
>> +
>>   config PHY_AIROHA_PCIE
>>       tristate "Airoha PCIe-PHY Driver"
>>       depends on ARCH_AIROHA || COMPILE_TEST
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index d7aa516bcc49..a94dc1b352e1 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)        += phy-common-
>> props.o
>>   obj-$(CONFIG_PHY_COMMON_PROPS_TEST)    += phy-common-props-test.o
>>   obj-$(CONFIG_GENERIC_PHY)        += phy-core.o
>>   obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)    += phy-core-mipi-dphy.o
>> +obj-$(CONFIG_GENERIC_PHY_MIPI_CPHY)    += phy-core-mipi-cphy.o
>>   obj-$(CONFIG_PHY_AIROHA_PCIE)        += phy-airoha-pcie.o
>>   obj-$(CONFIG_PHY_CAN_TRANSCEIVER)    += phy-can-transceiver.o
>>   obj-$(CONFIG_PHY_ECONET_PCIE)        += phy-econet-pcie.o
>> diff --git a/drivers/phy/phy-core-mipi-cphy.c b/drivers/phy/phy-core-
>> mipi-cphy.c
>> new file mode 100644
>> index 000000000000..303b9a02f096
>> --- /dev/null
>> +++ b/drivers/phy/phy-core-mipi-cphy.c
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Generic MIPI C-PHY configuration helpers.
>> + */
>> +#include <linux/phy/phy-mipi-cphy.h>
>> +#include <linux/errno.h>
>> +#include <linux/export.h>
>> +#include <linux/kernel.h>
>> +#include <linux/math64.h>
>> +
>> +/*
>> + * C-PHY carries 16 bits per 7 symbols per trio (lane).
>> + */
>> +#define PHY_MIPI_CPHY_SYMBOLS_PER_GROUP        7
>> +#define PHY_MIPI_CPHY_BITS_PER_GROUP        16
>> +
>> +/*
>> + * Fill in the C-PHY global operation timing parameters based on the
>> MIPI
>> + * Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> Operation Timing
>> + * Parameters". These parameters are not data rate dependent (see
>> sections
>> + * 6.14.3 and 6.14.4 of that specification), so unlike the D-PHY
>> equivalent
>> + * this helper does not need the symbol rate to compute them.
>> + */
>> +static int phy_mipi_cphy_calc_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     unsigned long long hs_clk_rate,
>> +                     struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!cfg || !lanes)
>> +        return -EINVAL;
> 
> Lanes must be a multiple of three to be valid, at least for your three
> submissions to be logically consistent, this statement must be so.
> 
I will update the name of lanes to data_lanes in
phy_configure_opts_mipi_cphy struct.
I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
data lanes only.
>> +
>> +    if (!hs_clk_rate) {
>> +        if (!bpp)
>> +            return -EINVAL;
>> +
>> +        /*
>> +         * Total payload bits/s = pixel_clock * bpp, spread over the
>> +         * active trios. C-PHY carries 16 bits per 7 symbols per trio,
>> +         * so the per-trio symbol rate is the bit rate scaled by 7/16.
>> +         */
>> +        hs_clk_rate = (unsigned long long)pixel_clock * bpp;
> 
> 
>> +        hs_clk_rate = DIV_ROUND_UP_ULL(hs_clk_rate *
>> +                        PHY_MIPI_CPHY_SYMBOLS_PER_GROUP,
>> +                        (unsigned long long)lanes *
>> +                        PHY_MIPI_CPHY_BITS_PER_GROUP);
>> +    }
>> +
>> +    cfg->lanes = lanes;
>> +    cfg->hs_clk_rate = hs_clk_rate;
>> +
>> +    cfg->t3_prepare = 38000;
>> +    cfg->t3_term_en = 0;
>> +    cfg->t3_settle = 95000;
>> +    cfg->t3_hs_exit = 100000;
>> +    cfg->lpx = 50000;
>> +    cfg->init = 100;
> 
> Whatever about how DPHY does this in upstream Linux, these values should
> be defines with names that mean something WRT the specification.
> 
Makes sense, the v2 series will have this addressed.
>> +    cfg->ta_get = 5 * cfg->lpx;
>> +    cfg->ta_go = 4 * cfg->lpx;
>> +    cfg->ta_sure = cfg->lpx;
>> +    cfg->wakeup = 1000;
>> +
>> +    return 0;
>> +}
>> +
>> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!bpp)
>> +        return -EINVAL;
>> +
>> +    return phy_mipi_cphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config);
>> +
>> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long
>> hs_clk_rate,
>> +                           unsigned int lanes,
>> +                           struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!hs_clk_rate)
>> +        return -EINVAL;
>> +
>> +    return phy_mipi_cphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config_for_hsclk);
>> +
>> +/*
>> + * Validate C-PHY configuration according to the MIPI Alliance
>> + * Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
>> + * Parameters".
>> + */
>> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy
>> *cfg)
>> +{
>> +    if (!cfg || !cfg->lanes)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_prepare < 38000 || cfg->t3_prepare > 95000)
> 
> T3_PREPARE_MIN T3_PREPARE_MAX etc I'm stating a preference of course but
> I think its better practice to define your constants with names that
> mean things as frequently we end up reusing constants all over the place.
> 
Keeping in mind to rectify this as well.

>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_term_en > 38000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_settle < 95000 || cfg->t3_settle > 300000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_hs_exit < 100000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->lpx < 50000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->init < 100)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_get != 5 * cfg->lpx)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_go != 4 * cfg->lpx)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_sure < cfg->lpx || cfg->ta_sure > (2 * cfg->lpx))
>> +        return -EINVAL;
>> +
>> +    if (cfg->wakeup < 1000)
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_config_validate);
>> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/
>> phy-mipi-cphy.h
>> new file mode 100644
>> index 000000000000..7627602eb57f
>> --- /dev/null
>> +++ b/include/linux/phy/phy-mipi-cphy.h
>> @@ -0,0 +1,177 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef __PHY_MIPI_CPHY_H_
>> +#define __PHY_MIPI_CPHY_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#define PHY_MIPI_CPHY_MAX_DATA_LANES    4
>> +
>> +/**
>> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
>> + *
>> + * This structure is used to represent the configuration state of a
>> + * MIPI C-PHY phy. The timing fields are named after their symbol in
>> + * the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> + * Operation Timing Parameters", and are all time values in picoseconds
>> + * (microseconds for @init and @wakeup) that are not data rate dependent
>> + * (see Table 18 and sections 6.14.3/6.14.4 of that specification).
>> + */
>> +struct phy_configure_opts_mipi_cphy {
>> +    /**
>> +     * @lanes:
>> +     *
>> +     * Number of active C-PHY trios (data lanes).
>> +     */
>> +    unsigned int        lanes;
> 
> This statement and how you go about using the data aren't consistent.
> 
> In CAMSS you do
> 
> /* Set data trio lane positions and polarities (no clock lane) */
> for (i = 0; i < num_lanes; i++) {
>     cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
>     cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
> }
> 
> where num_lanes == lncfg->num_data;
> 
> Let's assume dt has data-lanes = <1 2 3>; => num_data == 3
> 
> Then in qcom-mipi-csi2-core you do:
> 
> /* C-PHY has no clock lane; all entries map data trios. */
> for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>     if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
>         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>         ret = -EINVAL;
>         goto out_put;
>     }
> 
>     csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
>     csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i];
> }
> 
> This specifies which physical lanes will be in CPHY mode and what their
> polarities will be
> 
> =>
> 
> lanes specifies the number of pads in a trio
> data_lanes specifies which pads are in those trios
> lane_polarities specifies the polarity of each of the given pads
> 
> To my knowledge the C-PHY specification doesn't mandate adjacent LNx as
> required in a trio.
> 
> => lanes % 3 should be invalid
> => for each trio lanes must increase by 3 also.
> 
We will do calculations based on data_lanes only.

> 
>> +
>> +    /**
>> +     * @hs_clk_rate:
>> +     *
>> +     * High speed symbol rate in symbols/s derived from link rate.
>> +     *
>> +     * C-PHY encodes 16 bits per 7 symbols across a 3-wire trio.
>> +     * Consumers fill this from the sensor link frequency and hand
>> +     * it to phy_configure().
>> +     */
>> +    unsigned long        hs_clk_rate;
>> +
>> +    /**
>> +     * @lane_positions:
>> +     *
>> +     * Physical-to-logical trio (data lane) position mapping. Entry @i
>> +     * gives the physical lane position carrying logical trio @i. C-PHY
>> +     * has no clock lane, so all entries map data trios only.
>> +     */
>> +    unsigned char        lane_positions[PHY_MIPI_CPHY_MAX_DATA_LANES];
>> +
>> +    /**
>> +     * @lane_polarities:
>> +     *
>> +     * Polarity (0 = normal, 1 = swapped) of each logical trio. Entry
>> +     * @i corresponds to logical trio @i.
>> +     */
>> +    bool            lane_polarities[PHY_MIPI_CPHY_MAX_DATA_LANES];
>> +
>> +    /**
>> +     * @t3_prepare:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives the
>> +     * 3-wire LP-000 line state immediately before the HS_+x line
>> +     * state starting HS transmission.
>> +     *
>> +     * Minimum value: 38000 ps
>> +     * Maximum value: 95000 ps
>> +     */
>> +    unsigned int        t3_prepare;
>> +
>> +    /**
>> +     * @t3_term_en:
>> +     *
>> +     * Time, in picoseconds, for the slave to enable the HS line
>> +     * termination, starting from the time point when the A, B
>> +     * and C wires cross VIL_MAX.
>> +     *
>> +     * Maximum value: 38000 ps
>> +     */
>> +    unsigned int        t3_term_en;
>> +
>> +    /**
>> +     * @t3_settle:
>> +     *
>> +     * Time interval, in picoseconds, during which the HS receiver
>> +     * should ignore any HS transitions on the lane, starting from
>> +     * the beginning of @t3_prepare.
>> +     *
>> +     * Minimum value: 95000 ps
>> +     * Maximum value: 300000 ps
>> +     */
>> +    unsigned int        t3_settle;
>> +
>> +    /**
>> +     * @t3_hs_exit:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives LP-111
>> +     * following an HS burst.
>> +     *
>> +     * Minimum value: 100000 ps
>> +     */
>> +    unsigned int        t3_hs_exit;
>> +
>> +    /**
>> +     * @lpx:
>> +     *
>> +     * Transmitted length, in picoseconds, of any low-power state
>> +     * period.
>> +     *
>> +     * Minimum value: 50000 ps
>> +     */
>> +    unsigned int        lpx;
>> +
>> +    /**
>> +     * @init:
>> +     *
>> +     * Time, in microseconds, for the initialization period to
>> +     * complete.
>> +     *
>> +     * Minimum value: 100 us
>> +     */
>> +    unsigned int        init;
>> +
>> +    /**
>> +     * @ta_get:
>> +     *
>> +     * Time, in picoseconds, that the new transmitter drives the
>> +     * Bridge state (LP-000) after accepting control during a
>> +     * link turnaround.
>> +     *
>> +     * Value: 5 * @lpx
>> +     */
>> +    unsigned int        ta_get;
>> +
>> +    /**
>> +     * @ta_go:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives the
>> +     * Bridge state (LP-000) before releasing control during a
>> +     * link turnaround.
>> +     *
>> +     * Value: 4 * @lpx
>> +     */
>> +    unsigned int        ta_go;
>> +
>> +    /**
>> +     * @ta_sure:
>> +     *
>> +     * Time, in picoseconds, that the new transmitter waits after
>> +     * the LP-100 state before transmitting the Bridge state
>> +     * (LP-000) during a link turnaround.
>> +     *
>> +     * Minimum value: @lpx
>> +     * Maximum value: 2 * @lpx
>> +     */
>> +    unsigned int        ta_sure;
>> +
>> +    /**
>> +     * @wakeup:
>> +     *
>> +     * Time, in microseconds, that a transmitter drives a Mark-1
>> +     * state prior to a Stop state in order to initiate an exit
>> +     * from ULPS.
>> +     *
>> +     * Minimum value: 1000 us
>> +     */
>> +    unsigned int        wakeup;
>> +};
> 
> Should the following fields be included in this definition too ?
> 
> - T3-PREBEGIN
> - T3-PROGSEQ
> - T3-PREEND
> - T3-SYNC
> - T3-POST
Right now, I don't think its required. It looks like synchronisation and
packet transmission timing. I will still check and add if required in
the next series.

>> +
>> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     struct phy_configure_opts_mipi_cphy *cfg);
>> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long
>> hs_clk_rate,
>> +                           unsigned int lanes,
>> +                           struct phy_configure_opts_mipi_cphy *cfg);
>> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy
>> *cfg);
>> +
>> +#endif /* __PHY_MIPI_CPHY_H_ */
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index c480d6cb42c5..f12337834031 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -19,6 +19,7 @@
>>   #include <linux/phy/phy-dp.h>
>>   #include <linux/phy/phy-hdmi.h>
>>   #include <linux/phy/phy-lvds.h>
>> +#include <linux/phy/phy-mipi-cphy.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>>   #include <linux/phy/phy-thunderbolt.h>
>>   @@ -42,6 +43,7 @@ enum phy_mode {
>>       PHY_MODE_PCIE,
>>       PHY_MODE_ETHERNET,
>>       PHY_MODE_MIPI_DPHY,
>> +    PHY_MODE_MIPI_CPHY,
>>       PHY_MODE_SATA,
>>       PHY_MODE_LVDS,
>>       PHY_MODE_DP,
>> @@ -69,6 +71,8 @@ union phy_notify {
>>    *
>>    * @mipi_dphy:    Configuration set applicable for phys supporting
>>    *        the MIPI_DPHY phy mode.
>> + * @mipi_cphy:    Configuration set applicable for phys supporting
>> + *        the MIPI_CPHY phy mode.
>>    * @dp:        Configuration set applicable for phys supporting
>>    *        the DisplayPort protocol.
>>    * @lvds:    Configuration set applicable for phys supporting
>> @@ -78,6 +82,7 @@ union phy_notify {
>>    */
>>   union phy_configure_opts {
>>       struct phy_configure_opts_mipi_dphy    mipi_dphy;
>> +    struct phy_configure_opts_mipi_cphy    mipi_cphy;
>>       struct phy_configure_opts_dp        dp;
>>       struct phy_configure_opts_lvds        lvds;
>>       struct phy_configure_opts_hdmi        hdmi;
> 

