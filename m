Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454210;
	b=K2s7SUKveFf7r3O5cb2bN177fh4zXiMrT5pJOxKeOoWtlO4Pte6LPItGCVGw2qCR/h4v
	 0ioaIgMg6esUbhJQs/xlGacABtQ5+xVmGCkuFgR3YUjRa4JRsL1r7t8oQbPhg3jO47jGh
	 vtmAnPdhjyGzIklyGLXHyuE3zEvmatWXzz62LPNOtUbeiRvrgrhRx1/Nu1cOKby5YOT0o
	 sMZYfT85ov0pygNHJJOUPH5TPGuvdNvVcJNdXy0lU3nMKyhO0p+9vpKfYAMkAuEG2P16L
	 uScYP7yh0sbWE8Ziqg9eLF4o8Fwj/93wT+T7Q3EsLlszLT7LsxSjUs/HrSJrGZe5UvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454210;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	b=H/YQOm+xoM4Ln7dhDb5kcR6tss71RwQroDKX9SgZKrZbjco+qwm2LZxLKP0OeqtFty0P
	 0/GMPIC12RsF06Fgu1/cwj5mh3nur6VszeXF9g/y1LLExnH6Q2fzlA3E2zJHf6ytIm6VE
	 WNZu1DdN7+n1GfwDa4M9Vk7V4N18y0SlLbcRYDUiHFjcd0RqRVh87rfthOgOEAMLjnqa5
	 SF9oo2JOxX1GFVm3G2/m3aRNSkl4iCdSnGSYtaDqOiednn7HYRYI93aXS37LBklJSXjc/
	 ZNx+M556/nJQHLvMWOk7n9azOHDOQNKFVfxE/T6UlD5flMcXJxyvtH3s8bCZPLCFCMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeWFMVn9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74E606A333;
	Thu, 12 Nov 2026 03:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeWFMVn9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794454210;
	b=GGV3momnSUjF24WZWdZh4EsgWiWtpU89edn74jsilxywn00yfVlwUWlDjhtYN4qiJoDy
	 tSP74pmgjwprVXNQfD0iPcZCveLq0FU5ecKGxSuaQyiEJSmlCzPMWbr/AKGzMq4OkNpB0
	 O9Rlwn4qme5dAjLCIoRnwX2mzNbPLVuf+dsKpbkrFQntbB9+5u+meP0+EkhjyDVslXK2d
	 Goh2DoFwwuQqD6C3b4Z4/+HXOuOoddGQ6IGuhUGsOlB5nSEd03csPCek7j/T7Z30layg2
	 c6l43IlLRcBj3nSkrHrnefrHc4SfRRcTk7VT0FOTVnv9VXydBgcwsuP9JZvQy+NJraQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794454210;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	b=RNfkqG648/jLQqELkdg2xO7KHeni+V+JiRwyH9qvSQgut2Ysis8SjoVFrWJPE0SDz36+
	 W9tG1WIkOF3PuWQYfPEGuJwi7/raZ5Dg5owuHdizyjM2UzD5X1uWzXAT4GZ7OuRzeph/l
	 m3wPDA4hQzqbU82/GD0P+/MYQx1m4kS1C961SQiq77WE6Cf9f4aSr/RecK848c8dAZ2Sr
	 RpRiBbrCjeyFAe1TFRI8fln/TXePUrW94hH2n8EwydfO8MVyzjp4Ynjc9IZ+OO3c5zUu0
	 q96uLg8x4D6PxQ4CImWccWZWwF71MW/V1napU6Sq6p+DZNjLkag5eK4KiGvdsrBP+lA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADF0D1F00A05;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794454210;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NeWFMVn9J4QvDB69M9fxkfNb53KpxNuHBHkwylzxl8G6NccjqTT6DEB+Lfg0sQpmj
	 pZcnLe3SCkRVJJjI0g8UnNkNsvTnQHXD8jZ3Y7+rR5Gl5ovIAi/6y9o4vAYl0TfiaC
	 Kn28oNLtzXtzkzR6P2YVh+qNF7flEb6nef5pgdkHLUKCDjisA5Kx/kZc2yI+X24g2G
	 Ttg0/Y7sYEK/FT2oUetN+2C2p/ZR+1QdC782nkUCnBy8Km3D4BxQKmeyCM71BH6rjC
	 xsUxZ7F2cm63/y/bXPmrRV6pqXSdb8zQuzT7ktpJnJhfo26Wu+RTnRAneWL6Ks2n5J
	 atljYFrRatueQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3461349259;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:29:58 -0600
Subject: [PATCH v3 2/2] staging: octeon: match exact interface names in
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
Message-Id: <20261111-octeon-init-pipeline-v1-v3-2-e5581974fae4@gmail.com>
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794454208; l=1426;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=8E71kLdZrxiYjTNdPeIwjDJ9PhrdCS1LH+eWfrSvIbA=;
 b=c21VYl1PoSljJ7Udix1Vrqlczi2lUUWEiiVZ2aHEtkkVIhcUVinpWtlEwviRTQN+23/qt3nxk
 akHD5D98OuIAsvdMUmuYNwT8ZQicJ8ZQTPIOqNMqXVMW9RnDhUJcvCG
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_common_init() searches pow_send_list using strstr(), which matches
substrings instead of exact interface names.

Split a local copy of pow_send_list on comas with strsep() and compare
each entry using strcmp().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index c77678cb351f..653cf3727ba7 100644
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

-- 
2.56.0


