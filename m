Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794027555;
	b=spCmW6ykRfIMz+teySn2yVdWf25stzfpNLSjHBbVkmrQe6Z3Q1z+iGDx68nUns/zOzE8
	 QVfQqJpySwZ+TlH4ti7X2WlqGDpDU45tTYo2/GER+vfDDJg6lwqA2qa72lhpvclie5V2A
	 mQCwO3DKwv4hUE/MqgUe8m1g8LvRocud/GjSVE0wt49KqMYaiFeTD6BocYYYrnS80nbeL
	 gkIWhvM6Mzo18IdnMdqrf7oD8rQ36wgdRf7wzjgm4avFH0A8r+pDhsXMomtXVW8YIofw/
	 0Fu+qXp5mXOaeF4OLFmPXQjV44NpBIg5p2kaHtJa6Rw5JdX4wsAK8IWGsvTxA0A6xqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794027555;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JG7W6UVA9QRz3G4sq+Uyt2IaHkXqHZdixEJBcLNaCH8=;
	b=cWbpL/FhwP5CzssCHg04ip+iTaEtYTnX5XgIgBpvfKdXrpOPd9113VAVqvU+n64ACJ6c
	 Q2Gf4H2u1nSWfSU9EzPslZ6T0cmJjOQn/3nP2UHm5kYqq/iGt+wF0O/t//1WO/CN6nEgC
	 VHyvaHwF6WM2PchZ0h+LfJkcq7QMdAc2Gxhy8DLLDPFyUrtq5pD+MV+F+v7CJ6yZey3a1
	 GulzKBitaCZNLFwV+f1mk4Sco7z+FoCM0QQYWgz9bcR+CXVN02z8a03XHIi/lOlFeUbvg
	 eMDqwnfNZMcHW0wQqc5oB7W2iquGjU3YYaFrishQ6buLVxKvnIOw561ZmQy5X+y/Z2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKmfXH4O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF64606A32C;
	Sat,  7 Nov 2026 04:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKmfXH4O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794027554;
	b=R3qEkxG5WLxSDc6DqA5K9fVHHCAN8Jklnjp27l3VGESUNoH+VTpOR9CytNvXqegUfbHo
	 6X2fkk4cho5WJ7Ihw0RQqU92hs5NwNGmg+hC4RVsL/QbbiXJ6m+XMh4xTwWwQnk1q4Et5
	 DReAqFvoc34hltn8rm5U8398rwjeFZDxAKn7is7xBgEeHeTRDSerlVMoTE0ERiAoCDZpQ
	 Pmv3+WVRh61inWDB15Qonwo8ylbhp/sLZ9lTFriKAb1JCRChhkYByNXhEJIz0Rf4UUOjv
	 b+pQg7p+z33xyWiVvvJEOPh3KllzX7iwMFEsIRbtzXiSIsZUC71Bi3yLXvaTSyY8WGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794027554;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JG7W6UVA9QRz3G4sq+Uyt2IaHkXqHZdixEJBcLNaCH8=;
	b=Jag6AAlDfRtF1+wi7YV8g/la7oze3+oJ4tUR3f/WrKEaWfWbSvm6cKTc8mv33ZEDQx4Z
	 rMs3FXALJJGgh8/sjnCRWgUd8nWyAYn5uWtF1zuDXA0GmkCjtGmEISpMrYqQx/szlfl/p
	 QL6lkMKUtcJXc986cV+DD1A2l3F7Ucgxkyk5KA5GM45c5B+t7PQjbCHuNoAZ5GsgNGOfO
	 hDu5R1mjDFo3/o6xipownrUcvGpo6OcUWFR94MSka/9uqVJNyVsGkxhRr1kWFhJ3KOZbM
	 m1Ps9EIkfgaigo4Q2Z7MKpz3acLrqymEt01LUz6ZadE0bEPcDcIoVIYcFO9tDmNTptA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5CAF1F0089F;
	Sat,  7 Nov 2026 04:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794027554;
	bh=JG7W6UVA9QRz3G4sq+Uyt2IaHkXqHZdixEJBcLNaCH8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=eKmfXH4OZKasWROgizb06N0Y0Nf6AEJ3Tb7XQhjopF78Qowo7yf7yksQ7rQAN4ku/
	 uWB9fXbnZ5zgEl2ZFQyMXAHMa/eEoodEoYflVQ9eUxGk3Pon+/5xhNSt+ArT8G+wla
	 b4LCA4JioZ6oLg1MV22LIhN1oRTf+J8iEXb1I4PaMJdRhI6pyt3RYz1p7gf0NqFtvE
	 LyRSGRHpFXH1dfG7CJ9fEaq/IBlOxi/z8jAVRhJ6aUtRbjsCnmHiz/3sF48FS5PZSO
	 hql88HTIXw3oqgTOxrV7Fhl8lv0wd+oD+9sIQDnG3KiqlwYBIq5FiZawcwjHxW5ekL
	 C9BAlNjBBtUFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E1C347AAE;
	Sat,  7 Nov 2026 04:59:13 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 22:59:03 -0600
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
Message-Id: <20261106-octeon-ethernet-cleanup-v1-1-c2097ddf0f1e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBG4auUWTuQqTSKVxEXZfxjB2RSkihC6
 d0NXX6L9zaqKIZKt2Gjgq9Vy94hp4F0mf0Ftmc3jWGMIiFy1obsjLagOBrrG7N/Vr6ekwbRSS4
 pUq/XgmS/43x/7Psfb7SA9GkAAAA=
X-Change-ID: 20261106-octeon-ethernet-cleanup-83fc01c517f6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794027552; l=2173;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=PJ5qT9SA/UqyHsHtyIulPNEhKhLlvhrvhk1uX2c9Nrs=;
 b=TEm6Y+lbP7K+YmCK1eCETNIugHmko8OvWoeSTZDAXebtSsO5zdTPqYwyhRR39beDITJRRKQWz
 IllMZvXHDe8ATUIOQY4Jw9mTGOXzIOjVnvwGrKdXmbJIqCcpeQM5dvZ
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
change-id: 20261106-octeon-ethernet-cleanup-83fc01c517f6

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


