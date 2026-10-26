Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013819;
	b=CV9a+/RESeNT7D8tnsV5ZVQR8bVhPTVJ1emEHlpZevcHzyVLAvgsBRBTBO68n3zBoYa2
	 5zByNIl6+zgEffxlB25BxxhNQ/z3Pag5xu2l3+vkN7VwBfhFEdeKc+1f4r2FRMc7e2xNT
	 VP3v5JyJFltGQkf8tgmHbw3/0JRSwkiyzm0YAk2cb+sWIRAypgaszRNBC+fihNH3SQg5D
	 CwmSecBaHPu1t2I9xqeGRU/Sec0iV7pn6Y/3d3zLgO5FKtoPDWKtWjVwclESd7Rpa1Dw1
	 UHPrRPYzRnmsfzPPfFdwVfOymXaPefvS/mL4X/WG+u846b1YOXzMPc4B8BF4Xz9zpoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
	b=ScQwoL2QSjOPC4xgewU4IfJAMvADMT5kCu24UkkO9P8csb07S7F6NzeGqF8Cvh6IA67C
	 buxlfdc03i7EYuca1u/Fv2Do8Vrs8PjO2H745aA4PcpI1RTdeNAyT3qAyjrxn0D/kDGNS
	 tSVWcBAO28Rcq+/0TM2gsG0OxYr+M78CWnrF3UntoW004Uttoq3jSkm72cG+RWx1N8hz4
	 DgRp6BSH4b5UTmnhjrqYXncjNSHoxA072kBvBJOwspjumIMngo7tz1VGmUpJTWH1OoND1
	 6WT6nYxZvjlAmPgj9aZAISyAiCbbJryz1CJ7bI3dnIHTZjjEnBwSembpbKHw7ZMt3vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ggtyAlK5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749BC606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ggtyAlK5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so20123335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013818; x=1793618618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=ggtyAlK5d+ZGKZ2b0k2afzMY/YeLK5gUpsHdBkcfs2+quVkigOVOMhTvVD3MfyY+VJ
         RhWb0GBZLYPua1DoXaoxKgGc2mSi31SO0cai/wzdMHK8Sk+AsYOAjQAbAJrFBHgNXPct
         +WSBhk5OEc2o/k2cdeUYmIxwWVx5yRyuZCb/iUXXPTvltGSiXphRVfmRpREcKSBpVOyL
         t9XKQYzKdTjGhCLZVMd/m2wOxMmIcHHe0pPn5GKumaBo3q+rCRc5KFV7C7lSMFMkftcq
         iKNFgnH40VRzdUTnx8O80viDLN0VAhj568VfjBtf52NiBLYkdXyrDfOAtB9vtFKgcfDA
         PJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013818; x=1793618618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=uylPOZOM4Dp9Lal7hJAaURRpFfzsm3JnXImnLkxndEHxPKs/RPUwj8XdUPloSR65Tn
         o+O9G/k2xRgsz8+QDnf3lYp+7fUpO7bAg88Mvud/BY16CbOD3xNml/NZ7KANcU2v4V55
         AwHG/cMRYm7qzOSMiTQuOqK9oKQu/N9EVi1xC6FpiUwiSWScM7m/umy/qrTrjq/ywD6P
         ONXDkukgejiTvzuS0oW8HxcUP/gQ1pIF9eCM+80olvUPXwsAfNx9+lDl6Ernsf/tYNUM
         8zxWqWbI51c8h530Hg9zerk1DCpIXxZCMTftGjEQy3gyg/C5t9rXBV6fyQF6FLRwpzRq
         U/uQ==
X-Gm-Message-State: AFq9FYJ2jSxuc/tZeM0LptKl3pcEcVv1VSkvRN0YSEV2+rszn4qE9I+l
	O/uR+Lbu9bKu/18XtVfQw/BuHYXx0S4IJdpzCfQw/OoIxj9S1ykrLAZC
X-Gm-Gg: AYBFou37E69um3+zXEpONSgqS8wxBTwcWwW5gycUkFPau8/o0gczUOn7sqozjaXRf8i
	1iJmYXdY7F5htnhHLsBGN5H5LD2WghWcC9kXGlFTz997rjLvCjuPBwj/vkYDFb6y/M+9Nu8kpVn
	lsDxmmZi1oy7OAYsY8G3IEnAVKPNKRTmkEioWM5s7AMVlKMykLWHaATHgcAMcgeDm0g0GaK0Clc
	KXWtqg9DDo5KrCx6xSmnyFV20NvLwzVMkVvOIXlGigJbi+4zEyhYsmXcAUEEQ41UZ52PWB4XfOj
	QmaGNX5HaePagbfD8OIKrlj87rn57I7fumBSrLAWnibkAtMMOI/iIuJnABXhJphVrL0DM9yWKwc
	7ZECoRXCM4pcDneJq/CexgvSuQX4gpYxwafuHOMxMgPbCJMLDnh9ePd+t6zJWo5FmPHTLxUp8mQ
	upy0arcft+/jEdT/MkmyZb66fSXX956VlYNZI/h2swHEGzsQSQpvKU5DUf+CjxNux19fU/JgyIl
	U3+ooVgvyiCKX5WQVS+sZAat1DEzg86FIvOwMqlbabbGbpvyKKRZeSD56rJFiZj2XTEQLZwFC6F
	7qOYqz/jq/Fl/cLPegw=
X-Received: by 2002:a05:600c:80ca:b0:4a2:5ef:1400 with SMTP id 5b1f17b1804b1-4a35ac9a7a3mr79652025e9.12.1793013817664;
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:33 +0000
Subject: [PATCH v3 1/4] serial: sh-sci: Drop TE disable at end of
 transmission on SCI
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
Message-Id: <20261026-g2ul_sci-v3-1-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=1401;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Ii4p8OHUuRr+409dJC7XNZ8wHyl0UhxZWbqcu7AjCfM=;
 b=QPOwAoyUkoWS9Bqp2w2X70DfqejfizPDZXdsQkJEafZxIQD29eClU0HtB39i56Y/RJtVqGMco
 7idJP3hdNJxB+CdRDa70bI2O2JYk8pvtPqPW2OopCkZ4Ge+olw0piyX
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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
v2->v3:
 * No change.
v1->v2:
 * No change.
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

