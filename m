Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429313;
	b=l7bZzliOkzPxCcrwKp58eYfeTQmF6LLskbFYey/+uUDT+ZPK2+UlHdikYz3nn3zD/pqX
	 pXbWSTaiwWG7px7azuxdUHaGtchomN3R8EkPNyIcSraiT+khUQ/Gbhvrh+6yjD9cveAt3
	 mzZx6JAx/Ihig6TJIv7tyz9LuHzK6yvFGV/zyhnQpoIexz4QUbo+ID+MxBJENOuBDdVmI
	 Delfmog+qr5571540fO7+K0x3fNt4GUAkkbV5Q16ari5/8LAR4ftKZ8C02GrmiYmTOdtX
	 E3AxJkr3OHLKg8MUYX87jHG3Sjn/29pCIOB6FR3K0M8HENUOef6sznEn/L25m7UNWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
	b=P0jWmwLgUyHXLpCqIwqQJL+3Uz7HqlN5iceag0ifpLNhMNm8jPqfYb4gmsht/7bxkXRO
	 WS8dNa+bzo+W/oSLLc1Y3wTzbwBrmF2/IoOj35VD495ebWrr5owSSzg+rjtTTdR9fw9uE
	 gSxVH9UIehMwmN5xm3N8JPcu4xYpOcjWLEKlpK4J+1022/PU21NkF8bwho/h8DFzmzgYF
	 ZyjNcOcfR1aHsZj+/jhMNZ1ABMgP2gHud8Ii0pQLlWSvlKqjsReBO0Z1DeLCXijMBf3aI
	 7EBsLtcowFOUKGg79c4M6s192EhQIuM8SMQy+irgkx4o+22qD5na/7aWruZ117Fj6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFrQv4LF;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D760A380F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7D760A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFrQv4LF
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2acc1e170cso335106666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429311; x=1793034111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
        b=KFrQv4LFhCSJZrq85gLcTa5OLz5IhMYFH7n74va3Rub1pAVLCh2NDTvWoZ3HTe1ywZ
         hD0ES5nXX4OHJCaUbIhw0jYHDR85MJGN4AVN+9HLg9a/sriV5PNYXszZ5SJYSmC+PmzT
         xftPemQoB3H457tzQFnvjPorXiVO+tl9e7b0DZjtHM9D9sG1YkjHFvP4LWMASoayXEz6
         lbKe2va38HTnQVfhVsxWBbh5hN+Z9Q64AxDmtQ/6XYQOzXF/N5qJTB3HIymCZBpip6ti
         ebAcnVaMR7rbsAmWzZ2qOZgzBC9JjsS+VP7NbUxzt8Az1NgAnE8319cmbLeoz5CQZQ1s
         zOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429311; x=1793034111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
        b=X6LQVc/r/wtpDIhir16osXf4kdSbG3MO3+UKyMWMfJtVT3GbI4KwjOoNK9GUQhyibr
         2MOR9mxxY3/BI/aATByOYgC9UH770tRP7v/ZYAcGnGngRf9EDbp8STWjEMFwmjaKtXdK
         /fcvH4HqKlGkPTvKOSxL3raQKRQ/LYciPzGlPkAfxsCdNT5T7A943nOkiFw4RfjyULXU
         9VxiPqAz0mDyvSIZQbPVD8bVdK/+w/IF+AWugduiEWK01NlJZmgq8udcQaB0/DXHKtOK
         1WM1kj5g0h7TwTrDpKfHgsxYMSunke7ioO7GMYWrBcTo7EGxx/Tv+rJ1p7NjE1cig1F0
         XrAw==
X-Forwarded-Encrypted: i=1; AKwUvBxi9TamuhpBuLLOn5hGNUYoVXdIaSXR74eVpeVbqPg4OixIdyyKhbu/zQY2ymWNNZznTqL0jairBvHuHUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Tz3wxwSjM0cR1XXH7gI9MGUGBHWKm2seRxw/91xB3V+pyj+M
	j8ATn84jTbESKQXOMBBFsf1BCh5kqMQZBtFMGPkq4UK4JABZ5rsmJtjHdaYUtQ==
X-Gm-Gg: AYBFou2O6JN9f5htbCy6E8UKqoWp25g0/Rolpxu/THA+zKN3iOSDsGeh3TZ3h8U+UQD
	oHyjM09q9eZdDLO0Obx1p/ByWHy0L2cerWUZIWppdVVpFPTp3+NxWkuykmRtZXmBd6MlQTqcRm0
	smfzPTI0idO5D0jU3MbGjeDmR3EuwFnv7Q7SzFL3YARDPxUcxlQDqE0UET5u4G8ydViHYmxzHHp
	x1XD+6Mf8jNJi9XSEa37isHLyGvH/cekoUlFPoS9plpLLLorW+0lKjy7nreFG2cENh+5Mn4HE/c
	mnPnBqqB41HY6YVRo2dNzoobomOSUUGtJVoCI7I9JB2rQxVi854rcvxgey4DTahC5sSu1N5bz2w
	2qVlgjLZRVsvsESFIz/I3Kq362dTa+v4Zmon6YmBJM/uprNKU6KnmOz4k7L15W5GSDdvzLRfidr
	7Z6tWF868GnCM7lQv0jrquEPDCBlZwSuMFC2JmMXDhTKeWSGykCGWdTCa0tdX/XxDVe8GEFz5KP
	05UahCqHlxGQfU3eTrZgPj6lSC3anmORwD9werGQh729rEsAu68Mx5u
X-Received: by 2002:a17:907:97c8:b0:c25:4f7c:8ec5 with SMTP id a640c23a62f3a-c419e33b08amr627243766b.23.1792429311212;
        Mon, 19 Oct 2026 10:01:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:49 -0700 (PDT)
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
Subject: [PATCH 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI
Date: Mon, 19 Oct 2026 18:01:12 +0100
Message-ID: <20261019170139.473808-5-biju.das.jz@bp.renesas.com>
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

When SCI0 (PORT_SCI) is the system console on RZ/G2UL, the board can
hang at the serial console output stage during boot.

ftrace shows the following sequence:

1. sci_transmit_chars() is draining the TX kfifo through TXI
   interrupts with SCSCR=0xf0 (TE=1, TIE=1, RE=1, RIE=1).

2. serial_console_write() runs in the middle of that drain. It saves
   SCSCR=0xf0, switches to polling by writing SCSCR=0x30 (TE=1, TIE=0)
   and outputs the characters with sci_poll_put_char().

3. It then restores SCSCR=0xf0 in a single write. TE is 1 both before
   and after, so there is no TE transition.

4. sci_start_tx() is then called repeatedly with SCSCR unchanged, but
   no TXI is ever raised again, so the drain never resumes and the
   console hangs.

The RZ/G2UL User's Manual (section 23.3.6, "SCI Initialization") notes
that changing SCR.TE from 1 to 0 or from 0 to 1 while SCR.TIE is 1
generates a TXI interrupt request. Without a TE transition, the TXI
that would restart the drain is never generated.

For PORT_SCI, restore SCSCR in two steps: first with TE cleared, then
with the full saved value. This forces the TE 1->0->1 transition while
TIE is being re-enabled, so TXI fires and the interrupted drain
resumes.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e4c7a3e14688..94a34dccfe56 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3445,10 +3445,14 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	if (sci_port->ops->finish_console_write)
+	if (sci_port->ops->finish_console_write) {
 		sci_port->ops->finish_console_write(port, ctrl);
-	else
+	} else {
+		if (to_sci_port(port)->type == PORT_SCI)
+			sci_port->ops->write_reg(port, regs->control, ctrl & ~SCSCR_TE);
+
 		sci_port->ops->write_reg(port, regs->control, ctrl);
+	}
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.43.0

