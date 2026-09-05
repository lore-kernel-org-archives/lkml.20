Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB8265620
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571645; cv=none; b=O7p5hfvTbu9koqn+mJqPDkeBzn9cfnrJgrTfHBicpjopIdDU1Jv6Eg+K1WYn+1x6RmNhnwoK64VHNh0crrWKV/Sa2wEuKdXi6Sbgs8zWMotLKy2NxJVQUaX7kVPCJumDuAFlO8OZiaELzX1OmQnmp1kFCb7oynut3KR6HZo2qxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571645; c=relaxed/simple;
	bh=I0yZ1aK3kZ1NnSS2cQYBuTUjSj3ZqBl2Ng+TIsoYG5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxwrRfT3+gzwYVu+bvQ8szvTgzi7o/RgPUU4qCGV1kGf8jnUF3cjv8BIAz9lL1Dd34Fhl3ADAOjlDYkmjofuytFlowQXnyDK8HPHCNrjrJZd9YdJWdhQPT6liEpynajdO+rWmpt/OSjF77/fpZP7VVdZ+eCQuj6f6O0xqjorSv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YC7vltUv; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YC7vltUv"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68511enD2147132;
	Sat, 5 Sep 2026 01:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=RQeG4t6RgDgfjDxKYj9HDrRTVI3xstNuvVQdnS4It
	BA=; b=YC7vltUvidQ8sjEYUFXItOhPy+05q4yqlWoBOt6/yLNytXmBYoiUZrj2K
	BDgjD1rFcUC4yaymH0wj/CVdv7To6QtgRF+xud7y3BY8QPQaM3KO/1PulsNKDieg
	AVtp/NM0w8RR5eBVpyHAhODCxCdtPRftyKLbIayt2TnGRoRBnqRtT1LTZpMhJ9AK
	r2XKvvOy82YLxyAYE4TQc/gqVyz6OIVhnmRqc4xAQws622APfLUiXAT33eJc+Hvo
	EUzDsL/K1EgxBjlFM3OJa11gmr/1rF9FzUefT3/GDdcRNl5K+7CvZWuP8wlD2gph
	DBxMbck2L284xIaNCOOisKd4ovTOg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnuedhnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 01:27:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6851QZlI016404;
	Sat, 5 Sep 2026 01:27:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcceyqx8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 01:27:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6851RBiS43188710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 5 Sep 2026 01:27:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEA2420043;
	Sat,  5 Sep 2026 01:27:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFAAF20040;
	Sat,  5 Sep 2026 01:27:08 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.88.25])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  5 Sep 2026 01:27:08 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "scripts/faddr2line: Combine three readelf calls into one"
Date: Sat,  5 Sep 2026 06:54:49 +0530
Message-ID: <20260905012449.3872882-2-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lVbDn-yUaWWnVLwlLryQkg8KISfcmFbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNiBTYWx0ZWRfX46LOESWLIoeg
 HOK2XonStFS8oiAEbDaJBKooJxwH3s70KCiz1QcJF8ge9tsgSePRIW/tB9g2BDSHPIBt29qxmTJ
 gruCbJFtmiDY9m+g4dJZEbX7nH9WtpGEqbgd1TIJRVwU3cEax6QhvIGrvCfL3UzVPUMlbmvUsTk
 pv+8HF1w5XkCALiZkS52TbHKd+EAhiNuCiC9HeihSZATqjLMZsoaPqLrrFq0apGgpjmmpGDSDX9
 qP29Ns2VrqmnHykVZmm8fcQoxKDp1de/DEmqXKL1+ooeh5olkZvomhp6CpmAs7qx2m655OnP61K
 kuWBRsdCDsyPOUdmZBPZNDy5kVDxdmN2clsQEE4/bXFkO2++qRrff9/XDyqzpKXrfhka9WgNUO6
 lcbGQbuVHKX40aSFfF+n7sKqqHE0sTtDSy8BEyyT2Ifqb9sLUcA14l1eKjhsvN8rj1CVQMMuEbv
 2B/FCzW5mjZGJjFQUGw==
X-Proofpoint-ORIG-GUID: evY0fGSfewimcj2WHFjXIgl-ej3vtSpi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNiBTYWx0ZWRfX+NXvA0f5AfJR
 KagdOJslyTzMgtxs+nLZD3xiDz33czjkh7Cr2Gxeh9//U3+VU6Iw9KdCQOyfk7qJs5mTUatwiG/
 rCG/2Io/Vp3IldXih2BD2djXE63BdMk=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a9b6ff4 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=oZuti8gFUO8STRSf8oIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050006

This reverts commit b8d9d9496c1e ("scripts/faddr2line: Combine three
readelf calls into one")

scripts/faddr2line stopped working on PowerPc systems with this commit.

Output  of scripts/faddr2line on latest kernel sources
$ scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
$
Output of scripts/faddr2line with revert
$ scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
need_active_balance+0x1d4/0x21c:
imbalanced_active_balance at kernel/sched/fair.c:12047
(inlined by) need_active_balance at kernel/sched/fair.c:12061
$

readelf on Powerpc when passed with --file-header --section-headers
--symbol --wide option doesnt show the line
 "There are 62 section headers, starting at offset 0x16f1a850:"

Hence faddr2line parsing gets broken.

It could be a bug in Powerpc readelf that this line doesnt get printed.
However since its breaking with existing readelf, its better to be
reverted.

With the revert, we end up calling readelf three times but this should
still be fine since calling faddr2line is a debug tool.

Fixes: b8d9d9496c1e ("scripts/faddr2line: Combine three readelf calls into one")
Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 scripts/faddr2line | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/scripts/faddr2line b/scripts/faddr2line
index 622875396bcf..bf2098beefbe 100755
--- a/scripts/faddr2line
+++ b/scripts/faddr2line
@@ -111,19 +111,10 @@ find_dir_prefix() {
 
 run_readelf() {
 	local objfile=$1
-	local tmpfile
-	tmpfile=$(mktemp)
 
-	${READELF} --file-header --section-headers --symbols --wide "$objfile" > "$tmpfile"
-
-	# This assumes that readelf first prints the file header, then the section headers, then the symbols.
-	# Note: It seems that GNU readelf does not prefix section headers with the "There are X section headers"
-	# line when multiple options are given, so let's also match with the "Section Headers:" line.
-	ELF_FILEHEADER=$(sed -n '/There are [0-9]* section headers, starting at offset\|Section Headers:/q;p' "$tmpfile")
-	ELF_SECHEADERS=$(sed -n '/There are [0-9]* section headers, starting at offset\|Section Headers:/,$p' "$tmpfile" | sed -n '/Symbol table .* contains [0-9]* entries:/q;p')
-	ELF_SYMS=$(sed -n '/Symbol table .* contains [0-9]* entries:/,$p' "$tmpfile")
-
-	rm -f -- "$tmpfile"
+	ELF_FILEHEADER=$(${READELF} --file-header $objfile)
+	ELF_SECHEADERS=$(${READELF} --section-headers --wide $objfile)
+	ELF_SYMS=$(${READELF} --symbols --wide $objfile)
 }
 
 check_vmlinux() {
-- 
2.52.0

