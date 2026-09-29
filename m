Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230335172DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681477; cv=none; b=H+y3sw45kQFj/GfQtTzMSVgxTqiIbguu9VHHXCPNSOmycRMGm2EOcgXPBxHgcSQDXONxpP9496oXyHi65Kt4LfdBT4q4teQam2HEtlpR63OXLixB+tBnJI7TwwjKdS0ncwaVg4k9HYT9bSX3X9UORr3DNLJWiD+GjDSHSH6dd+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681477; c=relaxed/simple;
	bh=9knatAfaiQiU3pr2FvaatlxJGpXT1utRORcWq/ZOPKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QE4QCzbiY68aW1dlp+OFiiRmv5wdwCed/eliq3+4Hjx7wp+l9L0nKM2VZymTZ6dXm8rMPdL6ZAHF2JMcdKGY5GOmyhblSWJaCReSNhLwfJkz8ZuOiH3q3q1Bg02gKnC14HFeOgT1NRZYmMEPVE3VwPlUopiln79x7xUELZpDYRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=I0ZgwZsf; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="I0ZgwZsf"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TB5Yan3836658;
	Tue, 29 Sep 2026 11:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/MHvLY
	qRHdrSaqmN1UZSOOc8q7m1DgFHLONog41KX9w=; b=I0ZgwZsfuLyQIs+Zr5ewpM
	li102AfYFpT787bqCpY5Y3jVaFLbHmnPP5V0UFXu1lw4GUsj5WPKoSt6U6MDltMr
	TemeY2NDDoUCXvPJL/2iKhsvT+frsDL01TSMGZk0KbEYr7hc7Um/vZYIqKmDmqOV
	6oUg4omyB6IpA43cnQS/VcwRu3Q59zSyWZVIYiF0OrTgjJrZSuEDqYm63QM1i4D+
	dnF7PD/ekluLSUAu7DGY/McQxRmRK21MIJp7HyzegHAhYUFMI7yuq7dn3Yxw2Ygr
	ujP6QRvmK37xAKTKuxj1IOKpIXyvMHFY+stC9+dfYP2j88ZkA453OahKtzyZOB9Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx3fk6bnp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:31:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAld8c1607817;
	Tue, 29 Sep 2026 11:31:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxsck9fan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:31:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68TBVANZ51315006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 11:31:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ED082004B;
	Tue, 29 Sep 2026 11:31:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A75F120040;
	Tue, 29 Sep 2026 11:31:08 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.88.139])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 11:31:08 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, ritesh.list@gmail.com, tglx@kernel.org,
        Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH v3 0/3] powerpc/irq: Use optimizations for /proc/interrupts
Date: Tue, 29 Sep 2026 17:01:07 +0530
Message-ID: <179066556644.265207.16649177207444437130.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921090153.54745-1-sshegde@linux.ibm.com>
References: <20260921090153.54745-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 0PHMZCOT8wfo-S2szSoeVqscEoTYsEjQ
X-Proofpoint-GUID: ftiXVGGqhcHEeycHNjCpH8P7utOvFlvB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfXy8HydTL/c6j9
 yyCH336/dbQYw6KYy1PCAk8JArcb2XdwEr3FMNtaMARzHqrcNz8fiZ5Z/e6Mnntkn2M0webCPD+
 kpXolA7DnxXQgqvvYWFkyOb+PaV38Tc=
X-Authority-Analysis: v=2.4 cv=Vv62kO2n c=1 sm=1 tr=0 ts=6abba181 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=sauHFsvvZslIwDSQ1pUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfX1nDFlTZeDzlB
 8NUHupzpoPBFTcozXARBGHrCeWG7l4YN7u1BvAN9OnbjaHb610apqOj8VA0lyjVvYKV5RFuwZAM
 Q5fb5U739dXsOXHvEwh4lPNE8I28X1tEokguyX8GIwFnKsY5PKlf8QaRY/QWUJoYUOsQhlxe7E0
 oS0C0Di0g6kDDPC4RA2TPe2tVJjdzib0RBU+Cfsnyl49pk7v5TRxfRUIIHjiaRrW+jO7h6D1dBi
 3bpaDWUvyyfnDyNxo7iesLhMnbDbvV0SB49GYRUo2a2c09iEmLkRfyLcRw4ZYBppNJxc4K/VfFF
 f3rBNu9AMal0C7ZkEd+pid6mpbtxl164Tfe26vKEVDz9AArF3EYCl0r/8b7R3EjvAotdBhTFjX4
 bwO8SRHZR0/TzBjPymp3aDANuLrm8HUgozJNkPY39AlGYr9A42xPY0p0FryFMifaDrAXao0gC2X
 DdZl83zU0QLWdxWsHEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290044

On Mon, 21 Sep 2026 14:31:50 +0530, Shrikanth Hegde wrote:
> v2->v3:
> - Respin based on 7.3-rc1
> 
> v1-> v2:
> - Collected the tags (Thanks to Christophe Leroy)
> - Rename skip to optional and check optional while printing
>   (Christophe Leroy)
> - Decided not to add cpu_has_feature(CPU_FTR_DBELL) while printing.
>   This feature is mostly true for majority of platforms and adding check
>   means more ifdefs in that path. Prinitng "Doorbell interrupts" shouldn't
>   cause any issue when feature if off since all entries would be zero.
>   (sashiko)
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/irq: Move __softirq_pending out of irq_stat
      https://git.kernel.org/powerpc/c/adc7dcd36f46cf5963a093d558e0f1c1d58fb36a
[2/3] powerpc/irq: Make irqstats array based
      https://git.kernel.org/powerpc/c/fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904
[3/3] powerpc/irq: Suppress unlikely interrupt stats by default
      https://git.kernel.org/powerpc/c/2d97c8498a9fca1a876b7a8b4fda024f8e234361

cheers
