Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B747535D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149846; cv=none; b=MpkrzWSp86R1tBcbmeD0N4juuGsqS5/QDMirmrIFXYdpK2g3OXvVIPfw2UD8OhvZOrpUl2lt7PkirieyHoOi7VJR9mZWMQ/U2X8evtONCtHJKMMpU4CgWq1PkSWjvjujqrflIWzDQ3eAA+JNtmK1VSaiA1FQ42ONcobEUySWztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149846; c=relaxed/simple;
	bh=93ufhYOiLuyUD74QPZ2sf8q18rw1bsl/SNae+3jX9rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzqIJ5dMItZH/xSltLF3ksI+YBTtReLcaXMZnHm2H8g61BPLp/NBMS1WnkolIzEg58/KHdU5ivU56E/jvAMnqdIhaADvVb+aUEoNPxhAUo68kaB/Ly1yvZilS8eYlBAdelN7UN9hKreW/XSrbIym36IuVIKWlI9wY8p+BK5yVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBXGqNbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aU+ypoIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBXGqNbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aU+ypoIe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA4VD2403021
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+3
	1i3C02Gg=; b=gBXGqNbz6FgTYmO33eYcO4uwEUf3iDWcuvgw5j8vb2n5pJX39n5
	BXgz59pOw/EXoopI2TeVGfWKDr14b9W1cVI8t4mI3SYmQjd+ahMoJY8fCOp2PRPV
	MOfJbCj2icfA2nW2CVCuav7AyUbCj0lR7kIQivBP+gZWClAHFB1ipMKgpsFbzeTf
	dwARh/ec2NImfrMdjuPBaS4N7od/dNr8ql3wIT61hlsemcgK78Xv4NQbMJvVqHnm
	lUzPMbX1EzlV6/nm2iwZUwrClkIQH8U9Bmke9yvUOlrEFEpK7KMM/r+29QpEyILJ
	eK9Tdmt5KfxbUyum/mNELP24mQzycTHe8sA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m46tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:24:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so874120eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149840; x=1792754640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=;
        b=aU+ypoIeg6l7szg4WYQIANdSemPOWF/Atl6VEI9AbxDGypdWuuaqeQ4N1zFIK0mYkw
         A2pOTMrZn08hKrPqySM8/hERg5+QAcGrB4O47Ayeu8uJXcFuMZTlgYBX/+W3z7pYlt9O
         +zsea2rzANpdf62IDuo9uWSxBW/B+ajKu5yF2PAPS7Be5e9b9F8QGmSCLQh6hqCVofVS
         yu2oUP3YY4xNM93o7MO92IgB0QmCLjNBLBk1ltVOecoQqLlQ7kKRTpv68iw5pNNAY1nk
         bffAOwl+OLhUDeNmsLeT/qc1+CTXsBrnMrAUPD/nB0BReFmH+MTyJETqCgENFVIEDAc2
         KXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149840; x=1792754640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=;
        b=OYcnil3e90iZRK290HpKUBWGXzlHvDEWpOVwSCLou3rHSAseoXkIXEpIUhlOjtUp4s
         8GUDCuSSr5Qi93/QQovLr+yQZ/7+/fiqur6uySv1OePe0/hg53KT1oK3ceNvgl0DUbUR
         a/uBtyfyZCgW2Mcyx4eLL/IUbb+HIwz9U37rOWkFqzJn+wjY3BUQP3gPWstOINu1a1YV
         H7/dfsEIH+4aUVp/3GDNwlZD7RwOoQjbu+kjFFrLHMVg+SZXOuTOFEKpMQSneMdjrYJJ
         EzieE0hNVn9fXJQiOg568VqGwVFXFFDemz59REPRkthssLoMZhu/EhfQP1EP3jW7K1pm
         HS5g==
X-Forwarded-Encrypted: i=1; AKwUvBzGGdg9K5XEipxtbcZU5Pi7V5sNX/btJm81JbvEiEAk643PLU1PR8D0jUDtywHtOkBXuSevBgNaA2cEvaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ga9pcXC0Y+7qUV23iFEZXf1F5JSe1fLbqZ3vSNASI97pkWOV
	fbdSOvCrU9xcYBNqKb6sHlvsh9ORHvkHD2YcORR5MGr7lE/PESUYvlxguYlTya0YE12645QXfYI
	rCYOzrUTIuRunDjfTtxZxtIKXBP6jAKfvnTDytDQN4XjrTal4jEzybfXNXYjh1XJCito=
X-Gm-Gg: AYBFou2yFRGDzN5f64+5M58hKecEpUD53z9QVKbd4qgwTW4S9couRUP2saQ0CYEUnXP
	zpfxG+GCMb/sW8UEgYwejNN50yKzy6iM5wNsiBLAJ8X2NN+ANELonncbc1mpadT1/0ut+R46PZW
	ktMCfh824YA8376Gz71tAWIsAb7/56eFvAKPKvHCEnBCJEOisRjNNN5dsGb8Wq2OQEqtfW7Y+hH
	9ronhLCzTRn6mJnGxzbTd3iYDe2KBKMmI05Q848Tp0hjXmdIbsK5IevNhXAIZL9iXGGQnHo3oiE
	TA3097ZCmXaU4A3AfkK2Kk0qqla/yyNY0I6/RLjHvLk2LOVlaGqQ+aYDCIS6WyBXWVYgzpwffe3
	DLxFFoY9etV+F90EH5f+a7DXTnt2iX2TS
X-Received: by 2002:a05:701b:4504:10b0:182:c472:b123 with SMTP id a92af1059eb24-182c472d135mr2637379c88.1.1792149840260;
        Fri, 16 Oct 2026 04:24:00 -0700 (PDT)
X-Received: by 2002:a05:701b:4504:10b0:182:c472:b123 with SMTP id a92af1059eb24-182c472d135mr2637343c88.1.1792149839634;
        Fri, 16 Oct 2026 04:23:59 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm5190104c88.18.2026.10.16.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:23:59 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ath12k: pci: encode qmi_instance using QRTR NID bit layout
Date: Fri, 16 Oct 2026 16:53:55 +0530
Message-ID: <20261016112355.1108488-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad20951 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1poW-r593qKSufNXtKQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: KvlKKDi7a-YdYRfwNCZjOCSAVNGcb58T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX3t9D5msKfVOH
 K2+oFeX6AzozhO5vapmBvW/IFoscGXP5rfSeFM57F8iUaXPF/NxSsGl0QtyIFw7HyvBtJdxra/F
 iw2gdJvmH+ii4AxKdMuFXVH03WOVgtU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX5V7CPn72BxwO
 305ZLjTnycPbE82m4XOYn4H2H13N9iZBgp9lRWbavuTgreporEIz3Mfl0fexq7sF3v2ptO0h/rH
 2jhMni9PNBmc142vEOmqNu80OkwoPf9IHjbxe8ZgSS/wfVwj57CxxVYEvjzJvP5v/3i0J0WuzWh
 lfAlViVV/CNKAlLPeXU9m3y21tSFx1Ziy35v79A4PzvHC6KXIIq25QUW0Og3+Ghc8gAb/X73Uug
 Znxm2YsL5kD3tiTe4HNZyBChJE8AszUFwV2wDIS5d3YlHvBwSjWKwHXHb3tCABv5vGd0P+mUWj3
 EkVwTThV9WL9dvQCGttENZBiu4yWW2BcWCeRVTjRmwQryGFiYX5FaiIjfPKGhGvXfdc17WlpM3p
 sYIYYXt+bZQE8E65ra7EhiZx8gjPurzR30KzQB6Q5EKGfP3ZrKOY2I6aj4llBpBYsMvkBhjtyow
 vZ2nB956BQidFKnFOcg==
X-Proofpoint-GUID: KvlKKDi7a-YdYRfwNCZjOCSAVNGcb58T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160045

With ATH12K_FW_FEATURE_MULTI_QRTR_ID enabled, firmware derives the WLAN
QRTR node ID as:
  NID = IPC_ROUTER_DEFAULT_PROCESSOR_ID + PCIE_LOCAL_RSV0[15:0]

The host programs qmi_instance into PCIE_LOCAL_RSV0. Using an
incompatible bit placement can overlap node IDs used by other
processors and cause QRTR node registration conflicts.

Encode qmi_instance using the WLAN QRTR NID bit layout:
  bits [9:6]   PCI bus number
  bits [12:10] PCI domain number

The proc_id bits [5:0] are fixed to WLAN (7) in firmware and are not
encoded by the host.

Update QRTR_PCI_* masks to match these bit ranges and remove duplicate
mask definitions.

Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1

Signed-off-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pci.h | 6 ++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 12bbb75570f1..ac4bfd5b247d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -711,9 +711,14 @@ static void ath12k_pci_init_qmi_ce_config(struct ath12k_base *ab)
 	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
 
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID)) {
+		/*
+		 * QRTR NID layout: [12:10] domain, [9:6] bus, [5:0] proc_id.
+		 * proc_id is fixed for WLAN and is not encoded into qmi_instance.
+		 */
 		ab_pci->qmi_instance =
-			u32_encode_bits(pci_domain_nr(bus), DOMAIN_NUMBER_MASK) |
-			u32_encode_bits(bus->number, BUS_NUMBER_MASK);
+			u32_encode_bits(bus->number, QRTR_PCI_BUS_NUMBER_MASK) |
+			u32_encode_bits(pci_domain_nr(bus),
+					QRTR_PCI_DOMAIN_NR_MASK);
 		ab->qmi.service_ins_id += ab_pci->qmi_instance;
 	}
 }
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0e0e2020c6ae..35e8e0fe15cd 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -61,8 +61,6 @@
 
 #define PCIE_LOCAL_REG_QRTR_NODE_ID(ab) \
 	((ab)->hal.regs->qrtr_node_id)
-#define DOMAIN_NUMBER_MASK			GENMASK(7, 4)
-#define BUS_NUMBER_MASK				GENMASK(3, 0)
 
 #define PCI_BAR_WINDOW0_BASE	0x1E00000
 #define PCI_BAR_WINDOW0_END	0x1E7FFFC
@@ -73,8 +71,8 @@
 #define PCI_PARF_END		0x1E0BFFC
 #define PCI_MHIREGLEN_REG	0x1E0E100
 #define PCI_MHI_REGION_END	0x1E0EFFC
-#define QRTR_PCI_DOMAIN_NR_MASK		GENMASK(7, 4)
-#define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
+#define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(9, 6)
+#define QRTR_PCI_DOMAIN_NR_MASK		GENMASK(12, 10)
 
 struct ath12k_msi_user {
 	const char *name;

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.43.0

