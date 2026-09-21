Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661C49159D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991248; cv=none; b=fPjvhPP+rvLYQ6oNLsySkYiy62cr/u2+xOBdkYfKjPmy7ByCVPT7Ilc+dWxchlcsmqstK7vpbTPFsa9CdK0psQBTMDLscXNTS1N4PDbaRLF3MOukkm7485iuqv6z3nvr15HhfJPS2cLxwftG+UWqnlJ5AQXDO+ZqTcDu8tzxLsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991248; c=relaxed/simple;
	bh=Sn0T63nqhFuSkZdG0v0MjVbPWlaRxlBwArBNEJBe3Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ya/LUy5laukq8dMVRDlIcnqu1co49KPXA7m7QQLhoEaQC9IUOeypK3ZZxS2aAz89RLFSu63VEew/rEF5EZYc0Gc7q7pKOdpvQ6RfI5i615y1wx6LgqyRgRRXQ+7xYpF1gO5UtO4/hoWmDA1TTP+H+/H7g92+PJaNsPNMCUTC72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nk2AcKEf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw5R84Uq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nk2AcKEf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw5R84Uq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeLuT1219039
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZabR1KgkTaq/oLkvUVfPFd/w3RYLNtDhicHspvb9XLs=; b=Nk2AcKEfILidBL4Q
	5iYLAyTrfORZCGhioCcHsj54T0vMwFTb49Mm9g2Bwbc/pishje16+jHRPN72rXgW
	OucXbH3W0bcIyExcF1VUntZbIuT5SSZaG5y+Arvf5sneIbfAhBXHeTBT2wwCnyc1
	6Fj2dDUyXuWo+T1x/i29BxHLYqaxUundn1snWkMgC5DUZjivp3rMw3WnwQpoEbVv
	IpC3nT2zAG9vBa/HHwk+5I5TqZrwDvQAKqkIw3ntMTGwxdoOIraHi0wjOdpfEfMr
	6VawLVJTar1T/4RDUTozcDrlB0o7ekjzDFA4BFlG8Ckgcds3JnCDKoi/Hb3T/PNz
	k47XbQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01192sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso104108e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991244; x=1790596044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZabR1KgkTaq/oLkvUVfPFd/w3RYLNtDhicHspvb9XLs=;
        b=Tw5R84UqrGUoR0S6agdFMRirf2K10sNYr3pqEPTMGQLN1KzddTomuPE6nJhW5p0USR
         R/6oxAOV7mg0TzhC/i78Xm4GuHAuhuQz9YqPHe/JF5REUluBkHNDONzOg8Z1b+SiEuMo
         ph/Js43qQPMCGp0qmb3pXvSKknc5RPqbpuDupgSlz/moZoBoSTI/KdXtNWIWZ/Utc6eA
         L5eADc8AjEttX75tGQqcDzATtGKf5Too05vjLGx8tn9NYNukYi1oGoWMGnHg4H19zARD
         kekH51bpYzBBYF1kASlIsAej+Ug6HmK65jpw3MjYtoG3XfImUsnlXiaTNf3hTpll4Xhi
         UDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991244; x=1790596044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZabR1KgkTaq/oLkvUVfPFd/w3RYLNtDhicHspvb9XLs=;
        b=NjhcrKQ5k4f7i4ATQvnMfHu2/a+Haih9VRiBMzzY1y7E9kmOkGuGnqj/1l1QfUUgWO
         s6y14QnqK8jD+nU2AoMOqBsOb8BHRl1tbDZRZLHAo5Yi8WBqXLBFqYq1fhrIPbDYm6W3
         KvMXISSNAZk7OtCM7Ce0IzyCWqwEfJjO/ETm9H1LAgFSTiBiVSMOo3hPEodlcSAJ6Lqi
         kwrkH2l62nX9h1cSjaXDpVyC/GN38Z1h6mBZziw/94fYVcBnMdANq/ctr5Zh++9W8ALm
         3v7XvphSjAtunPJe9CZtCCoX7N9QDCQvpiSXx5Oj7kGdon1ri1knxpNWKOAfyVtcNdic
         G2pg==
X-Forwarded-Encrypted: i=1; AKwUvBwYgzUZV7gQgzChdWPK1HY1NYTgjHoSDncPjx6IZO//zrhoGC0drh1CQTDZksxBjVFr8+P7vFJdFXBRSZM=@vger.kernel.org
X-Gm-Message-State: AFuF++nccsiI5Th3kmYtFLOK476U1QAObzQA7Z8fVW+0tzpMSVdYU9mq
	3JGbaapxn3YXPbsvjzMMVqgwggD1J8OQKEzH1H52SmOuck2ND4JvnPZQWHvv9OicbcxPVg00vIV
	RJ97fraJkntttk5nKAgvqjxK4FE1D6ybostqz99VuJ85fg5OIzWzKqapIKRwY16Pc2croAOBrp0
	k=
X-Gm-Gg: AYBFou14hFJpOlKIwZdG9ACW5H1TiZC2NF6V0EDZSFrP90f2POjXDhE0E7eHWL40hLc
	AOAUjsNyUPJfj/KZ6bGsI5wnIhGDi2UktOKJpCvotZnqTWNpvWriZMt8ZYnjYOkJcpCBUZ4bBEa
	iYPAJxv3ulEvUTRqlfpNx7Y92mlK7DEbUvQf6DfoMJ6evykuqP20JCgjmIDCQbZWpk6E9hkaFoH
	/9n0piF53byz0XXPViPqKlXpoGN3BG/w02HTpfMEnqXLOciBqRBMx6Y2/bBsAWEWO5eg4andliF
	zU0Pbkl2QniAjf04JnYRRk3NdYFDsPijMLBhtenF2ZJ+CzTvoLRrW4bRl5n3CM1mVX+UpxgBX8f
	6nVjHm2GdyNeSIpNoHeq3GQ==
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr358272137.1.1789991244652;
        Mon, 21 Sep 2026 04:47:24 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr358258137.1.1789991244248;
        Mon, 21 Sep 2026 04:47:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3590afccsm292838666b.62.2026.09.21.04.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:47:23 -0700 (PDT)
Message-ID: <b7753168-fe2f-49a8-8b8c-8137ae2a6eea@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
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
 <8293c4b5-948c-4859-b63e-835ec35ea90d@oss.qualcomm.com>
 <tvtjjnysk6cluqrwoseyssjpp6fla3qjvkndxbsw3wqqed6e34@74tuwpzgss7j>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tvtjjnysk6cluqrwoseyssjpp6fla3qjvkndxbsw3wqqed6e34@74tuwpzgss7j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GzcISwx5LerQjJ_pAR-rrQKBBLJLIY9Z
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab1194d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=0dWPBfdzqdCcFQS_4usA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX7di8GjmLi9Wj
 Ll1cQhoxFRTMopDagE0ErjxGxWDwOYc2FhUBMC5pX9Y0fWkGP0ePc3QdkErCRHDyr4zFRj4zLfW
 jWTRGI8k1e9qFnKYm+1Z/Ne3ZMxxrlgVosxWKGVS7S5x8De5D7eQS/WiXQzRD//hvA/QUDWyMGy
 +BAowo7JXi4kxA4lDuKWBAUHW4b6rs/A6fOrf3FsL3WL/M4e5BKkF9vGH1hIQlcoGADwMpsQaVW
 kn6Wcsfl2SQUa5M6y1DN0jBJXLkLrsD0j0AwngcuEFkFFB2m7wM9BumuhnFQnNGYPa5Qb5yWtqu
 y5X11r55v6JJyQeOnCWSvMFRBL3v3VtweVWYjq+I9SFnWbjHtCfShFPi/+++ca+KT24joImhqiD
 M39RE9Sbp7RToBoKBQZF7P1sq5pLeT2QJAK2jgyt36HASKgU+GEtzYt/Xdawa9bAO5B1PxNUaEs
 XZ8SGw5HeDc/Js6bnOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX6eHVb9DlMSY3
 4rW1LDKYNuEJYLYy83KWqCsQ5UG/+AR2MtnO+tAJWuaQACYDY9FUrJ/eJ+i5EVzbBGIh9SRVblv
 1rNDB1gOTG8pvvUu2AQSN3zgY2l9IKw=
X-Proofpoint-ORIG-GUID: GzcISwx5LerQjJ_pAR-rrQKBBLJLIY9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210170

On 9/11/26 8:00 AM, Manivannan Sadhasivam wrote:
> On Thu, Sep 10, 2026 at 08:56:38AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 9/9/2026 6:48 PM, Konrad Dybcio wrote:
>>> On 9/9/26 2:40 PM, Krishna Chaitanya Chundru wrote:

[...]

>>>>>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>>>>>> +{
>>>>>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>>>>>> +	struct qcom_pcie *pcie;
>>>>>> +	struct dw_pcie *pci;
>>>>>> +
>>>>>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>>>>>> +		/*
>>>>>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>>>>>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>>>>>> +		 * still need to be masked off before shutdown proceeds.
>>>>>> +		 */
>>>>>> +		pci = platform_get_drvdata(pdev);
>>>>>> +	} else {
>>>>>> +		pcie = platform_get_drvdata(pdev);
>>>>> This is no less than an intriguing choice.. please store the same
>>>>> element in both cases so we don't have to do this
>>>> for firmware_managed solutions struct qcom_pcie *pcie is not being
>>>> used/allocated at all. it will waste of memory if we allocate memory for just
>>>> this use case. - Krishna Chaitanya.
>>> Should we move it to a separate file/driver then, perhaps?
>>> We could share the ECAM ops in e.g. pcie-qcom-common.c
>> I will let Mani to comment on this.
>>
> 
> pcie-qcom-common.c is only for sharing common code between RC and EP controller
> drivers. So it doesn't make sense to move ECAM ops which is just RC specific to
> the common driver.

Right, I'm not insisting on pcie-qcom-common.c specifically. I'm thinking
that the fw-managed RC could reasonably live in its own file though, since
it's more or less only additive on top of the ""normal"" QC PCIe driver
and being mindful of both when altering the logic is/will be a headache

Konrad
