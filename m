Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317307;
	b=t04l5Gpf2hfMq3RgKIb8MYJHYXxINWOKEWAWx6LysBx4oupllN9U7fvaIWHyG/zON3f5
	 JEx5JmzHKQqE1rS1q5mvTri42BfKyE7DJFftMvfTTHF4NG5RBEfT++5zVWTtZBq/dzxRQ
	 SuRTav/pS+3k1kobmYuMX4JMXCQreX0dM6UGli1e1Gy1PZ4VK4cBQ2t4czcdlT/ecEXp0
	 44S+kqXRDiE+Aogt7O0s0vMUeLX3fnuGf8WCmnfL9oe23ZLTwCJAx2T3YQgA/23TkvVxE
	 6w+XehMsMDXZdk+ECLNyqELWA4Qcmjw7qj4UGu5EzupJN7M+4hV8GRINdF5sc4Nx9Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317307;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fUWl3obGCUO3NiGQKuqWXiuDxi7JouGoPBYumWeiMf0=;
	b=SYxmbs+yea+rYLAQEHD0OczgyKKyb5AmOylDBWY/mxIlEWVYF92Le3y5Rj7Os8pyls+l
	 h+NNsi889Qmb2g3VahPLkW3iVVb08TJQ5fqtsZlt1ioUTGy7Twe4iHgIqSnX1OL3qxiZg
	 Eic/nC1iSPDk5Z/N9mkkN274cynMr2tf3O2t5lDeate+F7cR8JgN9/Lzxp0OzgCFBYXv6
	 XdIieZ0zBcXv1Vdq9mvzZbLVj9M5ziWtNq7GajgDYlSY7mGB4hBUaDV7Oi6g4iqQfisXK
	 D+YzUJYtMGOLb5+DkFho3QplgT5sI6ye3A15T6NDO/ShL3OpZkfFaDErvwxfFpkk7LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9jeyRzO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286B606A755;
	Tue, 10 Nov 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9jeyRzO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794317307;
	b=B7O8RYbXV8Ry498NtzReeW16APhjoVUWcnv5iLVfD3x3zaSt2DOH0E8yg7Reu/gPX+WM
	 LH2wR8Riiuidy+ExGDeHuXQjS4gtA69T9SDF2batE5kaHVdMyj7u5Mt60Sd4CeWP7tWEF
	 Dfj4s4Q2kT+1wCgRvzLfVdmm0RzMLMovqucR5nYN1dI9iHk9/8+21NLfGsBZpuQhSJqsz
	 bk8PCd1vWO2/qx7UfKYohgyul3h5ZfnkmQ4S3t9RgVlXRB7hnBJoqVWiWNvu7JQ/Z0we9
	 Ccf/vCmRwIyt6z8k4K2eHdAp609e0xSouzjWdpbZQv3QIF96OqcoxIKAvDBZctIqGxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794317307;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fUWl3obGCUO3NiGQKuqWXiuDxi7JouGoPBYumWeiMf0=;
	b=eBotnDiQFgNz8011cY7LpHD2OPeH/RiJxyxZXp328LRVsgh6PqoOElc5JpkXK53jGnPN
	 mhqs6NHxUgo+BKY+rriklNKLgrxumIO3LPgAuPBYWOdW7efBhCf+G0bkpOGblj2OHb6Xt
	 3BTLoDnZAZ9UcxA9awTMxfzgOp39uBm97j89IM8MB0+Kc9YFTwip0kQ0df4j6ZabKM9/X
	 tqIqeCpdtKY7CDA/n0ML1BpUqeJKcc/ZDi9LDKUxftaLDkZFVlNSRyvkK1wh4kJL89PvY
	 nIwT4mJ+lM0mtpMQe3Av2qdA1z+zM1SUB83kjoVJuz1IJKZOGMSt4NaTFOnFkRpIxng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 806651F0089F;
	Tue, 10 Nov 2026 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317306;
	bh=fUWl3obGCUO3NiGQKuqWXiuDxi7JouGoPBYumWeiMf0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=b9jeyRzOzhEF45p5gyS4/IWd0QPb27b/wLqtCDgdhDqgY5aKKzbiicEtmvzNWzYl/
	 +en+t6IifTecZ3YQ5z6of58zllbxa3cdDtZHldCLdYTu6BH42idNyoQAAo3S/1521i
	 5B2YGOmsG45dTNSD/0W7Ko4PObIchvKBrsQJLCWwouU2Rayz/jWGKeKRwPlkKUwKRe
	 0wDgl+3KlB6ZsB3f+ym5jjIanHflDLUA2/Kxqg6ku9VgYm6jRvKvWw4B62NfCBoahj
	 Zikh33rvOBhp0fWqZIfjLR34TCaZpCs+syi/b0oZLsNR+Vg24cF21ePuBhBUaOPfTv
	 vB9FfTW5pn1SA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 012B848B66;
	Tue, 10 Nov 2026 13:28:25 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:28:25 -0600
Subject: [PATCH v3] staging: octeon: fix OF node and fixed-link leaks
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
Message-Id: <20261110-octeon-of-node-leak-fix-v3-1-9cdd7e1d48fa@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2pCiuvIdhUcoUGqFjWkI0p
 He3cgGX7yX//R0SRU8JbtUOkTafPIcC9akCO5kwEvqhMCihGinFBdmuxAHZYeCBcCbzROffeNW
 16G1vlBIEZf2KVPRRfnSFJ59Wjp/jaJM/+7+5SZSotNOtdH3bWH0fF+Pns+UFupzzF8XjBrS+A
 AAA
X-Change-ID: 20261107-octeon-of-node-leak-fix-8530bcba220e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794317305; l=1834;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=jl1zaHvHGKs1nPczUORm41xcESZsx9ReVkyvB9xAjJ8=;
 b=wcq4qyYEf6+zZd6aBylkQJrPRqr6AWFbWWGX6sThGne0nm2+1AkoNb+krQ4VFyS0rh54QeCWz
 vVnVMZmaWxkDbrQfEthwB27z4oaDKvpe+HA7u19OHwv0vHx3yQXO28T
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Deregister fixed link and put OF node on probe failure and device removal
to prevent memory leaks.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: fix OF node and fixed-link leaks on error and teardown
---
Changes in v3:
- Rebase into mainline and perform cross compilation validation for MIPS64.
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
change-id: 20261107-octeon-of-node-leak-fix-8530bcba220e

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


