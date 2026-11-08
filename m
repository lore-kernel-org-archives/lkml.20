Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103679;
	b=0tIM9ZoItmGT89Yn1L0gM+8YqlWTK670E+lGXyh5437avVUoEdgoWW3Oj/9rgnaQ+Nna
	 NMwXMLag0UBwB+9Qe9WB593pmRt/lsPnizfIEBpbuvi0lbhEvqx1wIe9qGcaO23xSmEOE
	 HTgqh/EihVZYfNk5oVV4PsME1CyFISOj0v9HB/371NPUFBtUieKsBMJac8x+Wg/c6vVtl
	 d+IR/k9654ZqV5f7fxcRRWzHr3isorATkdcoeDgVjz168kz/y8bxHkll0qFWfCIec3nd4
	 HRp7arC+GH8sP+J1exUg4Dx3pUWjPmyEzoTSUlZuOKRXzryiX2TYEpaBNiYwCy2G3IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103679;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=49NOOQHs9q9/0LuG/uw7D/xmQb7kJw7vOdP0P6+9cPc=;
	b=3ANTPrCLPJHZJBjecYAUq6F4tBefPqHVWzkemTvYdWLNkUK6GWxB52C1qRCe5m96QQ1U
	 Uejn57W9owkSZtAVJbkKUny5XSFWC2GFTnsW1Yoe2l8uWUE9E71yVRoudWMj35WGROVvM
	 BPicQqncakhYt1VaUJp2qYNvRV/DtALY+480KuCIuZapqGyL83YNHytG3EGYBvsfuyHlA
	 btU+5q6gPS59ARFE0ooTrDjaopfmY1xsLTwe0zuWPusEX1lnlXP0s8KIRzhTko/qgkbge
	 UWWxXDBqO1M4GDHmBqJafC/Z+jUSb8ePITNnMN8zKgvQojMgfNG1uWI5BJIKsIAUhyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQS4Dgev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F4B606A31D;
	Sun,  8 Nov 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQS4Dgev
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794103678;
	b=h9mE3jufokL7N7OFVK7KKFuN46E4QpW1AdZD9VkMq5JciggQl2QnK36MUFYoEGy0J+uE
	 wndctFyjeqKfxwQU4JNrk0EH5yoMUMtTJR9l5BBBpVmZOmSHpUviirsaWJN/62qFCme/W
	 T0oYJrxadjBcyNioWRJszStBgcqkiRQlWaOtKzTjPsjAUDI2cGyveE1AJEe57TH+VHgMd
	 /ERS6CDLaN5aTazg9j8P3fqkbrf1efrYWpB0KblR0S6Vrz9qjif04VPKqJzaKDhxL2T+d
	 FsYlEQ/UvWC66KgMR5HjHAT8lWlVDAteoIsGo4DmICjBqBtlFVgBZ9BGqu9VLrbuToQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794103678;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=49NOOQHs9q9/0LuG/uw7D/xmQb7kJw7vOdP0P6+9cPc=;
	b=sVajXHv3OzS5Soa6SwbKH5NT0tM0/lrodCbkNT5wV1yz+OaFULpgea11vRkeigxlKrbL
	 1a++kvxKfgJv6NGaRXiNSYwiKLw+Ecib3jMTD0ELXuVNNTydNHSankQ/pOw/10lm3x0Yx
	 fgX03vlnCDACvnuR65AyzMP4ejDMz6NkNF6VUPcCEwMTA/NfBZ/6kErbTLSlqDi5ur6eD
	 LQcGXECkyZ0SOCWyBHEsWxZ2qyvNqlJBHCiI232MyUOQgLnHYeC+y3c+suIOoj1h4LACE
	 627diB/6cDm9nE1zf7hPUMlzdm9V9GRp0rhoT5G1+Yv4jjg7XNvnUh8FT2xvnZrSzsw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAFDA1F008A2;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794103678;
	bh=49NOOQHs9q9/0LuG/uw7D/xmQb7kJw7vOdP0P6+9cPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dQS4Dgev9JSsT/HSagkllamXCcP8pwsDwr/tH3RxB34t+UFWIx3Qo+YfCKAZ+/YNy
	 YEjiFEEgXsHeKJdJRXaymq+aAktQwJ9bct6+TMb4ghjfxad0ihc/2/PhaMqcbnBbyi
	 VpxH12vO8/kPgfPHUY0/iSWHg8H9bbMPStotqxqDIsUUdR9UATcJRhqgy0dLx+OWbn
	 PJgTxbrh3wlwaa2Ek4LDKuz5n9po+nPxggLp6gjKnEfuWDOTKxyshKhURt2+bcDA4A
	 PeTA6YgWU5ADyyaGbYPYoGElqumU/l0XiRisWmS4blLktwuxW5qsQx4HkI9AOMdJp2
	 1MCSrUsUCpyqg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 66B5F47DA1;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 20:07:56 -0600
Subject: [PATCH 2/4] staging: octeon: fix OF node leak and kernel-doc in
 ethernet-mdio.c
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
Message-Id: <20261107-octeon-phy-series-v2-v1-2-d7ab0b4b3f17@gmail.com>
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
In-Reply-To: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794103676; l=1233;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=6FhHXWZH7mRV6V1TF5pn2Y16qtYn8oRyRinRCkzOsIA=;
 b=1B2lkTS2xomrFU5EcWrgd6ybRCBw78hnPrGIxP/g8Nab9vW7cG/8LdjfQUMWqd2qCGI28qtJ8
 kG657CHA6uADzkflVhbWCpjhPfzCkyDm0v5EcY98kh/Lz9g3MxeKO1T
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix a reference count leak in cvm_oct_phy_setup_device() where the
device_node pointer 'phy_node' was not released if of_phy_connect()
returned NULL on a probe deferral scenario. Balance the reference count
by calling of_node_put() within the error path block.

Additionally, correct the documentation style of the function by
replacing 'Returns' with the standard 'Return:' keyword to comply with
kernel-doc scripting requirements.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-mdio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index 211423059e30..05bc536ebded 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -151,11 +151,13 @@ int cvm_oct_phy_setup_device(struct net_device *dev)
 
 	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link, 0,
 				priv->phy_mode);
-	of_node_put(phy_node);
 
-	if (!phydev)
+	if (!phydev) {
+		of_node_put(phy_node);
 		return -EPROBE_DEFER;
+	}
 
+	of_node_put(phy_node);
 	priv->last_link = 0;
 	phy_start(phydev);
 

-- 
2.56.0


