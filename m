Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066733;
	b=ZJvhTPSK07PrCStOBFmQoNrkwxcOHSgzbO25GxcSx/lZljPEgEgSdJhFvmtc/xgXv4OZ
	 XK+TYZqhz2LOJEMK2SQL83z2+MtEwZWFVefE0pkRcd+azRST55ylAVLqKU2D8ah+9qyaB
	 ddJ6uAueUsDyyxMPXfYTcflHgc/H6W8mSr/j0UzRJwGz1GiyVc38ACSU+nKZYzA9PsJP6
	 Op2ElPOD/1E6PjZEFki673DgbuCDX+etTB1WiaCEw57CVfKKeKkjqG4cN+cY7oedjPcFl
	 VKL6a/V41EeWQJzsOHbqSyv7CUT2ba73wbzGslYgrQLT+Owt2inElIPvEeiQBMiFx9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066733;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AD5AAn8yuhO9x2szXVSoncfmQo2pH4jsIMh8652qAUw=;
	b=KSZ1tyAZ6bi0No2UxUBHT3YsIbCZ0YrAoEFLsb8SB9BfX4KvqKJU6q2dPNkXoxXoT/MV
	 8WCDksXwc7TOxzvWq+iJfO5hUoWhSlKLE+NvPaRcjRbIkXreqwSUhy+/h3Bw9kb97YHw3
	 AK8a27xSZ2rwhKkFPzV9sVRNmklQbawNVTCN5RK21aPbYaptGRZOPNUWjOIqmKpypYVZR
	 Hyj9xK2dbx5KH3jo0AxLTfbqpdo3pBmpiT7k7hLB/JbwqaMCyliLXGPSWVFSOyf+UbJqx
	 Z49awcfHnxqmDuKJAfW/F2UOMp/jL44sypn3+T2VFzhklAinmWOejRgIh1QKy6stBbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Huf4SNAK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92C606A32D;
	Sat,  7 Nov 2026 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Huf4SNAK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794066732;
	b=crkiwngtUBkhry1b6/I1i8Oix9l9Ky4TZiDk8CatPEW6MJIFrbVcLFE9UeNA2fPY873y
	 A9z34qkKDkhdfdrf0NsYBOMcOM5K9wKuW2E5Qs9OWRporRuDYCMRpLwxNHZA/B+YCyzac
	 3e5q9V8himhd38aOZuMrzf/8bZxT8z6oq8SoWudAhr0uV0zvm2+NSh7+aASwLiMnsJOeL
	 KmuvWCDaoKvH4jCcYa4Caf8BvS8zkWzlvbjZNrzRbYEi0kPNmNdtq2qs8jMrg9rgF8IH+
	 RijcZv6h1ik53Cvr/+vKXAYmQVvqOAS6f/QbSXXHGkZU6MIoTMHsObBvCIUH1XsgiOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794066732;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AD5AAn8yuhO9x2szXVSoncfmQo2pH4jsIMh8652qAUw=;
	b=UXbV01vV6aIyJnoqSulg6Mwn75vu/AuJoqSeqWyHzqBEnPgU9DaibY/9JRdbnGQ14M3+
	 AqDCV2NqGDmwBdQE7nMUoZGpMjvvbzC9l5o/HARzKP80rIGhfPd5dWnbh/UWDWTkNlKeu
	 KhPlnBkRrMLO4FCkHNR7Aw/0mEpYuIlIni2Q37TWkWnCtOIgI0MtmtWmsJG87sMf1tMs7
	 84U2epzsEN5PyQXY4t8HJHEvQpcQCwI3b7dqB+vUCp05A6tgjFob7OOsEWimdD4r0g0R9
	 B9uyVglepqBMJERD9ZTznrSOxh9S2cnIFxhB4auOfpVDw3VuVU1OZesiVCGurQEBvQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 333C91F0089F;
	Sat,  7 Nov 2026 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794066732;
	bh=AD5AAn8yuhO9x2szXVSoncfmQo2pH4jsIMh8652qAUw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Huf4SNAKhfHxs71r8uEJHAkKdoHiInO8G/kbddrzoy8idYKDqjuPq9amOA7UqFFeo
	 HHAlwa5+DDrX1Qe3QYF64ndCasKfatgKHXp7dUH+Ka14yA06MAmsM1JJbv021Rwath
	 CObDV0rsnvkewXYYX4GT9v6bWytVbwR3lwRODxBwS8tQVA130B0QZMnTsakMGAEIjw
	 Y/IqNR7+h8MTOY9WUz/TdFkUASlQsqO9tR/q2ms7SZyHUdYEMiy9q9wHu+WqZgKvVm
	 sKtNmoHLOoMmKzFLj2rcAIjD486yxdF8vKLst1meMYP1jCBlSrH7gzliO9H8UuDo62
	 10KMMHqWDi+wQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B40A747C63;
	Sat,  7 Nov 2026 15:52:11 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 09:52:10 -0600
Subject: [PATCH] staging: octeon: fix race condition and log macro in
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
Message-Id: <20261107-octeon-rgmii-fixes-v1-1-3cd7734fd2ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtwTAy6SrTImmoWaWhEEN49a
 fn4/BcyJ+EMvXoh8S1ZYqigRsG8T2FjlKUajDaOSHcY54tjwLQdIrjKwxknto6sbj15A3U8E/+
 hfsNYygehzEmMZAAAAA==
X-Change-ID: 20261107-octeon-rgmii-fixes-ae461403b1b2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794066731; l=2577;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=DrxoTmYjSJi2uco1KKjsDaAerIlUruP9wlDfDiu5NnM=;
 b=BBI6s3s35XDFSbS2Qs7f4cj1adJOdDAd9JORcFBSunyGF0FefVDt3OVkGhTSalf1X2URDja6O
 YFW+tRVwFQYBQUDT0fPdLmgTtQdzg5+jiPDeV+OX3u01JeH9HyOnAAT
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

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-rgmii-fixes-ae461403b1b2

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


