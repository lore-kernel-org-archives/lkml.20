Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044737FF54
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810500; cv=none; b=iZo/x61oS+dNswDT5KylFthPAkxjCPyew/efGnhZvNlliwmIDpwepCZkvVAoxIjhYbZBl9vhhO3AzvZZMiwRP1y2N5yy/Ui27fgnG3oBqFRV6S1DsR8qhQZDzeM0sGMM/ZAdAmf4C+LDwaGR4lh1zbNKNrFVahu9llZa3l0F/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810500; c=relaxed/simple;
	bh=65mXLx3TuGJ0f/LCFgR008LHs15A4PJ7rCGI0Tetsmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArDwPbn6gGZXnBdVgM0QY5Jigl5kUUkjWbK7/T1L/DI9H2lhsTY7ofcsTqKRb7Ex2wc8aBU3KN1eh0NNI0dC7kPKN2Mno0gXqfq4WNKTMcxR1YxY3pqUF0uFqfrsIlSLBaB+g3cLFWn6dPJMqMPfelYM+9ruZA2xBIX0Ols0ecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=av7NSowY; arc=none smtp.client-ip=91.218.175.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="av7NSowY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=65mXLx3TuGJ0f/LCFgR008LHs15A4PJ7rCGI0Tetsmw=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789810493; v=1; x=1790415293;
 b=av7NSowYEzYTq5N4jA8AjBAS8IfSKw98JAJBaBGj5b8lD42Jeo3xLgPP3h/2bz+kCORVewJI
 Usf2qlYxGkcY77q5BCk8dmxBCGpoQaYSspZZf2kBoRYnivSAz0L8oleG/0rgPZLhB7HwQlw/HQZ
 /d1wVK8tEHKSFwc8UTPmE0Xo0ooXcZnbrowY+Ef1vyo+MtJxOw7CN/8QTBteG2IuVtSZZfEA37y
 S4v7VuH7++CzxOFYnmPvBIRgFzKnxRtBFW7kyV7scycz971RzXNBTQ51FtUueRCAFn56UppUjY0
 DV6xsKtZF3f3Gor/PPSmyq3bDerKP5bft+k9BbzdF4s0Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f2dd4c0c3ee56a6a;
	Sat, 19 Sep 2026 09:34:53 +0000
X-Mizu-Trace-ID: f2dd4c0c3ee56a6a
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] media: rkvdec: Remove redundant dev_err()
Date: Sat, 19 Sep 2026 11:34:43 +0200
Message-ID: <20260919093449.2534901-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_request_threaded_irq() function already logs detailed error
messages on failure automatically since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
So remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..13d13c041509 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1824,10 +1824,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
 					dev_name(&pdev->dev), rkvdec);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
 	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)
-- 
2.55.0

