Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006065;
	b=3Qg2Uuz90ptqvyAbCFN7BQgtN7fkpCA4EETb9fjCeOtK3mC7wcZxFrXQvnv17fq0BhhP
	 gEIFUNmWJ2sTH3ZKlEE32CwSbJZDS+joMe8/URUjxoc4Ls2hSp28wTY8h5e6H6BiHpDrC
	 tcg+hArG9QyzxA1hJGbneY2gdaT3sJ3PrAA07xGmihjCulQHp1MfpuUN/wQUaamCc/iXz
	 1z2mZQz1E3EYW5s7s8kwOtw8VTQA8r0OKBVQtkBl0vDaLQudf8Im5FCoYEsRpvommOkLP
	 VlXG9USvZUIDtPIV4LaIJYOMssi5+MnAuHTlk2Vr9Hr1Sxpxvdk+QM5sDrTgeC36vbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006065;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bwsdZw0/JzbTp7fNB/am0/APd5GfUL8IVr8c+H1Agpg=;
	b=JfENZratgeeUoks8LgzWITnX13w/yg46N+tQhXf7uM+HcTKylkXz43+BHVnu6C0kCjq3
	 /WIHqc+dACyxisixr9W3RGindSKbMNIrVFAj8BgPbmRSIfbolM1FX4PoRuFVekFN39CNZ
	 nPozkv0aa9YAsOKbG15uDwAAd+GAb/AgyP6E3DCL1p+NgFhIrbCU53it8HpjJ0v8vQ5Xa
	 cL90g0Wby1m8ZItBle00wjM3C/0MYY+5Gr75YzJ2NyevFoFBdYs31ZDGVXjrRU3skwgQ6
	 aGGjqIUiXBcG2RqRJ6Q5nCc9gwGRGF3xCbGjSd02z11f8Uh9aBgCOxMYLdTUDdxUC7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CWnPq8c2;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51129606A325;
	Mon, 26 Oct 2026 09:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51129606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CWnPq8c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bw
	sdZw0/JzbTp7fNB/am0/APd5GfUL8IVr8c+H1Agpg=; b=CWnPq8c2jVPXRTFXZ9
	y/CjUH43xo0G2IdLnS83eqVFTIHmC7U2Y2HWpmqaoboB3xcLwhkGpBuzgdSsrEIo
	adFBdgh6qUjxr5Nq+5cF6KkWAdwWWHadZTZtBJHPqWE/7IG3GSsrIUIszbQkykBy
	GvgMYMlUl+aeJyh7AvKN0eyCs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD332jHGd9q4hmLCw--.8486S6;
	Mon, 26 Oct 2026 17:14:03 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Wusheng <wusheng@loongson.cn>,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v5 4/4] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Mon, 26 Oct 2026 17:13:32 +0800
Message-Id: <20261026091332.30226-5-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD332jHGd9q4hmLCw--.8486S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy7GFyUCF45Xw18Ar1xAFb_yoW5uF45pF
	W5Can8trW0gr1q9w1ktrWUZa45CFZagFZrWFZ3A34rWr9Iy34DZryagr12vFn8A34Fyr15
	X3WrKr4xCF4UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5NVgUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7hsPTmrfGdvtRQAA3r

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

On Loongson 3C6000 multi-node systems, when the EDAC driver running
on one node accesses the memory controller registers of another node,
the read operation may timeout and return random values. This causes
false CE error reports because the random values in CS0-3 (low 32 bits)
are misinterpreted as valid ECC error counts.

For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
count register. If the valid-cs-bits firmware property is set and
the high bits are non-zero, it indicates a timeout or random value,
so skip the report and return the previous count.

To avoid undefined behavior on 8-CS systems where valid_cs_bits=64,
guard the shift with a bounds check (valid_cs_bits < 64).

Signed-off-by: Wusheng <wusheng@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/edac/loongson_edac.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index eb240e418e7..c3cc5642f98 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -27,6 +27,7 @@ struct loongson_pvt {
 	 */
 	int last_ce_count;
 	u32 mcs_per_node;
+	u32 valid_cs_bits;
 	bool mc_idx_valid;
 };
 
@@ -37,11 +38,21 @@ static int read_ecc(struct mem_ctl_info *mci)
 	int cs;
 
 	ecc = readq(pvt->ecc_base + ECC_CS_COUNT_REG);
-	/* cs0 -- cs3 */
+	/* Discard the read value if any invalid bit is set to 1 */
+	if (pvt->valid_cs_bits < 64 && (ecc >> pvt->valid_cs_bits)) {
+		edac_mc_printk(mci, KERN_DEBUG, "ECC read invalid, skip: 0x%llx\n", ecc);
+		return pvt->last_ce_count;
+	}
+
+	/* cs0 -- cs7 */
 	cs = ecc & 0xff;
 	cs += (ecc >> 8) & 0xff;
 	cs += (ecc >> 16) & 0xff;
 	cs += (ecc >> 24) & 0xff;
+	cs += (ecc >> 32) & 0xff;
+	cs += (ecc >> 40) & 0xff;
+	cs += (ecc >> 48) & 0xff;
+	cs += (ecc >> 56) & 0xff;
 
 	return cs;
 }
@@ -111,14 +122,15 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 }
 
 static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
-		     bool mc_idx_valid, u32 mcs_per_node)
+		     bool mc_idx_valid, u32 mcs_per_node, u32 valid_cs_bits)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
-	pvt->last_ce_count = read_ecc(mci);
 	pvt->mc_idx_valid = mc_idx_valid;
 	pvt->mcs_per_node = mcs_per_node;
+	pvt->valid_cs_bits = valid_cs_bits;
+	pvt->last_ce_count = read_ecc(mci);
 }
 
 static int probe(struct platform_device *pdev)
@@ -127,7 +139,7 @@ static int probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mcs_per_node;
+	u32 mcs_per_node, valid_cs_bits;
 	bool mc_idx_valid = true;
 	int ret;
 
@@ -165,7 +177,10 @@ static int probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
 		mcs_per_node = 4;
 
-	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
+	if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits))
+		valid_cs_bits = 32;
+
+	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node, valid_cs_bits);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

