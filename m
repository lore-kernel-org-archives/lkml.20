Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A453409E12;
	Wed,  2 Sep 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339869; cv=none; b=rHu+X826zt0Khumwx69s0V9b6O4qqCgEQFgtVC6CYt/j6odHiXDKtGRn3sWa1gMTuH9XfheCb+j3myijUmOHbHP6pFG1wMxig3WKuvYibfftknsGMRJoJP1w5NRdZjd5YGkqZuu5/tc7znIzgeeE+fPOdKX5MIgJYviu4T46GlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339869; c=relaxed/simple;
	bh=XAtqTBuPsM9NimO/yWd9dM2SlI/sWTG9h8tImFNeelQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilj9rR5vpQN63nFvXGVMYmm38AleCzp0+mbzJVbfrxPsW6101YUw2LljEfMuwDngpRExwhwrs1rZpCZ1ikU8Egf4ddz7NvF/JBvmzEaPjpeylWqcfR+X6d1qEWnmYPV9Yu3ytBbjFlyh/XVHQYj8O6/dD/talaPS6FmZb2PWT9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8CxKvCV5pdqp7QHAA--.21840S3;
	Wed, 02 Sep 2026 17:04:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJDxg8yM5pdqsXgZAA--.26394S3;
	Wed, 02 Sep 2026 17:04:21 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v4 1/3] EDAC/loongson: Encode node and MC info into mc_idx
Date: Wed,  2 Sep 2026 16:48:25 +0800
Message-ID: <20260902084827.2652-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
References: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8yM5pdqsXgZAA--.26394S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4ftr18trWUJrykGrW8Xwc_yoWrAryUpF
	4UCa1YgrWrtrnruws7tF1UZ3WakF1rKa9Fq397Aw40kry2y34DXF93XryayFn7Cry8KFy5
	Xas3Krs7CFWUJFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUc0eHDUUUU

From: Wang Jinwei <wangjinwei@loongson.cn>

On Loongson multi-node systems, memory controllers are distributed across
multiple nodes. Encode node and MC information into mc_idx so that sysfs
entries uniquely identify each controller.

The driver gets mc-idx from ACPI _DSD property if firmware provides it.
If not, it falls back to edac_device_alloc_index() for legacy firmware
compatibility.

The number of memory controllers per node (mcs-per-node) is obtained
from firmware via ACPI _DSD property, with a default of 4 for backward
compatibility. Validate that the firmware-provided value is non-zero to
prevent division by zero. The node and MC IDs are decoded from mc_idx:
    node = mc_idx / mcs_per_node
    mc = mc_idx % mcs_per_node

Cc: Yulong Wang <wangyulong@loongson.cn>
Cc: Dongyan Qian <qiandongyan@loongson.cn>
Cc: Chao Li <lichao@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 38745800e..42270076e 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -9,6 +9,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
@@ -23,6 +24,8 @@ struct loongson_edac_pvt {
 	 * register state.
 	 */
 	int last_ce_count;
+	u32 mcs_per_node;
+	bool mc_idx_valid;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
 static void edac_check(struct mem_ctl_info *mci)
 {
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
-	int new, add;
+	char other_detail[64] = {0};
+	int new, add, node, mc;
 
 	new = read_ecc(mci);
 	add = new - pvt->last_ce_count;
@@ -52,8 +56,14 @@ static void edac_check(struct mem_ctl_info *mci)
 	if (add <= 0)
 		return;
 
+	if (pvt->mc_idx_valid) {
+		node = mci->mc_idx / pvt->mcs_per_node;
+		mc = mci->mc_idx % pvt->mcs_per_node;
+		snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc);
+	}
+
 	edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
-			     0, 0, 0, 0, 0, -1, "error", "");
+			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
 static void dimm_config_init(struct mem_ctl_info *mci)
@@ -72,20 +82,26 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
+		     bool mc_idx_valid, u32 mcs_per_node)
 {
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
+	pvt->mc_idx_valid = mc_idx_valid;
+	pvt->mcs_per_node = mcs_per_node;
 }
 
 static int edac_probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
+	u32 mcs_per_node;
 	int ret;
+	bool mc_idx_valid = true;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vbase))
@@ -102,7 +118,6 @@ static int edac_probe(struct platform_device *pdev)
 	if (mci == NULL)
 		return -ENOMEM;
 
-	mci->mc_idx = edac_device_alloc_index();
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
@@ -114,7 +129,15 @@ static int edac_probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = edac_check;
 
-	pvt_init(mci, vbase);
+	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
+		mci->mc_idx = edac_device_alloc_index();
+		mc_idx_valid = false;
+	}
+
+	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
+		mcs_per_node = 4;
+
+	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

