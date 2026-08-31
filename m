Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2563B1ED0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159343; cv=none; b=Yp10UpSG2fiWh5sqpdTSyJ9kYjEQLueS7SUTCsHgW5IsjIHkFifIiPssyNB2/KeL13+MZgUjSy+z1c5tGv9+KnduOK7ZNLayUffJjs7RD0oU7+SIHgsx6smuIGZeBop22r1KAlu8owEfe9H0wsBmp+OWO4QwljuTw/bTHc+eswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159343; c=relaxed/simple;
	bh=t3XEOB/i3XX6WDxofy02MrViiy4u1deRoPu0fBrRcQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0jv/URP62ZMdWceD6xc5NtukQ01Z+qk/n56USv8RCyL0hGeCb9grteUubKwCseuweXNKptyZ58YSjyqs+fLmtW95zQJH1Rzv6Yiw4tk13BCMDvHF+KRc4rWIC+gd139CGsmZzVGDP5h6AWNaxd0XrB+oh0xyd69YaYkWlfPoHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bbdfRTrN; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bbdfRTrN"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V53LKu1331002;
	Mon, 31 Aug 2026 06:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1biYuNB+247134J9M
	ccVkBJnZDhYfE3WPGpXRdeyXHk=; b=bbdfRTrNDhR1YvyBZzwlZWtTiftT8zkCw
	RshBD61aFVoHEfCM0OLpc7mB5/6R/dmR6L7Akx8OQBQdFppjMUK7A6vmi4oCO9IL
	LKrJtqloCcnPE+3x5b7zVKwSfo7em62aUer061J7qNrbXFFob8r6WYjSdHIUaefd
	7fakPh7+58bGswYsIx/CZRWZ4pzDE1YY2LrM9roqml+qpZER3s3wIPPwRBNOzwAr
	va/tkkjuxx3FRWkT8XhsrJqkfGG09UtVzwDh31Ax6FJfPX0Cx5rCV9w8503DEQFH
	0gFelJt0nlk/T2mjoGqOv+IjCPM+a8cHlow1Ek+idlaveMp1EXQ/A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2syg0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V6fGDX030960;
	Mon, 31 Aug 2026 06:55:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gccexv70v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V6tDQO51249464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 06:55:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C32F920049;
	Mon, 31 Aug 2026 06:55:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46EC820040;
	Mon, 31 Aug 2026 06:55:11 +0000 (GMT)
Received: from Narayanas-MacBook-Pro.bl1-in.ibm.com (unknown [9.123.3.199])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 06:55:11 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, oohall@gmail.com, npiggin@gmail.com,
        tpearson@raptorengineering.com, alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, sourabhjain@linux.ibm.com, harshpb@linux.ibm.com
Subject: [PATCH v4 3/5] powerpc/pseries/eeh: Add RTAS error validation helpers
Date: Mon, 31 Aug 2026 12:24:39 +0530
Message-ID: <20260831065441.48654-4-nnmlinux@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a952556 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=J9QjAIgEsDROcibzJgwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX0Mn7yTeoKhUX
 ZzOOHyMW7IF6hQv7W5/ASqrEqChYJKdnJ2GqxKc0EjTBjtryThcxPvI8xUGbXpSNQLSkypcwvdB
 QopavvTlMbfoCAhaECvnDmf2qZBpakM=
X-Proofpoint-ORIG-GUID: CM4p_HDVywxP-z_M5iKBu-ogZJGRa9oz
X-Proofpoint-GUID: kJCrDPyyAyZehoHcduAnUNPRw2Nix2qU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfXwDLIGZVy1J+q
 DG2AVU1ncxKeXDJCPWslzsFf1ZkZwFWZtkIXkdwR861Bt/qRvDgTEAyEBYKtRkcFMdyQH4nxvPB
 L28nwGJPqFUgkyy6aPFYblbPFoAEnnFR3laT6lpReXFaoLW/4giB5pDLL083vtoxno+ViTpxx6V
 aHPxmbvenhL1ArIresfWDrI6LUGAZeAxRWcGU4f47mGa3tp9r6mHtRgcxNCG+XX4oQsfwiZAeyW
 BQizpmdWljAud2UBWr1wKZtMGtmDnxOA2aKBhhcTkT8lyJ7WFanpyODyb45jbgsCbTMbRoCn0fw
 h4mrakCqfU+QsXqeSuwJFT2WQOlILAsOPtiak5uEOl4VunxLYYgKqZ83+JVuDSawxbiWtZqMANY
 n/BbWRr9z6orB+uJVRoecw+lJz6/SD7EHvq4+0bWHr15z8lDPBXn1VQHwBT2SUz5Yb25c8/TIaB
 tj7eBXM6NDbHy+f7uGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310054

Add pseries-specific infrastructure for RTAS-based EEH error injection.

Define pr_fmt unconditionally at the top of eeh_pseries.c so all
pr_*() calls carry the "EEH: " prefix:

  #define pr_fmt(fmt) "EEH: " fmt

Define RTAS firmware error-type encodings as file-local constants.
Only the two IOA bus-error types are supported; other PAPR encodings
are not reachable through the generic EEH_ERR_TYPE_* UAPI:

  RTAS_ERR_TYPE_IOA_BUS_ERROR     0x07
  RTAS_ERR_TYPE_IOA_BUS_ERROR_64  0x0f

Add RTAS_ERRINJCT_BUF_SIZE for the ibm,errinjct work buffer size.

Add pseries_eeh_type_to_rtas() to translate the two generic EEH error
types (EEH_ERR_TYPE_32, EEH_ERR_TYPE_64) into the corresponding RTAS
ibm,errinjct encodings.

Add validate_addr_mask_in_pe() to verify that a caller-provided address
falls within a BAR of some device in the PE.  RTAS IOA bus-error
injection requires a PCI/IOA bus address; validate_addr_mask_in_pe()
accepts only PCI bus addresses.  VFIO userspace resource addresses are
normalized to PCI bus addresses in vfio_iommu_spapr_tce.c before
reaching this backend; no resource-address fallback is added here.
Use pcibios_resource_to_bus() to convert each BAR resource to PCI bus
address space before validating the address.  Returns -EINVAL (Linux
errno) rather than a raw RTAS status.

Add validate_errinjct_args() as a top-level validation wrapper that
checks the PE pointer, maps the generic type, and validates the function
range.  Address/mask validation against BARs is done in the buffer
preparation step.

Add prepare_errinjct_buffer() which:
  - guards against NULL buf/pe/pe->phb
  - zeroes the buffer unconditionally with memset()
  - checks 32-bit truncation for the IOA_BUS_ERROR case
  - calls validate_addr_mask_in_pe() for address validation
  - supports only the IOA bus-error types (unreachable non-IOA
    RTAS cases removed)
The caller provides an exclusive per-call RTAS work-area buffer.
Firmware session serialization is left to the caller.

pseries_eeh_err_inject() retains the existing MMIO injection body
unchanged in this patch.  It is replaced by the full RTAS session
implementation in the next patch.  This keeps the patch bisectable:
each commit builds and functions correctly independently.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512101130.EYUo0oZx-lkp@intel.com/
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 215 +++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b12ef382fec7..fafe0004e738 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -12,6 +12,8 @@
  * Copyright Linas Vepstas 2005, 2006
  */
 
+#define pr_fmt(fmt) "EEH: " fmt
+
 #include <linux/atomic.h>
 #include <linux/delay.h>
 #include <linux/export.h>
@@ -786,6 +788,219 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 }
 #endif
 
+/*
+ * RTAS firmware error-type encodings (PAPR).  These are pseries-private;
+ * user-space sees only the generic EEH_ERR_TYPE_* values from eeh.h.
+ * Only IOA bus-error types are supported; other PAPR encodings are not
+ * reachable through the generic EEH_ERR_TYPE_* UAPI.
+ */
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR		0x07
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR_64		0x0f
+
+/* Size of the ibm,errinjct work buffer as defined by PAPR */
+#define RTAS_ERRINJCT_BUF_SIZE			SZ_1K
+
+/**
+ * pseries_eeh_type_to_rtas - Map generic EEH error type to RTAS encoding
+ * @type: generic EEH error type (EEH_ERR_TYPE_32, EEH_ERR_TYPE_64)
+ *
+ * Translates the generic VFIO/EEH error type passed from userspace into
+ * the RTAS-specific ibm,errinjct error type encoding defined by PAPR.
+ *
+ * Return: RTAS error type on success, -EINVAL for unknown types.
+ */
+static int pseries_eeh_type_to_rtas(int type)
+{
+	switch (type) {
+	case EEH_ERR_TYPE_32:
+		return RTAS_ERR_TYPE_IOA_BUS_ERROR;
+	case EEH_ERR_TYPE_64:
+		return RTAS_ERR_TYPE_IOA_BUS_ERROR_64;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * validate_addr_mask_in_pe - Validate addr against PCI bus BAR addresses in PE
+ * @pe:   EEH PE containing one or more PCI devices
+ * @addr: PCI bus address to validate
+ * @mask: address mask (passed to firmware unchanged)
+ *
+ * RTAS IOA bus-error injection uses PCI bus addresses.  Linux PCI resources
+ * are CPU/resource addresses and may differ on pseries due to PHB window
+ * translation.  Convert each BAR resource to PCI bus address space before
+ * validating @addr.
+ *
+ * Zero addr and mask are accepted without BAR lookup (no-address injection).
+ *
+ * Return: 0 if valid, -EINVAL on invalid input.
+ */
+static int validate_addr_mask_in_pe(struct eeh_pe *pe, unsigned long addr,
+				    unsigned long mask)
+{
+	struct pci_bus_region region;
+	struct eeh_dev *edev, *tmp;
+	struct pci_dev *pdev;
+	struct resource *res;
+	resource_size_t bus_start;
+	resource_size_t bus_len;
+	int bar;
+
+	if (!addr && !mask)
+		return 0;
+
+	if (!pe)
+		return -EINVAL;
+
+	/*
+	 * RTAS IOA bus-error injection uses PCI bus addresses. Linux PCI
+	 * resources are CPU/resource addresses and may differ on pseries due
+	 * to PHB window translation. Convert each BAR resource to PCI bus
+	 * address space before validating @addr.
+	 */
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
+			bus_start = region.start;
+			bus_len = resource_size(res);
+
+			if ((resource_size_t)addr >= bus_start &&
+			    ((resource_size_t)addr - bus_start) < bus_len) {
+				pr_debug("addr=0x%lx mask=0x%lx validated in PCI bus BAR[%d] of %s: bus range 0x%llx-0x%llx\n",
+					 addr, mask, bar, pci_name(pdev),
+					 (unsigned long long)region.start,
+					 (unsigned long long)region.end);
+				return 0;
+			}
+		}
+	}
+
+	pr_err("addr=0x%lx mask=0x%lx not within any PCI bus BAR of any device in PE\n",
+	       addr, mask);
+	return -EINVAL;
+}
+
+/**
+ * validate_errinjct_args - Top-level validation for RTAS error injection arguments
+ * @pe:   EEH PE for the target device
+ * @type: generic EEH error type
+ * @func: error function selector
+ * @addr: address argument (type-dependent, may be zero)
+ * @mask: mask argument (type-dependent, may be zero)
+ *
+ * Validates all parameters before opening an RTAS injection session.
+ * Returns Linux errno values; does not return raw RTAS status codes.
+ *
+ * Return: 0 if all parameters are valid, negative errno otherwise.
+ */
+static int validate_errinjct_args(struct eeh_pe *pe, int type, int func,
+				  unsigned long addr, unsigned long mask)
+{
+	if (!pe || !pe->phb)
+		return -EINVAL;
+
+	if (pseries_eeh_type_to_rtas(type) < 0)
+		return -EINVAL;
+
+	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * prepare_errinjct_buffer() - Build ibm,errinjct work buffer
+ * @buf: RTAS error-injection work buffer
+ * @pe: EEH PE associated with the injection target
+ * @rtas_type: RTAS firmware error-injection type
+ * @func: Error function selector
+ * @addr: Target PCI bus address
+ * @mask: Address mask passed to firmware
+ *
+ * Zeroes @buf and populates it according to the PAPR layout for the
+ * selected IOA bus-error injection type.
+ *
+ * The caller provides an exclusive per-call RTAS work-area buffer.
+ * Firmware session serialization is handled by pseries_eeh_err_inject().
+ *
+ * Return: 0 on success or a negative errno on invalid input.
+ */
+static int prepare_errinjct_buffer(void *buf, struct eeh_pe *pe,
+				   int rtas_type, int func,
+				   unsigned long addr, unsigned long mask)
+{
+	__be64 *buf64 = (__be64 *)buf;
+	__be32 *buf32 = (__be32 *)buf;
+	int rc;
+
+	if (!buf || !pe || !pe->phb)
+		return -EINVAL;
+
+	memset(buf, 0, RTAS_ERRINJCT_BUF_SIZE);
+
+	switch (rtas_type) {
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR:
+		if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
+			return -EINVAL;
+
+		if (upper_32_bits(addr) || upper_32_bits(mask)) {
+			pr_err("32-bit IOA injection cannot encode addr=%#lx mask=%#lx\n",
+			       addr, mask);
+			return -EINVAL;
+		}
+
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
+
+		buf32[0] = cpu_to_be32((u32)addr);
+		buf32[1] = cpu_to_be32((u32)mask);
+		buf32[2] = cpu_to_be32(pe->addr);
+		buf32[3] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[4] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[5] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR_64:
+		if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
+			return -EINVAL;
+
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
+
+		buf64[0] = cpu_to_be64(addr);
+		buf64[1] = cpu_to_be64(mask);
+		buf32[4] = cpu_to_be32(pe->addr);
+		buf32[5] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[6] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[7] = cpu_to_be32(func);
+		break;
+
+	default:
+		pr_err("unsupported RTAS error injection type 0x%x\n", rtas_type);
+		return -EINVAL;
+	}
+
+	pr_debug("errinjct buffer ready: rtas_type=0x%x func=%d addr=0x%lx mask=0x%lx\n",
+		 rtas_type, func, addr, mask);
+	return 0;
+}
+
 /**
  * pseries_eeh_err_inject - Inject specified error to the indicated PE
  * @pe: the indicated PE
-- 
2.51.1

