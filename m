Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515048;
	b=I7AdMaZJQmX+vbW6Rk/WaEu7MJ28ZEwejRdEq/I1kcbMmNwn2zfMxaOTidWrb4jP/2tC
	 PpoAM3Saqw6UIcEXCRol+d4V+WoEcfTp2jhZhfV4AU+yC57uLET8ogGOSuCINQ67GCjDo
	 NqgnWJ85b+CJ0V1j/3V5kOmRm8S0FQpOmh9bvQDAyVF3IzKJazOW5XS+rCYknWvcvOjJC
	 kgtZVDTnx6GkNJVex6USJCctgh0a+gbYMBBIjT4CALGPB1qfh6TiQlHJ5MfIprXb0X+tK
	 TdIWGzETm7Tpkv29vV9pfERn+LSrq66XHOCZB/Cvdjb8IodIrQKD2H+mnJeNN0TlCgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kaRMUeDRl+naPmm3qUT+oBT7oJDOZeWGKzT1v2c6cow=;
	b=JES7caDtsG3P7zQavzkQeLd4Ch9ajyKy6QUGh6Zbjlg4Kl9sTiFqHFmAL+PGl7drFM1h
	 P+EVFzwLI+ipzEt4lThAOfxN0W4Pu1p97HA9Yql2zC/Y4jF9rNfkxkK41FO0W2ddnqebU
	 aM1XFFuDU05OOlWxaH6sFgxkAqDDq6+1JV0prEMJsGsMXX7aT8sf7REyQB3d51THXuRGN
	 TJCOLXcfvmTYIstYlRO3Ai7oOzbcJkRoComq0FghLIVIWieDGFKw/U+8RHdg/Jvrtp+l7
	 HrX91Y24/cWrLPz3dIBFNxGBaecSqKMeCUhDYkNCzj/zlF4bm21RMqWa/g73B953o5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VlN2uOp;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07F606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B07F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VlN2uOp
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5fb79ce82so13104135ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793515047; x=1794119847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kaRMUeDRl+naPmm3qUT+oBT7oJDOZeWGKzT1v2c6cow=;
        b=0VlN2uOpa2rBfHqz+P34UFeI4XmM/oV6fVJXakdvt5wrQMb1FoS5ag3HPzYt85TOH1
         xa6XLyiYexXf+CY0aD+FHXC0HjFxalWv0GNXi8z8taU/5lMat5legdx73GyDwsIa+Wwo
         FG00l+6/zUs0jtBM+nZTM5E9sXDhFmSCCyiIGoMmXxp5ge5Y3T5NAVBs54cjUpiuGSLN
         /W24FxFL7gLyTt5rkjN7e69qdPGzGQe9eTSDW7V3p0qGRYB3Urd3L/wtCdMm51jB8UNO
         w3mruK/a7WrXjU6mIzmjM0EO1DnVVHiyI/VyO3TVlvqWixy4dfvia1QSdhs9MYcJSrM3
         NAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793515047; x=1794119847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaRMUeDRl+naPmm3qUT+oBT7oJDOZeWGKzT1v2c6cow=;
        b=mGk7pr4+4W/DoaFYvj9vysWlC7XF7TBrpIj56GMbWu3auv/E/6hvvvFzBLkufmKwn1
         H4keBI0p3wvM1gIAHEuYkhS8LlHkQMG7E88vMEtKZnv/Xt06cEP/h/09LTVgKX7gH2vi
         /AARxKqI2mg8YIxHOqM8NiXC1y9BEENkNR7YbcMwqdX3vmrlMXGHk7RVDqgVxbuCksOX
         3NkioLjXiZ0J6WesixrsgNU8UGCx8W5weXDKm5sBTIKrp0MtQgIsdKOHAzv3F7DvRlIQ
         mKt6Nq+4kcYJ7asdOgpsE70vTTZioVt2lucLlqpvMxUWVo65e3xAQ2TuQKwcoEw2/FGo
         gMZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ1QiG0SIpRc5XnQXyMYLGI5HFl4oD28weV2LcEuoYC54mq9UyYpIwTLMNPCndfltV2a2ZqJOspHja7DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/y4sAEuAbIw4deIJkcc/CNUywetiJVD0myrC+nIH174poGGp
	0ZNmeJ3V5AxZy5pS+wGCF+ByMDX95hQ1T6sRE1c2gLpCyEHeLzxC+S+v67I9jKpg
X-Gm-Gg: AYBFou1kl4CW64w9wYn/7cCC8Vb94FIALRBZVMRtwKNmjYd/4eHGbZO9JRr0Ez3L9Ok
	Zt3XwXUSnXJDHJoBGr8RD5ESoXuagwKiN5MU2VdXUOZvb4YkdJeLFPJp7NArwMcR3NXWbhjUe3b
	6SwzXJMXFMHQtvHuytCrAvmGZdmVXJWDQev4M0a7jb/5gew38h8uhlbUXui2NwmAYvjLTH1a8u6
	F3TsUQehDK8OmFx5kD63Tmyi1BoNM2dqDcC7sDPM/DVw8wR82nBx+Td7PsQhcvbLWLcSF8IQih6
	PiTrnRk37vJJ8gHrJGkIcwOZhe8yxhTe8249q3HZf3dIiJQzIkT/5LLCc3fLSsmqFMT87MnEU83
	L7rPbphH5oTiVpuy7X50orQOmB7kgGHx+fp1ylTPlJ51Amou/fu+SEg/Ipuy0HNuvsykbucHw8Z
	WyjzSo5FcwQCkXb4LRW4eB+yk8iPHnIS42cMyGrJypElKNXU/m+nRouoIzGWGjSc2LTs9+qFIA1
	mp0J9y3jaGrij5HV28gcEnggdGfoXPI1Sts31xLtzgPD4ymYRBrqYxSJNkF60cBwLDNtQKXI7zD
	so8f5xnFyJ2ETDZehcPhOTPZ9C0HvsnsQi5JhD5Xcrq81lw=
X-Received: by 2002:a17:90b:268a:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3ae89769d66mr5583408a91.41.1793515047409;
        Sat, 31 Oct 2026 23:37:27 -0700 (PDT)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm5465907a91.1.2026.10.31.23.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:37:27 -0700 (PDT)
From: BeaCox <0xbeac@gmail.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH] mmc: dw_mmc: disable bh_work and stop timers on remove
Date: Sun,  1 Nov 2026 14:37:19 +0800
Message-ID: <20261101063719.88570-1-0xbeac@gmail.com>
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

dw_mci_remove() does not drain bh_work before the driver core releases
the devm-managed host. The interrupt handler, watchdog, fault-injection
timer and DMA completion path can queue that work, whose callback
accesses the host and MMC request state.

After removing the MMC host and masking controller interrupts, drain
the interrupt handler and disable bh_work synchronously. Disabling the
work also rejects later queue attempts, unlike cancellation alone.
Stop both timers after the work callback has finished so that it cannot
rearm a timer after teardown has cancelled it.

The analysis, patch and validation were assisted by OpenAI Codex.

Fixes: 921c87ba3893 ("mmc: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
Testing: x86_64 object build with gcc 13.3 and W=1, with
CONFIG_FAULT_INJECTION enabled and disabled. A userspace model of the
extracted remove function checks pending work and modeled late IRQ/timer
queue attempts. It is an ordering check, not a kernel reproducer.

No matching hardware, kernel crash trace or demonstrated unprivileged
trigger is available. Please review the MMC shutdown assumptions and
external DMA callback lifetime. This is an RFC for a teardown fix; no
privilege-escalation or CVE eligibility claim is made.

 drivers/mmc/host/dw_mmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index ff0b25d287..cc5e163ee7 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -3406,6 +3406,12 @@ void dw_mci_remove(struct dw_mci *host)
 	mci_writel(host, RINTSTS, 0xFFFFFFFF);
 	mci_writel(host, INTMASK, 0); /* disable all mmc interrupt first */
 
+	synchronize_irq(host->irq);
+	/* Stop the work before cancelling timers that it can rearm. */
+	disable_work_sync(&host->bh_work);
+	dw_mci_stop_fault_timer(host);
+	hrtimer_cancel(&host->wd_timer);
+
 	/* disable clock to CIU */
 	mci_writel(host, CLKENA, 0);
 	mci_writel(host, CLKSRC, 0);

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

