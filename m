Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049623AEF54
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762529; cv=none; b=N01ezxHPq3j/nJwKDeISzpAI8+WFjVJxd/cx+bLKcyOPeMTq3AzAuXcHo9a7Lu7U/fIy+M9MVMR3/yxsLDXDw/K4m49nZyLAMHl8UBhP+hUdR9LUki8O5vYEnHTbBMSsY9WDulKQtqV+apVb96JTsT3WHGSSOTVgZy51VyKgyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762529; c=relaxed/simple;
	bh=X8W9fGrm68+NdQxaUiu3aZ0LqSsMxvwJOKXUJF3NRok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scGcoJQ3ehzci9K3RimtAJv8TQCsHqiefb39o92u5I2qw2bdJrX2d0OOjZMWnk10KxzF6CWz4nRobT9Da3fmHqejH9nwbtTbD/7cthzFSF6Ts1QklJmEjWeNRAKMDF+dQ+JZQnGFkIKN5JaspaYHnJaQJHmZBqu+gFLikbEtTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCE5Ada6; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCE5Ada6"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2534076a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762525; x=1789367325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLAE2XmmuZSgKOvA0qkWrT7oMG5vU8MEAkdw+Fem9Fc=;
        b=YCE5Ada6FQzfpkuGlHVhIwt5SEIItzv0YqqKbbLW5cfJ7iYZZqKzZjOQb9QYoULWMC
         EBtcvyd+jWZ4pbO3v/dHRO2G6qKIi8xhS/RZGwrAKIpIZkK9Z1HG38E1cCJ0jeZYadzC
         ClARr0kYU2ALs9CxdobI7bykirfi2kvsRce44Rd56eYwGzfx6iPtS3Nxr9YRtHdIMQ0h
         y+tOHvrGAuYwBDZvtcI8lsXmfeC2aquEkAEZ2XPnFII4y00L4EvFuDYfJ2CmfIsOdxMn
         sa+dd9y7vszF8tMJ3Z7QpHxX/YfyDcRRfa7cfEz9D2H7WhRXLB7ogGoi4bC401Yk7fDi
         A9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762525; x=1789367325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLAE2XmmuZSgKOvA0qkWrT7oMG5vU8MEAkdw+Fem9Fc=;
        b=bXagTikJjlvZIIo/Wpe4vU0qYA3Omi5ehjSp79atjPMTpdaa2aFFy1IrAYz5bZjoO5
         0ibmcPO+KMXhUu84lpiEto3eYg+Ft2IfCvbb5R3plL9gvTllKlSeVgduOfpVFYmuFtCj
         DBmEH7uJLUcxg/eeQh3m8kLTwQSt7H5UnpHyNCAOXO9Xj27frJ0XWWAKvemkuB2bjfjg
         DPzvaulk1HbpXd3TXvLJfvV9wnVAA+EkkCy+WstNspjqMhZyvqchyBIoyik1kIGGnEw5
         K61vnsmHU50Ej0GbtL81gO4Jzh61VZv7uYiqeOf6X5+D0V7GIFOZ/PQY529+DamOGqqW
         F9tg==
X-Forwarded-Encrypted: i=1; AKwUvByYhfUh4bk0NhzdtRGl79gCT68d1eiiDYni3ZOKNYxNcMVY/vw4RzTlCqZwSZnjNpZ1aLA9a1PuMSXei7w=@vger.kernel.org
X-Gm-Message-State: AFuF++n9gtV4LolWW7yZpjzbtioYMxH9DHxFqs/Rkmf1USlF1MVEPMQG
	CpAwCtYoLWNP1V8zwbbotlb3bmBV62zO+qMiMidcl+uv/FLVzvh58V7E
X-Gm-Gg: AYBFou3rh3Hnny9oCOm0WaHeSG3gJbiNE1FJU51JFQ3kG6+vkLI96oyotJ88DIpj1db
	pzELKT3ZMmNM8nJr8jA+RMLWgvtS7Syh3sBCVWzj/kv9JGWlNtOJXEsW6hsLf+zPnd7uFxQYLJ1
	9hjt41mA2Ld0LcUZi5QnTUeiXEMnI02lTL/MUS5OS/z2/37+qxz0CG/kMadERP2hWIQsvjswVlN
	CfD3T+Ze+iWR4u14j7VxbK/xm41h+KggToo7fO0FZ2kyB1HePYE3tgBlEoeM21a1zgN5GtolH66
	845SyI4X1IGPxXw486+q41jNK0GPxjAmBPyEuTUqkBRER8/uJu2Fc2PtkFizCUgPqOTfW8ZtpqI
	U9oNTizMYbzp/sAJZ6k9n45PunzOW3j4SWXWa9ZTY51RloGjELVNb/1h2oGhzLzLgzSTPfOX0j2
	VbTbRilnuSSV12hkuta33Yyo3P7pPGzsNKfDiXEMKsqrm41SIWpn2BpN/SqNq/9HKD61KkHaRel
	eONkp95KjPEtg==
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr30248151a91.5.1788762525152;
        Sun, 06 Sep 2026 23:28:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm36612713c88.4.2026.09.06.23.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:28:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: fix typo "satify" in comment
Date: Mon,  7 Sep 2026 11:58:40 +0530
Message-ID: <20260907062840.17276-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "satify" to "satisfy", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/tty/serial/arc_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 5c4895d154c0..3988e5958896 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -304,7 +304,7 @@ static unsigned int arc_serial_get_mctrl(struct uart_port *port)
 {
 	/*
 	 * Pretend we have a Modem status reg and following bits are
-	 *  always set, to satify the serial core state machine
+	 *  always set, to satisfy the serial core state machine
 	 *  (DSR) Data Set Ready
 	 *  (CTS) Clear To Send
 	 *  (CAR) Carrier Detect
-- 
2.48.1

