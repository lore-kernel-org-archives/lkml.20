Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999403;
	b=NKQtFje8c0siItaEgUKU2kRv2QLT3lwZYajusFIyz6Nu9DiwcuN/+gxT5a06furTJcf5
	 9YkNU2/u0azjVqmwN+979ywqdH+vBbpZdB1qZ5/zqJvrt0bho/AiYDd7R0RBxNxrEP0bA
	 4Kq6ONll6ZdcHnwhd8ptsC8lmIhEIRDpWAkDUibPCy5vNpksEhUrgEz2d9mquwGZwdHqr
	 mypaqdRcmPVgB6YP1gXwQp9sEYrbGADNyHeUATJf91pkRAtQ/Iki4yyDVg8YeGXsjwEB6
	 O07gPFvVwuOWxUDGOmSC24kgcWCk8zgXSR9iF51hOApUX4cq0lYNNiLNyPU/NI9l4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gm0Qfj369v7uXPDM6N2vje8RwwrOggEoYcp57t3sBRQ=;
	b=cROezl2/liBkfDszvGeXLyE1q2235+yBEV7CYcRANqV7h2Po6uv8tX6MhjC+OP9FS+O7
	 cSwsIfohtw9j4ELC3hRd8EYQgCxmgI2kbYEEQgSofT74bAiimDNPfoccpJGEA4gW1t+p3
	 Kpjh9uOwXCbe2uEMlyX49+5/1qfQH3MXRKn9xpDne4qEaRXucKtKeFI67FbWdyJSJeuRR
	 U5zIGFrXdKjjBR2oGNeDkDv2NtHA7qHv1YIbm1mWrGil/2bkjfrqhymCaVVY+wt3hJObJ
	 zTP8iaCTzQtz8igQCP2DB2GPKuDUE9wJnTpGM+R0U+k8YKCd2jtku3HsgIaQv6IBN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbC9tHqi;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC1606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FC1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbC9tHqi
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1390947a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792999402; x=1793604202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm0Qfj369v7uXPDM6N2vje8RwwrOggEoYcp57t3sBRQ=;
        b=AbC9tHqiWLexdwdWZtIOTgzF2d8pLKJ1EObJ8p8mRtcbmiiDZNR9CpY+n3qXNWbNdv
         dZKwYY8AG3zY9khxWaWSk6TaC4W6O/BHPwf2MLL9GBcQ+/etbEDNjoJBO8pby5nxSOXC
         eDt9szoI+AEK0GlcKWiu3ctysnL/kahWgXV3n3Xr2O25PsJoZeRByF/Fth1c+Ylfopxf
         gfQzDfSX2yxqs5tNX6nmZeNwEBqAlp2dIJwCsVsB4gi7U2OBWc6BzxPsMa9KYD8zU4ng
         yA1AYAxJOC7weI6O/wWjpDVuCiFxzNOUPnH79kRdvLtmy3uuNAJHpDo9rTFakZCnTqPZ
         SlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999402; x=1793604202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm0Qfj369v7uXPDM6N2vje8RwwrOggEoYcp57t3sBRQ=;
        b=ySu04Sx6szfhlDvO2B92sCR3A98mcI/6h8dVWoGY2iKU7lgJrbJHtF2aYl3Y0XAmqY
         Kw/wdZEOMFs8yvE/miRkJ6brC65O00HrDeBOQdPu8CBAHxmHEGKEPNzymRoZ8k3ai83k
         Pr4aZ28mW/jS7tDfpBti47fUKJwBNu6Z3v3xXRf9su5RWNUH6xNTr/zTNM/gdKrYoh/s
         HW6bFEpd5zvZ61kGskHRevA532o4DEiCgssnkdukOtcycpqLTUmKcxaVlesbGgY6AD/S
         onHAoZkwl9Ijuz0z5UeMJoOOKtA4YEf1LC5ZZ1N9JqWYe2Kb4odooCBTzMp+Tge1wXXX
         u/6g==
X-Forwarded-Encrypted: i=1; AKwUvBxuRfBgleDflQpiqS0ioVPRi4i6TZs59+uHodEcRkIfPpxbQ5/kiYFNv5qWRLbSsf6AK9bW6h69t4Hfx0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgy/2bcpn1mEiXN8UZLZC6aGvse0Mtnd3YRz6Jg9S5tJpSDDzf
	0KJ89F57ezacQv2j8Ye04ZGgXdx0l/GvByQr9IdSl4mwM8K5qyfIym4a
X-Gm-Gg: AYBFou2+eR90P3wun1PrX/2t/3v47HYw7VMmvkUKQVtTedEDsnQvQmT73PMUsnfmDGk
	7niE+HzcJaKtnZni1rn/9u4DZ4rccoKGd+9Dqu+qMON3fUWIYV5NwJ0yLlKibhAsbskqcUaleAD
	yh0nyxh/0rT35uMct8HQOblwSx23X+g/o3DcKuubfpvP/k7fgVF4CrmRVQWPEUnR5ZbvVQivenO
	0WYQH1E3JSuIH6CAsAUX0XmMVKkWGVicLAPzDR5gqUdOFPiCcwz30WdfKYCWTpMgQem2FXom1yG
	GCsjUhlPFMguczPvUEg1u+UZKyYYDDmdCdgIX7hbZvqDboAFqE/0OQJ8YCbmxApU9qoOIfzupmM
	y8TeXvzl+IyyODjca8wX2DBk2c3e0s5yKnF8BXwdDXo65RSZW19icnX+FiNKCCgHXID+3KNONWU
	xKrablJFcpRVJQtONaGKhQS2b23xm6aTNdO+5b6RP/WBjmmPuB7PUJMZDRlQLvNO9OJZlQqvdSE
	sMErJ22fb6xJuV3qFptqlT+rPh7sU1IC8Zv4hLB1ieB0a+ZIbCMLDmRRau8+LxWHh0Y+VIdxfJc
	vjBZV4y6gHG+Ko6IylVcya7Ihv9eX0AzHBjt5TSTV1JFyNdliu9Zn6RgTChXBd25JadjTIgTwox
	HT5WHa2nWgorewtBfgtf89iN89uw/GEpRy1k=
X-Received: by 2002:a17:90b:2252:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3adeafb596amr5624976a91.41.1792999402381;
        Mon, 26 Oct 2026 00:23:22 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm7112987a91.4.2026.10.26.00.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:23:22 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Subject: [PATCH net] net: ethernet: ti: cpts: drop stale events before the misc IRQ can fire
Date: Mon, 26 Oct 2026 15:23:14 +0800
Message-ID: <20261026072314.663980-1-alan.tseng.cs@gmail.com>
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

cpsw requests its misc IRQ at probe, but the CPTS event pool is only set
up later, in cpts_register() from ndo_open. That is fine from a cold boot,
where the CPTS comes out of reset stopped with its interrupt masked. After
a kexec it is not: the previous kernel leaves the CPTS running with
TS_PEND_EN set and events in its FIFO, so the interrupt fires as soon as
it is requested and cpts_fifo_read() takes an entry from the still empty
pool list:

  Unable to handle kernel NULL pointer dereference at virtual address 00000010 when write
  PC is at cpts_fifo_read+0xa4/0x3c8
  Call trace:
   cpts_fifo_read from cpsw_misc_interrupt+0x30/0x4c
   cpsw_misc_interrupt from __handle_irq_event_percpu+0x74/0x378
   ...
   __setup_irq from request_threaded_irq+0xbc/0x170
   request_threaded_irq from devm_request_threaded_irq+0x70/0x104

On a BeagleBone Black the CPTS registers read control=0x1, int_enable=0x1
and intstat_raw=0x1 in cpts_create() after the kexec, with one event
queued.

Mask the CPTS interrupt and drain the FIFO in cpts_create(), before
either cpsw driver requests the IRQ. cpts_register() unmasks it again
once the pool exists. The CPTS is left enabled: clearing CPTS_EN at this
point made TS_PEND_RAW read back as set, which would hand the handler a
bogus event.

Masking alone is not enough, as the interrupt may already be latched by
then, and clearing the wrapper's misc_en before requesting the IRQ does
not help either, since cpsw_misc_interrupt() sets it again on the way
out.

Fixes: 84ea9c0a95d7 ("net: ethernet: ti: cpsw: enable cpts irq")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
Tested on a BeagleBone Black (AM335x, cpsw_new) on top of net 7076f684d5:

 - Cold boot from U-Boot: probe and link come up and /dev/ptp0 is
   registered, as before.
 - kexec_load from a kernel without this patch into one with it, and from
   a patched kernel into itself: no oops, link comes up, /dev/ptp0 is
   registered and its time advances.

Without the patch the kexec'd kernel oopses as quoted above on every boot.

Not tested: the legacy cpsw driver, and Keystone netcp_ethss, which also
calls cpts_create(). The CPTS_EN behaviour described above was only
observed on AM335x.

How this was made: the investigation, the fix and this description were
done with an AI coding assistant (Claude Code) driving my board. Three
earlier attempts (clearing misc_en at probe, clearing CPTS_EN, draining and
then clearing CPTS_EN) were tried on the hardware and dropped; the register
values quoted above come from a debug print added for that. I have
reviewed the patch and can answer for it.

 drivers/net/ethernet/ti/cpts.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
index 2ba4c8795d..3cc908ac90 100644
--- a/drivers/net/ethernet/ti/cpts.c
+++ b/drivers/net/ethernet/ti/cpts.c
@@ -747,7 +747,8 @@ struct cpts *cpts_create(struct device *dev, void __iomem *regs,
 			 struct device_node *node, u32 n_ext_ts)
 {
 	struct cpts *cpts;
-	int ret;
+	u32 high, low;
+	int ret, i;
 
 	cpts = devm_kzalloc(dev, sizeof(*cpts), GFP_KERNEL);
 	if (!cpts)
@@ -779,6 +780,17 @@ struct cpts *cpts_create(struct device *dev, void __iomem *regs,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/* After a kexec the CPTS may still be running from the previous
+	 * kernel, with its interrupt enabled and events in the FIFO. The misc
+	 * IRQ is requested before cpts_register() sets up the event pool, so
+	 * mask the interrupt and drop the stale events now.
+	 */
+	cpts_write32(cpts, 0, int_enable);
+	for (i = 0; i < CPTS_FIFO_DEPTH; i++) {
+		if (cpts_fifo_pop(cpts, &high, &low))
+			break;
+	}
+
 	cpts->cc.read = cpts_systim_read;
 	cpts->cc.mask = CLOCKSOURCE_MASK(32);
 	cpts->info = cpts_info;
-- 
2.43.0

