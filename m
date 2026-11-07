Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794037017;
	b=P90aWv5u2n0XRfclwJMK3yoX76rgHHc/D/ax2McrB6c/lAXGEULrRRKZ4nX81QusJFm3
	 S/qeyNGLzrSO4HuDbZrtZ+WCIhQBlRiddG4sziO64OO5stfTTXqJPg+fURo2KPFnc3DR1
	 ++mNPFwuwmBQ2t2Hl1zLYxD5kXMMkLri1LI0tUe5AHNIl+JOKah3gAg5hhSUrHtrSByGt
	 +M9djXwBptZOIVX2OhVt0y/2/zhBjze8OPhq+dYOIjvB8uWKei2vw07UTVgqalEZWIg9M
	 RP+NnBitsPDwpZy99p+x9RBu1CoJDHavCdjNYZtwv4nQAfXSQ2e3Ji/8LQW+hTGVDUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037017;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gTVhkDIuv1lUbwGdIPo4ekZg7TBzPBYY7NN5YsMWTlk=;
	b=pXi42zEUuZFq4aofAdm0pIeEI9XPVz6Dwlkk37ES/0gYOoSeO4L9cULQ29ezX3UFMfEq
	 hyqBN0m61Qi+ViIXuECzA5mTJhySHTXIbyaOdb3vO7s9px3LahIX91UqMLaESEsdMLpvp
	 Cs07Nhrl0b61Ppg45i9n+2esXhx1PR7htHtKPCFKGBNbKWpjMnRkluC4Hg0q1CgB9BhDS
	 TjZAypcjSZACNIdqiCrvmUTu8ItFieug5lGe9HN03IhHES8RTT6FE96LpG2zB7Ly9kttP
	 hZNCSbxAdzJ27yUwTKCs3RuP/s2EX3I3wDZ7CRTQZ5upxqzVz1WcPtIUyfazb7fgaYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XvlL6E/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35A0606A326;
	Sat,  7 Nov 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvlL6E/1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794037016;
	b=FqFXt26yGnG3dOcK0zWftjyDfrqB5GxpxSI57MWpsPCfSvKfuBLqR1FJP0slZ1SmHQWB
	 C9+aOBU4nzAhCAdPyhDqcdQIdgkV1hlmD2FTWOb6Z3SKR4qS7oiQVP/sg3JsIv5OdvIrs
	 qW8fJN4XNErjOlZFJbII9TnbjDghOR8UTeXv2Sfgmh+/+WPy+GqnnTRJtoidXV6Qf9qkr
	 N6O/qFFMmG5O9tqr6PI5dbweUdsNl1QE+nfA4fMkTjFM7rGPSX5eOoB8GlIzzpWEgFe3Q
	 9YM13mWzQM3oHg2LW8G9F6SPtcMmJz/pNc7Mrn/WnWJ0zX+YE0uAQArm/xMx3x8lCTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794037016;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gTVhkDIuv1lUbwGdIPo4ekZg7TBzPBYY7NN5YsMWTlk=;
	b=2QO+LlnSf9lGT95betfHeoyp1Woix+TBRT7x6HEcqSEZzDyTdrHa+T4hEfVbN18rp2tA
	 XeKLwGJKCWA9zSGjam11Ysfy/wbu1CoSAJQZN6ES0oOlqzlx04+qHs34NnWlV5+qnEdWG
	 fpre4EPokTsojvUg0WqzNWTZg+e0Wbaw5zxq1rd/JHTmzIXkt5JeuxJwidCFiuJOev6W5
	 BGIUjpUG8RhwNYtgjLgZsVBHn1IXoCxAueMkK2wZbbJv8syp/WrKraIoUVrK5qPH96i4u
	 dG0FBgC/woS1Con3QFNhhCIaMDVl55IR7BqeV016U8mNfnWzt7M2QA017RF7OKrYKaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9F9F1F0089F;
	Sat,  7 Nov 2026 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794037016;
	bh=gTVhkDIuv1lUbwGdIPo4ekZg7TBzPBYY7NN5YsMWTlk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XvlL6E/1mwyUykQ7sbJmdPxjufLbEp5V9fjb6cq/ebTwE61WPV/IqxsRjykl7Mf84
	 wJGtEWP98jgIDYGArybE0M8nUll4w3TYy4J96tJcnKHqtVwy+shBnFCazZ14a0nbMK
	 tRVyLsmZFmPI8oBof3dD2loq46j3oegIcALtR1qUTskzXaHEUA9feQil2xjoABZBVc
	 ALwvkS8+GzpAAMO+vZ2/+IC8WZTKPjiyF9nkgDTLcoSKFnIz9DKZ239DKQL85gICxL
	 vyDlRmIIUzOFQaXBkhQn632nEpgG18/z/5Bt+2zoAM0qHZzULC0dTfgt9Gk0NymTMJ
	 aFa+Zqqv5h88w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 77AF447B04;
	Sat,  7 Nov 2026 07:36:55 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 01:36:54 -0600
Subject: [PATCH] staging: octeon: match exact interface names in
 pow_send_list
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
Message-Id: <20261107-octeon-pow-send-list-v1-1-2d28dac15e88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAYakYpeRRxKjRqQVhpRQby7x
 fEN/z+gnIUVevNA5lNUUiygykBYfVwYZSqG2taOyLaYwsEp4p4uVI4TbqIHdl3TsnOe7GyhpHv
 mWe5/O4zv+wFlhsHGZgAAAA==
X-Change-ID: 20261107-octeon-pow-send-list-9947e66a10f0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794037015; l=1785;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=LZq7fls08J5yskhU+V6oLqK+G4OJgckR9NNE461HpQk=;
 b=R565vkHb4kNeLNhL4BNL6i0osW23mL9ij/xRVWJrd12UEoNI1JiVQB/l3CSD4StUXHrJ+H60z
 wwfgmMKoINgBPEsCJ1zP/TCVRF8zMwLkP3FPAXImfu5FwvEeV791yAh
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_common_init() checks whether dev->name is present in the
comma-separated pow_send_list module parameter using strstr(). This
causes false positives when one interface name is a prefix of another
(for example, matching "eth1" when pow_send_list contains "eth10").

Copy pow_send_list to a temporary buffer, tokenize it with strsep(),
and compare each comma-separated entry with strcmp().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..6684eeb3fc8f 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -431,9 +431,23 @@ int cvm_oct_common_init(struct net_device *dev)
 	 * Force the interface to use the POW send if always_use_pow
 	 * was specified or it is in the pow send list.
 	 */
-	if ((pow_send_group != -1) &&
-	    (always_use_pow || strstr(pow_send_list, dev->name)))
-		priv->queue = -1;
+	if (pow_send_group != -1) {
+		if (always_use_pow) {
+			priv->queue = -1;
+		} else if (pow_send_list[0]) {
+			char list[sizeof(pow_send_list)];
+			char *p = list;
+			char *token;
+
+			strscpy(list, pow_send_list, sizeof(list));
+			while ((token = strsep(&p, ",")) != NULL) {
+				if (!strcmp(token, dev->name)) {
+					priv->queue = -1;
+					break;
+				}
+			}
+		}
+	}
 
 	if (priv->queue != -1)
 		dev->features |= NETIF_F_SG | NETIF_F_IP_CSUM;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-pow-send-list-9947e66a10f0

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


