Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847373;
	b=KPEjB0KdvUsm94scmx6LVHhprDszYxXPmytGnPdlr6LvO6vqkJxy7sRveSIvLak9gZeZ
	 pjYMPMM0COipSeKSCjIe36sKfpC8rH/+D29TXEwCulsMOIAOfMzWltSRZ45oqxqQ54Ju3
	 wmvfv01DdTgCV6onWIQehglfoSrvzvQ1Uc8QHvmsGEVsG8I+PrOxLrNHSuLYBqXt0YJws
	 M5HwDpoKQ3k5AF3DOm4TrHBYM9Pw4PakDmKlKq0ha1wAjhO5LF90bfSj70RZj/McqVr83
	 4+vc7ts2i1XmtrZhe3tjS4T89lq/ztTRytwozcyUpQ9/vymctMMOdF2ug/Av7/ETzfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847373;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9RthZ381jl0Uj6Tlk31SVyRO0Pz2Il9brHLkB4+Zn5g=;
	b=OyIs+JiKLgLwJmCdAVwiD2mQv6mgebMPIHre8s0JiXgwL6R2yQM58uhP5lcKDq0u5o82
	 JU/phpjeBqPwNOKuAGxwANQM0LxoUDECZHdKNh49+3YNXScnn6Z9jE0/QIx05IZ+ctPBd
	 PV9SmkKrKhPIKiGiws5udVWovJ1wWkWuPBhZIPgBh8KmYnJhnYUBDni/gfFqkgPnxn9SP
	 xqtBJoX3Q8GsTjqhY0Hg1GJvYhamqZ/Wr25Y5YxSwKFUJIC/I3nwsGgRa9Alf6R+i8aF+
	 woo7oXg4DGDcH5S3B3rWS2tNJSmv8QpCrsjhpOLfvwqqLI6pFsDTO37W9w7Wa2M2SaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Peu1lBzI;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A2606A33E;
	Thu,  5 Nov 2026 02:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A56A2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Peu1lBzI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9R
	thZ381jl0Uj6Tlk31SVyRO0Pz2Il9brHLkB4+Zn5g=; b=Peu1lBzImGy7kWG54f
	43dUWtHTezpk14SexzixRIpLp/VvtsTh8f903X1XO2N+xTVFeCIeiosdkB9GrDRS
	41Ekpgs0omEhw9dbuuI8XMgochYRmP04tNardxEXhuNZ7rOMDSoXFoR3Hjg65p/v
	txH7LT7UkDxduYQs1rPE5yz64=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v14m8OtqcGAKFQ--.12622S4;
	Thu, 05 Nov 2026 10:55:46 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Date: Thu,  5 Nov 2026 10:55:30 +0800
Message-Id: <20261105025532.2055-3-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261105025532.2055-1-zhaoqunqin@163.com>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v14m8OtqcGAKFQ--.12622S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4ftr18tr1xtFykKrWkXrb_yoWrAF48pF
	4UCa1YgrWrtrnruwsayrWUA3WakF95Ka9Fq392yw409r9Fyw1DXFyfXFy2yFn7Cry8GFy5
	Xas5Gr4xCFWUCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UROJOUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7hLdHWrr8DKFmwAA3h

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
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/edac/loongson_edac.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 5dfa41e877..3c5d29941a 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -9,6 +9,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
@@ -23,6 +24,8 @@ struct loongson_pvt {
 	 * register state.
 	 */
 	int last_ce_count;
+	u32 mcs_per_node;
+	bool mc_idx_valid;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
 static void loongson_check(struct mem_ctl_info *mci)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
-	int new, add;
+	char other_detail[64] = {0};
+	int new, add, node, mc;
 
 	new = read_ecc(mci);
 	add = new - pvt->last_ce_count;
@@ -52,8 +56,14 @@ static void loongson_check(struct mem_ctl_info *mci)
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
@@ -72,19 +82,25 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
+		     bool mc_idx_valid, u32 mcs_per_node)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
+	pvt->mc_idx_valid = mc_idx_valid;
+	pvt->mcs_per_node = mcs_per_node;
 }
 
 static int loongson_probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
+	u32 mcs_per_node;
+	bool mc_idx_valid = true;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -102,7 +118,6 @@ static int loongson_probe(struct platform_device *pdev)
 	if (mci == NULL)
 		return -ENOMEM;
 
-	mci->mc_idx = edac_device_alloc_index();
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
@@ -114,7 +129,15 @@ static int loongson_probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = loongson_check;
 
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

