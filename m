Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006063;
	b=PR6p1pMfjRmygtg2K3F7b9KlQ2oWtuQNyvCYu3QgXO3DsMyOlnaC/VFDt2F3f3HwZdnt
	 qi11QMLtHWTb6R0ddsja97bym+PKxilNPcOqS01i5qMA1Ly8oKTOAd6Vb93cgcZgfGiuE
	 TaGgHlj6Zyhqi6ZJXh+4nC6oN59/2DrNKv6pvHMiihxiwxD02TJ6YZZgV7nbpVMZfyoQL
	 YwnPY4QCiX3Aczr6Gq2K4j/UW57jf+m0IV0FsmkTKgYMICL9HM1yKTlzV3lHR9xQKOLad
	 m+VvAH0FSsMEgfi5f9zAxyeUF7ntkTl5mT24oYgSgi3xjVCLcKdzLq7H2j0k992TN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006063;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UIggRCA5V8lHZgFu+vMrvMUDLT6VX1yJ2ZRv+BsopVU=;
	b=EgGDbWOPO9plN1HppsNCBvl+2BDho83Er9I2QXb1TBqQh10mprHFpo5DIX0EO2TrAyvk
	 /CqLUw8LsIXinkkuxEvMEsLXCN58OOpRih0+6JIEBWeCtkCWfYpSghL6MjyQDs4Ybur45
	 OKtKHUMMCNFBELG5zshm0OA/3ypWqWYUh/Gs70pLjK4PQP18h9HSCkQgC6qwUA97ylvVT
	 Fat6uRocVpgpcwptg9GuYFsIqsq67QPZhgkWkwkJAp4ZfxXl6qim5U5De+68US2Wl/gVV
	 wv+3SjX4mlPFYWx9SVi/Vs5RT3r8PQQz/CR3LBpim1MbvJoz2FKVxqL6xYe9DHqLckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="I/RrwXNy";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13C9606A321;
	Mon, 26 Oct 2026 09:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I/RrwXNy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UI
	ggRCA5V8lHZgFu+vMrvMUDLT6VX1yJ2ZRv+BsopVU=; b=I/RrwXNyHB05wdrNg8
	JxCsDO4mciqrCTuW3xqYbpfdOKu7vveWHibT4Dg/IPbzMr1v5PnkwxicfM919sFE
	y9hhtEUQzqBYaP8EquAMP/euobVkoB6mcIz2IyQbDOOpnMt5XbqdRLp8TY7eI9Kc
	wF6DUfrS75UHA82cXecYzvEk0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD332jHGd9q4hmLCw--.8486S4;
	Mon, 26 Oct 2026 17:13:56 +0800 (CST)
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
Subject: [PATCH v5 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Date: Mon, 26 Oct 2026 17:13:30 +0800
Message-Id: <20261026091332.30226-3-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261026091332.30226-1-zhaoqunqin@163.com>
References: <20261026091332.30226-1-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD332jHGd9q4hmLCw--.8486S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4ftr18tr1xtFykKrWkXrb_yoWrWw4kpF
	4UCa1YgrWFqrnruws7tr1UAF1akFn5Ka9Fq392yw40kry2yw1DXFyfXryayFn3Cry8GFy5
	X3Z3Gr4xCFWUJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUzV8UUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7hQOTWrfGdTr7gAA3E

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
index d9bc33dda7e..018b1e3a907 100644
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
 static void check(struct mem_ctl_info *mci)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
-	int new, add;
+	char other_detail[64] = {0};
+	int new, add, node, mc;
 
 	new = read_ecc(mci);
 	add = new - pvt->last_ce_count;
@@ -52,8 +56,14 @@ static void check(struct mem_ctl_info *mci)
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
 
 static int probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
+	u32 mcs_per_node;
+	bool mc_idx_valid = true;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -102,7 +118,6 @@ static int probe(struct platform_device *pdev)
 	if (mci == NULL)
 		return -ENOMEM;
 
-	mci->mc_idx = edac_device_alloc_index();
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
@@ -114,7 +129,15 @@ static int probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = check;
 
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

