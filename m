Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927178;
	b=uj6k4lYK3knMsMDq1maPmaJdHm0MG+9DwhwyiWxTfha+Rqbi53nmz73kdMr22JHxDNPt
	 yVh2Axe0xgr1TRhnuvIsWOe8YtOmHK2CMnibaTgKKmj5g7Bmya4NGDqgbX41+G051sXSN
	 4SJbEr+BRlBOu/5hLQTDP07oY/IUdsXC5x5VpMiu/Xc+o/HmG8WrpQOUfhx9uo7TFnbjQ
	 v2yQx1QiVOuJpIi/0F4LDMQrne2MIHJPgnYyyYVnsAkbMmoWTTQF/CdvHFhnoWDvuUtuk
	 c4PDtHshuMF9v3cLOfezCwuwvMQRRZnDS2iJWoG/wbmYzFp1yS2b0ffBr/U+nAs2QwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=;
	b=XDrhpox0C8yCQrlqif32OGNlaqzre/Y0dhtS1JUmmobA8MOCIB27v937JQEJcWUfSVGg
	 Tyj6YsP15nqftgTi3MYqiQ7XP1I8TmFYcMv9K1KikOvk/UF2Od5xceoR5TyA7oZpXzJ6R
	 QKihaI5mbYgYl9YG0VZkaDoqgYtU5XX09ut7RYxR+b5Vys69lEsFnMtghYhfcxxwi9+Ai
	 hI64WoFDoJ+B+rtHnsqXr2DDzatffHAoD+X5eQADhInCzDX4dgxkJ2UOCFrkbYDGUurq1
	 SL7Hqqyok4WGe92xxtj2B2oxVw6OlIYL1djTjH6w8qk5OA/lNaI7eeuVcee8qybsmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ye05nwbv;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782D606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A782D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ye05nwbv
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c9cfd8b1bso1125676d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927177; x=1794531977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=;
        b=ye05nwbvjti7e8iBeIldA8BRklZC5Wc/5EyS56YLsrWp7mvFFxl9Pxz4KgIg6De4eJ
         oMBYn+c9rVX2/g9folCnC4pNxc+PM7uAK8+K118KvbgjBJHKCIMm+ygZ08lsAo6AW85C
         RR/YXMXPQvTPZuqtpzxZPXOpxZWmbqSB6uzU7wiDprKDq/OWj4ToP3dLq2k8bL9zPfhO
         BbnP0KX3XMO8LGoJ1gHOre+VLMkG1iU8turdDyZcNH243JrOrQ1Rdq/0cvDFq+bDpdGX
         9nubUSQ9UdXs0SfT0gCw65slOjN1OyA2nJhpXjRj96wZPQv7gQhWkVL8MJs/KDsjWlbX
         4GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927177; x=1794531977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=;
        b=RjEk2tyIGgF0xO8zDcxKs0obtBtWJ1rV8qruAgXLslmH0VbVC2wro0PLbBroaSOssQ
         cks9+0xyIa3XIAG3GzBPM8+xikq1bzkRFjYVyr2ddHzGJFLJZn/4j25S3Am2O3TQk+I5
         n2NxGT7WQrcX+Ksq/d6VAxOpgRWFx4ZPELJFSbVAkRpHfVsja2LCYuGPeR4wyAIcCyD5
         fS4bPcpZRNcy4h8z98Aiaz7DB+DjPon1fEh3FwEYsEb6G1K+lrVDKeoM+TDuvbk/k6nf
         +LVdIPJzzw07zxgrCmSXodWGA1waiSB9rAXOrADhld62id4OVXjR4QP/1Tk5qUPhPiMe
         wOHA==
X-Forwarded-Encrypted: i=1; AKwUvBxVDVBoWj89vu7GQFHSWqeBObvnOCgs4cs46ZwVhxQDIui+ikOCfiTsM0g6uKJ6dIeb5QsNTPc9FO2mtHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7oqZQDLJMYeAghkp2T4UWDq+ytbXLC6NoBrWaA74HiYz/OSVB
	vCdDb5Oqs7Yx4977K73/W7ijFuuduBF3Ho5DVc93GIm3R8vIFngc/cr8
X-Gm-Gg: AYBFou3ldx2v/aNiqllmQsoTOYjsflfTgnkVLEUYtkfcKrlMWujjHso6XtHOFiBpaIA
	c2pnwOKpc7b0Jil1AAqB1tWoYql53kMx3czO8lOBetN1g6JAzkYgEm3svYeFiSVsOJUqua/5GQx
	nJZmfcRyMkfGkji2GO/vTgEZW7WPB44eW8YqA+ke2doUXFk4GPv9u8Z30FdjnHN87pzM/jO3NDu
	C5ZEuvpUid++7ehp9XBa5vAu8lKU6wz63tY1P0J6Lb0/wjdgHtQzcwV/WOusJ7LJFp2OHX1IrsN
	UWU+TKd+PzJ+LB5ocxkh5QJ9rYlDxaaI9ASBTkbWHL0P73A3YfHh2bofFMjW8sQDd+5uuWYOz5Q
	n8GYHF6ICEg6lnFaSC5vwv164pzNzmGVSXZsfmsYP/sn2F+RpxPVLB2vfKzhbDqdcmD/u+8YFpE
	e7lWU2rBPOopG7rfG57WmEFALeuXGqH44v4bbKIpyHy4wmGhsIdioDq8R5r8E9QxM7X9a8RnyB6
	VV53goNHiJ7vQsamgV1TPZB5UwfSxZ4bxA1xHC7VkzHFqG08lt6t3ED6XpIhoj395aLjXY6E8r9
	VseIJFqIzgaMn2h1Cg==
X-Received: by 2002:a05:620a:4449:b0:93f:115:7338 with SMTP id af79cd13be357-945f353bbf4mr138733785a.54.1793927176554;
        Thu, 05 Nov 2026 17:06:16 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5c1ea1asm20043685a.37.2026.11.05.17.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:06:16 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe fails
Date: Thu,  5 Nov 2026 20:06:11 -0500
Message-ID: <20261106010611.1708587-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mps2_of_get_port() adds mps_port to ports_idr, but mps2_serial_probe()
does not remove the entry when mps2_init_port() or uart_add_one_port()
fails. mps_port is allocated with devm_kzalloc(), so devres frees it
when probe fails, while ports_idr still points to it. When another port
later registers the console, mps2_uart_console_setup() looks up the
console index in ports_idr and uses the freed mps_port:

  BUG: KASAN: slab-use-after-free in uart_set_options+0x650/0x7a4
  Read of size 8 at addr ffff0000018c41a0 by task swapper/0/1
  Call trace:
   uart_set_options
   mps2_uart_console_setup
   try_enable_preferred_console
   register_console
   serial_core_register_port
   serial_ctrl_register_port
   uart_add_one_port
   mps2_serial_probe
  ...
  Freed by task 1:
   kfree
   dr_node_free
   devres_release_all
   device_unbind_cleanup
   really_probe

The stale entry also keeps the ID in use. A re-probe of the port (e.g.
after -EPROBE_DEFER) then gets a different ID than its alias.

Remove the entry on both error paths.

Fixes: 9f25e07b882b ("serial: mps2-uart: move to dynamic port allocation")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---

Notes:
    Found with a static analysis tool we are developing.
    
    Reproduced in QEMU (arm64 virt, CONFIG_COMPILE_TEST, KASAN) with two
    arm,mps2-uart nodes added to the device tree: serial0 without a
    "clocks" property, so devm_clk_get() fails after the ID is allocated,
    and serial1 with a fixed clock, booted with console=ttyMPS0. Without
    this patch KASAN reports the use-after-free above. With it, there is no
    KASAN report and the boot goes on until it looks for a root filesystem
    (the test has none).
    Not tested on MPS2 hardware.

 drivers/tty/serial/mps2-uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 2a4c09f3a834..c39aa534b822 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -590,15 +590,19 @@ static int mps2_serial_probe(struct platform_device *pdev)
 
 	ret = mps2_init_port(pdev, mps_port);
 	if (ret)
-		return ret;
+		goto err_remove_id;
 
 	ret = uart_add_one_port(&mps2_uart_driver, &mps_port->port);
 	if (ret)
-		return ret;
+		goto err_remove_id;
 
 	platform_set_drvdata(pdev, mps_port);
 
 	return 0;
+
+err_remove_id:
+	idr_remove(&ports_idr, mps_port->port.line);
+	return ret;
 }
 
 #ifdef CONFIG_OF

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

