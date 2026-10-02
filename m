Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A7486B91
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936123; cv=none; b=SJIczlg07VRS0tlD2OAtkLXSIJG3zzxcc0IC9JAYQPl/oW+5Z+UJXw7JhvMxs6lkLw0ecjZ3/ogSQDUGQWAJs+aR2xZoKtYkGdCC5aPIJeUW7LjiRWQM8aMK4/S/3JyWv9+1FM0aNFtvcLpINURrMTFihqIX8ApfWYQte66x1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936123; c=relaxed/simple;
	bh=KMjuaOHOqFrmY602m9zMPbWxmtObS9Zd+PMh4NqvwCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKhyK4jxWgJLbW6V9yMGYrw5INuWHYNvuHEsVmvcmswXDWPv0ptGMivODh4ioF7zKz7+rXF/5+msAZTrEUtTHbH8GqQRjEbJce+4xMuZ14CwbZIGOW7mCBIlzwEJ4eL5X3Zv2c0uqXvXJzZjmBLEIG8HsB7o8y38s7RLuNqJh/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amrgnd7V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amrgnd7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016941F00893;
	Fri,  2 Oct 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936121;
	bh=hUIczjlQgItUKtULXinpPwz0pBZGVunsBFS8FmB4xbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=amrgnd7VI0cJ5vh1lUmir3EZ2gzXOksjhkkXSEmx95azj4mRpUPpySPUadjuajA7H
	 ynO/Ci8lvaOrw5s1ejjBMGdurwVcWQ55h3zVFfkQtDlAswycpBJBnI/tz2aU40Pipl
	 QzHO0KwFiDBXrKxpej/OnJuQmHangbuyRm4YkZYI4KLoLrJ+mq8KU63LKgcSEDMkGi
	 V28jQFNCxdBM5ubZez59T3QSnpKUpZ7x/rTjuireyGOFwLfQp/J5i5omL5TQwwvWUJ
	 MLNY/pHAVqe8RgTr/4FEwOZHicXNGeNgOIAE7nzdE4VSqUTGFOxBy3qit3Tayp4cod
	 pIHupXLUaBU6A==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/4] slimbus: qcom-ngd-ctrl: Remove redundant dev_err_probe()
Date: Fri,  2 Oct 2026 11:15:05 +0100
Message-ID: <20261002101506.1084743-4-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101506.1084743-1-srini@kernel.org>
References: <20261002101506.1084743-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pan Chuang <panchuang@vivo.com>

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb0ccb31e907..4124a848676d 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1614,7 +1614,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			       "slim-ngd", ctrl);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
+		return ret;
 
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
-- 
2.53.0

