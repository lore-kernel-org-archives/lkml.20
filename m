Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429306;
	b=1v5zgYhRjM5sBhIciAMuslUeiu+N34Y/FqwQyReF9W951ini/qEXf/1Vz5P3MRcYoJqc
	 V7TKYMDLBc7k1/UIP9PYc6QOWZnoREFzlm8Gu/bcd+a9w3Cw7L6dPVznwXtOUfREmFo3f
	 2J/MLnOQtp22/W0UD1wfUcjtSTP7fGNFn57R8PS0RuaxxZpxywdBqaxcpEYFaKAcVrv7b
	 mJ7gDgbF3eYStkkFPvJiuyzcHZYsxsFxZVwp3GDTj4RcM0oE5ENcG/O4hkuU07tohgu7/
	 Jp4rF048jSC2kZ+XqEIhvG7CmXnZS7Bu/CdYbgAYp+lEfcUxQ0GEiPKapnIUn9Y5pcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
	b=yIFQNstENxy/7AOEXRWX5b2UwtEsHyURlYGgZVPT1jIUKJNOZ6syESyHZkNEdnD/kUvE
	 WTwTHn48pGORyZLZ11Pe07JR3Y1UKgFTGQ0bF0Awb05ZdvIezxvHC22R9LVQrWkPQghNI
	 FJTRhlqHonUdfOpeHrI2Lpj16oQuSTKhpY6OMH+Wrn7LhEnhBRhSV1QJ574Usali9BtK8
	 UUNCBsi8V+ZrzNI+JpgTDybj96s0uuMUbzAb9fVrqIeMBwQ3W/rT+yPZyIUOpKJocSacg
	 Z/l8yiIBRRi2/AwPE2oHXgsUvmAyw6klngYrnQuHrYbT4X3TMgkDAj2R3EdgRRyRPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WfijDO5W;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D6606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440D6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WfijDO5W
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16437515e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429305; x=1793034105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
        b=WfijDO5WDRjz8fW4mOT7Q6HqJMhB8mcZf/TCxmnXkNphcXc+74I8A5TUUUYkT3X24H
         8j2JeQv8+SkQG4RhGp/NUkTNBq9gM58rgJGEaqpA9Or2ezRzcLDgKctF+zmPXicF4kIQ
         nenLDRItutgqj16MY5OI5w2z9SrzQkk1zZdE3/KdZcZ1fUq6n9y1FQk0n+qeCFqOhAzQ
         3f0r7idK3GNGfpU2byZIneS+eL7V6P26yApOH3GprWTdu/7TsMI1QD7Tozfvoy4c91VO
         Idn1uqtzvq9AzhoRoTng/6yaJ7IpjEN5I8p6p/Qx+zkd4ezXTwn8dxqG8yzYUbZkuqCJ
         BsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429305; x=1793034105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
        b=qftHIWvnC3XKi0hFLGgfzPGglqOwhgjV3wJG2mkOWYGSgFqrAGSrciZbcHtfPxCO4P
         7a4wygWV2DUvsLNvrQAVvn7D+skEHQxorCCuprSO9YdkdHp+p/duYipKl79xQy814jmp
         2sUutpOxIcXi84dVjPzmhHH5QGmiT8qDPlqMvYavKnTlpKfKk9RiemqdosmYYgecXBhG
         e590j282glRxiWFSCbjwaJlmpLYtpDa26AuU0B+ZDDfVqoqkPvsZAbusXscOPLutwTa4
         X5G86VSOL25KEqlqoaTKbaMwU2kN0YJJNN+aOcSmAcm1vgvko3PntYVKU233xP58/6AT
         CNpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI74xN2cYY4D4n+KzVfb0t4rz+K6R3zopmzg+I6qOAYeAoEQHf84iywjbwZQ01Y3Ik0nV0kkGIfWInOKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8y7GnjNRo9fWm/NunDLo3Ry11oh1H9SaWNMRX1daWjOpuMAja
	B71k01W5kBEJRPRm+cOFeeSg2RwuJxhvFtLOJ5KxlaLULKcmlwmKPRq4
X-Gm-Gg: AYBFou1Xf///S7c2Iq/mcoqUNXuuJGc9Xna9YbSGnAKgqnz0ZE6NWN/eAZvMCnr7qmw
	HeEFLF5bKUhdDE4YF5CATfr3toAFe1nc3ArMNKMh4JbIHjE7Kq7YMcx7r8T+51e4ha5VeATUIHB
	U1VCJcpCHE1ToFbOOZBY9PBeBOAUgxw08ma+7mr3ytfV7zfZ57CW965oKjCss1uZjHNlMDiA2+J
	ctHfwAmMcJpVUEltIGlZRbeAnhoiSzUjoFT8VaABPyW+5KgbrvZ6BuHxdRseopZuwiishN9wBTR
	j/mtu3c/HmFZYIYMRgE+yH8xp2K3MhMOAIcECK5DzLWppXYQ3jxRDeMw+Sbxr/6R6wozimKUliE
	hoIlZuIPmcl1B+gaBK3sJ8JQQ3yXMAd5srHQKOCfGfgsVAsuCafeQ3x04xaG+BssTvQCJ0oUuwm
	4hEWJLylo8gCj9FdcqhodMh5LcTQt7NadOpwPZV/Dds4lfgbvtA4+tXQDGVYu4hmn1aWJpFR1Mz
	aIIT83XCvU15ZMZagMw6sL1MPeSvaOZmviKIRiaV0FFxZeTJCdZUjHz7Lcmf7t1EzA=
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr79415365e9.10.1792429304466;
        Mon, 19 Oct 2026 10:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:43 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Au Dang <au.dang.jx@renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] serial: sh-sci: Drop TE disable at end of transmission on SCI
Date: Mon, 19 Oct 2026 18:01:09 +0100
Message-ID: <20261019170139.473808-2-biju.das.jz@bp.renesas.com>
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Commit f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on
SCI") made sci_transmit_chars() clear SCSCR.TE and return early on
PORT_SCI once the transmit FIFO is empty.

The hardware manual does not describe disabling the transmitter to end
a transmission, so this special case has no basis in the documented
programming sequence. Remove it and let SCI follow the same path as the
other port types. A plain revert no longer applies because the driver
now uses a kfifo, so the code is removed by hand.

Fixes: f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index bd58bbfa65aa..9eb297dbc901 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1036,13 +1036,6 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = port->x_char;
 			port->x_char = 0;
 		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
-			if (s->type == PORT_SCI &&
-			    kfifo_is_empty(&tport->xmit_fifo)) {
-				ctrl = sci_serial_in(port, SCSCR);
-				ctrl &= ~SCSCR_TE;
-				sci_serial_out(port, SCSCR, ctrl);
-				return;
-			}
 			break;
 		}
 
-- 
2.43.0

