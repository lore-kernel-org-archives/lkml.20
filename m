Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829611;
	b=Q0Re7E3R6LE/X3Sst8uVBf+yDFKrUsruSBfpy/sS9qboMCpWhOduvi3MVSyPeprqcWne
	 dRYEtjXqlc3SjGlElKkc8uxTd6b4KWwFuSGbvQ5SEbk0T9QdFYSHlzQ5xtWm11aisGNM6
	 dvpINTjBpRuhcFkjECknL/Hki/QIlwxH1X0ncBUJjpFhLyMBObCWZOVSyV1h3hVnxfdPh
	 HYRqHmtW2K0OFQbaceTg/vQiLDusdf+COn4p4+Dy9be96no99b+eSEEeU9wKTpoB74aE3
	 J0FlD9lb+/aWBmK+Vo6F8MwMM992fNtZcqouQSUoN4nFd/p5rx47H2VzqZQp30n+CIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
	b=PLdz/ALmMdyjVKbK30n/tF/yF31hlzNXAzpEXkEoiXkGJlNCItstIUIPs4hr0xlv9xy7
	 QnwVYTbTf8IA+LiejFNDLx+IAIFa2CIrg6+phZR9y7e4uh9zYvXj5yy2453Rl73AKl26a
	 Ar4C22xD553u1vU0OpIMV1GM3TOKsjJGbpQ7FjNB9SK4v2DajdTuZC5kLwgXImyJxTfBV
	 /8OVi50JoyMBtyVAZOVZUEspRkNXIHtmSt5Lc+8QzCP5tiP1K2y0hYggSODLQ6YTtBzvO
	 cPBgecrPDPkfMGE59bpbNXcQ/axF4Jo/gfMB6aM8RHqJho8b4BqLysUPc+P2gZGr+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeGScUN8;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4670608C98B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4670608C98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeGScUN8
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7931675ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829610; x=1794434410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
        b=ZeGScUN80PuxzKBUlr8/JsvzQ4C1zpUcqA3TujEeuGhilC7DZmkCGRhiIkwXlbjB0c
         4SLboKrFTnth7bDKO9THsZK+IvEwvdeWE1RB7hEy/t61k7Qi9xTeV8oKAzAP8TV7Kier
         xvZzBgjkUMb/BN96hJeGdi4HHlrJemiA1EL6kPUEf0MkAXOXWTHcWbN+M/NV/q7Lwewi
         7m51erbLtksTARPCtzVz8a1F8X5Xmon0r8J2azH3usspnLfxoU8DPf9FpoBiwZ1KNCjG
         rsJWljlilE5ArqV7+BO8OaVFAKqKG7UQQSAo0II3iFIXdqW51rWXFgCjF956ZL9RY6mq
         x23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829610; x=1794434410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
        b=G3kcwa2nuoKXScL4vewpg+qvDg+DUYequl73pMy0fkWXeXscc9JR6gqa8rxkI74Sed
         ATLAAJSVB18m5DabS5z1Ggd7fkfmS/B/zN6InCz+fls/dDMcGfKKgT/7zbxfUAjgEA6U
         /xTAJkWHYmIuWweG7Uuo8BK1oaX/Bc4Q6JUZ4H1G34j5sZUuC41wr7ycud/+iwjLyZki
         VkTC/KCawGQCrli626hJPiXdDhgadWB6tUCV5fUMk1FGcdDxzln0SdjAKnnJIhZv87y2
         fgJCBOHV+ITcG8+kfDX2SC/2XvJEIltUYl1ffs7Z6irRZFhzxsmZsumfI82FINMLY/qM
         mPOA==
X-Forwarded-Encrypted: i=1; AKwUvBzJtEuT90Ljf++11mZAXvdPgyOtfUxiYt07Mdvt1VpSLAALtRfkoXGnH6eYKdA0VleqRSETz7WUhdZZ+wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KUw7jq1BU6N2xRyoKk8DJ8WsXAvTMbLDEHZAtZfE3grna5aJ1
	OThqLW0vd+ctrxj50oTgnXuGlg2utmcK+vlIF5GT1T+wkHIUbkXSq8zkvPGGcA==
X-Gm-Gg: AYBFou2w2ymfQqaFKiE8GSoMSvNvlqXdYgYiGqf75qA2nEQ0Xa0mtynMoDVTpPt/i6l
	fTNeE0+qnVQ5WfTxs64fwuj5RMk8dkNTTrTqm9mBs/v5oYih0VZFQz+hj04h5PDzswQVpro0rHz
	9pXUHfPl4heZAT/ScmUG8kXo+6m6GKImoErwUrhukdUaV8XGpwv6T7O1KrpOr6Uaky/cSchjAD8
	sxQst/IiyMAbCNEGMnrqVxCshVTLgOs44XvXesH+LFYVvWUjxRkDjhtrdv7as0EHdBFlxzAfBlu
	T6hGVSB+qsqLgcwCZ0hnWNXJvtOwTuEgz1bxyR99WkRC7qrKtt3/6MX6N5bqTmpy/LDRbh6WUgC
	IydtWfY85oedgIicxDL9fgMwmgicemL74OdRo4ieEo/BxCrejek+H1k6TCdR1aN737pH1auNKGq
	ORWM8WpnWRq4xyGqRFgJ5cwgNoPpuP5F+NlH/ssAi0oQKaDcNQ1qE+s1q/aSuzdtYj1mkghOjvc
	tAfZFNNKkes68GOKxShTc5E9zly1s5fnCoabwDjMWfjnrgez0Z0441+sYxWCQBOpERi4sWwvyKN
	MvZXYfvVjJIj0JE/K3YWHJ6AbR4jyglY2twSwl7JeyZYXJN4v56zUe7EgskFvDQcVMl+Wxj06Xm
	7Le2raL/SxUSnamPDjjyguPfmqp1aXjUn9ogO1Mjw8fYj0F8seKROIzCM1fzLfbyAvM67qyBNYH
	HVdA==
X-Received: by 2002:a17:902:d50e:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2eb36430011mr137628485ad.23.1793829610082;
        Wed, 04 Nov 2026 14:00:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:08 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] gpio: ppc44x: use BIT() and GENMASK() for the pin masks
Date: Wed,  4 Nov 2026 13:59:58 -0800
Message-ID: <20261104215959.24035-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
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

Express the per-pin masks with BIT() and GENMASK() rather than
open-coded shifts of 0x80000000 and 0xc0000000. The pins are numbered
from the MSB, matching the bit mapping gpio-mmio uses for
GPIO_GENERIC_BIG_ENDIAN.

No functional change; both forms yield the same mask for all 32 pins.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 20b3e9ce48e8..8b9ea00f170c 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -9,6 +9,7 @@
  * Author: Steve Falco <sfalco@harris.com>
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -18,8 +19,9 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 
-#define GPIO_MASK(gpio)		(0x80000000 >> (gpio))
-#define GPIO_MASK2(gpio)	(0xc0000000 >> (((gpio) % 16) * 2))
+/* Pins are numbered from the MSB; the select registers use 2 bits per pin */
+#define GPIO_MASK(gpio)		BIT(31 - (gpio))
+#define GPIO_MASK2(gpio)	(GENMASK(1, 0) << (30 - ((gpio) % 16) * 2))
 
 /* Physical GPIO register layout */
 struct ppc44x_gpio {
-- 
2.56.0

