Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103679;
	b=LBrn3vNzj56q0nQZc9yxokrkMQwf2CkksioL+Txi57zIxeqDyN04bGAuanBioELN5J9h
	 sbNJ/AKY7OsiCrQ77M1afRYb+yrLUHMqvVMEG4yjFWgzHPXdqaWB73VjEG7X0x8kjhKwC
	 9H7mLW5lULzO5LyprJ+/JX5q4ifMBFXlufKZ35aIRsnQfIgNmsrfHIhxwdDURXTKgHcne
	 rYcIHLnuHZZkOKIXYlZZCJ7qa8OzOGOEAZeMAh9MuI2hO/ziUiOojdeE0bvt9G5oVIPEB
	 qnkTDWPLwrFGwfClR7xS+tjDhITYSpCieuCglTOUSkXNyn87H10jJS+F2Nk2pZPrYCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103679;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7rEbBmnrDSPRKg4CdtX+9qsizNsk+ESguTdy29rXj/A=;
	b=wX04h+cP7JYVXFQZRpe7XYPjkmfkoHW1k6V12RRFW8ybEsYtQHnXI3P4vMcs7Pz6NOcV
	 YH6FU7vl5fJnTWqBbIwJS1moxv0aj4ZgXo5d7VcBZLaXgMv0gPO0WJZJkwQgsJ8CgkiNA
	 vpsfZAYYuU2qf4p4wHOP75oeas6457rIcHwsM5G5CyKPClyUpvyTjqwO33L1VbgJw1w3q
	 HnWd3PpSEEP0BDIB/P7qSM60gu2fQx/Rk0kEb3Sk0qtmZfPKv3ocTFbrELMdm16BexNOr
	 SqcxBYh2heoWgjd7ZYpltcXXUXHbw+d7hFTxSxiur4xKNwzbyUxmiDz5wsP/TOqq4vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8NiJNno;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE7606A31E;
	Sun,  8 Nov 2026 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8NiJNno
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794103678;
	b=d3TBcRhkRxPnjB4a2lk7p2QOI7xTtPClsSqIU1Ny6QDyAd0HHjQi1+Zduaw17M3QV4TF
	 UBWHOyLoNQIbDgLa0ZC8XFwaPzz7k8cuucdGuAT5LZy9Lm6MTrugUfap81ifuaHFQHFhZ
	 PnXpX5k1CTiXxMn7Hn1xB72NDDQ8W1hnFKV3FriRRapJlGGW9KcFRiLzRSowRte8C3pzK
	 fXwKYMdY5HueJdKHRqGSJGRLbHMUQd3aE+eMBk9ZZXp5BFoZ29u2M1+6Iz/8EDyRlD+Ul
	 0CAbuVm8l5ldhZNXNo6IOvoPSzI4lesnGUup+8tDO3hqehx+81gsLjNIGVlf7NXU1Aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794103678;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7rEbBmnrDSPRKg4CdtX+9qsizNsk+ESguTdy29rXj/A=;
	b=jbqkLbDGC2HpUIVn678RtqlAeNJyejdXpkhy1dld53HKUG7qNiybIUCmhhzL34+q6ylK
	 VMd2jGUR0bb4IGuNrh4HiglJgVvQb/6j/c4EyOrchWcvfmPcW6lOFaP+zva0AbzBLGML0
	 Y/7aydjFksXzfsOlqmifx2+73Rihe6ITkDO4hB7uaFcQsUAwrqPhDSsmk5ufIS1XmlCQn
	 RR6LtGsiW6t5QLujwa8vuDnS7wcgvLJkVqRLfIp9GIS7Zg/sP1wXlw+R4WTfgjqb57j1o
	 ABVeq+jXOYATAPm5jNHQY7PZqhtHTAyo+aiW/yQTfINrnxs9mo+UE4BNA/5T8VS9JyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB7371F008A3;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794103678;
	bh=7rEbBmnrDSPRKg4CdtX+9qsizNsk+ESguTdy29rXj/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b8NiJNnopuPtFWQPxbxQgrYiP+gdl920zSDlS6spWvXPs1bgeCYQymPrjLdfARC6N
	 NDVd9TKl8a9flFqwNm/PAf9rB4pxsbgAQ7Ae0qID+wFtCLcL2mqt31kws4n3K77CPF
	 l06AYJqppHo9KoVKW7e3WdfHRpKxrM8qsQp1zYfj938on5N1XP2sTcVb8s2pRUu3cT
	 LGGQtkbDB+G6ELAeizXk+aMBaoOZLTc/2kM76AesNTrNIMfFNZQQ9iS9CrcqlcA0QI
	 8ukiTF2D1Ve3+03hGqKz0aqKmrAXWYfEG07jrYqAdpfzvS+Uv3aGe7TYMvfUtW+Pfb
	 wG6cwOnaeYnTQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 76D8347DA5;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 20:07:57 -0600
Subject: [PATCH 3/4] staging: octeon: fix race condition and log macro in
 ethernet-rgmii.c
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
Message-Id: <20261107-octeon-phy-series-v2-v1-3-d7ab0b4b3f17@gmail.com>
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
In-Reply-To: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794103676; l=2398;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=c7IDkn8SsaMFf7JTubke6cF4FA0eUXNFWJMVYKLJlz0=;
 b=ejVMpeDFts9z8ypXvJWKWYaHqkpq0YIfv9Q8umP+IaHJxqu4hUOEtrazb1kEeFyz+ApFr1osg
 J3t7W19oEB9DaUS22iRxqcRrK3GyDtTuLs4/JzZcabMvUMd+/esigxA
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix a race condition in cvm_oct_check_preamble_errors() by moving the
read assignment of priv->link_info inside the global_register_lock
protected critical section. This prevents unsynchronized read-accesses
concurring with status mutations from concurrent polling contexts.

Additionally, modernize the message output by replacing the obsolete
printk_ratelimited() call with netdev_notice_ratelimited().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-rgmii.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
index 0c4fac31540a..a9a245b5580a 100644
--- a/drivers/staging/octeon/ethernet-rgmii.c
+++ b/drivers/staging/octeon/ethernet-rgmii.c
@@ -9,8 +9,6 @@
 #include <linux/netdevice.h>
 #include <linux/interrupt.h>
 #include <linux/phy.h>
-#include <linux/ratelimit.h>
-#include <net/dst.h>
 
 #include "octeon-ethernet.h"
 #include "ethernet-defines.h"
@@ -56,14 +54,14 @@ static void cvm_oct_check_preamble_errors(struct net_device *dev)
 	union cvmx_helper_link_info link_info;
 	unsigned long flags;
 
-	link_info.u64 = priv->link_info;
-
 	/*
 	 * Take the global register lock since we are going to
 	 * touch registers that affect more than one port.
 	 */
 	spin_lock_irqsave(&global_register_lock, flags);
 
+	link_info.u64 = priv->link_info;
+
 	if (link_info.s.speed == 10 && priv->last_speed == 10) {
 		/*
 		 * Read the GMXX_RXX_INT_REG[PCTERR] bit and see if we are
@@ -74,7 +72,7 @@ static void cvm_oct_check_preamble_errors(struct net_device *dev)
 		union cvmx_gmxx_rxx_int_reg gmxx_rxx_int_reg;
 
 		gmxx_rxx_int_reg.u64 = cvmx_read_csr(CVMX_GMXX_RXX_INT_REG
-							(index, interface));
+		(index, interface));
 		if (gmxx_rxx_int_reg.s.pcterr) {
 			/*
 			 * We are getting preamble errors at 10Mbps. Most
@@ -83,8 +81,8 @@ static void cvm_oct_check_preamble_errors(struct net_device *dev)
 			 * disable preamble checking and do it in software.
 			 */
 			cvm_oct_set_hw_preamble(priv, false);
-			printk_ratelimited("%s: Using 10Mbps with software preamble removal\n",
-					   dev->name);
+			net_notice_ratelimited("%s: Using 10Mbps with software preamble removal\n",
+					       dev->name);
 		}
 	} else {
 		/*

-- 
2.56.0


