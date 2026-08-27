Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DB381EB1;
	Thu, 27 Aug 2026 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796893; cv=none; b=JXTC9bSrmzS/NGej6aSN1nUhmNiynN8QwALK+Ip1um5EhNWWw1lRVZmao5PcglIQCe2zWulBIs1cteRtqk9JY7JWSt3F1r9d/mbdxtPLA67Y0oeYZpuko6T4SkDEw1Q8f1whw/y6jgyL1sYR8ACM4fubvLDHIQIcXfXKP0Wxx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796893; c=relaxed/simple;
	bh=6tuIyaDvXmh31TWjQ3Fr8iMEIgbL2yCeBF8chTUEt3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fj7hFVpdaxpanLX+sgU4VESQuOGOMOnYsG3yRXNjhwMiLfYeeeXUTY6+6RQTJUrPf7YSOmJz1xqSvVFG/BYKn5hntmp1ZhH4KrlguH7BjbnwOAlK0AJZZFlQFcWOeVBPPfll6J+Mq0ZDnv9RWIssirWJG8qJ1U6B1fU7CWP6rqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KN8XQa+d; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KN8XQa+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=E4
	xj27Uw381Jy5PBrpr36LbgUtdCjtZZw0rtEdvwSWo=; b=KN8XQa+dM2yBf/KtyH
	fQGOdVgdyDvDnvpLBNXvxcKAzrrDCWfkZk1o6AqOLIqFr8Mxgs2Th4SxbLnd82ks
	grnWP/VRnDY7eK2AP5rqTx8Kw2F1rLGDVNdGMx4e3PPrQo95B/ot0RGrQa61wlrq
	DMuU1XtcTNfDdTGp8b+YL6wbM=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnj2V8nY9q+zxbSQ--.48447S2;
	Thu, 27 Aug 2026 10:14:20 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: srini@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] slimbus: messaging: fix leaked PM vote on tid allocation failure
Date: Thu, 27 Aug 2026 10:14:09 +0800
Message-Id: <20260827021409.24500-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnj2V8nY9q+zxbSQ--.48447S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jr1fWFWUAFW7Xw1rAFy3XFb_yoW8Jr17pF
	48Ww12yrsYqry7AF1q9rWkXa43Zasa93yUCa1UKa93Aw1rJF40qryrtFy5tFWDAF1fAw1Y
	vrs8ta4FkF1DCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jno7tUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0h0FsGqPnX1pcAAA3m

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

In slim_do_transfer(), when a transaction needs a tid and
slim_alloc_txn_tid() fails, the function returns directly instead of
jumping to slim_xfer_err. The runtime PM vote taken earlier with
pm_runtime_get_sync() is then never released, leaving the controller
permanently powered up.

As txn->tid is still 0 at that point, jumping to slim_xfer_err drops
the vote exactly like it is done for other failed transactions.

Fixes: d3062a2109309 ("slimbus: messaging: add slim_alloc/free_txn_tid()")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/slimbus/messaging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e2dbe4a..ee127ef 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -139,7 +139,7 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 	if (need_tid) {
 		ret = slim_alloc_txn_tid(ctrl, txn);
 		if (ret)
-			return ret;
+			goto slim_xfer_err;
 
 		if (!txn->msg->comp)
 			txn->comp = &done;
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

