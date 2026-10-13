Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415C4E36C9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889390; cv=none; b=aBfeMb44qGkh6da68d4plnhAJRXl3xlQITDBECM5WVnXi7nnzbKN/f3KZ2yvgX4hxi+fnehoQoeQK0Jpa/pP+jWVsAK7aEiZ4cGKWkZ1ZvORFYx2r/KSs/KULqCGayQ7mSvQJFU5XXhQtVRHKRLu6dwWHOVnF2aY7VtcxARSA20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889390; c=relaxed/simple;
	bh=+kauSweFK+VO3mIQOxcBm5Rk+uWWtkq48VKrLC1uK/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAt4RARTzibpe4o7nLy+RJh1PaZnNvfJFOUzfPTzE2jRkpSByG8pju9uTduIIaA2rLGL0kprE30ISJSIZNn43WH2dFOysUJOoDPMv03SWSOtuSz4DbnDTh6fIASO0fdmB5OKx7tJtjmnhR7tSU6Rk0AuVsetAxdsNWkyRRyv4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pIdhS5Le; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pIdhS5Le"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2F2pq1892967;
	Tue, 13 Oct 2026 11:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ePW6+1+FSho5cUejzpM5q0yH8ySWTA
	VU+pR6KhNzLzA=; b=pIdhS5LeQwrXkHE10FBG6/bpBfxSPTltrV9Yp21o1WfVMY
	zZsruwMknfOh2wzCc8FfR4q627GoRERGCF32Z6j5r2CFiIC7dMslYPRKjNdeOMBh
	I0EcCCOx2r5TJ3gIA31l8BXfT0WnjW7eUsTG1l9V6fQK+EMxF21m3Pv4dbMfbrf5
	5BhrleRnqT4MSUQZUm4KooDCqILRhAikPrSsRURp94HK0+oNsRtjuWjxI3TieHes
	QbqPXw1za605s5pbGwTvAw12WhBjmvqJoreRGKBL8TtKjApYWaWirwyPnAk8J6k5
	2x8NQiLbXEu9NzOMu9YSkYB+WEiVL/SEPA7oetHw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dv3dgkw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 11:03:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Tr502667556;
	Tue, 13 Oct 2026 11:02:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h802vsgdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 11:02:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69DB2rHe29491614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 11:02:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B7F62004B;
	Tue, 13 Oct 2026 11:02:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBD3A20067;
	Tue, 13 Oct 2026 11:02:52 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 13 Oct 2026 11:02:52 +0000 (GMT)
Date: Tue, 13 Oct 2026 13:02:51 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andreas Grapentin <gra@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for ARM on s390 KVM
Message-ID: <20261013110251.715112-A-seiden@linux.ibm.com>
References: <20261013084952.2797958-1-seiden@linux.ibm.com>
 <86y0c20x8i.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0c20x8i.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3poHka5G3VXwyQV7D_KBwqVxXvRduWWG
X-Proofpoint-ORIG-GUID: 3poHka5G3VXwyQV7D_KBwqVxXvRduWWG
X-Authority-Analysis: v=2.4 cv=aqInmiZV c=1 sm=1 tr=0 ts=6ace0fe4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=S0ndCPLvcWoC3UoK6w0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX6MH0tJEgAd1+
 VaTxobcLnDvhKsWcRKmswUp1vMS1c1YoKIML2fSZFlmeV8Hf51ENitK/S1YYtFKY+vnXRWmCVUu
 t2q4/XK1Yi7cHjboafkEiX9T1EZZZ/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1dVQaQeUegFG
 ngHLB6FJunEwAuLOe9dqdbZ+mR3KqRixT4n0RL+ZTICyH1e2QXQkFCo7cRRL2wH2DTJlJZJU1/m
 EGVAIriajkzwOj4SV1kikiisY/0PC3wVs14jho7TDelAODgMLAmSaC5Q3YajdEfcvnk54pMBkKc
 YzwcEppVsOxueVl1YjVSqVflNEZwHzYQoPd7sIuR81QL7ITuDTNnxfarWGyDABQ62mKctvp2Cdh
 M0gJLGDR+GZ9E+oPEfXXmSDCxqf6y3yoEN5wyDspOL/Kcxc5QyxAjy6+iUXab9hInHid9MAKwuR
 H80qJN2Au+EvLRmoTBuXqF4ZPJ+T2DUeDOkzlRvQbFkTkLflcIaOHI7VyOp/Iuzllrn4AwuygGW
 tu7m7uURNqlqdZ2+ryOUuWcbKTkByD7zmnttarXxauLsErEZt19K+bF1PN+Qm3sp0nLDYLF2ZoE
 jBjOV9NB9y9SurOTVvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130042

On Tue, Oct 13, 2026 at 10:24:13AM +0100, Marc Zyngier wrote:
> On Tue, 13 Oct 2026 09:49:52 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > Add a dedicated MAINTAINERS section for KVM ARM64 virtualisation support
> > on s390. Adding only reviewers. arm-on-s390 is primarily maintained by
> > the KVM/s390 maintainers through inheritance.
> > 
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> 
> Thanks for sending this. FWIW:
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
>

Thank you for being a reviewer.

	Steffen
