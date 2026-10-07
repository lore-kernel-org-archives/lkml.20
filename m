Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601D3C3C1C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366452; cv=none; b=Kgq3Zsx8CRmY7j+SS27mees4+c6k2bpNyHzH40nMoncnmIp7NVwOcb4Pwq2anNZVNGv7rDiMuu4WdvIOsG7mfv762wcES/dc71wA4viEGr8bOERy36+HEacrmo00Zk0kXECPnGG4ImnoFn0qDAs3N7u4lT4KCxWHrbeFyPd9p94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366452; c=relaxed/simple;
	bh=vXs24fjaC7qTQGkg3xIXR4ZuGvdt8SYm25AED1Umq1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbGy2oddHkCXDXn9YJsr3W85vW65/APDDtspXl9I1ISeQnA42GIIs1kfwARu8bn0QvQ/YNIH3vxI+bh2pYWWSNQhSa54xO0FYOT/d2WYrYJ4+S74u/yZPPSZJHF8IIWGcFTZbwRfN/tUY3vExiDSM+nXoPsv3KGchFNprKLekVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDQfuR6e; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDQfuR6e"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1183353a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791366443; x=1791971243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yT0TcbZ+JG8IlTQxGO7eLDG85XROXTPgMXO/HoKFVoo=;
        b=HDQfuR6erjCOUdjs35bckBUMF0WXycQs5UyEFXS/ST7oqMqCDkuaYvU01rFfSal0Si
         33SRnpNcuXmbYClsy6njeWtAsdXsYoSY+kgV0DUoy+W31Cl9233gQ5Bf8GHsi7IULv0b
         yuZs9+Y0bVpnxrnWF/IoLSPq7yNjXIAQYag5lBy3JOWtuLj+krr4Q9FtR+eK4Sv7tOa5
         cqt1cxMYrgs/QbAwCVCa+cml5vbJ6PUvfEoSGzB5ZC592NTJzBRpPIsksQX5m5iX/zgY
         XEnFolvLmp+Tx86xF+lV8XzfoHgWo+YK0OaduY8xn48azXzjnh15pJNhIOsFcUOSpzGC
         xypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366443; x=1791971243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yT0TcbZ+JG8IlTQxGO7eLDG85XROXTPgMXO/HoKFVoo=;
        b=rS6b2L36X/KvzkNRpk1Kyabr2xRMAq2YW/bml0P4LfzHaSCUBr6D2H7/LVQzyoFjxP
         qHY8FimgFsvQsBIIVK4SJqmXeQC2Dd0V3Q22WaoXlc484BUvKSZVuRc3ixvz4rZMz4we
         6psfjn7b3gNDTHj0t4SS/Xx8UiUXFaLzyvQ/cR/O+O86dYVcUh1Aeg8nD4f4rqLzwT76
         k6NlxBwJ4SmmQkXWzRmy3UICJUWTS9A4vPIVX74yrlqlgHxu7wIKL4k7+YPEIcerXXjz
         zTuWpGkaD0cYzo9gHnq0b9exyQ5T6+hBGWjruANgs9wIo+QOeNrnkAUjvEds1C9OoVx7
         2q7A==
X-Forwarded-Encrypted: i=1; AKwUvBx3yM1gozrjA56GYDW95KwoFsiBvk3VX2OrRtMhdQn58QamGAvMu4bEhzw4V7TqeBOTZlKPvBcZBI3ZHvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk192KHR2OPMRduzSRax3N4MODGZsaPdmHU9EoaenWlNmMLjJn
	m663bcGTJ+67DH3w7/ZVmkgrstReH1DB0FfLRlm76Wmh7O78Zd3MW+4j
X-Gm-Gg: AYBFou0VavNSivHSD/9uTCg/pgUaSvlR3HQoDFhAfUzKEI1cXPPs19XDv0ZV417m3eg
	zjPiISqiY/Q6fW5Ks4A+aCXSA83+TSIJ7ST46DHmku4dzNnHcK6a/jmBeW/l0hadfy2qhDagk19
	r6z8P1vCsEsKTx+00cv7a9Q9tl5Gki8IoQ63iGsP+ptfOi4KS9Nwx2acFPMnh/rZm9FNY/5uVPC
	3tBD3Eb2xp+62Vnzcb6io/DZusbtUemdL+KsuGaoRcKit7S6AmkyaS0YwTAHCNxRm9ire+enkRT
	rBKCMWB9j26w22O+Tq68tVeuuQuABNXBUa049w7j39qMcO7L7LaQSwcaryit4m4jXw6OJmIcP0Y
	6DQPEgEmy75hF8tcn9GRBYy9rc80dXRrWwvT0TCuYG6CvieX0ua+cwu6rmPq0TlXy4Im7E2+Yw0
	O75cQWpWuWZ0YiQFqY7Pvp8Bm2H2tAFXw2VeMKCzE806rHt78C/1JIp7OxIaRa86VFRVKQ3I77F
	S23zxKveIrCZ0BvNSZk0NjHWMDBGzY1fiz4UwGKyWpqwRdwam8QhAOYoCW8ZqYRqGB7ou9kLvkk
	FgYn8IY7nA==
X-Received: by 2002:a17:90b:5390:b0:3a8:6b84:235b with SMTP id 98e67ed59e1d1-3a89f671ff8mr1142874a91.7.1791366443261;
        Wed, 07 Oct 2026 02:47:23 -0700 (PDT)
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
Subject: [PATCH v8 2/2] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Wed,  7 Oct 2026 09:47:18 +0000
Message-ID: <20261007094719.1362769-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261007094719.1362769-1-benquike@gmail.com>
References: <20261007094719.1362769-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In uart_set_info(), new_info->baud_base is multiplied by 16 and stored in
uport->uartclk (an unsigned int):

  uport->uartclk = new_info->baud_base * 16;

While uart_set_info() checks if (uartclk == 0) and
if (new_info->baud_base < 9600), when new_info->baud_base exceeds
UINT_MAX / 16 with low bits set (for example, 0x10000001), multiplying
by 16 wraps around in 32-bit unsigned arithmetic to a small non-zero value
(16), bypassing both uartclk == 0 and new_info->baud_base < 9600 and
setting uport->uartclk = 16 (baud_base = 1, well below the required
minimum of 9600 * 16).

Use check_mul_overflow(new_info->baud_base, 16, &uartclk) in
uart_set_info() to reject overflowing baud_base values with -EINVAL.

Tested in QEMU against Linux 7.3.0-rc3 by calling ioctl(fd, TIOCSSERIAL,
&ss) with ss.baud_base = 0x10000001 on /dev/ttyS1: on the unfixed kernel
TIOCSSERIAL succeeds (ret = 0) and wraps uport->uartclk to 16
(TIOCGSERIAL reports baud_base = 1), whereas with the fix applied
TIOCSSERIAL returns -EINVAL and preserves the existing uport->uartclk.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v8:
- Dropped secondary Fixes: 6eabce6608d6 tag per Hugo Villeneuve feedback.

Changes in v7:
- Use check_mul_overflow() instead of raw UINT_MAX / 16 comparison as
  suggested by Jiri Slaby.

 drivers/tty/serial/serial_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 6ed0195e6912..9a8f4c2e1180 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -14,6 +14,7 @@
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
 #include <linux/console.h>
+#include <linux/overflow.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
@@ -931,9 +932,11 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	old_custom_divisor = uport->custom_divisor;

 	if (!(uport->flags & UPF_FIXED_PORT)) {
-		unsigned int uartclk = new_info->baud_base * 16;

 		/* check needs to be done here before other settings made */
-		if (uartclk == 0)
+		unsigned int uartclk;
+
+		if (check_mul_overflow(new_info->baud_base, 16, &uartclk) ||
+		    uartclk == 0)
 			return -EINVAL;
 	}
-- 
2.47.3
