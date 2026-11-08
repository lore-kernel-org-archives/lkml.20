Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794138544;
	b=lUMtFfBETNfHPfGIHx3ElcHCH6TTF5OvNAIjAYwWX/7zddEUEpd6T/MT5W5CxEV0gW//
	 fzYU0G2wL1G2hY6TPkp0zarBo5Ha+SFsQbGNvmkpqUhSkI7ivoZ+0PxZ4Xn/GkiuOA6ZK
	 doLFvIRk9+ludItAmm2SwsK0Yj34WjmIfNc2WAfPtyE/spm+9Kmca3RKliLHj+kMEunut
	 BIsnP8/Ks1OFSjzvCtlnjUp2uXkLTrRNW+ShBNze1AqHWtkPof6Ub48y2tGPzBkyx0PTi
	 5OjlVRjw1A9LIHtvlCvcrJWqN/kCWXlOMrcHFOHZxoGecOgLLSbCIsrRjzUyBvxZIcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138544;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GHRuFIYMUh3lvGxjPZoMahNaNK1ngX6uwiRb4CnFpyw=;
	b=J5errIo2sMVhSq6kPh28Oap1hmqh+JTp6yQRhzD7dgKvn5YckcKMAT5ZYkc0Fz5QXTi8
	 gU2CgZiMC07/fvcxtcb072vWnGyBq4Dm7NFLOswzs3C7M3/Xqq0UGVpxDMOhgEqUJGnW0
	 0H3JOPIsfcD6foKjsNOs58944MgpVWPTxh8hAmXo7VMuM8Ofw8bfcCXX61LBy7OIws92i
	 SUUAxr6pEGnPIchL9QtncrEnZg2WOsAdi/w3qRZGLw1o9fkQW79o2fAagUaEKqPtnJ+vF
	 H4Dl1734KRJXFndpuMGaZNykRcZvsyE4OblBg1mi3XwugiU9uG6IdZHJJdD9aQGJk5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOYT72fq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2B606A321;
	Sun,  8 Nov 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOYT72fq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794138543;
	b=hnNfQ78T6it3GCruD0LKidcErp6tHm8EAIJOvDU5/8hsdgfX6xNpmBd9DdZSa+kTdfi1
	 Ssq6FtKIo99nou1YjitfeNhOFXXyogxPw9p270TzHiA+Bns7QTLzdqtuuuZGjobd6cH/W
	 sbt4S1UN13QOCoyHrXV6mvvnq6SH7X0IZHpg+N69M1x5ydt+YYdQQEM7P6ePtLW3TMzNs
	 V1SNhrcOK9Xs+k6j6Ilv2wlzpwre4ZgCoN7Zy0n5kL+RpzzI+/a+cBnyobJP85UOi3OR9
	 /3LcT+nE9AxpTcZb419pRcED+3ntIbz8aJPACDfUbF7Zv3MzaT6tnZXp8mxFKlj9vxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794138543;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GHRuFIYMUh3lvGxjPZoMahNaNK1ngX6uwiRb4CnFpyw=;
	b=IbINel4VbQRKroxwMgU1CW4vikv2/wc9Sh+0+9lwhEsIW8qzgixnRpleynZSR73VBrwb
	 iYzv91iz0xJc3YNaqNA5EPFrLjcVsDHFCBcttpzUtRucim2rPTFagRxdj3gzUzIh4Efx0
	 pegkHC1qSvm/d9ONs10AKMmTecOVkhqZI5J8ZICvlZCAOaCgBMKiRwDknPVPga99ep371
	 J6Tq/ziE+z47uTHB/iQACLxQjPZ7xS/uJIAGktagjXbJ9hmVVcxPj1v5eD+xq9OOqLd96
	 7ldamKMi9+eIw6xEB+a6PtwWBpLPyajX7vxgf6Wwtus2TR+WbEYurG3KKHbrg2LS8CQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25AB21F008A3;
	Sun,  8 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138543;
	bh=GHRuFIYMUh3lvGxjPZoMahNaNK1ngX6uwiRb4CnFpyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cOYT72fqtemklL+bdZx0X7BY1GqnIqKdXPJoBMlx3Dc1bLaFQUMOrlILs3Y4BLK68
	 /C8pbjnFn5g3Rm4gCuypBqnF1GAoyVkqOhwsY+N7vQ5EP/XPyzAPf9efr+fu6FG5md
	 vCi+XK9nXMn6HlJH00nCLRCEX2VNtfZ14DqCqlv4fI51YYogWxTke6fSJ85+k9CCCj
	 rR6Fo5WFnZV1aBWJPDf/rI74jNUAavs/sG9qxOdCBquh9eEwceX0K5+hvlC0XH9j1m
	 qUSxK0nH0sgsXqWr9dThA/uwk7NKPWXMT64hg9nv6RuDeIN9DM8dYVGvknlgldbA6P
	 99aIgCDp+DzXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A53B747F3B;
	Sun,  8 Nov 2026 11:49:01 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 05:49:02 -0600
Subject: [PATCH 3/3] staging: octeon: match exact interface names in
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
Message-Id: <20261108-octeon-init-pipeline-v1-v1-3-eb2c6c956279@gmail.com>
References: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
In-Reply-To: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794138541; l=1604;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=f0iF40wlL3055VnuHPDRCEkmeHEy/tqwoRJuzv5gIsI=;
 b=2lld4WoqolBD+QMYebIDd5RrS+cU8VL+a08zBCI6hoYdrUvXvIwH2B4CrzXDoJpKKRt30mPOz
 mqmoMyYtW8wDosv1zcgy81Y8XJYRd8Rj8QgLMq1n4v+4hMDIB/UQWs9
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
index 8f9dd87752d7..1e3cf56deec4 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -432,9 +432,23 @@ int cvm_oct_common_init(struct net_device *dev)
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


