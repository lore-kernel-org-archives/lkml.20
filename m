Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87B44E2361
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221184; cv=none; b=pb8WmxspgmBhclko6BvK/Ni/clhn21WGoKwL+kK2FTf+Ind4sm6r8WApw69y4l1tTTNilcw+XC8GvYZpGSPD+t/iQFXu/ug/NnGzAw+IOiDXhRNCKJ3AQkPl+MFk8N9p7CgcC5HKmVSdMJpI3RK2C1Z8C3qTzGs5UmovSCBr6FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221184; c=relaxed/simple;
	bh=r22mQlPIjskWq/DiG01MMyS5WtM+Mp3QEwj3JMNSpVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aL4N4boHGw45sCheTm5s32p27qMDVxblqgDNaJsKNf4Ivq4Mt0GNJUUWawCAaOqyKfj70XREz7cYn0FgAXvs5ZENXr6rqJ5lNaHMKezaNp9EySjotIADRiZCR47QmXjy87V1imWYjUhnxPGZ4n/TXE0GFd+uV2vBnfkNsI0XaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhVhuCWR; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhVhuCWR"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-67561cbafd0so1757657d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221182; x=1791825982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZmo3FkThSpnGOZcS4sClOcoI4Yj0LiqIFWf1roEIeg=;
        b=FhVhuCWRZwazApOtgGH9Is/bibfYovrM5rNnx9z8j4GMaMoe8iVVuyYsRnWFZEa1YK
         ES/5esHKjm1yZAcg6WoNL3dBZBDupFie403ffSXkv//AD/DCeS7Tox/Y1Dk6s41nlmiW
         hr/yimP38S9ll1IpnA231ynTUJhVF6VKawwCaHAgH+EX5eFFfEoDhxkDCJCpCzpYy+fN
         0UGeJnpIw2lnefL4oohPtCQUXsV2gpfhHpGsKaWfTNxXKFCLdyjApUsH96qEVb1z9Fy9
         +HOmIs5x4sTltT9N1k3GZh4cbR5P20eT+OHnkJUycetp3DZR6BDb7wMMB9EJlYKEI9Zd
         6LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221182; x=1791825982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZmo3FkThSpnGOZcS4sClOcoI4Yj0LiqIFWf1roEIeg=;
        b=SgyLGg7nqmnj5fUbmPKMMkp6kJo33uUjavDeVUcJ8z81ZF+jGNuI5uYsuV4a00xcts
         4uZBm2q/U5pM/G13UqB2OsQO8y4iQiyrr8kYg9hLI9HaYstuCNLGrYaDbuqdL8Twx2XA
         DmiG1G6zu8XPlESXB7SkgXpCmuVvSqtcSmzk8vq13OcC6fejcjIbxM6Ozl8XvMMAnYmV
         Ru785gT4tLyOn+6bvQd4c/NOosbbskRNGO64XpRbUPy8e1lrVRrRODVtNT5NZDeuAj70
         ofu0OX0U8tAvM3zq2Y0V9fktzKfmZK/Q75QrG71jntKcKxVZrpEAlEHJFf/F+1RebcaZ
         5uRg==
X-Forwarded-Encrypted: i=1; AKwUvByYLk6HUnYCSU/G3zX+bFbvrPAfc4oJIbniTXOP+/oa0z1+FGx0RSmGkFFAdCTLsojqlvszKXIpn/gxXcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUpPr6VqGf4ZAJu+CBxU3nNpjjbOfhTmtni+q9aXt3VDjf1Fxq
	ZcooRPZgiZ/143nhXeeulEurvLeXf464HOn+Tqv9zNQQAYll28Knckks
X-Gm-Gg: AYBFou2apfMx+lCzGYbuDNUEFkvJUnzLMSu4pM+gY7PdFbqMpfv5hIj1PgP0mBDjPa6
	nxoPn4CJVCJ8j9Myfo8cm2TEHpEjkJos5/fZ+vEQMLFjLLAxj+3TO5JgfpTMtZLiPTJ+AvF9ej2
	DfLacFgLSDKknmnmVWWIiORlTIPhvrEIdNW7aluteo7s4em+YoyZseJtIC4L/6cPS88sqj6ERDA
	EuNvLbzuCHjUOQ6lB6m093TfvEh7fEN7nuvVJyfc9yrzVajxfhkEDo9VbGG8m7pXripu4hI2cbr
	/CGyJ81RH6lg1i5QcDel+0Dixx57zclgUbOOw99kSAIJ01vS2nH6LWMgB1jWx94OVemCabvIwQU
	ch1zmlvDOMMLnc4XH3MSAWtR9jW99SIXoUbA6oaVms7mr0ZBBq4ZQQtDi4JaM4QTaDC7Lm3uSW1
	ubDnlS7NMV1unIfJDRkbYGNVMQuErV6VroUZk4gjSQAysSIA9/CPi1E1ROX51a3f9eKwnxpo9IB
	hW9GNAff32Ayik8cNJL566p7k0pTrzWbx0Zqk0xnW8QMJApKLwD8OHGgcESxfzAW5fMjwWJOvK8
	Hj2Kxw==
X-Received: by 2002:a05:690e:169d:b0:677:d9d8:d937 with SMTP id 956f58d0204a3-677d9d8e732mr1507439d50.32.1791221181825;
        Mon, 05 Oct 2026 10:26:21 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:21 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Mon,  5 Oct 2026 14:25:38 -0300
Message-ID: <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 UART is clocked from its bus clock gate, which can't change
rate. dw8250_set_termios() still gates it around a no-op clk_set_rate()
on every termios change. That stalls the character being shifted out
and corrupts it on the wire. Use the existing SKIP_SET_RATE quirk, as
other SoCs with a fixed UART clock do.

Offset 0xc0 is the RS485 control register on this SoC (A733 User
Manual, UART_485_CTL), not DLF. dw8250_setup_port() writes all ones
there, reads back a nonzero 9-bit value and takes it for a 9-bit DLF.
Every later divisor change then writes the fractional divisor into the
RS485 control register. Add a NO_DLF quirk so dwlib skips that probe.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 13 +++++++++++++
 drivers/tty/serial/8250/8250_dwlib.c | 22 ++++++++++++----------
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index ba414306c98a..ea33aa644cda 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -52,6 +52,7 @@
 #define DW_UART_QUIRK_CPR_VALUE		BIT(5)
 #define DW_UART_QUIRK_IER_KICK		BIT(6)
 #define DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ	BIT(7)
+#define DW_UART_QUIRK_NO_DLF		BIT(8)
 
 /*
  * Number of consecutive IIR_NO_INT interrupts required to trigger interrupt
@@ -606,6 +607,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_out38x;
 	if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 		p->set_termios = dw8250_do_set_termios;
+	if (quirks & DW_UART_QUIRK_NO_DLF)
+		data->data.no_dlf = true;
 	if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
 		data->data.dma.txconf.device_fc = 1;
 		data->data.dma.rxconf.device_fc = 1;
@@ -892,6 +895,15 @@ static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
 
+/*
+ * The baud clock is the bus clock gate, whose rate cannot change, and offset
+ * 0xc0 is the RS485 control register rather than DLF.
+ */
+static const struct dw8250_platform_data dw8250_sun60i_a733_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE | DW_UART_QUIRK_NO_DLF,
+};
+
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
@@ -913,6 +925,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_sun60i_a733_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 9bb02a4ab11f..9c6f3d926ad5 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -209,16 +209,18 @@ void dw8250_setup_port(struct uart_port *p)
 	}
 	up->capabilities |= UART_CAP_NOTEMT;
 
-	/* Preserve value written by firmware or bootloader  */
-	old_dlf = dw8250_readl_ext(p, DW_UART_DLF);
-	dw8250_writel_ext(p, DW_UART_DLF, ~0U);
-	reg = dw8250_readl_ext(p, DW_UART_DLF);
-	dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
-
-	if (reg) {
-		pd->dlf_size = fls(reg);
-		p->get_divisor = dw8250_get_divisor;
-		p->set_divisor = dw8250_set_divisor;
+	if (!pd->no_dlf) {
+		/* Preserve value written by firmware or bootloader  */
+		old_dlf = dw8250_readl_ext(p, DW_UART_DLF);
+		dw8250_writel_ext(p, DW_UART_DLF, ~0U);
+		reg = dw8250_readl_ext(p, DW_UART_DLF);
+		dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
+
+		if (reg) {
+			pd->dlf_size = fls(reg);
+			p->get_divisor = dw8250_get_divisor;
+			p->set_divisor = dw8250_set_divisor;
+		}
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_UCV);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index ee7a07fac0f6..ca0dfd6d056e 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -88,6 +88,7 @@ struct dw8250_port_data {
 	/* Hardware configuration */
 	u32			cpr_value;
 	u8			dlf_size;
+	bool			no_dlf;		/* Offset 0xc0 is not DLF */
 
 	/* RS485 variables */
 	bool			hw_rs485_support;
-- 
2.43.0

