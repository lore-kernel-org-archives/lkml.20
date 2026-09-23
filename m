Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE627566C62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188225; cv=none; b=KMKvIjMMjrgyZTHuHzarGJS2l3oXpOJGXdhBAjNTmwM4bWcxEWTVDjZ9XeVr3vFpLSmFu1NrVOtqOcW/vDRf0NOP6Lt46XytO5FbWmQIrc8t6njn7xEtD1Z+j7JRq5kvBdmDXF4mHRx2mJaDFNlvJcPbUKzGjDJ0MiTxMT/gSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188225; c=relaxed/simple;
	bh=C9bSu1Xspx2U/xMpD32VaRhgGHRoZM+b0YWx21+jm1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8+S6uOuVXPLJE5DJwrrMHlcHqMBN4IMv11e4ZhYAlCPrzKJ4MDheAIYGTN+gsg/ARamMq6vJN0MMTv8105Jm4sbyWQfUEi4k+hnmcLbAL7RhN9yHdZ7xYa0vUbAzKaOvhjJ77AC6oasT7wKhn7eD3wdHERIl+vEuA4KbKbV0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mTfiIPu4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mTfiIPu4"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGZTVR2748562;
	Wed, 23 Sep 2026 18:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sdxfwwrHrCSqjhwaY
	IipuPSuQ0vL3R2PP7JOg4oF7SM=; b=mTfiIPu4+HqxVT5deEKYGh0VArJOdjeoG
	ZBzeqwaBMq9mAcGuJ0KFpLnAzoR0OCnqAxFRq+H9i/MM1fXmZal/vYKh75RaVwDp
	nRFT4qtv3PdBVu/FPBzZOphRmSL5WP9MsvbPhgAuzKlmSD+15+q3QoEeI5fcJtjz
	iXf185P+R09XnW6xghHq2xUA9vThEGr6pIqVALc2S0LMnB+W8i3hDZ34LK80iKol
	pk3JNRxhhm3QpdN8nkObNW/eyXnR9aDEdbEfZReHlnr6Rfh+QXDTiAOn5ve3AeCO
	hKRHHFXIZJgWOcE/zERF5IIJbQ6Dfrvct9Bv5BUQTrAQRE90Me3MQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgqmccd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 18:30:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGWsOr621739;
	Wed, 23 Sep 2026 18:30:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu8t56b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 18:30:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68NIU5R945351372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 18:30:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DDF320043;
	Wed, 23 Sep 2026 18:30:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64C4720040;
	Wed, 23 Sep 2026 18:30:00 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com (unknown [9.67.83.254])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Sep 2026 18:30:00 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, nayna@linux.ibm.com, gjoyce@linux.ibm.com,
        ritesh.list@gmail.com, sshegde@linux.ibm.com,
        linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com,
        ssrish@linux.ibm.com
Subject: [PATCH 10/12] pseries/plpks: make narrowing conversions explicit
Date: Wed, 23 Sep 2026 23:58:14 +0530
Message-ID: <20260923182816.151451-11-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923182816.151451-1-ssrish@linux.ibm.com>
References: <20260923182816.151451-1-ssrish@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ab41ab2 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=o6eGJc963QcO2VXH5MgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MiBTYWx0ZWRfXzisjlBCbdw/X
 8GLJLV1HoNsJRH+3q6I4VlqzMw9bwAk3mfds3tLggnZx1WShWIvtbN0deFEc3TZtW2CmawdwCfJ
 +Smu9lYcVjIbGUBX3cLdeBJ2T7KjKiVMgRCC+07nvryb5cJFmpe+bTGCYTtK8prR7HbpM4mneGS
 zDq12pSDSaJuSd1dhr61WBD0YFP2z+5E2gOxmE1BYwYB59i5el6ei7//afEpei3vzmoOmdBThJG
 MKvaxR1Ihp1WfgLRPDWtayOgRkxEA6OBqd894KZ3fAwQR5cNTILcWqOAj6jIPnFqiDk7I7guhE3
 dSf8AYVPal8ltmCRiIf97UUy03Aw86PqF2I0roOUkisK/URtpeY/Nias14l4VYj1AE81fhvL3lE
 6ihNZGj/fHHSxi2YbgpEwdbeD945ub9Mj79gjKTOJA2SaFz+Gc+p+pn5E3ZMiPDn73Z9TBmna6b
 JA4Aw42RIKkc+DVv5MQ==
X-Proofpoint-ORIG-GUID: mwGjclovUukbAl6Sf-RiAoGqRsdNdpIR
X-Proofpoint-GUID: OTf-CWWn2AY9zfclvapt_5aYFLl7QYwL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MiBTYWx0ZWRfX9Wcpr0y0fCn3
 x8vUYn0HmI8tQYM4UETOKYscEjXYzT1FkVtrW6XQeozbFQ2y172SSvkWi0y1WWtO6G+NJn9AArE
 CpBi4jRSX9Mu62JlTzlxPC/H5liZshc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230072

Add explicit casts when assigning values from the hcall return buffers
to narrower fields to make the intended conversions clear.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 896eda3eb65f..eff968fe5ae0 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -576,7 +576,7 @@ static int plpks_confirm_object_flushed(struct label *label,
 				 virt_to_phys(auth), virt_to_phys(label),
 				 label->size);
 
-		status = retbuf[0];
+		status = (u8)retbuf[0];
 		if (rc) {
 			timed_out = false;
 			if (rc == H_NOT_FOUND && status == 1)
@@ -870,13 +870,13 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 	}
 
 	if (!var->data || var->datalen > retbuf[0])
-		var->datalen = retbuf[0];
+		var->datalen = (u16)retbuf[0];
 
 	if (var->data)
 		memcpy(var->data, output, var->datalen);
 
 out_copy_policy:
-	var->policy = retbuf[1];
+	var->policy = (u32)retbuf[1];
 out_free_output:
 	kfree_sensitive(output);
 out_free_label:
-- 
2.52.0

