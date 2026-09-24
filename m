Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1166411FA4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235461; cv=none; b=X9ehscw+fdLMUbr/wqvcYpPa3CkhbgqLONHRd8EI6UcudUi6b/kukZfTju9sa4C3zJyke5bjFsezCuHmoNQ94sP+YHggn0yTAMgHOqUbJ7fEZz1/za6RNFcUVNVIvLaXhrF2GN1RTsFVCkryUIPNr6gI+X7Q4RZQ5Y+XSYEZcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235461; c=relaxed/simple;
	bh=v8z3bs/wKomA6O762f46n+RIupf/AQfAQtYjTHMBK64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHJOyeRjGMaZJBuSk8qU5lEEF2XZVgOOwT7AVI1fRwWZUw2WVcUe9xGqxaOeBGoj3rZi/9FsE05nnaeMh5SOISHd3rCdV/xS2CKX/3Kp5dW5McMPGbitFKthP7DNPzO/xdWFpSnG+KxlJDLPHcHdVRw2Wl2ttIwjF/l0MxqqjY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGWP3EFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0nbQXG7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGWP3EFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0nbQXG7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBUN772439
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qPsTlQAM/LB
	nJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=; b=SGWP3EFXzqW2CbC0eoctGT8Jq2/
	dnut85dn8ztldhowjK0vriSqCD2uXChvmsgOEkhjzSZstsy8/AMhVYNZCwXGF7M3
	e685BogjiciCNsQSPmxw8wRIJlS1TNBahME2++C12ASkU0vNscbqPgYK5AIC07jo
	7Ydn0jcYTq3WBlQGANptp8MpjdbZKe576gW+xm1lwo1TB3FeFprIClMcTMYGrYBS
	iILgMCQe2aLRszr1pdHQXgTEJf+w8z8OPn3DXCdClNv4yZAsYrMLEOFwgvcBCspc
	ssuQ5LDI4ggg2wKyBOXiEr9sN/86/mvInNeaeOnMMwsVJK+dgsOvHA095Kw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr909n1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so2110880eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235459; x=1790840259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPsTlQAM/LBnJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=;
        b=h0nbQXG7iWq4z/RVBYYaEYXihG3JGfgHfZF8bbqgQvEfeOrhtfsaPWi2N+i1nGZUs2
         j5YjgDOt6vcdvUJpaeIeqHpz+Re1CIlq9Zz588uxI4ElvLAmwUHm7l3m0JNtcDtX1F79
         1bPu3esM7x6mjbNXvZP2ELTtF9v10wrHl8PNnBnY0kuS9NvfkOzZZAy+0CsYC31HpX/N
         vrFTvVnCAt46p/KMFI3gJSoVs5OknjNpagcdy6cw4tap/mgLiQEGyG9lGbpdREZAS6Me
         ccwEczE1oiQzJveACy+ev7r4+DAvV1EqsFQeq5QZeDgMaaTFoiLL0hkxFr3c8XhBZR3r
         1d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235459; x=1790840259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPsTlQAM/LBnJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=;
        b=HfbXk9+qJLmy9w7AKqjrTCbJOJzmRZTAKv/lQBuk42OMj+F4wv/ptpvtjumOKCtxXy
         zI4MyWLNaz5yOAkEIkgzh/KqyyEs5dmamt1QKHkAFGxwLkcMJZeBO/cAbScHW3brkYap
         JLGRKLZwoF05dKC6B60TslsOEftLng8LcSHxX6yWhvWmB+yLSD1Udy7e9i7YSpeh3kwr
         oQciz493mg4SUtVhXHVec4DlLYPukFbvPSPxfJYXN/vyqUdB8eufgTexWB6PYTDdRpuj
         FwWTYmfg18rtsZqtUwyZlcnHSk0B+PZdZlcF9M6iJXfa/RSVI/5YJ6qBWFxDFuRK1fTI
         gLkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRO+dYi+dSLu6yqoaB7BKdEQjZWLo2ZfV0fjOb+P+e4qaQEjTNutbD8U1wE1yp7oU6hjmnB/jcvvhFWjA=@vger.kernel.org
X-Gm-Message-State: AFuF++lxEVgDVHUSU2nSnviYOCENEBBTLQNNFAP9lDsaQYeSZH74JYNt
	eiDx1di+DbR40WcOdPnxVGA0CKLdZrIrUUzbUjKk8pl8hmvAvZUNpiRrAdMxiNGUYcR7EE9wOPS
	5ga7xKrE/3dJT9+JysH6qsMNRO7zgklKHSu9qBb+3TzLf1G4bySWO6XedTIYcPmE/xX4=
X-Gm-Gg: AYBFou3bMyirbGH4i3No3UxUAJhMLElbkKxhhkvM9Kp8OuqsM8Yea1bMGVIWka/osTc
	bZMTmMqtqEHRsoxfPDyJQAiNBM/GUCs3W88MhH39Pk4LznnTlJiwlG/7OCFMJQhEkruNLwYqs25
	3roVRAkW1/W0cebR7S1CaF/zGZ69VCp6Pnt8youwqY6Z9iTHfJ0VVk+whT0xf0F3ZxIfCtplWuu
	QENqV0bYy33eXIaUR94Eg1fVhqlyuUudkjrv2Ku95QD6ZMqUWiF9Iwr/HtKfbBAwGOEBluYAHJo
	RbeJLPZ6Ry4mOgLWTNW2c2lv5Z0rCOi+vhaTDZXY/jJ8JvTwOSv6tf3ZsKdVdLrgum0+C6JT4se
	DEzKQyEogaQkbXhu4UMWDYTjJPA1U0CbsZZm1xhkFQgKwwKkBUlrClGdThgO1F5fTW/4DJE1HCd
	9VDytxZiAQcCVIW+iy3cxSDbjr
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr1644065eec.11.1790235458897;
        Thu, 24 Sep 2026 00:37:38 -0700 (PDT)
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr1644026eec.11.1790235458107;
        Thu, 24 Sep 2026 00:37:38 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:37 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 2/9] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Thu, 24 Sep 2026 13:07:07 +0530
Message-ID: <20260924073714.1650588-3-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX9NkZHx+Cx1jb
 Ax40Z31AlZGWVIQEYTRpMqTbZxITxZlHiqqGyE2A31HmfJaFHErQ51qMkURJe5BGwtDlthNuscZ
 o+4QX1KS7ptV115cwqTvf57B/6Q1p/4=
X-Proofpoint-GUID: jY3rsdKKoI7lHzHnAS6I3Agh3re4ZHzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXyZYKtwzlrT3d
 oUOAwV1mKnaxD/Zy87P/kvRh9kThsuG2KUlhboPHFfCG9HsQJruc1rNNSGLoYf3xFZD59Nqq1wP
 ImiEiXjEY0Hclrj2Pz8j9fe3bY4K8qGif/rK5oUFZaQFTNy6GVoU7lc45q5bdBjVPjm0JJN4mX6
 Rk9dAAkewJ2YRxO7/Tp4vfh7D6HomxbbpMni9sJkaECI30/Yq2eV2A8pMSApzbgr4SIpYZo1Em9
 hgOofDSMuUuo7WUxGn0K5hluMxytU3YtUxcc/TjVHcjxZqirYCsf0rstM0I1TRDZA+kiRQijKYq
 ydWjVDhsy1ADqNvhOilyTgBBo/d7PTcLp/w+sJfq45ycVhynlNdIK33IwwdhFngtGRF4yv9Gu9X
 TRp7Zx+7wSDm8VtUr0L8R2GIkiOgWDGhA3mhT/KsnbCcoo3nUV2K1CCEZQeIkdbZtwEDLGjLsEu
 ENqll9I0nXhz8pWvPFw==
X-Proofpoint-ORIG-GUID: jY3rsdKKoI7lHzHnAS6I3Agh3re4ZHzv
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4d343 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eGWCFza2bnmXRcdnH9YA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

ghes_map function uses arch_apei_get_mem_attribute to get the
protection bits for a given physical address. These protection
bits are then used to map the physical address.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/acpi.h | 16 ++++++++++++++++
 arch/riscv/kernel/acpi.c      | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index cdefa1f2d67d..c7dee956cdb1 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -16,6 +16,7 @@
 
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr);
 
 typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
@@ -29,6 +30,21 @@ extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
 
+#ifdef	CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff to disable IA-32 Corrected Machine Check (CMC)
+ * Firmware-First mode. It is not required in RISC-V architecture
+ * and is present for compatibility
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	return  __acpi_get_mem_attribute(addr);
+}
+#else /* CONFIG_ACPI_APEI */
+#define acpi_disable_cmcff 0
+#endif /* !CONFIG_ACPI_APEI */
+
 static inline void disable_acpi(void)
 {
 	acpi_disabled = 1;
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index efd52a5d05b5..d1e472ce0878 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -204,6 +204,18 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 	return &cpu_madt_rintc[cpu];
 }
 
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr)
+{
+	u64 attr;
+
+	attr = efi_mem_attributes(addr);
+	if (attr & EFI_MEMORY_WB)
+		return PAGE_KERNEL;
+	if ((attr & EFI_MEMORY_WC) || (attr & EFI_MEMORY_WT))
+		return pgprot_writecombine(PAGE_KERNEL);
+	return PAGE_KERNEL;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.43.0

