Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911956;
	b=XrjTd+dST4ZBSJJzixhqNIEQ/OG9tFmO5Uh6s+D0Gic1y4Q3DM+XPBoZ2I+IKT+sUOix
	 dsgoDEYm0yOqkwJYtltS+Tiq+F9P3jZ2ldj+OEUXqzju0+K8HOnqGpsTok09QiSXopna+
	 UeVMozQmxKAc4/Yr8s6L4/9GBSHTkY7djNYacEMRZvaPvJfj0i6Gt2TGFGTfu30FVTTUq
	 gpvtVqUPPgbo8i3ypBWBhTNk5Dlv5DQI8bSO7I8UMh4ADT4IyPJJjzZnm9mfJEwlSPqvI
	 FETzzgOAM2l2YYpq/o8YZEJWHg93W6JZ7v8SdmWFLllaf6Rnfr3zodYEiz3Lu+CaETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=fdh5GteYxdtaBm096sZ1K9EFzTv6KjDWPxzglbVSxvBo1/f12fPFaYpzTpXeiWRv2LL8
	 8xpueTaurqJS7+Gzvy5KCJ/T08JpDqoJd89FFRkH/RQK5FjRoF+hyU7RiObvL83rFbrF4
	 f/wfD5cqAXfFZC53+8WL7gGbJukYh/qF6lZOmr91Er/FpzaGjlGG/5/24KECADRnGg8QI
	 8l9mCX0DNozE6rzEWypPUeCQQJH4xIprQeASBLMWdpNvttDQDd2m2HoqOvRfSqA8dmV7n
	 nAg3SqvTxnIHqnI9sFHjHtcjk8/6MKVbTbIWJU+L2Yz8WagXCa0u9oZEJA5aYQ5uB4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckMnUrqB;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F95606D830
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F95606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckMnUrqB
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df0b02fe91so694805eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911955; x=1794516755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=ckMnUrqBF5YjkYWNzJKEtt3h3QNjhP9PJbZXBV/J6bRVKXTyR151+RSJ9U+eER71Ap
         EZldnj1ydj2XTvzN/QAd1lAaKdYRiMolKOMghRHOUoMDS8SQjujfcwgIdq4WmgNcysKa
         hHmECxLq77xxeGRIIheOWSmb+8PthutqlN1Kr+E6rrLvE6em77b1DstgthhRi85GkJrT
         rzNjQLqLPOD+kwi1iBLCztr3zLJfqCJgTAVJLbCpu02QbAeJWQFO5qFx/w4NDJW3snyr
         MaNBywJAxiISvEsiIYk2F5ADkqXMYIHKfuCmxKCo7+3xCHSpKtdd/b/xbQhBTkU0nDs5
         JgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911955; x=1794516755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=lD+nGm4p7/V9OZBcXSDI25RwvrIOHn3AD1cIXTxErSSCHHoZHl9QWnrm18tuE7PLEy
         QXJnM6MgxoiGQmwTymeVpJe+wihVzEGS0xrgqVYG5l4XFVYgQWHZ2RyZg2cTCrk3U3VH
         Ta822htR5AiKDloazCQlP8w3rf/5MAS2t7dAT9YUE0Bhp+VWRT/lmjtMF9ZGtr4yWnfd
         ULTrH9/jnrOHOwRh5mVmODlJCu4fqMe8C+Jharr+KOoEkuAMNx5wcSHXN9xOBAgzFhir
         n2JEwAlu7ywe7uhhbeBzq38DgeRyIf3YowXO1zwGlVTh43LodLtOUjZtQvZPiV/GRCVm
         tasA==
X-Gm-Message-State: APuU4Z/rpqgx2xA9loHzO443OhQSs4mG11zKIL5mTeESv8jzfmgwwdUI
	2BiX/DbUWM4xZOTwAo+P4I4LtidLXQofqgRCI75c2T50xUVoU8Oy/YuW
X-Gm-Gg: AYBFou1F/K1t9IwDKcvyGG71PjivGZUCBu9eF9MwYPG3U+bz9uLJX5LmbhnN2jRw+Eo
	k1QcydTjjpQ6L1gqpXSAiJY4aChOEIMRaHgbvoeTMJsEAk/aF9y2paWKcnbJsKmymmThDMUxXCN
	RZ0O5/2++SYbn37rUDMg1CV4GUHvvUV6B66KVjJPFnNISEbHOBI67m1nSI9sNqMgSeYV8Uy/bwo
	z61oQEeoa7hi3ZhO0Wm0DdQ7/xKjXZN0ZWmYbFJOGF7O31Z3Nv+7s2Dp0G+hyzHSrgRRYm9LZbq
	tbDJ9CUZgxWY/Skh1LWT9oLnksSrnCDc1k4DDfJkmYzcgvZJqiSY30d7GFLJ0emxkN7DmpON5CX
	GZiF4s9efm9IzMhKTy7xye+/aFpOfjVz1UsL5uJQ6w5Zqey1yrCfRTDOMq4d5z2npDfOB/BXRpW
	nfbff+l8+hpkeHXtMdJP/h/0/in5A2rz+Qh3TJfooc9uRANz/DppVmpNhNjJpxehGxRbl1z/AgP
	rJtW8Hh5gNQ3yCVoHvZnViS1+WhHuKEECROJJLV5fU8u3hnFYDlmKxKErb36Fjd6mKK2hsUVdCr
	g1Vx3AvxlSYLHwWk1yJPpSA4jkUwqZd1Hl8J//MRRKKwR9EcQhAVaxOCWRkvhLk7b8Egb8KYj3l
	qD/ulYcqBfbFW5RMKSgLGWuBfzNz6D4gOsPGkFDNY4zHpZXrS9DBLzRV+JcQtbkjOjs0j051hvZ
	LxiF4cdrgF+sBf1W87WGC8f0ElXu41O5kmsPrnUzv+M2wB1WFavjaEM9GTrpaBu9z1k2AwZmux
X-Received: by 2002:a05:6820:995:b0:6dd:c600:ec2e with SMTP id 006d021491bc7-716d20ba2a8mr2263018eaf.19.1793911954642;
        Thu, 05 Nov 2026 12:52:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:12 -0700
Subject: [PATCH v8 11/11] serial: 8250_dw: configure RX trigger thresholds
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-11-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
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
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
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

