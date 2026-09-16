Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A74AF9F5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552554; cv=none; b=fMH1YVbpnxgZUYE1CFxhhYCHS3mADCPXgVKloqjepZIT/Z6Mj+25Fiz+FtyH54k2boC/mNBpKF/GDORHFIny/XgCK4er0EjbqiyX5IsPKPmmqmNjJdmE1CWe8L0gpGPPtw3YTf1w9nNfaYJ5tdGxay/2U+xtB8AS7IL0dDfVla4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552554; c=relaxed/simple;
	bh=Ibuya1/5DmSmqoKlhsPRcIYyCcZGsIV179wXU76CmKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gM2HxS7VB22WjfmZUqxRmgRnIMTJiKkWuLX2MqnAe+OqtQTjGY6N6oJOcxHq9qiwNP+xz4RM5RZfO2QLsaxO/CtfWBwta7SrkHaszmqXYXRZEi1V4W5d9hkRqE4zvI3MQXJADZ4HaeOofPeDorqbC3WOwSFSzY/R28zR8T6xT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiIlfS32; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiIlfS32"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so5409695ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552544; x=1790157344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gM03x/VUgDVaA/mIuaecDaV1OsFU+CmKDOqe3ZKytIg=;
        b=ZiIlfS32Gx9EkppvNOp5k3pWL3Ui1Q6tuTzd9bFazkp+qQgzVbeVyT1KSHF03z0XAu
         hgGOfxPo4tHDs8E0pvx7h2OLM+vHXyVEB22VUV7uIlkI87Vc/xkO/HXE0T0bQcCiRec2
         p99lqtpdfs3NHZu67J59+iiSI1d+YIaTuB/pIHB8zPBLsTlzIlO3/AItDnq43YLRcZM4
         i1CgRa5jmXrHGQgL6vxNVXxbdgu2OLYd8KSucZnI4lJF+ek9OcZtVHep4AzMSAUzaf3m
         1TP5pTIwP/oaGRxuXzvpw792KapETyY39+MDQgS2rC0TtuLplCATBDqS4u8GfCbnhkZ8
         49QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552544; x=1790157344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM03x/VUgDVaA/mIuaecDaV1OsFU+CmKDOqe3ZKytIg=;
        b=HvOLR5h8akQb6UrU/Iw4xES8dW8sqH6CUhbofu3KBfDBlqsO8qIkfhQxdYfyK4uYzZ
         hz2NvVf4lQ0Vh5KLnRfD/aqfpiq/HE9/iWLiFtn6zc1ZReUCh9Soo1pODgt8eC6t1qXF
         j3fSXTRVvFpqwwvc3RRP84XFICrH5y9X0cTNLcy9IYwh338Yjlwchhf5SLoM2CxyD0Z/
         Y0rgka60YGlSKgwxUGuNw4r1izN+OKwBvP59/1PDJ3Sii/e6sNL4LzM98c2NHiTEEKMr
         qPpUGTl6BMZa5jTW1iZbWCdITQQgiVnBqMQib7u66m+44l7w6GLUj4Vtvk5M8bQI4DKI
         wAxg==
X-Forwarded-Encrypted: i=1; AKwUvByQuNZQtWnF46EuWcqvj4r2U3W6Ki37odfoVuGakM1isAQOIXPXI2Rpr2eBvDCJDYoGt1R3WEHO9eC/L9c=@vger.kernel.org
X-Gm-Message-State: AFuF++m0Vgeh4Z5GDWaR7UURX+3SNupOgjEi/0lYz3ZkcYCDHTEYu3yu
	TTu+RNKCYjtCsWyURDT+bnGBigMstyz5llFEhWlQwVPcDh4Om5FoFcd+
X-Gm-Gg: AYBFou20fTnSib+17GHwzKqcr1m8ezmAR6JsvupQnL51M7mn0U0XzJrubdd8wOrFetf
	2Zm9XG1EDR9JmEbdq+CmKZfelnx2MaVsdxHkETjm3OfPi9i8ASeye7ttFKC8ZErxSNd3JfkAkFc
	Oucy3pzwsxgG4/PhMcIBZfR6P6blE+q6mKw36zuOUZvQMbRS3wxeCoR74sDDnq47QEBIJe5CUS7
	/t4RhS8aHVAPyPea6D1oeEYyYrcNqA2PBnso9Fm89QSdVE74I71jfSAdngJDi17EsViB+hVSHAz
	Twgc3fu30t8JrsFJmRZHrDIk5i/TXWilTgfQk8AC+/BleaAzEVkgoM3Btl+0NrwVwdBL4+bKhGw
	9b5M6A/AdlDwW80OKhFs8KkruDUTOwKK/z2Mz2udiIkhnNO/Y2Guxf4cony7Z4DnVfG8e5nxWL4
	qCs5DUwbY6lwnUd/lVqfwIuC0p8tC6omuTyzcw+B9cH9IP5IIspuh25OmOwQueyyoPiKKqrVsFZ
	T7WgRxmvOee05RHXE8KHVIqcWQzp3igbybi7w==
X-Received: by 2002:a17:902:c40c:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd8e404f4cmr40489695ad.10.1789552544078;
        Wed, 16 Sep 2026 02:55:44 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm6617087eec.15.2026.09.16.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:55:43 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH] serial: 8250_uniphier: Disable clock on probe error path
Date: Wed, 16 Sep 2026 09:54:36 +0000
Message-ID: <20260916095438.20837-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uniphier_uart_probe() calls clk_prepare_enable() on priv->clk before it
reads the port properties, but returns directly when
uart_read_port_properties() fails, leaving the clock prepared and
enabled.

The intent is clear from the surrounding code: the next error path, when
serial8250_register_8250_port() fails, calls clk_disable_unprepare(), as
does uniphier_uart_remove(). Add the missing call so the early failure
behaves the same way.

Found by smatch:

  drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Fixes: 26e8349c0d76 ("serial: 8250_uniphier: Switch to use uart_read_port_properties()")
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
 drivers/tty/serial/8250/8250_uniphier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index e3db60bf50c9..52667c1891bb 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -201,8 +201,10 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	up.port.membase = membase;
 
 	ret = uart_read_port_properties(&up.port);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
 		return ret;
+	}
 
 	up.port.type = PORT_16550A;
 	up.port.iotype = UPIO_MEM32;
-- 
2.43.0

