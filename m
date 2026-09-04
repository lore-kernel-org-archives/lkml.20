Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA534751B;
	Fri,  4 Sep 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527297; cv=none; b=YMVIBDoqSPUCjnWuwmlogYPV0F9Nn7CYWmb95Bk65Klbo/THTpSbd4msbyQG4PoaRUpZppNihBWc6KHoCyUxEqKiHb37KzIj0kY9ogP8IOKPR10ZMvYOLVqkcg8KSW6ZEAFH2hRAJV3EtF/Xxr4hHz2kB1ZC/hJWZCFzsKuQ8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527297; c=relaxed/simple;
	bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2S52vJJFG8cz8rAM4b7uYRUvjIy8IzAgEEYo9/EHwPoY9ez7G1qxI94EUHQIjAwp59Fy8e0Cb5yiVgPP37oODzIIV40y6h2LDfxPVCAmB9r9XzxbaqC7f/QL9Rb/UVHx5oAwDt0JOipdzCWVfEvv7+JSjDBWci3t0zXEIw1n5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hZVG1bDb; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=VT/wrtv0; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hZVG1bDb";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="VT/wrtv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527286; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZVG1bDbc+0sWsWG6sacD2q0Cl5sQwgrjB9zS5R+AxlDIx7FHFfm+yc8CoRt8bDQn
	 En5kvOtTgwCI7MPQ4HnkWufJS+MSwBIqQ1GJn4a5Zp2Rv742HOE4/t/p6fCZMUiqOS
	 9u4U51rDIZQrCSlyKoJOFr8U7D6YQ+Vgzyo+rMcDPFILy+WqnC09ljoyZ+z7me5Gpy
	 kUd103OYA3OBqGBipiW19TytfVwb/2K8ImVWafS6ZoCuh8cm8JWTLdAXlk3gGA7kZD
	 ra87wVdTmMxsmkJb2Kit484CCrd3vJOdb7paYUh6T+p6AY0LN/6E9UGYCEsLzZTUom
	 gvElJZOE9m1uQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id AD7F441478; Fri, 04 Sep 2026 14:08:06 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527284; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VT/wrtv0uHcVAEaGUwrODXnuD76cfYzIQxwLL5GNf+FSe9JdQ1LDTj7uxBDjL0Rhr
	 Dg0zc83A4z/9F5Qc+wUIwmoiwPeKurGiiXIg3VpIYbyPrc6KYA3CFg5Akp2zLxYtZx
	 JUke3gFGMVCTVmEEsfUhZeYSiGvg5mnmID/C6Luj5+XAN1ah99zcjUNLmuBQsHxSEP
	 0pvfHK6SL5TjMP4Ly8Ra4hA6D3aLTh+zvuAzgiEBsPcHAQLaOU/cGgsBux+Kk3QgV8
	 RNxgFYtTapj0ZvT7VvVtirWL+Acq4Sp7LPmOI1OWWsa9/BoLiP73WTKRmQu0VYEO2n
	 V9p3zSldenaHw==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 483A241456;
	Fri, 04 Sep 2026 14:08:04 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/17] media: mceusb: Remove unused field
Date: Fri,  4 Sep 2026 14:07:42 +0100
Message-ID: <579114bbd1fd1a107802579d1edc6cf6b51131d9.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mceusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 39ba7f6a2549..356a54f91d05 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -484,7 +484,6 @@ struct mceusb_dev {
 	u8 cmd, rem;		/* Remaining IR data bytes in packet */
 
 	struct {
-		u32 connected:1;
 		u32 tx_mask_normal:1;
 		u32 microsoft_gen1:1;
 		u32 no_tx:1;
-- 
2.55.0

