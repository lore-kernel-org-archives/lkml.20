Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424777;
	b=TLq2WZ3/R8cSr7LEFG/99EsrB8f2saHPPHjKA6WNjsjMJ2rhCH/BN+hMQEqBMaRaJSeD
	 1SAwXep5B9of7aUYVyxoYS6RqeNt47rz+I5L1+UQ4Tii8KfOYhSKha+rDeh7yxK7hpxCz
	 9IC3jEfp72UdWg46b8xq/8VHrjCpGid5SFFOP2WHhozw+1Nr3rBvXB1SGgVk3DCCpouRG
	 T6f8DJoEUZa7VX66IDfZtPBIX/X9ZPvdSsh/7yfJKCJomCKG6iaIk8RsPVpovzzbuiHqd
	 r9mf0NCpAM0LmhlwcB9Yx6hHcauvCC1dtWEsUra2kCxOgbY6isJbmjymXHE001NDPOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=;
	b=0j6oZrPy2FNl0oLRquitKCbATgvXjVzP/QdaNsRDe/q219uQvBb3hjOo+Rj+DR/qTGHT
	 H2+XvqBX8ydS3/x+5v861WrsHWyLWsWW3W2VMZi4W+9XPWKBLnxGev+iJb2FvJHFpiVKY
	 bg9TOSICXcw8F6rWrqwWiNan2Jg2oQPFF4Hnn/ejngpby6yoIoG/XfdHI/7SxOiqPRZwX
	 +LYLBhGyTscnJ6SGLyEiA5lobPpiqBlA4PsxW3ZEzXYnCNQ8mBMvlYwYFut/xEdbG/KvB
	 rupLT5Sr4xuF8cgwYs24y9U+7xuGzSSmPINLeGajPCdSJg6ulPTlPMDgNpiFCASvxbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rhkk0r71;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84A606A89D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF84A606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rhkk0r71
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1713955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424775; x=1795029575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=;
        b=Rhkk0r7187NiBG3iZmLJ82ucpVZb6+skuiA3EJAtnZZGeYTtYaaGxbiFq+VIbjB17s
         oMV/vwOSB1pU5ZZJZKySNWqV0Id5puU4Mqn9fl7mf0tnKAGkybyHPvDAW/LmMXfG2nkx
         XMKhNX0ywPxHP5xaUYU8561c+sxMj/KK2CqDchCKr8ASD5rl/QpOfQO1qiOToYo4EhH+
         ZP7bdQURYXXbGjrp8H7y+6IGEggyhYKz/VupokHdWR0zmuNOQ6VRAvBf5zqKPS4ybYVc
         XQtQoYZ0s0p9TgLgjsvdBP8gbnu5FWeNq52eEgd2iWx/dYRIuiuP1cW0Z487lItMRI47
         sTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424775; x=1795029575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=;
        b=toAdKjLH7SedVI2oaPgb3UDxSRShr+6nAsjN58ojVs3P9AArz4e8YebmhS5QcrGDvf
         lunNP72nrtoRQ3wKCOi1EkJX5RbU1MOfDgKDwzdGUKXhtaWD7Za/zDQUFi7fauMJA6XI
         P8A8W9zNDAe6KV7raJJ3qN4GdSCF5y8Q6YSkPJL32W3VTm6omNKjgX41PY1KJ9SW1c0r
         Izj6edLvzdvsBEXWxemJc8Eq7dF96LFG5XdlPjTIikicj4/lXOrr9L0esh854K9PDF5E
         ZuwUU8iJQ/zZFBhhVAKeAAtejsSCDlVsCKpfwwrhk1YY4pYxNfjZXRw99EKf5BizB0SJ
         Ig9w==
X-Forwarded-Encrypted: i=1; AL+hErGANjiNdkoYeKXY8zD8Nd6bToGO9DV8WLdJpJc49fobqxf7y/X21qfUqWmZphUEzZU+j3cPlUTyQlmzLR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DRfrJlzQfq1v3giD5MwFXREoK3HhEPp9OvHwxvVqJAHpg2fv7
	UCqBKF2oCWitpwg0qcSHAzOXpcV6nwEHz/Qyx48XjrZwZ8JN/MLu1v2r
X-Gm-Gg: AYBFou1tmnNSxp9sh13eLeRSvaQvMFX3scuDSn+bXWfuJe7SGw39ikr4yxHF1sOXEa3
	ci893BMuirz5xi+1cMpZ5o3yeGi14iBygcuui3K0yEAohJD4SLNqH+wKJVFztCXq4PRfLdA0co5
	pehIpnrdhvyopONAN5YKHENEuGVlFhK/rrXkyY6Daut+nYw3jLuAG5fTLfAtQ5xjymlx1pveK4w
	jti8ipUjUH/J/p02uARIW1F2dO19sGerGorFWj/Zm9AeSO5ane7iSwO58UPOGgoTQHbkm+tcKPe
	WL/SP2FSz54dSnb+pSWiWsJOS0/h/GU9uZkKWoEKtOl2RVkomQYXkK9I9fesL7rMA++EyZHb0Tg
	8YzIhI/xappaYEurmHdw7eWjUKa8c5te2Z2g7RO7d/4hkhEQW9t7NxlIz0AzGmq9QMkXR2LPozb
	/TOUtvenQe55UMEk+ak05kZxwrXkqTIwLcQ3/6jVA3diFwr4ueLznz9aROPSdCxite/tjlI1+MS
	ZF98Tx3f6TfMoSr2pH9SK8qkysf3uOo44UzblA4OSQdksFWJApr/hzaWi5e45VnMDEE03THOd49
	f1UQd7WohszVY1UWSOJBoUqGm1b3jQ3Asm/3vYEvDbm5l4PXNISPMyoYjR0r5E//YZRtKR8G+Tg
	4rgjbLvc=
X-Received: by 2002:a05:600c:154a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4bb4e27a9afmr8939145e9.7.1794424775346;
        Wed, 11 Nov 2026 11:19:35 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:35 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:17 +0400
Subject: [PATCH 2/4] serial: vt8500: Use devm_clk_get_enabled()
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
Message-Id: <20261111-vt8500-serial-cleanup-v1-2-b33594a25f87@gmail.com>
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
In-Reply-To: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=alchark@gmail.com;
 h=from:subject:message-id; bh=U3F4KrTDPJYSmcypcQ7vg8h5zcbvYzjMb3gEr3v3uis=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b//z5UWsc5NZVIb5DU+XLP1Sv+eZ9faXDk5bvnzT
 Ita76taHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz14deMDHcnrUhyk6h6x9Cyxq3d2PfwhqKr7VcyvvSe/Wt13DV5FRsjw6dfu4s
 /H+FgL5g14a/l6ziGiqL2FT0zV/7V0Wu6/7U+hBcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Let devres own the UART clock, so that no probe error path, present or
future, has to remember to disable and put it.

Pass the clock lookup error up through dev_err_probe() instead of
replacing it with -EINVAL, so that a clock provider that is not ready
yet defers the probe rather than failing it for good.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 6c53e108756a..17f928a7073a 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -600,7 +600,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	struct resource *mmres;
 	struct device_node *np = pdev->dev.of_node;
 	const unsigned int *flags;
-	int ret;
 	int port;
 	int irq;
 
@@ -643,18 +642,10 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	if (IS_ERR(vt8500_port->uart.membase))
 		return PTR_ERR(vt8500_port->uart.membase);
 
-	vt8500_port->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(vt8500_port->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return  -EINVAL;
-	}
-
-	ret = clk_prepare_enable(vt8500_port->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		clk_put(vt8500_port->clk);
-		return ret;
-	}
+	vt8500_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(vt8500_port->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vt8500_port->clk),
+				     "failed to get clock\n");
 
 	vt8500_port->vt8500_uart_flags = *flags;
 	vt8500_port->clk_predivisor = DIV_ROUND_CLOSEST(

-- 
2.56.0

