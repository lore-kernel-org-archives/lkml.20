Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9E42B33D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998748; cv=none; b=tDCmfeL1MVJkJ1SwgvEW8TOb9TT/0p8gmDs7a7RnTRUFlBE7ZV8ZewLWMnKZZc78TPCM4DBAn7dXBgNcw0kdNRq3gATn/DdZSg4mKu897ybtv7NtUbtBBl7KMR3w4aniGBUR0KA9FChfb0LVuIwbBJvn0S/7ZffEqI+jtH+yU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998748; c=relaxed/simple;
	bh=Ts35l+PEnL8VPft81Hlw49XBk5atQ8XQhif/b4F0qak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAS8iVqvlAnPwF95iPDqEyTXUgv0O/Ef5n2zAowz0AuOmDPYVL64HLul4uLz/Munrf5IdyurTnnfoW5Ut/pdwsbkorLMUJrxVPecIrS86FmXtK+5Ldw9IBaZujQLbqUmXHhSjYpzgvRKEFWiSF5GL1o82TumK7hPxwyeolDCA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB8rkH4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiTcdyCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB8rkH4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiTcdyCW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDovvh1495743
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=; b=nB8rkH4kSG9Wl+rg
	tRHB+jL0+WSVKo3teO/XzFV37lsCqxpGDRFKaouYCy3SiA51xSNH4pyPBxFQgPZm
	SXvBuPBH7xRJxa1j7bdI6FtpI3NTI9jvx/MB6XgqSUxCX6WS9JOmQQmpJ/z2dfaz
	zdQoYAQkGuOeeFrcMhC0S0kNe0kAgfajvs7VycjmWds2mAYdbN4SbcbdcgGXt0OI
	NzgfSO+L/RKOA0oQXZLQyqPCZs64VPC17M4Biv0/ZzEspG0VU3CQZxoWGvt//JBE
	MA3cUSILm2Qny29yWRjH3BuzV5f5syh0MBjGS3+JAnLnpdqbu/ZdP6LoJ8ZyivWv
	YsgZ1w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgmge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso3818377a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789998746; x=1790603546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=AiTcdyCWyCtmRtg93tv9Sdp7NGJqygBSzqyH9Su10nJ0KZCstjc0IeWtXGofujvPbT
         mpE+Gt2xGtDj8yye8CwH2pJypbnDtLb57QJBDc0NeIF/rgHnyDb3o3eKciGFcnyUnfeP
         iyw5i7VjYfElArOarC005Rx1sMlxWx2ZPfoJevAo4M8d1I8FGHQNKMByLndcanDpXIfw
         fwyRJf0oSBWuhwo8aa1rFht9TIw/X74mLpYjBYynRHLFuCw2OiMtdHLXCYyPJerw25QJ
         38zl9LhneoApEsPej363Vz8+JLr6Wc8UOpxt5NLO1q+gZfAva8k6nNZFpyXGZzZspMLu
         h49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998746; x=1790603546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=dbof3Cf6OJRU9res/OLwCmc6xvpcb9HU/T4dNh3U76UN8KtzOGpZeDNvUNUJTLRN7x
         RI1LZr67KbIG+6kDOTGUcQ5pI1iB7SgG3WqysEVAxtF1aDxXHwPyufgXfV35VmwcVher
         y86jEycH3FxO4CC2MUAPaYEVgBU3BpSLIAGwBxHZsdEhB2a6eOBLZNUWH+ayphjjATZS
         En2K5X9fjXFcGX6iFsjcq6mmXM6CBP2aL2LpYAxMmWJbp7rHk9xcX4HjPXMbpjXMrXjK
         B1NrqC+Jciem/k3rOnzrrWwXMvXyNbCYS+00tZK/YlnHGMEZtsngJgNOwL1OTM+FDsVX
         zQlg==
X-Forwarded-Encrypted: i=1; AKwUvBy1qVTZ5dTxt2Fd490NTXXyLHgEfS7yjm4mqwm3/hpG7UwUYVnVkxJIZbtWsrGOc6ads2NqJNtN9HHR+A4=@vger.kernel.org
X-Gm-Message-State: AFuF++lv65UYX5c9oBQ6OnHqaH+te47WPmvTs9vWbLz2FmcY4aoVqx/b
	SnVfyHTvJVg/oRbu+5K6NbAz3LX3e820ggSCIZdXz/UEMjGePcX7vW7oIWhK+4AjKeDtlGfMj24
	kq+SeRz3g0h4U6tFnuL4jbhzIQGdZw/CIKecl1qmYGzzJeMPgYmQyZCBMXpulr7mQY8w=
X-Gm-Gg: AYBFou1P2T8EGGhie0mkLMYHtJZU5tSSwO/w6apIQrGsSNj4QK37i2sOc9r68EaMzPN
	J4k5aSuefBS/wnhoHgzZzPSf2RDMe/0klJwaXi8OzJDF7AKRT0lPvY6TdebS8VRnLcMJo1AMeDm
	AD6LuQdML0Ojol7uAgyv3Z7Loqycu7na2oTh39XRYjxlU6EVAd8CilB/O6PNeWurLeIVYY0YgkI
	a+EcXSFMeW3JJcsPkt61jjXwCeDugTcqzBHrbojqms4PkMEdFtuvmmrM5cHQP9amTyvK3YSZXQz
	wmcrqRZodrZNjUGFB7YQYt8MIoBMXyv4Lj0XOozUm5vFfoBOV/7gxtVrqJkS6p0xlcJROrC7VX9
	eBk/C17wODldsmRiOvAEZ7iXYXWm8DAhvSF0=
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072560a91.54.1789998745497;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072531a91.54.1789998745016;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm36081162c88.15.2026.09.21.06.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:52:24 -0700 (PDT)
Message-ID: <5c16f588-3ea4-4f37-baca-e5a2807592de@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:22:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
 <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX4dfKTewM6WsS
 9V3xJtzMbCGc9VODdlO49CeLQlNsazmvit0wNGxsjuEG71yNLIyiin/Ei2eZg90DdEjjhmFCWmu
 L167u3eklKzIPEEIV88nlgKKJAFFv88=
X-Proofpoint-GUID: 6q5tG-13zkdc9wFf1yn81YcOPukMWiK1
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1369a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=gjxls31er4aXgMEaaoPcOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xfGM6EskjLEd39232uAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX29IpJ7yJe/+3
 EToPlgfgnqTJhvw56M+vZ25pxwYLL69SjG1qG3DiYc56LJT7iaG9Ahqjmq98+hbgn3p/mnqVZN0
 mOpN1QZ0F3RqYs6LCowm5LbtD7lodkrt2xSszuUOQ0AwClKaQL5+m2fSH13+VPcESCuNOhE8kHy
 OgJZSRX3DZ3k1mdcDNT/scIWCZhrLxRW1gidSTEy/7e2fsgynl5dmvUlILquSPFFVz0oHNW/7UL
 0HXTeIXZCmWA6FK5GjcE4zy2UxhAalCvsuHD9JuqpbkqlUaqEG+JDZkkAddyKZT+dt46Ckzc98p
 dvq6Kitl/4Pb3jKDBB9hsvlgLpJcSsaKIso9NXJ4jfqggF6BeY3dISZD4FtiTiVRRgWga/n+m40
 3Qf4oZdZxEFRuXesbdaC/OJRXKQLreKxAFGNNIXcNpHRRThMRHH6Uf8f2QZ2AieuspVyUZ2HJz7
 73O7K80xF5F12t/0Psw==
X-Proofpoint-ORIG-GUID: 6q5tG-13zkdc9wFf1yn81YcOPukMWiK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210201


On 9/2/2026 2:16 PM, Konrad Dybcio wrote:
> On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
>> Add PCIe support for Shikra target, by adding dt-bindings for phy,
>> controller and corresponding phy & controller drivers/device-tree
>> changes.
>>
>> Shikra RC is connected to TC9563 PCIe switch on all three
>> EVK variants: CQS, CQM and IQS. The individual downstream ports
>> of TC9563 connect like below:
>>
>> DSP1: M.2 B-Key for 5G Modem
>> DSP2: M.2 M-Key for NVMe
>> DSP3: Embedded ethernet device
>>
>> Power and reset to M.2 B and M.2 M slot are controlled via
>> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
>> under active review, current series only contains basic PCIe
>> enablement for the controller / PHY. TC9563 enablement changes
>> would be posted as a separate series once the GPIO driver is
>> ready.
>>
>> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Remove TC9563 specific changes [Mani]
>> - Fix commit descriptions/subjects [Bjorn Helgaas]
>> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
>> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
>> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>>    node.
> You also silently adjusted the OPP levels in the DT patch:
My bad;  I did ACK Mani's comment in v1 regarding higher voltage corner 
votes.
Will mention in cover letter next time onwards.
>
> < +                                     required-opps = <&rpmpd_opp_nom>;
> ---
>> +                                     required-opps = <&rpmpd_opp_low_svs>;
>
> is the lower one suitable?
Yes, Gen2 can be supported with low svs corner as per HW team.
>
> Konrad
