Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8D3FFAA4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360135; cv=none; b=mgeLH2chrh72Ako6/VNqUWGm/DQbVDe5JR0sAZuVXHYuPU0LbPb4jHvFoRkFYTKQaeSuBoEXXArIv6M+/qLTOLgsB4zt3XBGj7DpC+YU1DX6OiexTcpQoIqmO5eUC5EnBB8LXSKwuXBNiUokZuPfZ9uN6QUHbwCDQi6c1J7sH0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360135; c=relaxed/simple;
	bh=D/qNw9UAh8WrokAnq0jEmYXVQQVZjClahEe4SFSygBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4bRZN5oVAGuYJqsp4+qbsoFrZjdm1yKlxoGsPObKNYFWUcm23xWpz9IWJ4obzT5RS9UrXW/vWpNshY9kC8dpHBN9SzZ9zgFmTkNGdQfMbn1/L81i1iVw0SYMM8HIldPDt5+slfB2rE2NNgNq7l2yplVXCj1MDO02YmdRB0v1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZ0ZiPMP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZ0ZiPMP"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f20513so677924b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360133; x=1790964933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSjAv0OuWBW4Au8AUzMyyhP6gGploPWcJ53nZfLOcdc=;
        b=EZ0ZiPMP4MJdu+kZmZ8yGxo6kxCBg/MFhIG3q6L+jQlSzDtExNps3PgnxdzWqTnngm
         brdBBo4bs1r1o8Tz3y1ySjNE3lPuqA54eFLZqfJFx7/2UPwYO7QU4AFkXjlZK9Ghx8gH
         oogGIQqbfDp3BcZMhsDc50FCDMY6XHb+uYUZNP0F0RaZMDQbSSOZaj1gJDnmqFLGx29l
         ObmCaa7TXB7Vfhu6dERyd3lUhce3DUn1y0l7sgVRI7v9XrtqXa1qsyROOPUfKuWISOZQ
         jAh/ZenFDL3z8BGiHk0bbjfP5QGMevrDR9pqFfkPn+4TJlP0dtqqPZuiD+kslBNYPU6L
         onTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360133; x=1790964933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSjAv0OuWBW4Au8AUzMyyhP6gGploPWcJ53nZfLOcdc=;
        b=XRkHXzE2d8GBPbi6Tit0IZFqWmRGFAHb8SRZXO2AKpje3NUNjRQQ8gCe9tXOed8Hdk
         2a4tVB1HtViA0pMQrwpqdZEedeJjdbByzjMkXq9//XVYkDp51FTaXdm1nj6pXHG5Ui4h
         KJHFpkdV6wWFtur2XY32CQjAXeE1tgZbcAdmTYv+CiH9rmqKzkp6cDaLQarfDpGrDzTD
         Y8bSIMAVVfzbNQnnkGyimOZIaVm15xZaggdY7sPm/nNL0X5KRkcFZ0A4T+6iBfNJYcUy
         RBekzWtbPJ4gspnaPiHFg3fkvi8oZa1S70C3gu11kYpw949n6md9b1edetiFzrOR8TQS
         1daA==
X-Forwarded-Encrypted: i=1; AKwUvBzKbV9/+5TGnCsjw5MUvk3GPiFfFTaWHdO7xOf/a3O3IaA76Hj+ezzxhJxOQVd6mv8arnocogqssL4RQpY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ+upqP3ur6jnWZSIVO2brdjk7ikjR5RypxNr1+F2+12MopTjT
	b2uLI/irXjuiWVcgMRF2FrheKCqlHduKRK6kzNIHdBIaKGrl7lf+h48q
X-Gm-Gg: AYBFou0L3lt3aym5a7oCLLqaRp5NuXk7uD8sGr1pVLtaKbod/cK4BBmnWWaqMrdi9QT
	ioPaExVLhvayIWI/WeV5CHHTh976UeuX5DD3ABOfJv+l4gxVWsiRFaXehrlmGyLQjmUcKIzMIfS
	FWfZsbZXYvKHYjJna4AtFdHjF6zrPYYzyGWg2Q5cXnQO2BKHAXD4iFcnmpNeca01f9Bz25ELN1f
	PczKFaSkmgRZR8jSEgbHfq7sGUStgwn594yeMBX6DsA7V6JE40cX7Mr309FiIDqKCkk0P2qBZNL
	6YwZ+cV+31SGCXkBifF8b8zq1Zv0HSiwe6vN2l5KWRxG5l0ukl9Sv4116xCfN1Hq/8eNazPy6pE
	Pm7ZeWFhVA+yqX3uNDOmWXkXfNo3hh+GkKfnBzROgtLUAOQ39DvcWxueDlG5UJTnw3rq1Qz5cM6
	D0P1u30mN3J6fIqQNgC/PH+j4lrmiKK0Cl87QGN4GizkSv32WoS6qfnG4bSsd8xV8Qu6F4YUptB
	TrcW1tqfvDYLrFFHFnAhQWdo2wrRKVVJM2W6ph8qnZk+FOaZCCvXjtiscSEZJ3qwBPMumgq9v4Z
	ae8eclQbkxAcq5AjZthYgGLyqsPsZV1IxeKopV4lHMzeJqX5
X-Received: by 2002:a05:6a00:440d:b0:87b:3bcc:bce2 with SMTP id d2e1a72fcca58-87e9b69f75bmr5713648b3a.33.1790360132795;
        Fri, 25 Sep 2026 11:15:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff77sm1605440b3a.14.2026.09.25.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:15:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] serial: cpm_uart: use irq variable for platform_get_irq()
Date: Fri, 25 Sep 2026 11:15:30 -0700
Message-ID: <20260925181530.52953-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct uart_port has its irq member as an unsigned int, which does not
work when platform_get_irq() returns an error.

Use a local irq variable to handle this and write to struct uart_port's
irq member when platform_get_irq() succeeds. On success, it returns an
IRQ >= 0, which is representable by unsigned int.

Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609251916.1XlVHLwd-lkp@intel.com/
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/cpm_uart.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart.c b/drivers/tty/serial/cpm_uart.c
index 39f54bb7b485..ca0acccd3dd8 100644
--- a/drivers/tty/serial/cpm_uart.c
+++ b/drivers/tty/serial/cpm_uart.c
@@ -1517,6 +1517,7 @@ static int cpm_uart_probe(struct platform_device *ofdev)
 {
 	int index = probe_index++;
 	struct uart_cpm_port *pinfo = &cpm_uart_ports[index];
+	int irq;
 	int ret;
 
 	pinfo->port.line = index;
@@ -1524,14 +1525,15 @@ static int cpm_uart_probe(struct platform_device *ofdev)
 	if (index >= UART_NR)
 		return -ENODEV;
 
+	irq = platform_get_irq(ofdev, 0);
+	if (irq < 0)
+		return irq;
+
 	platform_set_drvdata(ofdev, pinfo);
 
 	/* initialize the device pointer for the port */
 	pinfo->port.dev = &ofdev->dev;
-
-	pinfo->port.irq = platform_get_irq(ofdev, 0);
-	if (pinfo->port.irq < 0)
-		return pinfo->port.irq;
+	pinfo->port.irq = irq;
 
 	ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
 	if (!ret)
-- 
2.55.0

