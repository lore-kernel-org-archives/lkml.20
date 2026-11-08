Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140397;
	b=b0KdMQ+mQZQk+fDnkr7h0Y8GcY7XzaNrMKF4qOp2oJzj39yrggzISPgWQICMARFscE1v
	 pJRBQgEGkdIU9OpMT2AOu4Bn/wxt1ov3wdeEpMdoYuozm0QJzKWhJiY9ZH619YwZZ9bBB
	 nMtM2L4YsNurSJ0uqHjnBZ/hmubo6RAY6OT0YXJcQc+OMADZW0Vl4G6hzUZNVMZgJXZNX
	 +iHwNl5y0tBRtP0MPq9B+9S/4WPPgeDYRbs/G77LSqaZptFV3fZUDFccrPsGl1LgnB27v
	 tM42CzmBy7LKsI2frZKdG4jcPEqExonx+ji+PT7+18feHBB2Odea+M5RD9Drqzr3VRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140397;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VF6/f+a/k5P3djgI48XHAygTX/6/Cg1IAOEXeg2LGtg=;
	b=RH1Y3ZSIv/r2HLX7cygfjL3bXZQquzZFUxxqlFhjbOar35VXU61jLvMrNRUtY5q0Qnak
	 bP88EhGQDhxPKeTanzDDuB/xxgu6xWPDeDMYJarl+C4xMvo292dDb/4AYSL1FyomhnT0z
	 QZllWlddcSho7FDw/DCFNDzXb+NqOhszHY/nXgDa3JzHNTIJjxmR6GAmGX5V35Ya8wS0K
	 IG2Xhw2sxLCIc4IBZwYu/mRbz86Amh0IDDF7XWApRqqd+OZ81hZsx9H70wN3LyqoI1yCL
	 mdScIfrarpEiFvxWoTw5vQc0m+UWd2PkFckmMu817pL4TBz6Qm9k4A5pwddPCejKH9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2ecUj2v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFC606A321;
	Sun,  8 Nov 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2ecUj2v
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140396;
	b=ZitpRdd76yUZtqprC0m20VwIsb1n2LrmwQVfHvwyDSj3k1eEUCktPpmL2jR39CbCKFGM
	 RauVoMebSIhb9XsbHbpuf4e9NwZ0pmzQchD13HYYe9S1o5ygVSu4sCyV1O21bluNlk1Cf
	 cmENRH/O/dIsoOc6gu0bntYNl1dPzfEIb623hH/lW4xME5rTdVV2XAkcH2rrvCDqBRiff
	 /CS+vNbSO+y6872yjoeUREePJW7ws3WMXCqzN2mznd3RjQUqmLnP/EU9uTPsVwDWShjk3
	 espOd7qoje4/3RPcGBA1UJtz/MEFwXEYg6xcmiih+DH4c2epLwsrBvxAo52fHE1JkqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140396;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VF6/f+a/k5P3djgI48XHAygTX/6/Cg1IAOEXeg2LGtg=;
	b=nfJqfPI5BLtt5WpyD/E6Oky57uS5r7qaF89IohuTZO9kCMS0wDER5b5I15nNSUbthbNF
	 dPjVl4CBajIE9UAmxZ5+SA4EQSmVjA3l8d90Lc7pT8DbvAcWDjTuKkEceQle7XaMkBHa5
	 +rxUGUqjz5+pq4PgKNReogQOg6MVAAsZT/Mv0gwCydTwJJtDvi7DIvPNrzTdhWiMKexlH
	 qTwejkLfWgJAhTVYSEZhPUCSfpKXvyez6xVXyaQqLFgk6kmKXzT6yR9G3UUpy6Dtz4raK
	 0w18cllIrEFTVVefHJ2+WlY1XraJgXurctq+311UkN4CAWp4kJsK3iRV+hknGvDVKZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 269C71F008A1;
	Sun,  8 Nov 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140396;
	bh=VF6/f+a/k5P3djgI48XHAygTX/6/Cg1IAOEXeg2LGtg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=P2ecUj2v94K4g9tYyVkjornt8J3WLsvI3NmVhXJRQ+7OMY9Zls+5LP52UoFrUoKKU
	 HlQ3uiCBoxVU+ErkOztlGP4JcL/+CtwQlKAkSI8v/L+EOK52Af+CzrrvYcfrYUsl0F
	 7w8AhlG2DxcysTNtfrI+ltDrclF0v2lSIw71KHs8Ptu3XRrc8n59jF+P7J9IzO4BZk
	 PuCXb6oCQZLmaQNekmE5m85nexRu0kAVcH/VD/hEqw/wkxqPxhyUnc43bPDHS7Pu2r
	 S3ukt54O0nO8bLvjqi6js8LCv14ZvyBlHJZsglBU0THKgfdLODi3iCkJmIR3qkVhQ9
	 Olywrgi15BQgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 95E8247F43;
	Sun,  8 Nov 2026 12:19:55 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 06:19:54 -0600
Subject: [PATCH] staging: octeon: remove unnecessary parentheses
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
Message-Id: <20261108-octeon-parentheses-cleanup-v1-v1-1-5cb0e33e408b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAF0KvIrDvgGFtKr1K6COlXB8okZKwI4
 t0bunybd5CjKpwe3UEVm7pma5BLR2mJNoP13UxDP9xE+jvntCIbl1hh6wKHc/og2rfwJpxkCiF
 c4ygCakepmHT//8/Xef4AbAZM8G8AAAA=
X-Change-ID: 20261108-octeon-parentheses-cleanup-v1-c1f3335a411e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140395; l=2579;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=45TA3tH14jQOLZIxqvC60w5pZsW++bfpzW50OY9RC5Q=;
 b=SVzMOdmrV9F9P1MobY4hqTP0n3zxuwDxmgvSwtFQe55wZOpDKdnzqjd0TgqUayMxGn5KGoi4g
 K2S4HrzjC4xCfypSWcacGUaABQlbyQoQhHAm/4HtgakmFQWzv+ocaU9
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Remove unnecessary parentheses around conditional expressions in
ethernet.c to satisfy checkpatch.pl --strict warnings.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
This single patch cleans up minor checkpatch.pl styling warnings within the core 
ethernet logic of the Cavium Octeon staging driver.

1. Remove redundant parentheses around conditional checks inside 
   cvm_oct_common_change_mtu, cvm_oct_common_set_multicast_list, and 
   cvm_oct_set_mac_filter.

Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: remove unnecessary parentheses
---
 drivers/staging/octeon/ethernet.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..f374fdf8f7a9 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -262,9 +262,9 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int index = INDEX(priv->port);
 		/* Add ethernet header and FCS, and VLAN if configured. */
 		int max_packet = new_mtu + mtu_overhead;
@@ -308,9 +308,9 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		union cvmx_gmxx_rxx_adr_ctl control;
 		int index = INDEX(priv->port);
 
@@ -360,9 +360,9 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int i;
 		const u8 *ptr = dev->dev_addr;
 		u64 mac = 0;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-parentheses-cleanup-v1-c1f3335a411e

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


