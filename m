Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469014;
	b=ilbXwSclhdT0ZxCE+Unmd7JhkS9u5SWZ1VzT0N/gKcK/TquMd6pCdYOzPXdb7Z52/R/N
	 GMAC8QhoBGuha5M8W16IF/lylhePzwZ4ObcqrSuqyyyThEbRj0/S5SQwjy/VWUdKquGtr
	 j0+FX6MwdUk9V50/OOqjBE22+jCopyscbq8ruQVqurjIJmMkV5+n60GIoBt5I152W0zZe
	 SlUYRj7TDl72ax5//b5K+E477CkBWb7rJx/poTl72UAeupQXyFqLNGGmhZJIJBmuHz9Wi
	 ABThNTvFJQnPLSYiGIZRd1KWMdGrOAFX/Redy8GKBxZP/cNJV5Tg1UC4qq2omiur7JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469014;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=/5rCn2yitujjJRh6g/K4woV5K/eNe2I35vFRP/WzYwo=;
	b=3/UQfiReb9ay3U6K6Bekvf0L/JWEn/XuTCqombfDodH2Z/lkSDanc7WDD2XfeNS4GoC5
	 VUiEbesF9onhG6Q8tY3lfbyihCsYKQNef6542hVKW/VuqclFG45/0p8+2VCZKeyyFPd6s
	 Y9KGts3EYdTb3rrCB//b8APxqEzDD4CTUylgsIn9dGFTpjAvNr8R/PIeAvZ7IkA8/BsUL
	 EZJXHcNiD601D+gUHVHL3p48UeODe4g5JXScKiUp/Yudq0fZawi9zrT8kRZ9IoDxt+Fcz
	 vQhxHNpDwOycmCORHNr+JLVsSlb/S+QJ7LFbyfSS9IQ3ELQdltr6ooN7AqYh5HiOPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gEAEP7Jg;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD0606A31C;
	Thu, 12 Nov 2026 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gEAEP7Jg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/5
	rCn2yitujjJRh6g/K4woV5K/eNe2I35vFRP/WzYwo=; b=gEAEP7JgZf2USBOUll
	aV8FMUfZIn7M5mJVXuPw6psocOwxnFPPH0SQ37jwGebUBNWyhM/hVFZOP7VoTlhE
	XZxTWjv+xVjZxzKvGaPfbfzeJWIpCT/omByMz9Oe767ySk5hHkRIZv7TJuSRoUnE
	Y5ajQO6sTx9zwbbRuz7HyVKIc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCHaRhtbPVq_SySFA--.53017S4;
	Thu, 12 Nov 2026 15:36:25 +0800 (CST)
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
	Chao Li <lichao@loongson.cn>
Subject: [PATCH v7 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Date: Thu, 12 Nov 2026 15:36:09 +0800
Message-Id: <20261112073611.25770-3-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261112073611.25770-1-zhaoqunqin@163.com>
References: <20261112073611.25770-1-zhaoqunqin@163.com>
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
X-CM-TRANSID:PSgvCgCHaRhtbPVq_SySFA--.53017S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4ftr18tr1xtFykKrWkXrb_yoWrArWDpF
	4UCayYgr4rKrnruw4vyFWUA3WakF93ta9Fq397tw40kryqkw1DXFyfXFy2yFs3Ary8KFy5
	Xa4rGr4xCFWUCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUOz3UUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7RlRkGr1bHnelQAA30

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
 drivers/edac/loongson_edac.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 5dfa41e877..4ee9dcb3d5 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -9,10 +9,14 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
 
+/* Memory controller index invalid due to inability to read it from ACPI, etc */
+#define MC_IDX_INVALID		BIT(16)
+
 struct loongson_pvt {
 	void __iomem *ecc_base;
 
@@ -23,6 +27,7 @@ struct loongson_pvt {
 	 * register state.
 	 */
 	int last_ce_count;
+	u32 mcs_per_node;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -44,7 +49,8 @@ static int read_ecc(struct mem_ctl_info *mci)
 static void loongson_check(struct mem_ctl_info *mci)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
-	int new, add;
+	char other_detail[64] = {0};
+	int new, add, node, mc;
 
 	new = read_ecc(mci);
 	add = new - pvt->last_ce_count;
@@ -52,8 +58,14 @@ static void loongson_check(struct mem_ctl_info *mci)
 	if (add <= 0)
 		return;
 
+	if (mci->mc_idx < MC_IDX_INVALID) {
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
@@ -72,19 +84,22 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_node)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
+	pvt->mcs_per_node = mcs_per_node;
 }
 
 static int loongson_probe(struct platform_device *pdev)
 {
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
+	u32 mcs_per_node;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -102,7 +117,6 @@ static int loongson_probe(struct platform_device *pdev)
 	if (mci == NULL)
 		return -ENOMEM;
 
-	mci->mc_idx = edac_device_alloc_index();
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
@@ -114,7 +128,13 @@ static int loongson_probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = loongson_check;
 
-	pvt_init(mci, vbase);
+	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
+		mci->mc_idx = edac_device_alloc_index() | MC_IDX_INVALID;
+
+	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
+		mcs_per_node = 4;
+
+	pvt_init(mci, vbase, mcs_per_node);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

