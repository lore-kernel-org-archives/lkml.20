Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981870;
	b=yrzNV6a9+2HNvfCdQ0HBe0WvR0/gnr6NDW8iXaY9UhtNDA/191SL8CXkkhfMQ+AhqFVG
	 QqmmMeaJRNi8F03sC1oDt0CSgpSYuqI9YXzRfXk0TTbzWA9f0Bh3YbdOZFDns1/oKsVYV
	 s1+VWcVtOiYWiw0Eh5wjM+oOHgcMKkVofbarD6nMXALzOqQvGIHNDhAfzL6jUFLZA712W
	 hd9CRzaOgSjSYWASDDzY1o/pvO4tzr5sDv03grVnQUdVsAqnACDUU0gCUwG3thwDhnBI+
	 WGgO5HKCyGyYv0SnCnqjGMMTxbMtyfoAK8imzPDoBZL7yJrU7FkZRYU3iO2ZugBRQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981870;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=CKwMnEUj4bTsuKO0oSBkdV6rE9qwvY1RjDCI8454OCM=;
	b=1JGgZuDPQegEtfW5tzPYwNwt4v/H7AqmtUcm1k0RzKCsI3f9nU6C9VbPpyrJM3DgN5wa
	 iLgbUZJouPdL3uL6pCehFl+i+ljNP8flT6VpLljfCZWJgMcLOtoj5OTbh3rvoEF4mRU50
	 5jdLSZBnDMzIuhAFs9HvbX7JZbRDEjsrPF6IfaRNDAN0qN4nv4b7kSKKvooBRPtF7AL83
	 P6puQXpe7+TjnimcLpdIBeXwkyhFhW+EqCrkea+6lPK9cdtAbZdQ6i7CC1IpBYKyj/Nmj
	 Cd8aBO9LNApk70LCnspAXf9oFw0c3Tm7rnW+WlYPDZ6AlResmp9H9/aAZxs8LDdzHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ztKXed1m;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B2606D80A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6B2606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ztKXed1m
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2CBDC6916C;
	Fri,  6 Nov 2026 16:17:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A8EC5FFBC;
	Fri,  6 Nov 2026 16:17:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38D58103292CA;
	Fri,  6 Nov 2026 17:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793981861; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CKwMnEUj4bTsuKO0oSBkdV6rE9qwvY1RjDCI8454OCM=;
	b=ztKXed1mjd73LCPlNvEG2FOfcKs8NtEVdr3hJjrfgoVmpXKrrpfRnBcrKROTALsd7FeCP+
	yv72DeWFJA6VSKkYDYD48JFeSnz9Bcp3IeLFrWBA3afasjcQS23AOBB5j1nntFpaNU1Qrb
	SM62WQNYcMk+uVlGpPW1rpqlrPhpRxv9QraQswzqx2MnhHj5fFHYTZxJA/Zar2yB32U9S7
	0ZqeFs+oydqbnD+PanIDfAH/CKJ5gs/iaL/WHuowN4sYvs9M7DDb/wiq/SFT40loe27QQn
	c3ISR82B7tmAel4rISMxnhptzSlW2NW0FxoKLA/U6Sn6gE7Ca+AiCtac5dEvsA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Nov 2026 17:17:04 +0100
Subject: [PATCH 1/3] drm: adp: stop using deprecated drmm_of_get_bridge()
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
Message-Id: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-1-c0ea3382b798@bootlin.com>
References: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
In-Reply-To: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

drmm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure the reference is put on later bind error and on
unbind.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/adp/adp_drv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index fdf0e6316175..1c4c39695e42 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -517,7 +517,7 @@ static int adp_drm_bind(struct device *dev)
 
 	writel(ADP_CTRL_FIFO_ON, adp->fe + ADP_CTRL);
 
-	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
+	adp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
 	if (IS_ERR(adp->next_bridge)) {
 		dev_err(dev, "failed to find next bridge");
 		return PTR_ERR(adp->next_bridge);
@@ -525,17 +525,21 @@ static int adp_drm_bind(struct device *dev)
 
 	err = adp_setup_mode_config(adp);
 	if (err < 0)
-		return err;
+		goto err_put_next_bridge;
 
 	err = request_irq(adp->fe_irq, adp_fe_irq, 0, "adp-fe", adp);
 	if (err)
-		return err;
+		goto err_put_next_bridge;
 
 	err = drm_dev_register(&adp->drm, 0);
 	if (err)
-		return err;
+		goto err_put_next_bridge;
 
 	return 0;
+
+err_put_next_bridge:
+	drm_bridge_clear_and_put(&adp->next_bridge);
+	return err;
 }
 
 static void adp_drm_unbind(struct device *dev)
@@ -546,6 +550,7 @@ static void adp_drm_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_atomic_helper_shutdown(drm);
 	free_irq(adp->fe_irq, adp);
+	drm_bridge_clear_and_put(&adp->next_bridge);
 }
 
 static const struct component_master_ops adp_master_ops = {

-- 
2.56.0

