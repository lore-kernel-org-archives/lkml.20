Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794438056;
	b=oiJpu+soyARkeJ8MIEp3BlwQGgU6v1x3F/vH0fW2DXOOEB+6C4YIALy5TMneYyrNHF0e
	 Hy1DiT00sHisc78ZWK85btOgzsYmNWTu6EQpRBLWL1i/cxxmAt+6pTXdmD+SuUqQj8g0m
	 GXDRddmGfEYiomKINR+LNCwEfE0buyl2pNMyJCUT6uO4eR2Qr1tsewfjaGd40y1JmMDyb
	 cUtHmKFGXRoBONme9FwJpa47cVgQd9vHODE/qoFIclqUeRQMB9evdMm9r9y6Xi+Qp20xj
	 M9Xi/bVnq7gh0C0xJ19ycK3155nRjzMQknxh5nDXpMOjwjJZIbdKJaLTLy7sk2fz2Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438056;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TyXtHtu3OECNJfqdDcu5ERNFYoJ3LlrWoOJQ/Vs1r9A=;
	b=xbgJ5O8VhI3Psn5ogFKiaNQ58GO9qtM/pG2/dhBLzk5+17T6pTWFwkQbncxODuzSj+2w
	 tksHtp839HwkSKYiay9rBZ1klnXwyjmQYaocMmb/TZljHuCszTPx9aJ011CTNBXt8egdg
	 codd1NNDyYYxuyNejyhkhHad9XMxceBSJG3T1hLx+nABOShI3wlRXOUD1sc2qQ2pgM/oa
	 Fz5MmdJ4kiwTH5J7Dju5ZpGzumE3z4IVh9SOdDDMncq5tPnSOrOyzPAQb454DrNbe2QRj
	 yUC1/xC9i0dzI4rkdvGPRQWYXV++ceNJyK86ILMF1HiLD6clMhRtOa3SzA2Xde759CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRClQJX9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DA606A880;
	Wed, 11 Nov 2026 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRClQJX9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794438056;
	b=RjOfZn2UE2nB0YcgfvuqzWCMtq5lO9kgacUapjlXgpe863kM0u2TCuNPEFtBrvBFcU5N
	 I1Q8jCwRlzB5ZeO4ew5PrWUt+Dh6ObJXm81MWgH2RH4M115PMPMFHnFbVL1wFTCZq8q5O
	 YYssMxai0HnS0uYxskk+emPX8pn7sQlwtcDHQVkWJIZujHb/Z1IlF4VphSEk0wJSeyE9T
	 pDd/xKUgCePpziqhBSpc2isxYlex/uv3nmmo33nx39ggq3rj7OOxHOjnV2BkqrdAQJ7xe
	 GJR4ebGQXWawQwIJ6xfNwPD2pX0jZ1guLCwkQyahy8u1wSlj5Gy+mQnQRrDc0H7Z1pA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794438056;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TyXtHtu3OECNJfqdDcu5ERNFYoJ3LlrWoOJQ/Vs1r9A=;
	b=I0fD+qd8beWQWrj685a0Ek+mdL+wM4mJfEggtlTp14NIuF/CrbmmeMhFzkcGeZU5soDQ
	 ilpXqvpxapveDk0f4HBRwyLCxANByvgTpoYjlT5kasgQDVwWE8mCTLgOODx68Vte3bDHY
	 RQ6amOvzd5EzmEgj64A3QkvYqv6YWTbFZmXthLPNdz/QRA7xSaZoiqnJBNFOyVMMxvi4c
	 Lq6n/g0nRM56GckuK2CwZs8tpR5ov3bb80xRDDVmJHeR6ekmpCJTMpZFPh5REOuZJwhcf
	 bCh4yjdKAdfzhFt7XKvg0VT1o0ZgjlPAhY+VRGtsw7kI9qoORjT0HFc6o+bOqZyIYDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89D191F00A12;
	Wed, 11 Nov 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794438056;
	bh=TyXtHtu3OECNJfqdDcu5ERNFYoJ3LlrWoOJQ/Vs1r9A=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jRClQJX91BQ06lUIKYw8GSdukmSz8cA04YgrmqohehkxocyZ8Xs8e0OQVJagTxIsw
	 X7g39ILTgbQq8Sc/QZLDwTpSeDjUpxZolEVTkdG7MjktIFKijkoqgt69Bzgz51KfQy
	 C0dUFjlCgDKAPLLlzshIhP4Mm0ap00o3pjy3WouCrj0nX5Ceg3EX/xmxSnjBYxNJjv
	 iUzr0v2HpHyF9PlIYPfekpDTk4v2KBrwLqsNTNd6mIsW9MpgZ9rVwUWI2OcYRzW/37
	 QYSoAhOl9gKzkCz1HDeG6c4nM0jYnTamf5qvdxEenzKFMbmU3gm4nRmTqMjPokjsEn
	 +fwBfphE3Zb+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15A854914D;
	Wed, 11 Nov 2026 23:00:55 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 17:00:53 -0600
Subject: [PATCH v3] staging: octeon: clean up RX groups on request_irq()
 failure
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
Message-Id: <20261111-octeon-rx-fixes-v3-1-a0f0dc40460f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23C1JWo321P8oHkJcdaEaSSRYx
 H/v1nuPb4Y3s0OiyJTgUewQKXPiMAvcLgX40c0DIXfCYJSptFYWg18pzBg37HmjhN29s5W0Ze0
 bEGuJdBYivVrhkdMa4uc8yPqX/t/KGhX2pTO6UdbXrn8Ok+P31YcJ2uM4voSf2D+uAAAA
X-Change-ID: 20261107-octeon-rx-fixes-d4d7620258c9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794438054; l=2648;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=feZBSqgjCCOTQMrEkcv/uvbFiG3VcgYBGhrXWs8srLQ=;
 b=dclUB8kWbnACr8T1uS6cXq5hVmi5AKo9LW48Mi0iRMaNRx7OG9x8+K/OTmUHXaLeVBd0PbgzI
 G9P6yol3+wcDKmOkPy8yrhoZhIgCDmlb9lJvfxV/PCVhrDppGnME5OU
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

If request_irq() fails in cvm_oct_rx_initialize(), the function returns
early without removing the current NAPI context or freeing the IRQs and
NAPI instances from earlier iterations.

Clean up the failed NAPI context and release the previously registered
RX groups in the error path.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: clean up RX groups on request_irq() failure
---
Changes in v3:
- Drop the void pointer arithmetic patch.
- Clarify commit message and validate MIPS64 cross-compilation.
---
 drivers/staging/octeon/ethernet-rx.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..f3d2a764d920 100644
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

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-rx-fixes-d4d7620258c9

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


