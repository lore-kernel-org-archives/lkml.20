Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292888;
	b=lus//39o+7JnpyUHYkcvzHXANwbFYFarDSoF8I/Kkzl2i2gNWqfZf4W9OsG8G8GmtUl7
	 8TG9z2qQmEAHEY5PoYTnFdhd3OG9FZ1E1a6edUxOtPdOHFP1FXqvk5EaNn1eHutdNFG3k
	 1cGhcwucZPYoTYEzYr3bGelRJP1QB4azpwQ8ZJre0+i6nbgXwEQfcoagQeNaei0l4elE1
	 aWwCSUMVvpu38JnlO02/9epdukyaKK7kgcareIOOBbp5D+zzRLIKOkoIka1cktIu1n32s
	 N73DJZaG6SB+hm70mLoyqpzuIG3PHyJRRpyu+jwqsIsylNTsUoh4k037xtj1VxzWeyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292888;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ae9ZD6+EtZ4CobM3+GjeU2lLPLI+KHhFVN0IzX9DVTY=;
	b=5SBY26xWR88SMDDkNQH6HU0zv8t4fgLSrNiVr4DnGgqL7qbQOBTUgCWMq8ZSVQRQAOQj
	 YFnzbL6pi9biXQFOFzCJ0mVXgM9ocL4omsmyAdW6VjuJwckJ03aWMe5jfvaTnYCeITK6M
	 hg2gjgTMlF7NtXokoi9Ecw1ycjEa0UHPTIi1i2RH1bhkANEiu8i+8aSly8oiTPISKuEY7
	 WXjcuIZ55JgfMyK1Cx5o8gQHtUz5JrjYIndK9g+LUAqAbc2ZTrGWKx3Y7/ukp7hxfsrO/
	 19CNNIGv3PbmY4HfTAHLzpbm05v/rLWZscUCuFTcQcFcxbJ4vuGBQCsfh4FTloVvIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=cfApXUgy;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD2606A647;
	Tue, 10 Nov 2026 06:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27FD2606A647
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=cfApXUgy
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EBD1F40E0255;
	Tue, 10 Nov 2026 06:41:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8zk_0u4lhtqD; Tue, 10 Nov 2026 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794292881; bh=Ae9ZD6+EtZ4CobM3+GjeU2lLPLI+KHhFVN0IzX9DVTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfApXUgy00Y4NI5dn2KbGTnj6CmqeOAmqBNhcJjoOzidgWwjNzebgMmj9VGoBqoVL
	 VOetxjiJAlxTxbJ43S9QN2ijTW7R4Yqc7gcD88TrAl/vnp5O+sgNkCK3y2DoTFgyg6
	 F4FDii4kDx0ZNxZWaQ/GPOzIeWzzD9IAM+GcZDjccmDgQ4v+BmM47Lz3LWFSpZi1TD
	 722JoSKbCcvET/EyBOztRh7hhfbFHGhPxPODf0YbJky2Xx3agPdLO9VABJ6+Ed7tGJ
	 8F5LkawkJb5W4v6zeXqTaTdylqe2p6ffT4tX/nGRkiwdTovG1ncmS2Qbiy+wyRjmyU
	 p7HUfY1xqRWuOmWK8SknDEGej5ULhT/nKOqKqwkbJB0OLFaFllgacbiynyocEjeH2X
	 sGxu2qrtTHEX1iPa4AibJGnGFSwNd1obyp8Gy07qNZetwyaKEdF6WfHL8+5FStk1EU
	 gTfM+CVpJaZ4cil3dsqf8b/tuFg3PiIbYEtBk2kSPJWBpqZFdkCFssJZxQTCwkQ7Wz
	 YpFAUUHYG+w/tK+Iq3Yf53mDCyBLyE57+LUUJIrZKNdKLvO91HZlGa6duEPl9JZXTM
	 E+K/GU/bDbqXiLdi+oogtke1g8rhLe/sHZwC9GzQPEkiKCbTGSpqQ4wFZv5GtsTTrt
	 xxyEm0+Dn5jCt5NRtpIk2bCI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AB10640E0299;
	Tue, 10 Nov 2026 06:41:09 +0000 (UTC)
Date: Mon, 9 Nov 2026 22:41:06 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Message-ID: <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105025532.2055-3-zhaoqunqin@163.com>

On Thu, Nov 05, 2026 at 10:55:30AM +0800, Qunqin Zhao wrote:
> From: Wang Jinwei <wangjinwei@loongson.cn>
> 
> On Loongson multi-node systems, memory controllers are distributed across
> multiple nodes. Encode node and MC information into mc_idx so that sysfs
> entries uniquely identify each controller.
> 
> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
> If not, it falls back to edac_device_alloc_index() for legacy firmware
> compatibility.

I am still not buying this tinkering so lemme try again.

If you cannot read mc_idx from ACPI, then by lack of options, all your nodes
belong to memory controller 0. There's no other choice.

And you do init it to 0:

        mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
			   ^^^

                            sizeof(struct loongson_pvt));

and the subsequent property read tries to get it.

So, IOW, your MC index is only valid when it is not 0.

IOW, this ontop of yours. Completely untested ofc.

---

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 3c5d29941a38..2132264a6d7f 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -25,7 +25,6 @@ struct loongson_pvt {
 	 */
 	int last_ce_count;
 	u32 mcs_per_node;
-	bool mc_idx_valid;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -56,7 +55,7 @@ static void loongson_check(struct mem_ctl_info *mci)
 	if (add <= 0)
 		return;
 
-	if (pvt->mc_idx_valid) {
+	if (pvt->mc_idx) {
 		node = mci->mc_idx / pvt->mcs_per_node;
 		mc = mci->mc_idx % pvt->mcs_per_node;
 		snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc);
@@ -82,14 +81,12 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
-		     bool mc_idx_valid, u32 mcs_per_node)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_node)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
 	pvt->last_ce_count = read_ecc(mci);
-	pvt->mc_idx_valid = mc_idx_valid;
 	pvt->mcs_per_node = mcs_per_node;
 }
 
@@ -100,7 +97,6 @@ static int loongson_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
 	u32 mcs_per_node;
-	bool mc_idx_valid = true;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -129,15 +125,12 @@ static int loongson_probe(struct platform_device *pdev)
 	mci->error_desc.grain = 8;
 	mci->edac_check = loongson_check;
 
-	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
-		mci->mc_idx = edac_device_alloc_index();
-		mc_idx_valid = false;
-	}
+	device_property_read_u32(dev, "mc-idx", &mci->mc_idx);
 
 	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
 		mcs_per_node = 4;
 
-	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
+	pvt_init(mci, vbase, mcs_per_node);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
