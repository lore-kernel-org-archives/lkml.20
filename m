Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76746D090
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247847; cv=none; b=Mhnn8rybBDc44uo+oHTvUDDQZbcWI8uCFHgg/QAcw0YecAOQb70/TA9z53x+8VUlOgvHcN4lLvXEj9p4FPIq/Uai4ZiusRfCKOsXKAoj+12DmauHn7pWmKX35Uu8DRFlx5AxEAq0v7hqhcpdY/0a0oLZUfn1Fkj2YaPxAnokjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247847; c=relaxed/simple;
	bh=7f7KgU8ghEm+ZsQ4Wsyw6XqLTiDahmNcP4zN/LWSayk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pecrgkx9sg6QFe6DL/alym9WvsNJfyZjJ5EYoyBi+RPb8SdLKmFjkou2IAzKlVrAOjaUsq9HFTAOUwtvj1ovQPeFQ0xzvP50/40xbDKZl0AAzcgemrUH0sg2Q+ncoky5ONwQ36PD7lejOchp5p3Z3tjczHfS3btDT03XkIJ6gsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aH/OkfUe; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aH/OkfUe"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso943852b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247846; x=1790852646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSWrvTJhaw4ng9HaxkyKXVaI1YO7DDOsINRc0X8/7pc=;
        b=aH/OkfUeiSP/AqySZOOuIUh4wCOPS0dsci2J4Lnz3PCb4qjFOfWc6m4ADaW8g2Izy4
         kDlzmDv6mHwtSKhPa+6NNDtxf4dsMQaSAiRVAE1A4NlxVOdsYyxMw5X0rO3omD8A6Tmn
         F928VCUbniDnAoZ6/v9ZUogp2hYJKJskEDE8PZlN5llcng4koh0gqrLEJSqsTWRDmxYE
         T97k9jC33zhak/vedKxyUR3Lm6r33kpDYE2vvyDqpy4t3Kx3rSoh9uQPjhYm06fySScG
         GHJS81qY/AH7yfKMKniMzu/ndWcjtXZMumxncudwGRc88C1Prhu7zyxOvh7CEVi2mVCq
         E39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247846; x=1790852646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSWrvTJhaw4ng9HaxkyKXVaI1YO7DDOsINRc0X8/7pc=;
        b=zyy84AttmGfux7FgkxaAldwZ/moWYZxXktJFTJO2dXVe4ZqJfw1JWpagQVi28LAzcl
         xOzrqKsMeIUXrWFxMOSeig7R1/VaRHwe3UAzCyyy39ay0tOrxQ1FvW49zL/NB1gRaRjM
         vp02nMRPC795VkBrlHbL9gHdnaHbQCieMKDOJUy5vn85pEySyyupt6fEvM+48LQBF3bB
         9KFZ6CUk1XAnRtG42s0HWa/fcdHl3L83Imwv1NHRZohUGz+ug/ArdGVbshUbFRzsc3S0
         A18eNsAe61MUfObV4MbNmvUWGRJfY2RSLD5E1GGvK21QvYE5V/8M9moeN/Zc3nEanGOU
         A/Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxcMrq8My7ATGlBXN6UcUmvc8SFTZSh8J2r4oAZpOEMtlFLXchupXc5m9KUD7aIna0MT96oUT3GHiOTuUY=@vger.kernel.org
X-Gm-Message-State: AFuF++l25It1MiwnJI9itm383zj/3sE1jxFWNX4elwboJ9TQc241BoN8
	5zpAbcheaWPwXur/VoLGDJLstfwIOtXv7uXXW0XLBkM55fU8eUVuhaVl9HxMlGQI0zWu5Q==
X-Gm-Gg: AYBFou3S01oYF1kwRFEIkUtB5cdZA3JvITN56PKMqMNXtgq18RTFz3e4C+4+Z0sTjoe
	riXOVb6qsA0pL41kprukGxAKmMNEGnVxkHU3D6GU1hWZMof4Q/MIIAEihAbRl5Dk0wN5vNAaElZ
	td1qFt9j/LKgwmH5pTS6zu9+iyfYdavkfd4/vlOGne7YUr3qDhYglPFRzwgruHxAH6S0CkNmrtJ
	Kv3Z/XTtocStIJNg2Ia0lpFOFXm1sImLh+wwiKCewmT65RZ9qCaZO4wBlTwBbK9UEnG64NQB12i
	GxuoEBQiP8casrAIKgtQwQeXkO8gMNhLKF3bsY9ftKChZRiedtYl9kSIe+kK5lx9LA2AAt8o6LZ
	/fPslZJa++6jwKEejaR3G7HdRzTy8ktZ2HZTsMgMT2JYEtDw2TV3msUSeJcbi5qh4D5CrqWgQT5
	wVKZaz/4KIZifscQ79V/cTut2GEluDdGyh/VXWNouEiNmjGFa6c+mldg==
X-Received: by 2002:a05:6a00:a244:b0:874:708d:b61e with SMTP id d2e1a72fcca58-87e9b6a1475mr1819911b3a.28.1790247845878;
        Thu, 24 Sep 2026 04:04:05 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fbbsm2751981b3a.52.2026.09.24.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] serial: ma35d1: unmap MMIO on remove
Date: Thu, 24 Sep 2026 19:04:00 +0800
Message-ID: <20260924110400.1556396-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ma35d1serial_probe() maps up->port.membase with ioremap(), but
ma35d1serial_remove() does not perform the matching iounmap(). The probe
error path already releases this mapping after disabling the clock.

Add iounmap() to the remove path after clk_disable_unprepare() to match
the resource cleanup order used by ma35d1serial_probe().

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/tty/serial/ma35d1_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 920fe7ff5083..e5eaaf154911 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -770,6 +770,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
 
 	uart_remove_one_port(&ma35d1serial_reg, port);
 	clk_disable_unprepare(up->clk);
+	iounmap(up->port.membase);
 }
 
 static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

