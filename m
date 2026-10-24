Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827044;
	b=AtU5iSufAmjbt5mkLDf+zdPGnve5nA4IGh49JPFa4+TpiRTOzSv/qZtGdQ6zF7QkNrrR
	 1LJ5gwp/ijeNp3YB0kBlDCeiwZIYZywzhmG97s1+Cj9sw8PH2T3KX5xzAfQ4sKkD4S1kp
	 OZQtMoaruwCDHjptPbwLJKlpOVTMFI1lpZHrsP5JXSerA0fQCSqAseidviJEzXLO45BXy
	 +x1+c2pnpb0aKhUdf95oUK5V/zHHxyNtqnL+c4BnyCUIa5LRH2nmjdw4nRBgA9lF61zuG
	 HyG4OPaVl44hQv3yY7gHhz5J9l6UWg45ap3eaDmTI1ueXki7i4oCdTPadfhmJl805Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uI7aiYQ48Fid8WtjKOPYCepGlYl0QFiKvAR9UraaOj0=;
	b=VyYIaNAXV/9NRtV2QcL7Ia74TthqHWgK5OBiC3va4kT5Y6OfWmLNElrxlQA7nlnLKGc4
	 agB9xl5K6C5et7MEQ1yerfyhnIM5GWHzOIWxizcLuTMFnOkBazAGPl3emnT4oNna1ckWx
	 Lutjlz9/HilQSYYgqMpUNUcDoBlwz3kZla3ogKcx+2ue958J891mABc+8/DMbR8YaPLaI
	 dPekloC/OMSjTRLqzxrzO6mZC5EY+AoEcQbwyf5uwThEso2BebLpG7eyMjIJos0jBr2XD
	 GrJbEiBi7MHT0x8std0dJVizX0CXwN5ZPGV1g0Fdjqw2FmQ+kZz56rJm7Ntyz5uAxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jgorg7FU;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D4606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jgorg7FU
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O31mHd627908;
	Sat, 24 Oct 2026 07:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uI7aiY
	Q48Fid8WtjKOPYCepGlYl0QFiKvAR9UraaOj0=; b=Jgorg7FU3BwW41Cxqsfoxu
	PKAENVtHlWcAXORCF7Mjs2xbppP7+XerACtFgP865CF9LSgC/dzwAFl+ZJI5LavB
	W6qoKUMzgwahLdW8skllkseFLBh+TbT1rU/GmeHn/zv1V2Hw75rMI4fIZnm7iGOU
	2mZRR+MsQ3B97pXQFdQ/ewkdCk0bG1I3Wb42edFbNrQt0VrhcLSqMGJ9j2L4hFtv
	mWdLYuYdymHru72MqL6IfX04RWL2zLRrwlGevWUDLAhw79DjAlqKBzrY4igZuW3I
	JMVEZBeAQy0xlh+Bjo7J6WXBgk2l3/htGigljKmSJK5yVOZJTod/PtSGPw1HRx6w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hgmd6gnfe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 24 Oct 2026 07:30:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69O24tYm2956305;
	Sat, 24 Oct 2026 07:30:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hfkg287av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Oct 2026 07:30:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69O7UPFb50594204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Oct 2026 07:30:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EBBC2004B;
	Sat, 24 Oct 2026 07:30:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327F120040;
	Sat, 24 Oct 2026 07:30:22 +0000 (GMT)
Received: from [9.124.220.45] (unknown [9.124.220.45])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Oct 2026 07:30:21 +0000 (GMT)
Message-ID: <4bb9ab68-bb2b-49a0-a066-4de1405971a1@linux.ibm.com>
Date: Sat, 24 Oct 2026 13:00:20 +0530
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
Subject: Re: [PATCH] powerpc/irq: Fix build with CONFIG_PROC_FS=n
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Sasha Levin <sashal@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
 <20261023211503.3764302-1-sashal@kernel.org> <ecdg558l.ritesh.list@gmail.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ecdg558l.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6adc5e95 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=ZiliM2NqM_YteYZ0dKkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAyOCBTYWx0ZWRfX6QM9tRz1XmsO
 rek0Uh97ISlYub/Ogi4BJAJhzQYaTYvq1kML++2lzSBQtOpa1yOXf48iAZzp2IHbrsdcXeTg55K
 7tljTmVtL2kHgoMnSMI6vjET3YmuMSgvvFJON9YNaBR+FUKrrRsheOZw+Sc3UIxfhliz6mPieCv
 Nm6LUBOfuBbMBc25YtA0kddMFGUwHVVGQRFu2R/7H94+A9GLx72sxB6FR4fnfgzK5wk0DC4aEL2
 oiBqFeppgcng0j/0Hbeqt6+3rclpJWFDhu+y5qxcmVUEkuZX0KiMYC37SFy0TzmlSvPTWL6oZqX
 bbFfBa4NtEX1aG4A6dwLL/H0gkz1YQGFwPx4vpF9ptBsQOynutPuE+7rhstKtLuTos4hDZrd8vl
 L8x5gEDOqG6AjyeX7p3azbft4irGJ+/+52a2+UliUl7lVtk/eTRpkoR82QKVUXNmt0zLemBj2gq
 7t+c5EeUxWDlpDhlf+w==
X-Proofpoint-GUID: 7P7jaioRhXgNMr6Z24JqAYEJDaz1v0Ul
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAyOCBTYWx0ZWRfX+n0kkxAlhgm7
 brew0AybCbrhPw86QXXMR377tWjLmutpJ/0u9G1oJKqX91iRg7eLLkvlOvDQAHFPhvWtVKHRWIY
 5Fzfwqp6vPSzPltMleEA4pJQjTODSCo=
X-Proofpoint-ORIG-GUID: iLMvGNDTpMGUTszTaDwDKrcp5-cYcA20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240028



On 10/24/26 5:39 AM, Ritesh Harjani (IBM) wrote:
> Sasha Levin <sashal@kernel.org> writes:
> 
>> Commit fbb22ceaaf8f ("powerpc/irq: Make irqstats array based") made
>> arch_show_interrupts() call irq_proc_emit_counts(). That function lives
>> in kernel/irq/proc.c, which is only built with CONFIG_PROC_FS, so
>> kernels without procfs no longer link:
>>
>>    powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
>>    arch/powerpc/kernel/irq.c:134:(.text+0x4b8c): undefined reference to `irq_proc_emit_counts'
>>
>> arch_show_interrupts() is only called from irq_seq_show(), which is in
>> kernel/irq/proc.c as well, so build it only with CONFIG_PROC_FS, as x86
>> already does.
>>
>> Fixes: fbb22ceaaf8f ("powerpc/irq: Make irqstats array based")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/
> 
> Looks like it still slipped through.
> 
well, fix was posted a day after the report but was never picked up.

See the fix posted here.
https://lore.kernel.org/all/20260930072329.1110379-1-sshegde@linux.ibm.com/

Diff is same. Since it made into linus tree already, all is well.
