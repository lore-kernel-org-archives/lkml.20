Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588402;
	b=ILx68LIFU34/X6J1KzMp7emyD3gBX9u2RcyGqnbA+NNQCryP+Jl3KkG63jILd1rxA2J3
	 cDL9g0GrNX7b9lzGyW/ghRduvaLEzsVcPUELp4Vae3aCaLllL9NHK0AA2hQs/v+bWyEh8
	 w32j9Ku3rasZ4Vwd8jwfCpiCUzdriJY2tKtX5BaEXU2W/TbABJpIliCzATjrXGwiZDRUI
	 fwfKY2wjMosADy35Me4RBCZHAO8YoOikLk0x2LQLAmIniEWz8q9t80eTi3JayC1kGBEMZ
	 84hpC7XEO6vvc6wDWLTv6lmEDwLkvEzE9FzqUzsTNRYAPthOIK7vN4aW32WZDb/BZ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
	b=Y41HKNQV3HV4ducAGRSvs/6W9hGsUTpjddQZ/1DIPm0faDFQVlt4DUQY1jVhavUGM7dE
	 chvy5Ly9cp+4IUpGYESMg+6UZRSXs5PkIlnttZMvim+ulmd5U1XMRsp90UAz1xPKpk0t9
	 QJhXyq85IcucoVsCIpk+kaXvQp7pbuAUz0iVvl63flYHLpY/GWVkKIki44NZ2OG44IM9W
	 o4N1P8bafBvzjrFE3N0r9zba92V5wq0pObYPTqgvbBalWRajKbTg/QiXLQmR75IZst7rl
	 Hi6ocZeJnw6kkxnZoyaxHhwmGy6VKjPQK+8Q3VXiv2SakyMPVUqbC9+6Xn6ho+RMYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QiuilJ4i;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7E60A2621
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D7E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QiuilJ4i
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so408585f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588400; x=1793193200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
        b=QiuilJ4ijhbYh0xee9S/Tx8GCCa88R/I+iyBgX6nSJMJkSR0vCeni3YLNeo5Pas01v
         EpRwp5sHkEFs7Wl5TZeD9K+JoriJRdKPSyUSsPJVM2fqoGy8tA2CR8pIn9ddOUF8/H1U
         93LKE3u1jvUq8xs7HFCU6+oU2Fu/1/qy63B5XSrtiYkaMUQjy7WjdiSpLFe/D+QO1TmQ
         QxwqblVmh33q8eUwUiZvfesr7CpyEPkD/YSMY+J1SOTGwCUBPvCuGbV70Wu7tJztGh02
         ZsHNwt6Qky0p4ifKJdaIv1+MKNxIhekGjYtty4Xmzd1tkpp4wJZHUaxnr33qLivnD5Mz
         9G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588400; x=1793193200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
        b=NIEvI9guag7KNq96zh5dN0Qq3MMQRcE7qyHffnRcE2q5AEOHlHqoIj0VNG8kWZ2qkB
         3lMDhT+RJH3vzJwqIAgr7rBi+rCj0nCzosbVxWx1bJ89L5LN0QxMIvU4t6xABrsk7VRQ
         zoUZSdDJCb+X0tbDTMpaurIFiSVvK6ZmWI0LgttUGw1wsAuCyvl8FGfd0hA258bAMSmC
         FTKRB+UC6uAYtMFCDkkY9Ggt6z43DJn8Gi5QnzK1/DUdEoHY/QmZfIcN7s5Aas9wN8BU
         R5FVL4oaOUu+ww6CTccQisMBD+xw5cRc2RpT/X2xHlslrOpJtfRy+xXHSNTc3F1ClIIA
         XiIg==
X-Gm-Message-State: AFq9FYK2Hx5vfPTd4Uh3/P9MXUjiO66zsNlALAQV0ELBFOprZKOxhU9K
	oHdIn0QOmQjYLZ/Us3SwP/VfRwzkNesFPf5m4uwE3/2qyIIN3TworYmJ
X-Gm-Gg: AYBFou3PA/pdOQPJM6fiI1MtFBGpiK7T6Qsbw3DPMNzPmMF9k8SV0l9LIv+fUiBgQHz
	b08/IKHGup2S4EU2cj63OrpNFywMR52YbJGlhsRTV82DnejT909OGh0dAnay9dM/1yRK+ZbTdVd
	Sa5T6Odo000xvjSFVktpjynvGhFK8Y0dIfVPaZtGxepRcSS6vkBdfHfrym+ZOvy2163i1yr5DU2
	tffVU+0yJRqFB+bLAeI0cS+zUCaCOFZT+S32/W0Q1AL4NFZKA0tcW6hAFFesdiG5GoEbzHtsGPl
	ppUZhOJ6ArGx7jEeNqr+x4SuSa3SXJbkjbLTiwMa45u/hg5sDObNmi5goQkb1eMd4wjVwpIeRUy
	BN2g+i/iFH0xDDAfVyBg//pfvFYAbV9K1s6+YkMKbBRH5Jtw+r0md2AnzjWtHUg2rjq4UErIZQN
	zFsdmT1+/HBzVXaH1QGuolccIHp/7BQcLYe96mDTN26kV4RpF6BfV38rYu0ZF6kA/8gPibli0gr
	8FmSgoc2H2XD/aYRDjx7UWTvupIytjHbU4P//78LInf08YSFFlKu551osQBWw3OYXSjc4HwVnCI
	WVLGWZjrJCqSChMm
X-Received: by 2002:a05:6000:e92:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e2650e9cbmr2759721f8f.51.1792588400117;
        Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:15 +0100
Subject: [PATCH v2 3/4] serial: sh-sci: Skip TDxE clear when hardware
 clears it automatically
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
Message-Id: <20261021-g2ul_sci-v2-3-b4e038220018@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=3193;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Y/PdxtI6+N01gYP5oufNYPKYCuexWL5hMhFV0qDpjvA=;
 b=APrCXhR4oqewtSnvMx0iGzGwgxblBK8Do39a7KN/jeZD1h2Lu5Sj5M3XY/G4IVSMwI4oxn7mm
 lLbvQmqn8VAAvzmmaUE/GFw0YCQyGw+YB/RbWbUY3e/AmTZxZPuZiD2
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Au Dang <au.dang.jx@renesas.com>

On some SCI variants, the TDxE (Transmit Data Empty) flag in SCxSR is
cleared by hardware when data is written to TDR. Clearing it again from
software via clear_SCxSR() generates a spurious TXI interrupt, causing
the last character to be transmitted twice.

Add a tdxe_auto_clear flag to struct sci_of_data, propagate it to struct
sci_port as has_tdxe_auto_clear, and skip the clear_SCxSR() call in
sci_transmit_chars() and sci_poll_put_char() when it is set. Enable the
flag for the PORT_SCI (of_sci_sci) variant.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 273856fbc20b..b75e5e1d3075 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -108,6 +108,7 @@ struct sci_of_data {
 	const struct sci_port_ops *ops;
 	unsigned short regtype;
 	unsigned short type;
+	bool tdxe_auto_clear;
 };
 
 struct sci_port {
@@ -163,6 +164,7 @@ struct sci_port {
 	bool has_rtscts;
 	bool autorts;
 	bool tx_occurred;
+	bool has_tdxe_auto_clear;
 };
 
 #define to_sci_port(uart) container_of((uart), struct sci_port, port)
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 58120b523ca1..aa179c787487 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -3653,6 +3655,7 @@ static const struct sci_of_data of_sci_sci = {
 	.ops = &sci_port_ops,
 	.uart_ops = &sci_uart_ops,
 	.params = &sci_port_params[SCIx_SCI_REGTYPE],
+	.tdxe_auto_clear = true,
 };
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
@@ -3791,6 +3794,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp->ops = data->ops;
 	sp->port.ops = data->uart_ops;
 	sp->params = data->params;
+	sp->has_tdxe_auto_clear = data->tdxe_auto_clear;
 
 	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 

-- 
2.43.0

