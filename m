Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064279;
	b=TB8fCLnF72ITb9w2kte5JfHyYalOvhEBj0KcU36WSwgMbVPwwrBCGXewAsArizv4onmf
	 XYCCuO6J8tcSzuU+pULT/SspgGn0/aIJiCxTqrY0PbGwl8xqBfoPDKO5mV+O2hxl3cNar
	 +F9WbRkjpjFFLFKpY37g4i6ZDU0uCzLukjumJSY+IJUFPAdUVvKWhX0/UVj7Btp1k1Nvt
	 K9987UTc8NGGXpe0gYx4mOQ3OVgVUaneEc1T4s9Z1sNkhIOWIVK7R8+oM9JI9m3TgMxFq
	 d1Gfgwy/vtnmn4z9bck0+9U+/fZ5CBeqGFVsFgIE38BAcrf2jbkCAQQ40Z3amO9b+6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LrJ821n4aqzgpo5xnB92QQehLQuyuvpOQZcpPG/IMH8=;
	b=IVk7QR0rD6XkYqpgwWjHTIQfOQgQ3794UhloJOhkIRij28pmOuhgqdybWZA21r9iAJIH
	 NwnEyauiLV34IpQDJmYlZq51lBhGbyRMTNfA9YpGsKGrgwE85mAf7mHNsivDXuODVZpYN
	 zC8hgL6lmIIU6ydLoI78sEdMdLC7XCuUNGguihZYvYQXxwjTtOd5MyMufcqUxXgxG+7eG
	 QeKzwtavduJJAzNdb97ltHapFpMSVhXU3dG6JqfHRI+NEgsYWGE5CXcIIX2e4qofn1As8
	 g1H7/yQ63eK4VIY+nAvwyE0tUmYXv8BXBHnIv/vK+IaQN/nKXdo6vyscXjZ9eL8TMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J5wvC0kA;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524DE606A9DE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524DE606A9DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J5wvC0kA
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7CECIN1710169;
	Sat, 7 Nov 2026 15:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LrJ821
	n4aqzgpo5xnB92QQehLQuyuvpOQZcpPG/IMH8=; b=J5wvC0kAcK0X9fE9PDnLeX
	UhQQSlYKzjitMMiYG+BXIlnp/PEQZjD00oWo23+wyCDKaabCAYLTzaBVAOjV5cRu
	HQAQmhQ2D68/ENGlQ/fptwSibtoicSnougFAgHSTL+2Bp+GFPQrxAXAQvM4nXX9Y
	3xpDCkTWDpgMapI5FTPmOtLZH7W7bjc7pu36AB6vUdAS2xQfZNNmwjXTKPVRlTRM
	SgRo2KB3xbrx1BO3l/YXlUGT3R7HGxI3jhCt5Kghdgknl4JBzJpnCAn440lTC/NW
	AHtbk0bTKlPmGGACNy8cG64hfKHqSPj/BOP5ZECSE/a1K6F3WNrderot6A65AIRw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsug5jn17-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 07 Nov 2026 15:11:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7F56Si1086609;
	Sat, 7 Nov 2026 15:10:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hswppj305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Nov 2026 15:10:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A7FAsax52232604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Nov 2026 15:10:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA1412004E;
	Sat,  7 Nov 2026 15:10:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5BC020040;
	Sat,  7 Nov 2026 15:10:51 +0000 (GMT)
Received: from [9.39.28.191] (unknown [9.39.28.191])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  7 Nov 2026 15:10:51 +0000 (GMT)
Message-ID: <3d6722a2-688b-4829-b015-c15c03838c47@linux.ibm.com>
Date: Sat, 7 Nov 2026 20:40:50 +0530
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
Subject: Re: [PATCH 0/2] KVM: PPC: BookE: Fix boot hang on preemptible kernels
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
        harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
        venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260928110411.844582-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: TiLWMMM_PkRDynKR8b8pz-lHL4BKbpqG
X-Authority-Analysis: v=2.4 cv=PeVqFShd c=1 sm=1 tr=0 ts=6aef3f84 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=tAcHNJzwEHiiyL2kpDMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: f85d2Sjoe9ihTO0_OUSj3gE0sAtXjGR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA1OCBTYWx0ZWRfX6nuIgrWgcMy3
 O0Mgzx3jDcwQxDDRT7el7aNM8Z0uhDlIBLwYZuNzZchZSF5wiDgWEaegJa8C/On9uzvwJCi/GIM
 HrXXqE6ZWf0e3825Z4/fJb8ZoIxvPxRWqiNiSBmeqqxiLzxvRMmkln6jCBEnyApZwlzDCM7RnMu
 enIweON24DGVYX3T3BrC9pCYifyh+VeiBvbHWvsZk70fUy+taLtRtNwwKl/k4Q/70UaDU40QviX
 zZiQtycHjZ0nRUFH4yQCmxgNN5ShhLJJVQ34ha2aWhjmbccrcLW1P3LGktM0aD27HiBVyOzNoLE
 FDnSvgPas8g3IsHCC09ZKPUvf4hVkbZCGWX8Yd43uAT7o+g0gw4l0nF4aSPawQONKu8Ky/csgO+
 VPT/yBcDzO+85Q5HyUuH9El5P/ONy6ZHIeEYmZIEs0FG7byes6th/SnCHNvfe/U/k5YbObyqgMb
 9HBeW6WmbSsWqWR19FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA1OCBTYWx0ZWRfXw3+IL1wYDnyF
 haqiangTFkETZEsEwc664X0DIBTV4oFvoJg74K1TNUjwmJjRVSxi1YIJFXyg0cfNv1LKBh7MCAW
 xCUQAWM50d/OpqY5o34uJIxeNPqeKCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070058

Hi.

On 9/28/26 4:34 PM, Shrikanth Hegde wrote:
> Christian Zigotzky had reported that preemptible kernels don't boot on
> his FSL Cyrus+ board. The board freezes on running either full/lazy
> preemption and has been an issue for a while now.
> 
> https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t
> 
> After 7.0, there is only preempt=full/lazy which removed the
> preempt=none/voluntary workaround used to mask the issue. There was
> challenge is getting the console logs which made the fixes difficult since
> one couldn't know where the issue is.
> 
> Thanks to Michal for helping in getting the logs. That pointed at few
> places where the issue could be. This series is an attempt at fixing
> those.
> 
> Christian, KVM team,
> Please *test* the patches.
> 
> Shrikanth Hegde (2):
>    KVM: PPC: BookE: Disable preemption before loading guest FP and
>      Altivec
>    KVM: PPC: Replay pending interrupts before entering the guest
> 
>   arch/powerpc/kvm/booke.c   |  9 ++++++++-
>   arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 

All the suggested changes makes sense. I will plan to send out version soon.
Hopefully mid next week.

1. Re-order in below way.
	kvmppc_load_guest_fp(vcpu);
	kvmppc_load_guest_altivec(vcpu);
	kvmppc_fix_ee_before_entry();

2. Define a common helper. I am thinking to name it as ppc_hard_irq_disable().
    Since suggestion was also to be used in the entry code.
    Other names i could think of are local_hard_irq_disable,
    arch_hard_irq_disable, local_irq_disable_hard.
