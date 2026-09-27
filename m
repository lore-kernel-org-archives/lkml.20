Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF03C1D6E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541801; cv=none; b=KtqYlksP+0C5J9OMTDO7DXgs5U9r5jfGrUdCTxcXz9wlarZ6X+OD6/EDBM/yo3vfDIrDW5Z7JJ9XB2ta7nACbt9aPZuv0PHCpMR30ZR+iu+QaZkDBMeGwD2PZFWh9okYac8Ip38C9+jhaFrW8zYNoj7ky3Zn63Xwkhf5YPxtkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541801; c=relaxed/simple;
	bh=cjV4NaIZQhTz58n8weFbuvPw7BYuUNcYI7Q+DnPUu54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fg2RcokGPTZblWjYlimKRO71wDBLicf9xuapACa5DkTQ3OXpT/zQW2TwSJP4MHKCXzIXM1bY/L92EjIPbYo30TMfiRC0oIHiJrdSTmS+PqudFaSY2oVZdestH2KpVh+H4vcpQljmPNoV5Ei/Lg4vhBVjPDI/+1Marb5ciatRnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMbgvzrj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMbgvzrj"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so10454465ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541799; x=1791146599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfUIOw0LZDaV+qpARbEy58798D+e2vA00v6oms+VU5w=;
        b=tMbgvzrjyASjoCvjCcMmnp0uGm/QCHXhSkaNYD1pOQ9kLi3J6aiOqGKgdRKaeOMLWU
         wvPzaRKOfnJCtw/UJHb8a30IBhxgBZ8bz2DuLNEJZzPVHxMCR4KeL8h5iEs/uYvG37gA
         WLFFH3nHBRLi6fs5BtOC60Gqpj22vhqt4Y5sj7ltHA1Vvbj5eMXtEriz3f97ArMbgHFM
         hEQmX1s/qToo+cBb9YeYDGfjRdjpTj4g+9QDiYIXpWJg7o6NH9bqCBUryFiywOmsFXFH
         81DQo0d3yHPp8Mg+9a9ybL5WKdXysfMp9WmbbsTVylWms6bMGgSDwC/LhAUwG8QF+/0e
         ddZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541799; x=1791146599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfUIOw0LZDaV+qpARbEy58798D+e2vA00v6oms+VU5w=;
        b=Bpod5dM4AJpBEhu/TIST5+24ckONaixC4U/I/xg0+HdTTKZGUG19OTAFjy3aYHQtur
         FZH1mUHFIl+X26G1gWaLhY6G+kxyGRAfnLPq3uAeSLuYwbjvQnyfBJ8462c8Wou5G96B
         +v2sVN61oUlJrhIJ7PSCGfW5/4XtAf6E1v4ZnX5/S2zWV+8+AWZ1NsuFCOASA6w778sj
         yjNk3FAkgJmD5wPs4LybkNqtxhvrbMZ0jSBMF/mETqUO7bsiAcMLs8kUadoxdGe8g8nI
         hKCvW91ZtG5NUZAM+wJS0zm90SCrujUHypfPO0tsstbSUN1lPTHl/nveALGDeDX2jqep
         IN5w==
X-Forwarded-Encrypted: i=1; AKwUvBy0Z6pp60EHfY1jxdEoF+Y8Qj4qrAj/exIw3xWbtI4AMDMzMDgYZvCQmKJ9tQDxP0nGbkjUZrIsE/tqAo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrsXlZUG/UDySFypPvtZaiFyTHYYkqUhNRQv2GpthPiWczrY9b
	aDLsnNQcwstxgstWL7EcSW/L+N3q9eD9URaCjhGxhHOqizWJmYo71S2S
X-Gm-Gg: AYBFou3OoNtcm3TMf8Szb2KY3UVYBSTF8KohIXue01sncmDEQcAMlg0HO0qyWS9qZiX
	pAkhglLkgoSftO48Cgs25tWj7WUMnUmikSTVHD5t+SXe8zP/kk0RR9hdtSvqvHBuJla5+Wc1O0T
	e87ny8nzPPwWAllVXbZzBfEVs+/MLYZk4yMSp/B3h3Ju6HU3rLIPnVTB4g/CTpALZeW7EZ7piZ3
	RYabfxYJmT/cV3578Q1Xq9EoRTxBWgJ7EzqVJKqYHWKiiveSkCb6gsfCvXRFr5LvhlYXi3r/ycO
	qxRdgz41jlXW3hQYW0j1H0TIy373H5Neu8mDI+K5O/Q3JBe8z7GA9uiZQCeNW39UPbOB1fTkum5
	1CHyb7uvlcMlzXlEJTCpG/frRSwB/F56pXUwxcRByjxR7pVluX2ySJgJ5pCQnmzZ8l42amXRCjl
	QozuFYDEUdNUIs+uEgxqFFrqt1SaEwVOHJCsVquE97PKz5/Rn37yy7qA3sjCR2tvE69Lw82Svkk
	EtPA/zkM5qfB9Dojk5KrSYMgVTH6nXKY2cftCpom6u3WTwzc/flCcamHzk2Mr0of3saexPkQUsQ
	11k02EjALIZ1HDzM9INrCpcMIvqs6W4A0RiXmglLpeYtydLw
X-Received: by 2002:a17:90a:d44e:b0:3a0:bfa4:b966 with SMTP id 98e67ed59e1d1-3a0bfa4e2c5mr5503688a91.61.1790541799021;
        Sun, 27 Sep 2026 13:43:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm23288711a91.14.2026.09.27.13.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:43:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Timur Tabi <timur@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE QUICC ENGINE UCC UART DRIVER),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH v2] serial: ucc_uart: Use platform IRQ helper
Date: Sun, 27 Sep 2026 13:43:17 -0700
Message-ID: <20260927204317.21546-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid calling irq_dispose_mapping() by letting the platform_device
machinery handle it. Also enable possibility of handling -EPROBE_DEFER
and other errors. Handle before any allocation or anything to avoid
dealing with gotos.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move platform_get_irq() earlier.
 drivers/tty/serial/ucc_uart.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 6b7dcbbacd13..96e3c9534de7 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -26,7 +26,6 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/dma-mapping.h>
 
 #include <soc/fsl/qe/ucc_slow.h>
@@ -1238,8 +1237,13 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 	struct uart_qe_port *qe_port = NULL;
 	struct resource res;
 	u32 val;
+	int irq;
 	int ret;
 
+	irq = platform_get_irq(ofdev, 0);
+	if (irq < 0)
+		return irq;
+
 	/*
 	 * Determine if we need Soft-UART mode
 	 */
@@ -1338,13 +1342,7 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 		goto out_free;
 	}
 
-	qe_port->port.irq = irq_of_parse_and_map(np, 0);
-	if (qe_port->port.irq == 0) {
-		dev_err(&ofdev->dev, "could not map IRQ for UCC%u\n",
-		       qe_port->ucc_num + 1);
-		ret = -EINVAL;
-		goto out_free;
-	}
+	qe_port->port.irq = irq;
 
 	/*
 	 * Newer device trees have an "fsl,qe" compatible property for the QE
-- 
2.55.0

