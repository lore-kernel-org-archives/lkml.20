Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE1480321
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849263; cv=none; b=hv8A2liFh4Eqouexbsy4iSg9LoCe2uRYbS/DubkKNMP/vEl8C+mzOMkLnfXHfN521hs5oh6Hm0KVcTmZl2+b3t+ovRObAqGmSlh9+CyJC7dFlrur6jG/DXcNVGEPD/unPHTbu5qEzfZnKHrRq+U5tTIvTgqoIBfnQ3PSWI6oQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849263; c=relaxed/simple;
	bh=EpjAEUSVSeuXg5aaJZz4qmdxvfMgj7QAYON+CspyZ7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcziOVyV0V1O/KDK9TFwb7xNSdytTxxHtuNcoc9fEwrUiD+isWqiWiPfuY+qgeCAPxE+vp2SWK2aGTRajfhVoRiRQCdFd023qLaOG/lEd+7jnsin0Ng+hH1bPvtBatayt3RHpvkC70Nk+Son+5C9gmUxmAB3cdld6M4n8+RsNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzS1TQTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/K240HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzS1TQTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/K240HO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFceSq3943235
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=; b=YzS1TQTXMjf5cW4U
	eEqDAGdglW4D3gG22mOeeDoKfj4kkOo+ZJNWp8rbdHRB5XdGsOHbadjiShL5uYKL
	m74+ahf5aH5dt+q7t/WUiLqNNQiijggXmwBTVpBH+X3zS2Lz8z64tSUhvUv8lXko
	FKItQKJgjJFP8e3dsuanck7evo5biLlFOFGdVhWFzgtif+EUYlB6stAN7wrNSspi
	Efnly8LzDl84/p1blOUCQfU2aYjr9rfNDGoakhisWbTFwhfmGKfz6NFxfHNaOWrT
	Q3f8UMwV3FKaHRTLZGxikov9/luY6JwA5Ge0NgeOyo15r9/wudG8nFSoUCXBASST
	u8u/8Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etv9tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:47:40 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b325074c26so235996b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849260; x=1788454060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=h/K240HO5eCg2CrlmyAAZOfxaqGC0jsBPiuZejT9fZH32wEWaVUXzgUOgGt93d5yx8
         BIDIOUBMTAmFWVWyX0touZl5pseplXstzKtihq7vjibnRA6JmxQOjhCk1Q55BfA8M4Mn
         LiwJscl5lRwADMKaHIt7z1EJzeNNjDaKYtTAHzncnJJUb6lFphua11j/PmdLXjLasf0L
         yhGVKEvJUPn9aXt/RWmfM97eX+Ko4/D8MvsLf4XlyIEkagJtzt/7znIqQ5NAWNZehPiA
         Z+fv9Hnm4Bdis10HUpIn/qoO0bEFoDjfFsZboa9A8ICQjLpWEOggA3iiDmkf7h6ItsUp
         +X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849260; x=1788454060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=k221l4f5zxTW+p/SfNwixgAYnuAIgCZvy/2fdzNsi4temCSKiAsfWuNS2o1nYfLQP6
         yHeIPkMzjE12U+aGr1K+sq+9dlIl0DTb3bJooTavRqrPZIFHtva6wnDk/fhb2/oZ4UTA
         loX9Jjq+1zoGh4P4400piy16RpZ2k8jlYgPVDGTDX0+waNOr0Jr4gi+8VQdBQPcMgzn2
         1uV61jNnyLjBA+lY/ymBhECqxg36LLcEM4qqgewzZTM6w8tj2FymJJic72Eitd2ocwP/
         t9LstcOK8igQMXPDEngOleZIhJxmroQspYgnSzXCBqT9DWp6jSi26i4nxG40IjaA1V9U
         Q3Vg==
X-Forwarded-Encrypted: i=1; AHgh+Roc68laiwz1QH+jQVdUxVHspNXju/KqbkxhYn7lHbq5UO7yWviBYvIpDFc0v3HmvmYbFPNcppdnykJRoig=@vger.kernel.org
X-Gm-Message-State: AFuF++njUewgJUe/XdhW357+73K5wCIId4cMWrVM5dtfclUeyLMEwMSv
	u76Hhhy0eRpqx6+nQiu97mpNUCkrBHDV7YauW5X1K4daJihYUIDg47J9+oKTxxRDPreND7IQTUd
	yMxQaP89bMEO06ShfVRpmADR4WvtafakP5KgamGfzZrLwa5Fldek9yvnkaaFbjbyv7Us=
X-Gm-Gg: AR+sD12Li1Ql8Kr/1EhzcOYWbdHCkIRlkAD4buV94xg6tEvk71B8++i4xOKHyCSuSUS
	QyauEqQOQaKxcUFrtsYkjxOYnfBO/VlXuukpp7DHQXuttky8D9VWOBpw80WLh/8BGZ1R3ua2LNO
	Wcs1VtWldM58WmXC4O10YHnEhYe5BsDNqiiwr1G5R/ir3Kh/1m1IJEi3gPiFB4wFVAnR13i0tFZ
	CFVgtXnw+Q4uuJR3lEiJ/d4yKPPRbithWCXRt2n0L1+ehqNkqTjtdpd+u7DX7Q6bgh9gfE54fVY
	ZfEEc2VRsct8CkSZ1LH/EVHEWXLOB2/NxtQwZKGaV+3aWq8KDhFmcVbLnRmkKXlO+4f03h3RO3E
	kFUNcCk5ezfSDgJxM6SktXICnn9wPKKk=
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35162b6e.16.1787849259952;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35036b6e.16.1787849259382;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b36ab2b542sm4508205b6e.10.2026.08.27.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:47:36 -0700 (PDT)
Message-ID: <54721a71-cc94-48d3-9581-4d2b09038d6b@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a906a2c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UvNzHEgi-OKrLzb5I3AA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: KdIu9WJ9Z_re7C44akAMiCSQJGV_U7T6
X-Proofpoint-GUID: KdIu9WJ9Z_re7C44akAMiCSQJGV_U7T6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXxQq88Qk0nG22
 P8fpIf10W4whT9HsA9tX5AlR7AYIQaJ/WdMdYS5m9ArWPHYy3CTbHX1lU3PFFGGYMOKuxgK/ZAN
 gmzmAub4J1SLwATMddU5f0wyzQoABP0O+5Z8Ao6thk8ocI8utrT11+MGbYXfFNZjjswwGbwb9MW
 l642RqpOnEfj/vg8klut939LwErtmlK8jwRlv6DVgEJmcGaNpzfaX0xIrowqh0q2nAmmCJAW95s
 NDwhOxZk14PEsEgMtuvgUW7E8ygYXtSlizDF/edI6/Q10kEItsiJEF21DATw+xRPkI2ojUXF1Iq
 UhMKXdIba5emeLlDb89K5MVHCS0eMtcr7vSwQh5axkLbAPX7nN26lRY9Z5oKv73T8Zf1BVyrlDV
 sHg+wh3BoSBQriydWWJJFq2K4QQlpuIEUOnm2G/khaNSySsEfXf8l5z91vuaWJ5js2qPQQrdNbS
 izrJFFozuYDuiPTpL4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXwsofkdW9Zlrg
 nuj70ERR1hAbQy6uSJjwxp+B9hvWnLN9S/Vvf17I9E18dhPOZF7yTtFuoke2yrInculwBrqfb8U
 rqsAyNCzMvQ6AnGnC9OsqC/LT2xYzpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> On 26-08-21 21:39:00, Hardeep Sharma wrote:
>> Add the interconnect provider driver for the Qualcomm Kuno SoC to
>> enable bus bandwidth voting on the platform. This includes the
>> aggre-noc and cnoc-main NoC instances with their associated BCM
>> nodes.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |  13 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 992 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
>> new file mode 100644
>> index 000000000000..9a5bd53e7ed9
>> --- /dev/null
>> +++ b/drivers/interconnect/qcom/kuno.c
>> @@ -0,0 +1,977 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
> [...]
>
>> +static const struct of_device_id qnoc_of_match[] = {
>> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
>> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
>> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
>> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
>> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
>> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
>> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
>> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
>> +
>> +static struct platform_driver qnoc_driver = {
>> +	.probe = qcom_icc_rpmh_probe,
>> +	.remove = qcom_icc_rpmh_remove,
>> +	.driver = {
>> +		.name = "qnoc-kuno",
>> +		.of_match_table = qnoc_of_match,
>> +		.sync_state = icc_sync_state,
>> +	},
>> +};
> qnoc_driver_init() and core_initcall()
>
> then
>
> qnoc_driver_exit() and module_exit()
>
> Please have a look at all other Qualcomm interconnect drivers in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma
