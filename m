Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88F3630B3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690719; cv=none; b=buDZomR3M0cjfyzdXQICiy5Vqeo3+WgfjWbCG4TAXO/arzoIMOAmtri23LZINZnb/PhdCm2MUdB7lUsJMdcSf5tMmURrYbxSQ2rWqLn0J538PK/3go/BA3dY6/A+YDzUTAp3a4um9a8vudkGa2Cv/tnoqo31J/1V85QSkpqIhVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690719; c=relaxed/simple;
	bh=rsYl2evSxKIO+SY5ef5tx8ssbRNTBeYHiGZ0B0zC0F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RbgUl9yXG6x1bqErR0EE26lHmxW35w8+2WBdwyx7TaAbnujo+Zcs20hD46GWQvXxVosm6G5HO79CYapLXGIX6vcMdh73iZ/8wiK8BKNlYiWNjlJVSlrLfKxvAe7hA4KCbSG6cgOD6nKj7pmo6VyfNkAIF6kCoX5u7Ibi3SxjGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGOGWf/K; arc=none smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGOGWf/K"
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-8ae946560ceso2838817b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690716; x=1792295516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuaSUooYMWjiVC3in8ithjctEvqzUlOvqy+QwP+9O/Q=;
        b=YGOGWf/K2syJkwyB/x8MUt0E2WuH/vILIJDu2edKk3jNkx09BmMFCDE8IY8VSjdwAx
         HN67J+7ECq/VIRc76YuM4BwY8q/oN6bW8nCV1obMsK38R2xj2OapbrcERtkganxCCOCi
         P2snNmjjlzKwBFtN9CBX+bx4VhO7pnpbfbHriqHIWrhrON3uLIqAo66BvQDY66ni4P9c
         X6S8e8pwGlHhmq6XijfVgN5Ev/nhd+PgcJg9AYzBLcv1ITOV4YtheVxi1AG9VV2GfRaK
         3hCVtS/3FVCeUxDq58SpKkGpYF4xn83UG97P6PFkrVHQRN7prtCz/2RyYchS66wf9xxr
         6EGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690716; x=1792295516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuaSUooYMWjiVC3in8ithjctEvqzUlOvqy+QwP+9O/Q=;
        b=vu2OdHcfgN5VgL/NfviwTxI3f2dVCJhQ+5ZkOj/uTR3F5tn6ywXENRc9X7z4qqzjYw
         E3RU2mnn3GcFofDnX9ZpN+KOkRsgIP1Id82l6mZFijmSKphgFVBX4feyRVROfegYhZwd
         fZ81zqb8L5tBgvF8zobWHOi6BvDJdkZm/kVudOQSQF7k1cdDitWHZ563eYYV5xdF/kw9
         nAfS9n0ghM6NBtJlNwxRmqIC08KbzsPKny1Z1bpj8MJiajt3NLDaNnO6lxR1UR1/Zc15
         W4LP6ve5RRdao43e1H1+4bBurWp3jcXxOo0G+2CuyS7wDzSfZd6U8xkJkQsRB6uhrpTE
         Wxeg==
X-Forwarded-Encrypted: i=1; AKwUvBxeknICAWQS+GYUHv3HfyvFttuMdqNOXq18ztkk9E0FgTCNQ8eDcmnvAA7cqJMjqhTObwUJiOUQkZoKQSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIi/VPC610/MiONrv+ZVIqGUC4djdCzZniYb+Y7bEuoT/NclhZ
	0kj44W7gtsQ54Jq/pX38iIUePuiSNGFPztwr4Z61WTFAfXbO6rHpQmSY
X-Gm-Gg: AYBFou0uQgM0JnKjFbbSo+33nfUiLqGVeB1FC1zh5b2BiJ0VlSy30Nu0XvA+JauOKHl
	P0FaeqQxnGMl4/jiqjqSeefb4TW9/k6s21sBXpha+n6NBtfwS9jvPxYVeeC6oK3qEIyEcThRI+u
	G8PopxBVzklWmRlCb/IDMPTgN/RfeE0bGXTCfMO31CZdCHBLSWlOOu6f7KnUyN7h4byyP59m7mE
	CclC4I/1roAbfsvqDjYefwp7p4sH80D382zwyFQzSowkuOi4KIibFK7QPaXOHdflWrEi9Uzp5At
	g2lwcq7Ja5w1rNvGJAoivep9eKX1BUPNvMgoMl8lX+Q1Szq5BsXL7ErmWtlomokNPO8O6pmoqYG
	iLD6ZaN6hGcweI817+C1xVlBKSWnsnnywZpuwOEBJpNCUg4TxxeEJ04Oe9bp6FQ/Sv3tVRk0ZTE
	Fqy9lnuCu7gZ1cmcdThCMYe6hyP5pLm5Tbcrj6CT2d4ST1K03S50tHOJNHc/YQU70nB+XpdFP95
	NrmPb0TFRkcguy6p42YbqPk9wvCbxkRYByxD2nM4IXmWpgZ5RA=
X-Received: by 2002:a05:690c:c045:b0:8ac:36da:c494 with SMTP id 00721157ae682-8b07ed14cebmr16160647b3.38.1791690715908;
        Sat, 10 Oct 2026 20:51:55 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:68ae:b2c8:bae:dcc6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f226b50sm22161307b3.28.2026.10.10.20.51.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 20:51:54 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	oliver@neukum.org,
	giuseppe@southpole.se
Subject: [PATCH net v2] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Sat, 10 Oct 2026 23:51:50 -0400
Message-ID: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
only checks for negative errors when reading the NTB parameters. A short
response therefore leaves the missing bytes zero-filled, and
initialization continues with parameters that were not supplied by the
device.

CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB
parameter structure. Require GET_NTB_PARAMETERS to return the
complete structure before continuing initialization.

Return -EIO for short responses, including zero-length responses, and
preserve negative errors from usbnet_read_cmd(). This ensures that a
zero-byte response cannot be reported as successful initialization when
rejecting an incomplete response.

The issue is theoretical and was found by manual inspection of
usbnet_read_cmd() callers with LLM assistance.

Fixes: 36c35416a94f ("cdc_ncm: fix endianness problem.")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Return -EIO for short responses, including zero-length responses,
  while preserving negative errors from usbnet_read_cmd().
- Add the missing Fixes tag.
- Changes of description in the commit message.

v1: https://lore.kernel.org/netdev/20261005041525.49111-1-xinsheng.zhu.ny@gmail.com/

 drivers/net/usb/cdc_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..79893d2342ca 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
-		return err; /* GET_NTB_PARAMETERS is required */
+		return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is required */
 	}
 
 	/* set CRC Mode */

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.54.0 (Apple Git-157)

