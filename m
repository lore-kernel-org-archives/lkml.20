Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271440;
	b=DXTFjofkwmWXl35kip3Q85Lyq5TKa1+ZzW41StsURcUZuxllNLXr3RK+uHDD5J4SBUkh
	 CCzB8vc29GpMOoouZ4jxI3EuWGJXDE6nqNFx4Y3HW41PW6NjF6Fq8wYx+C7Te7Po8fEU3
	 pjdYLNs9NL1KhFVSynWkLXjn2GWqoLYV3ZwTijK0h6dZvrAY+2dK6kkcTuvmO0qrhhbar
	 F7DhOHBue38xLf9RnV2DwJsrzzxpVYtp6uGGVcDUb/qBD7Q09E4+Z0etE+sOg3txBgrOv
	 wTgMtVPvOa7WvYUDd06AFOEFINKeXD7EWLkKmyk8LMF0cg8QrA7VCtc4roK1FKgdFUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
	b=jK7H+CNUxrz3mBIbFyRYgdhqU/ABJ1tbIMKM/2kzxzu/9zRM7Bjub3k/GvzAcR1RHzbt
	 mERW8mtPRLiHZN4YDT3t+Y6c3mdHsyUD9hAEPxIUlSkWnpGhNs5CNUTEEahPoE0J7DRT7
	 miD7R+PLbWZmY/mbUukmsrw+pmPBCh2PuWDIHgIyOLQnVtsOViDMMd7gNWQqca7UuKz8m
	 vCmu2Rd+oQCF0HHDFk9HUnWVQEN6vv4evInJvf5D1MCkcapVg5xfbh8q4AUVdiP4q2ZhJ
	 nvZwnj7gSQdXGHL0a62LKzX55/csfxnCqI0llAknsWGmgrCs6LDw+jrSX9nl5PMbCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2MZuy2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38386606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38386606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2MZuy2/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TAKSwt876700
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=; b=i2MZuy2/yK96cTff
	Tb89mgWGzwkD/bIkDe/ptWarvCjxPg71VlfwLNYa2tJkpmSYU125ypVl9vbjNhht
	OgkynYu3i13PLqDWVtEwzxyHubcM27fz7cCRigLbcb9aYe8Xi2+fGLzgk+xTdOes
	teBhzNrs1FyvGEt/zfBXJiDP2dQ+lqk8Qb2BKEcnptVeVYFjQ9ixaGmmDJ0+XhJB
	jfZIuHJKcd8wf+epUhVimG4Ch7ymfslIP6Ffq8ie9hDSovae7RJ55PsdzVaHxqBf
	Np/K3JfbsVTgu7CWRYy6+bQH8egrBeXFV61BDDEMkLqaVI/qxe3MV7ZfN3vJ5uXi
	H7gFZQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a203xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:57:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4243291eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793271438; x=1793876238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=A4yLlYON7sXgJCjE37zIQmykFs7pnYaUCMusZ4R7nvJ5IDLlKbYEJ51nzqWS3Ji1P/
         BtvgwYu59MZj6u/emQofn3Y0/jcHC5RJrX8s5a1olhuhrLPQmwcNnPRV/Iyrns28h9K6
         T3hHalSVBgZK3sfFOAjyfBeImnEZbyLRb21Dtx6ZmFYxCzLbPgNjaEj/yl6pT2M2q2UN
         enhNutdido0UYGBbpDCG+vojXekVa6cLyvet7nryaF1ymulQY7cvIggTbfzHWIQmcnpC
         9gVnITPMWGlYuxBdsoSjyBbmi3p6U9q+j3G5BF4t9bDSqSXR7K6tjcS+tlFIQcTUg7XK
         YB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271438; x=1793876238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=fiBHDJmHdofNxbs5ERj0I4Yp6h/B/KlD+0KnimFZhB6FJAAFya5fbb7CyMDMqNxKM2
         p53ZsFQhbHPH5VZhAt3T9/sOj57HX73FeP0Qhhb0Rj1+DIWL1a9DbspL4/vzWZAyEeRq
         3lar7OK/sV1OwnLtJ6U7ZI3nV9ycqcvi2AkYqM0AkMuLWwh0cbiRxJ+9IjeOmvRrGrEF
         O3IGbG5uOGASdyJwQj+eRGs/+0mJgX5XeGzobv5K/H8SmLIWP9qLWrt3aCd6COzB9OFz
         Nb/EAM1utPZo0/3HCasA6BLjv+M9VGPjk2UyOzfTb3HYN0ZBNIYktyvCBCtmUSjH/vBx
         OKhA==
X-Forwarded-Encrypted: i=1; AKwUvBxFU7XnWRV+dkzXgFJFFxrZ+YUkGlkNywltKT/CZ8hWJnbyLkkdXJmh+rAsbOOnjZwf2NA35f1MfTipVo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwihe4+6qgFoMCYaggT+PjPZT4lnbRPEceJcd93YizIf0ABHM4
	URteoE6n+iw3papCi5Dbm/ta3dbeB+3+mP9NfG1pDf8XcQKbSja8PkF6XZQkRF3moT78+jf4Uto
	TkHrWLXd3oudNHVuGR1BHjIquhbbePI7MxcwZMFS5go8S2O2A7wZkni3PVBB80v8+Xvk=
X-Gm-Gg: AYBFou1R+VgjE9D/bH+xbm8hX9JZt9KPWpeXUwtRreHXQb7j/M9f8/d5LJmVZr2dGCm
	H+J4U4zWHiWUSSRGM6DlGeqLpioV2wTQi7nWQtoMczdWf07WPmhYaA9WBraOMyq06wOQWcAWWV6
	wFNEtG6I8zqIn60g7HdseMdhxdm7zB/lnbKwqDzePus1Tg5fL8r2/AGnVghtiBc6N7uBVP9xzFX
	0NxAM1tRpTn9PYpqb1dqiNJKNMVuyoeczkIjmq1rDEaqRGnsohcXm0Nt4TuO2nPq4COi//7eu/G
	/eEubTFlBWGmps6lsWlRcnyhRtx4tCDvL+POSaJqYI5tNAWyPVgXiP77YR2Knug1QCYYaAWiBDe
	9BecAs25AETjprMFRXqW/kP+U5VNjp5zEA8sa4ujlxIQCBOi5iDCBavplKinF8av3vuicxSWOSy
	qOwQ==
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591285c88.42.1793271437493;
        Thu, 29 Oct 2026 03:57:17 -0700 (PDT)
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591244c88.42.1793271436760;
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm20562986c88.21.2026.10.29.03.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Message-ID: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:27:08 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX94Cc7ikYkR8Z
 8xJQD2j/Jx1Zqn1alq+9C9iun4jjKd/vCYG029JCdiAmQmhfvr6FrKzR1GcOofNNYdeMTsaYlD/
 1+/ZllU8aAPnYJy3TOiw2Ng+P/8YFtRb3QzyYJsZQhPZhOxzyJaSl/qLYvNOv1YIC1M4ed+iyXh
 Vs1xA5FjxvdcjGsEFHBSBiCHQxMAwVv5scVUw2VGKGS2QNDQ2Jv3xKvpGs7IBFyj0M51OSQhfY9
 33TTjjz2Zj/LBOpjlNx2CC34k7kzMaQ5UqIR5Dl2Ub4NdUB+ZUqNkORAkGUPHLuU4632WT8Yg+r
 +XmdIgu+UataRsF2EVY7hi1g617/jfyyF3ehYH9ZT+a7E1Mrgfuy62qqjAR1tIr6lM9ghQQiT/S
 EnxETrPvpIi//owp2gu3dudkRGgVW9PSTcyQnfKdruRHuUOjTB/SPCW5Lu408iqCWz0f777dFhP
 1Ndd7Ar2ei0BwxdnKMQ==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3268e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=LB2yG9bKkngd5w-dMicA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX5NdCn7PS3pjq
 mFWKdO5S35DGAHjM4QKOnV1Zq/rGvyQsAEYTPuvejg9VYV3IVuX2GBLc+qDU/7hndecTfy2i4Sx
 uP7K1wufYG26OyxGk+Pfkx4SgA+sUsc=
X-Proofpoint-ORIG-GUID: Wccu9x16bNqzYakQU-dnxZLOEXJ1Jjfg
X-Proofpoint-GUID: Wccu9x16bNqzYakQU-dnxZLOEXJ1Jjfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290042



On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> 
> Use fallback as filename, so qcom,sc7280-gp-mnd.yaml

Sorry my bad, should have renamed it.

> 
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
>> +  (TCXO4) with frequency Fin and generates an output clock with
>> +  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
>> +  and routed over a gpio pin.
>> +
>> +  The divider is configured using three registers:
>> +
>> +  - GP_MN_CLK_MDIV: holds the M value.
>> +  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
>> +  - GP_MN_CLK_DUTY: holds the D value.
>> +
>> +  For every N input clock cycles the GP_MN produces M output clock
>> +  cycles. D is the number of native clock cycles in which the GP_MN
>> +  output is low, counted over 2^13 native clock cycles.
>> +
>> +  Hardware constraints:
>> +
>> +    M <= 511
>> +    N <= 8191
>> +    N > 2 * M
>> +    M < D < (N - M)
>> +    M and N must be coprime (no common divisor)
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
>> +      - items:
>> +          - enum:
>> +              - qcom,sa8775p-gp-mnd
>> +              - qcom,qcs8300-gp-mnd
>> +              - qcom,qcs615-gp-mnd
>> +          - const: qcom,sc7280-gp-mnd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: PDM XO4 source clock
>> +      - description: PDM AHB bus clock for register access
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pdm_clk
> 
> pdm
> 
>> +      - const: ahb_clk
> 
> ahb
> 

will drop _clk suffix.

>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Neither assigned-clocks nor assigned-clock-rates should be needed.
> Parent clock is outside of scope of this binding.
> 

Sure I will remove, but the parent clock input is a requirement of the
Hardware and the output of this module entirely depends on the above
ranges of frequencies mentioned and that is the reason to keep the rates
specifically. I will capture it in the description and hope that should
be fine.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - assigned-clocks
>> +  - assigned-clock-rates
> 
> And these two should not be required, either.

Will remove.


-- 
Thanks,
Taniya Das

