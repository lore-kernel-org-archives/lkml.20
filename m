Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1596D38F249
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741543; cv=none; b=g+7DTiy5FPxwwLKgQVr4ZhOJMYcSWlw7rp1wjKaxIKslcCt4R6Tnc4neNFt2aEzDS83ielbzfggl0mzVIXm/F8csRzDCv6dvz8gwDVD+dwU4DVZ9O55/0BtUpI8WsLFaJ5QWAYIBylXODY3o7Pja5p+fW46K7em5Z5vDrq2cuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741543; c=relaxed/simple;
	bh=rf3w1Iu2Ysr+paWyq280s/U9DTS2EAegnqYkXvJkHQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6iJKapWO93FHHFs3a7OGLFbxDzyNavHWQTAm8k/Ic12AuR5TigYXCRqsaQ762CwX0FvbP38dAMGn/DSQH8+605A5WdDMmCdjCul1dH3oHUmi5XV8tZSd1H62UQj/02VY0Y+FGJGqNzfHFvCFnJ/wPFTR9ygnjymSGvPt9a1XQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9tW/FYJ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9tW/FYJ"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so30534415ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790741540; x=1791346340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FR7y8dfKgiIQtjujqGTh3whpbghSvD4pYmnuq9BDyWI=;
        b=m9tW/FYJmcOl4Bbg59ABWj5klnFtbcqAVHs3DiAukSaGuxExi2wXP6Dt8t6ongqu6X
         KUz8qWHfv1+Fkm1YzPpF+faRl3l9VRIhCC51hBReVaDFX9TVVLUPYIQJyWchxc582b1m
         NTw4Jk/ukkBUPR6dZEoNyTSzdHjBZDGBg1gHacM+Pe/kWGPK61NAKK8+ve2e9If3xEG+
         5+CrLatoxbrws+kOz7/9+JnTpbrq/21kDHLr3w592BmLaXuc/duUox5Dbze5/LaYXem6
         Tar6N66q9z1O5YNw25fv1aFuyBYg6dv/kAPJuWU3LVXc0D6dsueNvlOfboJ5nyU3X7pn
         fsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741540; x=1791346340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR7y8dfKgiIQtjujqGTh3whpbghSvD4pYmnuq9BDyWI=;
        b=xHyvw31hhSxzzcY14UQoHYgjMaDPThnMAK7zPU5AT+oh9R8Ui236BhniBRvA13+26H
         vOYjHdLsQM7Vmed7oTCXt79Z38JdntFIIUwgk+mdzcqQ4nmJrp0Y/U1A6xAMaVxmlU3Y
         OvjYPWxIJsBzCJDDMKCpJ42pKIlLQ3lDWNmg0cz6oAEC/M3+0F9hE88wmnT/wMU0UkJi
         akODwxtVVxaz6sjq0NwEokmNF8NR+XsBHJugHxSnvi8d9qJ+97LMVx72PLUAkmViq8fX
         SpR5pMoikBmT5wMy7ZW54NqXqObYfsg0t2MdjuYicDClx+i22pxVeOmlflUeMhWhvgM7
         gDMQ==
X-Forwarded-Encrypted: i=1; AKwUvByb8tDhUj7u4vsaiZFGLm0fTDToPeTbL084GqjjNwmsksdJXeHiBIzzuR+glsCdOBAzlI4ac/r/13hBImk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUz1X1usrhWMn87WATGfP/UclLhgrB0mrGE/SeXhDInYEyzYDK
	rqs6EminAueZC3EnvxOjwFEg1WrXoPijEjkP1on2rZrmp0FJqanjWHzK
X-Gm-Gg: AYBFou1M8Vjqz9CKMa6RTMbVy+40EASRLNBmP5sgMHhVk5x5lynb0LomZxCzXf6g6S6
	xmg1PUeMxuS3U3GVVBl+oIHlKzPDU7bs96GyityhUOL3XWZjrZd1dvk4Y6SAKq2oeff9Nx+MlW6
	5fKFk6kU2Bjt2GgBEDk1a3MRur5VoZy1amEfr/D6OWm7dImrj7jJO3SnE5i/BSffHTMV9764pV9
	OujhYLor/1DZext8itSBF0RXQzPib/7RyPnPjd2ssNt+QYOjnunhnSqWQ2XtTXfMZa/rohdfkbU
	+lPKPZI3U/VK8Q32kgtFIlU0g6fruYWVGHUsApEE04lGPT40WVCqrB94kZrRstL+OrF0VSAufWc
	oXGkn2FuoEYoBIfLaLxkSk5NFgDtx3H8uCQQVHp3zpYiS/eAXK2yrWuwlR+ammC7Qyh5G257YAq
	7ua66sDT32yG50NjyS//fzPhgJr7Z+qEhlPnXs0VM2QSpTMx5dYdinmNRzUto4YaavZJKmLnoDU
	YgagUrcatjw95qUpnMHbVHVJY8kooInNd1G91cZUVKxXBCSNt14ei0gKSDsO0Ss31ev9vecxsFY
	W4WqqQlN0LLYP9CLuvL4
X-Received: by 2002:a17:902:e80d:b0:2dd:c0ff:e72f with SMTP id d9443c01a7336-2e2e4bc8bfcmr1740725ad.65.1790741540168;
        Tue, 29 Sep 2026 21:12:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c4a240sm160065ad.81.2026.09.29.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:12:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5 2/3] serial: core: allow third iteration in uart_get_baud_rate() fallback
Date: Wed, 30 Sep 2026 04:12:15 +0000
Message-ID: <20260930041216.155911-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930041216.155911-1-benquike@gmail.com>
References: <20260930041216.155911-1-benquike@gmail.com>
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

  WARNING: drivers/tty/serial/serial_core.c:548 at uart_get_baud_rate+0x136/0x260
  Oops: divide error: 0000 [#1] SMP KASAN PTI
  RIP: 0010:uart_get_divisor+0x5b/0x100
  Call Trace:
   serial8250_get_divisor+0x123/0x1a0
   serial8250_do_set_termios+0x21e/0x1610
   tty_ioctl+0x1028/0x1480

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
Changes in v5:
- Trim kernel stack trace in commit message to 4 key lines, as suggested by
  Andy Shevchenko.

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
