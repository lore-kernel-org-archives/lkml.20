Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B2F40B11F;
	Wed,  2 Sep 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339874; cv=none; b=V8IfD2Ns8A+AbNdjoSIYjQwncgjuvtaZMmU/V4rjitWOPVMgFQPUD9xXAYdE3bDp82WF9ekqa/SdlX3HXmusJhXKmSxfeszYM8B6V+UqUKccrnU/79AR2d6Ntq7teFwlShyTtvD9ub+1rJbpD/ZxT+pR7yO0ByRM1O0jhjVWGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339874; c=relaxed/simple;
	bh=RaRQWBFKMRRd4R4qgmTUyjrpWNDaqtRyHm+JIctTVLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF1vKPsXr2n5TGuQ3wYiZeN/qk35eLVttmqCHAhWAw5fxFQripdZ0MgaITAK0jn9ekIwjkcZU0SNArPMnZkyl/u+dppJjnuVxp9F4GcSSOuTILY4gbP6S59xWY1qCk8EmFWrjlMe/RaG7WFdSytMhRbz99gdsBtOLkRhm4yJIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8CxPtOY5pdqsLQHAA--.21786S3;
	Wed, 02 Sep 2026 17:04:24 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJDxg8yM5pdqsXgZAA--.26394S5;
	Wed, 02 Sep 2026 17:04:23 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Wusheng <wusheng@loongson.cn>,
	Wang Jinwei <wangjinwei@loongson.cn>
Subject: [PATCH v4 3/3] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Wed,  2 Sep 2026 16:48:27 +0800
Message-ID: <20260902084827.2652-4-zhaoqunqin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8yM5pdqsXgZAA--.26394S5
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWUWF1UKryxCw4DXr48Zrc_yoW5Zw4fpF
	W5Ca15trW0qrnF9w1ktrWUZa45CFZagFZrWrZ3A3yrWr9Iy34DZrySgry2vFn8C34FyryY
	qw1rKrs7CF4UA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
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
	KfnxnUUI43ZEXa7IU8EeHDUUUUU==

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
---
 drivers/edac/loongson_edac.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 8946c90b0..605320b81 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -27,6 +27,7 @@ struct loongson_edac_pvt {
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
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
-	pvt->last_ce_count = read_ecc(mci);
 	pvt->mc_idx_valid = mc_idx_valid;
 	pvt->mcs_per_node = mcs_per_node;
+	pvt->valid_cs_bits = valid_cs_bits;
+	pvt->last_ce_count = read_ecc(mci);
 }
 
 static int edac_probe(struct platform_device *pdev)
@@ -127,7 +139,7 @@ static int edac_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mcs_per_node;
+	u32 mcs_per_node, valid_cs_bits;
 	int ret;
 	bool mc_idx_valid = true;
 
@@ -165,7 +177,10 @@ static int edac_probe(struct platform_device *pdev)
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

