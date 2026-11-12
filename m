Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794455323;
	b=pOkM9qE/ssW/Ij7MROQmHSDKOuxpDwSFWj+CsXaSvTRy8JvQYaOHbKuXGLL10gKO7q3Q
	 raAlJRxnhZi2xQ7quxG5z80aYFqD0qTsFqA3Z6xCBkfMgl26kC2p3GQeXLg5AAZa5gI/Y
	 4uLumjygci3OCRLQE3xDZUvXP/XtpBJYCR2FhgC/SAlx/LZ+zvuUNBqL1MMBn8YwZxjEF
	 eqVHXrgZt5U/IiizKyKnjp8u0uB11KFtFnPc79nkjA/ZkOBQ05aDfZFabUa/bGTlb7pEf
	 VWVN2fgQmzzXh5/ijLoOsnaZjo8bHsuEwKp6kWf38BICrvMmdb2hQ6NkJY/0p7b6AAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455323;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	b=EGGkCFGvFUOPS2E8kR77sEs+VisaijZDwEwMhi4F6h5iIlKX7/7k63FpJM18H9xplvJd
	 xqkKUT18y9/stwmG1fWkgjhH+qeNYsSFISR0jY77gPXs8MHIU/ChNb+TjyEgtDmo5E66Y
	 469e3OcwohtKzSVSKgxG7NG9k30DQlexZS6F99/9niJWuUO46Sn8lSdJlOCHxBM7fToJI
	 zOBVAtLRLX9BeY2iFFPs9rV2gpofZ/YgG0oZhhCt0gwzKxwrditpx1iosreZdOYCXm5mz
	 cl0jMUheDevrou5w2UdUwYuNA+pAT8e08DvpHMUdbSGZsE2X+RejVqQu48ZANxCGbow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fwq7BxAZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1221606A31C;
	Thu, 12 Nov 2026 03:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fwq7BxAZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794455323;
	b=3sPTqQVss3Y3KoiA5B87NbR9FEgYwzsdETzYP0LbnHJQxh/UET8qyqKsEdxZKxpSIa0s
	 liKGgM/bqJHU6v+FxJH/ZMFWLKmnWs7L/kJvTMbkueZaqRgNxYjHYPrYJ7Afienk7TnK2
	 XJr2nWMMF+yb+9lrB+mkWFOViF3A/fXs+yCvHr328lPlwE2Z/I44eIME2RsEaMqF4ljFx
	 KDlva1AUojLXJJfqIBwlE2Jsi4oMh3F3I9S2EdEv+4sNPynpQXfU4h1r6zpxSr98BwKZX
	 rO/PBkGN0GhsvflET1NJEPuuUKWV4uyAdoPviJgKRtLV7rsD5Lu2uRi7dMi0naTiJWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794455323;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	b=eaCBErdRA7NrNl9f2ksGOu89Ek4rw5XGsz/7MSjCqyxD1cMGZuuPtpYofckBcsQgzPO0
	 5m1C2Uyw1jZi6WujBNbmCAv3vLhuXdLOgyJOR9yaqxA47kvMWKSpqKaYnxvGZpDZWBPx/
	 1dCqrTPfQjTKCIHJKSZtsFyWp2CUPTQEQoh0hMf9uSDu8N6tRpQpilTjyef5doAxm+Lvx
	 2G/YesZdbNTtaa+fb8gZpU7LbSWN7hmN4l4kR5DgIUQ4ay9fU8RKisHh8zTFwKTGV2SpI
	 4E365wKsZWhzDle11O9S5hCPquJQlKOzcdM+7CktIeBTjUuJ2kztE1mVnaEnmZhGbFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA6A91F00A07;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794455323;
	bh=tTqwyBOLUa7ar2LGzrtuAz0U9jtDiBgCFYFPI6cb+VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fwq7BxAZO6nojpm70YsnhsT9+KUyknykjES8FMzQ6F2nbEk6gy4HGnoj/ZK4faZej
	 zfGrYTsAD9UOP1trGwxBBpOvPu/lUnHD8CfHXJ4JfcWnVdXuPVsLn8xiVdO+6WepkE
	 XGmRbV6M36AdAsWnb8tzASDY0klC5kv+tFHQsUirX+olms0/GTD5K1W5rZdB3Y0vdI
	 7hybqilpkEDPHkivLd1qUvt2WebcFstoCEoyK3xxvPxLGKdJ7HRTCVmhW9Oi24fcmo
	 QL2AXZ4WiOKxizlBSU6qZdh3xDrrCNQmGXyWK7n3RlYcgpTshDJ9OjL288TT3HQ9SX
	 fFHhCZMp3b0LA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5564549275;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:48:33 -0600
Subject: [PATCH v4 2/2] staging: octeon: match exact interface names in
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
Message-Id: <20261111-octeon-init-pipeline-v1-v4-2-5b4f8e613ae1@gmail.com>
References: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794455321; l=1426;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=8E71kLdZrxiYjTNdPeIwjDJ9PhrdCS1LH+eWfrSvIbA=;
 b=5g1uRcEn9QC+kz9cnr5UIiKq5g/821Pxcu80xa98/BNR7PEqrYT612KWrPM53S8JJcA/8Yr61
 TjpDoPqjNOtAV+DN6YORQkkenMJdcOAZfYcJrlskPMcUXR8eL93uL8I
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


