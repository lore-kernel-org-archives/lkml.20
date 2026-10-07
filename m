Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2C4718E5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366452; cv=none; b=svbQotBQDLuk9sgdm3eWp5TuYaUTR2RNoPHLCAn5CgfJwbxl/frrZ4oZNB6Vx4T8/p0yCVlfwaU9Nzcz2rPqZHWKA6Xd8YxTKB2p0QHIJ3/effqPZ3QbsNp0/CbegfXqogGAFfsdmgWQ1mcygUa1pMeELWlGz2ULy9YXxId4OMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366452; c=relaxed/simple;
	bh=FpL7jjwMY/apfHM93jjTPCGNB7TYjMZroVkZzCHVyBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LZEY+VTbs3X5qW+LeZaOunnj74QbitUInJk9dXrQDoige2y7Wv9gQJuQzZL3aBxc1xidS32cDYCk5MMvzc14cRC79J16M7GJ9XJnEx7Zsyd9P1P5jFxLZRqFZPE/W9jK1uMXsNyfm8iu0a8OhcM1rU+oSC/Pru9lJGEDR/66rbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JW54BEM3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW54BEM3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so738139a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791366443; x=1791971243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPKaHWa3Bx0TPeANjm1JQtALevFITXOT/HiMP7XTIdE=;
        b=JW54BEM3ausoXQujOKMZ+r0q8jC/BsWwEH8cGfb1PO2vwdb5Ee72keVqcjFcJXlW7j
         ViJw5mNZ4HpWVh1A+CjDtQSOoXzwLherRj0+ek4lo17k3CB4xiGGoZEHJYMsCv1wi3Wq
         XIQrLvGQv668fat1ECsG4dzCnjBBSmvRSFiUsKLkX8Wzv5sRWOvvNObpZLgRS5+3Ac03
         1mw2WEKfc2YIGAOc6781LxoO8GJmUZLa3T+0vKTxtUe/pR7motpcAE9NhLn3ds+McXeD
         2QtLsaQ9H+doWi9Xy/tEGD+kKhxzVrHm6FUKlSOGL/P7JDkZwZN1Nb8CwpkA1z8vMJLC
         6C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366443; x=1791971243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPKaHWa3Bx0TPeANjm1JQtALevFITXOT/HiMP7XTIdE=;
        b=fRoCK78GckDCEZ1Nf6UyQNdh8yKYK91Q68nT6VirrdYnPqlXsp28cHnfHuq9str6yt
         0P9+9RXwryM7PkP0W1dx/LdrYIUO0B+UYhxSWLC4IkABDjvEYQr0MDXznBS3ftT9kJgQ
         qEubh3kKV3X8oo0+LcMUDXPdDQbvkLxsvIeJ+ITPrXrfUOovg7eTNgTh+9qoZ6dr1jJs
         N4Ro0yb6kgEMtWxdqDFWlTSsLHki63oYVNQhwr7jT1X4rPM57I3aHtQvavozjFO/pXIR
         kJ5MfO9T54hYbWnfdLzULybDafWjacM8FClQ2BHJRPts3mhxRQ9q4FlFxFb21xnkRumZ
         h22w==
X-Forwarded-Encrypted: i=1; AKwUvBxMymEuIVcgLdftyYcTNvIvzcQi7dFVUVDt5BTL0vwOTFagcwRhZN71fhY0xVo4N4UC8Ihfe3HySoIsENw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZFplqCsiGz4aLVDL926LjCobMx/JsOrCzslyu9+33yTl0mwYF
	GJ97PFSxJRZOEKpwkkX5Q8yj0sS0mw7OPcxusN0rb5l/JfBTvjvLEmiA
X-Gm-Gg: AYBFou3rXvymrKiJ/KTgjdOWKZR6fr3Ql+0MZkrDJ8iTHG81D/ThnyVHWLb5Y/sq2Ex
	zRsC4Yb5ZJZ/HtFoDLIFtfaQD6OYOcAnYP5jFpbNs0OO44Kqq5tZONe4lEtHrp+CnUWg+lbv6ly
	wpYF/JI3P/z/dZXwZ1y7Bc/4gPe2Lqm3koeNdTz7pDMyQkHJwo7eo6MVFAeC7db1eqChWW7hXmD
	uLXDbrlFy7tA1PJ2809CWxLODx/42HdWpK4fy7YBy0Fz+ynuwj7GU3CSmQDcZyxggjyohaM1KlW
	L5Oc7n1qTqP8ho0GcdDjLi8ZdqOghm/DB9crLhaerxqImMQru/rC7T2ciqFbxn5imSOuLrxdCs4
	TpNSoE3FN84mX785tpzXJ0r5Cm/adUi7F1aMjTNN9oP2WEcgVLO+qokcrgLC/aS29McqTEpKaK5
	EoWOOBWtWB/ElKX5jkVAdA1ow6azhY68DmXxu/AZjEBh1NJq5Yx+EWQqRIDtSo3SLDrapIwdRun
	9437Bm05DZos1OJFRQiNuSP541f5P1zEABVMpJpfU0RS9z8weQE9RNfkd+XEf/N1L5xKhwjYKOl
	nz0/uZZekQ==
X-Received: by 2002:a17:90b:564e:b0:3a6:e8fb:76b5 with SMTP id 98e67ed59e1d1-3a8a1b48770mr1335998a91.37.1791366442618;
        Wed, 07 Oct 2026 02:47:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8c46a2f9bsm265866a91.2.2026.10.07.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:47:22 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v8 1/2] serial: core: fix baud rate fallback in uart_get_baud_rate()
Date: Wed,  7 Oct 2026 09:47:17 +0000
Message-ID: <20261007094719.1362769-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261007094719.1362769-1-benquike@gmail.com>
References: <20261007094719.1362769-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When uart_get_baud_rate() evaluates a requested baud rate against a port's
supported limits [min, max], the retry loop operates as follows:

  try == 0: Evaluates the requested baud rate. If out of range and an old
            termios is available, it switches termios to old.
  try == 1: If old is also out of range (or unavailable), the fallback rule
            at the end of the loop clips baud to [min, max - 1] and encodes
            it into termios via tty_termios_encode_baud_rate(termios, baud,
            baud).
  try == 2: Evaluates baud = tty_termios_baud_rate(termios) for the newly
            encoded clipped rate, which now satisfies min <= baud && baud
            <= max and returns baud from within the loop body.

However, because the current loop bound is for (try = 0; try < 2; try++),
the loop terminates immediately after try == 1 without executing try == 2 to
re-evaluate the clipped rate. Upon loop exit, the function hits WARN_ON(1)
and returns 0, which triggers a fatal divide-by-zero (Oops: divide error)
in uart_get_divisor():

  WARNING: drivers/tty/serial/serial_core.c:548 at uart_get_baud_rate+0x136/0x260
  [ ... ]
  divide error: 0000 [#1] PREEMPT SMP KASAN

Increase the loop retry limit in uart_get_baud_rate() from 2 to 3 iterations
(try < 3) so that clipped fallback baud rates are re-evaluated in try == 2.

Tested in QEMU against Linux 7.3.0-rc3 by setting B4000000 on /dev/ttyS0 via
tcsetattr(): on the unfixed kernel it triggers WARN_ON(1) and divide-by-zero
Oops, whereas with this fix applied uart_get_baud_rate() smoothly falls back
to 115200 without error.

Fixes: 091ea8e5d34e ("serial: core: prevent division by zero by always returning non-zero baud rate")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v8:
- Rewrote commit description to detail the step-by-step loop iteration
  progression (try == 0, try == 1, try == 2) as requested by Ilpo Järvinen
  and Greg Kroah-Hartman.

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
