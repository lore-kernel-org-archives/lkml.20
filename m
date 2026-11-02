Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649327;
	b=UC+TK69g/r2xsKdKS+eWyGFom45V7NBXwpEL9o7EQ8gJSj/WUhlhw7tneKRiNDp5kdAq
	 DyDqIrW4zyyZz9bzXubrR5oYSQerNAybsvBuUWGHRszTzeJzvr5E+VLNh8Pzn2Lmj2zu6
	 IEyvOnBa0o7P8I+UL5FyYBsjh0JUQYIIMGXkWzw8xtSB9Xn3C8J12ZKxdJgujYGxBAdy9
	 fiGlVNYrxlXLC94+3jHVpjxw5iOq2vZ0cbjpkExrmX9LYIWozD0IN6rqNXzVQpcpJilDO
	 dUjpEVRkpSGukQjE/qgC5C3nkRqv7qrPYLC8Dk5LMWm2EFyVXXbUzLA391ZLasAlQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
	b=ygEJEkxfn8C0Flxw0UeKg/EsPcY/X2Lj/eXLRvobixDqANGaw20OC684cKoGLPxCp0Il
	 yqVUzQ8ETYnXddfnE/eCnHvZXGkw6etKEu5kQRkW7s1VfXMByf16Muw18G7U+iNPvmde3
	 7V9VfuQHuxDl2r2LKqebFIt2q1KqW23AV4jViLni2++H0aR6NlqRgMcXq2Hc5OpsY8+A7
	 qfomE1wDXtbQfDN/paYLiGpbfXB7UQDGuEOn295zt6m64hJyJNccVmRfFLLJ/l04EKdr1
	 zCwc+nGjzFu7o1HCHnp7RtlYV4/oj7zmHxVVVbSLb/14dQxGXx3CZFhnJUI2AL6erSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOAgGNl6;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB95606D815
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB95606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOAgGNl6
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a6fb4040cfso1066364fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649326; x=1794254126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=JOAgGNl6wg95HkqA44dVV7BxO0Xx+VwFpiL19IefEgDIMSylmz2Vvb9LVXwNp8uKKr
         4UC1K5OS1pnJHAzjA/iKkkPV21LRoNw7zJncz1423y60Tib0ff68MnSIocBxfaF+gE9v
         GHBoLfhmwZSCGs6rnTOi/4jMj8Fi4cM5YzJnNX45q4Cz9BRxFhUCmRQBTgYl6BHamnwo
         4aZdMmrnlXaqp82z8Iv8KgV8TKVRw+JPOq/D4WQ3dwDK3/gSO3O9RXgSNTwfODb3MNom
         GJRLV4gAA2g0YEZhDTzC+ZZrJp0mFVNJXYY/aefoOW/7HQZiCwZmqAUXHh0Leuecn/7R
         Hp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649326; x=1794254126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=WNmV9BFR4e3CLzdyouk5WrDSWkSP7elUyTWCxd3J2tdl6nJ/j3og5Kygve/GkX2Nus
         1FI0foiKvn1uFFdK5Td1Nvgiuv/rGg9nvCBk4cB0bPNLYCpdMt2L3D1cNaICCfpewIKH
         jgGBDjfVqEpaThtozWACezUjMrDxamQBNWzCgBbTGSb+WmiMa9jqT0Yw6hNZ4jAB5tVm
         wMAEOuvtptAhvpngBik41LNdRPEs1JYrvRJj/vhdKGmuFVj0uSgpP2lUbifKddjlf1Yh
         xiiFqnDUUjkSLwNbbAeYm7GTLkEeHsne5qdhFb3l1JhXREFlzB7jy/neFP3HY/MjPFF4
         INCA==
X-Gm-Message-State: APuU4Z/Y99zr1lIiZVaQVE4eEwzb1EHaPHiu8eRFOJ0ByLHh0pMqZfHS
	Fe1B3F3uzsNNq0NE36/kiKnA8Hqs2t+3vwt2+fgPtRoy4WybEBGEqV7I
X-Gm-Gg: AYBFou16ADrC4T02Q9hxdCUUK20e0TGOFrtUSXXR20+ZzDoJcSRANtheyZyyQyDryXk
	UoVfElbF0XXaY3xniTSifuWe3lJCAgEKqD9RsgyioSsq8Y4gCs3jFN/3ijVGYdg8T9MJIhbo4k4
	qfa14SURMPGjcPt3zVYVJWuR72onR9X1I/YH49NydwmD/JDDu3HlqCVELWGR/H8TfAw/PGiXsja
	mtiWC17NuAdjsy6x6zoDW/HG5D40qv8aMU3PitFaw5A1pwOQMpvqwnJoUBlL0ut0ZkLqvPzIvhU
	mWyjxu+up3isLHyl70Cf1+CcV7aBqRUM+0O68+5R160Jzc2G9dlzZdx35yTKlpTQuJo7d9j0z5j
	mSpR2tayPUlj/At2JydeQ1rjM7/rO/5doFuzQYBS8wf9kPBy5+XMVrIcbOHtYA4jHuup2rkfZPQ
	KpRsU6YK4F3JE/gaxRjqAlm5Sh7T9+as4it8xsQfBGGGEJCbz5dQNIcSdVuVNSTGq+bGcoc+7BD
	QmyIL+7C2sFmZHualANii0Uo84sQv2g5CXf8QEYGuXUPlLdXuwTj4drP78ANOPn1+9ux21rjq4D
	Pr5TaKcU8io/XKDj32d8mkkyfvYyQTul7iP6U18J2+H4vg1fJpF5NA9K0hfZV0Bb34ni9VVKAnp
	CeqG331qDyG2FfkTT4lpcnMPro2NCUrhKk2kSoEyo8Au8IGGKOu1xXHFyw0B13zK9cnHqHRx8oI
	9SiXfV7YVvi1qHeRVaOIvDXxmRnZrQe13ulUkMclSOZjNdNYi8l2Q=
X-Received: by 2002:a05:6870:ac96:b0:48f:e21e:1e7b with SMTP id 586e51a60fabf-4a9077e817fmr6538976fac.59.1793649325629;
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:16 -0700
Subject: [PATCH v6 1/8] serial: 8250_dw: select port setup through platform
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
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
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
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
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

