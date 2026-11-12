Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469021;
	b=p4qi/jmrRRY+D9EORuPu3wOIwcSXgKBKL+OQEagXWmq48wrQOhrRgKrlfQsvzx3r7e57
	 50MH7cTgk3A2OdE/kcsGuRj9Gymki1IfUmiO1MsR4Bu6WJBvdT97Hd99AlSBfu13kRgvb
	 ooDSDW6hhm/0cjcZYvApsUvy1qIMK/a1g6kjQAjmnWLhmpWb27MPxz1XIDdyyWx4SLcd6
	 bbSMGg4w3vZ0U/IJFExrxUxLKj5SyNQd77G+3SFeLyOE5VcgiFEouAuQ1HcaPiab0q2Su
	 2dPtbKDwKHyn3e+DbaGLV+5byS7KCA7Q4D2qnE9b2utiPR2ED1Psl18uRvriEOOB9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469021;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=BNlbXj4myEQl9D4QxNd0FjgoFzNKFTReth511L/Q1es=;
	b=vtQk1Bk2KrGRIxibwbUYPAbtAstw/JsgDG7xhwDuzMGrSBxI5xv3N4Gv5SvQz0B3jbf5
	 RmRLpstwIpVooPBf/8b08QzaAnusYg5N6SCsc1eogMy5GWLrHEh5rWtRfsmQv2pmx6LiS
	 Qt9WZMBpcid4X/s6VU+G8wYYDR2QowvTIlWy6o/DfJDO9Tf2wJujoiwhayNHSjwiIMkm/
	 qi3dI9w3Vdgmu3aLbRTGXnyfcL6wFGW//Dw2RejAe4zEF4/FkkrCyKU+x2zgT6su3h6jw
	 vOQH+Cli7nC0oTJe61D3O8gLVh7eyFtusndd7nu8rSTQ3dPYhjqMnjHaaDxDwi0r+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UYseDDZl;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8F606A31C;
	Thu, 12 Nov 2026 07:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D8F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UYseDDZl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BN
	lbXj4myEQl9D4QxNd0FjgoFzNKFTReth511L/Q1es=; b=UYseDDZlMGODcp/ZS1
	wtBt68ZsxZtJm9+/TKJndXISRXnj7sGA/BZakLFIhUZNUgOoBxc+NotkN+LtEJU8
	S4mugwedOyGEYxNpxK5JeImVEVnG/PL4YlisiaSBcbNul8gVvOjL06n5hh+Irdom
	jMn1otPkJvsHOgN4hYwxq94go=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCHaRhtbPVq_SySFA--.53017S6;
	Thu, 12 Nov 2026 15:36:36 +0800 (CST)
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
Subject: [PATCH v7 4/4] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Thu, 12 Nov 2026 15:36:11 +0800
Message-Id: <20261112073611.25770-5-zhaoqunqin@163.com>
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
X-CM-TRANSID:PSgvCgCHaRhtbPVq_SySFA--.53017S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy7GFyUCF45Xw18Ar1xAFb_yoW5tr4Upr
	W5Ca15trW8KrnF9w1vyrWDZa45CFZ3tFW7WrZay34fur1qy34DZry5WrW2vrn8A34Fkrn8
	Xw1rKr4xCa1UA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5R6wUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7gRUk2r1bITnPQAA3A

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
 drivers/edac/loongson_edac.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 413ca654b4..831111fa6f 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -30,6 +30,7 @@ struct loongson_pvt {
 	 */
 	int last_ce_count;
 	u32 mcs_per_node;
+	u32 valid_cs_bits;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -39,11 +40,21 @@ static int read_ecc(struct mem_ctl_info *mci)
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
@@ -112,13 +123,15 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_node)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
+		     u32 mcs_per_node, u32 valid_cs_bits)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
-	pvt->last_ce_count = read_ecc(mci);
 	pvt->mcs_per_node = mcs_per_node;
+	pvt->valid_cs_bits = valid_cs_bits;
+	pvt->last_ce_count = read_ecc(mci);
 }
 
 static int loongson_probe(struct platform_device *pdev)
@@ -127,7 +140,7 @@ static int loongson_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mcs_per_node;
+	u32 mcs_per_node, valid_cs_bits;;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -162,7 +175,10 @@ static int loongson_probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
 		mcs_per_node = 4;
 
-	pvt_init(mci, vbase, mcs_per_node);
+	if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits))
+		valid_cs_bits = 32;
+
+	pvt_init(mci, vbase, mcs_per_node, valid_cs_bits);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

