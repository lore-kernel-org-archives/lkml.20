Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A183D902D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366453; cv=none; b=TmcnaBqbH+Yeso0Ioi3NWPzLO4lCojU4HvmcYiUuSFCluV9OFN5nuMM1Me3SRK3+cXA2NQnnYDFx6fFb4gOExxRKPM/fiGxXUggILN/z8WaIL3CxMxCxqnEdDlj0CxMAQ/ZW2VD3QyKXi8s98Nu9wWnPvRrZPMb2dCBFCWwTlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366453; c=relaxed/simple;
	bh=g80PFUph4ibDHloeyB+7t6p2oepxRcwNrKkYhWZ/D8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gZPS7pDXmJ9cyDVRJQ0otmdirSX6TE4JNW4j/vGAj0suqWhdlhDwmMwd4gWddXmMPhFxaZZHWA354BUJeIQh6D4RenJVpgkh7oSPBxbyQeK7CGI8H6TRH1M4UdY3jYmfi1pp+gaTIMaiLGBsz/03qvFadWhniXqrTqinzGEOSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSYSVjfO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSYSVjfO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso306949a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791366442; x=1791971242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIXjivVbQJCgdZ82dSTwxSq9rPlm7KuY+QIYP6gq+2I=;
        b=lSYSVjfOJCKPjNVo7g4jFWFfTfqBgOyA5cOFuMsulSykSE3ROyqIrQxa9iw7iC3+nb
         m3whBSckMUuPJaPmJgAzFfAhwoFPX97ahHnxwq0XNbjINJq4cnrHdcq6Di6QZwdnDDXa
         4mVc5zfh0LejmVPUPlB+8xtzyrBu4wbVjituvu1zMuZ+Xcr9VPSMpjv4cu3rdQ9/Y/ZR
         P8reP4YrQxBgh6UJKRtcRyyQwpBswuc1iJG0pzRsrVAxPAjD3pMpaTFjpA2YHndkPeDz
         8mtXEnMroZrNJIu967rwMbU0flWVgxnV4AxSSUQ3P6mfqdLQ77H9JDCbIvaDxz+GUmZQ
         R2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366442; x=1791971242;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIXjivVbQJCgdZ82dSTwxSq9rPlm7KuY+QIYP6gq+2I=;
        b=Q40qSIK6iajV7tsDwXnXq1l1ZcJZPJnoMNKJTW1cSUTIbT+6Gquyo19Fke3eP/Gc+k
         TbIRmrJB6l+0hhNaLbE2iXvsWJQtq7E+ssjKwFvbDtPSDZ8ljd44Fg6qAfmMpgsAFg7c
         iwfPIiVz8k6I1Si2Hjib28ucC7J9aNY2cxX9gV+2YPDAuQMEPsA4Al7OGVQeHHkNXIgP
         Vd5LnWWZkO395bG2DgYHVx22/nwEvrIIU66VIgCJWzNzmwjRf7H49IGFsD+DKDCaiDbZ
         V82yqFRvL8vT08+y5oOMQsvSFCALIvYQxCctT0Z+cbaDaKcmTrZPs/I0gsTYlmkTfSGQ
         DSXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO7B6HuFuxGn0/AVWl+JVUK7enDn2QBQmH1WmyNccEl8L19zojDLeDh6vD6I+j3yR6uDQdoZtRnBHxZIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3AeRDJCaAOVKO8q/8AqbNBacP4lx6Oi/cIFYs+WE92KWIRYg/
	uYx5liKdh6srbPj9xVDyX508BZLyMvDOgYLx1CL21em34OrSY5fR04sb
X-Gm-Gg: AYBFou1SyofOz3wWggtuPXrW4UqhKxLXekJ+BY1+2swY/IcI91kdTW3YKtFUoSCKqHm
	X9wbwb1nEQKQev0VuWhVoGSBXA6YKW2RzRS0v4/qIdxOTYWH3S7YdqyaT+xburn+fDgOYSiqUqN
	ajrRRTJaMrRqMTt7Z6XEupPb9NFOH9pzvUrRvBqYoWMf0pwU+vsFeo0eptmDSTh6RwjRkzAd4/O
	yP337HBxPmhbYL5/HM/y7P9NmU9gyJaGHCcDjUAN3DQPMkuDE8RchzRCrI6/R9soRy2ecw+OxtY
	y1F8iClwE/FzrSKWffFReME9/A8PndfbuiODTD5EhXt+ZvGvtdrenp16fe9klQOxl5kNU1SfGFi
	1cJglLuLZC+iM90xg/ALlQ0V+bB1MBe4Ko1NOnCgS8AlXzSCshNE/QUpgXcI/AxPp1IaMbbza8Q
	UFjuKN8uJhi6yYkMwT5WULZN69TsALIc2aN7ZFgA9fqaKNu3pZRAXbC73hGD2m9JhMtnBzFjSaJ
	LBeW6dVxJtxmQyfyeAYcsFOTfRvTdRM9RxzTBP2irHRS2e2/FqTUwfIH5XGJkPjZ8iRhd4Qx38d
	l1ywokkzwqU=
X-Received: by 2002:a17:90b:2e46:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a8a12bf661mr1450443a91.48.1791366441970;
        Wed, 07 Oct 2026 02:47:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8c46a2f9bsm265866a91.2.2026.10.07.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:47:21 -0700 (PDT)
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
Subject: [PATCH v8 0/2] serial: core: fix baud rate fallback loop and baud_base overflow
Date: Wed,  7 Oct 2026 09:47:16 +0000
Message-ID: <20261007094719.1362769-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses two issues in serial core:
1. Division-by-zero WARN/Oops during baud rate fallback in uart_get_baud_rate().
2. 32-bit unsigned overflow in uart_set_info() when multiplying new_info->baud_base by 16.

All patches are ported to the latest tip of mainline (551c722f4080) and
dynamically verified in QEMU KVM with CONFIG_KASAN=y.

Changes in v8:
- 1/2: Rewrote commit description to detail the step-by-step loop iteration
  progression (try == 0, try == 1, try == 2) as requested by Ilpo Järvinen
  and Greg Kroah-Hartman.
- 2/2: Dropped secondary Fixes: 6eabce6608d6 tag per Hugo Villeneuve feedback.

Hui Peng (2):
  serial: core: fix baud rate fallback in uart_get_baud_rate()
  serial: core: reject baud_base values that overflow port->uartclk in
    uart_set_info()

 drivers/tty/serial/serial_core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
-- 
2.47.3
