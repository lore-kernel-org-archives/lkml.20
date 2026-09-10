Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6648F03F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047498; cv=none; b=KgzU9PTxpcosuvLvhbyA5GvrlevcoX0UcWxnssLSzdONN7rvGog9sal0Ht9PJRkRYbFj5LX+pnUWdj+6vyAZSFfCCknOnLf+r0sdn2PVOam5YRPdUaAJ+utztLCPWMBWXw1PpPGANUqmTzRUONK4/tMTprfI0/h5S1xnb+Gc/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047498; c=relaxed/simple;
	bh=NmLBd37Hz8e2vPifnUTFDagNY2hbHRfHeZh13dtypFk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aFRbUPf12Som6tc4w48yBvkRiudkhjp61lx4wVb5u8FTSujCM8Es4Yr/cF/CSfbGP15g3VYIX9KSMWP06luyAJzrEI0UIz/xqEe54MtyW5GcLlWdVkiytGYDwLJo5QNUlfpZ0T2HXzbvQfeel/jmgF1rcEMu/S/9AaKKrUUjuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=e0QtZafv; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="e0QtZafv"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OAXvvf5bBfGy7Tjd5JmbGY2Dey5h8lYm1afhEjpKROg=;
	b=e0QtZafvVZaDlPFRUy9aIemWklE3yItrmhvC5K45BcvNiwFNmvNPVaIQAIAktYJkPorehkFLC
	yZXtKNyZ+7M3iGTkEaewypXhrFb9MX+TV8ZMGlfITk0O6dZFsf4kIPIAiz/ZwqhJmh2wCYUk1nV
	whEq1TmBrlqexQlzW7N3Hfk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hgdkg2yf4z1prMy;
	Thu, 10 Sep 2026 21:27:07 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 0441D4057D;
	Thu, 10 Sep 2026 21:38:04 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 21:38:02 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<dedekind@linutronix.de>, <haver@vnet.ibm.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubi: try_recover_peb: Don't torture the new PEB if there is no write operation
Date: Thu, 10 Sep 2026 21:30:27 +0800
Message-ID: <20260910133027.2738498-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

The new peb is put always with torture flag even there is no write
operation. For example, ubi_io_read_vid_hdr failure can lead a torture
operation during the erasing of new PEB, which brings meaningless and
life-wearing torture verification.

Fix by adding a torture state value to identify whether the write
operation happens on new PEB. BTW, let ubi write failure warnning be
printed only when a write operation fails.

Fixes: 801c135ce73d5d ("UBI: Unsorted Block Images")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/eba.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f0c549e62c55..509c90304ab8 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -805,7 +805,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 {
 	struct ubi_device *ubi = vol->ubi;
 	struct ubi_vid_hdr *vid_hdr;
-	int new_pnum, err, vol_id = vol->vol_id, data_size;
+	int new_pnum, err, vol_id = vol->vol_id, data_size, torture = 0;
 	uint32_t crc;
 
 	*retry = false;
@@ -843,6 +843,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 
 	memcpy(ubi->peb_buf + offset, buf, len);
 
+	torture = 1;
 	data_size = offset + len;
 	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
 	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
@@ -872,8 +873,9 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 		 * Bad luck? This physical eraseblock is bad too? Crud. Let's
 		 * try to get another one.
 		 */
-		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
-		ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
+		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, torture);
+		if (torture)
+			ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
 	}
 
 	return err;
-- 
2.52.0

