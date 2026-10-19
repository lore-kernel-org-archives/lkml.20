Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429311;
	b=jaOZMuCwAlnwpChtIRxo4V26nVuaGk23n4X0Q5wAFi2SX5sOShMYgANqBWeRZe0M4kVr
	 1Jnv+lZlNlwqSbolAQwefOG2TMQWVlOB82cl4TcwvXXzfYG7yAQBWQXM7M1/nH3ZfB00B
	 /zK/C8Xp0jrjyzv1jCUqw2YnRgzTjgpg26YrYDSK7Ip/+74gG3BMcsucpgocF2dFKroLU
	 pgLpXUYWGWficGFCK59J7LDJuw0hUKb7RWVY76JYoBl1I6BUAZJ/GLem0sIibQtAQ80LZ
	 rqdKhJBqXw7yVNALe2tcMO+Wt3CXp/ph2wiZga3YnyeLvaXYXOHLVJ7RUbhXI3A/ehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
	b=YCIfyi+jPpLaU3xIYZgE2XH+bHIoeVxvypceHCdQdkBzfHZamkIACZ2+U4IIIcQhipTL
	 1Dw8kNkFG0Z0SKD3soQTYExtbAQsKbXOjH8FRWDqelLel1S0fBC8ISYJlqJWZnhgZ8LH2
	 KSbQ6HGDGRYddENnMiBYaghxdXMJn9m/ysN6YkbkkFB80naiXkvLJZv6qb0r1zaioVjAX
	 fIcNXlPrEtvFoO1XIHEzUdb+gZWRpC7ZcqbyQnWgY7N+5olOOx0vuDVsG4TOBqdtDtI9Y
	 jGNz4OjKBI2m1tNZtO2NxMT896lmjW/40PseXSNwyzzDuX31DCneANRtyEkQn/RLAGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k5Z0Uetx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302660A2629
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F302660A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k5Z0Uetx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so16790785e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429309; x=1793034109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
        b=k5Z0UetxOSMvmrz0ml/rNZCpNQov0H41drmFbH8PiVo4AiF3pNApCTHIgs1K2rw7/i
         cFUgJUd5f/37Izl0lsRHI4a7lSyK/aw9Bm7o/zqp1wsjCnFy4GEhRCvgUjjQexHoHpSM
         1a0wv11cqK770dSRClE9PyuD0BoQ9wPyApGcvJriUOqqVH3FT9Wd51RXn3Zqvd2BG935
         1E20nTAT36wvaCsgSfL/Phsgz9dgXaDIjxaCXKC4OMHVcofRNSfQsAyChZIolcA80eYX
         ALi8Qv9PmC6fetmBiq+eIGxovyLGtzcSrWWTurQoEe1b+4bqUn+IzTtvBP5lZrAtwR4A
         allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429309; x=1793034109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
        b=r8m0+VGk6+5fg1CDeV6fy+3liJO60cW2TOgNEwzjra4LBEmRsblsyhclXJiK3JRk7U
         B34pNiDtXsVRzoIJi0pPwtDAQxYlEge8lcb7usOZ1u7Vu+hmpfRAK25fa0VZZlIA7O+1
         B3ZY55yoIccuamchy4RnRIleRBe5OBCSxjnOlfYLEBiCm4jn2ZwaC+voaBwb/iwDf2k6
         C37O7N5KYKixT9omCD7+W1Rls0liEl9lqvT1YIP/eMhYCTqvV00gJX9OyCjrg2cMP2Op
         mAVMhup3QGukPS2JpOTXFUlhloIeL6jg76IzXCtU8Gs2UMWqKBBUrZDufPhE21JtMTJI
         zNEA==
X-Forwarded-Encrypted: i=1; AKwUvBzTasoA5Royqq/1rSYbPeyUcADD+wO9i/WXsoaw0bIXtxMI/zz1VPyolLrL76l9MCRgpXPjmop2UkLATyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfV0CKi4U9V1yOfK3KG5UQD0av+iXf7vWhqvUzTA9kynBHhUMk
	d/I+6/+9jG87FxrRF63K5fWzUqCicTUAT5TrgFw6jtyRlMUcTNyeV1M6
X-Gm-Gg: AYBFou2sMNCWMF5s7beUSvEwrkad8oAjO6oiP9x71VCxXVV18wuZAhPZe+J1kTn459Q
	B1iWTWc/oFV1teyzN/jR4SDd/hV7NTGvLr0BzDq/uBwtLs+gW1VTQq9fx0tgWo9KbWck/dnn106
	6Sv99tPn25g/35RXsjK24wuxux1ftWw+q3LE0dytHSkPUmCC4D94YVYrb+tOiit9WHeDjaXY6ZT
	oH/Q1VjA3e4HhQRC6MwlaTGTpSOd1dwPsG/BvaqKpIvIAZ+I9SEuNsQxpD1xaS6JzEA1tGOyFB8
	GkmWPHulIHHjz/UZWQSuaxMZYMDnQhiMZKc+rIguVLI/x8wsQ9yvEZI3y36Uxqr/2Zjyac7A0+W
	5+CXkVvYsMYGDHIe0mcio/Cd97GVKe37NEZFdoEhNf0m05AE08EB/5EKeiDzNUpApznJpL5jnZG
	wbQQHwqM9ZIFIA4rjh6q5KSyXlNYiR8I5lr+yrS3YIXgDttb+ljRsGlQXyeYw22LRt4HIFqA0xI
	+v+Wrg6gSX5Lo518aukquNyjEjnUBEWctt2msAQehNGBTsZwrOoOqTW
X-Received: by 2002:a05:600c:1395:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1d76148e6mr175520865e9.33.1792429309188;
        Mon, 19 Oct 2026 10:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Au Dang <au.dang.jx@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] serial: sh-sci: Skip TDxE status clear for PORT_SCI
Date: Mon, 19 Oct 2026 18:01:11 +0100
Message-ID: <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
References: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
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

From: Au Dang <au.dang.jx@renesas.com>

On PORT_SCI, the TDxE (Transmit Data Empty) flag in SCxSR is cleared
automatically by hardware when data is written to TDR. Clearing it
again from software via clear_SCxSR() generates a spurious TXI
interrupt, which causes the last character to be transmitted twice.

Skip the clear_SCxSR() call for PORT_SCI in sci_transmit_chars() and
sci_poll_put_char(), as the hardware already handles it after each TDR
write.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d577f9de6259..e4c7a3e14688 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	if (s->type != PORT_SCI)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (s->type != PORT_SCI)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
-- 
2.43.0

