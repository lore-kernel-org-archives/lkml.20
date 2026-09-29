Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA451C078;
	Tue, 29 Sep 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683361; cv=none; b=ThwS7p1HtwX8gojfqHZKj6ZDZshlMLq/DyJr/NFIBVZRZje4VsRUskbdqJbDJ1bVbjd/pR6vm2Y6AkqAjY17EQd6JjQDu8aWLMU9d2RBU3VX/CP+byBQMv3GCPwJPhxmMbs287PZ/ebQSvdx8COIFZL39OJqox7UUjqagw7STDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683361; c=relaxed/simple;
	bh=wYZehBAjqyNGIu7WW6UnGNszJFmz0RoqfTC/yl6Y8fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnLGaj+UnVY7XInSSYadMmLFEfqLrVfJVIClv3PBrNd+AjJcztLLrpqjPqWkw0k89eh1XkVCwGq6OaWunBmjwA+LKvC93NE4gKa5gQXx8Jqo6I+aRhaQICu99FyJQGHf1KYEHZ5u0tMz3VTLo6G5JmbCP8osg+dFqGJBv0v1M0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbkOLnXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbkOLnXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C671F000FF;
	Tue, 29 Sep 2026 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683359;
	bh=ZNbktM4rdDlTOXn5AkewGLya/WjhaRKxrshTNFUu64s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BbkOLnXK4gqfrgu88BLpIhWwfft7ikWIvxZ7mdMdDzrSvBTqUXxKp+w47qRwfA5N/
	 DUGlv1F0ORp/8fifPbpo24fsTMb4Xm9n0Mw5+YbMnBhwReNk72quln+o2tYTpvUnaP
	 PuAUp5BdYV6FZGickNPe2JvGIvafFj2eFBbFzL9j9ymu0/cG/t+rkt2D9tgCF5ijuU
	 L2Ag6t56qKjMS446d5OY8f0pnEszeWGyYB7tqzew6yFkpugmf47B/4tJHlrjVY6qoo
	 Lo0WswzxekG8ZSe2zbhKKVn1eSu0RPqEonGxSJVfCUIl8oVQqiH97CYDOdTmfGTsP9
	 vc/1T8Bogq2nA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 29 Sep 2026 14:02:26 +0200
Subject: [PATCH 3/3] media: mali-c55: Keep ISP powered while IRQ wake is
 armed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-mali-c55-irq-supend-resume-v1-3-e3af34afff12@kernel.org>
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
To: Li Youhong <dayou5941@163.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Nayden Kanchev <nayden.kanchev@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

System suspend enables IRQ wake and then calls pm_runtime_force_suspend().

For an active ISP this asserts its resets and disables its clocks, so it
can no longer generate frame interrupts. An already runtime-suspended ISP
is left powered off as well.

Take a runtime PM reference before arming IRQ wake and retain it until
resume. This powers up an idle ISP and keeps an active ISP's configuration
intact. Release the reference if arming wake fails, and use the PM wake
policy in both suspend and resume to balance the reference. Continue to
use forced runtime suspend and resume when wake is disabled.

Use the forced power-down path for hibernation freeze and power-off even
when wake is enabled. Capture must not remain active while a hibernation
image is created.

Wake events require a configured stream and an input source that
remains operational during system sleep.

The internal TPG shares the ISP's power state. External sensor and
receiver drivers will need their own system-sleep wake support.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 38 ++++++++++++++--------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 07267b79801b..2629bb3aa628 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -756,31 +756,43 @@ static int __maybe_unused mali_c55_suspend(struct device *dev)
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	int ret;
 
-	if (device_may_wakeup(dev)) {
-		ret = enable_irq_wake(mali_c55->irqnum);
-		if (ret)
-			return ret;
-	}
+	if (!device_may_wakeup(dev))
+		return pm_runtime_force_suspend(dev);
 
-	ret = pm_runtime_force_suspend(dev);
-	if (ret && device_may_wakeup(dev))
-		disable_irq_wake(mali_c55->irqnum);
+	/* Keep the ISP clocked and out of reset while it can wake the system. */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
-	return ret;
+	ret = enable_irq_wake(mali_c55->irqnum);
+	if (ret) {
+		pm_runtime_put_autosuspend(dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int __maybe_unused mali_c55_resume(struct device *dev)
 {
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(dev))
-		disable_irq_wake(mali_c55->irqnum);
+	if (!device_may_wakeup(dev))
+		return pm_runtime_force_resume(dev);
 
-	return pm_runtime_force_resume(dev);
+	disable_irq_wake(mali_c55->irqnum);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static const struct dev_pm_ops mali_c55_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mali_c55_suspend, mali_c55_resume)
+	.suspend = pm_sleep_ptr(mali_c55_suspend),
+	.resume = pm_sleep_ptr(mali_c55_resume),
+	.freeze = pm_sleep_ptr(pm_runtime_force_suspend),
+	.thaw = pm_sleep_ptr(pm_runtime_force_resume),
+	.poweroff = pm_sleep_ptr(pm_runtime_force_suspend),
+	.restore = pm_sleep_ptr(pm_runtime_force_resume),
 	SET_RUNTIME_PM_OPS(mali_c55_runtime_suspend, mali_c55_runtime_resume,
 			   NULL)
 };

-- 
2.55.0

