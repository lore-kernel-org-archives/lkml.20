Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140757;
	b=LQsIWfy6AWo81xKpky+iOzJXhua5K4OWBD1lhVrZtKEJtiWJfW8naWJRSct4tu9wGoBR
	 bDcYUbRxT1K1d2PuJVhlxO8xD02fWJuIpQNKIQsYJ0hlq4gzIwrD02NSJrxwf7q7zJ0Bg
	 n7p2my4TdRSI6o3zgRpGdOWOuMhNKEFzJ95CnyZGM7PhJO7uTA8KzMijU0ugNUZC8QLL5
	 0aTDqnQ7n4hWyL9ksuFFWdpoy15w84AJZ+eCHddak/SPWOEStXBcu/58g4Bt1Vckqed0v
	 AKd0zB6lvU/r+9qHvlApWGO2K/qg68xBUGtWaZmjQSP4bFBu+zMNoayR3divnugNQ+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140757;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JdGhqs7TLBhy8iFcyMSsO3nShzmMP1uDNiXqH4iyl+E=;
	b=XKGehP7LSV76T4KApB6wuIYTg3RojI9mEzoYSHVYLHBgW0fMi+7LNJHe+u3Y+sVXrIfz
	 Nc074Lx+PF3MSfkgGivVh1cwBiIQ96dUr8p8j636XbpizKX+lrouCHlpIfg4D9AaZuT/I
	 oW3smuBKFKjDOiFAKGiFIhMDa1hUof53rQAjdQsRZKKuQHX5x3c4/zE15LYemmEMCx8wc
	 dMEr160ZI+pvUCZJlO6YZuhwkZa4i1OpFQyAuQkZme/xb6/lt6ZiZK70Qv3xHMyut/pZt
	 d2U80b+lGhK5txK8T7d/1Uq6cXtReT74hNP/jLjAhhxnljLE2sHpHhmOQNP688Sa5wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lErNgvwr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B3606A31C;
	Sun,  8 Nov 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lErNgvwr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140756;
	b=3K5vMLjwyNeFWEPL34JXdr8yX7A4iWec9qdXL8ptXiDk67guHvZ8LCuAdB3H9DNKUqUk
	 TnnKImelXHBLwVNmBOx2M8WL4zlqPsfXeAsLxypLako+Oa3uoGQzEk2xw1vcKE+ijW/wy
	 GcQxcP+Jka2lQ+VBTuPu2TrtnggM5cGJ8aD6LBWvMF61ZJPCgY/kadiWSASMtEaE5wplq
	 IPCbRIQr7PBCcCypEHtBY1g8UPU1/Z14pA9hD0Dn0+GXkJZxQU34Lb0lIHOr5hTih7gyA
	 Z7z6bWoVI+QOi44W/nujgJHgXlc0jBIY4MF9KCHiIEcHGIK4Ar2dOfr8Zt5DKA4SVhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140756;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JdGhqs7TLBhy8iFcyMSsO3nShzmMP1uDNiXqH4iyl+E=;
	b=wONALs8nnEdtg4lYw3k5Y32+yqMNx3GMs8eQC7OzXNW15xDAlk68tWjamp0ULrxxnw2G
	 Bm01h3LdtxehjVTifRGSp8n6GFHlhE0DMShB0etyH9xUYKntddvaTfg6soH0OHL1i3cIf
	 yO+QQnVW7P3TORaf4lOSM30Q4+uDT0+3rtzZi8Yp7oDvuW6rXkqgIcEonqd08iAPwPErK
	 ceIUDg6b9wI54OKo/kduOGno27MD9wPyN1tcje0deOMIc/ASO7jbLerNR2tx7JEWe1SEI
	 c6qgDxn8iWY8fFmNVnTeb4yGy5+Gu3jfM/e+zGOQ5RJ79xq8wm08/G0dZaD7F/42Kug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 391751F0089F;
	Sun,  8 Nov 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140756;
	bh=JdGhqs7TLBhy8iFcyMSsO3nShzmMP1uDNiXqH4iyl+E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lErNgvwraulB0W+qXEc4jaS4tQApQD2kNvxigwflIS8OSD81H/6xTANKPcsdw0GjQ
	 2RJIVvJtvwXr8Ic4yq+C1N2HMkJ5FZpMXePtjl8rC0HovSahlJIwE7dvDFuAmCEs1G
	 MrqSWjz15/+k4weSFR4id1N44DR/HsohWzeO0S35JzpFbrrzJh5l+367qld6vzv/W2
	 sdDXNlYELk+9CsDJZmto6MJ3uVeMIFHLZVApYhId5UVhB/6Tu8bZWoifbPmcUHKOHg
	 +h+hwNx7v9wSp633SSx81PGC6tLXRUduqe8JE+gWUuhiVDAOZ49hkT3PKmPyENoKc0
	 QM88SugaWWPsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9895247F4A;
	Sun,  8 Nov 2026 12:25:55 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 06:25:54 -0600
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
Message-Id: <20261108-octeon-of-leak-fix-v1-v1-1-e01375b37df0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMBDFriKzdsAR/OBVxEXVVx2UVloRQby7x
 WUIyUMRQRGpyx4KuDSqdwkkz2hajVvAOiemsihrkaJlP53wjr3lHWZjqzdfwq2txkaMmVGBUns
 EJPN/++F9PzvNcy9nAAAA
X-Change-ID: 20261108-octeon-of-leak-fix-v1-8f5b71aade5e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140755; l=2387;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=VNX+2iqdOu/lze2xi906L+WVy9CUayyc69uK+5bcJHs=;
 b=lnwP8NZD6lKhXkaWGaelnAspmjoWYgJ97kGcj1BXwWqTo3XWVT2busGeFo8rGY0ZcpbtJRwgp
 o4Fx0KZZOlwAdDuARATN4PiK+IRfs3YgPn25Gqi0I5GqgIIAmUBkrDr
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
This patch ensures strict compliance with device-tree subsystem references 
and tracking during interface destruction sequences.

1. Add explicit calls to of_phy_deregister_fixed_link() and balance device 
   node reference counts via of_node_put() during probe aborts and module teardowns.

Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: fix OF node and fixed-link leaks on error and teardown
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
change-id: 20261108-octeon-of-leak-fix-v1-8f5b71aade5e

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


