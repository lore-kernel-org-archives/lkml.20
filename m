Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051044;
	b=A2fPqqUmnFp6nFpGzMLAhZEGweRthDI5gZgdJQzBZP5e9GNz82WHcoamNQe/stM68Kkt
	 fbXUcFIAO6sq2nUl4RwC4cDSh8PqyVPeUzwmxf0Zf8aRqSnx2DMNx7s4HrwLG36GdsTIu
	 QTfvNwzHX4Dw7bWBmNkx16uS5RkfGRFx17iBWtRttGDR5QhHcJXNrNTKhD1TE85V32xbI
	 qV6M21xtb9utehMCP7s7s3CkzxKb15tyoY7BhwMamd/P+7vwyZ47lFNK0FKXvvuS/6/PI
	 23g5xs11eX6cxzEG5oT4QVvyzPt+AWUSZkJaJBlKO43ssvfLQhn74IkrkmfXs1Xf6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051044;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bBSmzoC9zf0w0tTfv2FTR+uUc7lLLgRLhJJHIPBEE5o=;
	b=Icc8onzl/AkjYVStwLvZWFRCwutBRVQjjgJRckPWAcbx7T2SXFMIk1QDgcuHk9QRi5Gs
	 OXG75gijNv3SR++iDe/JrdbhTVDYMXTVM7ixcGc80eFXIiL4wFxmyw4d038LW5XxATXwY
	 EgVA25YZ9OZyjKzEgjwgubhCOeyLRN1fHGCeCnksGVJ2LH5TrmwJWEB5vrsiRvylIs27m
	 duR9NRL1JCxogbpya9fl42QAvKC88irRfsy0b2FU/19jRS+5yA1grukbNjDQLit7SSW2U
	 6t2aEceLBt1Ice9BzTVpexHi4spnLZIV95rSYpsa5/lm3Fu2GSW8sZLqUxFSibQpJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEU9XLAv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455F5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEU9XLAv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023851F01825;
	Mon, 26 Oct 2026 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793051043;
	bh=bBSmzoC9zf0w0tTfv2FTR+uUc7lLLgRLhJJHIPBEE5o=;
	h=From:Date:Subject:To:Cc;
	b=ZEU9XLAvPyQwVMALWaWV0BMLQwz0NOPAqF+WadXVeM2c5JI+60qhBMvMQX3yiN6yZ
	 FwVDgZntCpxVMJwnEE5XmoY+4Hs0BxEhFS1TEDo5ToKtoRdYEgbc2s0RvsRp7RwaHG
	 Ochj+mne9kaev/bXCt1nYfTCVOIEezvLI2DTUxYxh0DFrJO+6I3TOpJSTNfWw13yBC
	 HUi+4S6Vms1Mw/QQk4rK9wjI9BpUfqlFFednSsyYGHB5zQFJJLgDlnhtCsUAA4d/6d
	 HXNRai3BcWoH6AzQ1BxvFoXf8UmkmPUbuYtyhtsax3RxZsI5WTYu2wIJh8WNOOwVac
	 oM/W3xYBIpM5A==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Oct 2026 21:43:29 +0000
Subject: [PATCH] regcache: rbtree: Restore async flag when exiting on error
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-regcache-rbtree-restore-sync-v1-1-2ef0e9d57ec6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAILJ32oC/yXMwQrCQAyE4VcpORuwFar4KuJhN51t18NWkrUop
 e9uqodh+C/fSgbNMLo2KymWbHkuHu2hIZlCGcF58Kbu2PWtjxWjBJnAGqvCD1ZnBdunCJ8CLjH
 1IimeyYmnIuX3j7/d/22v+IDU3aRt+wJ/UJGVgAAAAA==
X-Change-ID: 20261026-regcache-rbtree-restore-sync-3ae8bf6ccfb7
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276; i=broonie@kernel.org;
 h=from:subject:message-id; bh=awr7nigqQhZRV2s+mbFQZycBKzCWVmNR7YWE7ukL00Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLun5zSvaaf+dB2jR8MkpnXL9a/VdLtji+Ubk+KlWf6w
 s7ycfa+jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyE+R/DP5MpE9OvdPJtU9zL
 suDOrfiXE1W1yt83Xjgi9OrWuwUCNZMYGaY9fjZxC9uH1nsvc9fWPzKqYJscbLbRs1ardm3V4U9
 bD3EDAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

rbtree cache syncs run with asynchronous I/O enabled, this is indicated
by setting the async flag on the regmap.  During a normal exit we reset
to synchronous mode but if we exit early due to an error this restore is
missed and the regmap is left in async mode.  Reset the flag on error as
well.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regcache-rbtree.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index e2feed6dbecf..26ac2c2a2095 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -494,8 +494,10 @@ static int regcache_rbtree_sync(struct regmap *map, unsigned int min,
 		ret = regcache_sync_block(map, rbnode->block,
 					  rbnode->cache_present,
 					  rbnode->base_reg, start, end);
-		if (ret != 0)
+		if (ret != 0) {
+			map->async = false;
 			return ret;
+		}
 	}
 
 	map->async = false;

---
base-commit: 2dee91ee94eec85d09c13c7ca83e3005906d3732
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4
change-id: 20261026-regcache-rbtree-restore-sync-3ae8bf6ccfb7

Best regards,
--  
Mark Brown <broonie@kernel.org>

