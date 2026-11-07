Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069527;
	b=l2WPZVwTztv7s9Fon85A0VyKWprmv+QkxrfWnyZcxqil307eaZwIzrleohsgI6Kuqt4/
	 hV+ZGYy5X1ta3vfuU11J1EtEF6VPi2NQQlZz2KmGJHTyrDZMkj5QTULpJU6hLgMocUhiw
	 +ZueqChpbjXDmH+55QxDnOXlhhB+sB3o9NqWfNtjMMzuyEaOWsBXgy3zEnvMpRS16ommj
	 /L7n25EpM0o+yfFSMNcFOc/EtV/BN/zRITgzWRtQOLvoczs4LoVCLLl8zRsL7wHiN2JHQ
	 +hejR4HMSJG5r4AcfiV+pMSymUkyejTMvP6JjooPvxu9W0Mgwplfc6zmg/7914vUIOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
	b=W6aPEb3Y6UDkavt+hlkgKIBLTCc1ETPX11NtjgbQ8fM8v2QmQypzyXPe5VXC10jn5bSs
	 vqt3YQsV/7b9ZR5thnABL+uXLC770rPE5vbOVXM2q7KgToVGqoMzNROUmdePeJ2nNsbsy
	 UFPQKurtoi+Lbsvrmi5Z0nZZ3DAA147i6H0wm1gyqotwPiIfJ+d0/JJV4avqLWJpJ2fXo
	 ZT/6YPC9Rg3YKY+Ti57srneJY3VqdH7LbivJcxytXsJxChAWlzsGZ/3m0HQUxVr43j9af
	 6N+x40GLhc8jy3qQoLPRZrmKi+N1gS6dGcJ847gFJoQEHnU0748ueHT73+zxmIn5ezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7H7fhvf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3F606D80E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F3F606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7H7fhvf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12027555e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069526; x=1794674326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=O7H7fhvfgXL7M/WY5QxHbEt8Tjc479SABQc9jp8hsBuZ+Otz3heuQODnG2JKpG9QI3
         CWbxfEzoq/GK6T0LBBuALwzHg+gvj1GwP8T5+Aiurad1giThq2qRVSN0lgFlDSuy6Gg3
         3uAXvCK23J0HWlT1QV4F/6cZx4i9NuptMOJzqtAL/ywvF9s8/8ehxGIeKbL+nijXWRmt
         oqVLlDZMURYpW+kfzh1gkNflZ5WMc9nk/tGqPmOLuy0Jq/RM7NFaDvlvYrIszLSN2oRW
         45Vy3p6jcu46BvmyVtZH1EkuaKbesoZ1ksYY53EBAvmee+DpKfJFWoetPbNsvmjK5YQu
         49rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069526; x=1794674326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=ARAJeRM42EYgM9fvokNix8fsqUCMFqav5vAqyRklvteb3YXfBE1vYnz4k3s3o03a0H
         GTicTbRth9Nnf8hXr5H6ro/sxeW4SmiQ3JIAGx+1oM/4ZPaOM1gSlgn0rhT28JDZi04J
         oA6ieOR1iKpgR0ZJOsoQuOa21c7+Ec1Qj0cXYjNNrPtUy/+1ZPu+PibCKp+fJGU7LCMY
         xPLNzAGQMW2OwSQkhAavTE4HyZpQmqScXItSjbi0olRi49HEet2A0bRTUmMlutg7u0KN
         x0OZbhSUm25gvXrnuaHqRlxYiF+e6cEjburvnTfVxjEWj73SPEZdxgBDmfGHzzEcmUij
         t4tA==
X-Forwarded-Encrypted: i=1; AKwUvByCF0+0KpoN+dN6q2h/3tI1mr4JYFc+NKixPpgsM6nwrRym2bkZoh71fUDN0r5l4yVXR0Wh2+SOsvHU6Ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aFKDOjox8F0c/Sb4M1wY0+QKlBykx8fZhQcQuyM8GTCGgIbzq
	iSMO+4I7LcMDtFr9ueLahvTh5W8BD4xlx2CrJuYGC2BuCrfd2dIA1hUw
X-Gm-Gg: AYBFou2fIwJwwfF/kUzw1lbdQXodOkpJ/tGCPVQTJ96uPacLpORRvij9SHzk+sOGBFl
	rQSi1sCIDFRbVQV+VShowLdg++2mJeGQckv2ylwlKJTCY1q27iMs0FVFwEcFeTNOCqLmG0HAT7G
	zYvMxKUk0nPXTxbCYgRcrqR6UcegQyNAjYq/k0js+ZSGg7POcypameTo/02pGUwkbcbPfu+H9+d
	4AdkWEwhYejaT/x/ZRgGJpluJpHcL9hq6hRg48Fyq2nPUG0nosQA33HDe7dcgydkn1pcb3anrhY
	s+zwnMTRYe1ENwL10B3s850UBRKvDsINIraVdsVP7oBLmKH7Co+5O14qa6h1TsIL7y19Yr2gx1L
	eHdOo3gU0vmYjhWujYnkMZsp3OyGe5GMhdpb8/ydRR2wtocUbI9pjtQ5hijqZoQg79x8GhtF1zT
	OLKkUebw6FVgclerLdq1RQd3o5LXgwYyc8OmaU95KdpsiS5n0Jc4uN9/TFDcBHaBRUhHbL7a5xq
	zgv3OopdrTbmfSDaTCAwhTC/6jS+Jw01twxydijR2ZA9nGz4p/sU1N1DW4kNqNEgrs2JjURN2PO
	QnJAKT156wifUG7YnLAKHwLNhABKITNyUEcohwNwS3FMpHe2z8nWjMkh8ghj5HzmVWbDRUDb+e4
	uLZrd2Ft5SwSSZFw=
X-Received: by 2002:a05:600c:6206:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4b6dfab3fa9mr100515655e9.20.1794069525785;
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:08 +0100
Subject: [PATCH 4/6] firmware: raspberrypi: Remove unnecessary braces in
 transaction helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-4-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=R8pNK8uv7/mdLr9QZyRKpk7qvj0fnfV1DdkNj860TPY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QR5PC7gaudY0cAfXzsqY320Tt41IkMhILgT
 9tLy+DoLZmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z9LfD/wPxoPXBI8XQxGlbbYTYfiKQhwcFZCxfqsS0TSYyMpXwXZ8sNE8NR1klea/xDW21FdP1fY
 B5j0hRrWlV2t02OtXlRtB+tF5yrK5iS7NyomAbj6hD965lhsfCEyqIzTlkFEPmugmTv4oAWCuGq
 E30g1unfsaCVY6hK9Zwy1HT/0qpXmzFVy6yASSHkL0Muawo/ha5pr3HBmjJtZEoNlXBYp5+EoIA
 b3wViy/dCGa3RzGRPADQgwmcCRdtabTcrdMqVMWxjK/bV51K6OrjpLUESIwf/d6f+6UqtpV5eLw
 H1e5FDbzNPAcJjwwD/FX15Bn8B7xg1txHzWs55Ngcal57l2E1glmXwL7m1rIhZCkj6BZQaffBwl
 vgomsMYjggBb14uQ1quJV3JNKTiKFZgezhISXlLAWqu+WnK/vCMunnyhM8vapKRRbWhtDydNOFY
 e9QFSvjjzpY1OlKW53JplNWTmi7FI63849bSjQx2KdYmJUyjALLSQ4mmbQg7IRIQ7w79fQuert6
 SuMZWftAHwJ9q+bHkpxu9ev8yCatOSSqMsXwoxNnoM8N+76TJ2N8UGOserUkaSbBKaNWOMtFmUB
 YICz4dprytiKYMKe6q0n9gAYPJ1HIUq7qG+WebjY4sYdNCSqtwZv3DWt45RiXO/UfrgiCteXp+9
 kom68PVTxmIMbSw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Braces are not needed around the single-statement arms of the
wait_for_completion_timeout() check.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..d9a569a6dae7 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -60,11 +60,10 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, HZ))
 			ret = 0;
-		} else {
+		else
 			ret = -ETIMEDOUT;
-		}
 	} else {
 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
 	}

-- 
2.56.0

