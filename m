Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F924277026
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404317; cv=none; b=pfhaoTOuX/rA4ltXiRpMYrDL1/4As1YorbWmahyZN+fsaUeHZ4UkeWAh5nQ1GUHV49BFdb3xI2jZ6zPSYpMROhipLAxXCLmaPU19p23rwlEyitEimCo1VWKWvsTL0prLgEpq2g7QFqWXxRRG8jJ1p9SKdmLlztJKXhfK6DuXMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404317; c=relaxed/simple;
	bh=hd8RCZVa3sJyp5oS1s6a2X6trlo0Sot4XI0mNeWMv70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIOEs0LnLs212cH+UltsX02CNl6Wuvo9pRtIkaLLv9xowAXrahHMQuhwtyMbAJUpRysvfThn1CGmnSmT7RmVEpffzRrndulD4myrHtsGcXucd9wdthRtqwMju/JEIUmhML2MJYhz2xWvHVbMHrABOV2Ijol3W5G0o5km1M0PSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=M0fQh84q; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="M0fQh84q"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8iCjn3449306;
	Mon, 19 Oct 2026 10:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wzIOMM
	PuXrXudDQO7UAZ3JyhRlPaCGOoVoSIPbLe65M=; b=M0fQh84qaQwccfzIHWNkKS
	0tY91hMZ+YnU4fv9g7uXlty1CW/ag+h0yJsBXLE89fZ/E9kg1mHJyZWMvgYWtUX9
	Z7g6wQWqCRsLWzbl0BCKBFCtZp94XvzwGZQVDIYlp2wspCx4SjkDaqDUogkjm9gy
	Kw9yfjrUt+YL8hzkmVKMCe3ZSN1r6ZeqCrqWn8+8Hv6L415ZXiv8UoJt+CNvHzZs
	FoZSOiROTPjFrACgaXyUBPm4R7ajNkdt4vV/wF+Dunhg7ipAsJvjK2Gcl8ItEeI7
	v8l/3FuyRh34y4cqLlzbIGvp4/aX9rDAg3aX1sdkIS8oLsrUJaUKkOyc+5loGvUw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hc0h5agtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 10:05:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ytb33891281;
	Mon, 19 Oct 2026 10:05:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hcp1ycwm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 10:05:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69JA56Mj43647330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Oct 2026 10:05:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79FFF20065;
	Mon, 19 Oct 2026 10:05:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 524CA2005A;
	Mon, 19 Oct 2026 10:05:06 +0000 (GMT)
Received: from osiris (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 Oct 2026 10:05:06 +0000 (GMT)
Date: Mon, 19 Oct 2026 12:05:05 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert seven more Perl utilities to
 Python
Message-ID: <20261019100505.3199861A74-hca@linux.ibm.com>
References: <87fqy2afnk.fsf@trenco.lwn.net>
 <20261018231917.74657-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018231917.74657-1-breno3011alves@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX+aV97/Xs3eHB
 jXu091UFhs5dxI1L6Hps8vzbo8pkFEHxJKFfvfqUIez01QkhGlZfn04SRkjpHZZfjDrxFXlabRN
 2KSnqenJWHBVLzb23dFYdzKe04wywn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX7qVP4LINC9Bv
 n2M/U5RGsGpBROQVVxQHpxYRXCL7xEttInq0+HZEDpfITTfiK80G2yPHiBb2etagIxtDAftS8xm
 YqsJJ1wUtZq9YO8tL5JRPvdLod0cuBT2v2ZAffCzACw50AqA5oWARRF/++MJ/r+PCl3weX1tE+x
 Br/P3+Wr/PPeFx1AVFl17TMUshim7Vx/s3T+wlr3ANVUuP9iM+rOV03dfN7KM8pDc/Q0bWUGAX3
 yNvU4ohaFYk8hCOO0aH2kdnrf4HDVTkGVCNhHOfxwS+DzGb2PWPf180k9tThKBHEpiv9T01FYeN
 SDCel87xJCW/sz1mfoX2SoLqAUmRiWfIW8FWLDNckvyEDiY5nSwIXB63WoEN8GUQ0hUSbG6jVEp
 qeV3DXHLg/+PZuYPAercvGPELC4VwAyCFvTqdgGpqIVy4CwlS4tvFOTDqm8acDfs//daeQgEkLl
 i5IQevvWrDF+n2IObSg==
X-Proofpoint-ORIG-GUID: DYsz7-KuMdptwUsNvQAq1AUqnMsxbkEH
X-Proofpoint-GUID: Ph2-isNKs3OSuOM3TWjvp2dd4y8iNqT4
X-Authority-Analysis: v=2.4 cv=KujYSmWN c=1 sm=1 tr=0 ts=6ad5eb55 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=ETaVDiiQOobJf2lY2hwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

On Sun, Oct 18, 2026 at 08:19:16PM -0300, Breno Rodrigues Alves wrote:
> > So an important part of describing any change is *why* you are doing it.
> > Why are you doing all of these conversions?  Some of these scripts have
> > not seen changes in decades and are likely unused; why do we want to
> > mess with them now?
> 
> You're right, and thanks for pushing on this — I should have framed
> the *why* in the cover letter.
...
> Broader motivation for the kept four: kernel CI and tooling
> already assume Python for kernel-doc, spdxcheck, bpf_doc.
> Keeping Perl alive solely for a handful of scripts forces two
> runtimes for the same class of tools. Converting the active ones
> closes that gap; converting dead ones does not.

That is an odd reason - if I'm not wrong then you have zero upstream
commits, and now are proposing fundamental changes to tools maintained
and used by others? I guess this is 100% LLM work(?).
