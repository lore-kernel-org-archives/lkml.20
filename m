Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A13A48E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817511; cv=none; b=r0Hb79rchnz/fLiUy8qJr7fs8rz1+RI5AZs0EyQBWQEL2BUa8Vb7f/I6EbBju3ZFFOdqhsm4OWYuq0rtf4wXAzF1OGNdDigP692QixHgvGxqasQF0lNjIl7SKQIuY2xjWG4jml+erBy5s8mReUoMnTaZq7gB5HKcALg6xo7Ebr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817511; c=relaxed/simple;
	bh=zg1pOSwigHhzcN1fnrBWV2QFlxvrhYs+GY8q2w3nDCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nk9kZcN/hwIgbopo5RX51svAaz3hN7y1PPalwW82LLYN7nFLTGzugsUUF78bqMitYOm5s/klAWnq61ssOFbQTLUtb9qyaOVdrs/vdA17XR1/7T2xB9F0KeHoc4V9lDL6WRfqU+0zua5UrrJXcwpJGmj0TdBjBy7R5fklaUY8hz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FVRRyuXM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FVRRyuXM"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6Vmks332949;
	Thu, 27 Aug 2026 07:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LJQkdcF63Q3tiF8CCpykkGa48nkoo2ADZy7ROCFbU
	sw=; b=FVRRyuXMj9vaRc6bqtNt1U08jkAvp/sn8eGF37SX0H8lFMjCjtsa/GhI7
	XXRbtJ47Kzf78zEIkQ+nKMucBR8nAiqeHQzdzmLqC1uV2oztsLu9f/nXa2zj+GQm
	pKOlnW0A5KFdZudrSfG1qWlM7Xq4axPX9Zd6fRNJBiE/Jw/rIJ85P6dM3tf4oWrd
	IVLKEWEzs1W0bSOYee9e2QiydRIY7EbrS91G0/VJbrsrlX2OBD6ZN+mve7izD6xI
	TwZtzvKN+WM1VdPIvgWFEgCls13qEfBnaaKS7bFNp1cYWCAa6oQwBxWLxyD4dxPL
	IMZ5YCaq31IRMR7erXNvE0oSNHPHg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g73er3xdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 07:58:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67R7uFZq003431;
	Thu, 27 Aug 2026 07:58:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3qf2wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 07:58:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67R7wCYR42271230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2026 07:58:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F59B2004F;
	Thu, 27 Aug 2026 07:58:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83CDB2004D;
	Thu, 27 Aug 2026 07:58:10 +0000 (GMT)
Received: from shivang.bl1-in.ibm.com (unknown [9.123.12.247])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Aug 2026 07:58:10 +0000 (GMT)
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sourabhjain@linux.ibm.com, adityag@linux.ibm.com, adri.vero.dev@gmail.com,
        anushree.mathur@linux.vnet.ibm.com, chleroy@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        shivangu@linux.ibm.com
Subject: [PATCH v3] ppc/fadump: collect dump if the collected size is lesser than reserved
Date: Thu, 27 Aug 2026 13:28:03 +0530
Message-ID: <20260827075803.2240934-1-shivangu@linux.ibm.com>
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
X-Proofpoint-GUID: Vfq0fkjs6j0-jJg3nsdei0jC0yOxwwo2
X-Proofpoint-ORIG-GUID: WOekWxwgd-N1CUmMDxgHQ3qkeq9otFKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfXx+nzpzjIKgFW
 myE7KpKKj28vQQsbvoDZCD4lb1V1zK5/HWHBA7rw2E8FCeLCM33L1uI3kTaLZTuvCwEFnsd9OXJ
 DVnJJM5j2oNbDm3Bw7BmYaxcJJLshAzfO+REBcmbWS8GY1xXAF+7diGpor6kwq0Q3xqwMDUHz6Z
 XOMPffjo4HS0tVmecWpUYCJ2m6LsbaHQSCnSUD72PR6jBhiKEmgwPN6IefsX1gO94p9/6khBlRh
 NnxOLIN2+4RYCXDWiRkOn8MURGVgznugXdaToVLmwQgG4AaO6OmDRb5xCiYZ2wa61AppYLjx4d4
 8dG1+6FhF1pTZ3ONF5bvnpQiSgbwJ1kvi5OHHtCDcFlXhdatdxbZLB4QIZ7ZVu9Zp42hHFjNxZB
 jy0thVs+nPefSvZIyIEfiX+mIQoquiFpHNJCIjR7pdT7u4aQTKBJakvH5xeLG4gxjEWVT0Ut6Il
 3nG1EndoiecHFZK6lGA==
X-Authority-Analysis: v=2.4 cv=QsRuG1yd c=1 sm=1 tr=0 ts=6a8fee19 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=3RTAq5kX-fAwh9RnVlgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfX3l5lbyxMS4qA
 Hw+2YuKn3u+37UAac5g8/wk9MCcMZ4MxNAJeVbjIz8h/wCN80U1b6e5kN+mcVI1VJWVNFLDF5B8
 955j8qF2pBOdHAyhX+v/jwQxSbd8aMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270061

During Fadump in Qemu VM, when maxcpus value is set to more than current
cpus, following failure is observed.

    [    0.045806] [      T1] rtas fadump: Dump taken by platform is
        incomplete (0)

This is because the CPU_STATE_DATA is allocated for maxcpus, while the
data is only filled for current cpus. As per current implementation
of Fadump, dumped_bytes and source_len for a region have to match,
Which is failing for qemu's case, Even tough the dumped bytes are
reported correctly for only the current cpus. After this /proc/vmcore
generatition also fails.

Allowing dumped_bytes to be lesser than or equal to allocated length, for
CPU_STATE_DATA Fadump region.

Closes: https://lore.kernel.org/all/5e66daf4-3f55-4044-94a5-4f50bb040849@linux.ibm.com/T/#u
Reported-by: Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>
Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/rtas-fadump.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 3bb4ac2ab6cc..a446c586a648 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -459,6 +459,8 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 	/* Check if the dump data is valid. */
 	for (int i = 0; i < be16_to_cpu(fdm_active->header.dump_num_sections); i++) {
 		int type = be16_to_cpu(fdm_active->rgn[i].source_data_type);
+		uint64_t bytes_dumped = be64_to_cpu(fdm_active->rgn[i].bytes_dumped);
+		uint64_t source_len = be64_to_cpu(fdm_active->rgn[i].source_len);
 		int rc = 0;

 		switch (type) {
@@ -469,10 +471,21 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 				pr_err("Dump taken by platform is not valid (%d)\n", i);
 				rc = -EINVAL;
 			}
-			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len) {
+
+			/*
+			 * Make sure that dump is collected for entire region.
+			 * CPU_STATE_DATA region is allowed to dump less than allocated space.
+			 */
+			if (bytes_dumped == source_len ||
+				(type == RTAS_FADUMP_CPU_STATE_DATA && bytes_dumped <= source_len)) {
+
 				pr_err("Dump taken by platform is incomplete (%d)\n", i);
+				pr_debug("type -> %d, bytes_dumped -> %llx, source_len -> %llx\n",
+					 type, bytes_dumped, source_len);
 				rc = -EINVAL;
 			}
+
+
 			if (rc) {
 				pr_warn("Region type: %u src addr: 0x%llx dest addr: 0x%llx\n",
 					be16_to_cpu(fdm_active->rgn[i].source_data_type),
@@ -482,7 +495,7 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 			}
 			break;
 		case RTAS_FADUMP_PARAM_AREA:
-			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len ||
+			if (bytes_dumped != source_len ||
 			    fdm_active->rgn[i].error_flags != 0) {
 				pr_warn("Failed to process additional parameters! Proceeding anyway..\n");
 				fadump_conf->param_area = 0;
--
2.54.0

