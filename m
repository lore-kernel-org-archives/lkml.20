Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772460;
	b=1gl9Q3/9gHAX2e55XNzv0jM5NdPfYnxKux74JdJxGyC8SjlmqccoeE/I+rtdbd77YCKC
	 xTyIxKmW3h6EVm+M0SZ2eSR8eJerTWmelQSIREMW1jDTgLPDXm1mI9LVff+QCxoapBbJn
	 rJ5T9WAvJXSnoFOtRTJJje2hD0wvtc6wJQOqwsaHyj+jOVvF0Xdu1trRChjJwiTJs5JGf
	 Uq7OKJ2oQhs7oagfQ+gUliB6vfkkShLFi6qEsq8XTRv1/G5iRrJ5JqNBAAx27EoENwAco
	 zjgI0yvzQKNtMsTOuk2LBsNlVNmioMWrBsRxyvrr3WMlwes2wPPkyEVw38wFYoBuRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/561T8b2RxuBwCplKNcYjJeaSc56gqYrUu2RLjDgEug=;
	b=qi0ijofg+H5g69GfsUxGQoGbtJDwwA2yekxPa7r+DKfIeHk7Ly6F4/LIoZLpVHsGjWaW
	 ZybezPb1o+oFKd5GTFP1zhvUmpESEMsyMHv5iWusF4EdurYrbrsvBwXhoTkyBa3LXIAeP
	 lXx/VKee0llpWXU65wqR3P3rnk//WbXRVHNAQbqJtRUy1vQJBA/E2CkKtAn9yqDcti3cr
	 93zoNvUHEf59qAgWQEgXVCrl0SVNurQSytt3N3qS3faEk8yOhB8Q2KoFG15j2hM/3Sdzv
	 lg5ba1HT536quFlVHs9v2gfPpBX1T0LyzTEVUiuEYNFnLiaMuCqspqQNt992Y4YJ48A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7TsIVVk;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D6606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7TsIVVk
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d543b6b6so1390937b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794772459; x=1795377259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/561T8b2RxuBwCplKNcYjJeaSc56gqYrUu2RLjDgEug=;
        b=Z7TsIVVk19NtVa6edgu2WO3WasqQi0/UtjK8i6SKwOYuQI0j3n7pWeLFfqUaF/T2wv
         OgHRDB7yqwDNLFpScBIvKFJiRx1qK/ynky3RxtN5biukP6oL+vrm28fBbKNxpIP07AHr
         kS+nXU6Go/HOMp2DsgFHt7IV4k4eJr/drDD3Ai1mXKTsZ+fFhAdIaqvzNeERhCNpyhyz
         4LM5a6PsK6ctPFmNRX0aOzDkLyWi9PIL8t+kbrN04PQUd0iLsij5k+7g28p62cZgFcKK
         /1rn5mG3byrBazo6muIsSljvOT3AIh/x7aQs3ImgJdmj3vvxNrdTJH9U4K5A7I8UeGxt
         lUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794772459; x=1795377259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/561T8b2RxuBwCplKNcYjJeaSc56gqYrUu2RLjDgEug=;
        b=Lu00tQmcZ3pFtnoF70olQfBPwbb/dRS/clit+JMXqtftjgKwctYVn++VAuuWzPxEKt
         p13IlpM4mzfEytp0zYjlTfXR312PX9Dvs46NZEHo2LxLWlqFDiolJT5pPV/cyOyFqNCB
         2xzfAR7igX1FEKXj7He3qBLIYI25EF1KMuBNErvWcWz5dAU6Q/DnJKENJAd6gp7njAwL
         kielp3+mE5/FBTguQk/rH04VETvIXrJl7U0a+mtu0R0s57S+KDP2zsOwE4CodSauW5Ko
         eRK7/5ODBMFmO0aWluwE1Ze+9Em6T+SykV+WDQRrdnFEYTS8QHtIEfb9+yw04/+U4FRr
         IwAg==
X-Forwarded-Encrypted: i=1; AL+hErEnHwzUt/YPEph2N8euseXQQdgUbJ77maUEV8t2vaxZyhRku5bjQ3Mlvd2pisvn+9YDaGpvxk7hhxvIPAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z86obegtYRgWCxAiANAPeDW6U50cgJE/AoCKX8CS1ZDmKdleNob
	YBEA4gWgYO8nSKgAoK1ZDa3Ngu+/xJDukYQUWxHeN63AbmcdsiMLXLiN
X-Gm-Gg: AYBFou3/JofCGYoe79g9WFCocnOPo4j0RBzAff4+dqsrRRPvwRA7H2Wfj84bt1FLZuD
	xGB9KJ2cRPTicP6Mi6HXVFDg/2TjP5WT2GMCWIsC89toAD6GK1wWgGZ+nPNpjYCWu5JxmrfPkVk
	VCJBd4oarEmORBfZ2Z9n8J3Uqlz4xn+NleGsRIfJz+3KejX4JyH2RCbJk/If62XZOhnWuu/HpD8
	Au4pAnhF7ALjfKrUuoURf4Sk93vE3M9Rv9mV+w1Egfykc4FlkSpkwORhL6y3zTAMYTjwgroYdcj
	rJipuWc5NZeXjMIIOOyxpcW/EiDr0v9npsNF3fG3ARZb7s3b9gXORFP9NhGV+QbOjNDTgszp0tQ
	vReN3pLayczVOs0Vx9swwnIKh8GsK7DKoMU/BgwSPOK5gAZ9e73C3ZJq/WIWBmDIQ0Ur2QsCTeO
	EnBFkeMCxYNoz0QHqhUnodHCB3f+4HaRoI/KaIOUDihw+Tj6Wf8FmTAmNo9xteLpRht8pNWS0q1
	g2CK8UcQVdcm7cV3jbLd1KnNLPZ/y9h9Jl5lsOEuAl2fP6zYPRDQ7K6E8w5NyyoDVlrP6L7yvss
	saJ8UaODDjSrlhyEuBNDezLJlQyjyWKw4ozunWncK91AGVLxnzHgJd5BNF35zgZ/WLBIxcJpGL7
	4abKaJX0Lwd+uDpZ2tKTwaWkHHPQ=
X-Received: by 2002:a05:690c:c183:b0:8b4:cd96:e2e5 with SMTP id 00721157ae682-8b4cd96e6femr8657377b3.57.1794772459411;
        Sun, 15 Nov 2026 11:54:19 -0800 (PST)
Received: from localhost.localdomain (179-252-148-65.user3p.v-tal.net.br. [179.252.148.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm69816367b3.37.2026.11.15.11.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 11:54:19 -0800 (PST)
From: Artur <arturfaleiros1254@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Max Chou <max.chou@realtek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artur <arturfaleiros1254@gmail.com>
Subject: [PATCH 2/2] Bluetooth: btrtl: Set an error code when skb allocation fails
Date: Sun, 15 Nov 2026 19:53:13 +0000
Message-ID: <20261115195313.20809-3-arturfaleiros1254@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115195313.20809-1-arturfaleiros1254@gmail.com>
References: <20261115195313.20809-1-arturfaleiros1254@gmail.com>
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

When btrtl_initialize() asks the controller to drop its firmware and
bt_skb_alloc() fails, it jumps to its error path without setting 'ret'.
'ret' still holds 0 from the previous successful vendor command, so
btrtl_initialize() returns ERR_PTR(0), which is NULL.

Both callers, btrtl_setup_realtek() and h5_btrtl_setup(), only check
the result with IS_ERR() and then dereference the NULL pointer in
btrtl_download_firmware() and btrtl_get_uart_settings().

This path used to jump to a label that carried on with the setup.
Commit 9a24ce5e29b1 ("Bluetooth: btrtl: Firmware format v2 support")
turned it into a failure but did not set an error code.

Set 'ret' to -ENOMEM before jumping to the error path.

The problem was found with smatch, which keeps reporting the following
for this path once the RTL_SEC_PROJ read failure is fixed:

  drivers/bluetooth/btrtl.c:1252 btrtl_initialize() warn: passing zero to 'ERR_PTR'

The analysis, the fix and this description were prepared with the help
of an AI coding assistant (Claude Opus 5.5).

Fixes: 9a24ce5e29b1 ("Bluetooth: btrtl: Firmware format v2 support")
Cc: Max Chou <max.chou@realtek.com>
Signed-off-by: Artur <arturfaleiros1254@gmail.com>
---

Notes:
    Compile tested only (x86_64, W=1, sparse, smatch). The error path has
    not been exercised at runtime: no Realtek Bluetooth controller was
    available and no reproducer was written.

 drivers/bluetooth/btrtl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index d2c2e79800fc..35a2c9d3380c 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1143,8 +1143,10 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 
 	if (btrtl_dev->drop_fw) {
 		skb = bt_skb_alloc(sizeof(*cmd), GFP_KERNEL);
-		if (!skb)
+		if (!skb) {
+			ret = -ENOMEM;
 			goto err_free;
+		}
 
 		cmd = skb_put(skb, HCI_COMMAND_HDR_SIZE);
 		cmd->opcode = cpu_to_le16(0xfc66);
-- 
2.43.0

