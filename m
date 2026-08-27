Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185D30EF8F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862804; cv=none; b=gkd0Py0JI5VOOu/+mUExP5U7nnyO44fUBAfrkROuVzUpp/3WSD3W7HIbxapbsg+YlHWokOmvPYBWYJZOqseAKcVQtiBft1kRGLHhCjQCcuyHiM5kmr/3yDaLvrImV37PCSiHAo4DKNDi36ctvCDcNp52GJjJ8rnJLIc/b0jGJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862804; c=relaxed/simple;
	bh=PFORI70wkTXBJ3E9N+a4Qcwh/pK2Gq+1Tzt8EZcC7q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZvIa0iKCpbvIPe6WzCCHkZY2SJ56NpsNQO/5UFYcMgd3pMARxsEYQWG3G8yu11DGoj5nalD2NjZFbWKfI6wo1qlqc+b/jWa4MVhT5LhEEziT077qScg5rqWDhxy+a7tEKAYOAesiTA3HmukuSGbFnIlkyguu5IbyKJDjuvaQ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG5zfhq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG5zfhq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51401F00A3D;
	Thu, 27 Aug 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862799;
	bh=5CB2dKmCQSY1qUwmTvFZhSCvj33xjn/pkJ3N+pasapc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NG5zfhq1Ui8zNeI5gL/cL0XPa92Qw1KI/XTkJu21PAB4scoAMTTQfSFQyLgYj/tsH
	 m92JgKh+VAeNdNgyBfGIjaNcf5Daj4zqJztOPB4hNiGqvmhpoG4/l8nMsL4xtmSU2v
	 uxViQJYyo7uotjCM2ovzAhHhLomUldN3EfH/IQMbgaZWwQnNkrMIgOZVUwcA04b9lS
	 qX70JxU4ceVtQuDaga1p4SEOYiuT8kaMLEnd6bQ0mwQxHm7TjsQ76pWgvL9JJpuFAQ
	 5fSYzG2mlwoq4ZDA6OUHVxzwf/vII2BB1xNl9Sf1coSMkW0UpNHKmXUFW9Etk+V+su
	 nzmLcaaprEYhg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:01 -0500
Subject: [PATCH 02/11] accel: ethosu: Drop IRQF_SHARED flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-2-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The IRQF_SHARED flag doesn't work with runtime-pm as the IRQ handler
could run without resuming the device. This could also be fixed with
runtime-pm calls in the IRQ handler, but there is no known need for a
shared IRQ.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 99c8812691e5..c33f2877b385 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -337,7 +337,7 @@ int ethosu_job_init(struct ethosu_device *edev)
 	ret = devm_request_threaded_irq(dev, edev->irq,
 					ethosu_job_irq_handler,
 					ethosu_job_irq_handler_thread,
-					IRQF_SHARED, KBUILD_MODNAME,
+					0, KBUILD_MODNAME,
 					edev);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");

-- 
2.53.0

