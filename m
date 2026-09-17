Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB3C511197
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651226; cv=none; b=N5eTHDHKZya/qAt8Da40OMP4m3bUMn1bVTmlcyUlFjgnLi3lXVuzR24JM28/kATs58EADv2J0AwA0R6XM+jrKvPt1EX/DpW4XzJ9evC8eSTQ0t93AQ7xciUc+VwnoVUpuQgxEgaXVZ5Tiv9YQ/D/42FLdm7ntsdyKvq0t7IBV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651226; c=relaxed/simple;
	bh=g0OKgrYQTDfjAAm4doBDR1j3Gm6aoztZ1YM4rmFwJ9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FG9z9A7cp2Vo3PAcrzhmReyngO3Lngn1LUhzwiER038JEXyw3DjarsMrDP5FVqoInS81QlN7EUs1myowDkcn1CdR5iIbbB69cW8fYOMxTYpCmBCZj0COosL5RGCMW0nkqZLsFk+YdE9S0tHBLPVW8chIzOK9dDWVI5PWv+MhMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZfXe/8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8NMIm4u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZfXe/8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8NMIm4u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZZj11257819
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=; b=hZfXe/8Ytpnhn+ah
	Ql6guasgef1znqZW/1iwQEzbPLrE//iJXRq11c6xUwx5Wgahrveh+djCFsIRmCRh
	e9ULl3ew9/jlxSDfbKxMTai8/PxiHt1a8gw0QHZMVv8C0Gq4fynVrjUqHl8b07Tz
	/p6ynTD0xFTozw7cgHrNnvqBW+QXAri8G73pSARTBqENwoCRybqZTqRzbet30EbF
	soBuodYzs3vgydYrkGalNfUee4fyqO5SkIEIsNFdPlS4XDqKKWPso2l//0oIsRBa
	EL5qvOaryS/CoEggersHh1c8B96MAssrSlr37FGEgfTxUgRXXBOo2ww6j+3ge9eT
	URNovg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgxg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso13042515ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651223; x=1790256023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=Z8NMIm4ulz9571tVYriafcNSpkNxTozwi+4xI7rWEYZhZN+yuTA7H5a0SGsLWLbuMi
         OCpK3jSQA3C+OHyX1FDo4U1ZNC4pxw8ourPmZ3PIsALOzLEQEK4lVRtrSuzWmNcr1AmP
         tS3jh/PDcTCxKmuyuZdgSVnxblvN+amIYGKXHzqyrQ7wavquaigmbtujbgTcwokhdflk
         cEBt728eCX+SvB4z8fuoT2lTjOzGAmH6JQp6FXZjbcNdcN7uhlIoW9FLvitS25g83SOm
         KXh5PagLl4UsdSgQN4kOJPsLDU3cu/j+o0Jc3wTBQXDoGjX4xtQGlT4fzB4Jik99LTfB
         dQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651223; x=1790256023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=MrWCUiQ9uXMzhiXPoEQMZotwj58xp4q85bFnHaORGfti6GtjSTHTRs2hM1ovOg0s7k
         8G7Okx7AQIjN4wHZsCtSJjmk5yiyBaL8le1LB+ZD1RTKnfs/USzJF9ORqAyyiVAq117a
         OEacsi9nnj/I2c/oBBY0gbHaUA04ami88f7odVNQzc71SsV2bgy8dEng7G+fyCEuhW/2
         6PlDJkchazr8dJmfXRsAbziLWAwkufy/+aoFL6V/orKbuW75KZIDs28ZnhE5TgEkyy+g
         XJqGtAaHYsRRjlQejUGpbAeHcuHHap2BXsKTmq9P4FoANM02PoeQ12LstX95iFZHElBG
         Wh9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOEXibQGpEVloq8o+QMhmy8yswTEFgd/edE9unEKe+cqqG3aWjxbkf6hOpb3SFehrgJwQ25kc25O7eP30=@vger.kernel.org
X-Gm-Message-State: AFuF++ncstfZUh5B+jj65pSC+MitYIhIhlGTs9+N5XVHX4HBvG7ujQmx
	aCU4wRfPQtl85xpo8Z5QbaapwlE8jtP46YGBc/UFUEm3I7N+cNNJwYiIeVXD821Z21CQUocBV4O
	MpQRpR+Qs70eCI6V32cVBc6AH0jchn2XPxWkUwlGlbC+MMMHQwg+0M7SO+nWxfxm/0Vg=
X-Gm-Gg: AYBFou2LT08fUmvGzQeAbY5qW3nCZ8msN02Kz08t26akDalmmCfYaPC6sYti2ZYwEsZ
	b7veAGzba/vLCpn1DCJ05KGiRH1xhij5mgUZvQWQHa2Zn9ixL54RUAl2wUnip92FlzIEdEpLfGe
	UY9APgAOFsNTzDx6IRE6rX5brxijN0a2SCSEenEUqH4QBMtWEPAYafp6gLWSLZXDd/vUwBCMkvD
	Is57IjYACRigw3Q9sLF6fEkXzpLPZA/NSNE+53XSMUkxIXPjt1ykwCvQfRc9Wara5Ghfi6qigXx
	cqOf5UGIStGiLE1zpvpmOwzQbkrM2NUuKtiOQvfTcURUs7HNZXHRkzly+Ii2e5mpqLEwdXMh/o4
	l2FqXJXx+tUrG+YOlKhCK2GtBsz62bOMCKvIw
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141887165ad.2.1789651222577;
        Thu, 17 Sep 2026 06:20:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141886355ad.2.1789651221893;
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm26488215ad.82.2026.09.17.06.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Message-ID: <db725f23-0164-4416-a148-5bc2a4520a4a@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:50:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
 <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfXzEbq8bWyPXSv
 X0S+NfIuR11jDJw2q7MqWjcUQvcHZX/L+M6peYZ316Vk5YXCJPHrtr953dX+AfJ1pBksCJGy+WY
 1rf7NpAv9RPEi1MkY6B+W7gJ4rsMPzWpVtVc786CrMeSASgdwMT5y67w5vbUguTx+jet1Kfel+Y
 +o9mzN7miwrA4sI552CN4RB/zsdgcKz3XI88oz2hfphOny0vI+Y4pzLQo1qDU/hRiXqIQqONL0x
 /eZ/wlox6Cs81xstwKL2pT84uxht3f0oqEEP4PknLiaNUM+AMb41f87XR1BIvJXG4woa+IG+EgR
 o+oUULqBCzUnJMlHJldGWPJwnvy194PtNIxdWOJLRWiMo5+6fdc8nKVq1F/zdjZKrn6dzFNe0GL
 gsCXXgV0d0Hut2mVsHvV2gDKNjQNLsXaEwm345V02/8vY8iLf/Wu5xM14e/x99q0zzh4UD9Ko7p
 OlbIFvJ39iISJGzzbdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX7hpZtupQbR+1
 yfVrx/hXMx2K1motTKG3ouaO/9BcVNA7POCN/zQFuYdGzgLcRCWOCf/DoJepCrtHZPXUwDZUCUd
 TSmpdq/nfRkwDq/NsLb1/1lVKfVHUxc=
X-Proofpoint-GUID: rCRlHobD8rxBG9v6-R1Yah9bNDIkG_rD
X-Proofpoint-ORIG-GUID: rCRlHobD8rxBG9v6-R1Yah9bNDIkG_rD
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabe917 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=0mNTRpIox99THDeoYOAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170187


On 9/2/2026 3:48 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
>> Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
>> PMIC, and essential connectivity, designed to mount on carrier boards.
> [...]
>
>> +&gcc {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK_A>,
>> +		 <&sleep_clk>;
>> +};
> This is a NOP override
Agree, Will fix in v2.
>
> [...]
>
>> +&rpmhcc {
>> +	clocks = <&xo_board_clk>;
>> +};
> Likewise
Will Fix in v2.
>
> Konrad
