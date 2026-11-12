Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497654;
	b=njT/72JTfPro5+QvlpiOnFaTUSFHaVuF9jlkVfmoFXIthRKxQbhEYoxM/B2zByMc2LV0
	 YXXe3Z9zK3PqY8RsL4v6p5BXOcQxgsw28oNOUtKwMdLemABZBIjCd68aoqoEJCxwGk/GR
	 zZpkMHAijUgvsxajByIAXsiUvYcoPnjbe0giGn0HqSe4U5XjxAWHrrs55kbfOXguCi3Fo
	 f7AwLYdTmYyGyKB216ZpX1z7h+J82OjstmdpycqPNHnj0W/6vPdZttfXUc+DnI7E2iR21
	 ziYCKwbDbBkyiN8KJOPtjKDUdpDxrB9daiupiZmsgAsRRio2ctgsgeIfauroOBXxxvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=;
	b=3KrXVGOQMwg+fvFPignqN8GA2OQEHcTlZ7QoggkHpYZye6Qb8SXN2/mqhJVOF9KaPLbF
	 /v4w4NxrWVXW6AaY5Alj4lqxFWsNP5Z9tpTKXJ+4c6eFWtzkOp7azOZlpr32w40DbMhFe
	 xH0hMgH9uNQOrR/0lfb9peU2mcdz4VYGW6jROdCa2bTaJ9M9jhDXm0hobUUd6Uys3Blu8
	 jU46sOmCOa1PwU8vmTAvJJJwLCfMExvloW7+/jbUYL1gsnbCaMDeMvy+n8yfbawsNhVjO
	 9LsZ1YDSSAPldWnGji+RBM4FDckPaboPfz/g/tag6bRHOBtTcCZM40/leCpkYhDn6Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxNjbwmZ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FEC606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FEC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxNjbwmZ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so55109075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497653; x=1795102453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=;
        b=sxNjbwmZPaQyz+cBwcCUG/xCJj8iBZiKeb3p2u1UTSsQbYc29isVuWPu7oefWSAQkU
         MJgvbvhqxRkt6r8tr66j5UudouwUcD03S19gbhncBpgZa5jJlUhwt9Et8N1Oq3oKTtNG
         6YHmPaftP9DgVcPd+6qLm/CxGS7XROmekVuWR8gEfIgFiLgHmQq42UaHUHaaPBYR1fiP
         4+Ws/JD5tza3DW3iY88EheqTzQeH0voyeijOs2Q+xBt+aNwGg0aUonjtAGnafFNKn3Bb
         nkAYQormY0SfWsBFx7xADXnjZjahbU/7tW+DhODgmzXbG113IEJ63HlN/nw2iMgegXLz
         dOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497653; x=1795102453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=;
        b=Y2PTj3Ko0Mq51Nld/ZIirlvYdMdW1rR4HzqRSINixZ5HRJstUcuCN6D1NIGXM6pN7d
         VBBn6VnX3FxGtQM8LLvp2YcVbJ/x5W9guBMsjstWz39zWsj/jBi4dv6Mo0uyI3JxnpeF
         OwgagYtAFpI7a3Hv7rVvCXz9LddTdtSlqSKa0oqO6M5/8eaLi0BFj56/qRqvvdwR0CtS
         0AsQuAEgw3JoFy2rWFTrkBffITONVEg6ax/IOucrcmEjhyOCDhJA5T6n8JS1ByYSThWW
         gEjRWH3W+KL8fjaP4QQNt5c9uZ9qHZNV2kKovwGMyEA1UBMRkFRB0b0Kv86Qumob70WD
         cVNQ==
X-Forwarded-Encrypted: i=1; AL+hErHeNjEsaYhqtSZCJzCHh40j9YdpTTQTFheR+1+IquZJrJJE5PDIW4AfiPNr/pbUEHasJj9peTeuZDUZv98=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C2TrUUaaR5JabTliA+wV27zUfobxJ3suIZ9pYEPfLp6qByOLc
	+49kuiAEsyzjxrS4JEnQlh5ylBmxvSUtT1PTdcMblwL5uelR9bhK+a2f
X-Gm-Gg: AYBFou0XhBEnBo9WvhsSO6XVUdEsgtNRRbJwL+9DQd9uvtXxaHkrk/hzOVLx2psKOGU
	2st7SfiJ3EwkYBykKlSlmzTtPea2oHH7e0S6noR9E1vpByovH9DAJJqkQUnnyAAJ1JOc5BDEHx6
	gkLQbdsilfjI7d0jc5WFeuDxPXIZhWApFMgO5hiPVtI0kthatpgpQUNSBZ5xBrhPRl0X717eVFD
	GZfOM+ufoV0KFPO2hFRwOe0zkKS1w0TR/6jued0yfmm557Frs5HM5clW71gbUFyfzIUqyXxLUi2
	gj+OR9p2vGLrmakptqLl/dmLeE4mg9BPDGf4WU0dKSeDqNZRO1rXZzni1FrSgxB7ho6/VKpkbcA
	ClwojQaXmsORYkTnp1iPxue2uX2LCQ1etNxexeLkM/Q3tP/F7knljtOxM+tEfn9TkhLnh5v7Zr2
	O755HKpciVPceGa3lFAis8ibSSJTV3RUdPpPk6lFDpx6u6rWHBx0IqDqMP8lHTCcclRg1UR2dbj
	yU/lqU+mNH6swpdEbCvqOAf4kYB4MDoOaeRyry+PL17vHZ00MrGHjo4vBRalUIkJsTAzzeU5WqS
	S+Vdj0xUhrDt98gRG2zup9aPCXWLxgbl4mFs+1p7wOKOSwcmepXW+UUkAna3sWofrBbSXRoPEWL
	jtYyfGg==
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ba093b7ffcmr114576005e9.35.1794497652296;
        Thu, 12 Nov 2026 07:34:12 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:34:09 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:14 +0400
Subject: [PATCH v2 6/6] serial: vt8500: Handle uart_add_one_port() failure
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
Message-Id: <20261112-vt8500-serial-cleanup-v2-6-36b258e0c0dd@gmail.com>
References: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
In-Reply-To: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364; i=alchark@gmail.com;
 h=from:subject:message-id; bh=/WGEv9BtvlhkUu2E+CsLY3dFd8QUnBePGzr3E+nbquM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veP17z5jzOYvTpkJb0xrDz56ee/dzoAVgo4cWs3TJ
 3HoKd8Q6ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqNzExMvQUmYR4zN+dtzf+5ffcF2lcUex5zfdiSzK+CVkfYXk35Rojw+wew89
 mbfOOKyTG2Iaask549vvYmi3Hlz3xnd/WfyRhAj8A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Return the error from uart_add_one_port() instead of reporting a bound
device for a port that never registered, which would keep its clock
running for nothing. Let devres release the clock and the remaining
resources on that path.

Set the driver data before adding the port, so that the probe can end
on the registration call.

Fixes: 304e12665a4a ("serial: Add support for UART on VIA VT8500 and compatibles")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ce64cdae-9faa-4109-b7da-29b8a8c99e76
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index cd5188282f64..906b8dd2f4ff 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -638,11 +638,9 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
-
 	platform_set_drvdata(pdev, vt8500_port);
 
-	return 0;
+	return uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 }
 
 static struct platform_driver vt8500_platform_driver = {

-- 
2.56.0

