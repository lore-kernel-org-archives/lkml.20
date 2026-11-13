Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=BsDLRn+BV8oPW/cYxZ06+csLdRN+3IFnmm56wfZcnfPuNOnV4V36RkJ/E9SuNrIkwcjx
	 cdVdf+BruEnAbZJMtueZbgFaw1Q/R08qQjuw9O4s7982UHAmewrmI6dFCb+uLNN42frXM
	 DN1AcLmpf77sIia5oS5Q1cdnwE7WlZCSr2/Wy390hKaPLEEH4jFAeDO/6m60/aEFDFLsR
	 Q4RK5OE3DIzvfDVzjvXtrTl3c3FxylPz9V86RQmibt7UFamO4ZLPDG8LlGNXvODyHAk20
	 Bz43mWXiclB6WNTbYzTlSMILtNCg7YfU7jp1LCfblqY9IBzaDKfXW7YxcihKSl5Uywg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HVN4gQcxtxPaQdA8qwQOePOTaeXfM9J5GW6lpia6kmc=;
	b=xQuMDdaW1LiZ0ISM4kIkD5w6ZkWP3QYNMoP1JC9R/fVVD6GCGIvCDcmZF/6B75VNoUln
	 xi9Sh6YdqEFU3dLRImtEV8G7dpdyHlspXnLgEqzvs94X9c2p66BfvmHZEuciKvq2vihM8
	 FzJOZulVOv0MIRb2W3waPW6EqjVlhHIOF05S+EqcB+cKZugMSBweeztzPsW97w7Ivyyrs
	 yWAIZyj8kTWokTchv95tHqjEwuUcc0gZlmfDdFr5YJ4XTqtXBDOu2WDLbNUer3wnbb/9X
	 oA6fo2QW56uituDXpLsxi2Aidw0uaxcobVdg6XMYM99EqKtu6rFcKiJ3iH9ZxoaHp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NPyv5RXI;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111B606CDF2;
	Fri, 13 Nov 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A111B606CDF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NPyv5RXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588181;
	bh=mDTUsJrYcvXXnetT4z+BEJiRJweJFF+qsgRXNxNb9PI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NPyv5RXIu5ei3CF/zcL5/cyvvtl45J2tVArmp4CabtZaF7+/nWpLY+fD8rX1DsPFn
	 S60R3wtllihnjQYaMKHSzDheV4jXPZxbe9isxivzNRECufASZ7xkqJATY585yR0Egb
	 HXdKC897FN4zp1p2cx3ddfUlRAl2gymWP+LM3yQjJ2Ty0fF8J6y/F4h1iM25FwxYff
	 3fLwhwPfOrZbs2CLo/QFJNrzv23hfpHrOWo8b1Dt8d6FXur0TpiBrmSuG+hdX6EIkV
	 XxMkMlZYPazuGYFKMe3Ji7ws2xhgep4TcJdsJofYe0mFmk7wT94rLS5veqIjM2mW3v
	 LGnqlJ1DPUe5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 005D317E12E0;
	Fri, 13 Nov 2026 17:43:01 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 66447480038; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:41 +0100
Subject: [PATCH 5/8] usb: typec: fusb302: rename init_gpio into
 fusb302_init_irq
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-5-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mDTUsJrYcvXXnetT4z+BEJiRJweJFF+qsgRXNxNb9PI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhRIlh3oZbSaYRo0h+l1zfkZg1dPsI7gq
 B8ciEU8cYx93okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qatPMP+wSYz6rVDUUyoU/bI7APyH4Ewqr+ADjd56nYrmPQLM744DOsjyeJZBtyWNIFIlDrBti
 5q6V2MrqRUD00Cnbv5UfqoPYTaBi+Emq1YIH4ASwRW10UX0GBiyNKhyVSAoOPZQt+frCLmT2AJI
 M3ythxxwC7JGYtx+/O7frM08Ykvefvd+2x3bn+Z1GWngxi7WdAP5q/BaqSZqSIdOQ/I4YNkWHBa
 DdPaMb2tVpn53P2C1UzLmUzlr8azP9VKWlcnMQy6qYoC981/EUwD+LW3sl5NkEVr4wqQvQ+yuAt
 WfilUfeuMXAHOuRagIGUmqED3RrixOr5UOr46MtswQ+1aXRgx/ZYis68ewoWZRritIGocM/8RWN
 V7fzoAD6PzePCy1I1eZJRCs1udZB/yVYvjncX5mb9XGEK8PUfy7m6l23g/GODxL2kIqPo9SPYwL
 /XcZGZeb/u5+Y8I4glZoH4VcPrDAC88td+mLe/A3dtdT7qs8AUIze7zvqDgBLEmIn0n1TLLizRx
 vzKN9nPaRVFN0u4QG25iI8ZoS4aCULUtNAVw/Tphzh36ORZaoXFrucMlCHqZpL3qk4uwxjEEbM9
 JmnKJv6HTu2fQYRqB7iKj7azMBrUUPmBHIOZFmPu8ivHgzBMLD27lo5DgNPltBlWLqcvIk6nxLd
 KQbSS3qpT1UJwgmiOWP44NQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add the fusb302_ prefix to init_gpio, since it is used by all
the other functions and allows easy figuring out that it is a
local function.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 8b83414c5819..1b3ee5715a74 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1643,7 +1643,7 @@ static void fusb302_irq_work(struct work_struct *work)
 	enable_irq(chip->gpio_int_n_irq);
 }
 
-static int init_gpio(struct fusb302_chip *chip)
+static int fusb302_init_irq(struct fusb302_chip *chip)
 {
 	struct device *dev = chip->dev;
 	int ret = 0;
@@ -1758,7 +1758,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (client->irq) {
 		chip->gpio_int_n_irq = client->irq;
 	} else {
-		ret = init_gpio(chip);
+		ret = fusb302_init_irq(chip);
 		if (ret < 0)
 			return ret;
 	}

-- 
2.53.0

