Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AC443E44
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194791; cv=none; b=IOpXr6F6TwbPi0tk16LUFo60CHvZHnqbAIZxf+IDHf77nwwVC9IxRck80567OCD8wpitRuQd9K/Y4KepawbLLJ36XI6grnI03vwk9Vrw68w1Lkp7oEDNaqyaY6Yl1BYJg+3Tgyc8N8+FnTUDU3s6J09txRJ6s/eqBVjDq5g7CK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194791; c=relaxed/simple;
	bh=kkvQVRadmIQGTvKLcaujad4OYyUKVMAdBbtxh9GnyQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDBAXLYPlG5XreyfNsSTtWrf0ovhvaehmQ73u9XCDiPbW0jIspLQANprwKCUUfGp2qCqh1cwmDGSwQoI5eiHcAdfDwTKJoLXLJZTkbqnSdi2NxyOvkcyDtvQZ8C5moJvThcxhBkBOLf4vIMD8YqP0pSUnaGmxJv5x8bOQpg9jwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=huoVvb36; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="huoVvb36"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e32f913c3so249170466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791194786; x=1791799586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsiKtn36BJ7XHGErl6qttUUVPC9Oz5hd7o1Pd38Jb+I=;
        b=huoVvb364xIOAJ1XugGgrmxW9z9ErIPIYiUqeyitofQqXnLoh1DVSyY2qbg7MGlVfx
         Lb7tzEgDjILZnCabRDcKwrTP5ABy2jr9jcG9zEWkZVnid9RLJBiCHeYDuq4UB3fxRgb1
         r+dpvjSbwdF+w6aibdf0AEr93FTWmrsNlhzOG3nJ9jrmmqaUuZdiqa0Lj702y9pbXZTf
         ESwlc105MS+bxkjx7sW4asb7DnmX+JbXT6QKVvz6EszHtwV8viMrmyGYtE8ir2X+Rp/v
         cD6zCl3xJT7bRz06IEQc6cMj404N64u/iIJ1fuW26+AAPhkoiG8pu2e5m7t6GRdF4fE9
         gxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194786; x=1791799586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsiKtn36BJ7XHGErl6qttUUVPC9Oz5hd7o1Pd38Jb+I=;
        b=KFL0PbnKDq5ms4Bd7aKWHO0+2/VscddAioma1vZdj77IwyHEWa6ue1RIqRvN/aqjeD
         kJeSYSd58ywMWdS8Q7ohgPKgMBPQGw2ud8NJT9ktjDiOZkun7B+MYAAMJHttbJfr13Kk
         J+8tha6rtX4jfQoQyM5dMhqXaUrry9jGP//JCoalbICm2JW65JNjwQpMg/eNOySQInhm
         dbxBiBajPynIeGa5Kd8Rm5qRkT2PHZqn7AuIAfDLxFFP+q/b7iyJ1J65xmRA5sJg8qcw
         VmlLwbPiG6l/kpuAIqm48LU9I6gAIWVOF2EJHcJtfbqZGLWNVsqNQUC8CiJPjBxuetTN
         CAbA==
X-Forwarded-Encrypted: i=1; AKwUvBwAYH6iDXI4dOnGCw1w28PKoPDPdfDah2f9sGsirSih7wBPpnkPt8EBg0C1H4ijeVGTMAme4J/5Ip/0ygM=@vger.kernel.org
X-Gm-Message-State: AFuF++kxL1D/LgFlpslpk9lgzKHVSGREuiFi14GcRHSMiXju/x6jDfBQ
	+B+o5aTmyg56Rj5yTttdDj/DODEHMk0NhGUJ28yjAt21kphspeI4qwdN8MW8L4vhozVbr5UlWjm
	/RPAL
X-Gm-Gg: AYBFou1uuHXOfe0svVYxqKH5kx/osFMpUkhdoAJECCO8CWE3zov7x95EHKVbV9jkJFp
	er5jZwjUGYV2PfrR7FGawSUMTPjscmWcX1fwC1zL0sSsNauyBnhiJ2i5YtjjMkj8n9cFQiSBknt
	+BAmX6iVBpbH4jAy1QWbFOQFUbOr/0WInJDSvg7G+e1r95qk9vZU2Dmn1FVwCSwyRSOCt6OUTbC
	qzaw9gfO491VsdF0Zr0ofQpxTNbwrAZ0WTLdQrvntdZVceRZKwenPIOww2MkKezhsYeX6cTq4ks
	apBzPYgVTqE+VSYJIoO3Bk2xp1YDXaskHDllJTHSDAOrMuQDRS/rCR6k5Ii2zWPzPxxMZksetBI
	2o6MPO7hbZ/rHDYrSMq95WYujIOgCHPzpX8fECpzwKZnLKKvzDt6+ViZHX7j5gXKq2LqFvuS5ns
	flW1kmvvzxDcQeIW7+sn7K4oCvQqndVTtT5BU4JcAJpLZScbwpoq+AusbhFNQNSBp0Q5BPrxf1K
	sgV1jtIZJ+03m987eG3AZPerlrELAxSOLDhIVk=
X-Received: by 2002:a17:907:7212:b0:c29:f5d5:5aa1 with SMTP id a640c23a62f3a-c2e4b295951mr836086766b.43.1791194786464;
        Mon, 05 Oct 2026 03:06:26 -0700 (PDT)
Received: from [192.168.0.42] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156360832sm50800766b.75.2026.10.05.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:06:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 05 Oct 2026 12:06:23 +0200
Subject: [PATCH 1/2] m68k: mcf5441x: add PWM defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-wip-bl-stmark2-pwm-v1-1-168b9dc653f2@baylibre.com>
References: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
In-Reply-To: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Add PWM defines for the mcf5441x family.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index ea01c7753b7b..aa925fac87f4 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -375,4 +375,11 @@
 #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
 #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
 
+/*
+ * PWM module
+ */
+#define MCFPWM_BASE		0xec088000
+#define MCFPWM_SIZE		0x150
+#define MCFPWM_SUB_SIZE		0x50
+
 #endif /* m5441xsim_h */

-- 
2.55.0

