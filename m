Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742019;
	b=hPPCGbqBByN6cmWjIezORXub+sSHzAitGA7asXl3ZcyIBlQOvPWxK+KfAw4yrm+rQbZT
	 4p5QHQ1S2tngpLAhKOKGZ+rFBZvBeMnd/JeRisnEMowf+4hRRcixqnJH26a3X0xEZnC7T
	 wIR27AKBYG2FlxLHM1DpLYziy08/2QzcZUGXyIakgInikigigOCeqMsQvVL4lgiSn2AUE
	 yIH1vMFbN8aMC9ewJiKtzhHMcBXcT7s0fP3pwxkrE8E2Bp0n2v1T429bnIXHwaP/A9pK/
	 ZsvmnwSMZoppg1QjearV0K11YsaNyR+cnNjLon4mJ/fgxk8kYG1777Ui6yGpT2X5i+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
	b=Ms346mKESJB3QxQSPZqa/1XCqXhCNh+ubuTUNf8LjjJHZrs9AxMJSNDMjX4q7zr4ETny
	 YYCn9yMuvwt4TJ9yd5lkCdMy8q/1NaGVCAq0Qe1mASkegFJqYLftSIvbCT8z51N501yKC
	 Z4DPrlZZd16sBaIhdvCxfbVLramIAbHwKoLgsdjRKQHthr+k/39YV2kNWigb32tI6OUJL
	 NUO945yRNHZPNDQDbuEVLK7yUZ/mzvcyIO+6KYI5FLdPLZ75A6aZv/0ZEBxTw16cEpLO9
	 GxJXkjuL2Xlb7ecvKbrr2WN2LBOEaJHPsfwYjstb6ebgmG0UsuX5bBaTaQS9JM+asUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJQqhZj7;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0E6082BCA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD0E6082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJQqhZj7
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-5641f26ce05so32195b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742018; x=1794346818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=mJQqhZj7QB6/b23ZkeZPi6U2gWPLiOsUvniL/CVMecJNvKf9Y/3pCihLh7ZMU8NylB
         imJabc8c3A06qHiTin3azbLXEsmM3D1+XX+tERLhdbXjlJdpPvnjzISJypgQYCjrukZi
         /FL8pY+ltdAeGKqrDlOIAN1Bto3bBUH/KMb5UKmrib5fmCZNhiotRGU7jIJ/uES2lN8n
         F6Z82yErAnMduYILloPA5wryIjF40wS1eLJOd4hUmjIHRiTt03GjBISomLRhayzExT29
         HmniyLMCH93F36bKCXsXykCOutBubycLyBStjNqMQ47uQIjKfoqe4bAGdusPeZxWUfUh
         ohBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742018; x=1794346818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=IHqt1fsonEGi18zS04OAuAleNATbNdbT12HeNB6wNnjdgJtRDEWwZYiz5vUQAdlj/y
         r+fGeWbQ+9ZAS7TtfAgakitFErnzANM2F4SK2NDZGSfkC0xv5GidDn21W29cv/z0/M4W
         O0aUbQA3HTZwBPIc8X2MF7Mu3NBzJJRYK7FxdNzcuBzKMYOAPtBSL3rVR7RaHbYosOKr
         SK0niT3xbYdeFu9lBZP5/RtW9LUkUieXDjRU5EWxbJW5serC3HwSxopylO1FZ7fyUKjC
         DuK9KvciWU9QaBTpUmUJbcWgvQkP8bbHRgRt782BAH28Lhx8VZhXXW6Y29D8YGONVvwb
         i60A==
X-Gm-Message-State: APuU4Z9xD7ruNYQtS+e6n+cKEPDQjhydu0eKvvy7FDdRQjHCCQeVCLt5
	8fLnrfFffzWSwwW05VQkN3XS7h+7rtqODpawYu9GMA80zgqotySZaJmi
X-Gm-Gg: AYBFou0G9lEuUIgWs6MpU2udptRETm1CiDYmQsu8TmiGNYDoLBqK+24KBdOsEm1JaGv
	Jp5p7dKHIErwHisjdv2R3+ubIaYuMHHhsayejWue+G0l+q40OwyJaGRt9GJGOiNoZ08nWw/HMMc
	YKT1WVnCAaUA9RbUhtQkoHGl3Llvk/PlUHb4DtjTn0nOZeunK9ljTWRIhqQtl6uY3bIpcLs1jg9
	FPiuv/JPQziFo48slrENwhdbEzV+nYjAQWxIZGstxmdFHhKIrEv3eaM5JkOiswARPEJs3S5Tvkh
	GujhUIi7kw9loAaS9fyRmixvGJAq5rHkuE/ewHpq0YLxIHQPLiKV+tIJ7M2avbBiyGshcIMF6rx
	wnWQ1f1wGHcORIjD1Of5HwzprXmWKSvcU5FijxwNWRSu9KR55RYb1PqLawF2nqX7w6OTDgdvdvu
	+0WTHqdTndlF7t1pEduxqh4imLfKpIv7FJWdSmvr0G1w9nl6Tn+qp0gMyqFAnkYuSG8zAjrIRmY
	7qEzLa2fTqh7NTOLgkJm0zyE0ns5ZkPPsmMtBGRtUE4DBP3Pra0+vaT7eUsjQPJ8qn/ugy5k2ic
	/1AWl0ZK6aHbSVZc+PyyYMr9BnOLh+dogmWu3StRTEeL3kTNxHISF9AikVyQHib7ocPfXDPVm9x
	qC5S/hXHRUpgzP04oX42j2hAt+uHsHgl+d+048t5de0J/qkMshIySs9En9lLpYbx/B8PT6KJ6Rl
	B7M4I9Kii/OKoxvvOOeoKMgPhfs7fFyINB7c1rUaBLzdAz7TiR2G/h+heg23oftRe88ksoBbd6m
	g==
X-Received: by 2002:a05:6808:1997:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-5640e035525mr10789884b6e.59.1793742017956;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:05 -0700
Subject: [PATCH v7 12/12] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index cdd3a62dfa7e..063441923864 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,22 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	if (!p->fifosize)
+		p->fifosize = data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -931,8 +947,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

