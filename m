Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEC39479C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753038; cv=none; b=M40HknqtuH5pC6vq/zW1Fhkp8d6feaOf8dCEO4gSyjY8DueCxz6dIRPkivVyVz4xi6PssPK40Wldvr9mt8Y2JJpFqSBLw+A/iUGl3RS7opJVNyNAxHWOSe5H0vJv+OpL4bVXAAellmcjKoRaKgkXg0mgZqO5QWFshKfIejhfNTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753038; c=relaxed/simple;
	bh=JlTjhrhh/L6pXgxLIiPcK7e3HkVpZTg7Rb48RH9+Uk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZA7B3AR/Ylnx4KtbFNEb72SmVlTHopp1zSsFJ8d9sq+pBYD60lg85YR1RJlJvnTCUREmKSQ/sdg0/XRWJdsblSRQxEN5Zr320QdRXLQ0dC+9GHOqxT0R0EsBpTN+Z4jVpD1O4uDp70ejZbNDF3c1pp8IV4rdaq30z2QSxDVT3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VdldZWzL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VdldZWzL"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNZPrD1362658;
	Wed, 30 Sep 2026 07:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Rgh/P9E68TQUVhTU5t6bXWPMihAslaaT359SYCVc+
	w4=; b=VdldZWzLa9noT7RNl33bEJJ3r9IlIlp6ofWBRIogm6TJXPuCP9Oh58/a7
	IWF0mCwDTB8NbGXuqculnWxEP4h+U/+60p5pqT+5KSh0kdz1ald0zxKxMWV5+Z+3
	WKL7WJ2wGWzZ2QWJb8a1WsdTDnLyC1kZ1dZpJ7C6W7tbMzw3yD8Nl8WKGcm4tpLM
	26i3F8G7ITKoX9XNI8UTmLhxFHZybDU5+n88Vpu3gAAtZbcM7oeT0tBcZMkR5Si9
	kwP/FeWvA+9d4vQhS0JoFYbSa64O9svpsxaEWbqxIwC9biFtuXaF2kVG1Mt0qYPb
	lzrfNmUBq/CsLU7NxT697PSsvdvlg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5s5bg04-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 07:23:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68U4Z6m02549090;
	Wed, 30 Sep 2026 07:23:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxrrwdfxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 07:23:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68U7NfN930606002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 07:23:41 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0707120040;
	Wed, 30 Sep 2026 07:23:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC31D2004B;
	Wed, 30 Sep 2026 07:23:38 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.21.243])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 07:23:38 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, lkp@intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, tglx@kernel.org,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com
Subject: [PATCH] powerpc/irq: Fix undefined reference to irq_proc_emit_counts on CONFIG_PROC_FS=n
Date: Wed, 30 Sep 2026 12:53:29 +0530
Message-ID: <20260930072329.1110379-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyOCBTYWx0ZWRfX8KXLeI23TItI
 vf8QOutZIiKHbJ4TyeYhb9CZCVwq2lwkcckZFl9pvl+F+BoBL11prAJSJyyjUYIHD+9DpsbXHmV
 SMyYl/BTIjBmMaKJWHQVKbmYP6m+oO4=
X-Authority-Analysis: v=2.4 cv=HJ5WhYtv c=1 sm=1 tr=0 ts=6abcb904 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=ZMhcdLeJ7nKILgKDWkkA:9
X-Proofpoint-GUID: lLCbzJ3FNlQlj1S3o4Z0yMYfdz5pP7iF
X-Proofpoint-ORIG-GUID: fZmjCMdk3c29WUBtg3dAATc3WYWte8VJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyOCBTYWx0ZWRfX1QpDO4aPN4y1
 N/fqj4vtlzqCfHj8xvQxhhOj6h99vHlpupuxVJh1EXGdCSsylETqMs6LroLM0TfTe6Xp4inNuyn
 EfwXNswVdpO/xw8lhWuu359qRXfBeJnZVPlpXr/dh2v9DHjdkud9JkZD9PmO4wf3GnEGkcJqraz
 Lb/PIshVddXNpQjFXLa0weVuJrCbxsYq8ceH8ryJ5rsNQQXUTUnG7WOSmlLroWXgzCv7vd+dhuB
 GCM36ZK52Jm60M0VrTZYwLjDgsag1ckKE+sYj9dy0ifT5jCiajCx3ijXjAANz3E/+66y4sepbHF
 2M5zXniRegGcxhBZk190ps9VrpSr+WdoBuXCKAOn6lT6t5rvCe9aBFjY5i3Dd4cqF7Tz2JugR4s
 hC9AK4lmhsrUQVDa26HJK2QojaKw3hFT2ENCfH+Mo+iMCG7T4Fn/egat/W2SHz9TVgBhFiT66OY
 mu+jPP4dHFa9Ybjp0gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300028

kernel test robot reported a randconfig failure due to below error.

 ld.lld: error: undefined symbol: irq_proc_emit_counts
    referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
                  arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a

This happens when CONFIG_PROC_FS=n, since irq_proc_emit_counts is
defined only when it is true. Though it is a rare config, but it is a
possible one.

Fix it by gating against the config. arch_show_interrupts() is called only by
irq_seq_show() which is compiled when CONFIG_PROC_FS=y. So keeping the config
gating is sufficient.

Fixes: fbb22ceaaf8f ("powerpc/irq: Make irqstats array based")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bce546931a13..9d23ae0fa076 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -122,6 +122,7 @@ void inc_irq_stat_and_enable(enum irq_stat_counts which)
 	set_bit(which, irq_stat_count_show);
 }
 
+#ifdef CONFIG_PROC_FS
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	const struct irq_stat_info *info = irq_stat_info;
@@ -155,6 +156,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 #endif
 	return 0;
 }
+#endif
 
 static int __init irq_init_stats(void)
 {
-- 
2.52.0

