Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4037A83D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881430; cv=none; b=TRjOBAjW/3+YesqiVOSJBHYx+H0qBvr0TCbAS5OzXsdmQ8S8ruSek6tBBhxWoF58OrdHbX2SftbJaqGcBXiLqfTQ2x3SuBw9h2Z1XUSSxEbYXEHFQmjCXv1cIQCaKnrdeFC9Nm731f5KchA/0JbWx5CTyjKMn39rzprPheAw7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881430; c=relaxed/simple;
	bh=h9VXSC4zzOW3510ehA0JgXObMeFL3zQS/qUS5NFCb/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSHIZ9P+f8u/PpPH1OK83kWBC2Jr+kUWZjJ9Xg9SkyO/FfDCMA0hDz835j6kgcafhrKMNIMzH2xggfufc6bYem5NwZZydse9MbPsszuHYI3l1yPuelATYb/1iQAJB8DqW8wOUuXmXEhm53iOac0+vzCzdV7kbnY77L5xtdsAMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ki8LYVqc; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ki8LYVqc"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2F0F21932812;
	Tue, 13 Oct 2026 08:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Y4bC1nAfXQsN1acXQKe2zW/PfqXFLLP4t/bqSP+w+
	Z8=; b=Ki8LYVqcfanWnGwU/wGc6GzhYhDSgXxWtrg6Dn4k1PdTuMyxemfrzluFg
	9HVmdCDpgaZbi+EHp4vnks4cgWRwjfLgKf8sa/ztlwFz2A0Q7EWoUyPGKbnxW6zs
	5++Yz0g3ReHiqRGwn/NkLbYyqqi0ERimsgmNJAk+ZQjVgBhnFXMGxv01LTj4Dm+Y
	PlhO1kHrUTgg22/JtYDi1aLkFVhDIY0maUW6LVZqf+EhalwDcnUTdzbJH5BBB5w3
	N31vUcWEw/AZKhMCuHWjymonPXMpp+9ey71sTO3UuYX6tpeIXmJ2bzfWRLCfQdVw
	NYj7Ouxmnpn0j9YEBzpoh9FvkD6Ig==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7e1w4krc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 08:50:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ToVs2643669;
	Tue, 13 Oct 2026 08:50:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h80pjrxdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 08:50:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69D8oLma47776080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 08:50:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50DCE2004D;
	Tue, 13 Oct 2026 08:50:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28C0A20043;
	Tue, 13 Oct 2026 08:50:21 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Oct 2026 08:50:21 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Andreas Grapentin <gra@linux.ibm.com>, Marc Zyngier <maz@kernel.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Steffen Eiden <seiden@linux.ibm.com>
Subject: [PATCH] MAINTAINERS: Add entry for ARM on s390 KVM
Date: Tue, 13 Oct 2026 10:49:52 +0200
Message-ID: <20261013084952.2797958-1-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX5Jk85gF+Zoo4
 mbpRy88Gp8Q6gxFIS+y9anic+EtFBBCVFK4B3C2Y6PnuPQ4gPwXjPCfFdOe6CcF+Lmi1GEXT8fG
 N3WG6BFCDsgIt/754HL+HrC/3i5kRsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7b4SxNg52mCT
 U5TGfNc4TTDr/ZSUUHgn2XTzMVKZMnE0lcaD/Vgp6uqMmV943/07x71n2aLlPoHLINLBxhBTTOY
 9T3y83HG0DotPjEj1fMcoLP8FgPguy8HEt9us+pGzTX+KNu2InYjwF3DBx5U8NXeZBF9GyMvIeS
 2SeK6oKILq+rjwpqSj5wXHgSwOMzbgymDkWnLNkbFvuiZhSlJKj2wIdVzbBqdoRuyGQbiCuvM/X
 N3V1xXsE3DAS2Cuu5x6TJKusnkhiKGIv4/rEoinT8wizGsI9qcY7q3cYlL8mY6StqCHfeTbKSqb
 2Td8Gr68uWSQNHkTJp+iGlcmtX6o4js6BgZwslv111dHOQRkrAa8fdKoWeammK3Jt1ZksiJxtPR
 ftv86JA3F1+Iygq2/3bqfLtU9rOU5kYRR6FZnxOeS2cQb6sjXaSF8v7iUfcPyBcjyVdJVkdgx2U
 YnJdDw8lFcxah5gbfaw==
X-Authority-Analysis: v=2.4 cv=E6pYNqdl c=1 sm=1 tr=0 ts=6acdf0d1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=VGXdVZ4ymc50sJVynzgA:9
X-Proofpoint-ORIG-GUID: -aS-xvt69THAN4Q7p3qOG0SulIHxbipA
X-Proofpoint-GUID: -aS-xvt69THAN4Q7p3qOG0SulIHxbipA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

Add a dedicated MAINTAINERS section for KVM ARM64 virtualisation support
on s390. Adding only reviewers. arm-on-s390 is primarily maintained by
the KVM/s390 maintainers through inheritance.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d45ccf863c1..d9d212d06ef2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14385,6 +14385,22 @@ F:	tools/testing/selftests/drivers/s390x/uvdevice/
 F:	tools/testing/selftests/kvm/*/s390/
 F:	tools/testing/selftests/kvm/s390/
 
+KERNEL VIRTUAL MACHINE for arm-on-s390 (KVM/s390)
+R:	Steffen Eiden <seiden@linux.ibm.com>
+R:	Andreas Grapentin <gra@linux.ibm.com>
+R:	Marc Zyngier <maz@kernel.org>
+L:	kvm@vger.kernel.org
+L:	linux-s390@vger.kernel.org
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
+F:	arch/s390/include/arm64/
+F:	arch/s390/include/asm/aef.h
+F:	arch/s390/include/asm/kvm_host_arm64*
+F:	arch/s390/include/asm/sae*
+F:	arch/s390/kernel/aef.c
+F:	arch/s390/kvm/arm64/
+F:	arch/s390/tools/*arm64*
+
 KERNEL VIRTUAL MACHINE FOR X86 (KVM/x86)
 M:	Sean Christopherson <seanjc@google.com>
 M:	Paolo Bonzini <pbonzini@redhat.com>
-- 
2.53.0

