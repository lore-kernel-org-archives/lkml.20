Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103680;
	b=5FEDLtLnDPvRrBELND4Z3obFRROaTsas422n+Ga1/DozLGNZ5LrY028VOEezzSwKyGYn
	 twWhokHHTFfW+z1CdhKx1xIjMd5LbQgCECVjhgda7F7TJc2JXjWC/RY7ipFEpW2UcccVq
	 5DbpKesfXxBEShw8ZUgnG8bR1GBQYhOQ6bmG25hQqiHE46sF5h9CEdz1yyXLgpuMDwNB7
	 uu4y/GXOX/P+QcJ+yJGAd+KSrHblzqXvDp0VV8O7w+39v5zNtd4/jG0eWgOB3+Sic46oo
	 uIITaJMH/BQlX5+iQsnOFf4g7evU57NK8IEXqyhIOiF67hdvNRldFCLhI/QQ6PaPcZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=87H5Q/GdEWoPiwduaYdCRfiks0gJDFzk7ec+dSsPriE=;
	b=0Xn81FZ+AGe2eeSHIfq2x7EL1lSBJtYbE2+tYnIhH2CIQHY6ooGN5HZREJFXUUaD6NkN
	 WFFuEhaDLVXGnV6U9AmK2HN5RSwdWqqd2SQm1F+aDjA4tRyVtKS7kWk35jS8A3IvU8MCn
	 v2Xvr4OKACTI8r7O31NVEbP4o3/vB9fwoG9fldrnj1klqFLnWD+HoReQVdvvn8NLxyhgN
	 RQhHdyzulcFKTAuvjIqM4TqpOhJHIpoFEkUr1xht/t7fJsq4SE/LNXfv0ifxUAQaR04f/
	 Ew0oMTjVZEcB4Z9nwi+6V8dx3Ulhz85qmpvvJqUqzFqM74rK3PLm/0VN9eqfqj19z3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeKkFyw9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6B606A32A;
	Sun,  8 Nov 2026 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeKkFyw9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794103679;
	b=iqCh/gwh9OPdkMUENO0HVsQQ1y98Z+ttd9+Vj/VYtofrV4PivsSaAJZ2eQvPC7GMlibn
	 Xo04X5I2mrMeMeAQLxmILUbvT8Giq9IIBmuhaPJmIcOryeP8W2aQgedQzeWC81bfUQrzD
	 vewXc8HRHG97D9hmKdNMrHFSz3M2/ba2ZmlasPBs/KKISLfoZ02WtP1HxOwUOXWrQBXRz
	 XwnAX9Yw629hRgWJ0pH9xYRk+NqJsaplXePk+VEvwtL+mf6ekMzm6iySgUFwnV7ZX5idQ
	 mfkQcLh+0+zlC+YbgV50i6e1HJ7VGftkMB937A9S5U5lWDQDliitTpk35zoDLSnIGSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794103679;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=87H5Q/GdEWoPiwduaYdCRfiks0gJDFzk7ec+dSsPriE=;
	b=llxIArX0vfpEX5KNOUXnUSnQ2nIYGSDsPD/qNrXP04Pf5CodJH8hVoFpX4ldm8rrYZYf
	 ubK2sZOtt23QHXCcV9ed1dcBpDSHTD2bfvwxLq/5Wr0lcewAn3Wif42DwITdzlGLgPpxQ
	 kQUcORFdDwpOCn+yFzdZPsomi8hxVuzTy4LDqyMUj31GwJVQtF6uMKELkX/wSb3H3lzk4
	 x7IIXwELqdXzOz+5JMKvpngPwYRRrN3IKBDxJgUaNKSp5XZ5y92ww6zwAGBOxBDwNFthk
	 iY9cx+PHBPz6yhxVIgpsaU0RST10+Qy/XQHJ4xUYF45bFlq2u3e0RgIDhHA0DSPMOJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 066211F008A4;
	Sun,  8 Nov 2026 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794103679;
	bh=87H5Q/GdEWoPiwduaYdCRfiks0gJDFzk7ec+dSsPriE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EeKkFyw9MEAbGJfywYWFCzSFkNV2O9nUwer8pjbgtjIExXqdxBA7bPUIQQbuhVCS6
	 iqfqU2O/vJlw0gYJdxIaHfoF0vtif8hoPiKEOVCRWmHPtwf7Tt2PhH832a2ZwvWhHr
	 YvOa8gMmZ4MsnvI+i4HFZblskeKXk8vKwCLulISmzMKZZTKo3r1r5gWNMEjlKOR/TB
	 QuoTbhpd6XYl3YiS8nJupA8dpuWWOqdHJthzPl+eDL8Mb0plUU/B2Bp8O7oytSuAJ4
	 B894M5130d6NvsbHCFsJZXde+rgxcY3gwLlODDc3AVgy3K1WJYI802EwgLl0mjk+C/
	 9dCDdC9eN7x7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 862C147DA9;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 20:07:58 -0600
Subject: [PATCH 4/4] staging: octeon: fix IRQ leak error path and remove
 dst.h from ethernet-spi.c
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
Message-Id: <20261107-octeon-phy-series-v2-v1-4-d7ab0b4b3f17@gmail.com>
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
In-Reply-To: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794103676; l=1371;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=R/oKIlw7zjOe4R9w3qzlWN0J7x8RLy9bbUrOjNfj+Cs=;
 b=ycL/v3qP6qmuTouVF+wEqXfmlomp+Zc3Ei01cVp8NvU0Jl9UNxJkTCm8UdFhftsom8hmKvKJj
 Zs3PNjOT33RDIGAdXXcl9xH/OP/Ll1cKxiXgKBplSJkY9km2KOEes/D
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix a resource leak in cvm_oct_spi_init() by properly validating the
return value of cvm_oct_common_init(). If the common initialization
fails, perform a rollback by decrementing the spi port counter and
releasing the shared RML interrupt handler via free_irq().

Additionally, clean up the file header by removing the unused inclusion
of <net/dst.h>.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-spi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
index 699c98c5ec13..e6ebc879ccad 100644
--- a/drivers/staging/octeon/ethernet-spi.c
+++ b/drivers/staging/octeon/ethernet-spi.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/interrupt.h>
-#include <net/dst.h>
 
 #include "octeon-ethernet.h"
 #include "ethernet-defines.h"
@@ -206,7 +205,14 @@ int cvm_oct_spi_init(struct net_device *dev)
 		cvm_oct_spi_enable_error_reporting(INTERFACE(priv->port));
 		priv->poll = cvm_oct_spi_poll;
 	}
-	cvm_oct_common_init(dev);
+	r = cvm_oct_common_init(dev);
+	if (r) {
+		number_spi_ports--;
+		if (number_spi_ports == 0)
+			free_irq(OCTEON_IRQ_RML, &number_spi_ports);
+		return r;
+	}
+
 	return 0;
 }
 

-- 
2.56.0


