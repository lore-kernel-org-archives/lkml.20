Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588403;
	b=LelO1dcUsk30q+nI9BNSonF+iRp+JE+faTYLzpnVn9F66y28hZNEIic8ZUA7ZAcItOGT
	 dHlAyDUm8XJJAZXmQJ/vx1yYPu57pCDsbKpXSLQSlhdH8xzIUsPYONKDrPVduQ4+wlRou
	 7I1z/GwI9/jPfDwrDBpqTux686K6UsekYTA/s+qxZm9lZN8JrWMebVB8PsKegU8KzLPdV
	 mq1D9NMtyDTHwSgoju8PqMH3LY09glMV4/f6OGQAiKUiIKyOLAe1IEe68jjSuUrJ7sTR0
	 SFRuMk0m/ja16GnRLa1AwlosfsJ7hvoTR1x4PnGTrfszsCvjhrQagQF5gsIlWaWJHmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
	b=4UluX3Awp5Qs9AstlRyNJpQk8yDWkTdoJXMXG05xGGcNy6KZQooWYy8CmIVZRi81nVeY
	 4G7rJnNJ4iIUXJai7oORnMIB8P+p1kR55XAmKbUxscHLJfYq6TJeZSQo+q8c/u6i1hYJw
	 3M5HLn2+k3xvhpHMLk+IJFOif97tlRTBhTX+ohSwzm1QohZqUTQTQcGJqDe7YLnN9isgh
	 UAirW2t0BUGqFfLToI8sfGA+y2o4T7MvjBzdPtgY3asCbTI81WStsJHA+8csuSpKNFBzV
	 0fLb8GioVkiDXeagbxaj80AZiKURBn5QpnXmze/dtIz2jz1AhI20SKKb7tE/9w36S/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dftScbiC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9460A263E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B9460A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dftScbiC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1f68a9855so4459975e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588401; x=1793193201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
        b=dftScbiCP6a1eeHD6IgOv+dKCjqK1dz6x1afgj7VzlVqPUjsONvI6Q3epm+bf8uCm9
         DCSI1YdG54tNCbuIrxPP+BCLMm30oJ1Pxk20zK1EvYVfmoviRWhbxk842sdHQa23ogYK
         iM9UlyPPdCNuwdG8zQSw9vZnW0REm3+X0N5OS8G4r1Dt8UULxCpiEsSHbo+1nzL32Sev
         wtqp1xXvO68YaKo8vgYEFw5FEXt+CfU6k3fgF1DH6pPr1fsF8CdS7Jrt4pgOtue+R2ho
         YEsG/OP7Hknq6sDgOQ79L6++ZMXPv2kX+Wl2fFmJcxFpJETI1KvtI7LJBXzy4bXVPaSM
         HwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588401; x=1793193201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
        b=o83h6AauTPAblJ+aEya8q/0BYybTGxSRakUkWyWCKPc+ixRkQQfyBDN5VLuo1Mfp61
         Q3kGpFvfb5aNxijubWK0eDCxIdA0D6oTCKWx0uTLkbV0gwG9aH6c8PNRaG6PcQYzaceK
         rqSSfut5bL4wyMwdfoaCaMWj/IhHekxFF8L9ney4bH5jNcjnaIClXnqg9T6/VKwHGILa
         6gtcj80iTYkfExEjccD2ECvWqqGq+yO+f78rNjj5IR4otnix/ireLyNAPEuOzeIAmVJD
         BBYi5gVG/zO5I/Ma6cZCKQkQsWI+DTFwHSZ0UGvCCPve9HICzF2CBC5SuU7Gmv4co0Np
         maDQ==
X-Gm-Message-State: AFq9FYKG+I5+hFt8ARrqPvxZJZ/j81CJzGCLiwTX6ZTgA/KO3u1bXTcr
	PB3tzejZo1OehWu2zly8WJQCO0xPWnTvu63g7zJ5nflql8+cJo77n8pq
X-Gm-Gg: AYBFou2rSzkZUuMJx34AfAvJfORsuemG3DhLcSrjhpoNApiVj0kO2m/3Ga9nfGTNndH
	PWkhFteBeAXbLURh96EOHfSzeVY6uhtAtdsD+HsxkfAOBJZ74s+WP666oqGcA+KL4iD88DsHjG6
	7416BNvJkp0tK+d9jrNNbpBwkwJed0cWuJdTKTh8eA8p6Q/+JGN7cL0bBCuM4WWrLB5lA7sRiQe
	+8bRq24cSFzm+A7sUlBZOgNG4J52C/z5eT7QcZTaAwmjo/tNlzZ8xsRqW6ziwSen0ioJw7CGk7N
	NiCk/a6W5pq8g4SFoteyx7fNvIrUKyYXGrCCdzGPTy1EBofhPsByMSrrdNs1UzA5EIKpZZl5d+0
	OqcIhRSYAtFwrDsE6SNwO+Yn/xwHQ5HWmhTNiVkxOFWfTROpPton7+JqZNYu45mBrVmuRgc4oze
	e3hTwsfRMooTSv5skYXwBd+GRn3Hf3o3vYivypMgHmO12P3IqnCccFiiveSZhImyO6o7SDgQFl2
	8R2EjSmuDxxbIBPS3/U1tHRRaCrG1pUV3DdCP+EU76HHMHBlMrS63fzONfmWvmzyhTHQkR/s597
	9d52ZdppPQ3XTv78
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr43127735e9.21.1792588401415;
        Wed, 21 Oct 2026 06:13:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:16 +0100
Subject: [PATCH v2 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in
 console write on SCI
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-g2ul_sci-v2-4-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=2226;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=eBrM0bnW7fIX8UCFI1hlYQ/wtkJYAm4pg8SckFVkEUs=;
 b=exl2dPJM3XU3wI5tFcxqpq6psM/OOHvMBfuNGCmAkHHVsJCMgohqkx0TMdcopVTGQWyvYfu0t
 KyfEFkkCt8LDahY+xr6F+zNevV3lVMvOV6VbljzJgEP0kTpOCw/fEYj
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index aa179c787487..993f330e6881 100644
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

