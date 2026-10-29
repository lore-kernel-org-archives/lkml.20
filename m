Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297483;
	b=befk7S8RSW1fHroP6CMz9di+nl5DI8e8mjxEFXJPxLVK+4PyxKi23oZm1sqC5/YYCknz
	 5CHsGDU/7tbu0s4sNDltoymVmOyyAOk3bcnKWS8mcvDmlhlZ0ZpKsHOFh0KriJxwP3gaR
	 Wtvrfq8xvPDdxHgSrxM45C+WIoVV2p6gWPcnYXKnUG3bWaEaXVPSv9Ne/Mw2Z7Kwa9SIZ
	 Qo/0DS7LieAXSnbaVjGHCc+SkIQBXzQYXNcdyQPOSFqHVoHaJuOjJoEQI0wN369c9iZPQ
	 qvQmq1SRJeidpvDFmFyVbZinM2arBvnEP9Mnue2YZWWKx10d0htlxZvZUxPgx0ZafwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
	b=wX5WFoW3Rsec2wY4/DDnsAJ0E3SZWN7bUFsE74w79lFa+yTCG2/6/DtVAWXq7zIv96/5
	 mmdHV2IXSnUduSCkSIQndKswtJ/j1VcQHzqUlveVm0KUhVKAanx9s+w8w9uOQ0DGlDiDR
	 EdjqX5aMomnh1u/VADKUmBWaGwd3TMnW2pneZ92r8mtiWCIQ4hHW5IzBbn7DD+UQ0JDlC
	 uxkcxe8b21NSNga6LCfCUylvYgTxbL9cNa5DdyA4gcLhIXL1TWKhAe4FuOgvo5Pfrh8uT
	 jzbdqWP3GbNLc3IKBIMZwgqEOYluK8DCozpgDjDOLnWuSkOq7OPRgAuE5Ne+q4bmusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA8DGoIW;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4796C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA8DGoIW
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06454116eso1349113b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297482; x=1793902282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=kA8DGoIWJVfUg2+8TEAlcr02qRAas1WamLEw9se1oDuyAL6mB0+SBqZ2Nhf1/Oi7P5
         jFugVvRpoyquphZi3pDahK3ndHBy/oE5v06JdRDwkay2AeKYOORoFPjvce4cv7PaMp1X
         gUrvj1xqKfMRUsf18jwuv9+Vue98Z73xAIF9CN8thmdFPVOdmtWcGh1MsXhOhZMUqjz3
         6leC0g094Fei3bu+gg08o+MdYiksIjlO1V5ixDt4V88mcg52fpP7nk7f72jq6tXFylV0
         r3blh61v2dWDbXvIUUlR8qEBGQYnA0rwpXClq0YGbejOjFGkRjzzaMOaL1qHt8DYmcw2
         Kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297482; x=1793902282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=K/MTSt8Jo0/oQ+UP+fsv2HElN0vPcFtzD2Wc3dBum0Tao06pjRALBlNstgWgNBy4tf
         b74CNLj7xVuIPYSJjQCdVnkt9gF/+/u6FfO5ryXJa0QTpx4pW3hE8WbHma6Oidk5Ic1N
         GRbV6/XSTpLTBx8UGl9dCsMb41ZYKAs7/9nLbklZCKJUMbBIWHfPyQX+dc+TF8hKbymf
         kVRRNvcEXcDBlym/wGbFx6juhc97k7hhVkT8XNmMAmk4QPsrYwmKzw4jNZZVMhY6i37U
         9h8mvuyDGuZPSuDi18Ew/gzfud7jTmO5wwKpxxHpL1/xxYFEcB2dTu379Pif73k8psan
         +eBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY8pwsDZ/gRV9lDR+x7e8IPpuU2VTgWHxDDlARvEeEGi+g+QpKMpoHFd1bjL/eJhE/FA2gtkMcJ6nVKhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/1zw+qaAoK27veDF5p6GWnUDWdE7R1XF5n7klma3GLUi4KlY2
	NTv7ZB3zaSnkL6BuBl5pEbK7gP6GG4spPTD93/ypN5Dg1ZSqL1VveS4=
X-Gm-Gg: AYBFou2R3BzRXB8UYmYa1U7pF3loVDg0+jlXn+0RCKy5JrAxbA05mO06u7CYVhfqBet
	8cIGxh5XNKcqu5x89q8sH2t3uwaCNMHtd1nE7+fhmXDDJ0G0YM2H34VRsLFctyIDc/eI5CPczzX
	yP8a7HySAYXQrESJqUcTMQHHId6DRUobMdJ2GK1LfkkDcWL0Y6sm159SdCofHJL1tPbJNKlUAPc
	3UzhKb2vM0WyD2elyZuo2cl2xgKQjy6yIPBCh2Fh4hOFmZxXTnvFutcPkFypmfbJ74enxe+CzgX
	J7T5hal3yYNXJ+tYXggjlPJAMXn8o3GqTrHShw4VZ+ni2GCxf1Wzlk+YNw0JOC0AkKcOPlumM4Z
	1j37pZXUcOy/zRESfVnTx4jIvHb/uokcni3pV8+ABLNTb9/D8t6TT9it8iX+NIRoiTqDEbgmmwz
	+lhWAS2rYkRXt5F3n4K7IUCifqxQspWrsSIWe83nxm/cBCZMxKYDg7Y3TeSLZH5OmYvCx9uhMkz
	jimJCGNVTewcl4zWc/XC3Rj+7sL1XL8sHQG18uqgzjNDdzvwWQlZDGaHxSsUz5f5+4W5S/5lhdc
	lnt+kjfpz/hEAW1fnyR+CpArIeEJHkb9JIIWk/MQgKp/cgCmdo2x2uFRzfu4XLaswV57
X-Received: by 2002:a05:6a00:22d3:b0:8a0:7573:4f20 with SMTP id d2e1a72fcca58-8a6e471283cmr5172733b3a.4.1793297482533;
        Thu, 29 Oct 2026 11:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98643466esm200114b3a.2.2026.10.29.11.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 11:11:21 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Fri, 30 Oct 2026 02:11:13 +0800
Message-ID: <20261029181114.78137-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpcif_hb_probe() gets a child-node reference with of_get_next_child().
The HyperBus core does not consume it, so the driver leaks the
reference on registration failure and remove.

Put the node on registration failure and after unregistering the
HyperBus device on remove. Leave hardware initialization failures on
out_disable_rpm, since no node reference has been acquired there.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Move of_node_put() before pm_runtime_disable() in the remove path
  to match the probe error path, as suggested by Miquel Raynal.

v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/rc-review-20261023-ai33-33-fd231771d138@gmail.com/

Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
CONFIG_COMPILE_TEST=y.
The object was rebuilt from this exact base with v2 applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..ffa6578b5d399d19d3cac27d7769cccfceb0be92 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		goto out_disable_rpm;
+		goto out_put_node;
 
 	return 0;
 
+out_put_node:
+	of_node_put(hyperbus->hbdev.np);
 out_disable_rpm:
 	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
@@ -159,6 +161,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
 
 	hyperbus_unregister_device(&hyperbus->hbdev);
+	of_node_put(hyperbus->hbdev.np);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
 }

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.50.1 (Apple Git-155)

