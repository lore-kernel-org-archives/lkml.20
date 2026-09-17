Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA44D8D97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673939; cv=none; b=YxAJNN5JfH0VcrpXIMSWwFU8xVcjRSR1fQkQ7ftQxgwJixdQzZnv07Jb8ddTgE3mXsxqjxRbeojM/rOSEwvbgm+H1MLNy+Ra1TyayBmoxcHI+BYJJxHOsU00TQuNS+6yNU7r0KtgJjoTflc40OGn8YGBapNxrIQ64b3h6jT/+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673939; c=relaxed/simple;
	bh=zlI6cPEnBqZ4NXZ39puSLHk9fcYVmQZ79vqcCv31lpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XOHRQD1+lP07wx/R1hNkS4rNCEb4pb2+QCK/Yzt+WWNMMBxPIB4QRhPloM+egZ7QvyODRe7BdgpG61MFE6yfmuTiFPXIKkBxYeeJpvQ4cPlWQj48umUbyZKrZRluKKp5ZFR6hfseIPDy/MiEmXQuNTN03kETqWYiOR+ywJDOpaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKfFNCbG; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKfFNCbG"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso563546d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673936; x=1790278736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Q6Ad+YbWNAFT1S/eagIuareTvI4szF4zzV0Tuqr8s=;
        b=sKfFNCbGpTNzeEi4ENv/2ziPTXiJatiCcyrImuWvgsAszaB7HN61JRrrd/XR+SbJNu
         a05eIETWvu2NtdSKYEHHMTFCeOQRv8jn3idx9svnVkW7w/FjUNF/ag5BkbNTIViPaU2+
         H1qZSdzd02z5ElFYYaBiW5LhPk1yDmgvpnN00+9mfdj+rJmsDQgYPGmy5KQr3OuMgBGI
         +xAJL17EF4GoXeC9Svfdt7wC/jdW5IkJidOsvW/zP0vBKIGi3bNB5x/Ac9HABHhOKnjr
         BZtqoHyzqA2E1NPHZm6MK/h7+LmH4M4+jg/nbuRkkS6CuAPTjzenNZApex5rB5aA5aAH
         goig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673936; x=1790278736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Q6Ad+YbWNAFT1S/eagIuareTvI4szF4zzV0Tuqr8s=;
        b=NZe60fVIGGmkB8s2qzr9k8uXmQ1qXc34ZeKZPHiz3J+fpawLzSAmKSPbYwK0cUf0Ln
         fzDahe4xzhtJHk53FbdTmas7vQyU3iVExRtZNipuy0D91CBOwgwFnNzn8eAvI2e9QI7O
         ZoPk+RTjCvW+08ZGNTiH94k299Gi39/4N2q+Ur7IBhf4pVHW3QsyFBXbPWOLRkILmdPa
         BnvlFFGqK4QtFuWulUgseyCj+YlUm5XH++FUcRmvCrg8SvcuQzhUXd2NwkxgQ2dn3vhj
         Tnx70b4afi2P6FpmIkokXJgc4+9We8tZFIjLuuvoUk44MgFP99kR2kBwsM6PPsYWBpZF
         R9Zw==
X-Forwarded-Encrypted: i=1; AKwUvBzGmMrfsQLkSsB2CyNtqj6lKzTmZxoq22AUWN1A2E/i6QliUZa2xEEDzHA/rMlj5KO4PaqwtXNZZ1YIzAs=@vger.kernel.org
X-Gm-Message-State: AFuF++m6eHPKsW0QH/zdNOMsivZ/aPv+fL0XaooBCJ0VT/bxxMxVYicm
	nj8FGunCyfKbLMu8FpUuqHijOpr9p31JJGAbMAxS3A6vZnUnH9pydLY=
X-Gm-Gg: AYBFou1bpxIK9Fs8oRrPRRS3pRq20RFr6cmjs7+kB2VmTu7f+2SGP6chZukOI0pfAFs
	Sm/nSQrQKs4+iAFz11PfDMBrxn/gsPJYDNQ4ROuGlui9AOV0/qwDH0JJPmYRVNH8yDEUNOLKDA6
	aNECz4AQI4sUbdd2A5slj2VoQXEfGDPP9LWKmWFXro5olVfFoVNwq2J/ETNJY9v2YCbnAClGjvr
	D/9oai5Ls0c7MbpWxo2CA0C3hfwNMzEJzILuvW5i1jAi1NeRMcJM2sPxlxXN98d5HjhF/edSXTE
	S3F9jXG0TUbJs7Zzezz06sSNuTlP6HHdxGTKe2HUICt4icuU2swskOqcKXLJOg4+UUk6xESoItu
	8BCrAyFk3erNrt4buAC+QGkoLCjHDYdoxdw9FVcT07PeuUUNie59GR1504d9fUzf19pG8SQluxF
	u38zktDIXMgTkio3lj4xLRCsU3VLSuuKd9roPExvgz7+2VuQ/mwyOyy/1dzq8bouRMXzUPcfdP5
	5BrRbsVIJqGNLCmW71M/0kZK/Um0a6wQyvw8Bk+gMgqqs+qG89uoWgkkTPnVv++wAVy9QDiWJCW
	W9hv/DPm+kGs4EKjc2s/C3e4ujs25tD5r1Rx
X-Received: by 2002:a05:6214:d06:b0:912:517b:912 with SMTP id 6a1803df08f44-91254cd0594mr3693816d6.49.1789673936433;
        Thu, 17 Sep 2026 12:38:56 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252ce6d54sm5254416d6.39.2026.09.17.12.38.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:38:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diogo Ivo <diogo.ivo@siemens.com>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: ti: icss-iep: Cancel compare work before releasing device resources
Date: Thu, 17 Sep 2026 15:38:47 -0400
Message-ID: <20260917193847.63849-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compare interrupt can queue work that accesses the IEP state and
registers. The managed IRQ is released when the driver is detached, but
pending or running work is not drained before the IEP resources are freed.

Initialize the work with devm_work_autocancel() after its resources are
ready and before requesting the IRQ. This makes devres release the IRQ,
cancel the work synchronously, and then release the resources used by the
handler and worker. Moving the IRQ request also ensures the handler cannot
run before the platform data and register mapping are initialized.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Validated with static source review, apply checks and strict checkpatch.
No build or runtime testing was performed.

 drivers/net/ethernet/ti/icssg/icss_iep.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec085897edf090e816b05880286a3f43c69225c8..fa45538f1faa6c8b44e7dd9a4ebb7269843b60bb 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -857,18 +858,6 @@ static int icss_iep_probe(struct platform_device *pdev)
 	if (irq == -EPROBE_DEFER)
 		return irq;
 
-	if (irq > 0) {
-		ret = devm_request_irq(dev, irq, icss_iep_cap_cmp_irq,
-				       IRQF_TRIGGER_HIGH, "iep_cap_cmp", iep);
-		if (ret) {
-			dev_info(iep->dev, "cap_cmp irq request failed: %x\n",
-				 ret);
-		} else {
-			iep->cap_cmp_irq = irq;
-			INIT_WORK(&iep->work, icss_iep_cap_cmp_work);
-		}
-	}
-
 	iep_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(iep_clk))
 		return PTR_ERR(iep_clk);
@@ -895,9 +884,24 @@ static int icss_iep_probe(struct platform_device *pdev)
 
 	iep->ptp_info = icss_iep_ptp_info;
 	mutex_init(&iep->ptp_clk_mutex);
-	dev_set_drvdata(dev, iep);
 	icss_iep_disable(iep);
 
+	if (irq > 0) {
+		ret = devm_work_autocancel(dev, &iep->work, icss_iep_cap_cmp_work);
+		if (ret)
+			return ret;
+
+		ret = devm_request_irq(dev, irq, icss_iep_cap_cmp_irq,
+				       IRQF_TRIGGER_HIGH, "iep_cap_cmp", iep);
+		if (ret)
+			dev_info(iep->dev, "cap_cmp irq request failed: %x\n",
+				 ret);
+		else
+			iep->cap_cmp_irq = irq;
+	}
+
+	dev_set_drvdata(dev, iep);
+
 	return 0;
 }
 
-- 
2.47.1
