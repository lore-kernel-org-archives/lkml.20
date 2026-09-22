Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B441A919
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065922; cv=none; b=cR/Zh7GiKC3SOLpUgkWPmlXsytPbS67D0AkabmdB4Us0HsnVFfae4he5bQyqZR3NqIg7WJxmrwSnglLjgcpHwSGh0INcfFbE/qfOjQ998EaHVdnstUcnUM4DiHneyc9RRXLHSZE48MEY1UcKrIVEKRlsgcrIwaJcBSqOwmO522U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065922; c=relaxed/simple;
	bh=wz90cYMZtML0GXcrY+lp3xTm53JZdWJD4kjFMwcNuCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfCjinYnLhK1yPZBWe3sPuNcL8j3uXQ25LYoOmH35mKX7aNd6BpGTOWMIc0bkH0GUv0Dn49dxXNHi3zqeLimQ7sBD/kz6VlPgp0ZJiBzkY6cS/GLi0Hyjrx4lqJagtJ4iQlspQIKsvO4jgodk9AI3pQGbdx/djr09R+koWInY/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1fwqIM7; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1fwqIM7"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so38774675ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065917; x=1790670717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TICktEuUxPHMgoO/3ExzI6O90rGksd21amxrNGdY8E=;
        b=g1fwqIM748T39B4dpm762HMlM2SDEs05YpUsZUBjwpmbFecGcOr3zZJushEJllJVJR
         SbFV9wUQAlU/kXuPznNV6qZy1uwMsLOpkLjUgm6YPu+bSW256FT3CmdJDZbHz+rw+fuC
         pSPYbuvFrnDQSjQ9ZIQ1vjdmIlVh0dydRHgwDVTP1Z/uFb8bMmzPQL0ADyHU83vCJfGA
         SPYmMM/7mlroUxnbKCNuikARrTOA4TKPI47yIoDPQnzQsfCwnYui4R4dwsZvJZFqZY05
         gNE1PgA0oMBZ9mZXAwEN3/LhL3pvQcChLJqcDKUB3f5Gvd1fQRPhQK+0+dqXhok2m0Mk
         iMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065917; x=1790670717;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TICktEuUxPHMgoO/3ExzI6O90rGksd21amxrNGdY8E=;
        b=GkKYkqIgThFroSYYq7tprDqHj4qRHdC1luKc4PdNmynXKme/HCLU0SxKHPxwso3/ME
         w2D7NcXaqbtJmiuBE08tORKLLsohxb4Y/ZfQNXpwBfuRgJnxWN8sAkHp8pZaOWFGX27+
         4rnZgLl7Z/qgcglIi3nvZkiFcE8+IFELTAAgbszqGfc1f6bEtLlZhcOP6TzMQjFsJSrw
         A5HejWppBvCu4BgooL12o8YagR6SekxG4+kBAuW8qvG5nFsZ9i/MItUyBm9jqJCB55wU
         ZZF3iaTzXs+ONzJNo0bGi7ChBPezgVAd9LmJMqWGXV2fBWAGeMBOJzkJjm8lqpC09l1a
         URCg==
X-Forwarded-Encrypted: i=1; AKwUvBwm2ZnL/x7fXet5q1lDDqPIaE83x+6ZAkocokc3xjG1F8IY34LnoPhI2Hmx+uoGNkrPYlFYEcN9RrBhwyE=@vger.kernel.org
X-Gm-Message-State: AFuF++l3xu8JWQBZnPhFY0xDPEm43MUWgjv9Q17bmOO/s+/Zlui4+Vh4
	g3dzlvrhyrv0ooHE0c28AvY5AIPvigtxM9PdPZ5EiqDq+wShE+6+vhQ9
X-Gm-Gg: AYBFou1KdaE6ZacXeXGFUwsPVk6GI9+PKpPGOW2MuK7pVldkffrSGqjN7ZTABHJ4FkU
	Mrge5L7iMJpZGBpe8QgXeME18uDCZcTPrvH585hwjYOuxtHHv/XXq36PiZaJfAFobCx2On/dKD/
	qSXbb0YJIfycjCS5FcnuckSTg4cZhi5Q6Uzhbis4FHDMr14Tgvu2++r4zeYG9uglJEaja14OgQk
	safli7+b7uIgm79VRHailzfaztysfKqJ5Nv+OeIbDwnHRLqzlrGLje4NYsMbBfWcf9JCtsJOZQG
	ew3N6bFCi2bEX6Np6f4AukFKi4SEjwHbR9pwmMVR9+b/w+v5qSNbPKjNuj18ycUQnA2nH6Kqq+I
	4X1lQ7ZQbRKqtL2tkmyg0QHk7ZLltDT8u7Vr69y6Q7qRq6vcJ4rCnlNneat0xASEW2vqRiN0h2l
	gxn94MJSBFdyH5ZUEzeCEWOVnDlI1eRAW7+qM6sTvl2+SI2lPrXPDvDmkNGAqSI4s44aEo440Cf
	xc8YMzkMaOg9NHdtN5Xh9KsSc74c/186lVRW8sk1Y6KEIKtdHuB7BsqvnvsMYzfOSF4vTeascb1
	Lj3lTin0LoJVHGgut7IoOg==
X-Received: by 2002:a17:903:8d0:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2df60b7c740mr5387815ad.62.1790065916382;
        Tue, 22 Sep 2026 01:31:56 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0197d3sm5848175ad.13.2026.09.22.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:31:56 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hui Peng <benquike@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] serial: core: allow third iteration in uart_get_baud_rate() fallback
Date: Tue, 22 Sep 2026 08:30:50 +0000
Message-ID: <20260922083152.4055969-3-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260922083152.4055969-1-benquike@gmail.com>
References: <20260922083152.4055969-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In uart_get_baud_rate(), when the requested baud rate is out of range
(try == 0) and old is non-NULL, the function copies the old termios baud
rate into termios, sets old = NULL, and continues to try == 1. If the
old baud rate is also out of range (for instance, after uport->uartclk
was lowered via TIOCSSERIAL so max = uport->uartclk / 16 is smaller than
both the old and new baud rates), try == 1 clips baud to [min + 1,
max - 1] and encodes it into termios via tty_termios_encode_baud_rate().

However, because the loop bound is for (try = 0; try < 2; try++), the
loop terminates immediately after try == 1 without re-evaluating
baud = tty_termios_baud_rate(termios) for the clipped rate, hitting
WARN_ON(1) and returning 0, which then triggers a fatal divide-by-zero
(Oops: divide error) in uart_get_divisor():

  WARNING: drivers/tty/serial/serial_core.c:548 at uart_get_baud_rate+0x136/0x260, CPU#1: init/1
  ...
  Oops: divide error: 0000 [#1] SMP KASAN PTI
  CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G        W        N  7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
  RIP: 0010:uart_get_divisor+0x5b/0x100
  Call Trace:
   <TASK>
   serial8250_get_divisor+0x123/0x1a0
   serial8250_do_set_termios+0x21e/0x1610
   serial8250_set_termios+0x77/0x90
   uart_change_line_settings+0xf6/0x720
   uart_set_termios+0x1c1/0x5b0
   tty_set_termios+0x5f7/0x920
   set_termios+0x533/0x7d0
   tty_mode_ioctl+0x8e4/0xd10
   n_tty_ioctl_helper+0x3c/0x270
   n_tty_ioctl+0x4e/0x2c0
   tty_ioctl+0x1028/0x1480
   __x64_sys_ioctl+0x184/0x1d0
   do_syscall_64+0xda/0x4b0

Increase the loop limit to try < 3 so that the clipped baud rate encoded
on try == 1 is evaluated and returned on try == 2.

Tested in QEMU against Linux 7.3.0-rc3 by setting /dev/ttyS1 to B115200,
lowering baud_base to 9600 (max = 9600) via TIOCSSERIAL, and calling
tcsetattr() with B57600 (old = B115200), reproducing the WARNING and
Oops: divide error in uart_get_divisor() on the unfixed kernel and
verifying clean execution with 0 warnings/faults with the fix applied.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 091ea8e5d34e ("serial: core: prevent division by zero by always returning non-zero baud rate")
Cc: stable@vger.kernel.org
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Collect Reviewed-by from Ilpo Järvinen.

Changes in v2:
- Split out from the 8250_core.c and uart_set_info() changes into patch
  2/3, add Cc: stable@vger.kernel.org, and include the QEMU reproducer test
  details and kernel stack trace, as requested by Greg Kroah-Hartman.

 drivers/tty/serial/serial_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 95774b0f1484..3845fb582f45 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -501,7 +501,7 @@ uart_get_baud_rate(struct uart_port *port, struct ktermios *termios,
 		break;
 	}
 
-	for (try = 0; try < 2; try++) {
+	for (try = 0; try < 3; try++) {
 		baud = tty_termios_baud_rate(termios);
 
 		/*
-- 
2.49.0
