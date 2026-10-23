Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747498;
	b=OgyI5r46KmGd7+pB0zzvl7dCJ4ziHaxqklyK8D7I1DU7MXBjZ50L5bMV31gwu8QBTOvM
	 9yeY/oaWJAlpfktrEPOsbuOmaTy4yB7v4bxtAXOeIYb+UI0+Nujv1uAazBYISQpXFXQqs
	 GXuuMrf9dZ2LCwe8FR2VZl2Ug7hNPr83w8Qqg+5v7x7LvYT4M+QxInndO4j1KO/9tdQfg
	 s49hxGYWCO0aQ2iIZhO9O+izISo+d1/IHo2AeMaEsE5lfKapJRaxmpgT9hPyt8xesaFcf
	 D4G2vyMJkrSXLcYOjmZsyFHvWCIXBGNF5O1NJxBGPwT3DFcrOWvXfB3KphqFDUZQFGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747498;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BL7WTqlyAuABxLMGFYeqZBZi8m9RhMdcDsbXwZkbTyo=;
	b=C/P1S5Etrr9wnd0BCMchmCA8WZLOEmmjceD7EQkr6E/cILbUZ6cRA9m5XBQhv5qAjs37
	 rUwGqqm1Y5UAZrtDFkpBNFSKkq5WD74CTA4k9NVUj93cW1eFhd1B7iuHiBT3u0GN931I+
	 R4IbULc57z6Ix1xcARDLC+xr2K3PjRvoDfvq2VkrIrs4aHWRuGWPSf3bSC1pqwMJ2S3Zj
	 cAJwImIvaNZjTyPKkRf4n3lHHRDSAtj057+X0Nw6zEnvamXddPkyIWFJkwgVOJvXrEVMw
	 kOHc5J54+ctYHfOE0swwuSR8ztjuBPabOCTGICypqFZuWD5gyoLIjrPgE7cc8jptzdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Jm7MsM9d;
	arc=none smtp.remote-ip=162.62.58.216
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EF606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Jm7MsM9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792747488; bh=BL7WTqlyAuABxLMGFYeqZBZi8m9RhMdcDsbXwZkbTyo=;
	h=From:To:Cc:Subject:Date;
	b=Jm7MsM9dJ1Z2eZA8HSAoHklHX7dJJuhWbzeL9UxBLM/FWa02VvpKgE8ASlN6pzFMG
	 JzM3vLrjXAKne1lTu+5AR56le/qQoT8bliNaFsJnPf37PWTcJor9JWDnMQZ1G2vRT4
	 38md9xLY9otB1rGX/BlQcYFpPfXF5ekxJzE9bCb0=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 62E256FD; Fri, 23 Oct 2026 17:24:46 +0800
X-QQ-mid: xmsmtpt1792747486tffp7h4dp
Message-ID: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLcB4XdZEN2saK1lBHpYhsukBkey5CE/1hbH/SkgAQPijYkX+omo
	 znx4IFyVogVUimtgm8rw37JbX8ii1DODcz8JRs3vgT1SU6Xdan5SE3lFj/XHzqiLQonBCUYoI54Z
	 WwMj2VzOEnamAeKtHL0IFnRMljKpNOHDY0AsVsHGzOzenD+YI9o/7t4xGIxfmaKDZ1Tn6y/rXGY8
	 03WHL31bv6Ccpk0n70D17xvo7MmAVmRer2o6xJkIj4DrHyDbQ4qNeUMuuxMl/S9/AZstN1KN3Y+S
	 OGETsCtoL2eja2s1vFwFnEDK6DptQ8JHc5Vt+iydY1+QoVLQGxWOA4ku1/LqCxAww7wEdm3o0l7V
	 XWcjLTRdErVbqGZvXnqLSQpWbsKngElz3n7xB0oqj9ytzCmelOrlO97OOU9vKTUFc48/qqR2t2KR
	 8lWNYQiTH1at7bmhWPOBGUHzriGMHM/wOS0bvNKDWlTz1QLi55YxHuN/dJm+VD8+YKVNOm2C5Cam
	 lMTQbJpWGXmTBhLeOvwWQm2TwfQW9qh5Kd9/6rBR6jCNKcYLZjoHEYuZM5OCl8ggT24uqmuIi/Kh
	 pAcpujwriM+YL1BFtNms77hPAIFpawrbziuL9LZ1U8tn50rLqW1zQcPKQZNnn2dY8jYnKFA+2Xve
	 yWkUOAYWB3RrKv3wmmL3pO5ob7Qke+LOPK+Vxtot1LQhR6jVWYkkH4dnXADwsjiukWsWcScvwzFu
	 zvn7ljb+NFOzhCMpiafSWedsAPGaNo/KlzjGADYm/4YXPcppTyvSYAivZCrUnuFfd0QB1Hu/DT6Z
	 g8xRq75Y/HdpD7jrlKPr9Te2sjMu3pAXAuNhrKC2v7i/XPyvea9CjY3KFBjyR+KIbL6DQ2WVRfdZ
	 wUhSgigl7ch+SWzxTIYAksqOKRZDr0YWck/68LS/WhSYPFcm8OPSO4KtBBEVF0XcBWWR3vi9NiuL
	 OFpZqwi17cR3E+S4lD02AdERYaX9PISm4biJOQGBaqvzIVmET3WBa9l3D4ZkCUDoBvh5teBtGChc
	 9e8jZJpxRVT/Bs3T6z76wXsEt7DhlGk5iclEBJBDGHJJiSRw5L
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Date: Fri, 23 Oct 2026 17:24:45 +0800
X-OQ-MSGID: <20261023092445.3969055-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

Drop the else branch following an if that always returns, and move
the trailing comment onto the fall-through path. Cosmetic only, no
functional change; silences a checkpatch WARNING.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/spi-nor/swp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 235070b21..3b8176b9d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -135,9 +135,9 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 	if (locked)
 		/* Requested range is a sub-range of locked range */
 		return (offs_max <= lock_offs_max) && (ofs >= lock_offs);
-	else
-		/* Requested range does not overlap with locked range */
-		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
+
+	/* Requested range does not overlap with locked range */
+	return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
 bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
-- 
2.43.0

