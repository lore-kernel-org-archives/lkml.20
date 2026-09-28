Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2503009CB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607740; cv=none; b=UervXOzyx9+7HtEvZlz4Ux0+rNG8kZhJYrnZvlVkkNbf6mxcOGKnren7hNxYir2XSyS+jeJub8ZhJbBi4ftPC7TLbMB/Gm8m3GbEg+Q0E3CO5QYHUkTrYaBOGLlp8sLewcIpKttL2r3Fg+coyaJXM0OTC5PFd7StMC7qAvnjrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607740; c=relaxed/simple;
	bh=x/6Mj8dzphmWlnSGBe6+AGxpWwqp9NycJT4FTm8Zu80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElmnXrFZ16bCVQNI6AvQb323feQoKNC708LXoJrJzM9KD0EfCjgt57fQw92ZONW+dj5pPAr652WdLmb5sqkYCogAZ4Ji0SZHypEhig5fGIAsNqyQ3BgKu06dTlZB/6NwBowHrqYvI4Ef53bw3ARjBHknonjI4hOHrTPYhlw/Ovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c73uNlh2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZErVR3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c73uNlh2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZErVR3H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdqgO1908413
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cTgrUnplzPT
	siEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=; b=c73uNlh2ZtQ7oej8s2yZmevZ3k7
	REywjteFYrK1X5Mt2oFWX74+RMx/ANasUOMEci/WYpFAXC3eDSM5KKAzRlk3ReD7
	NUZtqsG30imxmipV6zJe4iKrMnyIydGyy5CtfKz83zRJXFTE9OM969wZ2NXR5Otv
	NAIQbJtoaIKI6VIJsMCp6Qw8twxVRMN/oM3cmg5y/rJX49tS6VfHXrbIsMlLtvre
	iX79BU25HrE3sHCpqucTiplywvFHg7xkKlgxy/GHBb+IBd7JAdfRd4vtTxc5ZUER
	GbzudQZgtsGlq26wWi4UY2xGnSHc4G2L9c73XXMYhDJooGSRemk8PoT7n/g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxj0uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:02:17 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c73057f18so3371414d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607737; x=1791212537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=AZErVR3HaDXdUiPF08ZGIRfRuaZb7GqDv12xObkJUW9OYnt3CjcirtIEboUBRfbUAR
         jaZOU7Z/n3rL55lT5N8SgmlmNSf9Oyq51GSOV4j16p5f7YMKCgMdzYHDp9d947G/efjC
         0WAvYs7Cz0ZZOnUu1L9NTDLs1DSb0fcFsmqEpjPbqsH1mU2q3cOZ0rJ4Fg4+eSKb2j0I
         vR2/pl0KeIMJcPXjMNC1vxzNpQT2xX6QyfhWQM0zkSwVFjJU9fLdvpKDy+VsBv/NvpdI
         ZHKMOyyWCD1GmAea7srrnpfGYi7DJEW8xzK4mXmvie+SCYBbglWpDl4zUiV6q0h4ghmT
         rreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607737; x=1791212537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=QyEiHszU2Na6XZSR9V7R6+QRPDdmUr7pfQYxIEhfog8v1x4yicxtQ81+NPfGWjyy0B
         gtqtgYCeILaoIGITiEIPEBd2JEAIQT8arHGzZq7ez9/KE3FBBQIowE7WmL64D5UfPT/n
         ahW49eSwLJMZ7+6GrPgwg/S7dBNp02VFkPe1lj7hpwzY+apSFwf4Ou7UITK72FKv4bZO
         fpVPL92sXx7JoB739LyHqCXminXw8xnOxcGdOR8y/++oPbHrTllpbciTFTtbsZ7Rx66a
         23KaEIMsSB6/lGWkPa1/PmouvJxUl9iY3fuakOMiEDzyFUG0rdwyPn9bu2SlZyHS3KoU
         Iq1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8MSRcrQnCrSdSCYeUJAoNWpi5t/OCin3IAg9ew9Im3EPGMpI1a+FJXlhN4vHuGPLgIWjWwnsJY3nv2j4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL85wUOnlr5fUfgQBJSKwDeUfkKRFVNkWiG7dCFf7SoxSXYYdf+
	/e1lJpW/jTCI7D6t4G7GPnMS7RO8gHle8miSsZYpVh9AO+eqTsvKzD9uTIujQViuV2ck/amKRGJ
	3LUQKNOqWMTKVdVRLpqQjTWJUJXjhgclgojNwwb1hb86Dij3w+dmqdgLoE6iDcxWWGNyrFVl9Qp
	g=
X-Gm-Gg: AYBFou0WTx6PvKVSTxPOEYzVjQoeZxX0Z/6ojXKWremUTNGWxRYAIQg5N1gW4jJpHh4
	Tjkl9EBrApk/Gw+crOSnMW8hnf0sRxTjGuBLwwwtgAkHi2uu9BM29fFbXUTc02N5rBEt6f1KNlV
	DVrMBtbYa5kNsA+1RsMaozd5L9aEXvRIS0cTetDNPtEl8RZAFuaDmqB9HbufE58zU18BxCnJHnw
	mrWum7s+AcplPtRrAjT6F0fOmSD0pSAfYAGJQLMWsqLzR3/fcXAyLpZpIESvLO1uuScTvGc8trF
	KphxjX+qzc+g883ZSELD1+LqUkImPEOUpMttuaXkRTekCnR69OQAlVE6iRM0SxECY+kktz/MV5B
	HUhwVnmUY0Xl6Imnq1nSHp0DbALRtLM27dlHC0Q==
X-Received: by 2002:a05:690e:dc2:b0:672:f1e7:d232 with SMTP id 956f58d0204a3-672f1e807a4mr6208460d50.26.1790607736797;
        Mon, 28 Sep 2026 08:02:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2b89:b0:7b7:6dec:6eb0 with SMTP id ada2fe7eead31-7b76decd903mr718307137.15.1790605931408;
        Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbed87650sm291164166b.50.2026.09.28.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 08/14] irqchip/riscv-imsic: Define IOMMU IRQ bypass protocol
Date: Mon, 28 Sep 2026 16:31:07 +0200
Message-ID: <20260928143113.49838-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2u3fl74SDO9E6i7aIRtwRv3p8t73wFtR
X-Proofpoint-ORIG-GUID: 2u3fl74SDO9E6i7aIRtwRv3p8t73wFtR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfXy/JxyGosdD/D
 K/ugEgnXRPjzLtyfyZaNdaR1N/MeyYcNC55QyS2UUWWRHnHJkV39gCBdj1zkrWr5yrbfzFijF98
 9f+DvbLFd+xgxmIRIdY2F0A+YfoRc20=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX2ESeZuocTBx8
 ZqXBKG3F248uOsax3LP/bcg1alQB2/3HatxiUegHRAFWphErZp64NdP49rTj6ZD/5i9+iXZyQIb
 agggk0cHOUCRPy2pU/b6sC0f3cc1cjTbAh7+oQxcmB+gUqGrAjBkNboaZDlRfWgeHK1Lb683PiV
 F8ay+PixqCJCpSz6YkyXIW7JGh9Gh7BLVu5nE1Z9HXM+v7UQMGg8MyMROKhKOYCQJHdQiwSh/Fm
 Orw4+/JpU9EV9XTzMuSs9VJYSgvZE2EEbcHY9o4K96lnblX1qiDQoDueWUXNRxVwuTA2R/DuQN4
 vffdEAjyew5vMru2BFVZQw8+/wwCe3lmuRzUZ+lfa3jtpHpP6JqnmL9bGCUxUsCx0X+UF45mmAf
 OYt++zEX221chqKALd2FnGtYpuD/IHEdoUqpGKf7fiY8vifDA4/T0861XyUadbNHIibEnHHSSba
 /SVurnFI0BMwKHdEAtw==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba8179 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4AuT_VmNVbg3FCPyVe8A:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280059

Define the RISC-V IOMMU payload for irq_set_vcpu_affinity(), including
domain-wide target setup and individual target updates for IMSIC and
MRIF targets.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 include/linux/irqchip/riscv-imsic.h | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 662cb0442424..d024a6524baa 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -104,4 +104,56 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
 static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
 #endif
 
+enum riscv_iommu_ir_cmd {
+	RISCV_IOMMU_IR_INVALID_CMD,
+	RISCV_IOMMU_IR_FORWARD,
+	RISCV_IOMMU_IR_UPDATE_TARGET,
+};
+
+enum riscv_iommu_ir_target_type {
+	RISCV_IOMMU_IR_TARGET_INVALID,
+	RISCV_IOMMU_IR_TARGET_IMSIC,
+	RISCV_IOMMU_IR_TARGET_MRIF,
+};
+
+struct riscv_iommu_ir_target {
+	u64 gpa;
+	enum riscv_iommu_ir_target_type type;
+	union {
+		u64 hpa;
+		struct {
+			u64 mrif_hpa;
+			u64 notice_hpa;
+			u32 notice_id;
+		};
+	};
+};
+
+/*
+ * FORWARD enables forwarding for one IRQ and provides the complete target array
+ * so the first forwarded IRQ can initialize the domain MSI table. UPDATE_TARGET
+ * replaces one target without changing per-IRQ forwarding state. The caller
+ * must quiesce all MSI producers using the table when changing both words of a
+ * live MRIF PTE because the update temporarily invalidates the entry. A NULL
+ * vcpu_info disables forwarding for the IRQ.
+ *
+ * A well-formed request which is incompatible with the producer or current
+ * domain configuration returns -EOPNOTSUPP, allowing the caller to fall back
+ * to host delivery. Invalid payloads return -EINVAL and operational errors are
+ * propagated.
+ */
+struct riscv_iommu_ir_vcpu_info {
+	enum riscv_iommu_ir_cmd cmd;
+	const void *owner;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+	union {
+		struct {
+			const struct riscv_iommu_ir_target *targets;
+			unsigned int nr_targets;
+		};
+		struct riscv_iommu_ir_target target;
+	};
+};
+
 #endif
-- 
2.43.0

