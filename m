Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1A4DEC18
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773151; cv=none; b=cfYvMZgFHeiRa5ztGk/Pv/pb/dssjBSl3Pa5wOJFDf/JSGawelFgzTph2sHpewjMf4LN5FppYKEolVF3wz7S6WubWoyd7acsWZzzjjCcX6kDs6yneAX2w4xBLpaHjW8Ed0hpnUVL7xtFIDnzyxVGfJbbGy/CdmyaQv1v+kWKmbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773151; c=relaxed/simple;
	bh=8fjom4nHFHl9t4UeW3B6CslryDoQKv7pGaOEJS5e/QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8coat+vMkIya3zrdJ8Ih3tSahlRPSoXwxh3DpF3MbacuuPHWo7MUaady5NzNbzeXFiW8zKO77ZCzAT9g5p41M+ZfJ54c+TtFKxlg7CbB3xm7iNwVdiVmErDIT5eSVTugrutOcUP3RK0xNYO599LKC64SLZzxWxaBQM7laDv1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFK/9+aq; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFK/9+aq"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d58a3b05so11279945ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773144; x=1791377944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLsfa7AISEbL2xx9aoGfBDqSveeoW+tgNPNPQlBJYZY=;
        b=sFK/9+aqEN9bIN5Xv5Hbc5nk/odedfrwiHFswNp8adnksHus5E/XYA/FrZ3Ny/mHNG
         rwFOmypK2rPk2Zi4ak0pA1qYDgTmk0s2+9cp0M+mwUabD3fpA1E8vEe2Cmwqam8jP1mP
         74ha5GPRFRxUVSWrM/QLG54ar6ALAT39DS/aI8cUDXHo51cWtAtEHLHL5M9vxkfypXYp
         nhdV3c9GbF2YxUpKTo0+83zW5dW9Z8uQeFp2y8mm567S5+PlvZiDOYfl5efJgrZ2mKra
         q4mQ0qPEdfWwnbxsHeCQlA7niyE7X42OPplbb1n1gmGJiJOJrmc65x/jRasXTa2wN9rq
         gDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773144; x=1791377944;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLsfa7AISEbL2xx9aoGfBDqSveeoW+tgNPNPQlBJYZY=;
        b=ZmlHFYXXg6v5McJMeGaNApTvHO0UQl9aMzzFDPo2WajlY1rb1T4zLNDU6hLRfC8U1u
         JpshxPCi4N/f4LOOqys1jIhCzAo8j6eRJ5UbZTVYQv+eHfhSQVKIGzAwqD0HGtRZ8Xz3
         +7EQkTb9umhbI3oLFXySCDI+k6VX7+JpsMGTTc47NoJJk7gWg5Dykm/dkxZBo4HI++d2
         9bACDbyLjql3apQp4xHSbn6N339P1Swnx+zAPaga9ZnuKNG9cvSierB3esRiYBZpZA4z
         e6JTHmK6ffAdyKFsOKUaSgIRd1aGPpML1qE09qMtn+YCJzsXHc6WYVxUak4TR1qu0djY
         tWOA==
X-Forwarded-Encrypted: i=1; AKwUvBwTXddA98ELWgJndzZ0eQWjpIi2Vhnj/YCLDcXcD3WyIpX3WSFM5zitQC1h0lk+EnBsaRmSze+kh4peO2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/0ricO3cvKhRtCZbpfIs2pqMDj9m09ICrvsj36XkxQz+jq3lM
	1yZvlIOk9BQs5eOAXKyRuh3ENznXuduDGD1xfN7nManDmA0mVCzKoexa
X-Gm-Gg: AYBFou1A0fltWV24dYnm/IlYDezKncQuF9skF9LnstHPISjLQVf7eBvQlbuZ8DHNVtL
	VmyQHlAC902p1yoaypRpvEbG7CoEPKZ5XPyUFNadimfxjF2ThhV0Wnk+Qj0KwBLpu/wOxNcei9t
	bEOAnbQodCOgnxtMjqfbIuX+IeRvp3TKFFV7rEnVz0S6g/sP25a9Vd5gOABrkuw0Z7J+eTUjP7O
	UxsS5Xetn6I5dxAtYA4kOLGzzjrKuGBJBTjA1BMmQgUj6H73IycPmrjb85V5q5HT+xNFNLoEL/f
	6Mqttn00mU1JY+5CS9njFtHZAooJ6MoO1P3D1mEpm8SzDB0YU+SO0Bp5KS9fMgMkqRvNgQLMnxI
	kSX1KrO+FkxuuMRHQXPR3GDQzFdJMx8Z2n7YJf63kFWJ/y7qs0tGiQ93Dg0dqlE48hut8zdr4KO
	MX5QsVXOcCgzazioyEhTMIOZcXvMCR6u0CzL/CV/e2eLFClSNmVOJLBsB3Fp7G/uIMow1+4uQgu
	koDmpf9huEK7S8nljvMtNXe7BSDngMmmbKLkkdn8utvqrCjAwsQniPf24kX0yByffYQ9JMelXS3
	eoZ6FiJ0nA==
X-Received: by 2002:a17:903:2287:b0:2dd:c100:942f with SMTP id d9443c01a7336-2e2e49fd148mr12492185ad.45.1790773144112;
        Wed, 30 Sep 2026 05:59:04 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b3d7sm6751925ad.70.2026.09.30.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:59:03 -0700 (PDT)
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
Subject: [PATCH v7 1/2] serial: core: fix baud rate fallback in uart_get_baud_rate()
Date: Wed, 30 Sep 2026 12:59:00 +0000
Message-ID: <20260930125901.778868-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930125901.778868-1-benquike@gmail.com>
References: <20260930125901.778868-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When uart_get_baud_rate() is called with a baud rate exceeding the port's
maximum supported speed (port->uartclk / 16), it clips baud to [min,
max - 1] and encodes it into termios via tty_termios_encode_baud_rate().

However, because the loop bound is for (try = 0; try < 2; try++), the
loop terminates immediately after try == 1 without re-evaluating
baud = tty_termios_baud_rate(termios) for the clipped rate, hitting
WARN_ON(1) and returning 0, which then triggers a fatal divide-by-zero
(Oops: divide error) in uart_get_divisor():

  WARNING: drivers/tty/serial/serial_core.c:548 at uart_get_baud_rate+0x136/0x260
  [ ... ]
  divide error: 0000 [#1] PREEMPT SMP KASAN

Increase the retry count in uart_get_baud_rate() from 2 to 3 iterations so
that clipped baud rates are re-evaluated in the third iteration.

Tested in QEMU against Linux 7.3.0-rc3 by setting B4000000 on /dev/ttyS0 via
tcsetattr(): on the unfixed kernel it triggers WARN_ON(1) and divide-by-zero
Oops, whereas with this fix applied uart_get_baud_rate() smoothly falls back
to 115200 without error.

Fixes: 091ea8e5d34e ("serial: core: prevent division by zero by always returning non-zero baud rate")
Cc: stable@vger.kernel.org
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/tty/serial/serial_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index f91bcfa30113..6ed0195e6912 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -470,7 +470,7 @@ unsigned int uart_get_baud_rate(struct uart_port *port, struct ktermios *termi
 	 * Ask the low level driver to verify the baud rate if it can't
 	 * then it will have encode_baud_rate set the Closet else .
 	 */
-	for (try = 0; try < 2; try++) {
+	for (try = 0; try < 3; try++) {
 		baud = tty_termios_baud_rate(termios);

 		/*
-- 
2.47.3
