Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089460;
	b=gcLXD6xjY7fS2S6BsCq5B6sbjlWyf0sJaaQB+A/042spxxBcKPyOCgkxD5JE7eSz8/zu
	 JscqYUyp0ZZKtD3gwYVM9w5Lmmt9LJ1etsRagkPLPWCrYtXM1JtNbYTyp6NtVcbRdt1HS
	 Vp0mJPMU/KBR+vg9QxTOJIyrL6Rka004cByDlH2mu8TovpM2IdmKwmhDCBv3qpa+GSzQ6
	 RsaxGpgo3lsEJQmrfSxp9BsH4wMMwvxRtuosznUM4QpwxH6oaiRq3Ui2FGps5Z6BP5sE/
	 P0yH+rapbmR4WRzDET16w/8wHn/fIVYrLQX2dk9rYcjMJz7c+bYaZ5ayv+NE8y860qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dCICRK3Q2ogNqVz3yPrXVvctFjOQRKEefpiuJ5bCXJ8=;
	b=Zu8ZTXlMM+L6TaSXeMnuHWD6HZcUOw4srGqAAzloIbkeMDS2jmKgw/TSI8v5JChX51Wn
	 2fjiDYjBInxBXIBRsUmCp/wdaSu5WJRAsWPQCnZPKaxx84bRRLpH7hTb++l/3TBmykmDp
	 A/bwtKXozy6dD3sQEQBbK0grXM1SU2GSqjppQH9IrooHLMybNXpO0CXoQTGqDMQfPIcgr
	 MbfXfbvQkOs6xAjw53L6iDPJfw6v7gchOK8fmdcNogD5Sks0TgHWQmrV0RE6Lj8HiAQzf
	 7d6OkSBqvNcCo8EgCbO6RLrbcOo5SaxbLevAiUKULtRpHEamxyW/Y23eQxhV+3OjGJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rrpFqLRq;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3356606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3356606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rrpFqLRq
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so2625477eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089459; x=1793694259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCICRK3Q2ogNqVz3yPrXVvctFjOQRKEefpiuJ5bCXJ8=;
        b=rrpFqLRqQqvBTd3U1WEcu/ms1CK7EvAZFXuWlOfW30Ym1a68niK+tvLZbSbKQuGWJB
         Mi7XdlfcXb1A0DmQ6lf6SGjyU/ljEeYdaBAV4HNw7MKYhqEES6amn0OInwODKIm/v/dI
         6QEQjHtoikh8Jkg1E3Fo1vHoCAxSCQy4g2Gi3E3NKOGNrb4cuoQJEq0nq+dH0+prWYc6
         djSikYcYT/1C+4LxVblB19Uw88FSehmWorXa0iRPqPSGL4u6wNtL5qbLlvo/wxUTkEgY
         5LuXXdk1fo5o3NISg4PcyX8+Ok4RGYlDHxS2HAXkJG6ssQxlmdQg8QzCO21dADGV+zyA
         4ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089459; x=1793694259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCICRK3Q2ogNqVz3yPrXVvctFjOQRKEefpiuJ5bCXJ8=;
        b=nna1kjxsk3P3xZy2FWRYMaJXBomxlnqlpdAjgqybCCuXcsMD1aJq4hJuo1H0bGb51L
         lT4ucIXBcFLVHofoBkc2bMxIrCGMERmaay6+w+b50A/A24W2ZWjVYHOlHRkbJ8u2E+b9
         fabkWBYJgdgtB2skc0NCjd0eDPL1qxt0uoEFCKjNw+wWHb7VC63OSMFV0aaSDUt4G2IF
         ZJEP9pJh3BFIRSTL6cLPSSPLW54k6avW3t0tgikXocc4FyTJGXW1SYn0ilJR+yp0RaJT
         7iGEyZYwZmj8mRyGcOF+2IztWih2QckZDOjZhqiprh/O247Cvu6NKJlunvvLt+HWTpP0
         4EoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2JYvrUO5THcc0bxE0SzY8r8cLH5H13PV5OfYLKQa6b+0XvbnSMTqrrxika2lboj/W8jLAeDHr52HFjtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRvsj8EYGr/7fBVIr6u1zy0ASlyqJf1QXhGsupBjoOp4TV9Wk5
	g9V9gGSKYMVN+qk2MKMe4MWfg6pJFdtR8BjGyJZfgjJnU03hbQd4ou9c
X-Gm-Gg: AYBFou1g0tAX5Nzb8PbbcoeebVqwaR9lOXj9yHGDWzXm+dSWhuTGv2KEcGijXYMxvX8
	MxmEHU7WeN7LoOxv8NMthEcFEYbHXEk0Tjtp3TJQWCFF6SMpB5OHfvhcfSdNvYQ5BURGVav/HGe
	LwWFqmv8+C5ikMkf0KW/GV28OrmGldZtsdUOljN8ODWMEqFB8795BcZ0ZuVG/jh2grE2/R6H8ku
	VvxmqrcDH4C6RX6VWOe5/lVjrSsodOQzNghSPzshT8IkP6d0J8/yD0oUY+uqkY12njtGg3+ioCU
	hOyD4Rib4ODyVXFHENFu2UEtkTOWrsys3PEJvcjqJJGN5zNJTAgef0WcsON5q/xTQtc/Nucj1yh
	nsEZaz75CwMSA57+plQqW/7u2utB3AW41KzWJkMzFqGkLMbMChyFLoc0uU/tkxl35aDZIg5VJVu
	PMPrWFwH3miSxQci6hVOlmgexD6HGBfr4syo0LjUtjIA/3E6iQeIK75j7eUsX8BuZS8SfH5X8a1
	T1DwIO+wIg04MH67yxDGR2u7B1UWGWZKLUzSjvMdZgJzlmynP/KzmXvnZd5dZBEXCcLpnN/s4Op
	at5LQP4=
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id 5a478bee46e88-369e8336389mr13936464eec.2.1793089458652;
        Tue, 27 Oct 2026 01:24:18 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm12404412eec.6.2026.10.27.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:24:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] tty: discard flip-buffer input for TCSAFLUSH
Date: Tue, 27 Oct 2026 08:22:36 +0000
Message-ID: <20261027082236.56724-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_termios() handles TERMIOS_FLUSH by clearing only the line discipline's
input buffer. Data already committed to the tty flip buffers can be
delivered after that flush, leaving old input readable after a successful
tcsetattr(TCSAFLUSH).

This can be reproduced with a noncanonical PTY: complete an 8192-byte
master write, wait until the slave reports 4095 unread bytes, and apply
TCSAFLUSH. The remaining 4097 bytes are still readable afterwards. Small
amounts of pending input can also survive if they have not reached the
line discipline yet.

Use tty_buffer_flush() with the referenced line discipline to discard both
receive queues under the existing buffer lock. If the line discipline has
a flush_buffer callback, also unthrottle the tty after releasing that lock,
as TCIFLUSH does. Otherwise a paused input source or sleeping PTY writer
can remain stopped after the queues are emptied.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Unthrottle after flushing when the line discipline has a flush_buffer
  callback, matching TCIFLUSH and addressing Sashiko's review.
- Add local blocked-writer and serial-type N_TTY flow-control validation;
  rerun the original functional and sudo/PAM tests. Test harnesses are
  kept outside this patch.

 drivers/tty/tty_ioctl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/tty_ioctl.c b/drivers/tty/tty_ioctl.c
index 90c70d8d14e3..be764f04bf3a 100644
--- a/drivers/tty/tty_ioctl.c
+++ b/drivers/tty/tty_ioctl.c
@@ -496,8 +496,11 @@ static int set_termios(struct tty_struct *tty, void __user *arg, int opt)
 
 		ld = tty_ldisc_ref(tty);
 		if (ld != NULL) {
-			if ((opt & TERMIOS_FLUSH) && ld->ops->flush_buffer)
-				ld->ops->flush_buffer(tty);
+			if (opt & TERMIOS_FLUSH) {
+				tty_buffer_flush(tty, ld);
+				if (ld->ops->flush_buffer)
+					tty_unthrottle(tty);
+			}
 			tty_ldisc_deref(ld);
 		}
 
-- 
2.43.0

