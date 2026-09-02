Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216A33FE15
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788322551; cv=none; b=Obk/PzFQrp24s/+pNEMyWXjT2h17MmY4LvVaPOXhBy4JDPdCB/Lue6LTs29iX1wff16Z1HiIbeZO5qUbcsmrHfy+LTFWFILUlrmIRg40BqbfXh2Gwyq+zC8DrU5UE+rgM/B3p0p2lMd0h28OqYwYPY78sva5Q9E80Ud7+m7vd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788322551; c=relaxed/simple;
	bh=swQwrtneqW1lCA6Ro7jcQDgOBNBe6qaPbKM0GbdLxGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YUvol6YJWvb28+MkPvJTipL3WfHcj/qZ0UcV9++YLzN1m/PWW0U278JAWlhcqy+Xk5yp9NHF5Ul/dFF+bqsec9GYHhB/PEFQ3oiPgvjE2BNK3/z+BFNblgNODatzMttzR/d8W5oAyo1dSWKDakTMCqjVkKHVU6B59KBZE5+mtho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hDNyvd41; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hDNyvd41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788322528;
	bh=ikyVSu5ajF0t3gQDlCcAjZGmd7bSIqKr6cIUSfxmQv0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hDNyvd41k9nKzU49VoLeKyRxl9OcKjF3nUfu4e4afeAx5cli4cHgGS+Hie9IxlE3z
	 mWtAGk6pL5Vs5JdblO8GK43QEeyxg0ZlZ1f4PCS8BAYU/NnJfuw8R5WgwHXvZrecZs
	 VOOk/zcorPPm+SHdqsVPVE2lEWrnee8Ogl41foYk=
X-QQ-mid: esmtpsz18t1788322511td4e49c66
X-QQ-Originating-IP: yybJzeV4gPvdNgO8Y/MWgEYDs/42mPsPcy37avh1cu0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Sep 2026 12:15:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3219973555314656053
EX-QQ-RecipientCnt: 4
From: Wentao Guan <guanwentao@uniontech.com>
To: alexander.usyskin@intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] mei: vsc: Initialize mutexes and event work before requesting the IRQ
Date: Wed,  2 Sep 2026 12:15:04 +0800
Message-Id: <20260902041504.967524-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJRsSVeNb6U+L/11doonVY5DpU6ssUkoumEw/0nEHxq/feGX/QGhqQ/k
	CRnBW8OYehho/aj5lAKn1O5uZOIgDN8vu0ke2jdJCbsNMuAfDfWLaTGCBhq4iBUuqGWdlfI
	pxkExzNi2Aosrj7h7fJoaie2aJGzWdD2ytByb1eho0BLY/d/8U98VunTKy8U10z9LCIOhVc
	9NkeODWXFGbeRxIF5ykOnufRzWm+azw4sN/NyvUaTxxI/szOV8Gyt0Ho1ORSh0CaCLspA94
	7YIVMolTnGm5OA9xR0/hEj9dM2eD/iERG1x8XERBMcicSCdNr2dE+7MT3nyPGqjVUqUdf2l
	1rdjVvMDDpOTnjEAXCU09gMkZb4h1b6uVwifnU6CSdh6k7JKtDZjJMJoTeSXGnlABUbJbBp
	XGnau2n/eHR4rc+VG/oFmfWooX2rBMpTsHuuZlU2XbKKLrC4b2+cnLRKAJ4ZDdgwKiDApVq
	aA1avCkK5miNLjEgl1qdfrGkRLUaMrjhutLsQF2YLzz9acm94GrBtyefJh0XcU1ZCkij/bY
	VavZJaUBJQGIDzuy/i5192abWWW39J6mnWIZkWfsZSePWSgV5LBa54gFfD93zQPOeGQC6hx
	+uG7RITrLD/mQNgKvHTZom7blDXrkj0KNcJtn3ZNeicSGfFra7oW8zu/ErMu5lJx+wVYt2n
	Q1ftPg67k0wrVeZXEFvdHtQhOvNnUYDC4g4eiCaoW1AP/CA55zPVON/GxRrOXQZyaqIfZrt
	NlrMoCD2HZ8KSyoZzkWo43kZeKGibbuCYBJkbqMVE0mb8mPBLF/6vbquTl9yOoG30kOIknk
	f4yBMUY2+q+RV0lrrnX4oMr3pLttkB7hBROnsLCvt31Ko9hDXSr/0XwXWzno4Q0ELzIbtx2
	U7lxNBnhCDhKC85AFmd8T0nNvbny5M1BJhA5z+3ZFaytvXAYqyl0MbNnhra7nRn26WqPpan
	5YQNbkOHoylRhBC6NAwqZQsU64/EH6DFDMfkdl9oQSWFdygPzS6V5ybvoAsrZm2G2Lllc9h
	vrFvSVLLCoZMekExfQ00u2jIyF92ugFd/OHqn9/TpcRWrTaxL9
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

vsc_tp_isr() schedules tp->event_work, whose handler
vsc_tp_event_work() unconditionally locks tp->event_notify_mutex, but
vsc_tp_probe() initializes both mutexes and the work item only after
request_threaded_irq() has succeeded. A pending wake interrupt during
probe can therefore schedule an uninitialized work item, which then
runs mutex_lock() on zeroed, uninitialized mutex state.

Move the mutex_init() and INIT_WORK() calls before
request_threaded_irq() and destroy the mutexes if IRQ registration
fails.

Fixes: de88b02c94db7 ("mei: vsc: Run event callback from a workqueue")
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 drivers/misc/mei/vsc-tp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 5ecf99883996b..e2f65e60e4892 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -496,16 +496,16 @@ static int vsc_tp_probe(struct spi_device *spi)
 	init_waitqueue_head(&tp->xfer_wait);
 	tp->spi = spi;
 
+	mutex_init(&tp->mutex);
+	mutex_init(&tp->event_notify_mutex);
+	INIT_WORK(&tp->event_work, vsc_tp_event_work);
+
 	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
 	ret = request_threaded_irq(spi->irq, NULL, vsc_tp_isr,
 				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				   dev_name(dev), tp);
 	if (ret)
-		return ret;
-
-	mutex_init(&tp->mutex);
-	mutex_init(&tp->event_notify_mutex);
-	INIT_WORK(&tp->event_work, vsc_tp_event_work);
+		goto err_destroy_mutex;
 
 	/* only one child acpi device */
 	ret = acpi_dev_for_each_child(ACPI_COMPANION(dev),
@@ -531,6 +531,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 	free_irq(spi->irq, tp);
 
 	cancel_work_sync(&tp->event_work);
+err_destroy_mutex:
 	mutex_destroy(&tp->event_notify_mutex);
 	mutex_destroy(&tp->mutex);
 
-- 
2.30.2

