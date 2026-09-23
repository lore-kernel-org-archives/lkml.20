Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B69418365
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152678; cv=none; b=c9fT0+agQQcWJRd2Vw0yJ1lZcGYX3Vt+2eUrr8g0sdwrxh6qGjwBYL3ZA2rVugVRjbg1KxyNAdR/VKzzBLrLtT3LKklIONivz7tVBcdyU7vCZY4KHHyI74VtV4JEz0w968nN0e7a3peXR8Fdmf0Eta72OLIOEgIIF+7l4poOMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152678; c=relaxed/simple;
	bh=qSILxap1uKVhTX57p7J/ogsFNjwWmTdF6dSR+ZntbEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuKyVFolW0YOOcxmozv9LzZIsK6FjZu2eiFOU4mW6esUT1w3j0+XopTQt7QsA238MEZoJIF4F49C4PheBnQD2r/Wtl33rAEs0HhtAGvpJ9SLvny88qbPj/2POnx/En9xAADBtBKy6BhcrLVE17ZC8UACRH4+g89cQDGdY2xMNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNjB6zx0; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNjB6zx0"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so520089a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152658; x=1790757458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=bNjB6zx0VsxUK8cW7lnz2tkr2AVo8fhSJU3+OczMf+S2+GDnNqwIjY+hO94u9EJxM7
         PS9Y+2gRtXLFOebu2ClQwHiK2AlUGMZQ0uvpj8HOM/eK0bZXH1cPFUmESUZYgGnl4Y0i
         ZNw7nL8CiRAs0f6sVHBnfDSkHMg45ad2oFJ9vxiUdffQiPbzAZANU+f5BXZM6UKM+BB3
         M58cVsHNJk0XWY3IKQcSW95cQAeG085dPtdLak8nx21g1lUC8QVjhuqQM9eky6zo1C+K
         PnF/aRVqfDE+BflpXJGI6ykex51RC+QcffHvALlX8QkBEOpxXQpXC5+CV/M/GRtUXVq3
         vnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152658; x=1790757458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=cFGXVtxspmhM1kOyuOEve5/l+dRncuseruH4otH2iOVF5GuZxV1AwQ1RiUsbcxzUdx
         iJt7a0Lgs5oMb7mgIKm1Lwuvvkh/VokmGPyi4pmqaKC2SHc4yCSmJitGuCQAuQGFYOlV
         pkcwQL5ePTLRBtDkaqC7l5XtOtE8C39ogwMrKOwcgS3vZ3qnxh10plAAZNO56jrFvYDz
         w7DAsg8ZvkQEPTzIKauA5sIrv9QnxL9Xz75egIEt9brz/OXfzZGhbnvCD4se5uXsVK8M
         4t7SKjhpry2SnjghuIp/clv/QZ2FDJv/PxSy+2Fq8L4JktxOpvHErNxKp6nIexNECpl/
         ymaA==
X-Forwarded-Encrypted: i=1; AKwUvBzWGYqIwAHx3xT56ecbXRgfde5ERKKOkf2W38PId65e8eKNlQGS3vBE0JP6njjmmHjjtlARsTi0Ym587HQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ngv6dyzfg95D+svjMAHrCBLunGHQSs8x4UTzOaP2AYlsk5WsLG
	Tx68kJyVeZNjcBo5g5Kr36dAwK+P0ipu/LCpB21sXqzlPxCCjPSbnxTP
X-Gm-Gg: AYBFou1xkELQ7T7v0gs+fa/spO+HQqi1bww9SUL8q0vr8bCmAS76gFpH9n99a+3KZmQ
	TlIk8WzbiABhBkPxKLU3Xm5OEKTmBFoLAtoDs5NLVtUqdgyeWC75j5P86pZkzlILO0ZNUnNld/P
	BA8e4BMnHsYNk/899HXe3QMVAf2piTG+MEcdbfL7s3nRgovICKv6Z6pINwzKWEP0B/UVLft10Pt
	1rGJwtnt6axbxBXjG56dWA93W2Fe65+JnXMxrL/cOX6r420NtiG/es7WvML32AE7y4+3zlIGmUl
	0Dojft+Hy+YZ185P7mfgXtH8SaTfV1ttz3vMbAZtYL1mGGdnUS5gXhb2nbgDEewhkcBs3fc/tvo
	5cZjILsilJAGdot5yzWoG1jp48/JrSCkxdz5XEzQ3WOxLMgnkpBVKvM2SjcNSOcyJelT5ARuzPy
	9qfwcZ2/Rc+U6/AGsoBNi1aLSefLxZ03uJ0kpkH2zJkkaD/VBUPI16mYE9r5tbq6rzoBkyjtKtC
	q8YNRlESqTG2S/DVZfPBugsXfW4Y+FKDhG6I9vH6fk8JAbdrdfpYQa4hh4LKXgde36Exb9X5iX4
	9LG/rAPU4/QC
X-Received: by 2002:a17:90a:e704:b0:39e:6c6a:6579 with SMTP id 98e67ed59e1d1-3a07e695391mr1778896a91.60.1790152657874;
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db883b5sm4314751a91.2.2026.09.23.01.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Wed, 23 Sep 2026 16:37:29 +0800
Message-ID: <20260923083729.64831-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region and only then stops the capture in the hardware.
flite_irq_handler() runs under fimc->slock and clears ST_FLITE_OFF, so an
interrupt can be handled in between: the handler finds ST_FLITE_OFF already
set, clears it and wakes up fimc->irq_queue before the capture has actually
been stopped.  The wait_event_timeout() right after it then returns
immediately and the driver continues as if the capture had stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a ("[media] fimc-lite: Add ISP FIFO output support")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0

