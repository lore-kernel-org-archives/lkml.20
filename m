Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB464BD376
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885508; cv=none; b=GBNy9Q2goDPOJLoFytG4If8xhIekCv9GJR1KowiY87G18F8XJrXqK1e0QvtilIBQnwuTOQ9/WH2ORUjj6Sps8vuwZs8dI2fHGNoXK+Dqv4AWqvtV14OfhAsQOwn+lao3wMRFZPMnlS3nNv6m+PsmvaDyu9OEIeoSPdBPTS/Svow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885508; c=relaxed/simple;
	bh=2dPTRel0DT3n+CZtpIwB+FFkdaQRRQzMwPcArTP1QWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtErZwWkauC9TGYWv0Xf4AA3M18LcW6IQ/8sr59eh1N4+FnyB6JLtf+k0IZ+s27zp8kfHn+Kuy/HNwTI0nFDXrrXD2Bt+Dq64Yi4NKX0R+5dKzRsJ9qCMNadbVOpJDxIJ0Noa1gGmxoBtPtlaZKydJgSbMGTmKgNY+1TbYeDhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMFT0x/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=excWAuUf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMFT0x/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="excWAuUf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xv47790856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=; b=JMFT0x/QhIve9LNV
	RmsGXNrDHU2YziJBpPE9fojAYA5Jlxpqia/OMl0DCTmM4Vl6Rz7z+t79fi9EBST2
	g15yrL/S6MtccbBV0xXN5SpU8BnQIUL6MEmSaC5IiiczaBxxa0jihurViwK+hty9
	400HpHg9UGE04+4QSpWuF+29YTNa57KpCLETyc8s1NOuLQGE1Qr1Im5af4fUGVx9
	Ht3Igqu6DWwFFxVMdjFn+tR3V/ezVw1kVP7GyQX70998I5/VFZDwb0k+DdP5g5Ec
	xNhrwLqRS+QiH+7xZjs1I3AkFA9PgCT9c3fJvLgq+gvYyvKBflej7rC2uJfH14qo
	UyPNiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr8dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3366525eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885504; x=1792490304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=excWAuUfiiIBGIxsiN1IfOcLviU2/tKZZlI+P2SxChi/xB0A772QrcNEwA0LxUoWjJ
         OpmjovHetBZIv6F7zF018T+wxnfIIqL2fvRUdSEoiIdEm1aDDdRYYMbahLn1s1XY8KnN
         dyuB8p1ymZxpELsMP6cZb6GDQs2Z2jN3WSLOauHvZRapfU9LZBKRH/hv2wv9rT5cw39D
         eCmpF9W3wc9lCjdM7zoIH2w2H5xrFSqaWZ9/i1k1yI1tD2/rno32WAjiTXiGYGlJG5qk
         vbwDe61/BoS0k+NErgbO+o1H9RF7yTBJAsjnW/JnhwyInHZYXnkkY05cVkrYKwcI5/3W
         caLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885504; x=1792490304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=Faqazt+IzreOLa8Tpe6Yjh7N7aaiaEZ7eEp81s0cq8DqYgxEZpq6zjeil7F0gQ+EpO
         ykUXHn8q25vPTPYqIr8W91aqH5DJ//tjANO9OMF3jzh1D3ZLCwnKEl/37G3WkJJ1kRu8
         f+dw3p7C2zcvuR1Q/nnOv6nGocQdhJaCMlPUSGuPpkaiKcvnpN2FE3DztmLjPgbO04TI
         YTc9eyvPZNMXrQY3xnQtaCw7QLFIW2z2H24QwvE9kYMjutd96i1lpeMZ6zxBoZ5a+Oof
         gupELxV6n+fGMYTgBu81hdAZRdB4St28xZLzvB1KF2+E0aZzveq2DIcFdi9fQvoQBqSD
         T+vA==
X-Forwarded-Encrypted: i=1; AKwUvBwxz+NqRjKV0dsjTQeE719tdmSYCRaPoZPOJKHfdZinp+0S1RRshYK54rryLrE1R6d91q+Sp6E1F0M0wVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYICMCguyS8mYmSmHqHBYBVT2Ly6eMxu/tAg9b+vY9fLcKlfNjdn
	pM58ok7sh3NJjJ+jTEgh+FrDJg4DBucnJRmYx+/ReOxe4B5IagJt41ayw3vlj5nhTomUuMjzsvv
	RBjU0wbHwmoopBzz3XNH+sQFz8FlDrwU9BBzkDS5CIdSzS85O+I7lnhRCyV+a0dT+C1s=
X-Gm-Gg: AYBFou1aSMAsvfDItvnvAPAT0+eUMYJXxiyZihzD5/hPL76yk+5pKoKSZAWgpG2VwtG
	A4OcJfDCQ8+wzLiCiIF7KANt0G83wQPMfhaltJu+Cnq0jppimd4qwffqDc4McpOAHrqBU5ckpJt
	UXfxblw20ltl8spidtaZZRDX+9cgkVbaK22dZ0ufmTkUbC4oMkfDt1Ydabgiaow3nANuePGlVZ9
	yRWWWs4IT/DV1AZiFEFkb7Y1H4+K9YArJvidSlmyyNbV1qJQOtzPung6hPql0ACagZCJteLb4+N
	w2Vjj3Jt625CbTlfOOpTcd+AW2cQwS9QF4GVtXeXUhrTshSyH2mHyZMhMlVX/bK2Z19pNOkRuYh
	ReofIFSxemH0lJhWdg5iqqrcAGhP2Nio=
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646914eec.38.1791885503425;
        Tue, 13 Oct 2026 02:58:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646878eec.38.1791885502644;
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm27114030eec.8.2026.10.13.02.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Message-ID: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:28:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXxpMRvFerHWAM
 ajJC+VF9N3vUxqem8wjs20tJ5I7NfLydop6IVS4AHnXJWDk7wN22MrksHv/uTDlAqwdCQvq3JJS
 K9HpKBxK84Z+xqrDbDpTVIhT0exfgto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXwwXctSZsSqg4
 cGmZ3f8tFeu1GeNc6iycQNanPgdN+W71Se3J3Hww0vg/eOp69CasW7t/+8cIKZE5Mv3QNGBFjFw
 3K89jXMkNVu540Nzpbz+30j9OCdY6+aGGpC+LrNkyShbj0NhXqGApVqe/3xjP1nscjxkDDiHhJo
 TCFFooC1wdwy9u57k5iAf9exapBrqpbYiFT27gdfCCyWnsFgH+r63sCHT3PpYaIMbbSFv2GK8TM
 gJpmyqtu3Cabw7uCvu2MJkWLbGRnYowT3tV7hYx+hWttGL+1a+IBpiVw2a0s304g2SdFjt/yikU
 5JUIC+WUQuWyUg/3cZaHzanKpFEzuMEU7mhS7RTKGNQiB11EZ+ig02h1noVgKbayklLFYBBwokY
 ja0Yr00KkmbQ9kyONnupawF3J1iJ84LSxFwNLYntBFIbL+jt1il8m1H53yrqjHL6DI/e2yoJCie
 1GCIo8+PVsqmckqlhFQ==
X-Proofpoint-ORIG-GUID: 420zJ2w7e88qeA7O9xSBWg6VEisSfav3
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace00c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 420zJ2w7e88qeA7O9xSBWg6VEisSfav3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> But that's not what it does on this SoC.
> 

Yes. I will update this in next version.

>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
>> platform
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..6fa958044218 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>>   	.smem_host_id = 197,
>>   };
>>   
>> +static const struct qcom_pas_data nord_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mbn",
>> +	.pas_id = 51,
>> +	.proxy_pd_names = (char*[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "soccp",
>> +	.sysmon_name = "soccp",
>> +	.auto_boot = true,
> 
> No DTB?
> 
> Konrad

The base patch isn't merged yet for nord-ride-embedded.dts.
we need to enable for both rrd and ride-embedded boards.
I was planning to send them together once nord-ride-embedded.dts is merged.

Thanks,
Anurag

