Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763652;
	b=fdDSpigkn7w56Wswzd9k/blWG2Hlcs1jA61KfVD5ieKG0z+t/fZgcFRMM7YafhggWChG
	 l6xX6yiGXvQO6npdmrKNkr2uMTM1BxFSgp4VI3rR37yf+h/21Vs9p7bseFNnVbq3xHo/w
	 sssK5u1BAODkHhwx+YjYGs1kKL2OoFiZkDPv0l4SBNKEtokgSJJU0IGfFArnOmzGwfwyZ
	 SYe6Yl4NdoNVghvMuPxhK7WsAYNH+dt/yVZEigROyvjJqhU/FYGYjpAHem7LxBMuutXCk
	 RU6I+mgAGdDqNFfjXU2ThVRp0CAfWyOYpdS8F8NmoX6FRzuoKzaINqgh28H++xr0JIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CMahDvz56irRBx1gnxn2z3ZFzp7EgAuh+2+EepgNqPE=;
	b=yqGF9D/K+9QvuqOfY8hDnZlpFG2VZxDNTxZO+ASyWF5XpeBrSYC8lHeKCb6E9oRNyaCW
	 aWsQdzU9bxzlIMwj4l6q+l58txZidCVwJ2GpFJI87Li494rXr5X9x1YY/NOOSHTR+2DEb
	 15mjk41PYWMAhHtIRb0dCzzdZnXrTAe2/Y7xKSefi9a0Ln687JwcyDJ8NG5SvX/db9SC0
	 sN94G5E5AX3+2V7CJb1aifemRLVyXljMDPoPhW+euf3KSkSkYeTPDpckrSWhTuv2WvEWX
	 +nRstAez3u0jGHLHuapE4t9L9n3mWD4jU49FT/Wq768Ot1+mKbPxglsW+wvFN9ebc3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGC6OcUD;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B8606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71B8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGC6OcUD
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cedf1bd63so158036eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763651; x=1794368451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMahDvz56irRBx1gnxn2z3ZFzp7EgAuh+2+EepgNqPE=;
        b=AGC6OcUDUNU/d/0qxUBE5zKJIlD5Hbam+t0uwA7i/sctLwDfcezjgl30K4oOI+Nr3b
         x3Chnw51W7m+cCcydK4WAx+KukCA8IuOVy8zc0TxTXL1ohNbNrpRugrsq0gZ7swekkuJ
         SOyU//kcJ3/F9euRhbvNFFWaUsmJM/6po2/CS4KeR4+ypuLO6olSkOuCYy91jeBu1YJE
         mK1iEozmv5RBfnYOJcFFKs5M1ym7ZwuoiBJK5GDkLzTZF82qWtxMwAlGVjkfsH19DiQG
         qxPVFHk+4f694UdznnS0VvSTuYjeK1UDCzOJNxdoR8Twr1hRksuYqxjcW6fo7d6y6dqS
         2qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763651; x=1794368451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMahDvz56irRBx1gnxn2z3ZFzp7EgAuh+2+EepgNqPE=;
        b=gIVlex6pg5jX7jvWAlBL2FyAFCetz3ep5fv5/Ap9el6cI9LFjl0rGuUFk39KWs+88i
         YryLE+xmFn3dQ58xHn4T33G/9tJiyEHf/jw1LORLxRGGfd1P9yo+Yh2W3mZ0mcRCaey8
         wgjnR+dSvLUrYXwdElZR1Cf2YxRm1e+5JVME+JkU0vWSjHqo7m0DUJLhODTrV0q+KR27
         /gcbRW/xsYRTXdA7pAG+kr5VZaTG6Xq9lFV4DrKzr8pk+xa50dFHwMe2oHSWYoKFO6yv
         HW1B71DjIpAf/hLsfkv1Jjp+JvMA4q7sJ/chLeJOJWyBUjtC1+KqYYr+UmGq176pv8Np
         EXQg==
X-Forwarded-Encrypted: i=1; AKwUvBzaLabtiHa1+rcAxjLBTo6aUq/LAIr6NlMhFkPF/bS4iRjq+cMAMUzBPZ1Lb9Yr9hapox2w4L6VZlc/hC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kTNAA7nLRjk1y0DoJ0jDRtwZAiNYNVBQOKXf+u1uScq3tQ/nr
	BqoZBqGKtC2gy3+WRuEs7V00tIMsz37E/6Ghsb3OIuAjKjoieIeg5QCyzyTETdQl
X-Gm-Gg: AYBFou33lYDRaX0QFuQxl/R0qus1+sZpcvfNWRoN+jJWax4PrtzU7D9pOW6yBjVU85c
	wtbe/fQPvOmOceB6TAwffSHXPHk0h4R2m9JuFDWUTY2BHcmgg/CWJ1MRBQYJkhn3v/Q8LNoX7yU
	+4vcLAU53DHjv2MVWfTvXliZlyg9Fa4TWMYFjqAduUJcIqWcuSTBB3yZlrV5QTucoWpP64uNR/d
	ZWdYwJoBEYkgUoi5JBeOj9+mOmuRD26kQxvLWEoDpDLxBeE06/E2LfdsGzGcRuIpG3r9gq/DRKN
	lEtCCW7rqErGNZV+ORGn69kWkTUjb9zE9xJp0UA9d1wtGXF7mBLgz+f/SjLU7V0C8+ykg2jG6rG
	3rqN72/S1ZfZqhDkYOXkJkwJyBeJyRZaTvHE1ESBpThshIzthEELUmpVDNOQ1AxnTKkPWsO14Ar
	gDQxKBwQf1mtgqQvj6ckjMPxX8E3nUPGRNp2CU097aRie2b5zBTExLoZQiQGSzkxlgYCI9FV3OA
	ebnggaFiHsA9ctzPYuF0d9dLgflP/WRgWFRafXzZE7eMVaut3ZxrcSXiEq8Qb2DMYNVLex7BE44
	oLT2Di0F6UgYAQqbXKpvKMMCbDiiKvdA5To9cy57WRfWpdAftws+vpgMh5qlhBtFTrfmJvm2u9h
	z2IOMvmUzX0+3vw23
X-Received: by 2002:a05:7301:2ab4:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-36ca26f863cmr1639630eec.13.1793763650582;
        Tue, 03 Nov 2026 19:40:50 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:49 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:32 -0800
Subject: [PATCH v2 4/7] gpiolib: add support for scope-based management of
 GPIO descriptors
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
Message-Id: <20261103-b4-gpiolib-free-v2-4-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
scope-based cleanup of individual GPIO descriptors and descriptor
arrays. Place these definitions after the CONFIG_GPIOLIB check so that
they are available regardless of whether CONFIG_GPIOLIB is enabled.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..ee183a97575c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -578,6 +579,9 @@ gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 
 #endif /* CONFIG_GPIOLIB */
 
+DEFINE_FREE(gpiod_put, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiod_put(_T))
+DEFINE_FREE(gpiod_put_array, struct gpio_descs *, if (!IS_ERR_OR_NULL(_T)) gpiod_put_array(_T))
+
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);

-- 
2.56.0.385.gac671c819a-goog

