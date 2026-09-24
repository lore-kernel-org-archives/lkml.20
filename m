Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5353E7BC7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229916; cv=none; b=szLA4723hmXdqyQiBii9gwojyT2TTfJ5NTVGfQ2hAenfHipuDcg7Wj8fjqlGRtP1kM8RNWKONW+uiC3zAbqP/Rh93Dyngq6vKz4AQlNK/v9dji9E8mSW0FWLR7h2OYBeU1m0k63qaUC4T6JTZEimJBailB5HSIkzaKMSoLnZLy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229916; c=relaxed/simple;
	bh=cVnMKobrU+0O1YWlm0U+w7w30CpTy8u0YARVgjvMWNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o08LMORPowHcD5rVdY9VySoLmZ/gxceF1waRajQru3n+OikZVTGttKnEaJd1f7rc1hZoXXiGQ0XEbzL8LHwJjEPQ/Aw9pfQPMusFJ+1DW3ewKjuOverNEm8rIIfvznRC6ELv6OuAH3aCDGROtAuL/ZkJAh9T+M99T2SkCjG3Pks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBGa+muU; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBGa+muU"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so781687a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229914; x=1790834714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mawJGTGo3UBlnr/ew+hridSWUp06PoPUGVqj5iwZDnI=;
        b=iBGa+muUEfYMz03Vg/f5Ni/0AP+0XyJg4WXIUpiKDw3hxS84Zq1oW84P1lZSevc44R
         /RXs4sASHxNYWaB+yg2hKaP4N5hrPMN3YWR8UEnAUcUhsBebhgDrLi3AZd0gSXu+kU5n
         uLxOZOi6Z/f7Zf98I5uGdPfZSs9Oy90GwUrM3g//7djqUhYJdchrSCj+vp50QGMQhkGH
         6ML5OLJPhkBA4EIiuXxYKWsEON8cSwvfsnrejNL52xPoVKcScT9G2LSypegU9tVKHU2y
         Tipi+byQNcjiBSX/TenHg1iZkkM2VYS6LxA6KqXeOS4bDlp6VMBlCDGCdEVr2bFKTlgq
         I8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229914; x=1790834714;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mawJGTGo3UBlnr/ew+hridSWUp06PoPUGVqj5iwZDnI=;
        b=L8pGoLCyWrCoETQ/M/hmA2+CYc66hrsdbRgNdCiXM/gnGAArhZXle2dbbEdOlJMeP/
         cIP8VBNin+Hp0OhLYwETyjsdJuNJmVuk0IHxp0AqbepnpJhv3cIj6cJc4FwsqexkvJn7
         QeFIquLbd7xbdzLbJ2J9El6ep/LxZer7F/p3FO0qmJjqMC7B8huF1Ctdbb+6ahbrS7Og
         dyUPy22Tg4/Y7N3e4Wd1BhqgZRzZZVh0pNXauChkoCrlYjObx1a4qmP2ND+sTu5bqEza
         ifwGovJxDlFiQExxh4cqarLeSV2ntmRkcl/ytRXw7pZYHCyznqpv7vcT2kvkOlUogxem
         kmmw==
X-Forwarded-Encrypted: i=1; AKwUvBwWNggQ1O+7n6wtHZ3gaEDNIfGvYCEQdbiGMWpAkz7bKiFVYE3QOaecqSajcQm7nirvrla8JQuh2lxHVBk=@vger.kernel.org
X-Gm-Message-State: AFuF++nROS1KIoyjuU3KC8/tSP/Zj25JKxewTZsrqeO35+nhgtV8mlYr
	WjJ/Qr0PJ0KYdMYdf8OjwnJ+VLyV7zosyNE+smAMMvMUP/ZX0zuxL+YR
X-Gm-Gg: AYBFou2CRxmLU7NjjaH5C/zRscBJiRpM4KJjfMwn0CfTY/mxUWlc1GfZgT9oQJYQUp6
	Q4AWBadXRXossuQBTy5xOab9XPf20ydMdC3owLet5G4g+Gp9Pcme5SyLBLrrBhMdf/6mWPBqysQ
	se8SCjFKbRxbe5QCW1COyOXbM2SitZ0fo1CUH+NcM2MzUW1YG9QBaNLFu9DnKkt62yZ7jChu7jE
	bVjQFyh/RNlWiewsdj3fpqjrAVFFaBvoCHUTwDqd99Yto/25Sf49iJoTSIY5+nypRSgbIUWlpZC
	DWkUI8tprU2E/dE0LU6eXNEux9gx5vBJ/a2eZhc5+ierM7cve/pGYxaX52rGHUlSmR1b8wf0XFI
	3PlZiKV2ZcON1XIzvLXS9EoGkNpHEUv+OP6VBapK/zCsOttHAKsG2W6f3+9rVhkt+CO2El6pGcx
	QnqJ82/nx2/X5aBlRDW+tMJH9MXUInRuJbYH7sz/YBcLt8212av+KTPFs6QUozWuRQ/sH5YRwWq
	9MHL5duTYobWASAbVH0S5gQMkzAdDEz1uhMckExSXB2oA5a8pFaYKT1PksZP2LCv/ElEjkMjFn7
	yIArba+0vw==
X-Received: by 2002:a17:90b:380a:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a098e39fd0mr1148077a91.39.1790229914516;
        Wed, 23 Sep 2026 23:05:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm2056710a12.4.2026.09.23.23.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:05:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 2/3] serial: core: allow third iteration in uart_get_baud_rate() fallback
Date: Thu, 24 Sep 2026 06:04:45 +0000
Message-ID: <20260924060511.2364717-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924060511.2364717-1-benquike@gmail.com>
References: <20260924060511.2364717-1-benquike@gmail.com>
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
Changes in v4:
- No changes.

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
