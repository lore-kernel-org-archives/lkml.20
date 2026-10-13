Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3184EB844
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890749; cv=none; b=ZsAfQNZi5hZiL0uIggzEKVyBXuFxY+7CtAweX4hruagT5GGpw/mqDvpqchBgT/QsjQ+CvzM9juYoFu2vM1wLqwnlLmWuZDJs/kPkBh75Uot0qtLG4TcgAvkLZ4cmTqswSfQEieon64bjdbG/6BtE6QdiplFdIaUWvx9sWvXdYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890749; c=relaxed/simple;
	bh=hi6zrpo0qMf2oszDVPessNqP8ZyikArUQ9QIvDYIY24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwE0VaAyWzBZm+DH26BXYTLruCNn3x2Ymyz4XTlwAdOWCGYfu5pcdS7GZgt1Zy0/Fe5Mkmkuevoh6/cmSWCi6BqvmCnb6cdU0z5cGOeekVd9nuIlHdD2NRIPidIRjEEoD0vjxepx/rm3vlH99JRrZ7SLvZs5kkcPoNFrBTPiuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GF3xfgPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQNSV0qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GF3xfgPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQNSV0qu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YwjA3208501
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=; b=GF3xfgPAA1j7eji+
	G0N/AFQJQU93vvRcT5peRua8T3d2STv0NQIS4dw62i1C1DuuUj3sMeDQZG8jHj1F
	Mc6TrzR6jwofrDczPxB379/NN5Tkj9TkGrRNitWNc/zSOnt+pAw/hekV2eJSVLxH
	PDtUrerHsnxxZ8U0vFyimkh4NeL/krMAlpKnCIqlJ7kmRJqzfURE79UiNyFhvy0j
	PE3anVrcp4e+sfZDslfRsmJg7ql6y0edOCKBc+7NEkn7SxR91MNhq4wPl1WpkK9C
	nyuGXQVXiFhjhQL31w2SLXoNDSxRn/6W7Qdz7hgxmgZFp0BMA1fA+SSOZhQYOS2G
	/kf0QQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh6kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2494025a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890746; x=1792495546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=WQNSV0qu11UUANeqtAOh/lJNfU6auPO5IzawEGzxgPnE08fQWi0FgOylOA2z9ugCGt
         Dt0wwUBYDP5UL33TrLjhHalNYOU4vn8fQKD5MeROE+iVqJLKxEiPqyHO1LBDMSw9haN5
         pEyLGJlCPMn4d47XgKlnkhXXhc6kJPDnrFtZwkAxumlmgFdbNfptAeziQxQpOrd+n1Px
         LN3yh/eNaGwrmNHphFLdHODW8lNR+lFsgYgxboh8WekKozy91aSy8va5QJNjQPUGeG8W
         TcpSbEc28J1mj9C12DGdd4/mOIhTo9ern/Btye5VYzOXxQ1xZhRfeo5asCi2tr01YRGx
         ZbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890746; x=1792495546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=i/DsGcDGdxEpxY5d8R/rzSedBVheuQXDuezk6O+OSN+K7h/mQDmV/rbWWxGbWR0L2o
         PYKMHGuzbB8eFN3B+8hbAbPd4lz+EdRbtzvwVenMjhgDxaclQ1gNiRPG1CNZb0FzYy/n
         AahMM6Ajc9qfStg+mU5oOb5RgiujjrhMRtDOztJbGBxeyxp2Oi8HX2ocxshsdanCqlDY
         1goRpNlaPHntWAt2rYH3izyAnaajx7hXualzR2Wf00QuxDK+xJu5bmK93FK0AaIfQhHn
         5/kKqi9DELyz4W3RJjlNQgaFh8wnzeJsQoT44OsxQ1IpgWXGdACM2pZvLIFJmXvAVhbn
         5g1A==
X-Forwarded-Encrypted: i=1; AKwUvBymVDy1KwRQz4V9h/kuqmjMyroeGNUDDaeyjSqBv4mbYNNuob2PDY7jy2MBZowMXswhbLmT8O9A47LtzHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3D5EgCvScyR84Buq4inMoNdbip655slUT4QczPJfBJ17NSgn0
	KkNdyuZEHd8i4AofuZ54XMk/PGG6spWRlntRTBkKv2/6XkrGsCkn3OfqfBHkXwJTr2hyZwtP4Fr
	ilwvpjRonHC+TGMpDUywvRsfL++I/zBzDiUI9aAu7Gjxo6iPq95TwnZiMst47iZFho4M=
X-Gm-Gg: AYBFou3gXpXyO4FYvdMvxidAf4oafIH5EOHLD2T51dEBOQ0MaXuPfkj6Cv1htMMcRVs
	tM6HSR3EdaJYvobGY6vQdoRc7W7aaYYY0G4vPIkYAqvhuJtO4yVtO8dcUtX9d4WfPaTOqtFJR1F
	Jf5IVrFP8TfZGSpOjAroiDSBlfeRP4vyhGa9RdXqWe+lnP2cSimYKsabYh6KvTgdIPhoCkwtmee
	w8JJCvUtYeHS9qFza17Lqd80bsxmhW1+WqEwYmt/KvXfTBDUkKVSJaZDSm+rXlJNLuUtg+R83vX
	spwRRv3yOn5e38xICYttKtrnqPH34jWAkZA01efGU2VVPJB7TlbAV+kI5S0q0eXWT50z/W2VTZ7
	z0us5xJYaBIqcS4BSIFzN1BqW04Prf9Y=
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780857a91.58.1791890746544;
        Tue, 13 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780835a91.58.1791890745962;
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21634597a91.2.2026.10.13.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Message-ID: <fc6a2d33-7dce-4b93-97e0-3ccb0795cae4@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:55:39 +0530
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
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
 <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RNNN552B2VyEv-2JVTlxFbc07rG7wacf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX+EVXdDguUlCJ
 T5I2Vum/nhDAk84IG37BqQLnrp6fERf5r35K1Z+kzy04Ccxg4XNQqjaIuWm7OCw20zc4BGUswJC
 c8yRQZ4zYPpXA1fEreibg13hBLpbosynkDzI/AgaSG/Teo3PJZOwNCj3us6sNcb9RMNgEj9E8DA
 xKWSeTO21H8r8VZm1XvAcRgsHUzpVLKMeRFjsMHOHSeNgxlLmMYshrtCXqad+FP/V2Dg2k1I6UG
 Muyh/0dYMc+qR5KFE8Dn+s/jg59rY4lUReAeQHs+rNinfeeZXghcvYimyKb/96hEWGaLJchtxZL
 fIGO+zoi3IzbOpttrgpl0y5A2ZfN+TvzEZnTWScYQ7JQl6NYm0i/bh2INxsHzRAlbG6PiRwL0N6
 JA5DJYts7MDmjficU4vFoEccrsZHyZxcw8Jtr4NhAQFbj8IUdOt8o27zKas5w+qIefWEUpeRTtZ
 NuKQGaJCmS2VsUHb/dw==
X-Proofpoint-ORIG-GUID: RNNN552B2VyEv-2JVTlxFbc07rG7wacf
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace153b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=V_CaKR13k3l0X16DQUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX3dnY/+/iGunv
 gXh51nipSo31Wd3EorhxJY9fg9aJJnWGtTnO5A21OGZ8uPWg8kTYDGPPzcRcVtlxibpKLn+Zymc
 HJ6ceO3Fv0hclIS25RRadjnEau7XIqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045



On 10/13/2026 3:33 PM, Konrad Dybcio wrote:
> On 10/13/26 11:58 AM, Anurag Pateriya wrote:
>> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> [...]
> 
>>>>    +static const struct qcom_pas_data nord_soccp_resource = {
>>>> +    .crash_reason_smem = 656,
>>>> +    .firmware_name = "soccp.mbn",
>>>> +    .pas_id = 51,
>>>> +    .proxy_pd_names = (char*[]){
>>>> +        "cx",
>>>> +        "mx",
>>>> +        NULL
>>>> +    },
>>>> +    .ssr_name = "soccp",
>>>> +    .sysmon_name = "soccp",
>>>> +    .auto_boot = true,
>>>
>>> No DTB?
>>>
>>> Konrad
>>
>> The base patch isn't merged yet for nord-ride-embedded.dts.
>> we need to enable for both rrd and ride-embedded boards.
>> I was planning to send them together once nord-ride-embedded.dts is merged.
> 
> This is not my question. Remoteprocs on recent SoCs come with split
> firmware - MBN for the main part and a separate DTB binary containing
> configuration data.
> 
> Konrad

Ok , I got your question now.

For Nord, SoCCP DTB file ships firmware without a separate SoCCP 
device-tree image. 	


Thanks,
Anurag
