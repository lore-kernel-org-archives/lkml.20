Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0E3A7F40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934739; cv=none; b=vC3nBEO2cec38JY7BsvyPEULqO+orN9rqX0Nxv1o3b9rd/KMqtiKj3EDyQjK2kIhTRmo9A37UdRJ9G9QMq3nVKqJ7jTyFYxsCPvdippQU7qpPIsQv4dxZFa6Q7AIx2mCns3VfI1fYmMXUKRMdzdf3iX8u3f3dXpBy6zjY6JnjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934739; c=relaxed/simple;
	bh=azr12gOH3q5B7gWNf6x7rzRQ/JIIWWq2OCWdHJFh4As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJDoLJE6Q4N/rH1YZcS8BGrTrdThbHghhETH5Qu1l5mXYxjVSJ1N6v2ApduH+wPDmHWg8gRNNdqc7v41JKmJNhbQrPzJtDKRyxJf1tUBbz0TM3U3XvrchNkzKIphQMGdYVLuM6ROcDXKh1mQ+W/5uEJAZC7O5mcyj4z9wJPMbNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sWtflnjX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sWtflnjX"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1P5S2271874;
	Wed, 9 Sep 2026 06:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y94SOj
	yaOhiemdlabt7hod5PgpOOGY6sli9Ohvf13C0=; b=sWtflnjXIrEgkL9NBaXEj4
	g4JILTjCVoFinhmx6/+M6RkXtGO0SAWmkIwbexCekTsHIRt8p4LjFHVGR9lXfkmV
	3GD9hZMrxc1jjuczs/svkDM4SOjy0LKaLiBlnydlYlSuchp7DHfXnF5pRgLZ13Ud
	UmpoaiMNbM7nul/4d244tDPUhafwuxCpJiKg3tX3UYUHj+2Z082biWiEx9uoURy3
	ocrn2UmZbMbsGOtJcdfwLh12F/aR7w3DCDzVaWMtz3L05xyR/gLL984rtVVbdK4W
	vDNnS1nH9YdpPLMgEN5ytEZQIgX8IjrYWeTVgZYUNtdrHlqWAQDBTVpm76d6XbRw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbf442bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BGj1029580;
	Wed, 9 Sep 2026 06:18:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxdk0mqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896Imrb47186394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:18:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E0602004D;
	Wed,  9 Sep 2026 06:18:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B2C920049;
	Wed,  9 Sep 2026 06:18:45 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:18:45 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: tglx@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, chleroy@kernel.org, sbhat@linux.ibm.com,
        mkchauras@gmail.com
Subject: Re: [PATCH] powerpc/entry: Clear TIF_SYSCALL_RET before syscall error return
Date: Wed,  9 Sep 2026 11:48:44 +0530
Message-ID: <178893459265.174069.668944164131216470.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828053811.1042300-1-sshegde@linux.ibm.com>
References: <20260828053811.1042300-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: kz8mRDqjBfajbfMiQ6eLi9JWtdOfD2hE
X-Proofpoint-GUID: 3oWRKh6B2tyboJhspHQJq2t7ZIj2PEd2
X-Authority-Analysis: v=2.4 cv=DbEnbPtW c=1 sm=1 tr=0 ts=6aa0fa4d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=dd1Y5fJFrbZObAHnrb4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX5GyiWoD2S/uy
 JkhWhOnCJwux9r+cDUOe9hk4RJ+zZeQV16lNy0xWBeRp+a5ImJkQdkQMH7BMcOPj4xdu5c5ceZA
 MIFHhmiwig+pSeYtTP5J/s5KN+jM9FjxH2cxR2uK7uMJgnNmL2qQXXl2c0YmMR7SKDEOnAzl/Sf
 GyjG0/CP04K49HpNKPnU2ymhYodOVJYSGSTFnJ+jQRcLDQoIG+c8T3Rw5X4UbO92QdaMm5wDGnW
 rwRBy4S/rtaGGay1Kzue2Q1DsOGaPSnjJ3XUvzT56rdTPsEtxfNPtT1wtfCycnaRPoJTVnWNklq
 USYOkZChk08+hcG5j+4q4e6xsQZSOD34GqDpC8KTCkliXqB7lPb0R4qiZ0tcW6nzxg74I7zxMmr
 L8rm7jpsIyfou1Lxb7/l4IRoxkUwZIcYY3l2554Yk4BVx3TsAXrhwwotbuYT7jdXupXiMCJ5lpx
 Jt2Lk8x2pORRBRwo2cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX6SdhN1IayLTs
 zRfcGAAm6qZ379427m3WPltwgz0rsy1bMmiyU8k6C/dGV/tRUn+6P3Xgilo1R9vu2o25Zjx//G9
 dKDSM5W3jfrosWavJ8AMRk6EmO1leec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Fri, 28 Aug 2026 11:08:11 +0530, Shrikanth Hegde wrote:
> Shivaprasad reported a boot failure due to userspace processes crash on
> abort() from libc.so.6. It was bisected to merge request
> commit '3424d8c18a7d ("Merge tag  'core-entry-2026-08-17' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")'
> 
> Upon checking the merge, when syscall_enter_from_user_mode_randomize_stack
> fails, which could happen when a tracer like seccomp or ptrace intercepts
> and skips the syscall, the code returns to userspace immediately without
> clearing the intermediate flag which was set.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/entry: Clear TIF_SYSCALL_RET before syscall error return
      https://git.kernel.org/powerpc/c/2c1dde8a69a3a7d64425a6de0add6e289a5a402f

cheers
