Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4E51993A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954463; cv=none; b=bR1QE7uQ+zFJ+xNjwcgM4Xe5ocwnfq4yHfCL513tpHaftPc1pC23e987+QCCbM7f3HFqNGyEmG335Bf+li9OZv4iiOUvYaWh9XoDuEAXZ1a1r6IZtKhOAWQ39MagQGDQ8zEaFuyX69Lbk/FLutbiKQM9bzDy3YoT06zhJrVOXtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954463; c=relaxed/simple;
	bh=bE7gFNvJpgqAb1CCf/LUtrOOgo9UiCo9vR8xhbQKK7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIUjdk1IGSVMHBPQeXPvlWXy+BR8KQX9wn59pO49FHWn/X6CBZnJRER3d7uK2+tjQISjtS4kCMfzV5zoF5mPCh7Nrj7sDqELAixq48b0uNjGCJZD6DK0fNu9h2pPF/4rMPP2gjxKvW0BuSeqGGK02HBzNtJmXfjK3WOvkp26oIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc0SLmX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0zf/IaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc0SLmX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0zf/IaL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1VF1722978
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=; b=Hc0SLmX0LuMgPx2/
	s7usEhsEMGxv40BYRumnoi1d+ragd1vSsOAlOEIYhmukDhMvpNUEW3ShpMNJ7tgf
	N9dGlxVMk+Cni5hkkoLFsyJRsM5lbSyIU+UAY5c3lFGguFMmX+MehFOtIjTvaEvo
	+BFXKJUG0nj19kr0RTN5wktKr/l3FWfF2dvpEHIhJJZa0OedoGskYHrkOrsPSGa9
	xTKLsiXsl7iaK4pqL8ZZDTZO2nlzdpipBVvssR4QZtRMQ3KUKUwNcxEsDNs6yIxp
	3NAFWmkjHiV25v+XHSiF9m1+YpC1SbIRwE1alcPsOCYpUPml0yX8nCME/CNEHAdn
	34w1KQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrcjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:47:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so85764185ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954460; x=1789559260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=;
        b=f0zf/IaLUWPEEiY+PDLJHCBHXawgIGwHItZlUC9VRVk9J9g8VR6KmANPl0aJ9p/JCr
         YFa1mDbSGUely6sOgZXjBAZX3P9mKWC8O0Sre5S3G8QvJwJMx5eN0GvdmMEv5s0kFJmU
         I6kUY9KduxmCcN8dFC8pJd9UZZmnEQ+v2Y7AarOIlWagKCDQWWjY75x9nUJ0V87SxUEN
         qS6Nmi7RrEiLUFY37usE4+2SygFTIkSVFgV6M5lTlKlPtbHVudIrVYPuTKEWdLZ171fs
         j8VwwXfl54hgeiaWIEO7KPqntosIzYc1f2XoJUMmEX4rPB9RW50tFknz+0WoaAQtTCDY
         HwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954460; x=1789559260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=;
        b=FbGvqWzwtcZOl1JA1FrWd2NUwLSe4hsq9wRTjf5v9WtvKPcwvhEshJGcuwRuJ75Slw
         fwfz21o0T5unKZ0XK9LrCDfbYhYHwYDrEW6W1fMmjoqGTPTNMbiZ56WLGHn7zHTTPIsP
         TCUhyS0UJWyEAYut6+XQQCcwKlKq7eZ00p+wzS4JZVC2y3S3Egg76ZykXIe+2fOpyHhk
         r8VstMGcmvo58K3jDdBtcVWUsIOX7cMaePqPh2wGjp9YRdRb76IR3DaOtvVYCzAvL02Y
         wjjuNLaMKNa2IdGZIb7pKj0JeJ7AY3hZscw3U7M7R1jtNkzAHHek68rJeaapgCawJMrL
         Ag/g==
X-Forwarded-Encrypted: i=1; AKwUvBybadUba2KjwxOEckXoCTqhKP8R+X6heFN0dbxeu6X795658cVcM6qqhXFGTQwu24M+U4rS+91JsLVvNcM=@vger.kernel.org
X-Gm-Message-State: AFuF++mipLUJ1W4nm2szz1+xJBj73CLkbRFF+Z9B84KZSkP83E7uY6tW
	Ib8+hyr7Jed9sBRidQ3l4gOfqyYEUCIVhMdvyVbGpOM8mHdV6eGWQsoh+lcpdCtAzX3rVadC3+v
	iA96XhkEbfXDxURgGjtYciKInesngXa5lNJgIDHLDJEw7GiZUu1acbvBk6NfvxkfBH5s=
X-Gm-Gg: AYBFou2SMZI2223bO7LUx4KS8rolxH3CVz11MRDWjH08sYMgnt8M2ERXgtvQqCzO62p
	IApNTf6LHPBRUAPrtq48WWWvNT8CrirEUpKUT5flKXl1oJy5rWLD/Ol1vYQbtypFzn+95Q1CiUR
	m8fjkdM4i3BlKv2NVps3reoqpID5fB57V9ugrx7V/VccOEibGMsLKEDaQvdH1r8a/tUkfN56uIR
	+jofpYB4UHQZrWRTUmgIWrdsrO3md6Nk5wj0jwZXPj/ouhaKBvHJA0e2w8NhpPHRs8TW3lcWWKi
	+sg+e6SiebPcTbm2HairbakgbvnTxxsyBAb6q0Cd0whbLERW9lr72/yjVNvL10snDrEo6eyJ4jg
	ZBaqbMcn8nCi1xgcmPLrscDoRpgPNsh6P
X-Received: by 2002:a17:903:1aec:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2db125ca3bbmr502542105ad.11.1788954458810;
        Wed, 09 Sep 2026 04:47:38 -0700 (PDT)
X-Received: by 2002:a17:903:1aec:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2db125ca3bbmr502541325ad.11.1788954458215;
        Wed, 09 Sep 2026 04:47:38 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm20505746eec.3.2026.09.09.04.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:47:37 -0700 (PDT)
Message-ID: <86e53b35-b096-41d9-b15e-e029ac59d84c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
 <tkcout2ymlzvcx6my2hal5hgh4fxcpppxl2t5s4wogz3hjykp6@k72ig7seb7m2>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tkcout2ymlzvcx6my2hal5hgh4fxcpppxl2t5s4wogz3hjykp6@k72ig7seb7m2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WSUUVHEZI0dViwUXSXWnq75fV9BwMYW4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6Bt77uSi9OOv
 cPA0ATQtuuOoQJmWGI3cqAWNxcGchJTousnq+8pJAk53HlBrJVpwXOh+kwDCSxLM68PCWe37mVf
 aM9GJ43HiSsrUHFlaCVW5N7py4PBpnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXyQ0Qh9Ps+m6E
 K6Ry4IYDLbx2Qwc7AX5NJ9bn+T2gsdocZ589kOl/93qR75CGu2wzFL9xmJiLXvMJi055DoxdBxn
 Cy3q/uSLJFOf7EiU0A2nUsNhz9K/gES821VlSWwiMaIhamEK5L4kyUql+9CnnyPshe3JUSZ9PBt
 QvazNj6WzWIC2stpuABW+2u7sDzRkeoxsdipg3K29F54GpmTq/YlcYQPqA1MeC8IUyJz9TCJMAy
 AvY3WbSeHV0Sg/TWc17swX+gJF1mIaEaZcemeeu8TtmX2szR/bPmXkd1pbUaakwDBCxNb7Mz9Gi
 Qio5m2YLvFOJqgActN5iQ3Otwjz3X/Gpdh+twfy5Q0s/6JgUDhs3/Zi15homXuTOeMw4rsTFdx5
 jgBY5EgON0sCUaAIBHvbNKmpyO62AU9apf4lMkpL98WsYpz08WNfXUkS5IjrhmQW/ZdX1XwR6gf
 H973B0MIKR95aLK3Kwg==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1475c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q-PrnzyzFlRskm0mrpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WSUUVHEZI0dViwUXSXWnq75fV9BwMYW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131



On 9/9/2026 4:30 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 06:18:49AM +0530, Krishna Chaitanya Chundru wrote:
>> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
>> to check whether every downstream endpoint can be put into D3cold before
>> bothering to move the link to L2. If no endpoint supports it, the
>> function returns early and leaves the link up.
>>
>> Querying D3cold support during shutdown is actively harmful, not just
>> slow: pci_host_common_d3cold_possible() requires every active endpoint
>> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
>> is still in D0 -- which is common, since endpoint drivers aren't
>> guaranteed to have suspended by the time the host's shutdown path runs
>> the check fails and dw_pcie_suspend_noirq() returns early without ever
>> moving the link to L2, leaving it up right up to the point where the
>> system cuts power/clocks to the controller.
>>
>> Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
>> explicitly to force this behavior, rather than having
>> dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
>> system_state. Still call pci_host_common_d3cold_possible()
>> unconditionally, since it's also how "pme_capable" gets set, but ignore
>> its return value when force_d3cold is set and force L2 entry regardless.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
>>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index f5a38e6fd8d7..a8a3861c2956 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>>  
>>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>>  {
>> -	bool pme_capable = false;
>> +	bool d3cold, pme_capable = false;
>>  	int ret = 0;
>>  	u32 val;
>>  
>>  	if (!dw_pcie_link_up(pci))
>>  		goto stop_link;
>>  
>> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
>> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
>> +	if (!d3cold && !pci->pp.force_d3cold)
> I asked for a parameter in dw_pcie_suspend_noirq().
I misinterpreted your comment,  I will do it next series.

- Krishna Chaitanya.
>
> - Mani
>

