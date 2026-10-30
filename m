Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373952;
	b=iDtIngsNTsoQIsCImYvLLOJ9AS72EKjMsFQfPzoRC7c/m2M8wBLO+4ZZkDtSaMCiLmJw
	 CiM/4NZ/uiYyjPLlRUWrn0buevaB+f8j1coRbgq6pLtDkbpb3zOBPIUnYIzJJYqEMonhJ
	 99mR887wKYmW8q7DplIMr3p1AT24oTVjI5cDFfewrqmV1nGy8OjA8TiFF3fF3+h0pE7xv
	 5lfiIY7BRzlaWxvk6zf8xhBfCLv9CO9NIaCnvQPAMtRi8/lMei1pKkQrX1QmSGRm9JojP
	 jK8c0gPmHeQWvpe15pjwGWlkP1IaOtKPvEY0KlC0I3KheNEHS1TnFolbcYgl/p6f+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
	b=c4/F1cOC0A2uo/zbKFgU2riwrZkKvrlvz2ERmu/lH2qY6BBfEEgApVgVpORLbxtrMect
	 MhMCK/H7soCk/nlqKnMOh8y6fZw0p/HAAsKhUuAk2Q3GltyfdwxYjEn1yCrFreZNPQzL1
	 YKINS+JO4LZo8Fqj1x0PnTTcXypXJzooSa/m2jByKWlH6kAMR8BmnUHJGWMSsx/ZAvc3j
	 Bf2Mc5hKzi0OElSwtXMYu/CveZVRb6fkbj23YqLyhQFUjetqQyJZC9cVwpn1U1IGKeVyk
	 gMIIA3BIiMwTVmnKtLZGw0JaUFHLVvJrspbMVnhQxQehrHmdTOGVuEMxdbrT0xcm8Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUJw8K/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F85606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F85606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUJw8K/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCt34141517
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=; b=LtUJw8K/jVPibXL7
	Nm6X6MfGfw+jsqw0QHvh2SPqp7FITBDyU6dhveHHRWv4sDrLCiMXu7elwTdgxcv6
	Q3v8AS060Pha/MLTvN/d27jg8OzlGalrMTvDiPa6nz7k1ay8ai2sTBgzM4gQT5Ln
	P58OwN8NvpRQjWM4defAPMQ4BkxF/aWafIxZTjLzBXw21cqPCfsl4dNYSyun1uCg
	FcsITEjBEJGGtVM4bH4yu56IqmfgJB7U4LNJ2aO5u52hh6bPk1YqAP6/UTf06yWr
	aZWscMPIY5o0ShNuCabk/YQkhXFls5MXy89QqX4jA8/yoUx3lfFZFSjl9nYoT27x
	xp6Smw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qupq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:25:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89ff475a0deso804467b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373949; x=1793978749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=YxKyyf5mwMosBl9MsKEIUJrBY/Lys6qbKF32l6aV6L2rInMpSLYYvLIauDL7z3tfIJ
         vc66hK5TS6Z2m69HUNfr/t3hmJg+PRVFWH7WBg7U7J5Muf/qvUWdeRtob2dz98N8VPKI
         C8MmW1I9VKP6JQ5BjQRHsy/dqiFPmWIbYBqBzA+N+PMs0jsM93cLUJbyvVcN1XCIRA82
         DM9W+P99WFUgAlkw7tC/O5wSB5K45/Wx56YgZOeND7952LvlYW0Da53a0r5k2d01o6k2
         516tsdFxfXgYvwgMdOSKhZSW8nOZsKDNMF7qNilFdRDmq+WKhJndJuXZX+5GHRbcPs0G
         UkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373949; x=1793978749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=M2mKFLtUhrjQIvZKI+7BHWEuO91YpyE0SjRbgtnzpbeQgT6k4Ew5hJI4gWvOqiHZrY
         EWztrBE/5h14sp2q22KEY60TnmaDVFhZ0HABSoE8YgHfErn2GKWtP5qq930aX9IECBE+
         fgzR0646fucRBguFw4Zt/ePIQY4/5iHbcI9MSUb5UFFmsL69ipx8HEllTBbyQt6gJCBk
         f4C95hbKYIoMHKn5/tGcGMlHDyYNYAtvh90QhWNPrS8yiAabTV7Sz0iCp1WcQ0LPCDTU
         sZlr0SccEfpX8sZpVX2BmQRpWZ7oRg1qn2OTpBYYmZWUI8YM1pGT5zVZ/PirJQC/nzfm
         Ye/A==
X-Forwarded-Encrypted: i=1; AKwUvByKWvRq7bEBgcVB+Fh3FoTXvSCMK34UCWMNC0HTOlvRcaRE7WxtpiWrJOegs9qN2ssvCEfmiMdhcmCgLFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd6CUuPDuFkLIiPEKTEKcBzH/oRDuVTeSKFLvXCB/DalI905ix
	A6XlmhOVSwzjB7J8cs10TQel9ijTe22xy/9yqy2u8wN++/8SpgIm8JT7AMx+eeHc32OfXSV+Lxd
	b9g46kea7P4scS8JtKxyw9+If8uLhc4KEtXeEKkUh5vyMEyp1u2CAYaidCKOwEjVQcME=
X-Gm-Gg: AYBFou31NG1UDeK+9IoTrz4GML8pwh/WipP2WCBT8XU4bbvB5N6xKUtIp871Yj+H68B
	x9hSAoIs2Y5wYECYNqAhZLW7RQvyL3BBfRkRHlAKPPjftwEN7fVJXiqqkZ7HutptfzbsSKGfgDV
	KX4/hqplLVR3YkP5dH1cOVGqGseUWSr3lfsoqxr7PFh4C5PXJ1xNv+0C+abduqC3juh01J7F267
	JLpoEMDSsDuIVvmpCEbeRWNlslsHD+rNozhTM6aegi6COdTBm+HSVlXm3eNt/U2vwLSS2BUs0nv
	ZEzg1LfH7VEGTCkZq48x8NZFkHfICYfTBvAqEppC3H5Lk27EkpoikRZhs4TierSioEdvo5t0X0f
	44PUoTqM0VAlscNeH58TnJDDFjdRI6amQPqmyjLdbu/9JsT5/ouqZ+FOjqAY+yZ6dpCU9B7hXdd
	rfqhqit3VNADHxNUbK9+48UD34H+4aa178dFt1
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301180b3a.59.1793373948970;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301134b3a.59.1793373948472;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm141926b3a.36.2026.10.30.08.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:25:47 -0700 (PDT)
Message-ID: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:25:41 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P5FkEi8nWUmt89XiRuK9V4C8i4dIfTMS
X-Proofpoint-ORIG-GUID: P5FkEi8nWUmt89XiRuK9V4C8i4dIfTMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX+PjDPwuKBhF3
 q+dvN2qD01ESL+oQI42mVIpwB8s1mMk5CcKeEcrKZcgZphVEWf4+bNvo5Q2qIwOTyWeeY5F7AgZ
 xT0QcJo/aNPPc8QXQGsqdWLFl4/7ATsDi+pNFC4qcNsfz0Byqyo1bAZx5tFaAx8IHAn6DFH1oAi
 zMQjTCPpPGm4vIMM1Y7NOF8mBHf+Gj0LJtEEC+lt/DfuD4BcUuFD74vlZQPNakhLd3J8c8zi7av
 nVaP3h/Xc0+58nAZs49lBY0wCC9iIyhfy9QYCjIeNAfBm9Z/8hxU3wA5VC9B+o7ATELTAYPv/M7
 L54O3RN5eLCqwLX5sIiVj4ZprS7cnL/7hs23QC3Ljxlfl2G2OA4YJg+qw4vaY5/YxCmq0VbFr3f
 VpzA4pw3ugsDdrMz5++00l4wk3VfPz5cz7SlriGD1rcApCYzTqN084YB/fYvi5Oyt/lLqUN5aCA
 /y2O6hFZRUlvmz+3AFA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4b6fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oDwHtdCdAfthrX0yCOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX+nlcwKXBiaFr
 a1qSI5wKJoAFRD7MvGF5mNU7xwQ6/w3ctReUaS4eKeGCjSjv/VMOxgi3O7+dAPx27wg2mnWktMc
 hgZcJbVZ9pMEIZMBv+ZHFiqWIP5HCdM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:04 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>> +    /* CSID0 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 480000000 },
>> +                { 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1190,
>> +            .formats = &csid_formats_gen2
>> +        }
> 
> This looks strange, why is there only one clock rate ?
> 
> ---
> bod
Hi Bryan, the current CAMSS CSID code always selects the first frequency 
listed for each clock in the CAMSS resource table.

In camss-csid.c:

[...]
} else if (clock->nfreqs) {
         clk_set_rate(clock->clk, clock->freq[0]);
}
[...]

For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
so we need to use the highest rate, 480 MHz, to meet the bandwidth 
requirement. Thanks a lot.

---
Best Regards,
Hangxiang
