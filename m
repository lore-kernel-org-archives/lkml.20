Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3557ED90
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965150; cv=none; b=aOmdNb522aCmxeQkjUP+GTRMTmGOrahgaeEmhfDd01hPkX3WrgLd010GxIB7XpAEs2SSeKXhKY7wQSfEZnbY2j+4Jr8TBmzfBvmDZF80Lo7iblWn5Qn7xJFQowLWQsgghldOvfT0oFvqFifMtiyGJczqfuyXjh93OHGJB3Z4i1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965150; c=relaxed/simple;
	bh=ar939v3pkHgI4JJMLM+XStXO1mHQfkHWihVNAlmeyps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tL3+pqsqqibo1OTuvTiC23RnZyJUTcAlNoPgWVHVbj9xEfKXYK4q8wdzsQVzWgItH2wwHdI46pAGKEksheQu5yAJ5b31hDYY/8iHamaU3ylSgekgcGCNPOr/Yk7jbCZc6KjHAhxcnmsIpGzJBs961OSFrJoR4K0nT0oE331isVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xoe/OOjY; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xoe/OOjY"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso6569041a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965149; x=1789569949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RklGmEbqHa6YvYjJyOq7oC+x0k3l6NwuMATE295K/Y=;
        b=Xoe/OOjY4FdkjHF2GtwFoGX3uvno+QQQUx9HopqsigOt/4qpUqqrlzOtVy306AC7Al
         hatmp7k6s9TCEIcOuLvXwA7VZAdiDJLiRO2mtecIFHaYRSaMpykzigkSEsx4cerpDR9n
         NjV5LnZUrDBolL8QLOJGcADndimLHFuj2kdwV6cD0x7w/+f8Vl6Zi61UyGlLkhk8sD3c
         VJvjwGDeMri3kzD6Zd4YGgBGXAcWP18epddB3whO+JgrQLQEIE5TENE/aLf4qN6nlrjR
         WqEzK6rTgQNPNYU9UCLA8WDK+GSX5iD26eARkeXZq+6PmlC/hLOzjasNE1ylgrIdL/Ef
         G2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965149; x=1789569949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RklGmEbqHa6YvYjJyOq7oC+x0k3l6NwuMATE295K/Y=;
        b=XztTcjEusCHxgA7DVgxgvCffDeJFA58OAW8P4jNVAjSdswJA1nLXxRbXOnYWvg8I4R
         KC2jWvgwFGYGpUnF7tHnyfChBH/QpvkUBFWrZN6sH30RPcbqbKPmoCcn8FGVwNQrpNvT
         rP8w842pDlW4Jpg/nXqfxCLu185U6RM1u9s+JZpuRvnfS0CBcP9vwLZaHlRBYQ0gvRs0
         89jRmmGTaG7izyk7LBIvyfUBLeJLjoZK/rKFZmLS6K2+GgmmkJWfGjPH60FsSlFkq0K9
         5O8S0tMBUY50i5bpp7Wb5dgfGbT68/tsYKY86o4aEIobOAcVy/G1AyJAt/CblTG3C1sW
         YtVw==
X-Forwarded-Encrypted: i=1; AKwUvBx/TbYWYpRCseVxg4pMtGVunU/LkLqCVqJY084gCHD+JTHL5kQdFz7dVSc4jSfyw0RCVQMnIhFTZUgD2dA=@vger.kernel.org
X-Gm-Message-State: AFuF++lfScuNGei58xL35ypHeFP7fc8CZk4FogH6gC8nKwdSWSAonF6p
	JVKePyWonz0D5B5bT5NVy0VcCHPJ2mA1hA5em/2FdZDakDJ4HwrKOILI
X-Gm-Gg: AYBFou3216XTZNZcp1TrhtsKbH454yaz9CggJPWGP5XrjMLFjKSKI2dwDqyfNpWybWO
	o+JTK2f4RlYDuUrajwuOHUATJlsy8aAPF8kPtU0V7WOl1y/90eX/Q0S3f1R1dVwukhtemsK7yMU
	+NshT+3DJq7kCtV161M+qmojQNjNlcvenfGfzc2p9F/XKiLhXHIp6b6RoDCzxs0vshFTzn4qv/K
	yAWV44h0Jme03TpwtwTQnZpHzfUDZtNsufiPB1cLF4CMkto510NeZjk/I7JCTA3Lv4SLx0AgSlr
	MLLdcbJyHT3BCdyn1ESezGyEqbua12UKqW4kMcNSppag80imZkC80iSfCHbxjG8IriupPMAuLIo
	N3UzP2oQMUZQHKIxMRSkQf3Hlx4b+Yv2xIfGYCgiqSPTbzh23T9eY4ZAh2o3PR02s589hS4H8QH
	9AnbkpweVmt5hj+u+H+7I6XHcR+Ary0orad3sJFOBu1w2wVtGip9bUt9sDSDZMJ0k1Dnlg0q9+F
	zQ=
X-Received: by 2002:a17:90b:3912:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39b26101524mr47828712a91.8.1788965148448;
        Wed, 09 Sep 2026 07:45:48 -0700 (PDT)
Received: from G15-5520 ([103.206.144.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51209787eec.21.2026.09.09.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:45:48 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org (open list:NETWORKING [IPv4/IPv6]),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] net: ipconfig: use ifreq field aliases
Date: Wed,  9 Sep 2026 14:44:16 +0000
Message-ID: <20260909144417.28871-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ifr_addr and ifr_name macros instead of the lengthier versions.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 net/ipv4/ipconfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index 155db067eaec..475393a86c91 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -367,11 +367,11 @@ set_sockaddr(struct sockaddr_in *sin, __be32 addr, __be16 port)
 static int __init ic_setup_if(void)
 {
 	struct ifreq ir;
-	struct sockaddr_in *sin = (void *) &ir.ifr_ifru.ifru_addr;
+	struct sockaddr_in *sin = (void *) &ir.ifr_addr;
 	int err;
 
 	memset(&ir, 0, sizeof(ir));
-	strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
+	strcpy(ir.ifr_name, ic_dev->dev->name);
 	set_sockaddr(sin, ic_myaddr, 0);
 	if ((err = devinet_ioctl(&init_net, SIOCSIFADDR, &ir)) < 0) {
 		pr_err("IP-Config: Unable to set interface address (%d)\n",
-- 
2.53.0

