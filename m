Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7DC486BB4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942681; cv=none; b=TXken27bKwteLmAcuczP0TkwhcE0S2QlJkSN6zJ+q13HvOOqCOj3etE+s7Xq0z9JxYTzBg1CvkL1iRxAnxeAirnNbTq+QCby6dzEwCrtmb/L1FdYgScEWhz+lm4MG2XhSossFFXZqM0YQV5zue6gMkj8+QGXBQPkuDQEagtA1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942681; c=relaxed/simple;
	bh=hQuxuGPuydC2bmY1M/UVMGdQ/Fkdug6f6K4DSitqR0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOe5st+eZ1K8DbeYq+jTvyi8RGagKC5lF9jWZUOIiNhW98LqY7d7uuPeJ4b8P9Lg75zMFagT1yWqFJjDwkUcBnLNGknYWXoULZMIjleruQ0Lrjp3/Zuwjb5op1vlsQOt+rP5i43ZB8A7Nwg8LVtvAa/GyH4wGZwwVuTLwIY49Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOBUqgy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiJJUz0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOBUqgy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiJJUz0o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692A4p001622797
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam
	3kxEB2+c=; b=VOBUqgy2eVhBiT+IXSvdeRLPIwldCaGKsPlnUHXvMz1HuIUqFFo
	yBtUCAUgF2Qb5xKOUZt8S+S9X5sNNhwskUueqIWn2OzSlV4aVXguzSlRkinHfKEI
	6dhAeR2ckxfHW/WPDA4+RuBS5NJPPOFZ7boHjazGt7mscyBs9U3NwkOV3Ow2qscS
	3mqBJiHuBUh1sBjeWyhxOb5xuR5xBbzlCGOM5y+4ggpGzSowQObW5sR5fsG5akei
	Z+hr6U+jaZuDdy/JEAWBbnDQdQxxs43gd/j3i5B4NcijIMYggU3VaHxehzYH5ZO1
	7MRD+CiR+5i2UkYQO1HtohEx/XdjudvATBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj009sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:04:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d49d8dee1so3230244eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790942678; x=1791547478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam3kxEB2+c=;
        b=AiJJUz0oufSEMFMRThcmaqZbG+mRqTCE5z04j8XFXNJJBwCvqzmWajdrshPB60Hmrr
         nLzkF0aDr084dQckfNcQiPC1pGrlaU83T0ZL7QC631Wk1sFwpQNoepffa1aWITLbQJ5O
         /cZcdCsHHATCCi+oRUXEjnl+ThGt3VDDz7Bw1a41mgar8q3TKyr0XBHF1RFPjOU/hJVT
         jvsVmv2IQlXLnOMqaFw5ZcOWdCA0RBI5cvngA8Bb9dBgbxr5x8IILLFz3L0VHBTn0Ik1
         AVFzF0PNYq4ZvVLMg22Fnc1r1bFyRIjOeaXTRB5+COQGohWOq1SllPwtCrSBL4/X5naJ
         PRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942678; x=1791547478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam3kxEB2+c=;
        b=MVgH0lk4Mx4LKP33PmO9XNRlaQWj8b8V/ECV2o393VlnM+zvNpGZhchgN3138eaeaY
         Pl0RZPEgl2hqCr03nY+qUWpve6yxbRNPgkqcIcc1eZJ8QE4NvrjzZebSr4HyHOLR6Yrn
         e2MQ/gYMiRuMij0Jl6m6pVlQbiRSHLEhnrDZrj4tfR9IF5HJe91EacX2SHsZ2E2CUA1r
         Ud7Y4O405sZ8saOk12jej90xGg8QG9vi15KJrAgBmMHJ25AQmAlPBe7DDJSvo5nWdMK5
         sc7HXoiYj0w+KD/xuG+rmdsU77z67XgYAfAiWl3PbDOkSvMUahqXYp//1v1FF8IxB5lZ
         wOSg==
X-Forwarded-Encrypted: i=1; AKwUvByNwEA3pUmnCCH+q4swdLbag7QBB1YlicXU1IeMonRuH+Vn/hV798iBKkhH4CU5jJBDxdAcxXdXfyd7hgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQsA4SLM0LXZx2wGt/HeuIA0g09XNpUMGoMGp2KJV81anVEbsL
	Tve8nn7eDY3eHbGPElDL7Udcke7FwC6wyasPHUzY0mslwCvzx0Z9o34gz00AzuVCEqYwluGvS3l
	NqCCpBhay6G+qOb53PZnQbZ7f2qC7MX1S8BKOH4fqk9NSbzcsErx9RmXJDjU2ev4igiQ=
X-Gm-Gg: AYBFou3F4mUMKCiRPFM6KlLYdJlkIgHsc3WdWwXjeyq7Hd1tmS5a4SBXH6M76rJq4fN
	RhnawKH+zs6MoPP1RE3wUWAyaea/qT1RuTvN4UBmnK+rTyjH7WFSJ925DPq2u2zM61lJcOoto2d
	R2i3aGFGXd9kDLbuw9jP0cgn0gqon7e/SGEmFby5ko1JluqerGUSME0Dg2AlshC9kXXhMQT4Iho
	YJrxR9YRLIFoZq/hWJSn4ucSwQoV3sZ1Kmzph5RGCTES0qwcUVdfb8NxpSgQZU9C53l75HZs7s4
	lq1QqLowlwdf8XN8BTyoqgRtSu2JB0MHGV/LUJGyEJBksJ3A6fzgEpIGHbu+RiiPaD79OOjPMM2
	VclX6dRKDRHZlQnvj1ZvTjg5jVv+Z8fKYzkYEqYA3+LX7ehR0XChhRWMx7AElY1I5TU6D+KJ2Fi
	RnaywTDdd5F4rj
X-Received: by 2002:a05:7300:8296:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-34f066779fcmr2562155eec.0.1790942676603;
        Fri, 02 Oct 2026 05:04:36 -0700 (PDT)
X-Received: by 2002:a05:7300:8296:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-34f066779fcmr2562108eec.0.1790942675851;
        Fri, 02 Oct 2026 05:04:35 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f15019999sm5772904eec.29.2026.10.02.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:04:35 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org, tglx@kernel.org, radu@rendec.net, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global config
Date: Fri,  2 Oct 2026 17:34:17 +0530
Message-ID: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0OCBTYWx0ZWRfX7EgfieErbno4
 zr9I2pbfYyYsLjXZmPNw8CNCo6DkGqJ2TGMmsUrl5rPDmdS0C4svEBXaltye+v2hJ7tWo6S7/cF
 15ottcRQ6FjyCncs9Ldr4hBV6wxj7Ss=
X-Proofpoint-GUID: GoqVVFpEZ-AgDBNl-58oyi-lVPuyN7Md
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abf9dd7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pqfPdFw0YKYeVI_BzH8A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0OCBTYWx0ZWRfX4vyCIBK8ys8E
 R8mY+stajWGA18va/BiHst8yR1FIhf+pWuzwYOaMEmU9b4q630yRtYjALl1cbLm2ZAA2AWsweL1
 n0AyOjxuzSA6+TUMt+0Ry/AM5UXqPWrMOdTKJiAW0D5nrJu5glvanehrMhl5YkbriQ2d92RAXLk
 2ilpu4+5Gw+IFN+4ILEA6BiDjjn4hTqyIWh8iNgklGiDnCzsQy4nWHdmGKiTopSklsv3NAUvMa6
 i34GrJFRthHn7drO1T1BZMqukEFr2t1zWYfGTicqgZD/gyvtUJc6HXabqN+m1i2/WuJr5NMqwjJ
 ilXGjdSJbuENczt6V4oQKyyxWPhEyS6yYe5eKzwER1XQWJpD0fMoFTvFB2mlvR4XH8YEjRUPPo6
 +jZop9Ps7tiKOMzrBUMZESa4o0qQEpI3bm0r3589K7eq7iKskdzQ4BjqpoYx2marV57ALMsfFkc
 VgyBltM1sfffxOt7ufQ==
X-Proofpoint-ORIG-GUID: GoqVVFpEZ-AgDBNl-58oyi-lVPuyN7Md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020048

The fwnode describes a global property of the IMSIC interrupt
controller that is equally relevant to external consumers of
imsic_global_config as it is to the imsic_priv itself.

Keeping it in imsic_priv forces the external drivers to access
the private structure rather than using the already exported
imsic_get_global_config() interface.

Moving the fwnode into imsic_global_config makes the public
API self-contained and eliminates the need for callers to
access imsic_priv internals directly.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.h    |  3 ---
 include/linux/irqchip/riscv-imsic.h        |  3 +++
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 12efd241ce88..769849147148 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -75,7 +75,7 @@ static int __init imsic_ipi_domain_init(void)
 	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
 
 	/* Announce that IMSIC is providing IPIs */
-	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
+	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->global.fwnode, IMSIC_IPI_ID);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..95ff76e63a69 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -313,40 +313,40 @@ int imsic_irqdomain_init(void)
 	};
 	struct imsic_global_config *global;
 
-	if (!imsic || !imsic->fwnode) {
+	if (!imsic || !imsic->global.fwnode) {
 		pr_err("early driver not probed\n");
 		return -ENODEV;
 	}
 
 	if (imsic->base_domain) {
-		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
+		pr_err("%pfwP: irq domain already created\n", imsic->global.fwnode);
 		return -ENODEV;
 	}
 
 	/* Create Base IRQ domain */
-	info.fwnode = imsic->fwnode,
+	info.fwnode = imsic->global.fwnode,
 	imsic->base_domain = msi_create_parent_irq_domain(&info, &imsic_msi_parent_ops);
 	if (!imsic->base_domain) {
-		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
+		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->global.fwnode);
 		return -ENOMEM;
 	}
 
 	global = &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
-		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
+		imsic->global.fwnode, global->hart_index_bits, global->guest_index_bits);
 	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
-		imsic->fwnode, global->group_index_bits, global->group_index_shift);
+		imsic->global.fwnode, global->group_index_bits, global->group_index_shift);
 	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
-		imsic->fwnode, global->nr_ids, &global->base_addr);
+		imsic->global.fwnode, global->nr_ids, &global->base_addr);
 	pr_info("%pfwP: total %d interrupts available\n",
-		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
+		imsic->global.fwnode, num_possible_cpus() * (global->nr_ids - 1));
 
 	return 0;
 }
 
 static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	if (imsic && imsic->fwnode != fwnode) {
+	if (imsic && imsic->global.fwnode != fwnode) {
 		pr_err("%pfwP: fwnode mismatch\n", fwnode);
 		return -ENODEV;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..ae982f89318b 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -813,9 +813,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	imsic = kzalloc_obj(*imsic);
 	if (!imsic)
 		return -ENOMEM;
-	imsic->fwnode = fwnode;
 	global = &imsic->global;
 
+	global->fwnode = fwnode;
 	global->local = alloc_percpu(typeof(*global->local));
 	if (!global->local) {
 		rc = -ENOMEM;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..178b678f5c0f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -44,9 +44,6 @@ struct imsic_local_priv {
 };
 
 struct imsic_priv {
-	/* Device details */
-	struct fwnode_handle			*fwnode;
-
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 61af3a5bea09..b7be1aad7774 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -46,6 +46,9 @@ struct imsic_local_config {
 };
 
 struct imsic_global_config {
+	/* Device details */
+	struct fwnode_handle                    *fwnode;
+
 	/*
 	 * MSI Target Address Scheme
 	 *
-- 
2.43.0

