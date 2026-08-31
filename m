Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B774F6491
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188407; cv=none; b=a3rlRVKSN2WFrqncjJv9DIlQ/v6GjsKRu7iJGQYkrhFYMJ4p6et4tftKbQP/O1lhC3corsiM38gyPJ1/X7HYuWLSqTzUvIUHpDqhkQVyBng3X7t8ld4FjnWlcN+6+TE1xbqnC/HFfsjlx7MFsgfYkjO2z44waskBRppkYNZXI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188407; c=relaxed/simple;
	bh=6dK+l3e+dnI9ZnhfdSOfWWzT8YyCzelSdF8e2LcUoOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhbomSSmwaO/umtIX17adHevAbqcRDwgOFimHlj/gsWPbfHvW8nGBcJnVFgTCPs8l73/Kgg1Mvk3x0D76xCbQdx49KAKFxessGMlwvDlFRbOmmkInBonG+8L0jbUcKSAUc0uJF5sWMjx8hpMbJFet8ZUkL7bHQ49oqNNZiFWKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2PLfl0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt1EFHU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2PLfl0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dt1EFHU0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQsU3296599
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o07feOcyhDQ
	/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=; b=f2PLfl0ThuPJJ5IvyzAL32bL6+z
	ebwjCRLavaKdEY2BXjjKdm3BXXokMuh7ta3Ptmm4WuWmPbdkRWTDW/uyZb3QHt9V
	/9XHRkWxEMHdlETT0rtr85PYI139lGX7dvrTN6A3w4w7LmOa5V+Yksc9MEuZid4X
	ZKOXsLulYjb+LP/XLj/aDzIS4AvZzHlblx6RrekjFZUZAnr+YoMsWmCO+N9/8Nh7
	Ppuq5UqGlMdCF+ly7bNUuXn0lcKnThL5/POhEv02xPTUepOTJJ9AnxlFJcEFQ2sY
	Mry1LnLc12RQ8K7sXbufCxX6w9zAIjOHSd/RR+lC7Svdt9V8cDfJjzrmOcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayhhyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so552603685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188404; x=1788793204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o07feOcyhDQ/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=;
        b=dt1EFHU0ltXQ6g8X7hQIjlgKJrZyyS3g4x+j6TkKLggtp7fgkwrzAMK/U5pxLxTl6o
         Iz+8vmv0EKKJbqhi0ffvMVT+W/B5HIQWczHr6wBnFwJouoHWLnOUS12YKQts1Cw7vcmO
         RDNzCh++4hnN8/PCMbC/PEdUJ84Hzx4rzIDV0gXMRoTTloiqYUSlBEeLK4t6/ilx8omt
         GVIfa3aJNQl9cXkr41Yjz5hkrsdkK0OZHZBf2AAQo2cWSBkF/FjB+164/0n//bYyhOEM
         MJmIn8mjv+lp1yleJGEDzUEq4uPvFcL48ORfKcINr3E2bVYHIsTmKZekkEnLCl0EIrtj
         z8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188404; x=1788793204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o07feOcyhDQ/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=;
        b=O3panPEbDcn5fW7nNLmmRobgBzrhKHc0fLIpwTbhMTSDlr2rAPOCLkJ6ZJTJIYkO0Z
         UDlDqdlMh4tAGQPGaOYdS6wX/4LY6NmiR0mM3aopoPBJeiulvpVT2g+ZyCXQJZAzlxfW
         1o9eqtMF54rQ0mmkxNb11DEDd8LSGTRTmXNCdb4ckM8Eylchaox9b9Modjh5SD9WIxeh
         I+ppUmw3iCxsiGPa6Xsh7iHpPWE4YFEr17NsMKQieR3z3AhJM39ltC+u5qvVkwCcpcKF
         vp8RHY5/utGp6qEl8XLcQFw0BvGb9QACmo73Ht4ONdDyhJv74ogFOnreG04Y4wSYL7wL
         m5cg==
X-Gm-Message-State: AFuF++lE1oOIfXJxXKCgmlzBM6edulf989t3R7zCgVV0lymdC/9eArh/
	p9gu+Wk9U3a4dZ/CHpFU4s6X4bvc3GHSkrC2q4FA6RFl0fbGsyX7ETMGFj+K0KfGa8lq3R/Cgce
	FeYYoYG9+zAk/mGLMPm4cbJ25I0bi5l/87KKK+rkgMhm20g3Jiy2lkaTj1qa2kCJOoHE=
X-Gm-Gg: AR+sD10at0ZzuDsME0mQdKyhj2G+4R+mPbHOR8HapjaqxBWwxGJFArMKvSPfk1ZXKoL
	AwhgMaLzLBYN4C6wYg+sUY51xtv5Gt7XBcn2Ml4/O9QN6d3qgHYNbr/9zaD87ZsbkXH/YRITr+n
	AnOof/hMJIREn5LKB27aXTnh0Lgdfyo9cNUmr8dCWBh9FcEGRSgZS7j66wThklM//p1QrVgC2KJ
	yCQSFCc9CkDk2GXJl9/CFt0voreYSzShNLI2AJWiaEMbxIH/Y6dwA+Ew/QpvGqAUGAeLr1yDjRm
	F47kZK4EORkHVOh2szRT8O+Ti4iGucb5viy7Dwb333WUXN2qkzaL0PoDxl0wrCu0AesV9JlJSrj
	1eIZ4zldoXVanByYKLViJuP5+GKZHQinSn5o=
X-Received: by 2002:a05:620a:2807:b0:939:4209:d5ff with SMTP id af79cd13be357-939480f8988mr221161485a.33.1788188403912;
        Mon, 31 Aug 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2807:b0:939:4209:d5ff with SMTP id af79cd13be357-939480f8988mr221146685a.33.1788188403218;
        Mon, 31 Aug 2026 08:00:03 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm333359565e9.10.2026.08.31.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
Date: Mon, 31 Aug 2026 16:59:37 +0200
Message-ID: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX2UdO6wEBScJ8
 qtU2sEuyfjlH6Qz8c2SMrLveOUgw/ZBLRsXapAiQU4Fe9eI4SS0vOBykE5B0iDFiBTDRXduEX2O
 QEr2LhSn6quaYKE6flTZOsbR8UU8qd0=
X-Proofpoint-GUID: APpIULgBkH-3jvxlH0xwDyFqisrMam5F
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a9596f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yikt5F2n8VKCXyCzpw0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: APpIULgBkH-3jvxlH0xwDyFqisrMam5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxDEFtTwcePaP
 DcohQiCI6i4mVa+NWx4W4BGKXG9GybLC2ygVLUTAYfIVDuq3C9tPTVKO/kg5iYwkDi40SrBckEp
 2H4Qr6AjIyrMx8pTNxuLPcVeczRT2wfNqjyvfrkwz5u+LOk83+sCZ0IlbtRukO5wSSbRMKqo2oU
 fQVwYcwVsRIZIxD1n9HOKuly7vPg9zWJNZgpMwrsmJYfKSCKSKEmKxn8KTG/B0TfEZoglyubHq2
 IXWyXF/dDEU8NcAaNX3Jilm9xnetJBzmikTrBO+1wCP+wrQqpnG8n74AE5uF8h9MJ2Qo8XPZf2b
 eAwaR80gZWX3cw+CExtT2tnKgAAuTfxydsHXTInikXfkKUWU2yVOQBoIVfsFi1/tz1f8g0mcvLm
 5rqp/X0VEReMQXgDfhHbIUYOXaAKzcfPu6jvkoGNLVQjZs2JRScOUTUjrbDziVuX74tYQZgmK5i
 NhBHZC3l/aBRbRxe8SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
host IMSIC target into one contiguous MSI IOVA range. MSI message
composition then uses the target CPU's position within that range.

Build an S-mode IMSIC physical address array indexed by logical CPU.
Require every possible CPU to have an initialized IMSIC page before
publishing the array. This preserves physical address zero as a valid
target and guarantees the array has num_possible_cpus() entries.

The array size and each target's index can therefore be derived
directly, without storing duplicate count or per-CPU index metadata.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index df38a7670a89..c7ebddd308ec 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
 
+static int __init imsic_init_smode_msi_pa(void)
+{
+	struct imsic_global_config *global = &imsic->global;
+	phys_addr_t *smode_msi_pa;
+	unsigned int cpu;
+
+	smode_msi_pa = kcalloc(num_possible_cpus(), sizeof(*smode_msi_pa), GFP_KERNEL);
+	if (!smode_msi_pa)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+
+		if (!local->msi_va) {
+			kfree(smode_msi_pa);
+			return -ENODEV;
+		}
+
+		smode_msi_pa[cpu] = local->msi_pa;
+	}
+
+	imsic->smode_msi_pa = smode_msi_pa;
+	return 0;
+}
+
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
@@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		goto out_local_cleanup;
 	}
 
+	rc = imsic_init_smode_msi_pa();
+	if (rc) {
+		pr_err("%pfwP: failed to initialize S-mode MSI addresses\n", fwnode);
+		goto out_local_cleanup;
+	}
+
 	/* Initialize matrix allocator */
 	rc = imsic_matrix_init();
 	if (rc) {
@@ -984,6 +1015,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 out_free_local:
 	free_percpu(imsic->global.local);
 out_free_priv:
+	kfree(imsic->smode_msi_pa);
 	kfree(imsic);
 	imsic = NULL;
 	return rc;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..11352f14e32d 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -49,6 +49,7 @@ struct imsic_priv {
 
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
+	phys_addr_t				*smode_msi_pa;
 
 	/* Per-CPU state */
 	struct imsic_local_priv __percpu	*lpriv;
-- 
2.43.0

