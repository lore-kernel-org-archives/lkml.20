Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=d+55VuRKiBS1hkE/ZhZuHodMZ3CCEg38GUBTyDxdLFUi2dY1HDEPeAsRwuw+Yqg95kpn
	 lWzPUnBRYKTHeRN5CqlGOl+puObpXzr7O9xN2yCmfPGawO/bjPvGYiZijRvChIX7ns8Vh
	 5dTJocJ0f/VbL2OLDch/RymppXI7Jnywe/GBUnbSoBwNA4a1Q5gt6lYs+qi9PJFfC/nYh
	 w+P6fK6q3O0lsNYZJceBHsDVlEO7JAdIqKXX0vixaQi6kT0uAeLV/XaXlNCCi8gHEE8zz
	 pPsEmZzT4iG4aVFP5sWo+F02WO2ulBSkkO2wCEpEPiWRnLiI8zknfOLJ8kRquN2f2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WaSnQuZ2WZZTSg4YKTzTw5NxRtusFQWxAPuVymBJguQ=;
	b=WjJoaym4GP470yLeDOkOrlqYOIQEa90jlsHQ+SP9kuphrOwbfHZzBGtcWZde7iGL041h
	 aR2QsenptAFLi/MWgMMU/J0+9+x8tlgOJvXWj5PazBqGc5djp572kk9N8uGpObmYkNQ8X
	 8IOJo0UXJ/1+lrzmJvrzluNgDs7QYrqtnsECJoieoBQTT1hyigLhrLO3E2tSxYt3PW4LL
	 wbu7aApQqwiQmUNpbEEl2cF2kR0i892NAY5fMoug/JYWyTfEAQ6As/NRLJyB9q27/na/U
	 GQzChCWLAbJDGAid4ms/x0XVJapDvhm5XcOGZ0bSDMIiboDtNz2ZmGqXw1cxJdzeBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=evWyZz+0;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17E606CDF6;
	Fri, 13 Nov 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE17E606CDF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=evWyZz+0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588181;
	bh=3h59aq3luop1uJe4LxPF91VxnJ4SA7uWvL/kDqGpjCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=evWyZz+0DWzwcfiOPAne5oW8zA+RuwnzJ0Af95sUWgOAjA9ABEDiotQEvqhU9hn+I
	 lufwD8UNZn0/WQpmQQ/x9wAqW0k1hwNYvYlVrVs00nhRz6uq8nJOXQxnSWaDPNZBKZ
	 nZ8JPk06jSjOBRWyY/Dehm71I5R0fo6RuDLXGjlPMfcyHvqcE1Ubl0XSNIv8AD4eCH
	 lZB2RbzhTN6c0YHWwYgOb4Q310uLMjz+iyFRCN6eqeI4X7Xmsa+9fR4tqzv3u/3yoF
	 51SeYjelKAsv3NUTYXzSpVB44R9FitJo7nlqxDXxgL8F5TIpnY0SKNOc1Dp31U/oDw
	 9Qcl3Rv72bUgQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0935617E35E9;
	Fri, 13 Nov 2026 17:43:01 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 699C548003D; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:43 +0100
Subject: [PATCH 7/8] usb: typec: fusb302: rework gpio_int_n_irq handling
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-7-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3h59aq3luop1uJe4LxPF91VxnJ4SA7uWvL/kDqGpjCo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhRenaZepXFyhV7j2g8HDq1H/Bl4j4hIK
 pZh5DgM/221/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qaMuwQAJpd//Mdsfi8xqV4yRY5XXNmIhJTrU/4a5HvNI6bqyQ+UaYI/bjxdvATJ7sJvESoHzV
 ji7v7qL3ftlwCXZq4/mmBf8P3PwH4IojB1HMcsu/I6WLFMtEq044Qy8y/sOrE6KtBF6lZr1rKKh
 4Gq+73qSeIzZgHd91Q1u11WwYNU9zeV5GPQizIrA/sI7Rcp9iXwOc2da0SmdQdkEkD7Jt1mtT6D
 IqQIqIQWTJ7BmdTmAYIet4UVupUC8d2zMEy9AMjA75fL/Pzx95cS/+Oz9hl1r0VspA+OHHcH/kc
 zXdyBX115kzvNiYxMxQH+NJRVknFoLIBZ+lVxe3gR4tLTHYBDXGUuoAaNh2qslS4HjQ1cN4ZsmP
 XCpYruv+A7CskLucwOagCqLrBsyXHnz0vtaFA63cgl1JuHAdDsEmjmo3JNfQSznvL7Ngyb/suEA
 GGbnp0Yom1fxe8W5+j9cd5NL6T0KMiVn0EzG1/0Y/3lElk1//5z/lALVI0qcB9DpLO6+jfH3/Xm
 /PNl0vhZeY32guLyfzmWE9oJxsXexk8/UKieeVP8dNQwXKaBUIbbmZJDoV6TMtXwljOtunsIpia
 RDySeB2Tw4dMGWH7u/Q/IdN5epX7u8CP9rT38V+ZkEiuP45KLThz1zSH1Nxwtrt2yRxZ0jzYXNf
 E2IRN5dLB96SHCXMb30Y1UQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Improve the code readability, so that one does not need to jump
into fusb302_init_irq() to understand that chip->gpio_int_n_irq
is guranteed to be initialized.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 76851e2b9ce5..6105f09f96aa 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1656,8 +1656,7 @@ static int fusb302_init_irq(struct fusb302_chip *chip)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
 
-	chip->gpio_int_n_irq = ret;
-	return 0;
+	return ret;
 }
 
 #define PDO_FIXED_FLAGS \
@@ -1752,13 +1751,13 @@ static int fusb302_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (client->irq) {
+	if (client->irq)
 		chip->gpio_int_n_irq = client->irq;
-	} else {
-		ret = fusb302_init_irq(chip);
-		if (ret < 0)
-			return ret;
-	}
+	else
+		chip->gpio_int_n_irq = fusb302_init_irq(chip);
+
+	if (chip->gpio_int_n_irq < 0)
+		return chip->gpio_int_n_irq;
 
 	chip->tcpc_dev.fwnode = fusb302_fwnode_get(dev);
 	if (IS_ERR(chip->tcpc_dev.fwnode)) {

-- 
2.53.0

