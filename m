Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B0549388;
	Thu, 15 Oct 2026 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083311; cv=none; b=Q/mQv0XAJJJJUUt9y6ePS5pOnB76pi9GDRa0lrHw5TPG7otVJ0XazIEYF2S5XZmgvUFKx4sDFx0KHnRdhY1VE6HuIm+knujs0zAQcddcuUPO02yGfkfU6UIU5Kf/9nLA18EAqJpaco1ZuHXRelch0pyti2bmeVTlDkc1Hv8eXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083311; c=relaxed/simple;
	bh=f+Ig04id0MJLu6wfKUjMZtA/taon7qsIkTQOthWsVls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYVcrSKMQpl3IxfX9UVfEmX5HfuHakP9UCEoOwAoYLnVUvu15Ql34w7eL/NpPKZuffr0HzJ5LM8VnkTFICFX1oo45tbW7CfipJAbBKD0hbVuu9hpoRjTLZierOQTmfEZPEV/6boePcFLRw0QEkvXCpyXF+cmfgIFmyXmj0SgXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Tbf1tYkg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Tbf1tYkg"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kF5n667561;
	Thu, 15 Oct 2026 16:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DfN8XB
	57AjPfK3wDVJ1HboWsOLfYln//rkSlVO8j668=; b=Tbf1tYkgOoKBW/ObJRVpgY
	ZAq9xblPa/V2posgm93HjtszRyG4HkmZ6JJWqb5V4g0O8O728Yeyxgzn1HngfOPA
	S5hsi7CCTS6cba8mcPH/POareDvRxIirVeSDemgqR7/vlRpNKfC8G1Z+xFe5oXkQ
	qoAgi9SOxj4HEwY8oV6d0nGZWUHEXjPApolItBRpJ6gMwGkK0wMP3rO4MV+hnWJE
	2y7KYgY/HROeuPQ1O1WM8ThuhXRd4Et2rp/eP8CX54+qkYKO/QNzqmLhHjQJwftT
	HOQRDYCQyixAE5fuShdbXIx1jabbZmRqHNwdI2u1xBojM5930v8lSLIDS1jzd4cQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dugu4yu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 16:54:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69FF89H62057775;
	Thu, 15 Oct 2026 16:54:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hawqws7y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 16:54:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69FGsmYb31982102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2026 16:54:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 794B620043;
	Thu, 15 Oct 2026 16:54:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DC9020040;
	Thu, 15 Oct 2026 16:54:48 +0000 (GMT)
Received: from [9.111.57.222] (unknown [9.111.57.222])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Oct 2026 16:54:48 +0000 (GMT)
Message-ID: <0e51ee38-d774-4740-9984-8908fc9307a5@linux.ibm.com>
Date: Thu, 15 Oct 2026 18:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>, Gautam Gala <ggala@linux.ibm.com>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <atDyad6Dg3msWmW_@sirena.org.uk>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <atDyad6Dg3msWmW_@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Cr0q4X4D c=1 sm=1 tr=0 ts=6ad1055d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=8sW_m4_jY8uPIwVwgnwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: F11heQXIqe0B6mTKilmCAREWGP_M4fqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfXxFUpcviRiUCl
 O6QjgXL79M2nxHma+s8Ta+FcQ8aUeZl1UGLBPECuLsSFDRWog2Qg1/4n+US8eojKAC4W99nAJDT
 gcA/fhkWTivny7fifiq0RraVTPS8t3Bv4b3XhdSMC+0QCGZp4pQtE7B4QtP531lqoY9U1jSitiR
 ip1nMELn4dz+F3Zq+0PGxZHHuujavhvxngb+4brPizyHASgFUaL95QDoMG/MSb3Nuk+gnCE03Oj
 pN+fpKGb3q9xXTWAmGjVut7WNVhPaym81lteiOsTWYdo8j3OoS1fdfrV+UmTBHa/CvQePgA0a0d
 6Y83GuA5MSm9/xe4+uXJECZGTiHmcVJ9uBg8vuD+TOhwIf/4ZAe7PCnfLPQbDjzN6cWFZQJigMU
 M9e1MhGz4SOdmZf+K0T/FD3oreN9v2FWm37ZY4mDERGPe5iMncr+HBodJPiu+O++KHpcOefU68U
 TiuS0+APjpFmPcWuLCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfX9iTqBNIaGBOH
 2AC7IBHuZO7JR0QTJ7AruYR3rh3iBhBnJNfB70TkC54Y50cO/g2ovDYuNOYbxMD53tzWIals5tM
 4qXVk01YVaD/eo0nQffExUEEpdls6uU=
X-Proofpoint-ORIG-GUID: F11heQXIqe0B6mTKilmCAREWGP_M4fqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150066

Am 15.10.26 um 17:34 schrieb Mark Brown:
> Hi all,
> 
> In the final build, today's linux-next build (s390 defconfig) failed
> like this:
> 
> /tmp/next/build/arch/s390/kvm/arm64/../gmap/kvm_mmu.c: In function 's390_kvm_mmu_prepare_memory_region':
> /tmp/next/build/arch/s390/kvm/arm64/../gmap/kvm_mmu.c:83:22: error: 'struct kvm_arch' has no member named 'migration_mode'
>     83 |         if (kvm->arch.migration_mode) {
>        |                      ^
> 
> 
> Caused by commit
> 
>     325380d8e7893 (KVM: s390: arm64: Integrate arm on s390)
> 
> I have reverted that for today.

Should also be fixed tomorrow. Sorry for the hazzle.
