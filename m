Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0F2408026;
	Wed,  2 Sep 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339867; cv=none; b=g0xlJh0kX98EuHpZtINZQaOPFjjrfc+ONtiLarA9YWxRK5YRX4Z8V5zdk4pj05S+Jt3uy7n6qBuKpVchSSEMJ6tBTTf0/ihSvzz8Igp09ye5W7PdD/kvjqoQb5flUwAl5j4wC9V96PM4W6M5mGK4LUagnlT2qeZ3lonVeFDSWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339867; c=relaxed/simple;
	bh=yAwX0ux0WBk4a3BM6cekXwPqYTRtgppxubAc1KG8qZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvlIYWUUr/FAs76LsuZEtbMjafBEISTblxX7iNwljXBKm3SsPyfwSkcnZbSfxtVuwUp0+4qNTOtXSd/5Ras8yG2pWGneulvbdfKde/VSjJZtiWv6j2s8qPgkL/E3I6XyFS33ffxD750FyfzQoDpyAY2h0RIwk1Vbbzt5CiXfD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8Bx79KX5pdqrLQHAA--.22023S3;
	Wed, 02 Sep 2026 17:04:23 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJDxg8yM5pdqsXgZAA--.26394S4;
	Wed, 02 Sep 2026 17:04:22 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v4 2/3] EDAC/loongson: Get DIMM size from ACPI _DSM method
Date: Wed,  2 Sep 2026 16:48:26 +0800
Message-ID: <20260902084827.2652-3-zhaoqunqin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8yM5pdqsXgZAA--.26394S4
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr13ZryrZr1kGw15uFWfWFX_yoW8Kr4rpF
	45u34Skr43trnF9wsIyrW5uF13u34fJasrGFWxJ3yYgw1DA34UXFWrGa43JFZ8A345JFWU
	ZrWkGws5u3WDJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8XyCJUUUUU==

From: Wang Jinwei <wangjinwei@loongson.cn>

Add support to retrieve DIMM size from ACPI _DSM method instead
of using hardcoded values.

1. Add loongson_get_dimm_size_acpi() to call ACPI _DSM method
   to Get DIMM size in MB.

2. Update dimm_config_init() to use the size from ACPI, with
   fallback to default 1 MB if ACPI method fails.

3. Add ACPI UUID and DSM function definitions for EDAC.

The DIMM size is passed from UEFI through ACPI OperationRegion
and _DSM method, enabling correct display of memory size in
/sys/devices/system/edac/mc/mc*/size_mb.

Cc: Dongyan Qian <qiandongyan@loongson.cn>
Cc: Chao Li <lichao@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 42270076e..8946c90b0 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,8 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define LOONGSON_EDAC_DSM_UUID	"65d0431b-7eb8-46df-b914-b7d568553140"
+#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE	1
 
 struct loongson_edac_pvt {
 	void __iomem *ecc_base;
@@ -66,13 +68,39 @@ static void edac_check(struct mem_ctl_info *mci)
 			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
+static u32 loongson_get_dimm_size_acpi(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+	u32 size_mb = 1;
+	guid_t guid;
+
+	if (!handle)
+		return size_mb;
+
+	if (guid_parse(LOONGSON_EDAC_DSM_UUID, &guid))
+		return size_mb;
+
+	obj = acpi_evaluate_dsm(handle, &guid, 0,
+				LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE, NULL);
+	if (!obj)
+		return size_mb;
+
+	if (obj->type == ACPI_TYPE_INTEGER)
+		size_mb = (u32)obj->integer.value;
+
+	ACPI_FREE(obj);
+	return size_mb;
+}
+
 static void dimm_config_init(struct mem_ctl_info *mci)
 {
 	struct dimm_info *dimm;
+	struct device *dev = mci->pdev;
 	u32 size, npages;
 
-	/* size not used */
-	size = -1;
+	size = loongson_get_dimm_size_acpi(dev);
+
 	npages = MiB_TO_PAGES(size);
 
 	dimm = edac_get_dimm(mci, 0, 0, 0);
-- 
2.47.2

