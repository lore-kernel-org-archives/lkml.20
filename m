Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761452;
	b=PCuT6e+eChsofcD0d+BoyKy+ATWWxNmzWMb6hJ1iPkmAm8w8OKP/qwFtBuGVJicNoBhZ
	 XVvf/0nz2rHbfpcuahOwhQoLhcPP1eiDCYI2W4teQMkTxf25UPyapgFaPUjxTQxJsiBcX
	 8i4Mthp3IzyeAEmTG9xA74YwqOfQNPDr5gxtvmZ5FDDdkKIn0ajJ6vg263SWjXbGrhZuT
	 7WEzW8R0027FC/aI5QVzhFbBJvSGTc6iLQt56mKaArwhqU/K+HpvdlzZiiTOFcPKh9AZ7
	 u2T+ZIGAkMh43xVrYNHpvu7/totP2oM3snX937N6uZjMIYPIy92gJddn1YOoqfPHW2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7yHN+A4JpL1uCcGycKWHemWV36QfRWBTboGaNK5F+KU=;
	b=GcIyFRJDsP7//HmaulB9eBzEL2Jhl3REsM3Q4GApmsG6jSQxP4U30b37zjpXq16Y+6Yf
	 9A36HXZ9pV8nx7XEDNwHllAFy6tQy3pPztnuc4Mx6orovAaTje3l+WtuNdwIjdayNeYzy
	 H3Ota6kmrSWPcbmJuW2oVVZ5tTO3AB+x3HF3SkObCU+1i7hdduJ7Awa7NoSIedhnGNEnw
	 iJE1bdt0vyT11hHT0fdziNdtoTAy+fliAzzO+Il3gtKD0J2rAnsUzz8SCVDjuvLgGWpzR
	 uQXz9LXxcYWk2VCPtntWCcglCcEt/RnjUU/4wcN5YpZe6FtiF8iBhPwDCdt6JRiDcIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XalZqdSX;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BBE606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BBE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XalZqdSX
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAEE931466161;
	Fri, 23 Oct 2026 13:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7yHN+A4JpL1uCcGyc
	KWHemWV36QfRWBTboGaNK5F+KU=; b=XalZqdSX/P+V2UHsRwS3W9qUhUU4BEESg
	criSUfxWqvK4hvtdj+2aXkFxERVKiOf/z1alqWrP7WYgyPO0TIEB+USo1rTi4x5R
	arZICizFw6al8NpFPQs0WhFG6L0Cki7Zx3VHTKUgIWDVbPUNUVGyXk1s2kxikH0Q
	ETZkG80rvLfso/2i3s7eqxun24pVX4exQKiM7e3NURfJ4MsyUINeZULtSdJndxZl
	Vi38pCdFzMPuZp8aMCQbOUofiqrNMjo2+7xDFd4dJEShwMLYJ7wuFbU7NKggmmBM
	YPE7nU+n+hOCEqNEaC+UeEbNT2c/VP7ocN9dRAy0rUKBV//bc+LAA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw58mnhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAK2Zj2010219;
	Fri, 23 Oct 2026 13:17:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hfgck5kh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69NDH3tc49283438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Oct 2026 13:17:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C4692004B;
	Fri, 23 Oct 2026 13:17:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CA0620043;
	Fri, 23 Oct 2026 13:16:59 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.68])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Oct 2026 13:16:58 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v2 2/4] powerpc/topology: Update mc/pkg flags based on llc_override
Date: Fri, 23 Oct 2026 18:46:44 +0530
Message-ID: <20261023131646.2907938-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023131646.2907938-1-sshegde@linux.ibm.com>
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfXxERY1tWKn0+v
 8sd6tDzPHQM2gpclGU5+sTzAJSPpc3uI/CrSI+Az02WKajeqclp9tQDswGfytR1BnfSQHAVrmW6
 JLNiS7tZT+yQWvOgK76f+/BghKpSI+A=
X-Proofpoint-GUID: 5y6n7_Heup1D1YasWgijgFrxl038pkBa
X-Proofpoint-ORIG-GUID: JUoYXZoMBvrwcjJCs89X4RoLEkRPRirk
X-Authority-Analysis: v=2.4 cv=UOBIjyfy c=1 sm=1 tr=0 ts=6adb5e54 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=T72vRSsYNOkmKreWw50A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfX5yrfH+qiyz2/
 bNhRnpouui85tt313cpXuj2u5W/JsPeT20imOOBpU9/wUAK7nSpDjM+T35wC2U9f6KNwIWOJOxd
 sxg9S/XfC2YJlVOAOjXJqd7wJ8kAeB5I/sRibsQ4+tE0FFAuBnKkPRgtONMR/CVU/GSvUvAMWlZ
 RSJj+Sr7TM13W+KHZU1bIsTqqIfgrjESh+BuCfRCdq4gMuitTIrxYcFIF+kGHUf3qtG8J8BxlrN
 WVybsuAu40BaEGK985apuMS7W8ZeC7Xro+oAMhuMKSrirzTPsbb3ju8hKhibHIm2qbgCGJiA/9E
 TK+JbNTZ2TZ72jl/aKSckhW1xFd4XBZBDQhq0qQCQcVoHqUf/dw+Swn01Ut03/oXuNi3rCxdpjZ
 oZB4+suahTgz43IrAeTNS3+2TxLmv/PcoyV0vvwKlCkV6eamv6l2aQnSX7tOTlFY9atSA32ooYk
 IkgT7om7IOU5g6uHj2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230051

Update the flags passed for building the scheduler topology based on
llc_override.

SD_SHARE_LLC is used to determine the highest domain where the LLC is.
Also when set at a particular domain, all the child domains are expected
to have it set as well.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 41 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6b1201ea3572..ca1821dedc98 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1007,6 +1007,12 @@ static int powerpc_smt_flags(void)
  */
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);
 
+static int llc_override;
+enum llc_override_values {
+	LLC_OVERRIDE_MC		= 1,
+	LLC_OVERRIDE_PKG	= 2,
+};
+
 /*
  * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
  * This topology makes it *much* cheaper to migrate tasks between adjacent cores
@@ -1021,12 +1027,30 @@ static int powerpc_shared_cache_flags(void)
 	return SD_SHARE_LLC;
 }
 
-static int powerpc_shared_proc_flags(void)
+static int powerpc_mc_flags(void)
 {
+	int flags = 0;
+
 	if (static_branch_unlikely(&splpar_asym_pack))
-		return SD_ASYM_PACKING;
+		flags |= SD_ASYM_PACKING;
 
-	return 0;
+	if (READ_ONCE(llc_override) >= LLC_OVERRIDE_MC)
+		flags |= SD_SHARE_LLC;
+
+	return flags;
+}
+
+static int powerpc_pkg_flags(void)
+{
+	int flags = 0;
+
+	if (static_branch_unlikely(&splpar_asym_pack))
+		flags |= SD_ASYM_PACKING;
+
+	if (READ_ONCE(llc_override) >= LLC_OVERRIDE_PKG)
+		flags |= SD_SHARE_LLC;
+
+	return flags;
 }
 
 /*
@@ -1059,13 +1083,6 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
-enum llc_override_values {
-	LLC_OVERRIDE_MC		= 1,
-	LLC_OVERRIDE_PKG	= 2,
-};
-
-static int llc_override;
-
 static int __init set_llc_override(char *str)
 {
 	if (!strcasecmp(str, "mc") && has_coregroup_support())
@@ -1759,10 +1776,10 @@ static void __init build_sched_topology(void)
 
 	if (has_coregroup_support()) {
 		powerpc_topology[i++] =
-			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
+			SDTL_INIT(tl_mc_mask, powerpc_mc_flags, MC);
 	}
 
-	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
+	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_pkg_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
-- 
2.52.0

