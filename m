Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FD4FC8E0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959633; cv=none; b=CRi7/JTPeRrvh4t14InLlatQWy5tmNmip+2GRYdwq0+QoY1DWctIJaC/0TYItQZOHOGR2y+WzqJFrDmY4VXb1dB230JWDyhLwm4qFXbjhGZRahoD1SbUYsAVqm54bgXMpl2HzXQ8NNi7FOEAXvHILJxJjzyFjQUs3wyD9VdkI/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959633; c=relaxed/simple;
	bh=VCHCGnUf1xE76eB/Tu1PtlgTVfmzYGl9YwFbmeZzVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+4n+/p3DzihSnYMzNocjx9jKHGO6wK5FtCVtE2pg3toz9K9s7PKxtAJgKoilaMuCPnMl+D3aEcLwjKBpMM1Uhyih9TerGYejtL2Fn8dcaHonEFO3o5k5QauvjJbms+GDaygj/rdGdmImUPTHRytB5YHdkLwsimbYirggwZOJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JbMq1qFe; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JbMq1qFe"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FZMA23243751;
	Fri, 2 Oct 2026 16:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Q3YePuRBwA7nfK+r5
	5t03qUaZfwhOUiQ7jUpB3lk28M=; b=JbMq1qFeaFwIqEhJNDFW3Ivrik9e5qxDB
	w5TEdxFrV9yC+mP+w/JRZrxofZ56vv4m9Xny63+h3oPhGv1kF4NeU7Rtb+Ou7EeB
	7IW9epGOzz6spq++3N4pzv56cbHvp+ozVXmk7xJ3NWxJp5deH7VsiMZB+Rdv/pyQ
	gPhQF+1WiDgCsPxCaTd+KXb8GEYxylomk9vAjwMCtcErqDrd+hsreD1UCs4u6uE5
	FeoKkICp9fR0wXgnuB2m8VTs+rIxMF26//dc27TnBztOFPpaanlJRhX9qvO5xep8
	ylGKkmu5FGrhjcx628sN/Tz1GAk7bhtNgmk7gtgHs11bsM/3oRC1g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5qrtbc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:46:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHffR2672049;
	Fri, 2 Oct 2026 16:46:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h1y2dkgsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:46:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 692GkkdO49021256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Oct 2026 16:46:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA76120043;
	Fri,  2 Oct 2026 16:46:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 385B320040;
	Fri,  2 Oct 2026 16:46:42 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.216.180])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Oct 2026 16:46:41 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        ritesh.list@gmail.com, peterz@infradead.org, boqun@kernel.org,
        will@kernel.org, jhladky@redhat.com, paulmck@kernel.org
Subject: [RFC 3/3] powerpc64/Kconfig: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri,  2 Oct 2026 22:16:19 +0530
Message-ID: <20261002164619.1455143-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002164619.1455143-1-sshegde@linux.ibm.com>
References: <20261002164619.1455143-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX7wox3UP2nfKp
 K4dS4xuGtrkquQh5ctiHIx7fRbbSoAk2qPHQAFRCuZoz0mGb8yLTaVTUX0Y0KtEbx+UUkBSXaUC
 ipZg8eKiN87iw6kwDqJgw9/3IMYTsRai4R7XE62Jtt4Xr02nESV9FukSURmDuf/SdFHXaGnazLi
 yTGppKDQ8wno84IdPkPScWHaUx/Up+n0IHyJJYLNkX5nvR7PIrz46MauOpqhqhMXEIdCEVn6ICe
 vJBrp9okXj4vxvQqZpeOuBgY9bAgKy6jVZrlZpjVxJZjvBfX7qwcZBtLNQZXic1AEnZPJ3C98Tz
 BhUlSp9bN+umOCVGGVyhhPGtztQIPSsTnOs7CCBS2wdPtUoaQ9qo7sDUYpq8wgcGsUFMaXzPDeR
 Tm0vZUCremwlqKPE6XIlrKBt5sO5w4xqmpUff/zo/Hajuf7U8G2BplPbVYou713e6Unp1it06W2
 gHScddoQk2OUh+lntuw==
X-Authority-Analysis: v=2.4 cv=SPbXx+vH c=1 sm=1 tr=0 ts=6abfdffb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=xiQKgxPxu2hnmYXuNjUA:9
X-Proofpoint-ORIG-GUID: plB92gha4kximmyTXrMo5pmNuC2fB3SE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX/H6nYZomwEf1
 c56cCdRwXILlcIWGVqsQsh92uOWQQzH49LlETClqaqbTbm9Q0kIa1jaxIPZr6jRwj9SxH9mGtH4
 lyxlKmvm7daK2zlWuK71tBi44eWn+DM=
X-Proofpoint-GUID: PvwQXvnxG5GyDoODfo9vdNwabt--mtlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020066

Now there is separate need resched bit, enable the generic config
of HAS_SEPARATE_PREEMPT_RESCHED_BITS. This would make use of higher bits
of preempt count(29-32bits) for NMI bits.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 143381d267ce..001bb2f3eec1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -215,6 +215,7 @@ config PPC
 	select GENERIC_PCI_IOMAP		if PCI
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT			if PCI
+	select HAS_SEPARATE_PREEMPT_RESCHED_BITS	if PPC64
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
-- 
2.52.0

