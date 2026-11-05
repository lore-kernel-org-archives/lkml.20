Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847382;
	b=jgxR74x/9qzGbbH9j2tMjH2rH4qC1HD5O1W/Qel5kMJqyIMrO28Gmu/NtacCyVeAWiDf
	 lxB6MzT0DHUpvg9/06kfLzF9S78Dxqte1W6HEyDyUxUTSdTXrvAgUI7B9tgAg3fTU2Q0g
	 lpvlkltvdSMhBp+T3nsn7ZvDDdm7qF5QWvq/h6QjEwvRH9EtoNxZF6IeyNQvvoGzLQUVa
	 AlCca1ipZEPvfOElM5y85xxOBl2nSTXehLgs5CucjUbUCYfp+bFu8zR1ec0DWwzz882G2
	 OpX7mZsCaeivPMWbaBHCxgnEOURbGZG+24DCn4OGlZg/9BuVvEGEAvFyxHyNfmIK2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847382;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=homTZI+6uxBvAHqxiM6mH0I0hG0/U8SZI8MJlOi/WMw=;
	b=JA4F+k8PeE4xgzHbdz/6cGSDT2jUaNEQpOgiZZks5cpUZBZdDadDFkp+53iw3UlvcqIq
	 ydarJbY9Anq0ddyPCOkljFrKh3G5dsCx+Uf2zIfzqhTUMDN5+HXX38TDR1ae5XR15L+Fo
	 IsHIBGY6EzgQSaE91aLczZkFLw0mgq2SJPBxt+Ndb1Y8KInAUPUe9jYb45phKgueck0iQ
	 FD5pRC9cFuXG2/wHRkKFtI+IUsocgH/P6qQc4AcgVybP0lziTRXeB82wWHxQGPZFJLr0S
	 HH1J4wlwgeCZ+q5/7G8As3Ou9OSffyI/QrzRt9fuaHpUcawgr/0fsnJGb3xWvTqz5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MrkKiyr9;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3F606D806;
	Thu,  5 Nov 2026 02:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA3F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MrkKiyr9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ho
	mTZI+6uxBvAHqxiM6mH0I0hG0/U8SZI8MJlOi/WMw=; b=MrkKiyr9S9pu50iCwg
	V8HHdsR9R7WBV1xoDJ9Ak5biGthLPymSowRDjue5p+oKGnpuz3/t0hrd0FV/2eks
	X9I4lTN5wlNSjTQ/R4E3PaoV5cRva91O6Ii70HBcFkpDsZBQSj510pgPrzx8Ytdq
	OBI8qHk0jUe/qcae1nPP51f78=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v14m8OtqcGAKFQ--.12622S6;
	Thu, 05 Nov 2026 10:55:59 +0800 (CST)
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
Subject: [PATCH v6 4/4] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Thu,  5 Nov 2026 10:55:32 +0800
Message-Id: <20261105025532.2055-5-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD3v14m8OtqcGAKFQ--.12622S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy7GFyUCF45Xw18Ar1xAFb_yoW5uFWfpF
	45Can8trW8Kr1q9w1ktrWUZa45CFZagFZrWFZay34rWr9Iy34DZryagr12vFn8C34Fkrn8
	X3WrKr4xCF4UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5ID7UUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7R-gIGrr8D9xnAAA3R

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
index c19b025004..4f79c74cb7 100644
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
 
 static int loongson_probe(struct platform_device *pdev)
@@ -127,7 +139,7 @@ static int loongson_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mcs_per_node;
+	u32 mcs_per_node, valid_cs_bits;
 	bool mc_idx_valid = true;
 	int ret;
 
@@ -165,7 +177,10 @@ static int loongson_probe(struct platform_device *pdev)
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

