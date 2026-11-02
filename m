Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624868;
	b=sYbZEcP2t9zd/S7QS9zQCrJNONhRLBpoaBerPwGXA2eJGPldrfv+I2ibxdYolD3KmmVu
	 dJM50eK2VEs7PULIAm1zjEXt1wBoOpqa7DBNNQaFMSD4kYXrC5c14TEYi/Vk1+o0zjwEO
	 5zEvE490llr6jZ0qOGs829TdrjdqkICyPNyuUvBur6II/C+xiBY0cnGusDFRIhLouQ6jT
	 DIQzD08abtK9q4s0TcEUTzAUwDlQUE8M5VBETilUoAyJ4QD7Aj2Jy+f09WSS7q+slvw5w
	 l5s5vOMyBxA/EOThHuPS7iQVV89yaCbivIeSRFyQO0yPAgF1dYPwWhPBraRZOuffrKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CWUpUxuG2Mx+foSQNVCGez6jUd9JGdEclM2YhClG7mw=;
	b=20F+sVNTN4bZcrlWCLvzRaTGilCHpZqViHS92OV+2/hPZYyuq5gJ6PnEkG8HCh6nh9fj
	 mLNKT1wKcNKzSkrNQQrucOSCSaKM7tQi48sFpLN4fRJ+jUYS6Fy60VdwCOphVXZ90pOUn
	 vJTH559X2ruNh7/hpHnrZCk6gHLh/LI2HJoUgNww/KQPDoCu5f69fD7Lg3bQZOmmluX/n
	 0h+j02pRkZWSoQ4OfArAJ+LqYbMgsKqNZk0BSIEK5Eq6acJpExdAnnmfnxgc+cAjr12O3
	 bj23wYkeimQL4/6di4YnFY73DGwe8Henv/NY+26MxAOdeFAyokAF3c35GGEFiGcdTag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KBpyMnOT;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EA0606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EA0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KBpyMnOT
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29EIXY2500894;
	Mon, 2 Nov 2026 13:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CWUpUx
	uG2Mx+foSQNVCGez6jUd9JGdEclM2YhClG7mw=; b=KBpyMnOTeBQWFRQZbJFA+4
	brYwJBp8n0xNIMNXaOMEmTvvOn9YDg3Uc9pOu3W2Z56aGQvlhnYGJVD52D/qcgiX
	3AtWB5zLS1ckgBLUzCKhOgk18ZNiZfmcXsLLu6T1+OOi+jaM15y8D4LntqSi6eY0
	AWAUauUcqnlOXP5G5wYSyynugUgjk9RviQsBohetuaQaQmxH5vf3wcp6lucbVxtE
	Xv5vPD9yZhEOh6BqhBJ4Dd0/aIdaIzvUsX83gsihl+k+wM5FesGHOgxvS0CGMFm2
	bcGncDgn2CE87gog2Eq/Sz8UoWdS+XLcUjS2BBGh904R+h/2vwFljQAWQwwMuQ6Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn7yrreyh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 13:07:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D4ugv1013130;
	Mon, 2 Nov 2026 13:07:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hnv5gnsh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 13:07:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A2D7P4l50790772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Nov 2026 13:07:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4CC520043;
	Mon,  2 Nov 2026 13:07:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20EFD20040;
	Mon,  2 Nov 2026 13:07:21 +0000 (GMT)
Received: from [9.124.210.123] (unknown [9.124.210.123])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Nov 2026 13:07:20 +0000 (GMT)
Message-ID: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
Date: Mon, 2 Nov 2026 18:37:19 +0530
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
Subject: Re: [PATCH 1/2] KVM: PPC: BookE: Disable preemption before loading
 guest FP and Altivec
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Damien Stewart <hypexed@yahoo.com.au>
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
 <20260928110411.844582-2-sshegde@linux.ibm.com>
 <9d83e196-4d6b-4be1-811c-eb72527d3cdd@linux.ibm.com>
 <2a75097f-6b49-456a-bfef-d5e559ce719a@linux.ibm.com>
 <33tnw44q.ritesh.list@gmail.com>
 <15075ad5-73f8-4714-0503-2565ca3dfb4b@xenosoft.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <15075ad5-73f8-4714-0503-2565ca3dfb4b@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Mcr5KJ/f c=1 sm=1 tr=0 ts=6ae88b12 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=23x4nbAjRhaKqWu8sU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX4vj918GjRKe4
 3LyWvR2pppGa6jw9sRvATtuVKefDWKtXLrF8mjgkAQw8XKtgLx8wG8UwsmgbUYyaD7c/CUtzL2L
 yelRW/BHyAMdCwCIOou5rbqo76xJ3E0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX8/iQCGZyN/P0
 7L0LUGYiurDcgwKzgwl96H5FBbbgYE/u+14k5ZJqVlRKK8DvYE16k1rVFgDPKszz4uAjEWP9Xor
 0E9K2kN2nJQIxbwzCSm3PJVZIailujWtCh1mvgYjQR0qmWuPcG+DtXCFVig7LH5SjZBrvr4f/ht
 y0rZTNP9Lc9kdrtrbCHes8My2YDgslqsOgp+wzkVI7sAOlhtfUYj6O6cuHFhj2zmyZurKSPFFGe
 sKbJw80OIW1VVuB6WCcL9yECS7YDFFEja3f2epgYQcfhBA0cJEiWUcY2eLI1wRAlBAZISOV1MU9
 gxs9LEkxs/72RWcBbEVZohnlQscPddPj+hmQzKTjdP2QEqQOV8bWOu25B4mdvgCThzOP0tZGArp
 Dun3K37Yedt0n+yJ6L0EHsIEK5wqSx5hQdIp3Gq0zI5FAau5pt5i1Q+SDtI8bX910h89KK6joDt
 XBXZYP/k7s8hTJ+o0eQ==
X-Proofpoint-GUID: RqJuW_-3prmXx-FUdwAsCu4AFcdX570a
X-Proofpoint-ORIG-GUID: 4dr7mgdQZrbUm31m0COFNVuKKpXMC-6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

Hi.

On 11/1/26 1:58 PM, Christian Zigotzky wrote:
> On 30/10/26 17:21, Ritesh Harjani (IBM) wrote:
>> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>>
>>> Hi Narayana.
>>>
>>> On 10/1/26 4:56 PM, Narayana Murty N wrote:
>>>> Hi Shrikanth,
>>>> Thanks for the fixes. I had one question on patch 1.
>>> See response below.
>>>
>>>>> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
>>>>> index 13ad4cf5fa71..5b9118eefe1d 100644
>>>>> --- a/arch/powerpc/kvm/booke.c
>>>>> +++ b/arch/powerpc/kvm/booke.c
>>>>> @@ -1404,10 +1404,17 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
>>>>>            if (s <= 0)
>>>>>                r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
>>>>>            else {
>>>>> -            /* interrupts now hard-disabled */
>>>>> +            /*
>>>>> +             * kvmppc_fix_ee_before_entry() marks the software
>>>>> +             * IRQ state enabled while interrupts are still
>>>>> +             * hard-disabled. So disable preemption while loading
>>>>> +             * guest FP and Altivec.
>>>>> +             */
>>>>>                kvmppc_fix_ee_before_entry();
>>>>> +            preempt_disable();
>>>>>                kvmppc_load_guest_fp(vcpu);
>>>>>                kvmppc_load_guest_altivec(vcpu);
>>>>> +            preempt_enable_no_resched();
>>>> Would it be simpler to move kvmppc_fix_ee_before_entry() after the
>>>> FP/Altivec loads instead?
>>>>
>>>> The normal kvmppc_vcpu_run() entry path already loads the guest
>>>> FP/Altivec state while interrupts are still disabled and calls
>>>> kvmppc_fix_ee_before_entry() immediately before entering the guest.
>>>>
>>>> So could this path follow the same ordering:
>>>>
>>>> kvmppc_load_guest_fp(vcpu);
>>>> kvmppc_load_guest_altivec(vcpu);
>>>> kvmppc_fix_ee_before_entry();
>>>>
>> Thanks Narayana, that actually make more sense to me.
>>
>>
>>>> That would avoid making the software IRQ state enabled before loading
>>>> the guest FP/Altivec state, and also avoid the additional
>>>> preempt_disable()/preempt_enable_no_resched() pair.
>>>>
>>>> Thanks,
>>>> Narayana Murty.
>>>>>            }
>>>>>        }
>>> I thought I had put that for discussion after ---, but looks like I forgot.
>>>
>>> I don't mind the above too.  but I didn't have a way to test it.
>> Actually I agree with Narayan's reasoning here.
>>
>> Sorry for being so late to the game. As you know we have been occupied
>> with other things internally.
>>
>>> So kept it as is based on what Christian said works for him.
>>> If you have a way to test the patches, please let me know.
>>> We can try that too.
>> Let's ask Christian directly :)
>> @Christian - Once we have v2, would you kindly help us test that
>> please?
>>
>> We think the other approach which Narayana suggested might be a better
>> fix for this and it can avoid preempt_enable/disable() dance. However,
>> looks like we may not have the board where we can reproduce this.
>>
>>
>> -ritesh
>>
> 
> Yes, I can help with testing.
>

Thanks Christian.

  
> - Christian
> 

Hi Ritesh, Narayana,

I am afraid I won't be able to work on this at-least for couple of weeks from now.

If v2 can be worked upon by our kvm team meanwhile, it would be helpful. It is always
good to fix long standing bugs sooner.

Where applicable, feel free to carry the tags.

