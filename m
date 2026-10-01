Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF849A3AB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855860; cv=none; b=BZwLpcIn/iwhqoUaubbv8pLkzLNuPQVCYfoV4nlUdWy4CjBOENoFHt3WQjkI6Ly5X/a/dXev0S2KJqTWJ78cDeWktvR7lddkzErHvfM+gMu7JLZfZ6oRaumH5nH8QTJWCWI9B2cg1PKOdJLgGk7UgAZVJLQpLkofn8avvg2eQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855860; c=relaxed/simple;
	bh=M46JAbLnX2gNU+KWoLW9TN/UIqrb6nO54gaEr6iAptE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0d4CKg16fNHCL8M2lr/ZjBobTQqS+5QIDf6g1bgT04Wui/NdFjo7eTXjDJX2lRplrG17Gal1j8fZT7jVU92qA3SDEIjLMEYQ6EPhI3fHfOCICjbPlr332FYS0UISxBSlJ8c9XCEMPpiuWIjUH6sT01KEmuuJcNPEfRtEJEVxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qXxcQqvk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qXxcQqvk"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69175WwJ4040785;
	Thu, 1 Oct 2026 11:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CvNbsq
	uruOc7qEZ2NvFsddIhHZwet6Cb1bCGMc846eU=; b=qXxcQqvkSn6t1W/hg9qWiR
	XtywVYxF55NGQROtBNGoxEVhV2dy0nQg5EfFRUw1YoWfjKvzlwGG7ViIVLvkiUpz
	Dtx+ZJzeXrjioU88Web/nPbpefV4HtH9Ssg+Ks08Pkd2oDglGaWDgfP7qBXvdo1C
	arsCxQdP10Tx+ivBg3mXH7xmFSR76uxDlQc6gV3yMvLPc5jZupFyQbf+mnHh76C0
	aCFHS7eW/JtVxzEHM39tscgofKgR4+SyPXOVfr4RYRbBri3voK3XrIkYNHRahXdp
	Qi+5VzMbv776Cd9YSCI1tUkxCOEtbr86d65neA+tluS8xEDeXAreRgIUUtiqtRNA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4feht4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 11:57:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 691BQUGT3460531;
	Thu, 1 Oct 2026 11:57:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pf72c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 11:57:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 691Bv8S239125278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Oct 2026 11:57:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27CEA20043;
	Thu,  1 Oct 2026 11:57:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5166D20040;
	Thu,  1 Oct 2026 11:57:05 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Oct 2026 11:57:05 +0000 (GMT)
Message-ID: <091e21dc-6403-426f-a849-aa392385d4d4@linux.ibm.com>
Date: Thu, 1 Oct 2026 17:27:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: PPC: Replay pending interrupts before entering
 the guest
To: Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
        harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
        venkat88@linux.ibm.com
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
 <20260928110411.844582-3-sshegde@linux.ibm.com>
 <3d342788-b99e-447e-a664-8385c2b55475@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <3d342788-b99e-447e-a664-8385c2b55475@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abe4a99 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=RqXkqaLFJHWaQp_LflUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NiBTYWx0ZWRfX2hhzQOrjKjF0
 zDGn99ef7POV+PPTg5WXTD/28NWxUXpGA/YvGtLKSQop1TLoh1d8OqiXuXpF2oS4b4A5U626usw
 kHMQS6TDWWVLU+hQcS/bJ9iLCe5jenc=
X-Proofpoint-ORIG-GUID: _w-1tvCJ-NJuhPjFjng6uK8HShi8gW8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NiBTYWx0ZWRfX4fEogC51CBpg
 rh9O/5DzDOAuv6kY8lVbwvItVdJ+DqAStOZqXYxc5Gkqlv9WGSDMpUT+MG9WE4HOhgBCj5ZR4Ux
 HNKov7tyAaWZdRUkd5e0GiuzN7zEY9B2BpXS5UCjsJEHrZzmkDR6OHW11SFi4vHGWzVWaGHSYxu
 usxhpQdXRWLkKuwIWSpc9UrdfNhYnnhd8GdVhCbh3846l0vyQwkoAkU83oWYuWtWJyiXkCydW+U
 fX9h43Ti1K+2i/F3q9UsPQbTfNNroodFM4CYB8CtrWjT2VFFYFhHb7nmwFy9eAVabfIuJ2mxBTc
 yz2/ULJVqH9Rp0LqdghCVeujQy7gxZJ075hvcU12DwQb5YG1g3P+gsMAZn0C9uHrF7Y5jkqvNIw
 SNkPK+ab9qZ7leRjuQWrWkRWVPKoM6akkakzqhOcCZP9C1eJdFEMbHL+U7Qqdmx1kpoqfrjmZW9
 TQa0KRjOnKI7qVgxlbw==
X-Proofpoint-GUID: ZUmTRd6CjINWXQgZ15rHiDPADRlnp9sI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010046

Hi Narayana,

>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 9194cf492d1c..847ff07c364b 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -147,6 +147,19 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>               continue;
>>           }
>> +#ifdef CONFIG_PPC64
>> +        /*
>> +         * Interrupt arrived between the soft and hard
>> +         * disable. Replay it and retry guest entry.
>> +         */
>> +        if (unlikely(local_paca->irq_happened != PACA_IRQ_HARD_DIS)) {
>> +            local_irq_enable();
>> +            local_irq_disable();
>> +            hard_irq_disable();
>> +            continue;
>> +        }
>> +#endif
>> +
>>           guest_enter_irqoff();
>>           return 1;
>>       }
> 
> It look good to me.

Thanks.

> 
> Thanks,
> Narayana
> 

Do you want me to consider the above as rwb tag? If yes, I prefer to see explicit tag.
