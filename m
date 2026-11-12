Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469020;
	b=JJfIeVVk2yCnTFnwEj1Y09Hv/DrdNG5aZd6cGjwfnrAkd1nqhHWdqJqrVxwBXcrFGS+9
	 8iJJgK1Tdl4JVcQTwBxdjr52YPOs4oYnd/wjjXav0LSLilRRVNoDRgB4Xzdo27ndv0JxK
	 jsulu+61aJ/v13wz4jOogqYfjTrmhgVqf9WceJlz0BDahMVtfDnTYM8tW63cR3gkAYi/+
	 XKFMGghbIJ/1nyw4ynpZP1K5gBNFGjWxFmG8vjkBjqZhb1zEQbLQhMEUPFiQWiQdyk049
	 sh1DIGcGXsk38g5wYAeUzYNki4jwBx/BhgZaCCaNud6uZV6NVpxzbbP7zIpNmA4KOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469020;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=daE8MXWR+70jv4rmZgj2YMuLQMKh5NK2VDS/ud4GVlw=;
	b=lFjF+zKwsN5rq1vnpGrEgmPmAPmSvAlm1zudm7XN3IneLC9T4UtPr4yw1G2O1r71SSal
	 eS2BdZdRSqlAbdAJuCa7TDigyFjjdoffbJ7ZS8R+zal72ZZWISC8MUVxQ1BsrGX1fUQh9
	 +43o3Yo2uJexIPaloZrHV+jrZ6/0xVB5/z86pj/uC9cHv4CYooRChjqPow6LnL3cq0o/c
	 F+nbvr792E2NSKAms4EfiCSh7jq4KeEVMK4A1gXOjEaKQnVqtzbTiNfBeuEQ0mSZJYz+l
	 XXCzI8TcH+nCigwaIlMgTdD6CYBzV/mwPLyncEhIlOncRJSRSyJ1nRxD3Z4tVOCY/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="fo/Rtk9F";
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56812606A327;
	Thu, 12 Nov 2026 07:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56812606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fo/Rtk9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=da
	E8MXWR+70jv4rmZgj2YMuLQMKh5NK2VDS/ud4GVlw=; b=fo/Rtk9Fs4DIFk12SP
	Xc6Up9/yTMMocQvvgUbHfpXv8FDLz2bRHddH0b8+IWBOkMg7XtPS0nJXFnXaSnb8
	ahZq5jHzZy3GtZRLS96OVwH9E2DoU/24MIgIDz80ofeymnp0PAdl3KsYO1SW3F/l
	nNGe4WNUMBveIzy8kwwugcGOQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCHaRhtbPVq_SySFA--.53017S5;
	Thu, 12 Nov 2026 15:36:30 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v7 3/4] EDAC/loongson: Get DIMM size from ACPI _DSM method
Date: Thu, 12 Nov 2026 15:36:10 +0800
Message-Id: <20261112073611.25770-4-zhaoqunqin@163.com>
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
X-CM-TRANSID:PSgvCgCHaRhtbPVq_SySFA--.53017S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13ZryrCw4DAF1xWF4DJwb_yoW5Jr1xpF
	43u34fKr47trnruwsIkry5CF13u3s3JF9rGFWxJ3yj9w1DC34UXFy5GFW3JF98A34rJFWU
	ZF4kCwsY9F1DJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2eHDUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7R5SkWr1bH7fpgAA3E

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
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 4ee9dcb3d5..413ca654b4 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,8 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define LOONGSON_EDAC_DSM_UUID "65d0431b-7eb8-46df-b914-b7d568553140"
+#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE   1
 
 /* Memory controller index invalid due to inability to read it from ACPI, etc */
 #define MC_IDX_INVALID		BIT(16)
@@ -68,13 +70,39 @@ static void loongson_check(struct mem_ctl_info *mci)
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

