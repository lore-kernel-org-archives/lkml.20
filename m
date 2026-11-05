Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847379;
	b=P34MLP57yHNyKnG7e82PMD3b7egpnlY0qIgZRhxmtDxFdCdqIgHY9/QaxhmcVtCfd111
	 IG3Dlfq0oyB738RZhGrlhufbVUUYRKWF8oTTTpXpHzuJUJB8g+hvoBflB+orvtHG4WhtR
	 YfJk4LatdO0H8GmyKDr/OVRYPAdH6HqYkctiKgjUA1kGmFwFr5b9QBJ1SzCCbYrlMH/OA
	 TzKRQUvwHhBrfV8MhsN/Uayp7S1/BqdVlsSXjJ0gnCayqvy1loPlW0OhtW1kZyLQrCrcH
	 4Es3UwDXNT075uki4KvAEWOAKI1Ou6SNYTISJE71qVIzKHZOjghkWMWiYx30Z+Y3oVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847379;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=O4hNRHiJ9xSt1qrjl0/38zc18uhK9gYa1qM9Zn0CEfo=;
	b=FRfx9AVgHHjIL7aEDF5z29igRa5Cg130X/d43wNerCU3ItASbGfFJEECYvrPcHMwT6Y5
	 5jj3RAGoc0HTHtlSOVJ5TqH0bI/E85dZHbtJ4GjlJCB/FgewpNDbCb281ewC6AG6JeQac
	 jUUMm78/onihjLSui/jaVputVwKHpOuvawFbEooENnpLWEoMZEkubxYbdwAj2mZdUmPKi
	 2KgPS2ejP7lu7KYjl7/13kdBK7wW4YvdE9w30IhsMbLCjYAuz1nOHqsqosZy9R0JN0rQd
	 xeMj2LPgTwzK3tQ6TyxD5xORMiduf3rjPjfwrjORjA4Ivi5pgQ9BQ5Ty2HxUirmX2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WJvBDNYk;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175BA606A33D;
	Thu,  5 Nov 2026 02:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175BA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WJvBDNYk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=O4
	hNRHiJ9xSt1qrjl0/38zc18uhK9gYa1qM9Zn0CEfo=; b=WJvBDNYkJiH45Xj244
	o0QamMVznKaWkMVBhaxmkN8ZywZDhmLzoSbkZBxFRv5ac+Wug3OUF6VOftsM4KXr
	KQZlo9aEpe9NJs6R8KHxGYm219S4WAHROn/MS0kFBmGUnES8k18gAdsq4SfOb70o
	My8btsHstSmQe6mjC1pnFUho4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v14m8OtqcGAKFQ--.12622S5;
	Thu, 05 Nov 2026 10:55:53 +0800 (CST)
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
Subject: [PATCH v6 3/4] EDAC/loongson: Get DIMM size from ACPI _DSM method
Date: Thu,  5 Nov 2026 10:55:31 +0800
Message-Id: <20261105025532.2055-4-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD3v14m8OtqcGAKFQ--.12622S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13ZryrCw4DAF1xWF4DJwb_yoW8KF48pF
	45u34rKr43trnruwsIyry5CFy3u34fJF9rGFWxJ3yagw1DC345XFy5GFW3JFZ8A34rtFW7
	ZFWkCws5u3WDGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7SdDUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7RnfH2rr8DlwEgAA3e

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
index 3c5d29941a..c19b025004 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,8 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define LOONGSON_EDAC_DSM_UUID	"65d0431b-7eb8-46df-b914-b7d568553140"
+#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE	1
 
 struct loongson_pvt {
 	void __iomem *ecc_base;
@@ -66,13 +68,39 @@ static void loongson_check(struct mem_ctl_info *mci)
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

