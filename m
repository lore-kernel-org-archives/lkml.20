Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC4C360EDC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858924; cv=none; b=qot+YceqLPUz08VZ+vXHt0O9O46sznVj8Lu8AIocjyn1TrNpUZJMrTmlMZMpwM99G6Mxej87ecy9D+c0Y8UN+FbB1MezZfWtODmACBrGS3v049R9SIK2uefzFSnWHnyHbBT+K/ZeudkYFk/lOR85eccVrCD4RQMuKhuc/ugNYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858924; c=relaxed/simple;
	bh=38M7GX7I0hdBOiuGQLpKobhKnQNRzyvUJcXmUM6kUsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AaggPdcrZc/DqziG4bzBcHXTbqEG8LtNteSKi3Ma0fygIC9qEs6MHmlt0jMHOYAYr4NDdZ1rL/N5bFirpJ0ziMm2Z5JVbiZyGVydiJ0L7Kimh5rwuUugBRdcaX0vtPne81jVQWT6QMICvIfF3Evr+s+SGLAZM9xAO8Tx5z/LTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QWmBdyLn; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QWmBdyLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TJ
	GjbuaLcP+ZIwC3nLI3tROoCLY39LzAtjrRQpNRkCI=; b=QWmBdyLnTwBsK46du4
	AorTsudiPgpZGBDY7lSYIX4DitBMNLfdyy8YrnX1ZtL67yS3T7O6HpkXQqUGJgfS
	ojvs38Xntl0ULKQj/5gvK/f5Xh/0THdURyUUJdyZFNpDiIZu31coMpHhuWkO3Abe
	sdwHC+svB/TGux6k7oXnTNQ8Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnrwtnVr5qjk7FBw--.47576S2;
	Thu, 01 Oct 2026 20:47:37 +0800 (CST)
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
Subject: [PATCH V2] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 20:47:33 +0800
Message-Id: <20261001124733.43559-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnrwtnVr5qjk7FBw--.47576S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw13Aw4xuF4kurWfCFy3urg_yoW5Xw18pr
	W8Wa4UKr4kG3WDurZrua18uw1rJwsYyayj9FyrZryrua45u342ga45K345KF1UAF4rX3WY
	vrs3Xa4DC3W5tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRY2NAUUUUU=
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwQn5oGq+Vmny6wAA3j

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
chip->chipsize against 128 MiB. This code thus always saw the
overridden size. The above commit moved the decision to
nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
scan time -- before nandsim applies the override -- and the
overridesize path was never taught to re-evaluate the flag. 

Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
the same test as nand_scan_ident(), so that the address width emitted
by the core always matches ns->geom.pgaddrbytes, which ns_init()
derives from the overridden total size.

Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
Signed-off-by: wang wei <a929244872@163.com>
---
 drivers/mtd/nand/raw/nandsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe96803..ac82dd7 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2359,6 +2359,11 @@ static int __init ns_init_module(void)
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
+
+		if (chip->chip_shift - chip->page_shift > 16)
+			chip->options |= NAND_ROW_ADDR_3;
+		else
+			chip->options &= ~NAND_ROW_ADDR_3;
 	}
 
 	ret = ns_setup_wear_reporting(nsmtd);

-- 
2.55.0.windows.3

