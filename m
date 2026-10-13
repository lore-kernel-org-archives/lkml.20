Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC03E2AD8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884304; cv=none; b=g9rl0mo078YGrfzM/DaKTSTlgDfLo+V8P+I6X2gPD6ye2PFtXZ2j5zeGCj0OBQcVST3punylqs+yJ8KfXiL7dloDvWJn7co0zaCtOqQ7NqSNr16tkHgmbDSPl24rPaJBD7fgKyFc1gYSSD8AYgCLHl7K5pi208wJxZaAHBnR0NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884304; c=relaxed/simple;
	bh=6ctja33KU6o8m9lWQH6dyY4vesjFNMqkqsEiWle1zKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwCuk6lMKwNrpiLtFx9WhLiSu3lb+Y6H1S3KHl1VDeP40fURa24roshRj7z/jc0CBjPrwe0X02MV26srE7FQU6ibz9Pe+/F68gODcGomvtOLp4Zc/xsoL22ff/09jbCxfbh/ePaXW/MX+NFuXzrg4fS4/BjVMGH5yMZwshxXX/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oe6hrSQD; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oe6hrSQD"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2EL241931562;
	Tue, 13 Oct 2026 09:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=6PIsSyiVvWpjbtq24cbI89IiSDOJO0
	o7ELhxBzMA+U0=; b=oe6hrSQDsEuk9RVasy9ZQiSx51L7r9oxb0g/GrUu4yYqDR
	swyAwWy7zWPmLRTsMucQ0dcldhaDsL7f3GjL9oCA5u0BHft+qAZyOWBIXQYU3tuY
	VtrIYTDHSQKGxVhk+Z8NC4HjBfFHPwletDOLWOvJnZ2Ccw+NhgUZqEyHKUUuWBjU
	FKImPIZ2WH50JzRxKqbeMYQK08CriZpBttEqDugVA5x1+4yplReiagcDfB5WgMNx
	vSWkib90vuBXHnLtIDpwdQszo6bTkcCf+EW4T17ENYRWeiR3S2PgZC0U2iNv03l4
	lkvbEY1kbedttGZhmbR83Cy2WOqx629wJax3KFsA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7e1w4snm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 09:38:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8TogO2643669;
	Tue, 13 Oct 2026 09:38:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h80pjs3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 09:38:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69D9cFvO14549248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 09:38:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5118B20043;
	Tue, 13 Oct 2026 09:38:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F6722004B;
	Tue, 13 Oct 2026 09:38:15 +0000 (GMT)
Received: from localhost (unknown [9.111.90.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Oct 2026 09:38:15 +0000 (GMT)
Date: Tue, 13 Oct 2026 11:38:14 +0200
From: Andreas Grapentin <gra@linux.ibm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for ARM on s390 KVM
Message-ID: <as37aJBsl9vmkj5G@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
References: <20261013084952.2797958-1-seiden@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013084952.2797958-1-seiden@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX8+2xYjtNreMQ
 n9aSY1du7NPyNFmkN0w1RrQW+7LbMbe2tT/K8E2/x9XUVrhAlU7+F5UUR4iwW+4qhvwR9leHRo2
 3DQOhT2xkg5r3tHZzANZHyiVtnCHwFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfXwdHwoUwRAGoM
 6hntIiV690I3HVy6NPA24vZqYhUzqWcSzxpFXd/N4aAT7yEJg4FyL/gV4p7ckJ9coA8rBKv6Vbu
 4GttWAEqw0f29hkjSdqzGQ0J35FlyV4evY/em4E/Kh1i4dspb/0i103/t1qGwCcoxEKrgdaqldB
 Kif/gsKUea6eTvD7JaVfHU83LEK/0YJe9wRft2/21owliL778+xvF8dnvFKXyXAadNcDuXi1JpI
 II+V7KH59VjTq+8RHBYVEwq/TyJ2u6GCvl98lAZ4efktHUYnIS4sdgGLbZwI7TnCOtSV/92UzwK
 B0JseAW53734qjuCuLX2JtizOEvptNhbVLmN9TdSn4oDZ7zae/jFXg3M+g1EkP0xVYJSa/VhtcE
 8SKCO0escxqgba+0erJTapyagDFbn5F/q+KF/fZbNoRGmRc0c9PRXLH3ERk+sl6AiLjtqIYQ6Fx
 bLEfpRR/lZY5nK4ZBuQ==
X-Authority-Analysis: v=2.4 cv=E6pYNqdl c=1 sm=1 tr=0 ts=6acdfc0c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=zi1bOuKh8NMgu3qqSxQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: DJ8BJqTpFqUMkeN5U0-MuN5A55Q4CGEw
X-Proofpoint-GUID: DJ8BJqTpFqUMkeN5U0-MuN5A55Q4CGEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On Oct 13 26, Steffen Eiden wrote:
> Add a dedicated MAINTAINERS section for KVM ARM64 virtualisation support
> on s390. Adding only reviewers. arm-on-s390 is primarily maintained by
> the KVM/s390 maintainers through inheritance.
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Acked-by: Andreas Grapentin <gra@linux.ibm.com>

-A
