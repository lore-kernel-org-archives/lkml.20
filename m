Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335483;
	b=wbZcFmasyjg7sAiLJ0GKMyXTFiATZZT6WrCqX/HnlgXvTcjBuYDVqj+8nXWNHJrnsyqJ
	 Vqx9irThkXzflvuEZOZyGpcuW1y3OEDVpqHhBJZDo3GQWqFUxhShtcOrMf9JFeC0ZPJJa
	 b3Nne0n6i3WNenKnjgE90JQ+4Mdb0U1w0QzLjGqlCJuj/rbgsQ2kJT7cD6Th15IfCA3co
	 BwYuomIzQA5NSfKadRunmOJyVqTiBn/tanh30okpDyDmKej0iwSYuEOWui4V4uZVmSZF6
	 udZADD/4uWxcyu3TiNX2gQcTY1QIy7AVnMLh0lq1WaYfGkH5onyzGxzeWjKbdzEqY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335483;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=6O+2Z1ZtWvJuSUHcRAVT+UmnLEyg6PTUGrhAWTalX18=;
	b=SAnpJsAIlJbhFI1UWES3C21fzwvS4SAQ3JjnEOl3XCfXdVl+UmcG0V1+ljgWGaTH4A9x
	 e+KHJrbR9/JVhzqlUet3AMyMFI76Sz8Wu7ytKFe4vBle0s3C3nqcxu3K0SrtCaZUDCxX8
	 L/wAVYaP3no1Q18gCumhZ3orARbAsFT/xe85qcflEnzB0o+RyhjOAeaUZD3bNsKH/bhHI
	 0dU6H/Knws5q6dzgHOi1QLZ/oyXYJKe8ie4dJPRgpZuUeFvwPsJoKypNZ0UBKyTz9qKz6
	 85ydLZBGZiyyiO0SiwK4SVlDZltqQobqyNlMrE3FfTO/3SCnKHXBV1zkvI5A9G7VCeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jyrJFCtT;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E554606A327;
	Tue, 10 Nov 2026 18:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E554606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jyrJFCtT
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9D40640E04F4;
	Tue, 10 Nov 2026 18:31:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lfVC8gksxJqV; Tue, 10 Nov 2026 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794335476; bh=lC40kfrhr5Z1LG4gHfBLIwDfmvhgsfT6Y1Q5NuTEgVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyrJFCtT5UWnoAer6YSQXqbd3EXSSyXLO/v3VBb7tEPgGdn/bWuHjB8Lwc4kkps7D
	 mXSax5CotCa9GVMENLZV98Md1VQA5NNvtovwoNfP47U0IjK4oxvkCw13oOpkq18Eki
	 fWBUE7s+eKa0qxyMqgMx+D+ltEqLkjYe8I/WxjNloccFunqEYAyB+kzWFmEEBq3xfc
	 eFnHRsAa03BcmzDxcIr5Kl234NgNqoejvTPT0JWi21kV5WALfrP3mU1U8qoiChdokW
	 Y0jRaqJQYOEniwSsSWovRdn9IlgUfcTbrIvBsm+ZHtAyD2APy7yvpsrfXaD1Hflexn
	 v7KgLTeZ+IbC6nT4CS2pKQRYsTnL/9+MpeMFh8mbKMVLt5I2KGzMBBY/Tt3Zm49r7U
	 Mmxa46C8T4A9A+He9IUPqxwWJSl08jfLXO822v/yJtkVD0OQV8ol1x5LCWRXB8vAIy
	 nqYL53P2ySY+2L5pyF4eFmWQOMyJauNeRlwDvqnwKGML36KjSQHMsR0hLjIiCu071A
	 xIxXk0gjjxLCASc2MNezG4Q3R7Y2jL94ThF5V7CgUC/5OEOIqjRXAeMvuvQKN9UZLp
	 FVVVKgGc9zAU8ka7hEL+9GtxG0yzYpm+rUkEZPYr3l95W6kBIUJXoB085INOjgVje/
	 T7WbMLPXsB1TLML9FSt8++0k=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DBA4740E0299;
	Tue, 10 Nov 2026 18:31:04 +0000 (UTC)
Date: Tue, 10 Nov 2026 10:31:01 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: Qunqin Zhao <zhaoqunqin@163.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Message-ID: <20261110183101.GEavNi5Qrv3eLe80VL@fat_crate.local>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
 <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
 <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
 <20261110080338.GJavLP2h448voZSQRE@fat_crate.local>
 <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn>
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
In-Reply-To: <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 04:23:29PM +0800, Qunqin Zhao wrote:
> mc-idx is not guaranteed. There is firmware that does not provide the=C2=
=A0property.

Ok, I guess you can do something like this then. It should work naturally=
 with
the rest of the EDAC MC index handling:

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 3c5d29941a38..78fa8d87da0b 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -14,6 +14,9 @@
=20
 #define ECC_CS_COUNT_REG	0x18
=20
+/* Memory controller index invalid due to inability to read it from ACPI=
, etc */
+#define MC_IDX_INVALID		BIT(16)
+
 struct loongson_pvt {
 	void __iomem *ecc_base;
=20
@@ -25,7 +28,6 @@ struct loongson_pvt {
 	 */
 	int last_ce_count;
 	u32 mcs_per_node;
-	bool mc_idx_valid;
 };
=20
 static int read_ecc(struct mem_ctl_info *mci)
@@ -56,7 +58,7 @@ static void loongson_check(struct mem_ctl_info *mci)
 	if (add <=3D 0)
 		return;
=20
-	if (pvt->mc_idx_valid) {
+	if (pvt->mc_idx >=3D MC_IDX_INVALID) {
 		node =3D mci->mc_idx / pvt->mcs_per_node;
 		mc =3D mci->mc_idx % pvt->mcs_per_node;
 		snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc=
);
@@ -82,14 +84,12 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
 	dimm->grain =3D 8;
 }
=20
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
-		     bool mc_idx_valid, u32 mcs_per_node)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 =
mcs_per_node)
 {
 	struct loongson_pvt *pvt =3D mci->pvt_info;
=20
 	pvt->ecc_base =3D vbase;
 	pvt->last_ce_count =3D read_ecc(mci);
-	pvt->mc_idx_valid =3D mc_idx_valid;
 	pvt->mcs_per_node =3D mcs_per_node;
 }
=20
@@ -100,7 +100,6 @@ static int loongson_probe(struct platform_device *pde=
v)
 	struct device *dev =3D &pdev->dev;
 	void __iomem *vbase;
 	u32 mcs_per_node;
-	bool mc_idx_valid =3D true;
 	int ret;
=20
 	vbase =3D devm_platform_ioremap_resource(pdev, 0);
@@ -129,15 +128,13 @@ static int loongson_probe(struct platform_device *p=
dev)
 	mci->error_desc.grain =3D 8;
 	mci->edac_check =3D loongson_check;
=20
-	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
-		mci->mc_idx =3D edac_device_alloc_index();
-		mc_idx_valid =3D false;
-	}
+	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
+		mci->mc_idx =3D edac_device_alloc_index() | MC_IDX_INVALID;
=20
 	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs=
_per_node =3D=3D 0)
 		mcs_per_node =3D 4;
=20
-	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
+	pvt_init(mci, vbase, mcs_per_node);
 	dimm_config_init(mci);
=20
 	ret =3D edac_mc_add_mc(mci);

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
