Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424780;
	b=RN6Jqb1OdJypG+dW5KBiOdYqagCRPqMV9khVm0mhX0rrXAH2Ogpa316YTAld92WJPmgy
	 /+LSPJoAWNEc+gjE0O2ZM9SFrBNwxyCXeUVE2Ck2UpF7Bkd4Un/Gf7T+oifuohL4gOjGx
	 KX5Rs9RVSBSY5zoWsgUPt06pj3ks1OBGsA5YxPMfXaYJjrh6vdb0kWj2ab7swv219u2GC
	 mq7VWiUuCRdXLA/wke5ZCmSAtyeeJ9pYnlPzUq6/7oGJgY7mdataJNiB3j2eZUC6svMp6
	 f/BOOBsaDuyvO+d3tRrsAW9ONMpFkar9txnH9g+UdGJXHmpepRnns8j0RHsdhIddcMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=;
	b=qCGB4ybF0ruppkEKvaE2RSpcU0DjnXaIYLpF9wbhVAFVB/4Jv2rUEpmlemQsPCQJHkxd
	 4CJvg1EAY/xjdyC7MOGT+yiQXp0aQf0niN7R5BPwUJE4GCtg1V22eMyf/eAUEnUY+oNxV
	 7q3Q4MAGJxS5BlfNhMt1qM0ePyqPCfOGC8xy29rsxsuTr8G2098KgVIhJ8q+JHgXHmVsO
	 WkdYy9Q4+4Dz/KTEWJksx3vHv4rXJ85afx08EdYJDYmZY4X8QVYeMwNuEm1m/CmHFSp/P
	 DEmNxybOO4FLxerZoGfdzx+ukXn1kX0nwVkjAj7+fefmySK9muWHySwcas9NX2Sg17g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us1EEAwU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5467606A8AE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5467606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us1EEAwU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso37114995e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424778; x=1795029578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=;
        b=us1EEAwUYkVwHm0jh989cNsr1foOYCFOs3Rl++Fg7Dl7gODq8dCV4UBKmbXklztK73
         y1eLBfzeGyNY4WStaOptSqClt3CuTgE44LLsqkYJJEf0U3xR55U5OMTotgKVPiweEhgZ
         UEYkSUIRwOzjtRcWK9bkye0P+P5stQAR8e+t6ITYSg1VHzmc4oSuXIblR7/wLgMvEgc9
         /GBbZ4fEtd0dSPBy+7LrXzYItDjnToVDAr6OLpBiYsoHgmN5JMPKsknwhuAymRUOLYWs
         VxMUg75viRopo5cWvqLeyRJAZMJWoH/dQ8tYHHL0dyxHXjXEANfAOPAaNbu5ODzg9gNP
         QziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424778; x=1795029578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=;
        b=wsOHchakF5rufe4jeqxBMhwkfiDc8QmR7WTCxnztB5YwPuCmLg7okrVLNCPOQd92Xo
         EKFp4Lpqnx0LHsWou9FmWA2jQ11qTnh+002NXe2ft8SLyTMYY0vl1BQm3gz3tk5qnIwb
         3kBHpyFwhylkOhXL43JsCfJDPY+7tSW/ktMoxm2Apkjth8o/LtzTgk2SH8FGp3RK2kRd
         T78dkfdZHqdZPcQuBzCbibuC68L7KQKkEW2B16x+Nnxi7FVQOrAi0YR9hOwPzWu7RjwL
         bSnOq/eghVezp+fqN+W2n4hy2Ah7N5rJ9U8i6XPPT1UBcSulCiUh8eA5lfxdn1n6BsoS
         zCZw==
X-Forwarded-Encrypted: i=1; AL+hErEo5HWmb4FbId93S2inCQ7t3lJ4zvZewsu1Iak6JABsNJs3Jva8m3tVUjfbznNlg+u8ikqs81dQfGpILDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDul+szuVQVHvATr2Y/fba13vtAVWlRd7M0OzxQSWlPQF97++
	4YjVdfPn1lmsd8n8j/jNYA90xJj1uhZTvWJDkdZYq7K4J25gmtBi0xdU
X-Gm-Gg: AYBFou1mWO6iqrdSQ1wS2mxcUm7jBjKpKUEs8606p4OjwS7wcdrU/ECLyco1S1k5wNE
	kAfYecn5pqXc225fMPci4gK+6boZa+HWgiY+NsubGJ60qwkc0HzGxLmTeM36zTGwbFUi6DwJwtK
	Ywr2WOCVCygy88ILH+8uq89eeXhfH8GgOFfqXn34UUUD1ctcB0xd6sXsR8jI6OQC90FIZWdgUM8
	wKFBFHoA0TfVhOaV8JM8p91+tRwMGDnR0bL7ey2ecaimrioq/PPiUWfTJJlWeUm98VzmoqElJYK
	jGALdXqA5krDrat8sn9laE4wWdNvnsT+CsR5PFD2m3Tjn41+FdPybh5wTRKnKBNLVceLlgX3FN3
	rsrpO+ADCrV8wRyeMrv/9tmXqjhli7+ejW543vX0VyI5bbPV2OUU4LDwgss5fih4eq7HjEToT+m
	VqEy++A9aKAmyOL6uWnNrVxV2RwgsDK10oNm6QA5UGtwa3qqFZjrU179PP3SaH4WHHs7P6PN1Kg
	4oxWZfIO/r1McdcbByscXe/OD5Jhxbv0SFhOpQtESiW1vxUJuYpCS51z+H6SYrky0btWxQm2IUS
	GIxFGA6PkH3fusi16qxs+a1ZdrYF2rNQ68MqrRFauYosBg6Jq9NYHwghZL2o0TgH0rM9XBKzT/s
	aE+ioMA9xl+euzSD5mjXnau7EhT5g
X-Received: by 2002:a05:600c:3b93:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba093c512fmr64982705e9.26.1794424777994;
        Wed, 11 Nov 2026 11:19:37 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:37 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:18 +0400
Subject: [PATCH 3/4] serial: vt8500: Handle uart_add_one_port() failure
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
Message-Id: <20261111-vt8500-serial-cleanup-v1-3-b33594a25f87@gmail.com>
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
In-Reply-To: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
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
 h=from:subject:message-id; bh=6MVluE0cGwPl4+DUsX6qfJLuLpTASBELCw1Mz2npDqw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b+f0Vrnfv6nd/x3/l8WdJP4umvfcfVH1RfTtoQlc
 e5h+Xrpe8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTfbWYkeGSha5a/YT3jaorImQVNdMzpu7d67ry5z0hM8uI51/+nyxl+B/Fn6k
 ntP/R5YBAtgz1j/dvtc3attF6SedHleYvb7gnPGEDAA==
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
index 17f928a7073a..7c7b4beb51fd 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -671,11 +671,9 @@ static int vt8500_serial_probe(struct platform_device *pdev)
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

