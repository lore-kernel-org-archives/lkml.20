Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793476585;
	b=qp1aZQpTwwNFxIw5IN7PQDMEksJFIcWkWnuh0EAniPYxrSqabB2oNPs/EvzJy0RL5LSj
	 kaanU4tVPY8EwxAfbLYuCGBMCnbH8NKI39ebPrk8DHc9MifQ7xGNhTQZshsr9SNwpC41u
	 mYWXLV/4AjDzWKX8ZMH31he7LohxXjd165vWs/5Hk2g9ewYopUWWlr9KtkxHKKmrI/gAD
	 mKFhaank1rwtb4JP2bk+bY2GOLnGL+VReA1npxb2q7T8VzkGhhlc9J4C8hTwSO/QqNQy2
	 Wa/7PADETrRr8R6RPhC2oN0Hpmb60jxLJp/M/BMnkiCkz9/dv3+uF7Z0hgLmzb47x7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793476585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dwrcbsknGFmVz4+ZF6mDEPtgchjJAiKOuwaGvt8CwOQ=;
	b=fy8R2n4qlp4cAMNt2+jTORWk/H8Fs6zFBttx77bCdj6M5KIlOR19SX+7tBRyOQIBEU3g
	 bzZZ/VQL2nwwmwUXTMU22CJHuxbDYhw/d6CyqUV8957SXHwTeSW2YuK1NXswWgFU5f+Yn
	 /BrGGrEVuTbgI/rwDd6YNktQoOE7u7+9hItaNjN2XH4Kot8Vkr9d7lSakOA18PlLbZFIz
	 Kw9ny3ZxuY6dn6qjfBPAQhEhueFNSCdQ8pOfk/Vq+vTxWPF9lKdEMRxgxSB3pTTxuIY7I
	 CnShn1k1KuT871nYX2XIiAb9BGmrO5mhowacDJbySn0ccyb+BOsQTI7X62ET+QVKtTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cqfWuiYY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89BB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cqfWuiYY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15404285e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793476583; x=1794081383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwrcbsknGFmVz4+ZF6mDEPtgchjJAiKOuwaGvt8CwOQ=;
        b=cqfWuiYYDKmcg1zu/PAZdCgzRi/i9VRR+mMiMAGlbyBGA/DJrK6hm7DpD4BvScsYcV
         Pc1EzTpWYO7meduCu5DECX7Iw+tdWUoc+jiR0zEDEBU0W7jyknB32GOlZPUQAAMOgcG8
         UD17vwfsn+TIViRIwHrlCQcbLu5roIv0JiBW1Hl/Km3q3w4eFd4UyVSKNwzNZGazqv2I
         hcjzNd1shXHFaLiUrONE8Vy9/SOhVUmTAIybR+kAFEie2XjCAeXkRjbN3xnvHTjW/SWS
         yM99KoZK0UvQHD1RkJDL0DTCEI5WuEDjq4WSDL5ZOsqPSA4D/imPBpOMj24U4curNn8O
         OIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476583; x=1794081383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwrcbsknGFmVz4+ZF6mDEPtgchjJAiKOuwaGvt8CwOQ=;
        b=ywZv/fa+tet9NQQlKhj31p3a1dySTB2wUJ9Sh29XUxQWgyMa1D1bG5K9v0lnxH97SB
         EZwXBiVg9IKkk8Prft+gIACRz/GVYlnNC0H7gJ8WrqJ7MzvrKCw9rxw/QEaVvwMdK/uP
         QvQXDM8rO8hRjj/q/moWtqpdMCNp52bVAZ+wGSHE2hIyi/QrnMCYroksHXnHHq9yjs0V
         DNNrPzwP0wBK5uu8ouJO1d58Z58xLOtn+bjQsAMsMv1Z5oZi8yd57SOdxUYTaNdIs184
         kSqcS/6FsSbeRETRcVX6EtMAc5UKOPNiASkAep3FZ83gWurWQBk87fAckIDoFJ+gA0t8
         QMzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9CokGdfGMuaa+ZM2lqmlKojmPalvr5e67hJx/WbO9Vi2sPm4NVV8bRbDovjnGUL5mht9yVs+O89gxBOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxMYtotDssaAmcE6m424cXnKNR9S52b2JhC70xongBlaysNvVk
	BB6G+wd2qPg+3xO/QQ+HQVD9pVoJbiqjdDmSkJ8ldRQlJbffRH42GUER
X-Gm-Gg: AYBFou2rXm+0DFk/IG/hcuvPj+x7BK0/sFhoEqcYIdT0dXJJuBdEz3LcrvrFrpZibPE
	tQdkp00vOcAqtST3vLuuoTqTYam2BBnbedwEVk3Q7CTZm6JQnS+9z/0wTsfBAishdb6EYWx0PPJ
	hS/LC2YDdeK5S3KCBOJgrU++8E7mL1OqIf2JHl/TEnUD6sbNqBNpB5XBhEnNOMcykeVA95o4at5
	1wPZtiKcix8g/cVyboLui41XesF7FgRUuQDvu3f/4V2AYSlpgMZBNPwGbKpJUyvc3wXN21+DpMR
	MjsAaf8PfTlKGV2P+CESponSjuAcyYbGYf3GNSfQ6EaViCcfFLaCfpqk+GorlEjPUlywfsCF0oQ
	3AHxhMLsQYcJoVr74oxRLlu1WqXETufPUa6Pt775sG/kBrpulpNtpJSp2yri2D8CdOic5k4PYRr
	eRV6u3NPaPRuEq8GFVwPuo7BqeppHJ/xgMTS/uZArMxstUj8Vtdb6xqZYmUQVJ+viB/2/KoCyjJ
	jzFoSYbuWk6DoQARegCQLlHqtMjZn5VffkQdQmdkLTM5As3PhNfb28Jg/2PfDNP8pFlykM7X0fq
	Mx6IwP0+DQTCOT4VyfyDotRRNor3+fJIftY8+1h07qU=
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr128664365e9.15.1793476583039;
        Sat, 31 Oct 2026 12:56:23 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:661d:f91:664:493c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm11513907f8f.6.2026.10.31.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:56:22 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] irqdomain: Preserve reused IRQ descriptors on allocation failure
Date: Sat, 31 Oct 2026 21:56:19 +0200
Message-ID: <20261031195618.4167524-2-thnkslprpt@gmail.com>
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

When __irq_domain_alloc_irqs() reuses an existing IRQ descriptor,
irq_domain_alloc_irqs_locked() frees that descriptor if IRQ data or
hierarchy allocation fails. This removes an IRQ descriptor which was
allocated before the call.

Only free descriptors allocated by irq_domain_alloc_irqs_locked().
Leave reused descriptors intact on failure.

Fixes: f8264e34965a ("irqdomain: Introduce new interfaces to support hierarchy irqdomains")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/irqdomain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4fdcb6df5306..494a7982f1ab 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1672,7 +1672,8 @@ static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
 out_free_irq_data:
 	irq_domain_free_irq_data(virq, nr_irqs);
 out_free_desc:
-	irq_free_descs(virq, nr_irqs);
+	if (!realloc || irq_base < 0)
+		irq_free_descs(virq, nr_irqs);
 	return ret;
 }
 

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

