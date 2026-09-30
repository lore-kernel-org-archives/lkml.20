Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5703DBD51;
	Wed, 30 Sep 2026 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800207; cv=none; b=YdvlpNh8VvLVuws8V+KkfHP0zWnxNhLjnfk7NiIqmD1mSLOYy7Q+X816BzQeYPi2jW7KEVvhRCFl2rhDc9tns1qfb0G37aZZvN25VnvbADG2g/RgECjYQTwpWvhzXkC3rfbPm6ngHOly0KgZeyEC5pjuiLCrHR/ZKd2dfjD2eOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800207; c=relaxed/simple;
	bh=zFkgzi76UmRghJagEHWmBZmMd4BueR/JD/1dPzHd2dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bkumu60Q6ku+whY8WHTxbVTsegcDPxQoRjY3DkRQjiEruQ4wZSDi8OT04S5jOTYtnx7wdNuY9IUMIr0ongozf3Aw65jmpMgqrSr5Qti7Z2hkLUqLZboXqVfyTCwDLrAicmvKX2VN5zutk1+h1cyVhGRZQ6BHExS8xGncGKuwhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzZGg7XN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzZGg7XN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20A5CC2BCB9;
	Wed, 30 Sep 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790800207;
	bh=zFkgzi76UmRghJagEHWmBZmMd4BueR/JD/1dPzHd2dQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fzZGg7XNxgasjew04vWa3fXwPxj+vO6hAJXee/pL9XrQ361WworcGoxhZ1sXoqbr1
	 Vr3CqVhLItlx1bKBErnnWSP2S3d9nBMyZ+o2zcGIXvD9n/i6/gqnzBSx8ydwYW1grW
	 RVupZPGHCZvzYtRuooNNc6CwhyBfm+hmSOJ/6n/gHu4PNsD2CCOk9VVdTK7DS7kPpA
	 JiciNS3qWEi2rouzc0voRAkpNcG7TzQ4smrw6xOYTo9uElOIKHDD55yQskZXVAN+/F
	 usLp9W3ioW4BM2Qkn4mLoHrT5hnAg7T3EyrfIqMqL5GfK97xx84pa9ji4UIhou8ri0
	 BHto2MhS7X7LQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF661CA5FC4;
	Wed, 30 Sep 2026 20:30:06 +0000 (UTC)
From: Josh Lafleur via B4 Relay <devnull+josh.lafleur.outlook.com@kernel.org>
Date: Wed, 30 Sep 2026 13:29:45 -0700
Subject: [PATCH] hte: Dont queue work on line being released
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-hte-crash-v1-1-baf61530800a@outlook.com>
X-B4-Tracking: v=1; b=H4sIADhxvWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3YySVN3kosTiDF1Ls+TkxLTkZMsUIwsloPqCotS0zAqwWdGxtbU
 AG7bhwVsAAAA=
To: Dipen Patel <dipenp@nvidia.com>, Thierry Reding <treding@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-kernel@vger.kernel.org, 
 "Jafet Garcia (RidgeRun)" <ridgerun-linux@flyzipline.com>, 
 "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790800206; l=2557;
 i=josh.lafleur@outlook.com; s=20260930; h=from:subject:message-id;
 bh=bRDDy0i27/YJcTeNUr0wPapEBzqq1hItrkyQnzulKxE=;
 b=1chzITqd6fPgQ6upaSLk8wzlb8T+eeamrb8joI1988vSkHY1pXIgsYNZmi0Dnt3JBkSK/qpCg
 e/BXH9mvvn9AehWIYjsiGj9R/jb6rFFQjCk6HkBVUOLHGZA79aPNIR0
X-Developer-Key: i=josh.lafleur@outlook.com; a=ed25519;
 pk=slf3cskRg11vRnFROP6D9bMBKyvvRNsP2Msvm4/qpmM=
X-Endpoint-Received: by B4 Relay for josh.lafleur@outlook.com/20260930 with
 auth_id=1090
X-Original-From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>
Reply-To: josh.lafleur@outlook.com

From: "Josh Lafleur (Zipline)" <josh.lafleur@outlook.com>

Correct the race condition by adding the HTE_TS_RELEASING flag which
will serialize the application consumer with the hardware producers
under the slock. If the consumer is releasing the line, the producer
shall not queue anymore work as they do not expect to see any more
edges.

Fixes: 31ab09b "drivers: Add hardware timestamp engine (HTE) subsystem"
Suggested-by: Jafet Garcia (RidgeRun) <ridgerun-linux@flyzipline.com>
Signed-off-by: Josh Lafleur (Zipline) <josh.lafleur@outlook.com>
---
A race condition exists where call back work can be cleared by a line
release inbetween the IRQ queueing work and the workqueue handler
completing execution which have identified to be the root cause of
crashed kernels.

A repro case was successfully completed wherein an application
continuously registering and releasing HTE lines can trigger a list_add
failure on the queue_work() and subsequent Oops in the kworker during
the hte_do_cb_work.

CPU0                        CPU1                         CPU2

hte_ts_put()
hte_push_ts_ns()
  flush_work()
                                                           queue_work()
  ei->cb = NULL             hte_do_cb_work()
  ei->tcb = NULL              racy ei->tcb(ei->cl_data)
  ei->cl_data = NULL
---
 drivers/hte/hte.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
index a423503482132..ae4b2093d58b7 100644
--- a/drivers/hte/hte.c
+++ b/drivers/hte/hte.c
@@ -26,6 +26,7 @@ enum {
 	HTE_TS_REQ,
 	HTE_TS_DISABLE,
 	HTE_TS_QUEUE_WK,
+	HTE_TS_RELEASING,
 };
 
 /**
@@ -190,6 +191,10 @@ int hte_ts_put(struct hte_ts_desc *desc)
 		goto mod_put;
 	}
 
+	spin_lock_irqsave(&ei->slock, flag);
+	set_bit(HTE_TS_RELEASING, &ei->flags);
+	spin_unlock_irqrestore(&ei->slock, flag);
+
 	ret = gdev->chip->ops->release(gdev->chip, desc, ei->xlated_id);
 	if (ret) {
 		dev_err(gdev->sdev, "id: %d free failed\n",
@@ -817,7 +822,8 @@ int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
 	data->seq = ei->seq++;
 
 	if (!test_bit(HTE_TS_REGISTERED, &ei->flags) ||
-	    test_bit(HTE_TS_DISABLE, &ei->flags)) {
+	    test_bit(HTE_TS_DISABLE, &ei->flags) ||
+	    test_bit(HTE_TS_RELEASING, &ei->flags)) {
 		dev_dbg(chip->dev, "Unknown timestamp push\n");
 		atomic_inc(&ei->dropped_ts);
 		st = -EINVAL;

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260802-hte-crash-96ccafcc9d28

Best regards,
-- 
Josh Lafleur (Zipline) <josh.lafleur@outlook.com>


