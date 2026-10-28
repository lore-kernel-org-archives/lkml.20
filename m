Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183056;
	b=eO3LxFAt78hZ2ikjZ/U33Sr7tGFUh+2S1S2rnXibfF5Pv5109I+qpZ2nSMXDxn/if/wc
	 oyzQiPynM/GTYvDG2/u2epLzCIK29olFqSbNDL13gYDQmAigkLqp1rUW3JcV4yc5xaryx
	 aQha3ihAahobVZgDWYUpnZugUmIA8REchq0uZh4apNcKzWPIPbtzIAW8nwwaD3AQz1puD
	 SCYmyMwA9Do8hI2huK0PoYfi4TfL/XVGzoNPgKGxQfx0ce4ZF3265PYeSGFJ1gUyfA3iU
	 LW7S6oku0Vy14/bv/V0jh9yRGmlpnlOaH7cS3qz9A2frEQtezmNfB+4JmONiBXZSS2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9TgQg4UpHv2Lq9L9q/Umb0LXQsRTilJXVrrgSBI6ObM=;
	b=qdlHSwV9XIUGHi6mtXSqYTc2rI3ezFZAOBO0r5FRsIElhYXcWAqkiBQnCcT2ziw7lARq
	 Xb1MMrehL8Dyzjw8Wpg28whqxBwu9hFMKNDk+dukB+0Z+JdXOZCFCKvEAKAWuEqpOCE9U
	 p1rHFTz5qRWE0R9Yu4Eg1LZGNUjdiuf62p2hcRUunCtMH1J/4SdBe6oyzxrZPCH84AQxs
	 8tgYuW2WZtCF3mhAq7ZO9Od8BX1poPf9Gzv1s21DzWsT0d0o6LHIhxNyluSxZ0EXUKHDy
	 q9LGNEPJal9XYct64Ij2ovZOijIekzYWIfhV/4zst8oXbLBo/uXK9UTuObP9lXM3wwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oClVi2ms;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90327606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90327606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oClVi2ms
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215344409so1454175e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183054; x=1793787854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TgQg4UpHv2Lq9L9q/Umb0LXQsRTilJXVrrgSBI6ObM=;
        b=oClVi2msMtbkDKGF3IDNcX4Pj5LwShKJ9gqtFEHTknJmKVlgYZzYTxyL4sZwhkuYhk
         BeKovhW+0CFNn5LuWu0TGDbTN0PdgM/qMMY2fH+wVX3FX1qJkPwqI4klxLLd3XS9tCYx
         C7475M4Lif7aUj0XqgbpWXZMCaqS/QTb4dng7a+LG5m4Ku7M6sZoAqdNPVyMf9p0wo/9
         9azWi3GJXdc/Wes+ouoG179+mIs9YExUeiHgVdKFRxLwbJTA8LfrCTRY8rYcSygIojKU
         ewTjvJQ5X9G5oYbJbTVoogFBF+M06dY2XvLs7VU0pmJAMqw72zJVtGGyjKktPAEfUhHK
         U6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183054; x=1793787854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TgQg4UpHv2Lq9L9q/Umb0LXQsRTilJXVrrgSBI6ObM=;
        b=UdOUPVyjl6BUVEEwLNPkkJEn5wGxrEHOS+Ge/LJLK/LvbFQmdC4ZAfsP1W5IYvd7vH
         4oTpzmV98YwYsJ+Zpxtf8UP5SQnSlI0gSCPczD91e2536uf2T7+mRvLSvEw80QpXQAaE
         yVPiz165qcSn5QhIjClpx+hmDkN0iMCyTuspCtbtzJDDZWSvyCDL7TSISV0O4uYiS9hN
         KYh/7iyrGcucmlAIzaG3eTayGDMzaQK1UEKTTKJL0JAvi8LxrcG8SksEIDYh9legrJNk
         IgITLp3TDiyuZM99q5dQxBqTz3a2n9bGGRnxkO/0kU1B5c9YQTQFSuhNhZANnYme8I6J
         Wk3w==
X-Forwarded-Encrypted: i=1; AKwUvBxFDpZOqT9YMKLCSlqw/Tw+oQraaWDVzIXhSXn3LUFERawC9YgpT1smufZZYpBjv2MrKzTiA2I7RIJ3744=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlQZpYsxpPv3Q/Fz9qbZMOn/awz38syEm0rI2Kjh3v1WfbKJAB
	K/z3jIW8KFZECCoVaOc5uL9SYHZQY5Js7UnECvsN6YpR6brlGX10IJW8
X-Gm-Gg: AYBFou3gsWiLOWk7TOHlWgCA83g7aEQIVbJ8mY9ILfwy6qsQR3HnsA5jivMAl95LHvw
	4a8tLluolPZ+WtJjjhUzm+hF2t3DMWs5HL1sKdxFVCFzocscBxBPPGyyqh41lxZpkQgm0ohIozz
	anGSkvuSAW98PzzwJizc08cu6zUwSmBklbm5Dnge08D63P7hWEvSz+6NelaFb5gNSmYoht+dZ75
	azm9lKLZxzziu7UY1BTTtFC7xdHg0c9cOFOppJv6ZOSPyZa3NukDyK98uKkosMJNSM7a7Ag33fY
	RU7FaWHz+tiJ6WC4NgAZl4qhgaTWmoYMpTuWSyzGiLKLaw6px3V9BPEFA8kddEbyzQ26GK0MqSR
	I13JwTxdccRcebFlM/EQ6Nn/H1So5dJsJhMA6pUmtOblqz/sWvwNlWurtLnsjTjmgH8Fwi0OsOR
	h8S1RbTiT6TSMUk3UKJ/up6CfAuzGYs8F7IlVOOis7EH5GFv3E0Fl4wgAUXfGbHyvDGmePme/Jb
	BqpxB+5fPjKpvXdIug/88RzpE6OMJQXvOE2uNrPrRg8kdbkVGOIyHRLLJoe7Lxhp2H18eiiET5n
	5wuHXAo6tyGdLnMKudzwQrW0rn7RT95WZ2Goh3svPrmAghhR74palhXi35PH0QlmqHBk8yEyvzX
	NxGmikeWcgIg4g9/AKov4oCVFFYYS+z4ZDIctF39P7aA=
X-Received: by 2002:a05:600c:4286:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a965cdc67bmr23985595e9.1.1793183053902;
        Wed, 28 Oct 2026 03:24:13 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f150fsm32656435e9.10.2026.10.28.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:24:13 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org (open list:QCOM IPA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] net: ipa: Fix double free of the interrupt structure on  config error
Date: Wed, 28 Oct 2026 11:23:25 +0100
Message-ID: <20261028102327.28263-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Since ipa_interrupt_init() allocates struct ipa_interrupt in ipa_probe(),
the structure is owned by ipa_probe() and released with
ipa_interrupt_exit() on its error paths and in ipa_remove().  The error
path of ipa_interrupt_config() still frees it with kfree().  If
ipa_interrupt_config() fails (called from ipa_config() via ipa_setup()),
ipa_probe() unwinds through err_interrupt_exit, which frees the same
structure again.

Drop the kfree() from ipa_interrupt_config(); it should only undo what it
set up itself.

Fixes: ad1be80d7582 ("net: ipa: introduce ipa_interrupt_init()")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ipa/ipa_interrupt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 131b9cc94201..17cefd6a0b18 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -260,10 +260,8 @@ int ipa_interrupt_config(struct ipa *ipa)
 	interrupt->enabled = 0;
 	interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
 						   GFP_KERNEL);
-	if (!interrupt->suspend_enabled) {
-		ret = -ENOMEM;
-		goto err_kfree;
-	}
+	if (!interrupt->suspend_enabled)
+		return -ENOMEM;
 
 	/* Disable IPA interrupt types */
 	reg = ipa_reg(ipa, IPA_IRQ_EN);
@@ -299,8 +297,6 @@ int ipa_interrupt_config(struct ipa *ipa)
 	free_irq(interrupt->irq, interrupt);
 err_free_bitmap:
 	bitmap_free(interrupt->suspend_enabled);
-err_kfree:
-	kfree(interrupt);
 
 	return ret;
 }
-- 
2.53.0

