Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B93644A3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785426; cv=none; b=sDryEbHt5CK9x2gj98KNEFywuEUeq8Gd77kKNGDroCKMIvRgitY9/nDNcdr7H91H3RycNbqX3gTNzxt/TvL02A6bLvjx3gO+ipeGWhdlWpSUWienYSSHaw0XovtENjXuikvzTRft0/IpOXB0ItDjQXLt2JV7F868grdwQDV593o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785426; c=relaxed/simple;
	bh=A3al1tmuV0A0Vdqcy9xJt/695r+kavRLV9q//wj6SQc=;
	h=From:To:Cc:Subject:Content-Type:MIME-Version:Date:Message-ID; b=pykzM63cfO9jGukTsVG07XF4rn5n7FSfEPochmwoQBKY7YEtZV+Rumqmdkn6eY44il75egw1PAQwzJKtgrTRwKpCA15mIA7795L4LsUggf29G0xXFrF9vrYdkTw8jAkcp7uelIGSr2MHsvXA1s2ajcTVupAsoUVUI1BIw5KDuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6WwLmoN; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6WwLmoN"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so673144a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791785424; x=1792390224; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV0FhVrq0sGfMbGLK+HF2R3XMkBDiQek25otMQXj59Q=;
        b=I6WwLmoN9he7sPSZt2uGN5RHX45q2X4i10kKyCHzWDGZznGu8/DJ2oZ87u4ybLRKE9
         3YUHTKEV7CLVlTmw6Df3Og6VllyEwfFsJT/uX9hR/tNO0bdU/G2N5E89OPlv5RCnhjY5
         sbIENHtaZ8vhmcDgq/+RYpE8CyVmkc+T5paEss3XATIFUfJe8jls8LOPUBpuaeVjENyl
         69288WgL13zfnhh6THXQEUPjxIt5Q6tDYcDokhrQyVtFhP5oS2UAojAn7TDXQAiqM1Ue
         Nz2l2TVA4joAOb7WA4ChlyoxbEyquJ7ygpCO3uu6QUlg8Zh8nCxrbcqTh5NyWBagSPLz
         6ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785424; x=1792390224;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VV0FhVrq0sGfMbGLK+HF2R3XMkBDiQek25otMQXj59Q=;
        b=dkMr2wdbZvSnZ+a9XR24yH9QJh8FBy5ltClBsBw1ebZs9B41FMMgwK2+BspryAralF
         Ofti7/7Rwsru11fDTLwlRW44axxkzocKw8twcykys8xzj0WDezi/VukgHzhu8hbRQ8oK
         SyXl59FZ0UQYg+YrNWhFS31kMZxkNv+iqrF+XOHhTupOaH3IWAMbFmMbbz19hybfTI1L
         aKekH0h9P+Bithe7uJbjSJV+mcrdQFmqw10+F4VsyK64SP5nkZ7faOzl0NdJdiPa8p9X
         Cn2bbg5qksQiO/k0BeDIkThtYtPyc7agv3hJO6hx7i4CXy9UGjOgVlaRONtOmoffkFUn
         W37Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+z6Jgdb1U4AOlmfBkHAXnq/to8l3cZCyUuPzEypwJYKkSZkApuYE30AND0Uk3a5cY2jbjyMq2JrqYEKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR1oQ2+RbMUfUZPdgAwCUdSgzcu7CgyjK52AQbQWjw5MNKwBLI
	0dcyuZv7G6QcfkuOYJyGdmzV0Jo/5/RJ7+r8Ac5uSmODu/LZeR3UBPQS
X-Gm-Gg: AYBFou2ZqnPWw302dZXX8mE3f9/rS5c9ou6tYlrgJlbMHQYSyU/h3OqmOkXWhcIaVwJ
	mTaJ4dfJCtyJ5XRdr2ZFFe98Y2ZQFl+/ygELRtjzF+oJzVKmtb8gYjKSAmbweIG+UCPD3RYhZV0
	I5XtEA6LC9K6WgYAFGdOhng8vLewyu09TdJlg599anDtXI4g1eAGlPHPI7KNjyv5R8aumcYzeMw
	5PV8FDZ0acbeA6p0On72CJ4+jwFSfLJKyWBRW6/40+x/skU06aWwbSBy02Mf4u5FvM3/FBGQfUl
	t2WW5cZAWw1VdGBLQLw6pNmVqZ+ybKx40LZjWcxuYr4p8m8duQkhRH1gamVLMJU8upi33M9QObC
	6GaVI9V3ejdM2mvIEhQz911izEJsISXjlyp2Z6D5ksT8At35CQCrmgkAoby0sKTRnLnhBpwLYP3
	68IAGV51wwKQMoPBd7PPU3ZODOdWR3S53rGR3xLUjkYecyZDd96t7v4tkum+yuxqIMFbE8miF+4
	Sl2co5W48JBBiEkgFS4YP7IMpUutsQm6iay5XfY6scfQzdGb39bjLjhhmTj19JdsOcoXYWaMw==
X-Received: by 2002:a17:90b:4b85:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3ab3ab60609mr6810362a91.22.1791785424078;
        Sun, 11 Oct 2026 23:10:24 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm15480827a91.17.2026.10.11.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:10:23 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH] serial: 8250_dw: retain programmed timing for BUSY waits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 06:10:20 -0000
Message-ID:
 <1791785420.8010663.945898876521967.uart-busy-frame-time@gmail.com>

Baud changes update frame_time before the programmed divisor changes.
A switch to a faster baud rate therefore shortens the DesignWare BUSY
wait.
The wait can expire while a frame at the old baud rate remains active.

Use the programmed frame duration for FIFO and BUSY waits.
Account for UART clock changes.

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Signed-off-by: khaliforce <kforce@gmail.com>
---
Compared the complete patch off/on on MangoPi MQ Pro UART0.
Kept other port patches, kernel options and DTB identical.
Tested BUSY changes from 9600, 1200 and 300 to 115200.
All 11 paired changes fail without the patch and pass with it.
Each trial returns 64 matching loopback bytes.

 drivers/tty/serial/8250/8250_dw.c    | 20 ++++++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.c |  4 ++++
 drivers/tty/serial/8250/8250_dwlib.h |  4 ++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 51d026f20825..03be503bcef0 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -17,6 +17,8 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/lockdep.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -131,6 +133,9 @@ static int dw8250_idle_enter(struct uart_port *p)
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	unsigned int usr_reg = d->pdata ? d->pdata->usr_reg : DW_UART_USR;
 	struct uart_8250_port *up = up_to_u8250p(p);
+	unsigned int frame_time = d->data.frame_time ?: p->frame_time;
+	unsigned int saved_frame_time = p->frame_time;
+	u64 scaled_frame_time;
 	int retries;
 	u32 lsr;
 
@@ -139,6 +144,12 @@ static int dw8250_idle_enter(struct uart_port *p)
 	if (d->uart_16550_compatible)
 		return 0;
 
+	if (d->data.frame_time && d->data.frame_time_uartclk && p->uartclk) {
+		scaled_frame_time = (u64)frame_time * d->data.frame_time_uartclk;
+		scaled_frame_time = DIV_ROUND_UP_ULL(scaled_frame_time, p->uartclk);
+		frame_time = min_t(u64, scaled_frame_time, U32_MAX);
+	}
+
 	d->in_idle = 1;
 
 	/* Prevent triggering interrupt from RBR filling */
@@ -156,8 +167,10 @@ static int dw8250_idle_enter(struct uart_port *p)
 	 *
 	 * FIXME: frame_time delay is too long with very low baudrates.
 	 */
+	p->frame_time = frame_time;
 	serial8250_fifo_wait_for_lsr_thre(up, NULL, p->fifosize);
-	ndelay(p->frame_time);
+	p->frame_time = saved_frame_time;
+	ndelay(frame_time);
 
 	serial_port_out(p, UART_MCR, up->mcr | UART_MCR_LOOP);
 
@@ -167,7 +180,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 		if (!(serial_port_in(p, usr_reg) & DW_UART_USR_BUSY))
 			break;
 		/* FIXME: frame_time delay is too long with very low baudrates. */
-		ndelay(p->frame_time);
+		ndelay(frame_time);
 	} while (--retries);
 
 	lsr = serial_lsr_in(up);
@@ -188,6 +201,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
+	struct dw8250_port_data *d = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int ret;
 
@@ -200,6 +214,8 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 		goto idle_failed;
 
 	serial_dl_write(up, quot);
+	d->frame_time = p->frame_time;
+	d->frame_time_uartclk = p->uartclk;
 	serial_port_out(p, UART_LCR, up->lcr);
 
 idle_failed:
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 8859e66d2d71..d74ff203f904 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -39,8 +39,12 @@ static unsigned int dw8250_get_divisor(struct uart_port *p, unsigned int baud,
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
+	struct dw8250_port_data *d = p->private_data;
+
 	dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
 	serial8250_do_set_divisor(p, baud, quot);
+	d->frame_time = p->frame_time;
+	d->frame_time_uartclk = p->uartclk;
 }
 
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios,
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 1fe52332e774..5472c13ca92e 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -88,6 +88,10 @@ struct dw8250_port_data {
 	u32			cpr_value;
 	u8			dlf_size;
 
+	/* Timing for the programmed divisor. */
+	u32			frame_time;
+	u32			frame_time_uartclk;
+
 	/* RS485 variables */
 	bool			hw_rs485_support;
 };
-- 
2.53.0

