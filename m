Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7D40099B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521690; cv=none; b=cYQc0rRMQJRviK8/yS0AQXSNcvHNXN9udbqYPyya263DUGqVA0oKbh+THzica/bmzX9sXvRhN8ZpCXwp1PMuZWP9vMaaeSZosXc3hzuPlXJxSAL08BzKFtHjXqzpQaxo+xao75luxKcWrHipKTM71a47vDXoQ0kbxgNVdDEZna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521690; c=relaxed/simple;
	bh=aNFyDlOEdVMS9B+g61VLr36q7Bw+gBSrpf/KNHxrzoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiECXqz9JQo5h3RmX8LtA34KWhcE8Rh5hAYMROzz+lI2f6aZFUJF/MM+OOWHYYTJpVNwkeBRidhT500UGwvouEgAv3Js8wudPdyaLv5BwND7NIKk29HT/OYWUdBHYw1iPT6R2lAj4Na5rwLm9ieAofKnSmTwgBrq1A9RyVHbkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=doIrXJ+1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="doIrXJ+1"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AVp3J1536461;
	Fri, 4 Sep 2026 11:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=AnZXsQc5hzhg4mdkNFNmG
	5Z6h2BQ91aM/5aosNwiPpw=; b=doIrXJ+17mrrR1QfLrkY1OfGHqIb9bebzS+8x
	ZIXMN9fFnl+eBUl8q0lJ/QRY1K42bXlS5H3S3No05/aVsCFLcZ9BnP2FhhRInuOy
	hxluP9MWq0MCfro51raeTnytZwafqqLlsGuNTKwW2gt0o3OZC13cZsr0ZqxmpjaV
	HX0x9BUbGTGXZtuAiiyALpj+QG76J8xiSXOUumA7jafStAnOXlbOFpVo8sudK+OY
	Vul62QuU0bxNTLI+IHkOQSDCbkXlcCkSOQMEb96qfZM5fqB26jlVTYot88Bt4cSS
	ZS0pUypEjvc8P8NuE2gfVefJS+8sWEg/zzsQtln50d6pW6hog==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2tsr91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:34:35 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 684BQOYi024811;
	Fri, 4 Sep 2026 11:34:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcarkmskg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:34:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 684BYUOJ48497078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Sep 2026 11:34:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A0A320043;
	Fri,  4 Sep 2026 11:34:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC8202004E;
	Fri,  4 Sep 2026 11:34:27 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  4 Sep 2026 11:34:27 +0000 (GMT)
Date: Fri, 4 Sep 2026 17:04:27 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        skiboot@lists.ozlabs.org, arbab@linux.ibm.com, mahesh@linux.ibm.com,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] powerpc/numa: Support coregroup on PowerNV
Message-ID: <apqsw16smYGV3q3w@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260902123458.340456-5-srikar@linux.ibm.com>
 <20260902123458.340456-8-srikar@linux.ibm.com>
 <c11197ac-ce7b-4fba-8ea5-4f38be9f7106@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c11197ac-ce7b-4fba-8ea5-4f38be9f7106@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a9aaccb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=gTBKziIoMwFYf8sqKhIA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEwNCBTYWx0ZWRfXyB9yyCKjeGrF
 1eATvVcxOxHtZa+qN+/oUWrUi0HWhVMOFfg9WB+nH473yXLWJFf4Ebvt7t0XD9ONUZa98PQR1G8
 P2zoULXqSeMt2Q509lbvPo7otYTJ/Y8=
X-Proofpoint-ORIG-GUID: ZPe1aEWAj9sJILkR9OHq9sqaw5TZzGbK
X-Proofpoint-GUID: CEv9XwryGMlI8IMCptmP_OHLBYCKbMWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEwNCBTYWx0ZWRfX5yhY9n83ni2g
 Aav4cEnr9vUKO0Mpb1u6t4E4KdYeuNMC9R+Dkgc3EdwgNaqBrEbIeQgzlQukAcoTUzdIwqR92KW
 ckFV3121m2dGMMFiEb82Lwghx4fBBbuVhlczKEI/y5PlG+0D50VxhDXX3ssy37ryF+hR/VcrSv6
 J4n3ATWRB7K+eK+MndvS7BIIANtiCpFzVDv6XY6a6zs4572Pxlx7yWTH/PItppo3wZqEfb0Molk
 kKJIHi9b9QTww8fAYiaPiaU3NsyNrmZyBWJ7eyXtYdpSjCtdEzTc8KkHtF4uOs5eh9+UNGSPl0U
 /llQFRr5imn7XF+Nz5fkdqnoahD7UstqIrZnlrvYMk0nf3nQxQw89M2cWmog98yTgdXfKCOZ3xQ
 bZFdPlQO1ULaKSKdA7J32L2CqsecnWHi0v5wT+HEAg0MRz3FwlL08B4yv9rglcSzobJWC/SDnHS
 IyL6SKbL7Gsig75kPow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040104

* Shrikanth Hegde <sshegde@linux.ibm.com> [2026-09-04 15:34:50]:

Thanks Shrikanth for taking a look.

> 
> 
> On 9/2/26 6:05 PM, Srikar Dronamraju wrote:
> > Coregroup support on powerpc has so far been limited to PowerVM LPARs.
> > However, PowerNV can also support coregroups when firmware exposes the
> > required coregroup information through the associativity hierarchy.
> > 
> 
> Existing firmware does expose this info already?

The corresponding skiboot changes were sent to the skiboot mailing list.

> 
> > Detect coregroup support by checking whether primary_domain_index is the
> > penultimate domain in the CPU node's ibm,associativity property. On
> > PowerNV, a non-penultimate primary_domain_index indicates that firmware
> > provides an additional level for coregroup information.
> > 
> > This keeps the logic compatible with PowerVM systems, where
> > primary_domain_index is likewise not the penultimate associativity
> > domain.
> > 
> 
> Could you please put the ibm,associativity on this powernv? as well
> PowerVM's so that one understands it better?

With this patch and the skiboot change, the ibm,associativity will look
similar.

For example on a Power10 Baremetal box with skiboot changes.

$ lsprop /proc/device-tree/cpus/PowerPC,POWER10@*/ibm,associativity |& head -n 20
PowerPC,POWER10@0/ibm,associativity
		 00000005 00000000 00000000 00000000 00000000 00000000
PowerPC,POWER10@100/ibm,associativity
		 00000005 00000000 00000001 00000001 00000002 00000000
PowerPC,POWER10@108/ibm,associativity
		 00000005 00000000 00000001 00000001 00000002 00000002
PowerPC,POWER10@10/ibm,associativity
		 00000005 00000000 00000000 00000000 00000001 00000004
PowerPC,POWER10@110/ibm,associativity
		 00000005 00000000 00000001 00000001 00000003 00000004
PowerPC,POWER10@118/ibm,associativity
		 00000005 00000000 00000001 00000001 00000003 00000006
PowerPC,POWER10@120/ibm,associativity
		 00000005 00000000 00000001 00000001 00000002 00000008
PowerPC,POWER10@128/ibm,associativity
		 00000005 00000000 00000001 00000001 00000002 0000000a
PowerPC,POWER10@130/ibm,associativity
		 00000005 00000000 00000001 00000001 00000003 0000000c
PowerPC,POWER10@138/ibm,associativity
		 00000005 00000000 00000001 00000001 00000003 0000000e

> 
> > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > ---
> > Changelog from v2:
> > - Handle comments from Ritesh (one hunk needed to be moved from patch 2 to
> >    patch 3 to build correctly)
> > 
> > Changelog from v1: https://lkml.kernel.org/r/20260524010017.140408-1-srikar@linux.ibm.com
> > - Handle comments from Christophe Leroy; make code more flat
> > 
> >   arch/powerpc/mm/numa.c | 58 ++++++++++++++++++++++++++++++++++--------
> >   1 file changed, 48 insertions(+), 10 deletions(-)

-- 
Thanks and Regards
Srikar Dronamraju
