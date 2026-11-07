Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794014681;
	b=aR4rTVepDWY+EJhqSY1IBZ8VMFLKUehQJPUfHFZmx6CITGHGMCNY/WGzyl/Pq6e8XMMY
	 MpoQdv9f8XZxJzBwxljaxsgvb4yczNpYgTIAC/8D5G/dFd4ClYrZbiP6wX4bswa8SjWWh
	 5OAhJWOTLVwbRoOWHvDgyHk/Bh+0XpqxqdUJcP+4BVg6BaF3yua79tn2NVSt3C2xgZByA
	 iMrmy6tACUnTMvOz93BKPYh+UPyD5bZEOUZopKQVogDsKwvpssOpjcB3BHoSclCDo1hXq
	 UQSONCmK/GxPHgcpzReRwsi1erQnY881AzGVr8J7f5GwgI3TPCSzMtEwnru9nI0DS/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
	b=AkF6l5yZ7lrwn9qYaq6V7eF+QNjhP5KupygjxwhkEjaE5A4ZCjaGdAC/iPxdagwYTlLV
	 iLdyBWgKHs5PjOrtJX49xl1xcVrNB9SiWf2+97ejmGIsXUAF0VVh5uIaloLV290EfP5VK
	 cCJZCHrjthqyRvyj8PZQln6Adgm2c41vXmfYob/7opiNTMvHaHOcNIQtOdz7d0+oo8GDA
	 Sw2Eb8c17+8TjmNv+Rnxx5rApMoACXQnJPz7FQwvybt50BmRrK36YLM97T45mJgFnvQJu
	 whZmKUyd93EontgC6VT7F2zVOBuDF3zryPjEGqwiUI7UVcGlOPh4vdCSZyavh528Cnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGCymFRs;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGCymFRs
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so2143225c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794014680; x=1794619480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=LGCymFRsmUou8HaXfCPzZUJ6tcfErn7lktszwsc7Wfdbx+ihr0WVTsd01ajvVMOxEZ
         Y6knqyRdu4rH/SSeVdFY5QXjskmiT8B+ScQV/WUmzgK7ZZHa6cmMCZelHdJH9ncxU3qn
         bQvRTCM6GDY16VYomUINKuC2XE3jISOAxshuAwJoHIobj2Ll5hIZNAltqaW8qzUw3RoI
         yeB6Im4E33csG0k1yl9Z5FfMjRkHzc2z4EW0ySZP19ECszwHHf3wUfi3b+2OlM7kIHbZ
         9MiZOJvD3em/g+724thhV//Rs50M+f7Jr9lgBu3P0fKoHpBz5Cf3MnN1aziuZ+anc0C8
         vA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794014680; x=1794619480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=PqnR/gFlX9OUbkafCnJYisqhQ0fDgMzxhZzUDAmQwy1tXvEYy1Fmpx1Z91t+KRmUvY
         HzTgRElfY6rVLaHyWcv/51iLhCcZYjMlvJCf3GjQfJaHcc8NDGFaaJrGPhKKM4HWM63v
         fZyQ4ee4dbRymeXeyT+0wVWk4xGETZxrQgzNJXE2ibTVS6FDzgILTzDTE1pcnZOBzhb2
         x2UzSPiOeMGFF+R6PJG8+rVdA8gM8CiN+5E+cQ/h/SR0gF/+Rxz8lePYQk39KnU1xJKz
         FaY2VB+ACcHfvpjmdesvrH8r8s6U1SDwfJMaAPk4MH9+FzuTqfkbBk7irxzv0HlpQtBk
         Az4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYfOdS/Mz6d/YDgkbQE+/TuXQQvABpd2GECQix6bwqVzBIVKZ6uoEK55RFsSWzvJAnTZfbOsw0oEyiBRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lyda6C4ACmScA9CYyZ06FN1uylCwoSEghmMf/cBDxGEedvp+x
	RHPmZATaq0flhEpAfx2QaBIiWGpu+v94m4o+4O3YDDCT2UbHw3f5zRRH
X-Gm-Gg: AYBFou2roinANsE9qkWBUxU5B4QWqHY+6Uk1GNbsxzfQg4JxTs02V2fmSBF/BrJtAz4
	D6U+uYmjjcYp2+reMqXHpX15alhKYifPvqpuEcPeyrK585RyoN6NPs9/t1TOr1OYyZYSV3Yu90e
	nOkNVmsxkQKmzoaN4lLxHnS7KpPObSPVXLBJr3z5ts6zpkStYRnHZVaFti6QXjwLUovbYgYUhKU
	nQGeiWn3NIHWz/H6HlHAxIClI/iz/cTWm155QktoodAgIbAnP8m6N1PdjZRj3uvDXDQpJC8sqtF
	s6toqFBPn2X+REoYQJgCYngkoCTuOayf9fQOlblB5gAFXMWl/+O3NnnYs0149ZKtMON5BxLPPps
	dGz2k3n83zpZDp0qco0jdNWUXG0PjCxIQBcZ+VpdURToonUS9eATDfsEQsfGv2y3aiy0hGleHeP
	80ftQ0KB+EQjCkAKDUYe3Fobtu750Mj2Kllvml4Wvjm4LZFxTcTYnSCXOKNrA1vWATa1Why9s4l
	mV1yDKTKJW9p6yxP56YIuql0p79G2fNH6ACKfJtcicenFghw/s5ncb6ITkAkpxqbqFMJ1qtVrPY
	b+0JbaNyQn1/AYjZ7zBaLCAT8kAAwIFmcaV7NC53h8cKlQ==
X-Received: by 2002:a05:701b:2905:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b25d3190eemr4699302c88.19.1794014680193;
        Fri, 06 Nov 2026 17:24:40 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm8436986c88.8.2026.11.06.17.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:24:39 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
Date: Sat,  7 Nov 2026 06:52:36 +0530
Message-ID: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3

