Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7F3C7692
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442081; cv=none; b=JDuP7/K8pVsjEHdnRuMbrrqVMpHM3Ii9tEdAA/2BOuv0b3yNiVdvW11w6z232IRbepqKddan/1rwAyQ8EFJJP3n/sjVJT0dHzLlGOup7LmkxpL1QQzQmXb80vbd4h57uG44TNQISogzYyXxgjueUzg32TL7daeOEcTvd4PGgyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442081; c=relaxed/simple;
	bh=40OtsBrmuLPl+jSfCCRHDQiCQEdP9hb5O98rOP8/l64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqgy6ai5axDvON3G9JHtsxp/vCxq3ix9SwSTPSHmZEcuifSDqSZ6UlTtAw6jp/etERQ8PR5sc1Rl9yN6RBvl3iSbNUwp/eGiX+yT6ZG+5PHnTt7Y9FnDopJ+7QrDUZx7B+KxdR35zGhQvf6IL2S5z+Ae8FkdW4uxZL7R5OCmzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdJpaqc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJUTmx9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdJpaqc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJUTmx9R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXVL928540
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4OWazILsWnkuc63TAkCRoxsMSR4/dwZUJzkLzcL7tE=; b=hdJpaqc1u199r9H/
	I+cLJKoePMML5te2OX3a0xgGOXyu/3j2Yusa9lXcMnwPVBNAsmncn3Cau1rB6KE/
	LcxTKFTN5eVUC9Y/P5BTh5zeA3BMpLedsyR0XXuWRRIHnPC+HW3h8d//2sefOXu6
	J3PRpIaLWsH/emeCIuEMOaDSK+8uf+YsbpXo5eVB8LHwbgPfRcieufHEhbFDCuty
	zIBNQ0f6IfG3I2gl8pmSB73hhPltgUTIsqJR3E7y+7PQf1raxaMou+YXrCJcDXtH
	W6Co/TC3fLdmgkba7Eh0ANbbscF9qy/lvZWn29SdZm/dsJMuu2uvYes8j/UeBK/0
	35ZSDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2shgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:47:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5445174a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442077; x=1792046877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4OWazILsWnkuc63TAkCRoxsMSR4/dwZUJzkLzcL7tE=;
        b=FJUTmx9R8mF4/1AFBRS2zYXx7T8aQhpBT5ZPdzIOpaKCujgR+jk3NMFJCUJVGXd5lI
         TP+TyVUPRm3ySYJ6mqU/88RUxX6kaLLXYw1QrXBkqcwvZodezqmQTo+/yQ4TSZoKg+G7
         pxQoVtCqUjSiLAq7T+n6FWyPboSOxmGaZkRrNpzKPA/F5QK5mUAH2KX1UW7r79cIiAUg
         5oOO2FnNB/Ha/GZ9lWKVzkB1DezYgfJJdDXvQ9VRkP7Zt2i4AUu90TgD/MpZSVnNhWbI
         urhXS7IdrFYuCEHMkfWf7sLDcOnIRMvDk/Ugjc+FT5YGGQUu+KB5tyEpVx5t8R2OffZZ
         PaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442077; x=1792046877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4OWazILsWnkuc63TAkCRoxsMSR4/dwZUJzkLzcL7tE=;
        b=1tH9997CoXB2z2x6nJ/OtxKF1OYp4O59Giz/zsVhGAXZdm8N9byt1Wide6ZJNvt4J2
         02lB6mSPl9ATU1qppeM7ezKzIoxdr50iM7njOqPtZzew/OyhFkJTjN5wAc9HDTQPWzaB
         eJLbldjAbS1Lfsu3uv3VPhWVTf6RPGLpMhZaauHIA1XB9uzeIf1JZgBdDm4LKstM2KCi
         MBbglEtPaQ1b346PRkOZ2eDCtBAR7t6gDduUe8lqHnAaDp/s4OOVHYd9WTU5iifqEUnE
         o3a7xOY/hwQ/MIkQgud7mAQHD2ofUXBhkvEVLFlMHadbYYiLCz/BPAOb+qBQwXsE1c1O
         alYg==
X-Forwarded-Encrypted: i=1; AKwUvBw8kWITK+w4slw2pdXQ1Jrev1yWRDTm0rHEdbYdlZnRkLeZJtzQULJu1CDuQLxOXTrsQsQh56x6j4jcwPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoj5tj7o4B+yEvWrk/uCNr7qAjHoWBxa2WcY4n8hRqW3jmMKSv
	Xi38ebbHBo5ZELhKx6p+/gUvvHZxXa2Drc96nwnYjjgNtTSDhHrmMKkz5ELS5pcvkgvdUre6DsZ
	nh8AIlagC5Fep4XXm/+qxuSARyfdVJxdwb9ARjXBMtqwZsMtXdybXHlRqaurWMGCNHEI=
X-Gm-Gg: AYBFou3pBstwxkdnqSUmfSIY4+ILpJopD6TNgN0t3a8phfCmLz4pjWGzH6PkqYbgGvK
	3iAFMkfplj22cf69GNpySdf1ljaotxouNcfS8dG2rScrhUtvh37n39KpYHY1kyGfTqxt3ADq9Gm
	17wp6QW5tW0TeI+KGEl4XNr1JmL8FFB7ybUmXmNSRzn/qwg8mhww3yxeIYQCDl2K5HX0/LusPa5
	SM3J5JLELyyyHHvEa8m1tXjV2fYcHdtHK6HVwb60E99SgUcgMRLt8xSfZtSzM3SW7CRv0JhSpKw
	QzNh2ZwyUMtCbBag6WdWFbnf87DJ82obyXN6ZUZ7OPqLsCWL+i2KgqBnPsprDsLU1AxJa5/KsRG
	+smv6JHVjut1KsQFMU98Qyqr8/vG4Teb/ij19wxoaolH7eXtWcJEr7F8=
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612328a91.49.1791442077039;
        Wed, 07 Oct 2026 23:47:57 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612300a91.49.1791442076450;
        Wed, 07 Oct 2026 23:47:56 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:56 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:14 +0800
Subject: [PATCH v3 5/8] arm_mpam: Add device tree support for MSC probing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-5-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442024; l=10823;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8ni/uddPXCdvrhvN+xSuxb0U0D0tvtqxFpAEzCFQpl8=;
 b=0+8EBVDnQWqiY9cvzVpsCFCFoIIKbTQfetwlW/qGN05zHnlADCUu7feBmtorZ3J5VabLjPslV
 lGnWsv78tFbDPXPaMYOArfUsItZKl9OfjL6yO0Re147cbZKJsQjUqrv
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXw6Adg+vU0Zkm
 mVYWZsD6JUNAKKbhhYPM6As8ubCqobmYCGPBobXnggeP9xS8FLf5k2TIpe0w4Gq/HQvzPwVM4X7
 XUz9PZa7jbFoKZduUva2LhU4CNtZT+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXyfRHGzWGC2Sl
 KGPls5bDRZ+nU6oCIvqajAnj2pVPh1zfBGeBqsgmO44/LJsGRevm5kAGag7Fb9WUba96ZDj9gbG
 ZbD4XWYbKD0IyEv78Ykk3PnmO8Km2rt3Dp91AUC2mrw9VtgRIzXw55YbQdNSJ4uqHUEY33rT7sr
 sIVq0ZgYkNtoR1xY4yGbBygJSKGZO43TJcwlum1hmCMk15/0+pIvH85x52YX5ilMFmTYDgnPGv0
 8UAOz8fGTjzkdcrJ9WR96z2K48FDW0/qCW66FLHCD7fsPPU/r8NKGjEXpL3dwIBUSX2SeEI+vfU
 ajd4E6TtYVuBOZClCRE0ZImTyVNU6AFIlVxnXhzmljMJ8nhFZtEZ+kcY7uCuHun0DMmb0L4mrRK
 Oq5niM6+xf+QcxlSShGRvQskDDBoGSgTsHbn8yUMBSmKjSSQwROIXY5U5pcEL/THNM4lJZ5Tc+o
 Y3u6sVHw2gfGolmExXQ==
X-Proofpoint-ORIG-GUID: niNVKSg4nZy2BNgn1qoOWaEa4p2h-1n_
X-Proofpoint-GUID: niNVKSg4nZy2BNgn1qoOWaEa4p2h-1n_
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73c9d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-Bf8dWPtDk6FBw2lJ3EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: drop the ACPI-only stub of mpam_get_cpumask_from_cache_id();
  use of_node_get() for the cache parent to avoid a refcount underflow;
  reject out-of-range ris_idx after of_property_read_reg() before
  narrowing to u8; use u32 instead of unsigned long for cache-id values
  and compare against ~0U; fix mpam_dt_create_foundling_msc() to iterate
  MSC child nodes rather than creating a device for the cache node itself ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 250 +++++++++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |   2 +-
 2 files changed, 234 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c68135ee0ffc..0640690eae2c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -20,6 +20,9 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/srcu.h>
@@ -161,6 +164,171 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     u32 cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	u32 iter_cache_id;
+	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
+
+	if (!iter_node)
+		return;
+
+	err = of_property_read_u32(iter_node, "cache-level", &iter_level);
+	if (err)
+		return;
+
+	/*
+	 * get_cpu_cacheinfo_id() isn't ready until sometime
+	 * during device_initcall(). Use cache_of_calculate_id().
+	 */
+	iter_cache_id = cache_of_calculate_id(iter_node);
+	if (iter_cache_id == ~0U)
+		return;
+
+	if (iter_level == cache_level && iter_cache_id == cache_id)
+		cpumask_set_cpu(cpu, affinity);
+
+	if (iter_level < cache_level)
+		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
+						 cache_level, affinity);
+}
+
+/*
+ * The cacheinfo structures are only populated when CPUs are online.
+ * This helper walks the device tree to include offline CPUs too.
+ */
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
+				   cpumask_t *affinity)
+{
+	int cpu;
+
+	if (!acpi_disabled)
+		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
+		if (!cpu_node) {
+			pr_err("Failed to find cpu%d device node\n", cpu);
+			return -ENOENT;
+		}
+
+		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
+						 cache_level, affinity);
+	}
+
+	return 0;
+}
+
+static int get_cpumask_from_cache(struct device_node *cache,
+				  cpumask_t *affinity)
+{
+	int err;
+	u32 cache_level;
+	u32 cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		pr_err("Failed to calculate cache-id from cache node\n");
+		return -ENOENT;
+	}
+
+	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+}
+
+static int mpam_dt_count_msc(void)
+{
+	int count = 0;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
+static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
+				  u8 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	u32 cache_id;
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+
+	if (of_device_is_compatible(np, "arm,mpam-cache")) {
+		cache = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!cache) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+	} else if (of_device_is_compatible(parent, "cache")) {
+		cache = of_node_get(parent);
+	} else {
+		/* For now, only caches are supported */
+		cache = NULL;
+		return err;
+	}
+
+	err = of_property_read_u32(cache, "cache-level", &level);
+	if (err) {
+		dev_err_once(dev, "Failed to read cache-level\n");
+		return err;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		dev_err_once(dev, "Failed to calculate cache-id\n");
+		return -ENOENT;
+	}
+
+	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+}
+
+static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
+{
+	u64 ris_idx = 0;
+	int err, num_ris = 0;
+	struct device_node *np;
+
+	np = msc->pdev->dev.of_node;
+	for_each_available_child_of_node_scoped(np, iter) {
+		err = of_property_read_reg(iter, 0, &ris_idx, NULL);
+		if (!err) {
+			/*
+			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
+			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
+			 * before it is narrowed to u8, so a large value cannot be
+			 * truncated into a valid-looking index.
+			 */
+			if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
+				return -EINVAL;
+			num_ris++;
+			err = mpam_dt_parse_resource(msc, iter, ris_idx);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!num_ris)
+		err = mpam_dt_parse_resource(msc, np, 0);
+
+	return err;
+}
+
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
@@ -481,16 +649,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
 	return mpam_vmsc_alloc(comp, msc);
 }
 
-/*
- * The cacheinfo structures are only populated when CPUs are online.
- * This helper walks the acpi tables to include offline CPUs too.
- */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
-				   cpumask_t *affinity)
-{
-	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
-}
-
 /*
  * cpumask_of_node() only knows about online CPUs. This can't tell us whether
  * a class is represented on all possible CPUs.
@@ -1987,15 +2145,34 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
-	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
-				       &affinity_id);
-	if (err)
+	if (!acpi_disabled) {
+		err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
+					       &affinity_id);
+		if (err)
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+		else
+			acpi_pptt_get_cpus_from_container(affinity_id,
+							  &msc->accessibility);
+
+		return;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+	} else {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+	}
+	of_node_put(parent);
 }
 
 /*
@@ -2123,7 +2300,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(msc);
 
 	/* Create RIS entries described by firmware */
-	err = acpi_mpam_parse_resources(msc, plat_data);
+	if (!acpi_disabled)
+		err = acpi_mpam_parse_resources(msc, plat_data);
+	else
+		err = mpam_dt_parse_resources(msc, plat_data);
 	if (err) {
 		mpam_msc_drv_remove(pdev);
 		return err;
@@ -2136,15 +2316,45 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mpam_of_match[] = {
+	{ .compatible = "arm,mpam-msc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpam_of_match);
+
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.of_match_table = of_match_ptr(mpam_of_match),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
 };
 
+/*
+ * MSCs that are declared by the firmware as being part of a cache may not
+ * be created automatically as platform devices, since there is no
+ * dedicated cache driver.
+ *
+ * Deal with theo MSCs here.
+ */
+static void mpam_dt_create_foundling_msc(void)
+{
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -2963,12 +3173,18 @@ static int __init mpam_msc_driver_init(void)
 
 	init_srcu_struct(&mpam_srcu);
 
-	fw_num_msc = acpi_mpam_count_msc();
+	if (!acpi_disabled)
+		fw_num_msc = acpi_mpam_count_msc();
+	else
+		fw_num_msc = mpam_dt_count_msc();
 	if (fw_num_msc <= 0) {
 		pr_err("No MSC devices found in firmware\n");
 		return -EINVAL;
 	}
 
+	if (acpi_disabled)
+		mpam_dt_create_foundling_msc();
+
 	return platform_driver_register(&mpam_msc_driver);
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..aa45d00bcd07 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1

