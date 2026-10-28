Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184907;
	b=HDKbcxiZ0MaEZQtHEVcTI4rBDXpwDbGFsXdyV6fHaFRKDfGbS4RpjyuzGZUVdxNth4HI
	 Ya2KRJ1lKR244peOZ/XqZsvQLcjn7Cg+IfOcyLZ6P/qMwohi8LhHhFDfcGcX8kWNjGw21
	 GiDaQW2J1drwxzuHdjxI4+bfS+FcKMA1A4GDHr+aLr1xJQajdQETP1cCq6RAIdD8KXAgi
	 V70CiLgWbHGOhklDihwp48PmG5Q8SafBezWNYjv9HNy7Bc0rIc1fSy5i91fRWGXte2zmP
	 CWZrEjhH8RVFEw3+q9uTU5MIJ573Gihzmy75AhRB0MXHFdgP3tJy2xp6leVTu73dZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
	b=OcfMK3nCv+LVTjqWV2WdFHkKu0eiWJ/aTeStVkcOP55e4OsuN5mYbONyIgql08ZGWvQM
	 QqtdTk8ReZb5OAob06ZHwX1PDcoHDn+SoXmIi9gR4D1pt5CSIFbrAQj578BjWliojyK1Q
	 /Oqy513kaJWaaimsGWruJZrHnUaVQdGDxjbZ5WfaXmk/2yXkGFWM5Sh65VsvfwOM5gF4Z
	 EGpmuJlCdGr2Fuik1Aa/cMuI5nrE6BGMsKN4KA+EtNkWZup8F2HehxV14Ck4+hv3DN+UM
	 xXSK8xqp/5XeBnkiqTGHb3y1sq76dRPfIpjIUFd5RiOwVrInkR8JHXICichRqqdbmDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZTe6TtH/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8569606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8569606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTe6TtH/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K5OR1667592
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=; b=LkHpxOTOYlUHfJx4
	m2pWz2moAC8FSgKdhWL8dLH9HZH063WrDP2GJVcoYj9j+G2e3MiWdtAKzZ3jANtN
	nrPq3kHzAO+v18Y8pSVPJwxR19WGifUpF6k9ODQpKeUX6qDZnWsX8wkKag3purRG
	fR0smHR7DNQJvnVx5Iz0k+jjkLABZewOxaRG6YxuDdOliubxiidVvi9gojGoAZ0F
	95OgeDRQsyv2V1gH0cnBp40QUNe9FtKosmIb4m5eZkxSa33jbYBE4RZIqw/VEVLf
	JpmqGfMJz4vYAY4NZpDk2jXHorQtKHOF5FEDD2UI3IyAazoR0dl5xBim0awNxSPu
	uMBaRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pu6am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3080128eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184905; x=1793789705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=ZTe6TtH/HBt8PFk/jhdzrLVkWXp4wjcchQPiYAKG4FyUdSxjjnzCuXLZux6+7ynlIS
         RGcTqxaGryTrN6MAB1jMv2I8obntPLvkWvJvk0TT3ZNa5nxcMQdqXiF5DiQeoayH8mJb
         3H80x6yhEJrp9dDYN46kZmlLhUrhQvW6UJ8cuNdMdgWZuScQ2ne/SoErYulP8pNhdmml
         14pX8J0XdZHRdg8ZqtouTXOSXEVLyBFl9IP5p953WDLNn9jisD1QmMCdOSTjK/76rYLI
         /jFwpeDtHdU/xN+r74WWxZOOZQGPK5A0JV/m8ITxIGwdM6uHCaBY5Wr+6l35rZIpY+TM
         1mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184905; x=1793789705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=1rt4oDxu6EWEWv9lQR2Q5SMjADi8SFfGuiMChri+eVcOK2ljfqmVbs2EGNqKHViHvW
         CW8DEgidbbZzVcsnG+KUXoLvalvbF8nIkWVpzqNGVAZIqOaXoBFayDL07J4U9TaSzyNt
         +Mruypl6pqw9iuLsbO+42Old02LVlr6EwRggyf/1j4X26Eupz/jD6MFFnWeHZgShK3aP
         eRU5zO6EVThHBrnIWEvpOd0D05k+BOibcG8T8afLFb8ay2m9UVxh8DGCBsLQzRZTpcEQ
         YmF7kN74mWwTd/CAZyFaXbSxRTB2Ny7ajPXh5FUayFMFRHyTmrpbkp8Dqh+kbajyiScN
         B2yA==
X-Forwarded-Encrypted: i=1; AKwUvBxfTRX2PAuv/5Jut6FChgYD3E568BqEqnNHmHyvBW3k150XmcBEYsBED1gG7tM++uzV2gyuO8sdlKOe/PM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHj0kb+RmHZl71xN3KLZOviss6lnIo90/pN6TsTCaot/ktmRIS
	+t5ahIhfLuN3SEHhez/Zs5GcyO/s+TqNzy0iu/ql85N5uUAFU/4JiGxC3N/mnS88VHD9+Zhvy9N
	swgY6b9jrMmn0LDbTmEemauC0zamq0U1Sd6PjXL8W9QWiResgeC6FE570fpdXq1qbfOA=
X-Gm-Gg: AYBFou3aDQeYsd0ffrAbtMBB/QPO3egbhNn7i5WH2H6vDXBAiW7yZvaNMz7TE6WREdT
	SBkuw88TDcmKVXLKwDqDHXmKb+dyXTYoUOwc7LM8zX57LXq1fFFTtmaoDdEI37BhRx6jJ9vHslP
	mUY6eETLPuuBgi07Ft57WAAtket8SoE39IItOxqzY+R+6vCi/lkLvJSlQ/e/7au73gHik/TyuCf
	t9zIeTiGU3B2FixA4rFrnatgf69JHcSQY5XxorD8qrqDNsOjDHnjTjOtQaJ9viFIKZmnOSFFReH
	RgHo3b+vmY44UO4XvuXgDslc2YXMlTwwNn2ty6Wsi+jhaWIJC+oxcbO9Kx1zArP6ozNxZqHjNFn
	jBrtQEB/Hky9Z6fmgcdlD9H9sddRvSc1KrDPT4+Jq1RVCcy+CRLDxYmcdtwSzxu1rPHz3kRDwyh
	39rdkER/Iakvgv+tQ=
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393200eec.1.1793184904700;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393162eec.1.1793184904020;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm6335086eec.9.2026.10.28.03.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:55:03 -0700 (PDT)
Message-ID: <1dad9241-45c0-4405-8d8a-2437125cf8da@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:24:54 +0530
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
 <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XqIziM0mC5M8Ns3m99eepnRLHLQq9Mxn
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1d489 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHdet6GdWXRFFbjuATMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfXyd55xxMO0VfZ
 p2Wg1QjgnnRm88OODPiHLEEbKPLsrBjnTf2hmeZoQrtwvl/ADyAu7JlTIa5snWBxbV5aB5zkz94
 WEURnbEVC3AqCKb5IKu9SlbDoX4Sz+lMt1olwEjtB3ic1xl5Ss++jfgyQ5DJfOJhOt3QsDsnBtS
 FlSFrtSOm1ckiUzTXpzOND+WvuHyrfZTRI33wohyNPE01ZN81qsCFN/wyUs9CjvEF3UGvylM0jJ
 9gBZ+K34tKudid0cDL0mYfDLMFLKPP82lQ7eRjpJR2ZHcKV275jxDp1nD62RUZYfR8RtzaiwzSo
 +7nlqNfJhtw8lpdPNqagf4V6sn6fj3qOYGw2gMNNfeF/phMhlB1km/LphSbHI1VA7bJZ5y2zvGf
 mLe+Onqnx2vAmOK4zOEt7f1cOsdgjtNFWdoKHJg96wi+ZCq5BP9w1zjdv8ol9STy9s/gASJ5oDi
 xhOCuY0dI2LgAwj1YUQ==
X-Proofpoint-GUID: XqIziM0mC5M8Ns3m99eepnRLHLQq9Mxn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfXzoHiEd/SSH6U
 GBhbq0wya+Nns5nfUIYcdHufoYkn+Ds6bp3YBqdIxKsgIUbwc1bF6FxYmAmLb1cXcesTB4GR5Pu
 MBAupaAg68AwRH4Hz4+gaqC7qGmsDEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280043



On 10/23/2026 5:25 PM, Konrad Dybcio wrote:
> On 10/9/26 12:35 PM, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +				opp-201500000 {
>> +					opp-hz = /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
> 
> ^ this should be svs, not svs_l1
> 
sure, i will update in my next series.> Konrad

