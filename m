Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045771;
	b=I9qjfzCo8LVxNdXiVTZ8yW7Hl0L0lIo0D+isF9R8C5Be5gyWDABPcVoX5sRX8u3nDVKH
	 Ooq5SArtpDz/bCCmKVh1R1jzPJEHTftakUSDDvGbxUaL07Ken0CAbLxA1MEcRjTwOFEok
	 aVX4IDB7ufuRmvtDWrvYW+i1/B+i8owjXk15Eo+1RazJytHJ6GedaDQAIgWhO48pcGaB3
	 EQmHJ3JXEHQ4221/JWDCb9B0mFKD3h6PmetNgfVmwLVCS/PN8yMRh66So9dA0W6iEONEE
	 HIU9CUVjfNzxHgCSrLRw671ZcJ5m8EmqB6NOahm3XgY2Ojuvkh/yiu6yEw5SvrnaUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=N2J859H+uWsojSkha9zezH8TJJ6OSnMwegHD1qKOF64=;
	b=PHGToj6/fQvqmeURS9sTGjYsiaZiOU2ISV6z3mM8c8pwxNvXJvGB5oLvqlJu8xtTBCxk
	 31tLCtlLVg4mssECaABJMctIop+9wV+X0lib/sjDG3gjRXQQfLZOFGMcWFQP/n+9MUoNA
	 VYTBHnhQzto2jijQw/2fqsjJtcwKjwpFTySRePSBJDKdFe+RdP6Cwo/PkHf6vcAe0tsl9
	 8b0rTouuoCaDTqACGPZYWYDmevZ6lA936but/8ybJ6tbz1IMTU8cIiqeRX9ob18/jOtop
	 36iZXW8fJoAGf7G4RJrNaf2s4HFac9IOjI1s62XwHqWmKwZTakWdlcSW3PiFvhXvXXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwDzbLFR;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474E606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4474E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwDzbLFR
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso741965a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794045770; x=1794650570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2J859H+uWsojSkha9zezH8TJJ6OSnMwegHD1qKOF64=;
        b=BwDzbLFRwEm//pUHT/71T3R10Z48hOxXLkQanXNmEMP3e7yH8k/yoBAwpcFgjW4WbD
         R2Ik4Dbi3HIh1w1ElO7YBKep/CfBTeIcKxofrcBMfwXsyDmSZe+ACOOd+rd7sppKs6vm
         o2NE54yUzVwiWuTlrKJDaKoyD9uqSDZLqaxwmMRdZmW3+jBPTh47wl5vtzCZ+dCIYRpM
         8fOV79WMXPFsRQL8vcs09QSBTyaNJZT10cPOSD0HtDVehu0Kxw3qYK+fe+30uwCD53ng
         m97+DK+DwFI+NeOniuMHWRGaprl+tqsM9I7ova4WtaL/z2/UOs1JMGyIYow6CjZb6E4f
         eXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794045770; x=1794650570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2J859H+uWsojSkha9zezH8TJJ6OSnMwegHD1qKOF64=;
        b=W5VHBQaPFBmSrI3LY8xSncUTkDU5fd2Geb38GPfnQQw8RZP5ZYnVZMfywkHegBVokT
         HHQAcfwOHQykbLH09Kn3pTfGHuXpPZ6WhwNr5Ezyc5J6nhV39lIA0NaDSJ2Pnhvrm8M1
         kxtTUr9AywKNPkS3IKQnGcJ1YrLyhynxWbfqZea+UTjlN/jj3w73w2G0qeGEMd56NzNS
         QEoIs9f3FDAt8WhHdJoxa+Hp6wVPESK3hRoQjeNGF8jch/xvB93J36+aTHAMFvUHBOfB
         UM5sC8JJ2+XqIfby4ICMcfI8Mk5UuxtTdh2vvUQTIeqDVZvU7HuEYLxHbMqdjJu+0ig9
         PbjA==
X-Gm-Message-State: APuU4Z8uHdRUvp18EeqTFNLKco9qjg90vtlITtKDTgz2HyrMZtyF+RlD
	tNdLZNOqv7NYP9LMJAeIeq22Fv9zHW3PnLvnEY+hKUCEsfRuozyGiwM/
X-Gm-Gg: AYBFou3oyoDQUmGJqGwU0kKT3cSjQPC95YDGqbhwKDcNFEPhD/7piPFix5597YFRlPq
	GzyFqCR9Y4DtctpuITqKsR9A2nTs7rxUMDG72MsE+JCuApFB2KZGvR0nWMOwdzBAZ4e4FiBM4qf
	SpSL9rubyJ/4qirE1aiTNNVRw7Ygef6pkwfiY6Wh8s7Elp5kxb7V/vpxNwGelVQzLUgS0ySvvm8
	5EgUMML1oqeBvuwwZ2Lyvm0eGDGYdbXfnPdlrEGamRBVqzcI0QtIjZ0xKi3Ncl9/NrRyelbz1c/
	IhFPMd7j53npUDMh1RifoYnfrlQ0mf3WwtIEk2ShDQrxY3kMpiYkX+/n8RBpXWl7cc14L1EFh8h
	t5jogU9FwfVl+plfOitrjqaGmdcWLXfVudRpuQK2Ivbq+v3xCE0a4hK6OXqZeuO234yDKxEsmr+
	6D0I1/WM5b2LhZ7sO1uD3cJTaSd9WJZd/NP2adjqR+Nr31ptMuwHUpP1ic1wq7zMmbxglLA/5Wd
	ycDxruhwSbjYsGFJRTPsh3vld3Jr2vOFJi/7Hv/zXvijBQeyN6NKXpC7BuuWhoUDQPIUzMcQaXy
	X/0gUt3QoEW6hKmWlWqR2XwGXnEgRlM/kqkA1IfJeIiZSe3+W79OYabFLVaWmxAOYApXvg==
X-Received: by 2002:a17:90b:530c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3b0db6f4c26mr4969368a91.40.1794045770439;
        Sat, 07 Nov 2026 02:02:50 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm142705a91.9.2026.11.07.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:02:49 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwrng: cctrng - cancel deferred works on unbind to avoid use-after-free
Date: Sat,  7 Nov 2026 19:02:38 +0900
Message-ID: <20261107100238.3542588-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

cctrng schedules two deferred works that dereference the driver data via
container_of(): compwork (cc_trng_compwork_handler) is queued from the
interrupt handler cc_isr() on an RNG completion interrupt, and startwork
(cc_trng_startwork_handler) is queued from the hwrng read path.

The driver data is allocated with devm_kzalloc() and nothing ever cancels
these works. On unbind, cctrng_remove() only runs the PM teardown, and
devres then releases the hwrng registration, the IRQ and finally the
driver data. free_irq() stops further interrupts but does not cancel a
work the handler has already queued, so a completion interrupt arriving
shortly before removal can leave compwork pending and have
cc_trng_compwork_handler() run against the freed cctrng_drvdata
(use-after-free). The hwrng core does not drain this driver-private work.

Register the works with devm_work_autocancel() instead of INIT_WORK().
They are set up before devm_request_irq() and devm_hwrng_register(), so on
unwind devres unregisters the hwrng and frees the IRQ first - after which
neither work can be scheduled any more - and then cancels the works while
the driver data is still valid. The handlers do not re-queue themselves,
so a single cancel drains them.

Found by static analysis and code review; not runtime-reproduced (needs
Arm CryptoCell TRNG hardware and a completion interrupt racing unbind).

Fixes: a583ed310bb6 ("hwrng: cctrng - introduce Arm CryptoCell driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/char/hw_random/cctrng.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/cctrng.c b/drivers/char/hw_random/cctrng.c
index 03401ee..138cc70 100644
--- a/drivers/char/hw_random/cctrng.c
+++ b/drivers/char/hw_random/cctrng.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/workqueue.h>
+#include <linux/devm-helpers.h>
 #include <linux/circ_buf.h>
 #include <linux/completion.h>
 #include <linux/of.h>
@@ -497,8 +498,14 @@ static int cctrng_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(drvdata->clk),
 				     "Failed to get or enable the clock\n");
 
-	INIT_WORK(&drvdata->compwork, cc_trng_compwork_handler);
-	INIT_WORK(&drvdata->startwork, cc_trng_startwork_handler);
+	rc = devm_work_autocancel(dev, &drvdata->compwork,
+				  cc_trng_compwork_handler);
+	if (rc)
+		return rc;
+	rc = devm_work_autocancel(dev, &drvdata->startwork,
+				  cc_trng_startwork_handler);
+	if (rc)
+		return rc;
 	spin_lock_init(&drvdata->read_lock);
 
 	/* register the driver isr function */
-- 
2.43.0

