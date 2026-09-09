Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09539343D63
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929714; cv=none; b=FuSGda/jWWL2FTPoK21Hlc4EOhUMLc+mlg1sZZAaL2r6t62SxIi35lXA9iuT+H1oMVvdPY3nYUrn8cs7GPqnYC48YK3BL5/5u6gxnTNCCDjRjdWzxe3FQSKB2FrLMf59HDnf4FPUV+8iItwqp6dnmNTq8ctHaY9VP85vJH6DFA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929714; c=relaxed/simple;
	bh=/jNbC5DebhzK+Aiemy35oWPeEdVyuqm+UDXrJimJ528=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skr97r3GS9Uvhm/vDWa4N2tCcbvqy5smYUDLZ5guP7NeQghp2EpJVjJuZGzCSpd5mjXXXgNg43ZKo3ajeMeNvjg5fxookHuQmxh2elF+YeIwC993sKnNxAHGI3lTEEhBveNhi2j0hgfucZtywZDgfuop/GaS4i3KipUO2KICpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiY83OCH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiY83OCH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d9db539a54so47981905ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929712; x=1789534512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu0O0pJmWewYzRf0DSsVxXq14cBDmhqpv1Ta+hWpqN4=;
        b=QiY83OCHg8V3QU3R6GHw2HdmuCNbyXXCNxeZ43y2I8Z0e+bsv18NUQdYRhwfEXaH58
         BZ/4i7vAwbw38rG8B4r36v/2Iq77+71UbQDPclJkeZNowtEQuHYX/uM5Qnwx8ar3pkMt
         wSafHYswYazLg8oAGza0vDmJjEgof91d4vV8LoBKE+icKYzmWEFhYMUsYDslQ0HxxN4J
         zOJhpEHQBVHA8K7gUtIbNP1INDldk728dRCVJigBbMNfE7dndhyF+APxviAyb0wRUDUs
         2Z0GXDK61z178+gFqwS1IUIBWpbLklqOFd1m4Xc30+VwQxnkFeWyzb2VGd3o/XTiDbQU
         O9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929712; x=1789534512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu0O0pJmWewYzRf0DSsVxXq14cBDmhqpv1Ta+hWpqN4=;
        b=MG44U9dxBLNStqoiBRUJhZJfnbQ8/q+MLj8egDpYMLMyGU4WOdmGUpc/VUP93dO9x3
         QT6pREmBEe5T1x4esWlpo2+VEGTL4anZP/SgHzkkMh/8tY19MNCdwaXlVxNM5u9UVo93
         pfCFJuoTi5Hu2WKaz5GpY4sRG1RdYYElL9/CMr9I7tTe885tWGDnf4Kce2YXSPL3K4xY
         XnlHivP+swKvwWYByrsPbIlRWlLRxAK4REpZnc2AnUXIYyZ5YqTsyVop4N4R1fsv5/yS
         kLB24zes/N5D2b8KW7tT45RPhF2L1Tr30ltpEWnATCWV1laUsa+mxpgq/j/DY2qAhEPb
         xchQ==
X-Forwarded-Encrypted: i=1; AKwUvByfTsLzkWW8DxR42cZb0wnQKqBXRUmV5pFCoLTXqKJwOLa+TqpSbSb4BhsaSrY7NSeBd3XcmgznoWRe8uk=@vger.kernel.org
X-Gm-Message-State: AFuF++n7hV2vF/3Oxf+qXDih8+kX4kKCKYOaMGa/Vr9J1SAaRca3dye9
	wnoo1ztUF8IPgfu23u0W/7DcaylLx5d3nEYDSeJ5/6cn5Bb/C2OjiW6L
X-Gm-Gg: AYBFou0I6iYD7c5ycOagEXnMNyBVEe4OHZo1l2bGRuf1hS01yF016iFW2IBHARcNQVh
	PHJ4u0icxIc4BnxwulqEocmu0w1Oc5WPqWO0FPj9K3KqeNruY/dFUvChWqGnA+LF3wRar0FhtAN
	fzuqGpsFNYgg3V1dYC0ojmr3+qJWqD2A63SO108E+QT9rP6M0vYbXPBI8G1RzS9tnhiNjZSANeg
	DNimFLf54998K7gT6cJdIHqYGqZFioAQibHhzEgHWReQ5DYtpgr9Uat4YiFlIsoSLnk8qBXYkJa
	0L/Q3NT52rNatlKpHGXEoWVJBhTBa5EADfamos1E8f5wA++AnYPU29nfm5NGs6pxPebV2zITilN
	txbPQyyNY0kN4WFup9MxPVwL/R9FP0AT8jTM9aWZFYAd1lG3Ray6d+g/3M0LjKn3RxFDC0xu3aR
	ScT4x4i7UMfZpPx7XagppWjVBKA6y7mdfwqcw91De9bfdMcVcYZpKUiqi9Zes1Dv9x/boByQrRk
	rOJKHtzJacifI01ToexYvFZt+TjJYLnOk3eKNXtSXk93TTH0DLMqZdnautYsV9GHLMCJpyornUE
	lTSXrKhkhsru7KI=
X-Received: by 2002:a17:902:ebc5:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2db1231f623mr518417745ad.5.1788929711582;
        Tue, 08 Sep 2026 21:55:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Wed,  9 Sep 2026 11:54:48 +0700
Message-ID: <20260909045450.16176-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..207aecb5f8b9 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2975,6 +2975,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0

