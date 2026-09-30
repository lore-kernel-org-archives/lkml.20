Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AFE4F96DD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773153; cv=none; b=bbJ2hzTaotrPjorCVYLITw8T7jjZkKuweA0WtXOB+jDrlt/Dc7pOy5GFZp4lwAg3KUp535ahEedK7iXFE1eILjgsFM53emU3enP98XiTam6c1i3TYDxSJ9PxuXpa+2pqfF8VbTCRdHWIbKEMM9U8sZ2EGWUVVvngToM/pusI/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773153; c=relaxed/simple;
	bh=Mq0YPOcXIXmJM5XDX7yRYBMbSphahEFyS0D9AR8XhCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozuP/HOflqQKookMZLTsa29Hb+TMn8/WYcOvBmVJ8HTLTQTqlJYM90Y2iu9dQrq3/iuRib5V0PSIbjLnk2sVJi9OQu28Unusw1pgCQJns4PQqAEDCQtTPbfUhxIWxa8uJ8+/ttQ3PdbmgJ9+sEBjIPsK0IoI9n1o6ORHkd82bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQ/rS2Bh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQ/rS2Bh"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so23696065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773145; x=1791377945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThjIdAe3tMXzbT84DjYHLGeB5MLacVxxaFyft5w9u4M=;
        b=pQ/rS2BhyTBa4XvWNR4QUjXVZeKTxg/CfzqIGdrOpbyn/gLrYC28Um+kRKQajCUhDQ
         nhi/coiKaamqF3NL4aPFb2dpNPd5z6FPMtPQInG6PApKXX1rLwJ4ABLPjXohKQSVDa/G
         0HhoXOQ6fFv/M34z3X0mAEl4IBPdz/xrrG3+v0DOzQCHm+PrE5TlTB50ZX0muUY3Pzss
         DKxk6w7h3mrsmG1MdjDkiqFyYdyYEbWJqCSOsDgbo9Xt6cxqh7Js5ltkAejzblJKCQjd
         T2AzyXh4iJJQzLELIoXzqPRY7yRgmXhd96Wf2b1u5UL74IeWXU6QFhAGXbzIXWtNSAK0
         t9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773145; x=1791377945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThjIdAe3tMXzbT84DjYHLGeB5MLacVxxaFyft5w9u4M=;
        b=T7s070RxINBJkPT0PjqxVVu7y9K0LsRakI8LqmHMB3rlsD1y414Lj6bZb33534YdLL
         qIizO5i+cS1sqRLZ8A5tayUyVkHQKAMau0jzEvD8y1tYO74U27CgsYv6Q0wOQMWx4kgn
         e2U4ZLp0LY2mr8mee2e//kdlALD50g/oJ9W4AlZmqHA0CHRzvEXTf7VRMM371JhyJmsC
         uz8qODEZI1eXp84/nOi5d/BaZnjlsQHvleA0hPHhGksZH4mBbLKoj05197RnPiuQuL0/
         Lxuy7oNwxj13d1OU+OvBNbQ+kDgdlP45AsLd2HCH7T2OvFBcrF19L/fatdJuHgk9KLWM
         X/Gg==
X-Forwarded-Encrypted: i=1; AKwUvBycdJehtvMDCYhxPgRNlWP+bmqJGHr4Pq2/h3qy1/ahcNvnvepmIod9XZVImymuWwvdrfAg8Q6rcFad6S0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMtl4XMN7EVoE7Cm8V1JIP7EQjgpG8ecZlb/0mTMkS78Rs21RE
	cBeLi8/3vwZJZ5+4wcQMNnP7I1Aaey4P9Vs+lE/VEg1aOSYoy79fCgLA
X-Gm-Gg: AYBFou30JRSnOUMDt0Y9ufRe8sopEBQUye54aWGSVT1vb+1A1qE42if4Vjn9OS+7mPf
	tXTutWPCUKP5SZkj4NzBrg5fnC4HZymaHYt1B7ZjbqkbqhVmnMuSNny3ypfOqIfA1pTYf8iU5m+
	ArnoeSPbk/49pSc5g35tsVhrZY2KtO1sMf4Nft4PA+dkz3MLsG1dZQBS/Uuk3sDAgKgo4qpP4dg
	L2OlMqBL3UgkYKExlVE5Db3FsIIpuRk/Xk0zSbl9P222EZ3yAXgmtsXmJMA3RkDdoImLVXbv2Ua
	mfbfVm4gxvDqlojIH/uYK0lVYS5aCu8/FrmI5DSBfY+PsYJPr4WTcyqhbJWSrtjFyxJ3FZZ/swu
	vjkOQe9PiNNfsFDlOKcRZHL8TkvRmlNb6QhKM7vZl/bqmZJ8NJNoqVqwcERtvITRisVlJqYp87y
	abxIV0cZZFbCaBo3FPA1zsIZ8XwgNOZFRZsdbzJ1G60Ulljp83AYJDBpMJmqWbG2M//quRsDRGq
	nUagyvtuy3a+XIenNHpeT0kiNuCEIhUjKCNhc8TXELxbPdR+4jEGqzgHWUfDQOivNylfRrfHPi7
	TBzhda1qmQ==
X-Received: by 2002:a17:903:4587:b0:2e2:bf79:3cbc with SMTP id d9443c01a7336-2e2e4a1f706mr10544205ad.14.1790773144737;
        Wed, 30 Sep 2026 05:59:04 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b3d7sm6751925ad.70.2026.09.30.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:59:04 -0700 (PDT)
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
Subject: [PATCH v7 2/2] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Wed, 30 Sep 2026 12:59:01 +0000
Message-ID: <20260930125901.778868-3-benquike@gmail.com>
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
Fixes: 6eabce6608d6 ("serial: core: check uartclk for zero to avoid divide by zero")
Cc: stable@vger.kernel.org
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
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
