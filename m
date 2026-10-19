Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CBA277026
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403926; cv=none; b=jqDHXkxRGTPh5/SzAVN1Av9qXfBG/NTV8bZRU8b6dcOoa4Em+smzmz9ZyyoYTIbs18ArSxmDaGU9njZBDnojA8fQxBCdd6UElfiO3lqVFFwidjRlpWlJZyP9PcPw5wHQd6GZZmvkzVsILcqUYKAshi/Vv0h16Q6ZQQEmdZu6V88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403926; c=relaxed/simple;
	bh=gU4ELiwwoaM4Hqr5oMaLIh9ruW9quynBfSUp/NP1m1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWJlAs9WaR+6GYut8F5HJ3OOC/5odFd/1Ihzg1r/IDSR0CMw3ZZn8vxdDwNZ/dU8cQ13rLFgrZkNrOJal+dy08kcut3d05HfwAa1wn1ENuwo8xDi7DSYdNK0fROqg6SbAJahhB0IKOCooTlpz6RnHqwmDWfgGX6D+zWcPgnOqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=s8047wsF; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="s8047wsF"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8iJBU3347290;
	Mon, 19 Oct 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ykotVZ
	0G22hFffyUukdEQYGaS7aY6z2JF7j2jrR+mnY=; b=s8047wsFgJTxc/R8IfGV7Q
	yHswIIaV+0AJK8aOt+uBxUEZtFb0O8PfYz5VIE7SM5czNUPKXWw83l9cONtIZf8X
	Xs+BL98Dx/IE9xxDFFO+QTJHYqglNsA2G4AlDALOX0OCTec3eqGVzQjxSnnLIRor
	AKZycu0bd0hgcL/ewKp21KDSkqOX/E27cL99Qw+4LpKn7Z0UqlAxPiNGqLHLwCVa
	uCXGcJj1tI+tmIsrud9/rZ8gGPmiQa/8C08PqHpk7bSwvYlYIZoSoKTv2Vv8a8LJ
	xCiUucPAc4Lwd1TT8ifc1mF2nD1/KKGrRj7THVxPYZPjz8Gn55GYbU38czTQAH2g
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hc0nvsmbe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:58:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YqRc3891051;
	Mon, 19 Oct 2026 09:58:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hcp1ycvmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:58:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69J9wOEj40173998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Oct 2026 09:58:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C33C2004D;
	Mon, 19 Oct 2026 09:58:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E8642004B;
	Mon, 19 Oct 2026 09:58:21 +0000 (GMT)
Received: from [9.124.217.62] (unknown [9.124.217.62])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Oct 2026 09:58:20 +0000 (GMT)
Message-ID: <355e017b-8773-4a1f-acdd-62a8e1bae69c@linux.ibm.com>
Date: Mon, 19 Oct 2026 15:28:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] powerpc/powernv/eeh: Map VFIO EEH error injection
 to OPAL
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
        oohall@gmail.com, npiggin@gmail.com, tpearson@raptorengineering.com,
        alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, harshpb@linux.ibm.com
References: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
 <20260831065441.48654-6-nnmlinux@linux.ibm.com>
 <280fcec1-4d39-4389-9094-74ca9e89a113@linux.ibm.com>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <280fcec1-4d39-4389-9094-74ca9e89a113@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXxIInMSspobl+
 XzRwxblDZBHknvkaSJs3VroOVkxUhavH2SqqOxe7ZHIrBzWWbJ9n1SeM753ZiV+suRwwmXHbvNk
 8GpkIf8ayLcFeu6PKeSFSYeq6NvCsFM=
X-Proofpoint-ORIG-GUID: NBi1zKNVdvNa_ke0QOAeMrthXZMB0jeZ
X-Proofpoint-GUID: YkI1y9tRJYflsbzNqYq5PBB8qaCEXy71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX9Cbn7OR25xRS
 BDd1Ve6EBa1iwjX6X7Z6yoQAKF4PhpDOoCktPucSNlzyrDzlF3aA1fFQSSFhaq9RXHAFIOqrdtk
 MQzAay+SYZKd9ABHzX163F2L1i+ucT9kdOIV50SOKET+oOwBdR4p9kuf9LFbpEuDNMGzR9190ru
 X5Jy7yNBO2kvPGQBRzFMR7peDHLiMtp/CNbpMeYOvh/jg4tjv4DvijfVB+Gi3KWRDaF53Tqe3/N
 03wwH1SHfu3VislCbLDTXJD3RmFI0FB5yq5zNMmr18R7g7PVFkX68Nhpxyh04+zVM1utOOBiNgb
 cjtk4SFOXdmctD4nNk88V7Hu1mRPYk8EH0khnZsnZppJIoe407RLghjawJ3U9zh+DNpElDqstaT
 qhb6RiFZoMvjjOqW/55SAK47Zufo4J3qum33ztNua30rDzgrN/4Xjur0GJ/00QZIsqQpqT/MsWJ
 vh5rNzyVRvSLdNsKPlw==
X-Authority-Analysis: v=2.4 cv=MY35KJ/f c=1 sm=1 tr=0 ts=6ad5e9c5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=OxPg7BpsEdBAPLtHTlkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

Hi Sourabh,

On 24/09/26 10:05 AM, Sourabh Jain wrote:
> Can you update the commit message to explain why and how this
> change is needed?
> 
Sure. I expanded the v5 commit message to explain that 
eeh_pe_inject_err() receives generic EEH userspace ABI values, while the 
PowerNV firmware interface uses OPAL-specific error types.

The backend now explicitly maps the generic EEH type to the 
corresponding OPAL error type rather than relying on the two sets of 
constants having identical numeric values.

> 
> On 31/08/26 12:24, Narayana Murty N wrote:
>> VFIO EEH error injection exposes a generic userspace ABI.  pSeries maps
>> the generic EEH error types to RTAS ibm,errinjct encodings, while
>> PowerNV maps the same generic ABI values to OPAL-specific encodings.
>>
>> Keep EEH_ERR_TYPE_32 and EEH_ERR_TYPE_64 unchanged.  The mapping is
>> internal to the platform backend.
>>
>> Add a switch in pnv_eeh_err_inject() that translates:
>>    EEH_ERR_TYPE_32 -> OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR
>>    EEH_ERR_TYPE_64 -> OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64
>>
>> Return -EINVAL for unsupported error types rather than comparing
>> directly against OPAL constants.  This decouples the VFIO/EEH
>> interface from OPAL implementation details, paralleling the approach
>> used on the pSeries RTAS path.
>>
>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/eeh-powernv.c | 27 +++++++++++++++-----
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/ 
>> powerpc/platforms/powernv/eeh-powernv.c
>> index db3370d1673c..53c4c05aaef2 100644
>> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
>> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
>> @@ -1167,13 +1167,28 @@ static int pnv_eeh_err_inject(struct eeh_pe 
>> *pe, int type, int func,
>>   {
>>       struct pci_controller *hose = pe->phb;
>>       struct pnv_phb *phb = hose->private_data;
>> +    int opal_type;
> 
> opal_type is confusing... How about opal_err_type or just err_type?
> 
Agreed. Renamed it to opal_err_type in v5.

Thanks,
Narayana
>>       s64 rc;
>> -    if (type != OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR &&
>> -        type != OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64) {
>> -        pr_warn("%s: Invalid error type %d\n",
>> -            __func__, type);
>> -        return -ERANGE;
>> +    /*
>> +     * VFIO EEH error injection exposes a generic userspace ABI.
>> +     * pSeries maps the generic EEH error types to RTAS ibm,errinjct
>> +     * encodings, while PowerNV maps the same generic ABI values to
>> +     * OPAL-specific encodings.
>> +     *
>> +     * Keep EEH_ERR_TYPE_32 and EEH_ERR_TYPE_64 unchanged.  The
>> +     * mapping is internal to the platform backend.
>> +     */
>> +    switch (type) {
>> +    case EEH_ERR_TYPE_32:
>> +        opal_type = OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR;
>> +        break;
>> +    case EEH_ERR_TYPE_64:
>> +        opal_type = OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64;
>> +        break;
>> +    default:
>> +        pr_warn("%s: Invalid error type %d\n", __func__, type);
>> +        return -EINVAL;
>>       }
>>       if (func < OPAL_ERR_INJECT_FUNC_IOA_LD_MEM_ADDR ||
>> @@ -1192,7 +1207,7 @@ static int pnv_eeh_err_inject(struct eeh_pe *pe, 
>> int type, int func,
>>       /* Do error injection */
>>       rc = opal_pci_err_inject(phb->opal_id, pe->addr,
>> -                 type, func, addr, mask);
>> +                 opal_type, func, addr, mask);
>>       if (rc != OPAL_SUCCESS) {
>>           pr_warn("%s: Failure %lld injecting error "
>>               "%d-%d to PHB#%x-PE#%x\n",
> 

