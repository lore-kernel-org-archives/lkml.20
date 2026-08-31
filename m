Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B273B2FD9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159347; cv=none; b=E7UZc5+B8N8T9Hf+RcmhTCoX55xCqQkRncTkFJM3d0KEHmRkD4OHUzytjN8pJmf+kmXN+nk/Pz3ilc3n7zp0tJYQAMErU8SKcuCFuhH1ht3F1ElwNIb9/6pMPRBDZ5NB0LBOu4Phrgzjhyglc14SJqugSHZ5oW7uwqQoI+XqIqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159347; c=relaxed/simple;
	bh=mLCXnFCSGKhUIN+7UcPInRbRyibTvKStM5JXf801G8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOxocx9Ob0X5iFum0WoBsYH2ZG7gPcc9SxoXifGwba11HjnN5z5P/9ZmQgnDg7K1JXs77Fp874iuZNpUvclv7CvTaasYElct7w9H59CAFG7Gp0jXRuwWbglzh3iIKoq+LbSIL1M40b0jVRh3x3EXAHl41Mj9xXuhikQQrSEN3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=W4RleQ0F; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="W4RleQ0F"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52oJN1271114;
	Mon, 31 Aug 2026 06:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=iF7VzE/vxFN1A6yQI
	v/l9Zo36eb0NrOPGogP8s9ai0E=; b=W4RleQ0Ff15UzMDaSaXyBRWKRsQSIvvCh
	xRsV4msGcxTESiFZf5zlPaN10KL7v0KnPuzLcm2hMdvKha3HkBizDAkHxexAF3YC
	X9lKWRm9fllHWDD43yxlewnc3A/zjlUIgz4Mbv1/za6PiOWGkkznxzghPx8tMH4X
	Z+FSU4HqyTO3BUjZBQUFNb1k6aqlFLo9pm470R0h6HwGG4PGNkzy4CFixOxlL81T
	1cJ7bHoXzhoWLHgfV1Lzv1OyEgBLtd+TiMU5oMXC6BTKHob9D34N/PZcbVZBDfL4
	HKdwwIccL03WgSkrb0wyXTZhztYN0W0RQPCPYF6xY2Us5DilAPjIA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq54fmm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V6fFSM002309;
	Mon, 31 Aug 2026 06:55:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcbyg48jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V6tBfp38076682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 06:55:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBFC520049;
	Mon, 31 Aug 2026 06:55:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73C7720040;
	Mon, 31 Aug 2026 06:55:08 +0000 (GMT)
Received: from Narayanas-MacBook-Pro.bl1-in.ibm.com (unknown [9.123.3.199])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 06:55:08 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, oohall@gmail.com, npiggin@gmail.com,
        tpearson@raptorengineering.com, alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, sourabhjain@linux.ibm.com, harshpb@linux.ibm.com
Subject: [PATCH v4 2/5] vfio/spapr_tce: Normalize EEH IOA error injection addresses
Date: Mon, 31 Aug 2026 12:24:38 +0530
Message-ID: <20260831065441.48654-3-nnmlinux@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX1dWym3FjYXcN
 yd/V4QOvDVYZiZS7XtHjceEYt7kL0zbR8J/HpfsZsNC+wYxFAWHxFyatdidKqjt3jORm8tKnxcb
 HgXpgw4QAK+iT3SpypuDUQhrUBZRDr4KSbimTOrS/jAFqzSrkXDLAAZNW/EuhQoHZMHh6DuQhy0
 ePmIeBAP7xznSStXaRbpKuwY5UdxSPqJZJH6XI7voZiFSdwdLI7gvp5XNjcN7bavnqGT8ziVTfG
 opqQ+/BPrA94a3jGQB8/AzLS+D3DnSLghWbtjGBSKNDVQjeZbHy9IKMDHZmrSy4HFVvw8gvTM02
 B6VxWEvuVtBGkTqjJTk9bH2kNooQy4dR3S+G9QKwRSaHgeCweXS3eJZ2KfZ0KRhbNp1rfqcx3uE
 dLry1sGpC1NHphrYa9EVCt/epYsFL9+pkrgcADjH7CaTMr3XTf5IaXno2tb0Fy7Z6rbumv+JMHg
 AGFDzaxDPxn8sVH0Gkw==
X-Proofpoint-ORIG-GUID: 6K7Nfir4wmezzNTvGdIUsstqFHtJww91
X-Authority-Analysis: v=2.4 cv=CNgamxrD c=1 sm=1 tr=0 ts=6a952554 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=VWgmkn45OfsDYgLYJ5kA:9
X-Proofpoint-GUID: PUhvqDVSQTxIs-1dnEYHGj8z7-KGmAtu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX5/7xHm+CpBfQ
 v2vA9279bZtdZesmyXjz5atArm9fSIHCjMTaSmAYx1dio+6sI3rFCSwVUMQgGFhUc8qv1yc4i3z
 VYbPVHZRPfE6CK4juglgDZn/si5+HOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310054

VFIO_EEH_PE_INJECT_ERR receives a target address from userspace.  For
userspace such as QEMU, this address may be derived from the host Linux
BAR resource.  The platform EEH backends, however, expect the PCI/IOA
bus address used by firmware error-injection interfaces.

Normalize IOA/MMIO error-injection addresses in the sPAPR VFIO EEH
ioctl path before dispatching to eeh_pe_inject_err().  If the supplied
address is already a PCI bus BAR address it is left unchanged.  If it is
a Linux resource address, translate it to the corresponding PCI bus
address using the BAR-relative offset.

Keep the helper local to VFIO so the address semantics of other
in-kernel EEH callers are unchanged.  This provides common handling for
both pseries and PowerNV backends.

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 drivers/vfio/vfio_iommu_spapr_tce.c | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 1c0eec228cc6..8a6cc856d7da 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -774,6 +774,85 @@ static long tce_iommu_create_default_window(struct tce_container *container)
 	return ret;
 }
 
+static bool vfio_spapr_eeh_err_needs_addr_normalize(unsigned int type)
+{
+	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
+		return false;
+
+	return true;
+}
+
+static int vfio_spapr_eeh_normalize_addr(struct eeh_pe *pe,
+					 unsigned long addr,
+					 unsigned long *normalized)
+{
+	struct pci_bus_region region;
+	struct eeh_dev *edev, *tmp;
+	struct pci_dev *pdev;
+	struct resource *res;
+	resource_size_t pci_start, pci_len;
+	resource_size_t res_start, res_len;
+	resource_size_t offset;
+	int bar;
+
+	if (!pe || !normalized)
+		return -EINVAL;
+
+	if (!addr) {
+		*normalized = addr;
+		return 0;
+	}
+
+	eeh_pe_for_each_dev(pe, edev, tmp) {
+		pdev = eeh_dev_to_pci_dev(edev);
+		if (!pdev)
+			continue;
+
+		for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+			res = &pdev->resource[bar];
+
+			if (!resource_size(res))
+				continue;
+
+			if (!(res->flags & (IORESOURCE_MEM | IORESOURCE_IO)))
+				continue;
+
+			pcibios_resource_to_bus(pdev->bus, &region, res);
+
+			pci_start = region.start;
+			pci_len = resource_size(res);
+
+			/*
+			 * Case 1: userspace already supplied PCI/IOA
+			 * bus address.
+			 */
+			if ((resource_size_t)addr >= pci_start &&
+			    ((resource_size_t)addr - pci_start) < pci_len) {
+				*normalized = addr;
+				return 0;
+			}
+
+			/*
+			 * Case 2: userspace supplied Linux resource/CPU
+			 * address Convert it back to PCI/IOA bus address
+			 * before calling the platform EEH backend.
+			 */
+			res_start = res->start;
+			res_len = resource_size(res);
+
+			if ((resource_size_t)addr >= res_start &&
+			    ((resource_size_t)addr - res_start) < res_len) {
+				offset = (resource_size_t)addr - res_start;
+				*normalized = region.start + offset;
+
+				return 0;
+			}
+		}
+	}
+
+	return -EINVAL;
+}
+
 static long vfio_spapr_ioctl_eeh_pe_op(struct iommu_group *group,
 				       unsigned long arg)
 {
@@ -818,6 +897,17 @@ static long vfio_spapr_ioctl_eeh_pe_op(struct iommu_group *group,
 		if (copy_from_user(&op, (void __user *)arg, minsz))
 			return -EFAULT;
 
+		if (vfio_spapr_eeh_err_needs_addr_normalize(op.err.type)) {
+			unsigned long normalized;
+			long ret;
+
+			ret = vfio_spapr_eeh_normalize_addr(pe, op.err.addr, &normalized);
+			if (ret)
+				return ret;
+
+			op.err.addr = normalized;
+		}
+
 		return eeh_pe_inject_err(pe, op.err.type, op.err.func,
 					 op.err.addr, op.err.mask);
 	default:
-- 
2.51.1

