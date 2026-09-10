Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60BE34F24E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010808; cv=none; b=KjKC/Q9hz8WHwRIYZYIVB6TfZfkPXdmzTeyq0XWEvHXFxHddjTQ+3wbsyfj2OtgC9jj1MP+owvO0pKsL5HaV66yyviP9QuzXDRk3u+SVZ407+XbDQdrsC6Q6Ng58QKnCGFrGfbUCYLc9Ca51OspwAePUDeyGzyQmU3vzi1Jz7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010808; c=relaxed/simple;
	bh=UJnFcG6qwNrgHEmfO6bvSB+lMsHMJEjnj9V4eTIYsac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVwB4xSRJJVUqcRxzC6PKlzvf0inH39zjH2toxLtbyidJB0vv3U98Qmdx7+cJeqbkx0oT+HEWp1PH83iaAC2KEoaCAzPHYFAN33CnLXkiaE4o3fBhM97bkIUoV2tmiKxjlhzPz1CKHD2r2tSz3a+c2T0Zb6YQ86m9ksxlzwKpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfSOz5C8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N15ccGIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfSOz5C8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N15ccGIZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lsZR3604845
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szOFuM63HR18UcmMmXnvtaunzOu+6qWLkKEnlyU6mwk=; b=hfSOz5C8U5Y22/cP
	JwVkDDbJUsmcSEr5wkd3kn0qRZkuG9n6C6wjTXRr2kDpZpdrltlMWklgkWB6PhmU
	ZSpetBymH4hRGjEGdHvd4oQuDRbOOS4IJi69+mEVIZIbmIjOJ+plKF0YkLjF/qw8
	5iSQeIwcwsJHEG7lGFZUEiOR1ddV2g+jDizeU/3ClE++P3ik8UZGcww6ygCUCHjK
	m/vJTiSk4b49l2BKVxTLx5TVIV3ISsJSzAoWbbyZwJkVaK7F28AOwrMKU8jF86dT
	0rsPeFfRSWoo3iueJKFdCd0eheC801Qkf1DW/GSjISbRuEntb3vQQGMxpI2s+vo2
	fKE8bA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfswbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:26:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8699b293a80so263118b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789010804; x=1789615604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szOFuM63HR18UcmMmXnvtaunzOu+6qWLkKEnlyU6mwk=;
        b=N15ccGIZi9yg9U9oQpsYhMMFXmU2vFEGcM+5qA7y1YxEqmc7Pi8D4JOImTXghdPqTK
         n9s38mNSpTPXJ7aNrCGdqYmttj9GUUjM5GuFsJJFgakHLEgxDn675iu1NMpN1n9oDJp5
         P0r+SnLkASuHFvvy5Lqn7gVXMJgsMO12ipxjyxcHecupCTpQkX9/2uPkfc7Lg9JGT3KD
         7SAKm2PE0rfgZ0LuAINda8tD7NZGwftytiIvvo1NpS5C7djZ6HfuYrPZC4lqH8KMW+DH
         NC0Z38CYe/Zm0Ee26IMxAzhII3KJlthDnuupnYIDx9dTnxvWvWEvhXVsxUia1IvuOOTm
         z/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010804; x=1789615604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szOFuM63HR18UcmMmXnvtaunzOu+6qWLkKEnlyU6mwk=;
        b=r2vxp9R+vlja3I3O32U2AR44JmC6vgYv2ajLX3rF2373vz5hdx2FU2haHHTyfYwtSU
         /SEVpqWTVN5ve3POhy5NpwWEV+X17rWc9Q0uQ/GOVBFoNE1sZHUpmddUk2qCJRVjaD3G
         Wqxvnlu4RHVn5YrrqPL1m1wViZ2bMBcE1PeUF0zhPyp++q96ltkF+h6JYjbG6ZOnV3uZ
         UXaH0pPuaYfAQ8lMp/vr+bCZ9JGKIOoPIuLP+waLZF86Kp1P5O6Ew/3iL8+9dwI6Miic
         D8RtIdsthzSX56XUdzPZwAhR50IAR3H3FHdXfIHNIQZ95IVxoE0g5AfD7U07nsFWLC8M
         sTqw==
X-Forwarded-Encrypted: i=1; AKwUvBxhB+ipTDhQCFuFnnCrP/T4YtouDsx2p4mOqNWuw0/IrPx7lx7s1nnKc81am7XH15dShsTcpGyqh25Z0q0=@vger.kernel.org
X-Gm-Message-State: AFuF++nAuul5fHC6u0K5aWIOv8CGvH5Onoir/zPl5c53CtEzEmU9PO7h
	/TQDeSsYbLkxsgrNXUyKaxxfGu9zKhcB9kjNusppqrIwZN7Xvcl2fLfUsdzJHKJFNAbokx3vibU
	Pu8Hdcc4OjvwgWBbzkgW5JtjgRwZSnjxPB/ysfBydC7NSaLQXoC6WyMOo6PJoxXePbQk=
X-Gm-Gg: AYBFou2C0Lky+z57+s552o7jZ3quy82tvsm8WLIF3PVCPt/fZwBPovBUfxUhLVkMD/r
	Q2Ho9ZNbOQ9pJVeK06fbxqb2yw6apS1XYgyVyIQ26mZvwvJGhCCXpftHGZ8p7D2mShsfZf9vmlw
	U9GF4z8ZmI8TzMoW/OEPmUJWYMLlNW6lwLr1zQ3CNmqPXfdlxW6k/3H1e20QHn6Qa86cRYRYKdE
	rjAGMijgebNCxvQ/Us9xYw7vTaWLYgb08cJip3cTphzk0vhXOWAI+FLmBkH5NyIfe8xze2vsIwk
	aBrhgl/GVWWyQqwjR6z/n3iLjsjFy/eTdoOHA0a+nR9cd1b6yeY6HZMM4YPlgzNultc0rwawFSm
	Gjvfrde3Jm4KlT9k19ybOCwAL6WsMcFke
X-Received: by 2002:a05:6a20:1605:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3da39b71971mr63167023637.4.1789010804541;
        Wed, 09 Sep 2026 20:26:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:1605:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3da39b71971mr63166947637.4.1789010803991;
        Wed, 09 Sep 2026 20:26:43 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm45688920eec.0.2026.09.09.20.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 20:26:43 -0700 (PDT)
Message-ID: <8293c4b5-948c-4859-b63e-835ec35ea90d@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 08:56:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
 <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
 <562fd574-a798-4b57-98fd-dc8e7c09f7f0@oss.qualcomm.com>
 <468f4ca4-e52e-48b3-bd60-20cadf7f311e@oss.qualcomm.com>
 <80f626f9-8a0d-49cb-a592-14195900e997@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <80f626f9-8a0d-49cb-a592-14195900e997@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6dzKfXy3CN8veUFswT_90lwiw3Fbbqzj
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa22375 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EfmTqkNx2LSR9vyAH8wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6dzKfXy3CN8veUFswT_90lwiw3Fbbqzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzNSBTYWx0ZWRfX6LH9hrF9jELm
 k+MStvfjGQYSsOc0dRhfxXm71S8woElmWHDpoFKxobUC+VOJHXBRLaAkiOZStYQa9zIlIOQlYUz
 WOO2WdosEU8712L61W/dLfZyUCz6iU5BdpTztZ/P+72rPipjEeNHm/Hs2Xd2d01kHFReeRyIcWk
 nnlVtPderhnX7Tn6q3zWKyI0K6FEq1q5vx3OzXYtK0PRIOca+HHQ169NUc9YkQPYoxiK63Rhye0
 ScxJR7FyZA9obeuh22G7tdgaDKbBkc9nym3lTd/IozkB9czXmaYTrk3gQQbqxIbA0JNxoLM2Dz3
 WvHUtLhnfwRXpSF2gXArPZvjqDw+QO0c0UFzKXWhmjAD1Oid//NY8MveRIE15wAgPpBB8aCcPBb
 Y58aIYPToFAEnskygvMOV5DpFLzwiS+XHCdMxq745FCPUbZQK0inTn4Uubb2MOEvEH+qcE+eBG6
 +7Rvr+bnq9otq6UblBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzNSBTYWx0ZWRfX2r+t3Wux8/MV
 sBNTDzB02OiDVt6yobS1O0CXzqF/JTt+cGbmM3fP8wkdzxG45hB3Cv1whf7jLTsEqqsidS4AI/c
 rY2Rc75GwwjU2aeNu1WmprPZ3S+WEXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100035



On 9/9/2026 6:48 PM, Konrad Dybcio wrote:
> On 9/9/26 2:40 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 9/9/2026 6:06 PM, Konrad Dybcio wrote:
>>> On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
>>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>>
>>>> PCIe host controllers should bring the link down cleanly before system
>>>> shutdown/reboot proceeds to remove power/clocks from the controller.
>>>> Without this, the link may still be up and endpoints still have
>>>> transactions in flight when power/clocks are cut, which can trip SMMU
>>>> translation faults or NoC protocol errors.
>>>>
>>>> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
>>>> into L2, putting it into D3cold.
>>>>
>>>> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
>>>> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
>>>> link and clocks/PHY, since a late/spurious interrupt could otherwise
>>>> reach a handler that touches now-unclocked PARF/DBI registers.
>>>>
>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>>>> +{
>>>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>>>> +	struct qcom_pcie *pcie;
>>>> +	struct dw_pcie *pci;
>>>> +
>>>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>>>> +		/*
>>>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>>>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>>>> +		 * still need to be masked off before shutdown proceeds.
>>>> +		 */
>>>> +		pci = platform_get_drvdata(pdev);
>>>> +	} else {
>>>> +		pcie = platform_get_drvdata(pdev);
>>> This is no less than an intriguing choice.. please store the same
>>> element in both cases so we don't have to do this
>> for firmware_managed solutions struct qcom_pcie *pcie is not being
>> used/allocated at all. it will waste of memory if we allocate memory for just
>> this use case. - Krishna Chaitanya.
> Should we move it to a separate file/driver then, perhaps?
> We could share the ECAM ops in e.g. pcie-qcom-common.c
I will let Mani to comment on this.

- Krishna Chaitanya.
>
> Konrad

