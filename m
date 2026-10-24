Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821022;
	b=UzHG9D5R+9fUDWovdJjQSaOpfgJXjUnfrt7qqbCqM2xKqIU73MpbdQu+lO4aptHQ4enW
	 BROtTJklutlV/xm96pSJz196bnOLfZhE46HoZXXkBNhsmZl/HErzqUAARzxNVGUYkkadL
	 fyWv9R2nqX9GYZhbh/zFb1zz5FCU1/GX5nixvk0YE6UbJ28bvQTY5NPzmi4TR3jj74/za
	 31hgsUs/JbBAcxmLzFFfJ9/nqhTdxKgfS1I39tjDHVngULoKZfEoc7VMp86O00v09aOfy
	 FZnkvucs5Lo9KOQ1yEBkqSsNGbznUOmFk/G9NxZqt6OgqzaM7e0uBHVVjF7kUaHGlIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=XEq7BJISvWrYZRawdSztbA3abkuHTD/bmyAUQoKx548=;
	b=BDDwNfttL7BQ85fTfRUPVSekZE0kG/RvygPHDv3VtgxyaT+qV43cWUY6TWFESB4MEO97
	 st2eUSQMMsZTHWp2iDs6CA2i/Hff7oiYh/JC0Ijg6UvnDkeaN9K4V/NQ0FTkXXel0Aiji
	 0buCqKGc80nPdnTgoExdkWP4Q3MSiRESYTdfm1Aq+NVpXSAlCVMJ4PBh/bupGpPoaBrHA
	 paKyRdPndk+U5UNU4ZWCZqeq8WxHCCYOb3HKp2lI4tG+VK6E75fPHIOlZfh3diUeTZGsk
	 P+readxt08y3VzPwSU3RCzTsF6UQ1e+FKxODP3T6oyBRcZXHxd56FtCeBqqhbCiUbyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ljsoYV7l;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB97606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB97606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ljsoYV7l
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-847ac7ccd85so959477a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792821021; x=1793425821; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEq7BJISvWrYZRawdSztbA3abkuHTD/bmyAUQoKx548=;
        b=ljsoYV7l95fh24Ei7MO1YbariBg9iLmsVp2HPUfYBhsZrTPhaLU58Qq9KAxUn+udIM
         4ygWHM4GsqWhCWu5HJeteywZ3teCPktoKSSH/bDTzIkx9bTFOAJtJbZ1PdEStNRY/RSC
         tnnjI8fnsJhfdlJ/i8J+nuVYrWY76U15kLWoEQyfouKZu54XlMRibjp3zUtEeIIytDs9
         5MLYB0uyZuTvYJa6jMjHlx943H31nKTUuQZszQ6n9CaeqsQomxUsDptpYGAqBV+8bkmG
         y9pwXXLQCVU+yNZBJS4nGxdL/dkmPLVWZ4enlSIIXrn4MMx2XCAED02JfhNnhoDPmBjc
         uwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821021; x=1793425821;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XEq7BJISvWrYZRawdSztbA3abkuHTD/bmyAUQoKx548=;
        b=sAqp3OjpLgeKXkc3BSjplTZIHqPpqzA+iUdzwNfCLaTYTJ1UMCqfgT4hYNqv3Le8iw
         3lJ/IsSJlaoaiXhDqjHEMm2+KQ+0BmTeQNA6mjklZkAPR/nKDQ5cE4XPVU2fiCVo2AD4
         uJlS3VJb9dxLCkb1AW3kbWKFHklKU/WUSQxwVrtQC25pVsmQdBuGpEGbagRgvPzKOB19
         k6uyWnAdfI0zDaCeGzTjqe3NH0JAD+7IepFpw+yOlUWJ+s1exjNRq613mavC+dYRfKvs
         Lt7tzHqU3e24JuS5MJMTUGIbEaXpWBjPBYS8eqLwfuWgINlh0NKWx352zyCDBTVmjNkU
         s77w==
X-Forwarded-Encrypted: i=1; AKwUvBxPI3gL7wEvnUTMH8uMMX8bHRqTq8jZzWVhtMlMb1RdmamyS5hA8nCmfJyhSxFw2v5cRlu7dnViisBxxZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPIjgwmswIrk5FwxrbJtK/8KR8SE14c/gat85QZiqEvyAniF+D
	M98DHIKM+4gfLagGTIyVhRNnS5tYozDY4wr1LpO3iUKq5lY/Aod1IIlS3i5+4GFH
X-Gm-Gg: AYBFou3NCQsx0YYmXWKj7uFDPTBNEeEnyCDIfv4j/NFqOpRsYsqYU1s/4r1PkyP4PQR
	fYTqZrTkTA20vJuyBzXwuHm5ypIl8EH6NeUV3nb86Lx7t6BYN2Zb6YQgaOrCE1jdY/J0dYQDiwa
	fQ5kY5GN7fbl4d0JWKkYChrqHe/8H9RWCjbyzvxpIzjQPDR6YMMSr/r1yWWT6CYtJXBQYW/M6wM
	qWUHMAl36Fy72QIHWCNzsaEM9OeTOu/JbsooYKBH6M3Kv3Ap4Ly0bpAtN7PVxh952XuNeEe3Hdt
	b/SSC5q4MxzfkyzA0f4dl7LhOkttDDLnSry6PNySFsDh+otap8AtAS8QrY2nZvEKz8Wd7W3Ebck
	jBDGf3Cu35vyX03e5amq6KluGrmKVnYivZNPW8GWqK1BcC/ZKK98zzSvAH9ks+xUvkXmtrSrd7O
	AadNBsM+dal3zZEk7LLaeeuEVL9MUDncEve5/CKAIfIk8jkddcqRL96SvOYpssPb9u/Efl+Mh+x
	3xkEH6U+Izxwuocvm6gKBxnuRKOehaZ2kTNDGgiN+xz9KyyMJZVWVEkHxVfc1QFmZ4OFEyO2emt
	WFehuJn42XSZkV1WO8MQfUpr7eWrNA4sHGP3m3g4P8j4F8k1QLWjFq1i11BnJeyjnxzzpyiznU+
	NuBx2A8maH7O5u15nyeD57M2BBup52cWH1iMgNacKx+lD3x0cMbAnWfdoLLmST5JvrdX8s15140
	G2G2jf90/rZ/6e+lQrlrGklSTX
X-Received: by 2002:a05:6830:4408:b0:821:c01c:2ec3 with SMTP id 46e09a7af769-850f81696eamr1208809a34.0.1792821021056;
        Fri, 23 Oct 2026 22:50:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc002444sm1460625a34.23.2026.10.23.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:50:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 23:50:17 -0600
Subject: [PATCH] serial: 8250_dw: preserve BUSY-safe fractional divisor
 programming
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
Message-Id: <20261023-submit-serial-8250-dw-divisor-v1-v1-1-f452d4bb1b1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1J5jUUSlCpwFcQiH5caQYqSUIqq3
 p0EFl680czzCpkSU4ZTt0KimTNPsYLcdeBHG6+EHCqDEqqXQh0wv9yDC7aZvaNRWmB4Y+A6nRL
 OEvUge3OkILQ1UDXPRAMvvxfny5+r40a+NG9rOJsJXbLRjy0q5bOvh5GWAtv2BY04vRCjAAAA
X-Change-ID: 20261023-submit-serial-8250-dw-divisor-v1-5f1689ed05a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Raul E Rangel <rrangel@chromium.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

dw8250_probe() installs a divisor setter that makes the UART idle and
checks DLAB before writing DLL and DLH. When dw8250_setup_port() detects
fractional-divisor support, it replaces that setter with the library's
callback. The replacement writes DLF and uses serial8250_do_set_divisor(),
bypassing the divisor setter's idle sequence and DLAB readback.

If the LCR update fails to set DLAB, the subsequent divisor writes can
reach TX and IER instead of DLL and DLH.

Install the BUSY-safe setter after hardware discovery and extend it to
write DLF when fractional divisors are supported. Program both divisor
fields only after DLAB has been confirmed, retaining the fractional
divisor calculation selected by dw8250_setup_port().

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Previously included in the DMA cancellation series v4:
https://lore.kernel.org/r/20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com

Changes in DMA cancellation v4:
- Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
  discovery, writing DLF and DLL/DLH only after confirming DLAB.
- Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com
---
 drivers/tty/serial/8250/8250_dw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..7b7dfad583fe 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -190,6 +190,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
+	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int ret;
 
@@ -201,6 +202,8 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	if (!(serial_port_in(p, UART_LCR) & UART_LCR_DLAB))
 		goto idle_failed;
 
+	if (pd->dlf_size)
+		dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
 	serial_dl_write(up, quot);
 	serial_port_out(p, UART_LCR, up->lcr);
 
@@ -651,7 +654,6 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
-	p->set_divisor	= dw8250_set_divisor;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -768,6 +770,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
+	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
+	p->set_divisor = dw8250_set_divisor;
+
 	/* If we have a valid fifosize, try hooking up DMA */
 	if (p->fifosize) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261023-submit-serial-8250-dw-divisor-v1-5f1689ed05a8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

