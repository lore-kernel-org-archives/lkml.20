Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588399;
	b=hWWmdTbnAsJ8ZaCjTlaSfdxvuddl8vg+lITXx9DcL3GnYOdwFyPNQA2wZFx9rhTc5jm+
	 ChElmdiMcfpihAQ40CfF1BuyBQjAr6nPs0qreUkUhDBXErIIo9tu8XnQWl46WXI52aXAO
	 qFhP0hMLV4o3FjKaTPA4HzB2Y8wJ7tGu3zZ6Ec2t/EJrvmOSZ0Q6anxzpi0kYSwAbmjB6
	 BZOnFJRHG6ex4E3W/KEIrKO/B9ITDten15HTYgpbk35+UVxy4lsUUQF0owsrRX76SVbmP
	 tpwzIZkDWlL+B3RvMIPuY6tX7p0uUlfH+hYYEQ8Iek152sp0rYy/31SoUOAXWRWTPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
	b=uK6RB9PuKQPXDB1WViFgbliN3H8IgdU72RfdYBXaexKXDDxrYYRgG3ZrQ12uolrdM6lR
	 Hn+HpSFcNg3OpfIzNe+dt55moK1RnfXjmIl6u1aHPMmirQa5DIIJrxPNwX1aL5KFKB3SF
	 fLGtZI+ij0CNCFALKP7Yxwm4HNxGVUEGMmIlKonUSX0I21yI6ral96YmS/bSRp96mPzcm
	 Imlcv5YEu8mHszpgenJuSjhMyqPb4I94FWLdBjc7Oc2nlk0sGXuu+bd63fFuL45h5SUL6
	 5Ugb4eV3qWSSCiOXDL2Be2Dl5Xp1gqgYwpfdwQbKmG+TAaAq1kPmcqOWKYZonOgXQGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCEmyVSw;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F7606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCEmyVSw
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48bbb06e746so408553f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588398; x=1793193198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=FCEmyVSwyMIhgeTMCMdf9r23TjhNj0veKXSrM/ESw4hf4Bz7ZIqD1y8TaEBp44tsoP
         yRgWBIUPNTqNe8io8dF2Vv/JsYPX+h8UkBnn/pt7yV5z743+FGCRp89YZrZvfUoE9TZh
         8PlaYsq2kAvy9foYDpeD5OHutjRLZbCax4NToL+sI0DJYrmhPV2TvrHMoBvAHmn6DfnR
         9jWSOLCzWyT4SP8kWpzb/+q/rj7xtIf5tuJ8/VmA+MN9kvyJG09eQztgLD8TOihfKOM4
         qH3gqr0qt3XyfFJ4XJPa8aVIgpPxKl8eSlcvlUTGPSJE4GG3gZtaJfZoCo23ocXN+Ktp
         7KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588398; x=1793193198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=ecisuweILWgopDpXhKPeuhSgEia62NV4NXCSlK1XJ0xhx1JOlM8LkAxnmK8ERQ+tjI
         eYoqb87LLQ4dLZfrCR8z9RIVwI4t8hZXM4tq+Fk1XDORoYdp38vXXL84zQ+ecp21G/28
         O0uQrYi4MuQjaJymVxe1GywofC558fkQvv4ddhshNSansSw5pfurmF90ND4LN1o26L88
         7E7ttXcmmXZdcSXteKtA2WyFJ1rOT7/Q+xqfCTJHFc17d8oeu3HuqbqD0mAtd3m9vYh1
         LqKJUpmh/nbTyHylnpw/w6jxl6/dOQE22sT0nANzTB9S0Bzy0MThbBkfltwQ1O2cMMix
         O1Ow==
X-Gm-Message-State: AFq9FYLqbt1ts0RHiIQDW16Z0WErtauxBw8XSgt0YPmXcGAFvvqAljk+
	9cAyE2zfIbLJk+1Q9AOMhABagvZpICtRAydUeDA9VJsYUxs0AV3kDdQZ
X-Gm-Gg: AYBFou3hUtzHSOpIWNd1LGMoHtgmJMwmlp9bZz4tQhh70lhZXbmmFykA1kRpal7GXkk
	grO/ke3rtQ+2u1NKeGmr50Uw0Pb2DlOfz8ZMF2U7vSDgWKY5VfLu3pHh1TZiA8WpLSNYyfvbYt5
	wOULuN+003T4zSUlnzhGjJvFtNTuu3Cjw7dFwpwEfLvSe8PfOIvYP/BMWRsbPzOy9jeUFt0USHC
	WDVVqmHJBEdcpzBRTo3zjhsu/1JNgfDlfvgHvkCf24+iYF/8kQxPVtvdO1gGrHjunAc7zKh2twt
	VCwq9PizLELF15OhtqPEJFg18FcRdcKSjrAr8z4t9/OUi8Asa1g6hypd6oqIQcJ5ngTmKgaRGZv
	IHk6/fW7ypY3Q3rTZm3mIukGvdxw3qaNOwYlbToIQEsFXiytxjSloCm2kP3zJIjdSF6uc3WH1kL
	ZFAe0NSFysXFKtOYjS8edbJtgB2UI8H/kpPejWUcpLptV16cbwPQrvBvrMve9NkifRFNbP2h0P6
	jXM7+SkhT0QRP2F021ZKXFFfvgTJYIwztvnqMAu5dz4fsQgBayz/CjE6mD7RgYv2p9DEiFsPY0G
	20tfldLprQ9t48wg
X-Received: by 2002:a05:6000:178d:b0:48e:b8f:f7d9 with SMTP id ffacd0b85a97d-48e2644eba3mr4823249f8f.6.1792588397791;
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:13 +0100
Subject: [PATCH v2 1/4] serial: sh-sci: Drop TE disable at end of
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
Message-Id: <20261021-g2ul_sci-v2-1-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=1377;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=3weoth6w6Xdl5b6WOfiDQxw3Mye7WCDgh2tqKrLoXnc=;
 b=pfNldyHMgPcqhzkFa1o+cms2Op0v6z0MqVAr8fWkcLhT21/2XnwoWjrKs6qWVj5+gpFwTXWbJ
 sRDd6avqjMtA8nT5XfTmxuB80Ps12Jq+DvQdSjgwz9YuPZJv0R/r4sM
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

