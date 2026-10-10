Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954273BED4A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604005; cv=none; b=A7J9GQC7oNzSeXCG9l3vkhYDL/avlPUqd9ESKBbeW9u2rGTdXSpUdI+YT7uAmd8oCYIZzuuUCTRBDw+gxCd7mXiD5AcSn9TvSyP1YYUa57t41pMMGmuhxlEZrlyNHJT+i9LaQcXPUuI031UkdZwWjLWUiCJ01TOwm+yYVhBCDyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604005; c=relaxed/simple;
	bh=k8TPoiMwAjR5GOxMyjwMDX7WGOJ4rF1M+VeIYQvoBuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wu4i3xXjKRoplcuzzR5Z8h7A2SmG9Q5m0NE6ry2yzrPtW4qMWyoMR77KOhRlNjAmR+8zdiUj3+YHfTQse35SHKd6wArT18dgmHaleyLiI/81Xz6qHxkc0tWngVcglHzXoN0aD4/1EkBCulY8CJJF15ZDDvs+eDxCmYuLf8dJd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=CdaTJCv5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="CdaTJCv5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9199927cb42so3404096d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791604000; x=1792208800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9496Z4xJQFpi1+eiTqu1gpT5LZKW67A1SEVUrT0nCjI=;
        b=CdaTJCv5K2w4VqQdCyMp8bT1M3Pt1kh4zC9XkltN1kt0+A7w/KupiwBQEhKJ1NYQRS
         lPeie4y1Q5tabABFfu0rKopRhAzIxYyIDTqeu8ee1M/qLkseDTtLtO/AsxWK13a647K8
         MrXNFZQvF38hf29HMfmz+aPqusM8DqUmEPw4yXcJgm9Am+dUcH/xs/hyRYYemcF4z6Dx
         kc6yYKbNlDUnQXCaI2mvbxa5SPRQdJx1rg2zelyygENubFwOk1IUZaQJC+YxcS3p+z0b
         fzKR+OGlfCoxsoHfgTNZMoO433rC48JS8c39irec9ta+OBivBTydE7UeLE5jFSWpBCZm
         rG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604000; x=1792208800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9496Z4xJQFpi1+eiTqu1gpT5LZKW67A1SEVUrT0nCjI=;
        b=QFPzBIfRqEiRnvXZxiCN+uwry+ua8v9AIKUqL4UUQp9qKevXHjXrxG+MIfblYyIKAr
         qKbogQa/3+7AWB8/x9itkIDxQomoj6CL60ADXzNPlWjgmTQN27b9VyqC+MQ7EhVFsk7s
         jXnJecuGwIrdbR3+vVew/wYwhSB5DrJse1gURsr/lrJT56LL5hdVjISjXPZQ84RKSSEm
         MZqgO3t6sQJuW72WHEbZL3ZdFPwp/sqqRAFCVeSLsLMTj6AkcTLqW8nfQYkedC3hs9Iy
         3U4e/ch+rqWvvOXu6ZwGBswue2VqpGdtdHb3fQAzDqCkAPk8Z7pCmdUKp5w9Z6f0c60J
         oHsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX7fUFNB7wBSC557jWQjeZkBxhouJx5gfGHXckS6j3qqBJmPsUezBvXbKR2V1o8Vdi9h+EyVpWYro+y9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVebaR3kgJ/HEcvizg6Nd0W/uGVwWkwEgSwkjrfhYG/A84ZfHv
	S7kml6NjUA+/Y9paFv4cNs1fi5wYHBlhPVL6P+4TYphCehhHGziD/No8QSof+jDong==
X-Gm-Gg: AYBFou3RHBkCLea0KXlIeJDyW2LBRT2yLCKKCMgLt+MEmfRVSy4Ik9lb2kul2phXQ+s
	wOUqiAIbHYyHQ9Wb9s1nDuGpzXfxGQA428Dau7l6DjzWTU/LEql/qqq+ZQPQgCpOLXTaSKGO0kQ
	FG1vha9rA4qIfnzeXV1oAGuQe/et8PPo9hzeAaxrSFIv665HZdV8D9zdvLLykfqbP3kyv7jk7JM
	MDS80kPkIPaU1DxAcEOc+g+n51QdwQKO/F6pT/bDCovBvwk6EdJnhptRup0ject8boNzXP7gVFP
	cc9niHH7n6EvOnaO7zik3MlBQIMHVOQt/RH2R7yWrhF0i/Hh/edhaaCjY8JhknfOJ32BxqZujZB
	OALXHYE9tRm8Cy1fC+pO+8HyGUD6MJlVf2luWCyUNYXbEXrfyOe/uMsFwK51OzVHDdSXdMZMdTJ
	IBAHuvcfhxAKm8LO3m2JmqEDn1LKGXbeckB1e3jLQf1r/3qB0yWN25Y1c3Ln9nAvjGh9gXXErF2
	6rbqkb/nfOzajjFwf8SGA==
X-Received: by 2002:a05:6214:4291:b0:919:aba4:22e5 with SMTP id 6a1803df08f44-91b554ec072mr64283936d6.18.1791604000205;
        Fri, 09 Oct 2026 20:46:40 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550e1068sm35475306d6.46.2026.10.09.20.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:46:39 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] serial: core: fix TIOCSSERIAL and TIOCSERCONFIG on uninitialised ports
Date: Fri,  9 Oct 2026 23:46:16 -0400
Message-ID: <20261010034616.3915864-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8ca59f7baee7 ("serial: fix ioctl hangup race") made
uart_set_info() and uart_do_autoconfig() return -EIO when TTY_IO_ERROR
is set, so that they do not run on a port that has been hung up.

However, TTY_IO_ERROR is also set on a port that could not be started,
for example because its type is unknown, and by uart_shutdown(), which
both functions call. As of now, setserial cannot configure a port that
the kernel did not detect, and an autoconfig that follows a port, irq or
type change in the same setserial call fails on any port.

The issue can be reproduced with setserial (busybox) on a port without
a detected UART, for example ttyS3 of a QEMU guest:

    setserial /dev/ttyS3 uart 16550A
    setserial -g /dev/ttyS3

Before commit 8ca59f7baee7 ("serial: fix ioctl hangup race"), the
result is:

    /dev/ttyS3, UART: 16550A, Port: 0x02e8, IRQ: 3

After that commit, the result is:

    setserial: can't set serial info: Input/output error
    /dev/ttyS3, UART: unknown, Port: 0x02e8, IRQ: 3

This patch will check tty_port_active() in these two functions instead.
uart_hangup() clears it under the port mutex, and it stays set on an
open port that could not be started.

Fixes: 8ca59f7baee7 ("serial: fix ioctl hangup race")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Commit 8ca59f7baee7 is in the stable queue for 7.2.

Tested on v7.3-rc6 in QEMU (8250). A TIOCSSERIAL that is held in
copy_from_user() with userfaultfd while the tty is hung up with
TIOCVHANGUP still gets -EIO from uart_set_info() with this patch.

 drivers/tty/serial/serial_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 6332ed545c89..81a985424694 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -896,7 +896,11 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	upf_t old_flags, new_flags;
 	int retval;
 
-	if (!uport || tty_io_error(tty))
+	/*
+	 * TTY_IO_ERROR is also set on a port that could not be started, and
+	 * this is how such a port is configured. Only refuse a hung up port.
+	 */
+	if (!uport || !tty_port_active(port))
 		return -EIO;
 
 	new_port = new_info->port;
@@ -1144,7 +1148,8 @@ static int uart_do_autoconfig(struct tty_struct *tty, struct uart_state *state)
 	 */
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->mutex) {
 		uport = uart_port_check(state);
-		if (!uport || tty_io_error(tty))
+		/* As in uart_set_info(), only refuse a hung up port. */
+		if (!uport || !tty_port_active(port))
 			return -EIO;
 
 		if (tty_port_users(port) != 1)
-- 
2.53.0

