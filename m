Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450689;
	b=42atORCujAWA8PllfhQlRSMeTaSzY3Ejftj9NVQL1A8HC90jIb/dcwwZmbAHJun8IIMD
	 goidaFPCPbYifgcULSV57HsNK01JjDgmalIc7ch15og6LzfA3lIHgrEXha8BV/ABEtkTm
	 tobyFkmuNHz++AN6HSXAs2Z0WR38qCBORzFJjWlF6x9NIWazQGGAWHG4bnUTJfH5of5k5
	 bCi6rY2pHZ2ox2fS4Br9WWY81btxrcfWgbXjx+fALNTRmxVEB+7jRhEuWLe9Dtz2WuQGz
	 lgCLAzF5lNyCH95KAys0A++6XkYHwG3b8uE5Cl7zu4FcritOFtAKlWgMGGcqOuKY+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450689;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSYYKqvNBHQRpRXqr6rKxOfnsA0fN/waXWV83fOGwXE=;
	b=nj70WhBrb04svbhd07El4p9aCAA3zWw76yj9+yekPrmel6/x7jDzqgSzcpf98gE7bEHh
	 e+WVB7on6++I75ST+QOjqbT3N++Bsp5zVJX8jiObqw2iD9lkVr4KAzGduXvnV8jldt+W+
	 IRzb+HGJlCUJwEEXHjyii59hL04WgQeUev0rO1mOyxqOtXZsaKSvAs62xlj9048EkL2DV
	 vGKDXDsognW5JTBSWoRRUONOmEtqrX8PyxpwWJyoGp3sOq12e7F1wA8ADTDRt+1PWSvpL
	 f5r9IfyyO66I5ftclprmf/FsJoNvk7b98i0aPZ69iQK7Iz6hbfwYxYrWO2noxvRqycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ELpIaBJp;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0405E606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0405E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ELpIaBJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ELpIaBJpKA9J7AdD2NrAn+mvJYewlQpidOK53oTm3s7AO1Qt4pudeJZfGiVrr4C6sItXD40FChFuP
	 c2u6Xh6hsgwucdOx9YtDJnx91RB7aly0D8+xEapgjWG4k1m8OCk2w6hjlMBOMwNoqT9OlzXKvnneGA
	 hO/ZuC/eTcMScZO4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af524ff6e3-a9422;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID:2ee66af524ff6e3-a9422
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af524feafc-eee32;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID:2ee86af524feafc-eee32
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: wens@kernel.org
Cc: jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] soc: sunxi: sram: Release node references when claims fail
Date: Thu, 12 Nov 2026 10:31:26 +0800
Message-ID: <20261112023126.118228-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

When claiming an SRAM region fails, sunxi_sram_claim() leaves the phandle
iteration before it can release the current node. The rollback loop also
parses each previously claimed region without releasing the returned
node reference.

Put the iterator's current node before rollback and release each node
after undoing its claim.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: be99eb936b4f ("soc: sunxi: sram: Support claiming multiple regions per device")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2ccaeacf8c70..4667661b2003 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -294,12 +294,14 @@ int sunxi_sram_claim(struct device *dev)
 	return 0;
 
 err:
+	of_node_put(it.node);
 	while (count--) {
 		struct of_phandle_args args;
 
 		of_parse_phandle_with_fixed_args(dev->of_node, SUNXI_SRAM_PROP,
 						 SUNXI_SRAM_CELLS, count, &args);
 		sunxi_sram_release_one(args.np, args.args[0]);
+		of_node_put(args.np);
 	}
 
 	return err;
-- 
2.51.0



