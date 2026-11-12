Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475949;
	b=uDHQNXhuXIeq4Yaza6ktA4/Jb6U9Yk+QFrYvgDE7JwQl2q5fFEA8way1TK94aGKBJpWx
	 owqoR0E2vojOVwoHNffwd0JmsPEvCnJmYMx9Wo9lTlGyjcgndIj3MycIl3YDL8Grac8mH
	 rGYkW0PJKWTo1MebMx36M/blq+Q4ZbZc/xlwYaUwVwZwhX6Rte7quiWkFTYpWOQ38liLE
	 e8XaUvIvnZVnw8c6Jhymvz0WCCxOVi3kjgudhr/S/TDsKQGG6ElIAKpM+IDaaBKGIOcmb
	 Jl6D4kARUUxdBfErYKtaPa6INL1c7QdvCNvOGNPlhcKGV8VedoYkoAcq4LPfIoNzo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
	b=btzyNsKlsFNcuLo8/vI4hy2V5M2j5KhEGrq3O3xb3wG0RfjR7dIo6C/EOyapz8GAfetR
	 GLgANBJMnfBz9b5i61f+pmLSIFTAt96OYy05zRO/FvCHMe8N9QInADlI4G2JdNZOPg67d
	 DiCyNYt/jPo3f4Bw3Pfh6emA0102GPwE20QaeZDqtgG/v6fsx/nyYDpGdnymLZnUny7P4
	 iPf23ErPMETWRjRsr00X5Kk2NEiIhtIZr54sYKKJsrnajgmGW0/enH35Vvo0hCenfRBAb
	 l1cG3NVlzGrz9YBtsHLOqgoButcNPO6htiayVUHnYxpYKZvrgU5IjMv1YfHpHydPZxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VmF/cr7R";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyW6ckro;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F964606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F964606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VmF/cr7R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyW6ckro
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9D4T5904025
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=; b=VmF/cr7RgX5IKly5
	nB8ld7K5D9AzKUIOEugReBYCnCvRZHnKq8ckwwPd3MdCpgn6tDd93WdjDdaA9b6E
	l0WSMXMRdGhMoIrK7QPZTPN+yMR0023gcBHh+rvBynvJ6qVGJarBEd/2K6ZAWKcl
	DHi3lT7Rw+HeUI4zOpJDUzpLh8wrBibWKeYtghBDeSUwZ46uA/eFcxHiB0sK1pwR
	DYEhD6popASG7J9wELjVH56JMoJgHLIZ5uDiOiSzXEzXW4T4vJilMgZ9OWfhQ/3i
	nfMcHwtge9Ud3f8pW9WhIPlx4NMjYvP6zLErMZjKSranHj4kj8rXupXMGGXtMg4U
	sLscUA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uby4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so3440760a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475948; x=1795080748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
        b=gyW6ckrov3M5yBCbcMW0mWhIqlGVNHcXVKEsGDNHo19LczygTWQY8iWplZMQFu7fI0
         Uan+uKmJMV2UXf5Fr6Wa9wolBUvviENzn8K0lTCUUmXhCvuAPUr9OrOZn+8zP7K8/W8R
         e31Da0SLlAK8B20rBfkoUCgzuY8bBCoRPWK0dP77ql7fJyRjbd6SyCZoqniZW+LUhCeF
         ZmD1NPp5hgTlDt58hOHepmZi44CDD25JTt3qvGCR0UbCyiLmNabox/qKTcFDQVCyhmLg
         1PLCEr/POPKI+qqDHnlUvCIbyL6ksCpEqNh7MG8Zr0HrniAZI1H6VS4+3niL5NEWkacb
         oMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475948; x=1795080748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
        b=0zvHcRz9iCn3F1h6/uGWKZpBGLR2D5r/IcbwtOj36QKNa6TcxtOTU2duTMgO2cP3an
         n2WRtkuo/Eyo6Toau6AqwmZLrdKM6kOsazrSz2SmSomWa6uMBh17TwneGojwqJfuqmHk
         oqXilHbrKpNEeutWHmcHsifyd+MHe/uCZ3Cwx4ZyYeCoWlknG/fUmZ9x18Edqy3cxLre
         vqR2db+w5E0CIPusr9Dt3skiIWPjLYiK/l2NieAcJ7LhucBsW1/R5jbyEFHRy/tTo1Fh
         OL8zz8N159nO6lysdLnWkbelLIR5hwR8yvMuBGmeeZ2VekEGkhVitSGu/jr2Blmwd8mr
         TziQ==
X-Forwarded-Encrypted: i=1; AL+hErEwFopx/Dab5r7Mp3Zwi3lXCgNRDkVWzBqj9epjtcDQWC1z3zpPb/AL8Wdkn+iKZ6DbYCcViDHveBgzsV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ii9uODL4VV2uyvvOITdk8R2pvfcr3i5TOyEvS1QW1C5qEI/uq
	WDcxI6Jt3HT7ZE6Jr8e7f9Z9iD2hWhF+FzkZm74a3pw0v36h6CFHqR7t4sq3Mcio3ZDykEhkBgM
	kAVfToSGBh8F0/Oqvinfhu75BJUgTvJ6vUSDckc7iuXafCj/jHA/NAbyDrn84EH5/eN0=
X-Gm-Gg: AYBFou0E/YOoKEDTGRmY288mL8KVUV1B3ICONawZFBw7SMh4CI7d4fRIKCuKOQttTc9
	uFbEf1VrsOqKAk15fCtCgwFlEkmLPP8Y29qYgc8FIqoMQYcMu5EYU9DRQikREDQakVbSFFpooGV
	Ca7u6qtUsq17r+ERjzaxKR0/iblKKLEk44hXS29XFVDlultiTkUA3VCbmbFUixCD4FhWVAZa+vD
	ojlUc7VQDGnxbqfivOj2XYRRsXSwv70cM+HCW35fmJY0mxywWA653SegqvHuu/qoG3jAyr/D1WI
	fYgOk7F570XlXrPOTlbnrqtB3FiFXDakaeSArPRrc3LZZwV724MlHcv7v8Rz9uqSHi3hEFYFXtt
	5pkNRAG2KzOOmbkyF4ca9Hb0VX9OcJ/EgTqM3KKpOvvof9J8FtbNx+2AMgluWXhd5zsj6eHbJtA
	NF
X-Received: by 2002:a17:90b:1647:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3b182f26a0emr5088693a91.25.1794475947509;
        Thu, 12 Nov 2026 01:32:27 -0800 (PST)
X-Received: by 2002:a17:90b:1647:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3b182f26a0emr5088666a91.25.1794475946998;
        Thu, 12 Nov 2026 01:32:26 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm3803578a91.11.2026.11.12.01.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:32:26 -0800 (PST)
Message-ID: <28202f96-f234-4c7c-be6b-3019e119bb0a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:02:20 +0530
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
Subject: Re: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
 <20261109-sticky-caiman-of-research-65e9a4@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-sticky-caiman-of-research-65e9a4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfXwCbWHF3cMmdK
 rxftNEznklXGHmerZkN6DpseUGTLt8Ctn7+EcPBEsxInoVNecjadIXVaDU09SwiCtpQH/kcpoof
 bEWqKzQQeka9j+3EkenQJBJre+cprrs=
X-Proofpoint-GUID: jO6HeFnFAEz3iRbP_5aQdEwxCmqPf2id
X-Proofpoint-ORIG-GUID: jO6HeFnFAEz3iRbP_5aQdEwxCmqPf2id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX5J2UbEjcnKcD
 J4IweWN5R3PA1Anj9Dwh3EKJTeJsPUKnJzKuOc9J/ClIkTpkxuB2h8hQrTmVyyiHkU2A9b8RbFz
 nyzSJGnMa2EuZ6FehlPv+Vy1xhuDYCfTcdpulj4FrcBQ+/LBWPBRixe0qETgyqzijxIkrNDlKZL
 rWJwSLIlsQHVKM2i210fw1CcBuKWRGvRMVkISDdBLDawi8RwgD5jh6E66p/mP9o6NkwO4tOpNzQ
 GTYjmQix7vUvFRH19k3Yhh3pGaTnsUuU2MiIH4Kv4Imjyqmiwo7c25ERJ91o7BEvI3+s9TqzKQR
 /GfQuvmmDrBLfmkjYPOP7tlzniAaplQBXOrpRVv322APf++EyLQvZcmYD+jHZDQqKRMBqrpUkUC
 bO4eKAWWZURSPiy3Ioj613aMlytISY6G9rNltcLg9djdimarWnYrqKhx9D6HhhvYHxUIEPBTya1
 rGp098V2sEtZ3PAmnaw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af587ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VFrjYgP8P-MpaLTDB6EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:19 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:23PM +0530, Imran Shaik wrote:
>> Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
>> on Qualcomm QDU1000 SoC.
>>
>> TSCSS is a time synchronization subsystem composed of two main blocks:
>> Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
>> provides a continuously running counter used for timekeeping, while the
>> ETU captures timestamps for external hardware event triggers.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 170 +++++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> new file mode 100644
>> index 000000000000..52a063ec4b78
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> @@ -0,0 +1,170 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm TSCSS is a time synchronization subsystem composed of two main
>> +  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
>> +
>> +  The TSC block is a timestamp generator that maintains a running counter used
>> +  for system timekeeping, and is functional with just the AHB and counter
>> +  clocks.
>> +  The ETU block captures TSC timestamps for external hardware events. Each
>> +  ETU slice binds a slice number to an external event selector, and
>> +  generates its own interrupt when that event is triggered.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdu1000-tscss
> 
> I failed to spot the difference against your binding at patch #1. How do
> they differ?
> 

The ETU interrupt wiring between the QDU1000 and SA8775P/QCS8300 is
different.
The SA8775P/QCS8300 share one summary interrupt across all ETU slices,
and the QDU1000 has each slice with its own interrupt line. Due to this,
kept them as separate bindings.

Can add them into one file with an if/then on compatible if you'd
prefer. Please let me know.

Thanks,
Imran
