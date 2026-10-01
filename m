Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB454EFFDC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850921; cv=none; b=GUEdzeRQMg9tzFGB9Yy+lXa1OtCTujAU+MmnxPlY9mPAhyEh5VdVSxhHDdubb6BRBfjeuE7xrVsnMpbcCY/27Aa+FO+GswpTRmW8HkJHDXUJoPhXHS2pKGDOU2W58FewZGl5/Eeu0L5KjIVzZcxpt4fgRBifxRpc+EEql/rYKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850921; c=relaxed/simple;
	bh=7Tb5jNGmsdwtC2AAV9UcLNMzhIk4ST5MJ8xispV/ljk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rTj4dajM/4XkXETWxfQ2wKvUf7o4H7Cg864SpAu3xJxYdFE1Bti4NFf29VgQN+web63zgITtwVKKKmsmuQv2mG4o+fFayW+CXMAd36Gr5sQUndphmWiABNw8XeIdYB4f76zpLUvvWajRdleQWzI/ytd6ob5FQpt/9EpdAmC3nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lNs8a1Id; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lNs8a1Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jY
	eLowNWzMOo2rbwRyD6w4MGRCdOM2szKiDsZS/kv5M=; b=lNs8a1Idq2ik7e8f23
	HnMevpwSmfdTsH8esbXq/o/TR3D77S9vxJwH/2laFlg4F0KGWsofoaz0Nr60HH54
	1CWfQkIEKnZT6Kx6fWLi8w74hEhN5/JiLifq1YIIfq1HcirDjrrzSSHnjm1FO/V2
	Sy/p39F4zRxaqDgMICWYPA4F4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnek0ZN75qDS1mCQ--.60794S2;
	Thu, 01 Oct 2026 18:34:01 +0800 (CST)
From: wang wei <a929244872@163.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org,
	yamada.masahiro@socionext.com,
	wenyou.yang@microchip.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wang wei <a929244872@163.com>
Subject: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 18:33:59 +0800
Message-Id: <20261001103359.20216-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCnek0ZN75qDS1mCQ--.60794S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw13Aw4xuF4kurWfCFy3urg_yoW5ZF1kpF
	WrWa4UGr4DKFnrWrZrua18Zw1rJwsYyayj9FyfZryF93W5ZrW2va45K345KF1UAF4rX3WY
	qrs3XFykC3W5taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiL0UUUUUU=
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwRoexGq+Nxoe5QAA3D

The overridesize module parameter changes the size of the simulated
device after nand_scan() has completed. It updates nsmtd->size,
memorg->eraseblocks_per_lun, chip->chip_shift and chip->pagemask to
match the new geometry, but leaves the NAND_ROW_ADDR_3 option
untouched, even though nand_scan_ident() set it from the geometry
decoded out of the ID bytes.

When the ID bytes describe a device larger than 128 MiB and
overridesize shrinks the simulation to 128 MiB or less, the stale
option makes the core emit one extra row address byte (page >> 16,
always zero given the reduced page count) in every read, program and
erase operation, while the simulator state machine expects one byte
less. All accesses then fail with:

    nandsim: error: write_byte: address (0x0) isn't expected, expected
    state is STATE_CMD_READSTART, switch to STATE_READY

The opposite direction is equally broken: growing a small device past
128 MiB keeps NAND_ROW_ADDR_3 cleared, so the third row address byte
is dropped and the wrong pages are silently addressed.

This used to work before commit 14157f861437 ("mtd: nand: introduce
NAND_ROW_ADDR_3 flag"). Back then nandsim kept chip->chipsize in sync
with the override, and nand_command_lp() decided at run time, per
command, whether the third row address cycle was needed by testing
chip->chipsize against 128 MiB. The decision thus always saw the
overridden size. The above commit moved the decision to
nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
scan time -- before nandsim applies the override -- and the
overridesize path was never taught to re-evaluate the flag. The
commit that introduced the regression is:

    https://git.kernel.org/torvalds/c/14157f861437ebe2d624b0a845b91bbdf8ca9a2d

Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
the same test as nand_scan_ident(), so that the address width emitted
by the core always matches ns->geom.pgaddrbytes, which ns_init()
derives from the overridden total size.

Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
Signed-off-by: wang wei <a929244872@163.com>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe96803..176db89 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2359,6 +2359,18 @@ static int __init ns_init_module(void)
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
+
+		/*
+		 * NAND_ROW_ADDR_3 was set by nand_scan_ident() from the
+		 * geometry decoded out of the ID bytes, which the size
+		 * override has just made stale. Re-evaluate it against
+		 * the new geometry, otherwise the core emits one more (or
+		 * one less) row address byte than the simulator expects.
+		 */
+		if (chip->chip_shift - chip->page_shift > 16)
+			chip->options |= NAND_ROW_ADDR_3;
+		else
+			chip->options &= ~NAND_ROW_ADDR_3;
 	}
 
 	ret = ns_setup_wear_reporting(nsmtd);
-- 
2.55.0.windows.3

