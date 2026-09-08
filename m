Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13245221DE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860466; cv=none; b=EmkQwBE8zOtVgokAKUoLdTpMVFQlcP6eEHgM6KBaKpefhWK6B0Tl/h6/mzW+AMFwS/XoQIvtrTtKG52q88FhdH0EoG73ECu4OytaVyJkerX+RNdBFvQ3dvCobCKuq8+QSeHI+ABbS2ufYTVA5rVeQ1iM6YuevI9kzsdn1n1Dw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860466; c=relaxed/simple;
	bh=llnT/Nhi0T0PSHQzd9OBlgDGZy6ViMTn3F2kEpxp+Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SstuMIDZfkbesHRdqi9AWnT0eLpEWIucg8OOgEIzulyG+rl8X528GuFJFsNN2rzPRZyrNRuz4tu1VkwQLmKKB4XanOTJjC34ASbp+JaQS7xqEIuamIGYj2Zs1tGuX4B/8ExbMLkICY1VVmJNIrPctoQ34UvZpTymw3/FnfntdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2SfJfsr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2SfJfsr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so50198165ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860463; x=1789465263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXOoZtg2JwC8xSALXmsKi6kXLvJ+n3TB4KwXOFfrD0U=;
        b=A2SfJfsrsqjf7txyXkQU0dxC0n+3Bmc3merB9CWuYJsmFgasxJ7vJBPQYJlFtRzjXU
         2DTK/CsU78CniBTn+DfZbWNaKiAUvVrN1JvgN1tVeZEStXQwsBa4wtpXDit0zVROpozD
         KcOO/67ze/FNa1T2vICLLGkYx7+N2eJcWw8xSUGC+afwCJu5tfdEJEuE4fEb/OPX6Tmt
         2tm2EA9HkUAuPC5LuIO8zMG3P3J0TNOlQGS0h20RZSt7WVlSR7HJxumeFBGUkycTDqQk
         dIYYcWp1ADa6VD6iEh7rmf992wtUicRlzc+OeFIOFbrxmV21ag25BqC5s1c9/4HxxZ0S
         JQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860463; x=1789465263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXOoZtg2JwC8xSALXmsKi6kXLvJ+n3TB4KwXOFfrD0U=;
        b=OWSMBzHwBsFBxny6eqJ7329cD8Ao1CkA1pIT9waAp66XSjHlG6Kc0rr7IodE39ZA7x
         FxITkZhmBAsagyqO55ZYrQlWJqeOEcLX36uowEH0yypuLeFWwzQaZk2JNf1H0ymrS/nO
         vZzQfqqqvhuRfqKMK59r7tAr/Cj76i/FvD52xgBSE+4C7DM3vWiBX6uWq4py24ayXhF6
         00t64Kz8qIxObinZ8p6kPpBcbPHO/m1pu4NwMD6JsKo/rG/DDpbYJzejRqYWYKQOqDVV
         axuHO2qhL9BFaTJ62ZmGDFCZkccT6ofWX/24tDQAf1fJ1Zl0JokVtSThXWtwC850rOY/
         TpqA==
X-Forwarded-Encrypted: i=1; AKwUvBxXQ+81mds0Ty8WI/YqAFDJno6x55dup/qMP2qLTdrctLr7m5i+TSdcAr3IoP8QCSWYLFarjxtFHxxhUdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mee29VrYM30O1EjyR+i2gqkCDboT6ZYFF+6Z/e8MVCJb0eg7CU
	dlhhnB7m9aRU5C5oHuVC2Ksoph5pvD2ZSsIqGAiXhxAhxu67QAC7M305
X-Gm-Gg: AYBFou2nyOfIcZftsjrzXtlxdFKuQU4UxhTXEpdr6pCQlv6vebHQke4LtD+3P8ggmG1
	qHnoj7QtqotHTadCpu+4tuq58qmdppuSpoiiaYmj8jP479qMwwGZFRxtS+YnA1XuhU7wWN05Pss
	eRZqBONCyariZgmYP2PWOA0rb7eNLMlhrRCxMGVnz6NkSBuN1BkMW6W9iYOX/EcaNRMPkM8SEHB
	2e+GsbmO0TwDr8zr+Qi7lLMnthvMsEqcmplPklT4iC9uxhrk6FCxYl8kCQ8hpYZ0wUbaCYnit3Z
	V3p5VP1YjqLNehSkv2dJyeJ90oa/0Q/PtuLQURSxu/I3WOEEq/3GJMesnC7gbv0Pg7K+52XfwuP
	Go8NeOIiA46Oqqf0kiSt1q8N2Md1HAm6GxioW4QqXjzmM1xMTdDnEW7uP2UCYUnWOTQszLMdBHB
	EBXWFsqWIMZzLSkhkb1LD5ZkqZsDa9VslOy5hkmU+/0du4bVMmGlqv+G1LFrXOzIGh3YdZGfP9z
	kvw3Q+3kXTwarZ/bgcSBlzACkNs6HQ7BYdSR5KSOmvOYnhWmX5WfnS+1mg7cQgdAy8=
X-Received: by 2002:a17:90a:e7cb:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39b2624a3famr41207276a91.17.1788860463271;
        Tue, 08 Sep 2026 02:41:03 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:41:02 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 5/6] m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
Date: Tue,  8 Sep 2026 09:40:15 +0000
Message-ID: <20260908094016.1997918-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an irq_chip lacks an irq_eoi callback, chained_irq_enter() falls
back to invoking chip->irq_mask(). On auto_irq_chip and user_irq_chip,
this leads to a NULL pointer dereference because autovector interrupts
are masked via the CPU SR rather than dedicated mask registers.

Add a no-op m68k_irq_eoi() callback to auto_irq_chip and user_irq_chip
so chained interrupt handlers can safely attach to these chips.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/kernel/ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..731d04ac95bd 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -33,16 +33,22 @@ extern u16 user_irqvec_fixup[];
 
 static int m68k_first_user_vec;
 
+static void m68k_irq_eoi(struct irq_data *data)
+{
+}
+
 static struct irq_chip auto_irq_chip = {
 	.name		= "auto",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 static struct irq_chip user_irq_chip = {
 	.name		= "user",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 /*
-- 
2.55.0.979.g7e5102b832-goog

