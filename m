Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436FD3955EF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145129; cv=none; b=piAt0RqqAR+G7FpDrrWNASvBalTbd1BEboTbVX4k5PyhfU+9+6UCRaion4K+NFd5OuouNEq9/MFOrMlwZWZv1t4Yk3X9YGAvH7hhO/lGx+W7VMIJeNJ6iYgye8HVi+UjUVhnge3ger86ul2T0T011gsIkegJK1wkXTwKXFPag2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145129; c=relaxed/simple;
	bh=CopiEjlaiPvSkVP4fQX7m0AGZyKKlePMF3mkq94auMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9kNOdf5vWRE+VUtWbRlAk9lvFrT5QwfuUu/0nqZ7oc1NEJVJxdd0BGH2LotjV8UKFtm+/XESfWWphjJWF8sJfbgjnLH9m2V66Mk1/bfn4+I5v2DXFqOHIRXnNKFqiwdaORyLLWCKxcGWsOmKvrH3OsC3Cq41klj5WUNnyBhRrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TC/lA+3j; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TC/lA+3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eu
	fszPnrqVXc28bj6wQZU8M4rIAUJxhs/y3aXbJTFPs=; b=TC/lA+3j+Vywr55mh4
	eZu4wYNkhS/pMdGVAIPffsGBM8DmFWQfLIGyO1oRFsN6/AfSGuVo1AEkSSHYvCkq
	GVZy4h9IfifkaIexhHvH4XxCZgc42p/P/04zr4WMwtJkYla+LSs0vX17DwYxmORm
	MbbZeaWd7eGne8Ws0nqYjkYww=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3bwfR9tFqDmHsAA--.18234S3;
	Fri, 16 Oct 2026 18:05:08 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] mfd: si476x: queue polling work on freezable workqueue
Date: Fri, 16 Oct 2026 18:05:02 +0800
Message-Id: <20261016100503.2581955-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100503.2581955-1-yaojiale02@163.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3bwfR9tFqDmHsAA--.18234S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrKFy7Jry7Gr1UGw1fGFW7Arb_yoW8JrWkpF
	ZFkFWjkrWUAay7C3Wjka429ry5uan8GFZxCryxCa4F93ZFyr95ury0yry5tr1DAFWxu3W7
	ZFW0qrn5Cay5Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piivtJUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xQCPGrR9tRvQwAA3w

SI476x devices without an interrupt continuously poll their status over
I2C. The polling callback runs on the non-freezable system workqueue and
can issue a transfer after the adapter has been suspended.

Queue status polling on system_freezable_wq so it stops before device
suspend and continues after resume.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/mfd/si476x-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 9bce720a0a08..8d952113f8a6 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
+#include <linux/workqueue.h>
 
 #include <linux/mfd/si476x-core.h>
 
@@ -97,8 +98,8 @@ static int si476x_core_config_pinmux(struct si476x_core *core)
 
 static inline void si476x_core_schedule_polling_work(struct si476x_core *core)
 {
-	schedule_delayed_work(&core->status_monitor,
-			      usecs_to_jiffies(SI476X_STATUS_POLL_US));
+	queue_delayed_work(system_freezable_wq, &core->status_monitor,
+			   usecs_to_jiffies(SI476X_STATUS_POLL_US));
 }
 
 /**
-- 
2.34.1

