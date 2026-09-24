Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3F439331
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235494; cv=none; b=paDn18Y03rncmsioEFMq74PQRmtBf01sRFWkWcfRILfphRfszfNnb2S1cfQDh/DIpQpymYauIqlljuiYgZM35I9moyUNTel0zyE5Sv9DUL2hxarWQPkm/PwTn5iYQ/4/LRoJ+pTGuCG4xVkjndmPsKHJL1VI5DlzZbMZ3nT/Ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235494; c=relaxed/simple;
	bh=RTQ0VM2/UqPvCWhF4s63qGXtQV/t/TegBjc7LUI14wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDkXywEXsj3mw52UPtBV94bhvJOufEO2xxvDAMYI4sa6iinIPavrZv4qUKpQTPOLM6ZOoug+aaFKFEy2texvkh1+oYmwSyM80KudsihtaPvHndnhyQTadDP+HpMQxbT+WSmLP45uxpjRbMGj6RBfFQDv2kZWV8EgTHjmAZ1WRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA3sior+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8gWT8s9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA3sior+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8gWT8s9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eEoq1898713
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/RXRnwPgf5Y
	g8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=; b=jA3sior+8hRuvHeZRTnB3RAc9I2
	4TOd7c2N4LQBAYwzlrZ0Bd/lNVCKDT/MDMRzrFoxVKCSQapjRxvRqZBrJMo8/OTV
	glLQxAT8rP6R+UQk9/yEiOjrotSlvKge01suU1eTsPaRcnAI1fXChx6SMjYiAxDw
	gXJ3jFN5WC1X5XAzakAqBij1zjdyvaI0APC/086OaoDC+8RojYjOCCL7RGwyebcM
	ocIjJuGwK5i4lCK5VM3AvEDsYu8/hPnpLmZiHaF6zE4gj6R6kyCgjfqc3C5K/8zJ
	v/D8UWc6/otMkVmfNgmx4flb38Cu3Sn4aQtpGMDqH9wDKmE3cIS442U+QVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64fqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32850005b6bso2296959eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235489; x=1790840289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RXRnwPgf5Yg8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=;
        b=Y8gWT8s9DYkU1EdXCHOQuMQZ4IltmtJxZUqn70m/iJRciR82qtxuUBhi1XMOnFMOlN
         z95tNjSC/Uxm765PZ991dwKf1lOfbC2DpYbBJ/qzXT/L633RVR3b+1ykc4jI8rdQ/vcG
         8isL3ZOBST7fNbpHUCDiRmf4HHqbXrzetq9S4PuTf2jmltTXMHUAbAIf5rLqoS3FKlV2
         8JxTBhf3VANdrKUc8SbJa9A1cJlSk6Frsn8uk1VvE3R8ylKFYvUHosXyz4k3Ww4c9VOb
         pVWyCUFVoCjfquU1gzoRWZJQnc/vl5OR7Vv8QKyvcRhIfpGi+gM6bobCgA3xb3rseEyt
         /5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235489; x=1790840289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RXRnwPgf5Yg8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=;
        b=tVTdJbC2uoDj3aSVXFAfHkKha/jpLi2WCHFHQKML41A5IoZgFMOpblzX6wUyZdowKl
         MnuIZP+G30Twoqw76xVUISlc3iohEbm+VeBFgjmiKJi8NJ52A13UCr5m7uhZzfqllGkH
         KGTt8++lB4Ld3XSxhSwKXVcWU+JbZGDk9bFBVuRuoGNySO+SOo+UHfIe1te3hBSGVtq9
         m0KrlnM8J57zqHDkUDhZWcIAxqo0x3+wvNVrW1Cv9xvazOTRjS3LM1WMlXOBKsb40HFL
         TNkAgfFX+0P1Cv6nQWaED+dAQmJ3TbSvC7z7wZl9Ka+meD5tX0AnUmxQM6TVlg8JSI/v
         ATRg==
X-Forwarded-Encrypted: i=1; AKwUvBy43y5r5qJqHatRDtsHEV7IOZP3Ca93fll+l67SFacoIRfmHq3VPB9kFLAKX25clt1A/LeRfE/AwHoXsh4=@vger.kernel.org
X-Gm-Message-State: AFuF++kWe5p2Fk6pcyIU3D9KkUydXuKIubyApmSAZw6oQm5Tx2/7LkZ8
	xJZmrQXLxYHzAy2MrATcsX/dmnPwsCLcLfr5PGq9dQuoapd1TJ4mi+IHDpnrxOcPM7O43VP2ZR2
	fAwunkthVvj4eMI4CFn8GHiBUh1IEePurJM09hqebR2EW/DqmocSKg/SOMV7m32bifhsFcvKMtW
	o=
X-Gm-Gg: AYBFou3VBi4IYOlw3WVisXMB9YHBOoI5gbxCn4ZfuQZuyS8tTdYLDfTlz9QnpuNwfl5
	gce6bZYZujQ9MDbQUcwI5DOJukmnniyn6bJnhnsfX8AuUtIcsubA4ukB4WGx0wn71oaCZ7encPr
	/WTR35IOrklHxLAftfEKXJOP0opODYwNbJkq0Sy87hzBMxzMStVgX5TXSnO/1//sn2oBiTv687y
	w1qkbmGpr8PL0pTbE518UbJVBDp4qB0r38EO96qkjiXdo0Wjm0mtp4ODqUEG89qZmpN4WvVYc89
	6kmM/YePUwNUxqicCR3e8lSoU0tvgoOaGTDsPdAkaUuRyE2qysydIG0MRjYrbDTbWUCM6yBxsTd
	W6acHpBh8F4XhLKhh4oWw2iACCyTtX9vmkA2FDEEnj98qX92N9GvD7OFXG34EVcMOJU2RBT/PfL
	BQYJ0l4UZuGlUkwQFaSliBjJ6K
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1248789eec.14.1790235488965;
        Thu, 24 Sep 2026 00:38:08 -0700 (PDT)
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1248756eec.14.1790235488231;
        Thu, 24 Sep 2026 00:38:08 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:07 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 7/9] riscv: Introduce HEST SSE notification handlers
Date: Thu, 24 Sep 2026 13:07:12 +0530
Message-ID: <20260924073714.1650588-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dwLwOeo7XA6wP_wIXxTkgdfdc0PvLDUN
X-Proofpoint-ORIG-GUID: dwLwOeo7XA6wP_wIXxTkgdfdc0PvLDUN
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4d362 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=Eu4eB5ymJzOrEwSPfFIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXzMP22e0vFORP
 iWKLCh3LqHLr5xucOgzt4IsRd+DKAPGQg2KnP0FCqRhi/8PhphHlYpzcbQwBEC7L47pWyTi/6FW
 fX5j8qZ8j6YlYbAOkHsfh+zs12BGJeA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX39IFX5oNel5D
 mYAHisSLsyDPB9LhEtPe06JDI5cukFx/Tl+tntDgxzEMitW3mS4n9floQHN7HN9wHBWLB6piKRt
 WuDK02KeMr0W0icNU2LPi6FRFfgIAyynM5rDBsC8hmz8/8hWZqzgldYlzBR0wkQFkDbdxw9PToy
 jMRAcFtXVST8X47kUyYwqe/beIgsgH5sEO0QYZbHCCUPlaRWrk3ufph2qbrBwwtKqPL0IavTKPt
 GP2zX+gMcyjvxjJH+ChDjj9z4nV8UWkvfNxFoaSvr3v5iZrSC5FfaxHJfmmla2m/4SDHKeyINVL
 G1RcsOIFicJkeysJbGyKSAVy7AmpBKnIv2FSO3fzStFhaCTGiQdyq3zushVn6+M8zsnEU+ZA6W1
 VU3l5RfvquZRmUvH20FrVAZOvU2GjQ0zQ9T5B18ldOr6eUH1FConT9xTAxCJOh6CIgTjW+iTfhB
 mtTj5zq2sHzOvwCnUtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

Add config option to enable SSE in APEI. When it is enabled, functions
to register/unregister a ghes entry with SSE are avilable along with
low and high priority event handers. If a SSE notification type is
determined, a ghes common handler to handle an error event is registered.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/acpi/apei/Kconfig |  5 ++
 drivers/acpi/apei/ghes.c  | 99 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 428458c623f0..895a843d0e36 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -46,6 +46,11 @@ config ACPI_APEI_SEA
 	depends on ARM64 && ACPI_APEI_GHES
 	default y
 
+config ACPI_APEI_SSE
+	bool
+	depends on RISCV && RISCV_SBI_SSE && ACPI_APEI_GHES
+	default y
+
 config ACPI_APEI_MEMORY_FAILURE
 	bool "APEI memory error recovering support"
 	depends on ACPI_APEI && MEMORY_FAILURE
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index fe10ab0e02f6..1a6d21f7992b 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -17,6 +17,8 @@
  *   Author: Huang Ying <ying.huang@intel.com>
  */
 
+#include <linux/err.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/arm_sdei.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -100,6 +102,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SBI_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1682,6 +1689,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
 	return sdei_unregister_ghes(ghes);
 }
 
+#if defined(CONFIG_ACPI_APEI_SSE)
+/* SSE Handlers */
+static int __ghes_sse_callback(struct ghes *ghes,
+			       enum fixed_addresses fixmap_idx)
+{
+	if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx)) {
+		irq_work_queue(&ghes_proc_irq_work);
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+/* Low priority */
+static int ghes_sse_lo_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_lo);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_lo);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_LOW_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_lo);
+
+	return err;
+}
+
+/* High priority */
+static int ghes_sse_hi_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_hi);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_hi);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_HIGH_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_hi);
+
+	return err;
+}
+
+static int apei_sse_register_ghes(struct ghes *ghes)
+{
+	return sse_register_ghes(ghes, ghes_sse_lo_callback,
+				 ghes_sse_hi_callback);
+}
+
+static int apei_sse_unregister_ghes(struct ghes *ghes)
+{
+	return sse_unregister_ghes(ghes);
+}
+#else /* CONFIG_ACPI_APEI_SSE */
+static int apei_sse_register_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+static int apei_sse_unregister_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+#endif
+
 static int ghes_probe(struct platform_device *ghes_dev)
 {
 	struct acpi_hest_generic *generic;
@@ -1728,6 +1792,14 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		pr_warn(GHES_PFX "Generic hardware error source: %d notified via local interrupt is not supported!\n",
 			generic->header.source_id);
 		goto err;
+	case ACPI_HEST_NOTIFY_SSE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_SSE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d notified via SSE is not supported\n",
+				generic->header.source_id);
+			rc = -EOPNOTSUPP;
+			goto err;
+		}
+		break;
 	default:
 		pr_warn(FW_WARN GHES_PFX "Unknown notification type: %u for generic hardware error source: %d\n",
 			generic->notify.type, generic->header.source_id);
@@ -1795,6 +1867,17 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		if (rc)
 			goto err;
 		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		rc = apei_sse_register_ghes(ghes);
+		if (rc) {
+			pr_err(GHES_PFX "Failed to register for SSE notification on vector %d\n",
+			       generic->notify.vector);
+			goto err;
+		}
+		pr_err(GHES_PFX "Registered SSE notification on vector %d\n",
+		       generic->notify.vector);
+		break;
 	default:
 		BUG();
 	}
@@ -1824,7 +1907,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1858,16 +1940,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
 		ghes_nmi_remove(ghes);
 		break;
 	case ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED:
-		rc = apei_sdei_unregister_ghes(ghes);
-		if (rc) {
-			/*
-			 * Returning early results in a resource leak, but we're
-			 * only here if stopping the hardware failed.
-			 */
-			dev_err(&ghes_dev->dev, "Failed to unregister ghes (%pe)\n",
-				ERR_PTR(rc));
-			return;
-		}
+		apei_sdei_unregister_ghes(ghes);
+		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		apei_sse_unregister_ghes(ghes);
 		break;
 	default:
 		BUG();
-- 
2.43.0

