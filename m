Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288795;
	b=k+pKr/aTAxSia1eOshmtw6CGCSiqJFnYKu6iS/dTaxMMzrbVV0XrkE0y5XXj8Ave3X0F
	 lQ+D5fW73Xlagn2G4rVtWofybUPVQroSXuNTML4LVql/4sDND/owJ1tVMo7lfxh03w0sU
	 mNgYnW3kqZx8/ot/RHqLuDn0SQk7g9I5c2F9DdA9AhBGQbyQz5kZnM2yjUx8+LTtQX9mh
	 uXTy8v391YDrvV3RXVY/4+94/aYDgPR+4RKBxuHTv+hmoaFMCoRuYKeDvgW+7w/ZCANwT
	 akBTx4vK0nnVuoSydyh5NEfExw+j49drfM3U4EnvXqL8rQGqTCe7nmfyIW4hiEQ9IvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8x57gFet6/+tWb3KFj2DhF//Y8ZmfPHDcI2Qs+r2VFE=;
	b=u/La5AGEPDIWgw9+ObzNFu2FcyucpvUFpydAZP6Hqa/OYhXhcFj+njuxXxq93hn0dpGQ
	 mNSJND1M/dU/uPopUDeJUn15kosSMqn6LCh0JRg61s+mtF6fLAMPv0nADwPaZDU6Ifl8q
	 4LQFNHT7SfO7dVQ1plJfJtGejlfaJfMWfmqRzBNxkLOHaOWHPCsnvgrIjB5O39zG1ENVk
	 TBBD3dumA2k/mqno1Twnr8IsvQxWnh3UoekoT2adMmeTktE+gwMmremOrptZ92mu47RTb
	 bY/LpgqKj92bd+EdWNCkbz6wEeRpjkBVDz/YV1Rjnv+Hg0j5tDLOTESJJq1Y1kyvBog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwbDZu3s;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ACC606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ACC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwbDZu3s
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA51ngX1439462;
	Tue, 10 Nov 2026 05:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8x57gFet6/+tWb3KF
	j2DhF//Y8ZmfPHDcI2Qs+r2VFE=; b=MwbDZu3s9J2cFAWAt8z7fhUH65uUQ6L7s
	777ywdebm9aHAhmeIuD2sU8E1pd5JTqrz907dwPfbbuJS/QwsvDcUGXwc3bWHG4J
	pjb65qrYJI2wLpTTGo+p2YxXcMJqCcDBhwe8ME7K4ksl6+lHcJf8rrrwbTZAHf77
	GZatqfBTaoW61xnhocZyZMRwgJFC42BbXGAbOKxOM84P+0LPq/Frw0f4umTI34/s
	m1zb5rOsv9GjofDqqziRBuIa3tTwL1a2xiXuXJd/QqB78ARzUlJ6LoTM3dga6AHc
	Of4q7+7sFW/ScB2aBx7qDwSMx5ciOmqu55chOc/w3leSKSW9Nsoug==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsumutpcv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:33:01 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4JvT9099324;
	Tue, 10 Nov 2026 05:33:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4htghg50s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:33:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AA5Wvj526673526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2026 05:32:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C2B220043;
	Tue, 10 Nov 2026 05:32:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F6D820040;
	Tue, 10 Nov 2026 05:32:53 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.31.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Nov 2026 05:32:53 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v2 2/3] KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
Date: Tue, 10 Nov 2026 11:02:37 +0530
Message-ID: <20261110053238.3794500-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110053238.3794500-1-sshegde@linux.ibm.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyMCBTYWx0ZWRfX/2snh2rH6eg3
 /GNv8TW/QsuLxVxZOEDMZPz5nR5xJN5aiy7ZI4C9N8J+jASsm9m+Cjk/JSNGCKjlst9YS+DVZhz
 gPzwrkTXWuo1QAHKfyf5h79oCvq9RJU=
X-Authority-Analysis: v=2.4 cv=GISdgeNK c=1 sm=1 tr=0 ts=6af2ac8e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=hyHdCrymTFJ9VBfVSMoA:9
X-Proofpoint-GUID: FgHVbOLvQ-vFJbTOczteiV_DomMrv8zN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyMCBTYWx0ZWRfX+rBVsdm617DR
 lBAWrl64WUFwBX8dbRe+0ZxUuiQRswZFEUd2TXfBZDu9sbo6ZAwqJn3FUzHQzqVoo/OBXwWHvQG
 9E2ET9/qVdbYepQHPYgfFUGVT7R4CyJoiR9otMTtH9BGghR1qGfqjrxEbVxyfVhkng8JFdhmcUh
 lmY5b89TA900CoNX9O1pZu9slufdQI1GMXP10SbmDJTWJl1cQlETJv2Y8Uh0mEmji2XmwrApvCK
 h+efOU0Sfy3FSxPx3z8GuKrw6UAn6Yea/o2JCb/STPUwsx0LrfloQ6iKVk6YhFmik8kgXFiF/u4
 igrM5W4lQ1nhneTALqBrsyNAZlPKSKIsOEKwBdV7nylzKtNXfK5e3cWr0SpFVa6lq85wjdpqpa6
 9b5dw7IdpDD6e5L+GjgRgx98myEA7b0k8+/hJKXklg8Pw+ZdRFKAe9pPLFS9RLtVjpiZKoJgCHH
 JiALmr0efX6KEqVgeBw==
X-Proofpoint-ORIG-GUID: Bq0N-D7jXvQRn0b9NXnCbVLHnLI2XM6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100020

Christian reported that booting preemptible kernel on FSL Cyrus+ board
causes boot hang.

The logs pointed that system was busy in printing below warning.

WARNING: at .enable_kernel_fp+0x30/0x78, CPU#3: qemu-system-ppc/4884
Modules linked in:
CPU: 3 UID: 1000 PID: 4884 Comm: qemu-system-ppc Not tainted 7.3.0-rc1-powerpc64-smp-preempt #1 PREEMPT
NIP [c000000000003338] .enable_kernel_fp+0x30/0x78
LR [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
Call Trace:
[c000000085ca7700] [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
[c000000085ca7780] [c00000000005f2a0] .kvmppc_handle_exit+0x5bc/0x5cc
[c000000085ca7830] [c00000000006204c] .kvmppc_resume_host+0xb8/0x10c

Which is...

void enable_kernel_fp(void)
{
        unsigned long cpumsr;
        WARN_ON(preemptible());

And...

Though irq's are hard disabled after kvmppc_prepare_to_enter, but
kvmppc_fix_ee_before_entry enables the softmask's IRQ state.
That causes the irqs_disabled to return false.
Hence leading to the warnings.

Fix it by re-ordering the code to load the FP and Altivec
before enabling the softmask IRQ state.

Fixes: 3efc7da61f6c ("KVM: PPC: Book3E: Increase FPU laziness")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/33342fbf-eb7b-bde6-2c8c-254fe8bfb993@xenosoft.de/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 13ad4cf5fa71..c35e98d544ec 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1404,10 +1404,13 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		if (s <= 0)
 			r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
 		else {
-			/* interrupts now hard-disabled */
-			kvmppc_fix_ee_before_entry();
+			/*
+			 * Interrupts are still hard disabled and soft enabled
+			 * after loading the FP and Altivec.
+			 */
 			kvmppc_load_guest_fp(vcpu);
 			kvmppc_load_guest_altivec(vcpu);
+			kvmppc_fix_ee_before_entry();
 		}
 	}
 
-- 
2.52.0

