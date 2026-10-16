Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93170395AF6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145131; cv=none; b=SHsnQlBNKzA2zPm4qdntCiV/4X/m8JXzHRXZgztRe2quwPj2tWOr04CN3K8qGoufKKrdma1rutO5dl9oidAhpevCTnSd281M2W3rOozkFe66AxF8syezIOve54YDlGn+l1DC4ACRvkOucUEAeo48s2rz43E1z7GwAxUSkxy7n70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145131; c=relaxed/simple;
	bh=fbmaBak0VNp5bn3AJHWMhndY4Nal++wtgDovXVItpbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gDF/XI4LaCGXizPSNr3c4x6uGWGw82Zjp6jG6pFQ1ixPTq6uuvZzuBPXam5Al7+F8t6MbGvVOOmeDH2i/Cw6i0ncHEuHyleABBe2cSEzGOcUm4IyY3bOdtxGd8F13dztI2MnKvLuyj/YO8jpVWfPaJ3znf6x2GdiKNfvd2KhRBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IxnW0YTo; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IxnW0YTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ZT
	FQWbNIJHb5N2EZ4pUURWwAxQlHXgrZ8e454ifeWZ4=; b=IxnW0YToWSPqehyauz
	nJgEZJ8fLe6yA/jLiF7Fs9cGiaL/3gC9lWcTaK3Sxe7hyrZoZxTSeEEBfXLHb/kE
	Ey3xEr2Q0mCTxSc2SRi6g9+AZm9r14dxfGFLz9CknkCncel0qIyugmmWlcmvkZ6E
	sX1dkYNW+FH3LGHZ0pCvpL1b8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3bwfR9tFqDmHsAA--.18234S4;
	Fri, 16 Oct 2026 18:05:09 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] mfd: tps65010: queue I/O work on freezable workqueue
Date: Fri, 16 Oct 2026 18:05:03 +0800
Message-Id: <20261016100503.2581955-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3bwfR9tFqDmHsAA--.18234S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr13Jw43Kry3Xr18AF47Jwb_yoW8tFWrpF
	WfGrW5tayxGayjqFsIgan7ZF1rKFn0vryUKrWIvw4fu3Z5ZwnYqa4xGrW5tFW5u3y8C3WF
	yr4YqrWkZa1Sg3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEZ2-8UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhUCPGrR9tXj5wAA35

The TPS65010 event worker performs SMBus transfers and can reschedule
itself to poll the charging state. The power-efficient system workqueue
is not freezable, so pending work can access an I2C adapter after it has
been suspended.

Use the freezable power-efficient workqueue for every scheduling path.
This preserves the power-efficient behavior while freezing I/O across
system suspend.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/mfd/tps65010.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index 8a144ec52201..b038d67ff715 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -230,7 +230,7 @@ static int dbg_show(struct seq_file *s, void *_)
 	seq_printf(s, "mask2     %s\n", buf);
 	/* ignore ackint2 */
 
-	queue_delayed_work(system_power_efficient_wq, &tps->work,
+	queue_delayed_work(system_freezable_power_efficient_wq, &tps->work,
 			   POWER_POLL_DELAY);
 
 	/* VMAIN voltage, enable lowpower, etc */
@@ -388,7 +388,7 @@ static void tps65010_interrupt(struct tps65010 *tps)
 			&& (tps->chgstatus & (TPS_CHG_USB|TPS_CHG_AC)))
 		poll = 1;
 	if (poll)
-		queue_delayed_work(system_power_efficient_wq, &tps->work,
+		queue_delayed_work(system_freezable_power_efficient_wq, &tps->work,
 				   POWER_POLL_DELAY);
 
 	/* also potentially gpio-in rise or fall */
@@ -436,7 +436,7 @@ static irqreturn_t tps65010_irq(int irq, void *_tps)
 
 	disable_irq_nosync(irq);
 	set_bit(FLAG_IRQ_ENABLE, &tps->flags);
-	queue_delayed_work(system_power_efficient_wq, &tps->work, 0);
+	queue_delayed_work(system_freezable_power_efficient_wq, &tps->work, 0);
 	return IRQ_HANDLED;
 }
 
@@ -694,7 +694,8 @@ int tps65010_set_vbus_draw(unsigned mA)
 			&& test_and_set_bit(
 				FLAG_VBUS_CHANGED, &the_tps->flags)) {
 		/* gadget drivers call this in_irq() */
-		queue_delayed_work(system_power_efficient_wq, &the_tps->work,
+		queue_delayed_work(system_freezable_power_efficient_wq,
+				   &the_tps->work,
 				   0);
 	}
 	local_irq_restore(flags);
@@ -1052,4 +1053,3 @@ static void __exit tps_exit(void)
 	i2c_del_driver(&tps65010_driver);
 }
 module_exit(tps_exit);
-
-- 
2.34.1

