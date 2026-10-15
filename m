Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4701481AB0;
	Thu, 15 Oct 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064380; cv=none; b=m2m7h0Tc6kyscYawOGFZYitRgdA4stYYvbBgrAU0ZsY3zqJzLQGbsLia5VI7IE4Y0/32aKL8c7Z+sgJIZ39EOArGn1zvt8xj9w4ofMdVFGOBo/AsVwBP0gzlXWBe9Q7NfhxwV/KVVJze5pn1iCq6FTh0dAryyv24seOHQovwTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064380; c=relaxed/simple;
	bh=ggNKfe7DsoRZdwgn2RuKKRvue357paIB6iUvkBoMdm8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=TwVQkkU+gX6kDAOlqeTBaPny3/JzSP3HuMLNvZJtBYFBzPyMru1vodhXRlBzBAfJwtlfcSR657ppiZRy9sI8Pfi8V1swLlmy+FZtYljr4mtboVvKySt4VcMawAyfcJrYi3fxCOej+I4hHp8qk5o97Nb2iCtF6BjMzuc2X6OGZ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=de.ibm.com; spf=pass smtp.mailfrom=de.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mGCOPPa3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=de.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mGCOPPa3"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kxu53001423;
	Thu, 15 Oct 2026 11:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nXrlPT
	DEuAC25GblJ8KAVsyAP24bXPsZGLFHX1kTmSM=; b=mGCOPPa3kNVw2B9J3EVkdD
	RMvfWEZ+phUbuiud1obcTZai/qsWL8EgdSmiQbBMxECoFVCV+ec0sBMVUzDhUQHC
	aaJtATXAkVJWFxJXJvVidC5PP1XMZYccQQWfHN4Jy0Iw4u1D6n6ShHPDQbyyGnJN
	qG51r96ZaUucMj7NXQKEIrscidO2GNpZ55YVL9tp7u5KvD54PU/l2WQ32ws6Ogi3
	fW7qs57wwi+j1J/ZP5CVfvp1/E3lM1BlDDMKJIx/aOqHQJhguf6l+k08pS5qfHro
	hFibt1SqcgTHDuejc2P3QeX7P1QT8qqhsnxesnw8HfWCg3L0x2+I3Z6677Z6ga4g
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhsmku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 11:39:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9nrtQ1929640;
	Thu, 15 Oct 2026 11:39:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9pb3sfpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 11:39:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69FBdVmY45023710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2026 11:39:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36F0720063;
	Thu, 15 Oct 2026 11:39:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA5012005A;
	Thu, 15 Oct 2026 11:39:30 +0000 (GMT)
Received: from [9.111.72.94] (unknown [9.111.72.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Oct 2026 11:39:30 +0000 (GMT)
Message-ID: <3c5e6f41-1a47-4200-a028-39df28605ab9@de.ibm.com>
Date: Thu, 15 Oct 2026 13:39:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <atC5LZemJJUievn6@sirena.org.uk>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <atC5LZemJJUievn6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX5vT3gRnnlQkw
 4UVW6JmBbIdoMXrj/HhhbXqz1gJ6bYqSI2hQ5col5hjjSuC3aT0rwaF6huwecqv0I14J9qNKeja
 00Fgawy5HdNjf21sWgVoGQQhoBfrNLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX4I4NFuln/BnI
 aWaNJlf1M4aoZOMpmX8PmqgQDLirlxuRyKivtzjVyHu/oE5BWrHV8djodh2Qt0pHpJuP3r7Olkh
 vZ3cXtEmjNbIxmvXf2oozj9NiA3gGkfAH/AOChJ/re7AqGqykFxaV1EkYAJ1O5UCeNfXph7OqYi
 m/zx76tfVgAGyucMPdFDhYQAJIq1wCSovmyVVkG/3R4vMpvEHJDpywAi0O5sgcfHrywbQLKvLN8
 SpITJ/IUgCljxDMRc2GG4UJ/K3XRoM9WQstW8Qn5ng33L4x9JddENjglTmINtY+u7Ot7s9i2IFQ
 poBIJBVVx5xaoVbIP5DMewKa7o/wllqlL7lDnCD0Bmmh8mv8OL2PjjYK/mS882zx0KBUpzBy/s7
 T1Aa6SlOouoTNuHrPq1uXyvPKxtqbRgWREn4LF2zVkyo9S+pvLs3fK9Vp8Oec8Ipx3pBHwTtOOr
 XTDxqpXG91EtBll6PtQ==
X-Proofpoint-GUID: 6uEg_tpnpMayb3bSZKzQx_yxGAJxtsWe
X-Authority-Analysis: v=2.4 cv=RoFQvymK c=1 sm=1 tr=0 ts=6ad0bb77 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=PbF3cT22zb4_k3pZ6hcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6uEg_tpnpMayb3bSZKzQx_yxGAJxtsWe
Subject: Re:  Missing signoff in the kvms390 tree
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150044

Am 15.10.26 um 13:29 schrieb Mark Brown:
> Commits
> 
>    2da555e616089 ("KVM: s390: Kick PV cpus at the right time for service irqs")
>    9d2c7de8ee14d ("KVM: s390: Improve floating IRQ injection behavior")
>    c07c9e91ebb33 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the STHYI buffer")
>    7e4702e32be06 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the STSI buffer")
>    399ddb20fa708 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the GIB")
>    1d42d02f443d0 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for sie_page2 and CMMA")
>    ec95708cbb07b ("KVM: s390: selftests: Add IRQ injection selftests")
> 
> are missing a Signed-off-by from their committers

Thanks. Fixed now.
