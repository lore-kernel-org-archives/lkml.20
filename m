Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049607;
	b=LBJbizlCgV/1myPQV1RYk0b/LKjAMfIsvvmP3eiSyx8Lr63UnRdnE2bLsdGqWLWLKXJ9
	 Gja+f1DNnTNK9xYgpFwe15a5DlULwstNHPfr/gurzHFbbMtOjKSQe9jIjRLM+sRK35RJN
	 zAEud2zCMpy57R95TZRpVhwgxmLH1qbQK9kuuKIQ4PgIC4K+jVJBMQKiqYDNBybTvbZf0
	 jijWJB+pLwCYiLSE8htkiZN8AB/avlIbHYSscmcON06uNYCXFiMKOTZe93hIq6BwdxJc1
	 llE1h3RGscVz+QetVfsqK9Y9F8/Ky4dsZzY7Kupw8H7DChaeh0aJG9P3y4srwN4CCsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049607;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jJEUlgEVp7Oryl8JxquFdumPu6uwU1eWwIZUsoRNky0=;
	b=Sfry/KzmOaEKllM7Fz7YpWkL7wAFP5J2CysnjtJyUTb/2NV7d7REwXmImRYh91HX+B2G
	 Ko+JJZVWKICmu7RbLIL+iEj44mAEPvK4vsaahySeGx118/Y5vx8/2So0bBA5b//0UfFLo
	 AXEKNZi9ptGD3gQqhfkSdcBvEaWE0gOALIgPcE6oBS3TdAnIFSXVsZs5cRefJJIhb9Nec
	 5PZE52A1ePSW67rKP/shN55Imua8VcSRo4gu8/d5viS2RjpLQ7OdSANs4jLXR6qaLKChI
	 vYrCSHF1keyOu59NIn/EX1nqflpmID1/4K1seZJNOg5kybCJFbN+CNWaWZuidLdAOyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODPeNcrK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A8606A33D;
	Sat,  7 Nov 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODPeNcrK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794049607;
	b=ChgbMFlX4Q9AUfVXhZOLuzUkQk7hb/6Klc+eB/MyAaQbW0xH0iqWXiTnc1BIwgYULWm1
	 1NN5DUTTC/9c0YHxN12BtlzkiKKHEJWy2Oyd0bZS4rkF7o83b45v5gn9F/aCYjwClNKJn
	 SybipKMiw8+rjKJtP53cVbUd0LKgr5feGOgMstz+QpEkgIhG8C8CjGBz4REgmA5ZFu8f7
	 gGlfqQKPLqjc0PdZyE1KUHMgIEpajyP7tllg3sDshOkkgqXZl8fMQXnHPOaT7rKi9wQbq
	 gneNf5M5O0vy+myCgi402Ql8scg7sGPOD5acYcAzMuC4L/oXxubfrUTIDWzLn2K3BbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049607;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jJEUlgEVp7Oryl8JxquFdumPu6uwU1eWwIZUsoRNky0=;
	b=IpRhXR3WbnKQqLPeTSKavf/CyzQpogA2kGbHYC+PuR9XjO2c1uQLCDR+LA666viPhHSF
	 L4iiTlJbXirkZUlasKPkGqICshtSb+uBCtcwsAqyGLPRoKOnw+DdLTZNZfxMyDC+wFGQe
	 ELb69kpIwbUlFJDen1TVe+ozQpkNQTLDgoy68lISa1eZ2yuWrx/ZCr8v2xDHbVi7Jh6+B
	 9dYn+q/belz6+I5NseRdtVp/r5NZAB0/QjCc+sJBclIS/zQ2iZY8VuoZT9IRGZOb/+000
	 kUJkDYR51bktes6oLDdGr7x7AmV8SNVVlYBYjwWJZApuc1MZ6ja/oPjvBKhOuoXMTtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79B2E1F008A5;
	Sat,  7 Nov 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049607;
	bh=jJEUlgEVp7Oryl8JxquFdumPu6uwU1eWwIZUsoRNky0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ODPeNcrKafQTH7dgyDAdtuqa/Em7PiocZbWWZHF7VVAhH5iIXUZpDPDJw3T5n9WWb
	 kaxv1HzDDjjF+DZor4SQjWnaqPmzsMGXNLm0sGuF9beEg++CACf2P3Ey72BpTBSDjD
	 8vMTeQAsZbGK4X9rupFcsGsqGFdaZESTfVMoxeY7f2G0mckDCRfiahEeX7yQn5yewQ
	 T5kyt7Ir6gN1q84Feuf00G/jM0Y9qQBs2RbpqB3ON2KO2oyeNDc8v4EVwJS2spBMLe
	 ST+5HmBvvcMqWA+nhU8knY1eicTTCuv79geyQV/0mKQZjDSj4qAsgiRcRrSWleF03R
	 uq4Vv2hE3OpZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A20B47B9A;
	Sat,  7 Nov 2026 11:06:46 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 05:06:45 -0600
Subject: [PATCH 2/2] staging: octeon: fix error handling rollback in
 cvm_oct_rx_initialize()
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
Message-Id: <20261107-octeon-rx-fixes-v1-2-f5a21907c8af@gmail.com>
References: <20261107-octeon-rx-fixes-v1-0-f5a21907c8af@gmail.com>
In-Reply-To: <20261107-octeon-rx-fixes-v1-0-f5a21907c8af@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049605; l=2298;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=TPVbSHB3sHyDA3wF8lgqnMhqPBLjm9lvag5J66ajxlk=;
 b=Pr+17C2d7l3bdUmXPRmXQk1ufblFAJ6K7LA8dW8gtRVw6EHgJrdUBdIFZIZIwhSmK/GjSZirW
 a4mOzJAZ9y1COZ6fLHWjLRB9FW33C4HIVtCCMNPhy+j6txQ7xy7yEhu
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

If request_irq() fails during the loop in cvm_oct_rx_initialize(),
the function returns immediately without disabling and deleting the
current NAPI context or cleaning up the previously initialized RX
groups.

Add an error unwind path to disable/delete the failed NAPI instance
and tear down all previously registered RX groups in reverse order.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index b0463759be39..61593283ddef 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -449,7 +449,7 @@ void cvm_oct_poll_controller(struct net_device *dev)
 
 int cvm_oct_rx_initialize(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	struct net_device *dev_for_napi = NULL;
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	struct oct_rx_group *rx_group = plat->rx_group;
@@ -467,8 +467,6 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
-		int ret;
-
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
@@ -485,7 +483,9 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 				  "Ethernet", &rx_group[i].napi);
 		if (ret) {
 			dev_err(&pdev->dev, "Could not acquire Ethernet IRQ %d\n", rx_group[i].irq);
-			return ret;
+			napi_disable(&rx_group[i].napi);
+			netif_napi_del(&rx_group[i].napi);
+			goto err_rollback;
 		}
 
 		disable_irq_nosync(rx_group[i].irq);
@@ -524,6 +524,22 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 	}
 	atomic_inc(&oct_rx_ready);
 	return 0;
+
+err_rollback:
+	while (--i >= 0) {
+		if (!(pow_receive_groups & BIT(i)))
+			continue;
+
+		if (OCTEON_IS_MODEL(OCTEON_CN68XX))
+			cvmx_write_csr(CVMX_SSO_WQ_INT_THRX(i), 0);
+		else
+			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
+
+		napi_disable(&rx_group[i].napi);
+		free_irq(rx_group[i].irq, &rx_group[i].napi);
+		netif_napi_del(&rx_group[i].napi);
+	}
+	return ret;
 }
 
 void cvm_oct_rx_shutdown(struct platform_device *pdev)

-- 
2.56.0


