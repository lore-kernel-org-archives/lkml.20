Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0C3A900B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934768; cv=none; b=Nkn1RKtQUKfmwE+RkRaIuCDGjgdBJAIJ8lhFKqV6Ec5rAuYgUimEJw4V8ozDoXo3i/ovIMazSvfB2tIpI3US7CXREa3qB8NRfrIYFpoV5PENWLcVN8E7eHGaAn+iHB37mAJHgHx9jc8OnisfFuC1mayxdrqqhXR9rdP+Zbf2lwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934768; c=relaxed/simple;
	bh=7vu8HAbYbs4O1WXxL18j6rgAYnBuDGl8VRzCZblvn+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XF20ZkZo4kHtIkPqHgHgE6lyx7vKKFAXPJX/UFYb0pT1XPgGQRIBfhBSF3M8R7lFsIYfmAG+NZevvIyfE94EjNlJQ2rj/yT3UXeHAybJbUA7Q3j7ewe74zPEeEydMEnqQz+GMlt1ldot3Br6miJ1EwTxmu0+jtpaafyoPNwoZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=J/7u3liw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="J/7u3liw"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1STJ2271946;
	Wed, 9 Sep 2026 06:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aetJS6
	kL2F2J92CPFETCFlhtUvGFQLN4pUA7GL9w0Ac=; b=J/7u3liwHgi8GwK5AqUbFU
	Dghw7hpE7jAOC8KRqvwtYT1jp+sQ28OWq51a6w4i7sSyDI49kWaQrLkS8VNRSu8u
	55Y1cm4pdlJNqdVPAbGXNeZKLSJm7LiMwjB89VG2PFWuHnWV0J3WmHyfCzKSxtWB
	CrrAWQslOgRnGj6Z3JA3JT35a7fz494wNn+UurFQX+rE8IyTLpvMTXZAuGyp9vw1
	XHLhboPKgzfN/QSnC8DyTY8HbyeEgYHd4YknBgMe/e/+UzPo2doZMSGTx/DhGPqt
	hp8jQZyEtCjaQMYLymDnmF+EaVwonZpS7rYI2rV5km3ma2gPYysIxrZa6XtvIjtQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbf442cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BFmu030577;
	Wed, 9 Sep 2026 06:19:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggwsw8r14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896J0gI41484634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:19:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EE5920043;
	Wed,  9 Sep 2026 06:19:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD19B2004B;
	Wed,  9 Sep 2026 06:18:55 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:18:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
Date: Wed,  9 Sep 2026 11:48:54 +0530
Message-ID: <178893459270.174069.13645573174007360611.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260809162403.18142-2-thorsten.blum@linux.dev>
References: <20260809162403.18142-2-thorsten.blum@linux.dev>
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
X-Proofpoint-ORIG-GUID: xJrfY1veIWE5WrJgp8r8Nl-zfwjmabNU
X-Proofpoint-GUID: lYpoe14h-MDC528E_DMn998unAibAPGP
X-Authority-Analysis: v=2.4 cv=DbEnbPtW c=1 sm=1 tr=0 ts=6aa0fa5b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=dmzOmzs3okPgUVi07eEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX9F9/3aKlOR3t
 cyFcdSNuMLiUeba6JJzwSz/6k3OJ2QMjLkoif5MzLm/5hUF8fOHVzAIT6PaBxSf055FVDlsRJBk
 cmqYBVi/pvUFf1J39CST3EaSndYJnKs3t81zYjgs1n2Al2XWfcbC7Aojr58GQAX9geH0XWpXWBZ
 3fOALHufyTql7sQinoQ1Pb37K7QWhKWKMv4tbWyF10NNd8Ldy0twA5Dk38FMGR/8R6Z9ZwREJ7G
 ErRbRAUiVKOuh+C8u0Qr3kxlm/xySk12kD1ANGtATzzob0TDSwrpEltltZsov6h3+F6U9SqSrIN
 NEH0IP6BLwdMZyKzUWTA+D4XHHK6OlwHWT8qw9lllqSZEGYV7hrqZSyHVMub2jD3WRboJKGEusP
 W2cyO+HHIoBNUam41msK+n4njTo9DB1E3CCzqNKvpz/bKpbn+IesX2OZsLJoV7wSDcfv7uuOMSE
 /pJp5LiRBIb1TJDpWow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX7e+7aQtdrZye
 sI76/smKLITOWdupRit6MshEiA+F5t3TKxYW4Qn4+1OuS+JZubsdcwZ+0TE1XF+A9u4ogHEinhp
 vl7okfSiENd6pslqXCLOiYOFU+MWglo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Sun, 09 Aug 2026 18:24:01 +0200, Thorsten Blum wrote:
> add_usable_mem() adds usable memory ranges for the kdump kernel.
> 
> The ranges are inclusive, but the partial overlap check uses exclusive
> comparisons. This skips ranges with base == loc_end or end == loc_base.
> Use inclusive comparisons instead.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
      https://git.kernel.org/powerpc/c/c6755be4838d6ccd641effbcdc3d917b82631ff9

cheers
