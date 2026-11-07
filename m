Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794034872;
	b=UK6UrYKWfCVG5hdBFwsEUgSyEssBEBU7ObQnzoh2SwIBlIaUUak6Jkk9uAGKcBZ/Wdiu
	 MLPWN8/dnG0lW5oO+9NKbZC4jCZzqvJCajfCqXqJr5rRGspQMIjTypNvqIqzvflDTrmZc
	 ofmFvH3vyxIC2peKT9YE5uUo3/L33BIGpmyyR7gVlIJ4wrRkG2/YSCNQ8BeHINTQMyZ3t
	 w6ApBbTpc5UwG4Imh5QNpjFlHCWBpzyk8yCD1f7OsaE1YIne/grQKSaYl7l5TzWMT5PDE
	 3haEJSIvBVW1Za+tT2ejtuTEoUWKXtmHoS8pFW5xMNp4tdlLwPo+QK5KGE7tNN1lh6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034872;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAW1+FFjJtfjak7XPgXHSsYAIzShWhzZKXb3dbucffE=;
	b=MyKIuOUh1HMqqqdk22nCmwMmDRXrrm+rwEr1IwrTJu4Iw+M+TL4emaNZdc04oNpRZW6i
	 QnobfzexPokT3E7G721bRWbUHgFJDr1tsY8kV+r1k6gEzYkx4ORdsmgojnwEqKIBCZftd
	 1AdaounCE/qjdcleUdosXI+5LIljXX1Nu6Hu8G6N4LRqBkf22G3qMqekGltj3bfksAwIG
	 f5hCuTRtj4huFNPEh8i0l/oL7hJyIVfL7uxwNmIc2HBjMpj5NaEvcRw4oqe9SM5/I7NLt
	 UziI7lol1cESta4Fsozp36v8FJx9Zc6xJfjPHWO6CDZ8PBW8jFxLvI8trUc9gWGmP+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmtgOG2r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715A606A326;
	Sat,  7 Nov 2026 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmtgOG2r
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794034871;
	b=DRsDtmVva1V3CrrepFB0fvJ5AoTfp96pyphV5P3+Eml1eZLPXJyaUzbNlNAaFV7OaoC3
	 Nuww5KH4vdjYfLWEENxiSfHURVzBTp/JNIh/Vp2eq2JsiFDjmTjKsBLrFb6IbloorBFpv
	 VH7KRtKuCGDPSQHi0NXoIjNPOkvo7DMHVXN8XWan+zoQLwYD5EC8iKa+f3jT/1N17VHqN
	 U/Zmzvu+6/VjkiXf8eIvT7EjKb91jUt7F1v0pbHG33ze5SqPJ1PecXrw7jMSorNylna0E
	 HigB1UUigw1tNI2e+t9Gjs4u2pX2ph6yrHBhsF/bbB5rnV3h1pa93fi2L+QwmyuQk4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794034871;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAW1+FFjJtfjak7XPgXHSsYAIzShWhzZKXb3dbucffE=;
	b=xAFLYla31C4Hyam2r9/wM0KOhtTgpAlLaYg7UcM5EIus8ue6HRr0XdsCPzYX6Ua2eGox
	 hAOyB2lk0xQSJw5dRss/hgAjqg+uiHeMGtbd5kz6h2KXsW6yZV4MVa+t37gm5TpNtNhZs
	 zU8SGyWtfkeGbWR19OXCwK8XLIfbMGC45WlWJlS2P8tt2bLXs3aPuV/G0NMyxqloZDx3+
	 1m8XUxfvfEcDyF1b9E7ht0fdf9R7mIb2lt7kn6vbNQqtlPyvr7vmdssgznpaVDYr9eWoC
	 vK+2W2s5crbZ4FA9VVcZIeBDxCUlGmuWleQCqaSF/qkQFMljSbwBHJ+byC8msk2euog==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4295B1F0089F;
	Sat,  7 Nov 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794034871;
	bh=SAW1+FFjJtfjak7XPgXHSsYAIzShWhzZKXb3dbucffE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JmtgOG2rZzCJ2m2HdO2kf4RUIQOgb2+QRHKdptkmdf99noGG8XvAHSWpuswobJ2of
	 8s4mPYapD9ivOhNsZgOkt8tq1/7+pPb6jDAomuziyBDbfu3icKA3LNB99rSruH/ftK
	 BDoH+9A2R31h0y9Hw99zcnn8f9Yy24PfHbDNmTGkEsCd9gRV1Y1UbHqJj1oXvPwlhY
	 tgt0QF3pitRxEDSYKSgKXW5L7TFbuQp2Znms8anXDU84v5xqooSt55Th6XxyoJf+i6
	 fz4d0pvRVTRWvOswk0OyWe9MrxaRWdXeinZWXxUcsMgTXiqbOtTUU7UB7rG2M/wP6f
	 CXSOPlO4oSk5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C473547AF3;
	Sat,  7 Nov 2026 07:01:10 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 01:01:07 -0600
Subject: [PATCH] staging: octeon: fix OF node and fixed-link leaks on error
 and teardown
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
Message-Id: <20261107-octeon-of-node-leak-fix-v1-1-25f591fb96c5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X27EKSUpX+SvGQxKculmxJRATx3
 xt6nIGZiwqyoNCruSjjkCKaKti2obj6tIBlqkzOuM5a07PGHZpYZ046gT/wG89y8vB8mBCDd86
 Aav3NqPp/fo/3/QMV9u3jaQAAAA==
X-Change-ID: 20261107-octeon-of-node-leak-fix-8530bcba220e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794034870; l=1973;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=lmYDQNlZZJOdlY+CzSqpaOcg4733Lmg13tRX2y8DVVU=;
 b=4PQtZGe1BAjHiXkhE2ZBb+baE/oIBNyD4lAnSWDosOR+srnvSD1w5GNvd2djG75R0wvXZFzSG
 Z361PSzf9eEDoW9C0qEpepKcAdfiztmT8X+e+2Q1j3rQ7KnagcWxqtG
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_node_for_port() returns a device_node with an incremented
refcount, and cvm_oct_probe() may register a fixed-link PHY on that
node via of_phy_register_fixed_link(). However, neither the probe
error paths nor cvm_oct_remove_device() release the node reference or
deregister the fixed-link PHY.

Call of_phy_deregister_fixed_link() when appropriate and balance
cvm_oct_node_for_port() with of_node_put() on probe failure and device
removal.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..13df64d3f498 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -114,6 +114,11 @@ static void cvm_oct_remove_device(int port)
 
 		cvm_oct_tx_shutdown_dev(dev);
 		unregister_netdev(dev);
+		if (priv->of_node) {
+			if (of_phy_is_fixed_link(priv->of_node))
+				of_phy_deregister_fixed_link(priv->of_node);
+			of_node_put(priv->of_node);
+		}
 		free_netdev(dev);
 		cvm_oct_device[port] = NULL;
 	}
@@ -919,10 +924,16 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			}
 
 			if (!dev->netdev_ops) {
+				of_node_put(priv->of_node);
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
 				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
 					   interface, priv->port);
+				if (priv->of_node) {
+					if (of_phy_is_fixed_link(priv->of_node))
+						of_phy_deregister_fixed_link(priv->of_node);
+					of_node_put(priv->of_node);
+				}
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-of-node-leak-fix-8530bcba220e

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


