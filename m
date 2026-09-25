Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A04CE683
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349458; cv=none; b=GbZ4w2tHzyG+esttSqScmGr0WPfVpZ60K2N3yBM0mUxQDc2ZpYueY142v8Xo6afb0+b6mVVTz0V8EnP54hPMggkSRMsKeEjzMaTF9xPElu/lvUYsVMLKEBXwYFwuf3F2Vov90ky6oGbNur/wbfZMapnwh0pA75lWL7+vUl1dEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349458; c=relaxed/simple;
	bh=7x194x6TKEYCzCkZ7SStghnb1PURNJmy8La0/uO/lGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUZooFiNbVV9SRg5pXKwv2O1eIdmkafgU3+AEe/sd6V3Qy9N6qQLYc8wLxybersOGCkOaZZ1fM0FrtDOqtK0ZIUYcsh7x6F/Shx5bYvdI/DU0NqzBwzpr58NA2favh/9I5di4seT8T3ZKanOG7R//Uu2JSxoYPEmpYLH9KsimfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNGXHcQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMezviNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNGXHcQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMezviNx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDrPTP602052
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=33RzoCUEUyB
	HwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=; b=cNGXHcQfdJsS88Ah/zsvnLA3/qh
	Zk8IZVgtp/UzxegFgc/lssjOiYDUP7oWc5QEq7ynMc7oZDTTJzIR/KKICSQWWMnL
	XTUL3bu4eyEgF8U7cT9G6RR1Lrm6TTigTKCkWxRpThyZ0cDUTOKem/2qKf4M64VI
	TfN8RWrSPJao/LVLHTGCRKqBPvpZlDnB7aYe+5KEiDcLr7ED42DPKKJXVEdNDzhA
	JKNoy8lOosP2bYUASl75qeQh0LbUw78/Hf9tmSJ7FPXv6FY5lJnnV1Iw8GXTTbAC
	wjXtzxjbrFTBtmP5df1qYCFF84Q8K/vRngw75XgMmF8etHsDflMiuqFnryQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsw30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7915a83539fso920941137.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349442; x=1790954242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33RzoCUEUyBHwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=;
        b=AMezviNxqrt/YfiWmVQzKzoMj/Rtssto2ISBcjqo4/uVkdMs97LfkPCrGUoOBmKzlh
         iru+c1Ke4PjjW1v2+mEDmqE/5yHEkD5x2qxUAXNNk+xjixZGvaT4XkOCvJuNo2IdPVcT
         IoYtYkYseIN8ruj25wQ6BKWsB43dYJvUY3O4Que4krLu7Rn8ylgp+0kOSiXIxQy+vWHy
         +ivNdADuIOydoVAaDr4tN3YpIAsAZA3WgW7t4P07nNBShVLC9jxg9oIB1gFfXazIUGkD
         0NsLiTxy+ewvDEC0iXTAS68OhXu0HiJQEQQ69jQ2VzUF+ifYm3dNofAWlCdhGe9o39EY
         suYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349442; x=1790954242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=33RzoCUEUyBHwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=;
        b=SpKkuKCkK7KLGYryYvr8SXkTnUeQ7cEgtigCIwMcmoB8Wyra7rXB06MWxX2A8zdA9K
         NyXMpOu0W+gdLck28nY2eGyXrARNCSDLCU+KFQ/XCSXQw347/HrLXe+Bsgfvk1+0sbwO
         wSNdfrxAr2/hyAh9Y8woOsWkyHi604ESivcFRR5wEuN1gRQhcApUDDBNetofVNm7Tww/
         TTCHLchdfiCCAen9aMf+B4/UvQLjW+zNJ0RD1T2i/N6n2Z56332BwKMrjoJ5SVn7W0/d
         y2K4FyH5WzOPwWIVJO996aoWF6MqJwzgPtO0g9BsB8eM96nMW2f7EmF4DKRlAA+NQV+x
         p9mg==
X-Gm-Message-State: AFuF++lscEc53kCcJajbxN4cfBDY8StJd01gyItVJaMVqOYRcQ0+s1jB
	6+klRaWNchD9BqISxBqmh1UDd27htRRbop4fHH7xam3CNUj8Vo5xOZh76PIZ3nQqzQrX9b6M+gY
	h+chbh/AZwNQ4T0OZw30BDo77UKhaLOMCW8Jo1WNswSNoSMULM4tDWaDhFP8KlrBV6Kw=
X-Gm-Gg: AYBFou1gfq1Q0wlFzZRUyamKs7b1zVSUNqq/xKQ+wHQ2XwakqoTdApBxqxWklF1uXNw
	BLUdm4+ewJ7lrFDek0euAwH183N/ptebuaWd2K2vtGnXYYzcGnu5aUN/csojxzFfCYudJiQvo+u
	NkOxg60Hc1cdnKSY9KwGNbII5noe/sn1M+3uK5QQbZEaxiiCIeNZ8YvZG71+n1eyxnsKtpw+Afv
	HXWkCoUTruUcCDIjmPoVBX15uOZQRaFkd22PecGohYgI7noYEBhEQ5wINlsGww/Fuu313tLBvR2
	UVGKJj7pCK5AnKXMUczcJmT+o/5SGR0w0Ntr63eFyEpYNGmCxy2uWcfDlOpbklK+qO7Cf0owPHd
	+SWAhWNbXb8p6ILsHe6oVr3jTL4cMpQscddYUWw==
X-Received: by 2002:a05:6102:f12:b0:7a1:4799:33eb with SMTP id ada2fe7eead31-7af1c684f67mr3145041137.5.1790349442251;
        Fri, 25 Sep 2026 08:17:22 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:7a1:4799:33eb with SMTP id ada2fe7eead31-7af1c684f67mr3145016137.5.1790349441793;
        Fri, 25 Sep 2026 08:17:21 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm8069686f8f.18.2026.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
Date: Fri, 25 Sep 2026 17:16:53 +0200
Message-ID: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SCBEzpyjO6sDyaFHHomdwsja5OAy6MVk
X-Proofpoint-ORIG-GUID: SCBEzpyjO6sDyaFHHomdwsja5OAy6MVk
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69082 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=iYRKoqeTzvuv0UILnrsA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX5bayYtf+NSYE
 KbAK2l2lj3wYNf2KDjkqDxifVSln/hHpX2h86kCZ3QJ037CuPNfh5+zD+yQpHtefm0dvx8IzCdT
 Efn+2HIhFA3r57ZZyIyLUBUo20OK+p8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX01QpSlEGaICH
 uU/XaewzG4wHzwc6817OEz3W04Nk4lOTkukg+OJW3wUVG6TsCO9Q/DkhCJ3PLwmxbvlDjnxhNhI
 jMIAzhbTVpFF1VVqIaioTDIcsdJA0SYibNgbDh87CEW8RC0pz0kcHvQcex9j/KB+E21L68SyVLi
 pKdzWpiCgEZdAFSjkQMZTHVixMqiOrRlXh1wD4dZix4K/+c0IeRBjXe2cMwjpzS+FVQv1A5zSrW
 YNqneuOCYiefH9psQYm4JTQCFXdAll3xa+m+4vIlVy72RYjJQdHoVjY8wEscee992fkWMlnd1Ok
 WEJBKGMFhjPP37tNXnFR7vDq4dVHWPgR9xqiOcA9RNUsBL4pz40TLWf/qsJVDMg+QSiGwgOv4pg
 Cg103YRpeo6yemObVNzKB6t/OuqdY8koFP7MYBaNfglWPFIiwu5B9PzIj9XYkOjg89FSnhGUBL8
 Pd7vzNNhi82k9nY+LDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
host IMSIC target into one contiguous MSI IOVA range. MSI message
composition then uses the target CPU's position within that range.

Build an IMSIC physical address array indexed by logical CPU.
Require every possible CPU to have an initialized IMSIC page before
publishing the array. This preserves physical address zero as a valid
target and guarantees the array has num_possible_cpus() entries.

The array size and each target's index can therefore be derived
directly, without storing duplicate count or per-CPU index metadata.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index df38a7670a89..abd1cdb640ea 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
 
+static int __init imsic_init_msi_pa_list(void)
+{
+	struct imsic_global_config *global = &imsic->global;
+	phys_addr_t *msi_pa_list;
+	unsigned int cpu;
+
+	msi_pa_list = kcalloc(num_possible_cpus(), sizeof(*msi_pa_list), GFP_KERNEL);
+	if (!msi_pa_list)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+
+		if (!local->msi_va) {
+			kfree(msi_pa_list);
+			return -ENODEV;
+		}
+
+		msi_pa_list[cpu] = local->msi_pa;
+	}
+
+	imsic->msi_pa_list = msi_pa_list;
+	return 0;
+}
+
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
@@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		goto out_local_cleanup;
 	}
 
+	rc = imsic_init_msi_pa_list();
+	if (rc) {
+		pr_err("%pfwP: failed to initialize MSI address list\n", fwnode);
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
+	kfree(imsic->msi_pa_list);
 	kfree(imsic);
 	imsic = NULL;
 	return rc;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..e51c61dcced3 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -50,6 +50,9 @@ struct imsic_priv {
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
 
+	/* MSI target physical addresses indexed by logical CPU for IOMMU mapping */
+	phys_addr_t				*msi_pa_list;
+
 	/* Per-CPU state */
 	struct imsic_local_priv __percpu	*lpriv;
 
-- 
2.43.0

