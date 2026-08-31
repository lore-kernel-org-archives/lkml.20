Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52FA3264D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159350; cv=none; b=Ci6ZqO183sYtsp4rA7XYQ3P37/rGVpaHe0/DqwuevtJwlz93fS+lCaXxQkyb2FiZHyA0MBhxI2NXl6eFSNdS7nMnLxzKp1roDbn+EhWbI3zWTm2EW6kRXlmcCeTV/sAB70EMnskeeRgMAnTvwUaffa3Q7WZ8Th2mflU2gwGuBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159350; c=relaxed/simple;
	bh=IouLsxErASkEucV1T+iboXeVwylnrubvx4TmmtLLaI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auIE/NhXPrMSgMk3ZG7gp+Nv/gojhDI2KYE18fuGFlbEPJDywhCFVJiFDKsGkEriJo0AIUYKhiv0rySdhcieZDfE/2lVhWgolwz8EbtRYhYy6gnYwOs3XsmXijY4Ad2KVFjkiZC69nWqEW6xWdx5FuicwEPtOChjbzcqpG6qGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VdXZte/s; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VdXZte/s"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52daB1270949;
	Mon, 31 Aug 2026 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EiHiKAyn7LJKmxWji
	FgoiPHmBIysk4eCmw0XKAWVHN0=; b=VdXZte/stb63Vhymk7zoWIY6gGm/f5dE2
	mM8hH0aHose2vDzEu2/QtT6mLTrWDcui5tvNYrRj+/rdeVeqNXEM8V4fr6UdLDd7
	D7aoOpfWu/cvoDZSiBXyCjvSGybsaCECyVYz4yWiO1PDwCFycCIeshAgwZ5V+bLw
	4Tv5fVZOuWvwHW1StzNHwPzdmN3XjbmghoCL1+oXECAoUEYGbpZ+IXbUPWAHh89K
	jndf91+bAKSoUIRtpCHUPzqhQusTJzcRZr0Ud8vb/xyNXWx3uM3d8lPAYPiirTvP
	7GHc+zn+urlnZfOzWC9fpTMrs6hkR1aFBb4W27Sa1Ypm553xlk/yw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq54fmmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V6fJ8n005534;
	Mon, 31 Aug 2026 06:55:23 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcarjvem0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V6tJvU12845564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 06:55:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68A5020040;
	Mon, 31 Aug 2026 06:55:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E39BA20049;
	Mon, 31 Aug 2026 06:55:16 +0000 (GMT)
Received: from Narayanas-MacBook-Pro.bl1-in.ibm.com (unknown [9.123.3.199])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 06:55:16 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, oohall@gmail.com, npiggin@gmail.com,
        tpearson@raptorengineering.com, alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, sourabhjain@linux.ibm.com, harshpb@linux.ibm.com
Subject: [PATCH v4 5/5] powerpc/powernv/eeh: Map VFIO EEH error injection to OPAL
Date: Mon, 31 Aug 2026 12:24:41 +0530
Message-ID: <20260831065441.48654-6-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
References: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX9PuF67nWD7Xw
 WyzfwZ9MjESuBe9Eay1ZZQOt1z8E4vwnSygh+TazcoCuVeTGjKpkWTFvQuy745xBGsczcj44MJ/
 IB+2Jotna+hGNT9Pu/2xFL7gv7DE4B0Li9T66JcLIBs2D/s0uYxa2wk03ojsNM0aB09vV2DUWcK
 oNOLlWY+qeNF5qjSkt9onu0J0Y6yUOqHlF69WPcxUOSK18gRENSsJ1JzEmjMtWeLfe+XlCLnySb
 NdE43DqOROQbxBvLn8Ak/qcZJCeiSaIl6T1+xZmW4IdW/K1THFJ7CFxHoLWGQW0SdTreKFVyk3S
 xSNmjX1AFybiS2izOeUcdT7GrtS5rY68MsFH6sVVulLTsgTg2idGISrU6ddRmmm+0V1AGsYEAMd
 j2bkkAgH/vK8kEJJyJuTZMLc7NfLDCl0nI9Zniwctt+mx5cQdSnyCUmuwCLePwfjmoJ2kg6FyBx
 +FI7mIJRTbm/WIApSHg==
X-Proofpoint-ORIG-GUID: QMZqNXMBZFWrOtVFzI9fYly01aWWplKe
X-Authority-Analysis: v=2.4 cv=CNgamxrD c=1 sm=1 tr=0 ts=6a95255d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=gCSPA1kvSQ6flSZAFA0A:9
X-Proofpoint-GUID: hfeGTLxW7yp_TBn7YzyA4Y8iHsGzNlpN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX0xUXxkBY2nVN
 I9pOB5ZqWuemAyRSGQQqOiIxusMFS5yRDEsIZ9RKtbqS4kPpeSdnyOrz4bUmSxo8QQkql5Rudk6
 e1Wgb2T6u2+YlHWqnzTY/PdYhptH2II=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310054

VFIO EEH error injection exposes a generic userspace ABI.  pSeries maps
the generic EEH error types to RTAS ibm,errinjct encodings, while
PowerNV maps the same generic ABI values to OPAL-specific encodings.

Keep EEH_ERR_TYPE_32 and EEH_ERR_TYPE_64 unchanged.  The mapping is
internal to the platform backend.

Add a switch in pnv_eeh_err_inject() that translates:
  EEH_ERR_TYPE_32 -> OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR
  EEH_ERR_TYPE_64 -> OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64

Return -EINVAL for unsupported error types rather than comparing
directly against OPAL constants.  This decouples the VFIO/EEH
interface from OPAL implementation details, paralleling the approach
used on the pSeries RTAS path.

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 27 +++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index db3370d1673c..53c4c05aaef2 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1167,13 +1167,28 @@ static int pnv_eeh_err_inject(struct eeh_pe *pe, int type, int func,
 {
 	struct pci_controller *hose = pe->phb;
 	struct pnv_phb *phb = hose->private_data;
+	int opal_type;
 	s64 rc;
 
-	if (type != OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR &&
-	    type != OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64) {
-		pr_warn("%s: Invalid error type %d\n",
-			__func__, type);
-		return -ERANGE;
+	/*
+	 * VFIO EEH error injection exposes a generic userspace ABI.
+	 * pSeries maps the generic EEH error types to RTAS ibm,errinjct
+	 * encodings, while PowerNV maps the same generic ABI values to
+	 * OPAL-specific encodings.
+	 *
+	 * Keep EEH_ERR_TYPE_32 and EEH_ERR_TYPE_64 unchanged.  The
+	 * mapping is internal to the platform backend.
+	 */
+	switch (type) {
+	case EEH_ERR_TYPE_32:
+		opal_type = OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR;
+		break;
+	case EEH_ERR_TYPE_64:
+		opal_type = OPAL_ERR_INJECT_TYPE_IOA_BUS_ERR64;
+		break;
+	default:
+		pr_warn("%s: Invalid error type %d\n", __func__, type);
+		return -EINVAL;
 	}
 
 	if (func < OPAL_ERR_INJECT_FUNC_IOA_LD_MEM_ADDR ||
@@ -1192,7 +1207,7 @@ static int pnv_eeh_err_inject(struct eeh_pe *pe, int type, int func,
 
 	/* Do error injection */
 	rc = opal_pci_err_inject(phb->opal_id, pe->addr,
-				 type, func, addr, mask);
+				 opal_type, func, addr, mask);
 	if (rc != OPAL_SUCCESS) {
 		pr_warn("%s: Failure %lld injecting error "
 			"%d-%d to PHB#%x-PE#%x\n",
-- 
2.51.1

