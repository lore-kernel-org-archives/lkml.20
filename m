Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1548E0D8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045236; cv=none; b=JqW+dTlJSTcOs+Wk9u/78mJK5JbtqbeRmWtKELVgtB/OZFuTN4QsXxdZwfG8TLc7NTwSO32AFxjmeChkb7Sc560gzASW7rQRZJ5BHfqlgnTusz68jV7KT0jFW+CNakcd/q92OcON8eU+6DMB5I7JOhjqgajzvqhXP29/scslJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045236; c=relaxed/simple;
	bh=3YfD7rZuw88DMuwYczaiDoeSy3itfBMyP/2TnoBot/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj+HdZGycP2hlPLlusiK3B/8nboPR0DgT6QWphLd4ZKOz+FR4oXVYj1lAVFpZnvj2JlKoF7gE3uK21kh4Bht3bcg0Y4mqkSexjNKm35FsT0fI3O6BqD3ABR+25vwHyCc3Mk92NMxqTbFWsxRKYubPb1FiHZ0MpJVFgSBguWC6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvqZBqbw; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvqZBqbw"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso6196671fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791045233; x=1791650033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V26bRrFo37kOD/3fnaNC94SFt25znV4xHPmGyUnh8ns=;
        b=RvqZBqbw4n0YXQu589EXJzx0nPG/+lz0XMwDTvAs/2WIzScatcF0WUNUN6lvslgbEh
         MEOfH0OCkOQlzJvcp5yU8YZ8m7fD0j5GUFyx5SFYY1+h7W0dqaXZZfe7CAfVZTlncgYD
         BmsmxV8iwVJyfYmQsSz0eS8lTFshsjSyzreUpZaeV/iFaUd1jEAcpBLbxyV0YbxwP5+5
         fpGV/tep7DnZYXN106Pc3FeYWyj93fNiN039A4e8vfLc016zEI49hEg6WHp37ybQrgkM
         4ayln15D5w/NxCl5NuzI2EtfLd0+TUpJPMXfRHK1cSyve4WfvxvkFzT0sIzQ/aDfrsPw
         G6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045233; x=1791650033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V26bRrFo37kOD/3fnaNC94SFt25znV4xHPmGyUnh8ns=;
        b=r7yCGo2uCYqId9/jkgAcHAhB74SAKSA3lSmsGLK2ohRqyb96qTvAUNsP/VROG6ddlA
         SbzVBQhXHQQsAeZJqoEs4sJjn7pFEX0LUFdJDuAncZpRbEVH3Kb53RE92B5xmWRs23d4
         vtR5Z1LAW5r0IjcU47PnM/LnS/2YQxfyPECz9sWyyX3cWNFbOg8qvsCvxmsG4jkLZqqO
         Res2xePeZCFbxCCvM6eAhkfaVv1uByOdIUcTjk9RRcWIr7kNMFtnUMUHAoOn3a2kWQWG
         rv8Va4Xr995bbdQ6XqK7o4qxqQE3433tdnbLwp+fISdSkUKhTIIwg98cZvCZEk7K9kL4
         bKgQ==
X-Forwarded-Encrypted: i=1; AKwUvByo1emAj4MzL8biEqMoQ9uu2a1qm76SX4g1KW5JfHNfIbzDi6J3gHCQiZAXdlW17PMgjQZPg1xVf9FYh1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC1g0wWykTwuuECkd7DWNOsx4TEdNsxYDCGp2TIG34i6GIheAf
	FVXJKGBsDGIlCtC/XVZ1pXAXEGDZLkjIZkaS1y6K0Ce7+zUirtrTlbr4
X-Gm-Gg: AYBFou3z1nvDDnNZUlc/3jb90LiucYR2INkut6Pnes5sv0G/Wt8nR0xikeItONK5LDo
	EejU6E57H9DzJtFQd1jrqVmu2uFnlNyfP1++zh9sUGmX/pWa1f0H6liAw1k5H3zwxHEIPPkGf9S
	eTQ916uYJjlBH5MbVXczEplE6vFGo7HGQZLY4u0hkx2cfqeLB8YnzxqUQ26CikZcyhTLqXfaLQ9
	HZN/t3eJuXBm5KH3dYgyUjH+pHZ+lUdIbWT0X0Y+kt8POGxZJMRO+EpcmlzXS9gQi4b92eNIPAP
	1KpIi3AFMBUzkDnoGEqBBMrzasBY0z8855CJvIv7iMOyxq5Q1U58v+Qy6Vx5y7hcEs96C9ERNR6
	9G0N5fIDooJD4Y+ZsyT6c+GEKNhwOGFyTeuBStLiCoY2ECM41RLFMkatI9pFGEJWdsjHJ6BhnYd
	AeaPH7E00T2zZ9OhgFBHVZdjqzF8MwfIMOsLStdndfehHx5MhPlrKjR64U/fZyYRkopyhK6Y8Fw
	C5RRl6F3xD+kZM5OHLS/W8CmNGbLIZZMx+NSSUmXfl8CIJyQmiJZolKQY9t647i5FGfGVSBGeuX
	VbO0AggnsCDwKW5SzhIwoyw=
X-Received: by 2002:a2e:a98b:0:b0:3a9:7520:172e with SMTP id 38308e7fff4ca-3a975202f06mr7157291fa.17.1791045232579;
        Sat, 03 Oct 2026 09:33:52 -0700 (PDT)
Received: from user-x870steellegendwifi (95-25-156-252.broadband.corbina.ru. [95.25.156.252])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm21627211fa.39.2026.10.03.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:33:52 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2] serial: core: shut down initialized port on removal
Date: Sat,  3 Oct 2026 19:33:37 +0300
Message-ID: <20261003163337.45577-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924192224.3175-1-igorpetindev@gmail.com>
References: <20260924192224.3175-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a serial port configured as a console is opened and subsequently
closed, tty_port_shutdown() skips invoking port->ops->shutdown() because
port->console is true. As a result, tty_port_initialized() remains true
and the port's interrupt handler stays registered in the irq subsystem.

If the underlying device is later unbound or removed (e.g. via sysfs
driver unbind or device hot-unplug), serial_core_remove_one_port()
unregisters the console, frees uport->name via kfree(), and tears down
the port without shutting it down or freeing its IRQ. Consequently, the
irqaction descriptor remains registered in genirq with action->name
pointing to freed memory.

This triggers a use-after-free read whenever genirq accesses action->name,
such as when reading /proc/interrupts:

  BUG: KASAN: slab-use-after-free in string+0x476/0x570
  Call Trace:
   string+0x476/0x570
   vsnprintf+0x422/0x1300
   seq_printf+0x...
   show_interrupts+...

Fix this by acquiring port->mutex in serial_core_remove_one_port() after
console unregistration, clearing port->console under the mutex to prevent
data races with concurrent tty_port_shutdown(), and invoking
uart_shutdown(NULL, state) if the port remains initialized. This ensures
that port->ops->shutdown() is called and the IRQ is freed before
kfree(uport->name).

Reported-by: syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=843bf2f48f4d12e6682e
Fixes: 761ed4a94582 ("tty: serial_core: convert uart_close to use tty_port_close")
Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struct")
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v1 -> v2:
- Clear port->console under port->mutex using scoped_guard() to fix
  the data race pointed out by sashiko-bot.
- Verified without synthetic devices by reproducing via sysfs driver
  unbind (00:04 serial pnp device) and inspecting /proc/interrupts.
- Do not hold port->mutex across release_port() to preserve existing
  locking semantics.

Reproducer steps (tested on QEMU with console=ttyS0):
1. Open and close the console port:
   exec 3</dev/ttyS0 && exec 3<&-
2. Unbind the serial device:
   echo "00:04" > /sys/bus/pnp/drivers/serial/unbind
3. Read interrupts:
   cat /proc/interrupts
   -> triggers KASAN use-after-free in show_interrupts() without this fix.

 drivers/tty/serial/serial_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 95774b0f1..f6253cd30 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3213,6 +3213,13 @@ static void serial_core_remove_one_port(struct uart_driver *drv,
 	if (uart_console(uport))
 		unregister_console(uport->cons);

+	scoped_guard(mutex, &port->mutex) {
+		port->console = false;
+
+		if (tty_port_initialized(port))
+			uart_shutdown(NULL, state);
+	}
+
 	/*
 	 * Free the port IO and memory resources, if any.
 	 */
-- 
2.53.0

