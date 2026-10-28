Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194114;
	b=gkN72gmpGYoL+1UmGfNgoPA8Mi81cNc7SWDhood4usI2A1bA1fz5MeAxWxYV5/V/+8OS
	 O4pg6Z9GhvyocVmO05j16F1ydPMQbCcw1Dz5/7md55AJ9Um3vtuOLIzAWx0W7PvzmrtHG
	 hUUag4sY1+NXTQqtmH5F6Lu4cB6C/cDFqG1s+0qNlaSp/2uqeTXE4h9n1fau4LxNEhJWC
	 nm9sU5e13PYKAUDpiaKN4xCjzZcmHbA9kjdeAq15d+CEXIRe0updhIZ76sXJhi/fawBy4
	 kfkpxqkU20oxynOMXE0cLRMOzYqf7Opz4rgMS/iRfwL9OdqDcy5TbtLLfu4rn9lGd9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/qtnZvOuU8MhlvJHegjHxSWlFaXlL/NnoXGGQM+IOGA=;
	b=C2+AJjL3JwHzRkJwd5pzYT7xTiOudBBdGz0xGMmdEIqCJ44NonrCtbTOj3twA33nOW0E
	 2yy6lIUsV1HekhO6nDkae4IxnRfu9fK0thTJWooHEIdJeDt4CBbaaJKUExWi3No1Gj74I
	 2KkVtuR+0H+V2uwOaYEfypcnc5bVkEDnaP0hNNLRQKMJ9dekCha/j9zgY4CI3v5xMH6nu
	 6/Pf9x2dbc6/o1IHiwJf0STBKFtK4/j+ENzXnjYueVID1ZoC4uDaCRBnEST3G33tE8+OL
	 Hd4yO5E2YYWfsdo8GS4f8Nxn5iid9GNXB5uhl8o1YtuCkwF0X176pRvFkTwLAgx5OnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jr1r+QIH;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20D606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD20D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jr1r+QIH
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ec20398b05so654749e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793194113; x=1793798913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qtnZvOuU8MhlvJHegjHxSWlFaXlL/NnoXGGQM+IOGA=;
        b=jr1r+QIH9SF8KtcfX9BXZIHaTISyWChxSbxtk2nQq/HpZxq55eiafMQmivcjOYIsn7
         h2qTJ6u26kwNCEpWvOqoCy6eXKsRJUtjuvajaCzMcFb9JBIp1tzPDOU62NwP1fpm/Ct5
         M+zBG07CeU+BBuL/0F8Y08csE5QigbGYSElY4VEUohVPJz/qtmyNASR9EC12577NET5s
         eMEzhI+f9wQLdSDxiqHdX6Qw7dpIHdd+Q14xV77sYfPNv2zJgRY12MtqLg0zOzu4hZsT
         CXMAKNko1WX759zarCC5VWO5mf1uOdDt+/b0lA3rulT4dM0LcCWJQ2tYIb0sMtlmFcYu
         iM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194113; x=1793798913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qtnZvOuU8MhlvJHegjHxSWlFaXlL/NnoXGGQM+IOGA=;
        b=EQ43hJ4yersGZ/UGYpMS++j4f7s3YfwvIcm9MqlYBJ6+dXeaXpdxYqz3Ir5HrVrjQo
         BcQVDvzf8Gzcm2CuC7KPJHSMVVnGsg2TOzwSmAo/qPhuuPaNGcFdS2YvdkUPbynyPC6e
         kMgZ9jS2gYkBpiBYDkjwKld9dYcAg36ZReZxicxSTy1GElpfjqjFZUV1BNTziYrpGxd7
         2BDBcf02C5X9cwLNzD8hnb9qy5mEaFxs2nnnIU3NamwQENupNzDy9DyHymFZzRAQfijJ
         kuisZnHb8/Ujj/UE73wrWKFqCEj8nEKLhOeUf6pBdtMVK0Bb9vlikiFvnK4eHI0K9k4P
         zhOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY9A+GEEVS+kChkoJK46ORL+la4NmNsEfq2d4OzvRK09U5P8lPc9IqxWkagUUybG3HAUeTH3dYvWoVrjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEewdjQ9rhnN6PK3Nn7s8oxqa3ki5AQOFlDZ8cEBrAw85y3/99
	Q89vC+GIWEO+Lxl5voyqrpmeOp3nPaS/+7nuPZLHySInWjjekVzA4dbW
X-Gm-Gg: AYBFou3GOeP+pM24ATXb3QLNIrzJ0Jl0Rfa/ThKR8kXazMTX6U3sCThPdPhVDN4+TUT
	narsH4utbKVMaIhvQf/56k45YnzvdeL3xKu/7nNBLifzJLZfLjB2k16j2necy7Sl/vvpB18I4rZ
	4Z88pcc/hOIR6xmLd7w8CPTNoJlpQIN8JEfm58ixNAxrSJai+KdpvPdxBWtmjvNckhEeq++0Nt3
	jeHV7yuV6cVDQgJY8OauxHw/rVgiE7RaWLbHgs8Jg2tjeKEXiMvR5Nsp7buZ3MnjgDR3T5o+c0p
	PKMyRZiqAKv79tv2pEGwbvI2w2qxgVOC1sw9+8n8iFBCMZP3H75RaKG4yZD2nkBouwlrd1+fC63
	9R4gXFl4P06pWUfjFCEDxkPr7KzGcNuxcQDlblWeoQIormA8s0gRST48H7QXo6P/E4hDs0XCTn3
	exXwAgUvsRNPS83EwzmDbrVvUW1vXAOgxb6nSsT+jFHwSFLKDmzSz3r5wwXW7/SQAS8z36gJvSx
	83lRIt5TKFTFQMI4jSop0ssHOeI1NuUSIJr5+27MfphLh7h1A0SXUrOb3mjPNzawjMJ/E5zL0tM
	TmWGSN+/Fod5hrNwMgDdB2c1A53fDdbHTRqNuDWSj+fv0t3yh9izB1dwHhYWZ1hLwM04z7p5I2M
	p74t0ldXG2sPQ4ot/hmQkD1w=
X-Received: by 2002:a05:6122:c93:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ec4cc5343cmr1027395e0c.20.1793194112610;
        Wed, 28 Oct 2026 06:28:32 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:e068:c468:5e04:829b:4378])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f99442fsm1720000e0c.15.2026.10.28.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:28:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: herbert@gondor.apana.org.au
Cc: horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	sahil.malhotra@nxp.com,
	gaurav.jain@nxp.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: caam: jr: Use dedicated shutdown callback
Date: Wed, 28 Oct 2026 10:28:25 -0300
Message-ID: <20261028132825.657546-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The CAAM job ring platform driver uses caam_jr_remove() as its
shutdown callback.

The remove path refuses to shut down a job ring while crypto
consumers still hold references to it. This is necessary during
driver unbinding, but causes the following warning on reboot:

caam_jr 30903000.jr: Device is busy; consumers might start to crash

Unlike driver removal, system shutdown does not require
unregistering crypto algorithms or releasing driver resources.

Introduce a dedicated platform shutdown callback that shuts down
the hardware job ring without checking consumer references.

Keep the reference checks and algorithm unregistration in the
remove path.

Tested on a i.MX8MP custom-board.

Cc: stable@vger.kernel.org 
Fixes: c007e720989e ("crypto: caam/jr - add .shutdown hook")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 drivers/crypto/caam/jr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
index cf725a6ac0fb..75be668b74b8 100644
--- a/drivers/crypto/caam/jr.c
+++ b/drivers/crypto/caam/jr.c
@@ -178,6 +178,15 @@ static int caam_jr_shutdown(struct device *dev)
 	return ret;
 }
 
+static void caam_jr_platform_shutdown(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = caam_jr_shutdown(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to shut down job ring: %d\n", ret);
+}
+
 static void caam_jr_remove(struct platform_device *pdev)
 {
 	int ret;
@@ -812,7 +821,7 @@ static struct platform_driver caam_jr_driver = {
 	},
 	.probe       = caam_jr_probe,
 	.remove      = caam_jr_remove,
-	.shutdown    = caam_jr_remove,
+	.shutdown    = caam_jr_platform_shutdown,
 };
 
 static int __init jr_driver_init(void)
-- 
2.43.0

