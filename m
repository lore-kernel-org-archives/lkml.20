Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142346;
	b=CYXf01oBA3dw+HFAT4bEbVJ/qQarAcv71SHzy9ncgFVf0N13GL9O153tcLldsg1X7Mtr
	 Rzh2SZjG47WtQVLcfHN8Jd/4qpL50dPjtwS1bo1ZvLSfT+DccFMKaLryM834abjk7bhHV
	 OrvzTPx0c8j5Q36SoP9M9OPdP4y3gjh0IPQxjKCg2VWEXaNHyB0G40vxAIRYnViY96lSD
	 XxeE1MECEViHolCnV5JuuP5w+9BsRrdxQ71YvSk6g9rHx1rIEEby3aindadkGDs3mZqbO
	 yZvpq50ijH1HPGPg2Br5nEA5UdFNUAMeKCmoiA/2bNiR9XnDBm+x1MHbClivMk4T1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
	b=A2B1kXMe2Ux8ZAAmRZmXssJOa7dVAchOPIDaOhEnGzEi0APJJI35ug6q5sjXp56i9gkJ
	 ZKuzzbxZtt4LEQENMy49AN0oXxLIrmbRDTV4/d9a4PE+b2xE0weRb4lSNdRBNJfxZqQq3
	 79z4A6jrvtJ0C1HsRKlELgpfH4uRHEF+x0hfioRpmYCSwjQNRmHng/a9E9OsStHWzsytS
	 h2uan6BitnfdHg65EVKW+v/Nu26ZU+juTfuTDqlSFiU7uNb1/uiFs5IifPagC2JocuBqY
	 CqB3C67TZp/vsS/wvC9GmpE7ijLa90cTwtAkaouMdDPXEFGPqMMlewBenGM4sCqyKHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOQXg17p;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818E606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1818E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOQXg17p
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84621d8c7aaso194656a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142345; x=1793747145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=zOQXg17pd26tyfvfpbNs5AXAS4UhyOdKIZ+Y+ZF9psjBSHnacYTi2kXSOPJq1GxC9M
         TfXgHvwG7pQ8phSXSTU9p/xnkbDNTTi45MBmd9TeQDSOe5K+5GtqMk7i8gGnOW/g8nfw
         pLD2FsCVkWy/4+rN/t9m+M+nb+NDNxRvdOeh+Y6nJ5kOZdxhcdljftKF6qM8T/x3gaVn
         O5LdCzYeJbL6NzgJbbdqdEFmm99hHvHI0SPtq++bPRMZ4uKurdWX+jPVKp8wC0pCsjCf
         6qgjGHYneMMJk/RusWRjh8JV5MpxcbqpC6uZ81DgtvoFPCibFJTjeYDg0dBaVglMzgoJ
         KA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142345; x=1793747145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=T7ge74328GKjbzRB/zLhgqLfig6AB3ILfnoh01s/c9BKXId4F1Uz0XSJ/+P8rPUu+v
         J1qPr2TdlWJ6JdLoyOSOhULKrkOcvPxMp9Nx4YiMnz7RdwoJncd50kXtoPHHs54A/cAF
         E0ybBdmq3rjg2ou1xuBJSWDMjRY9pVGjOOWqDZa+7qejcwiBoK94OdPe0L1+CtpDMNMs
         Kpn30PcW4mfP4NPDEYa+cexP1J6kEEw+pRuJHvLU40K8wVhuKAvpRaJ8QVsn7fZ+WZDP
         7wH9FTIbuHzvnYh/9Sj7SerpZVlxFbKLFftOgJZDp8Zh6vWcJ/H9EZMK9k8ltKnQgn71
         H/ag==
X-Gm-Message-State: AFq9FYJkFeZmmVBqhLSdIwqvJcRYx4xLSDH3BzktSIDNUgqtXl94/RrY
	TdV83NekggSD2I+Cp402qBWa9VQmzQjQm0uo8blynVP1IRbkh7CIdUCD
X-Gm-Gg: AYBFou0jpQRvN98wFX6FeYzWZvm7AVawhjN0ThPkgbmxv5pH1LKrp+TApXSO3o28Vj7
	ekxSTK3uTz0m9GEtYGdL9+Jhn609yy6nWXFUF8VbNnTj4t3y87bOe7pdkzdh9152zosUqi/PQ+v
	+E8hAMNtlQLpbyAb6WhjATieMiAxJj+iIuP5bYeb05QYkH+H0GYR2h1b+PEFyYZPAHjdssrIoad
	OtDQ5AjLRHi5jkziiRgJkd3PwiNcbjf7kRPvU+ZnfviWDi2v5nFqtUh7RyIOpPSmnex83nDwccI
	URPe7FOIr+P4O9j3i58BZ7XWKqYGTPJFunRjVyt5TYxSbUk3F36YBy2MWHUYuAe96N9PazU7IE3
	kKoc+Hy/D8tdQnQTm5yW4aP249LDNsoAKFOkB8If67ZXwWGJajDvenpmtw2POC5dqiE3au48bgt
	rDm3znHJIiZh97kta7CgbJXNLwPBFiIXWSWSvHghFR28JjFNAoJUStQtevNXi2ISwR8hOALtPQ1
	kbGfB8ndhT3B2nti4AFTu1lpw53MjbJKwcUJrCKeTNNZRHvF3A7ixH5OzRGCH8YzGUwlwEiHQ96
	RAuzIXjaF8aWfmJaN0O7uZiNgx5DYadLp9srd4K+cNNdURI0BDg22qOyXJwhiW+uIx23spWiNm7
	6H6C/VbictifEgr9RYPnQ9Q5rarg6TUM3glreYcq1aDqhGX+Sh3z6TP8pYD+IwDjOilYNfysweX
	sGWQ==
X-Received: by 2002:a05:6830:4411:b0:829:9992:20f0 with SMTP id 46e09a7af769-85ac0fd0da4mr851500a34.28.1793142344897;
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:29 -0600
Subject: [PATCH v4 1/5] serial: 8250_dw: select port setup through platform
 data
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..1351523f0c47 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO. */
+	if (!p->fifosize)
+		return;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
+static void dw8250_octeon_setup(struct uart_port *p)
+{
+	if (!IS_ENABLED(CONFIG_64BIT))
+		dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +791,14 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		data->pdata->setup(p);
+	else
+		dw8250_setup(p);
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -860,6 +881,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

