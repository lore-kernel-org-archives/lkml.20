Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6D4B489D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597970; cv=none; b=blJ5p5DAmOPrFLf0sAXBUOiBHXF06udL7tYVkZF5psjOLnM1DVaF1wGe2ZTNit+7BUsVCPNBKqYiu13U7gA0HTN0kkZ7PZdOvA/3Y5oYQjDWqIGaXPWydVHiO5ncPGc5o4abz6uLJWkKSDenSBAnl6u3KD1GNx+G2yWRgx58OKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597970; c=relaxed/simple;
	bh=OePzPtD0R+PtZosUTEoiidRuyc28dNYQ/5qwGG0tzZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4DKfQC0IoaCCC8rCfYCw9K0ePjPSa7xlb4v2i4k2XpOl7n8spPQ8PcneS+DF4sFkw+Pkvu/Jk8QLveukXu52vphrPBrK97bwXnZ9SQGP+OzFEqyD7y3RjEmtS63bDDW99Rez3ZLa6QwdJkJiKWWvtZLPq8VJD54nqdizBupj3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvchWbNz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvchWbNz"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so1935505ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789597951; x=1790202751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OA4YpSmKtbbMI8cZnUw7O9PGIOCz+Cb/vxkUZS7nVLI=;
        b=FvchWbNzMrcnrtnnW9kuR2hbgrEDvGGRMdgzPv/zSam/SwSwIm2PAsXF/lnIw7tcNs
         hwRl8YLCUZDD3GZmr83bHNaO/vlc0uR5rChB1QY+cmklR9RR19QVXl8oX6j05QfJGWvN
         YzaaMvnnlcbMrUedfP/oup4lbdnibyMjdITq1ya3s+QLR8vc+xg8OX9jvwxzH8/nypw+
         XDjeh96Xqn3LxvATguD/doYT1lR4M9wH7EtEBPnY7Em/3PzO7WKt8CLHEER4C0DyaL3y
         kLizY9QRLReQHLV1Re6yy2EfkkkGwMMzGkUWY2xist+O8Qhy+xi0ptxFDAek+iHY1Tpi
         CBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789597951; x=1790202751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OA4YpSmKtbbMI8cZnUw7O9PGIOCz+Cb/vxkUZS7nVLI=;
        b=KXXTvBdh5J0qASMj4cwtavN2JsCF3TQkH2EasMfvO5X8V0m8F0MeTgL1dmEQeTIZjl
         lUZ8bHC3LDXvfw9ohgJyiHz0l3OILVyQBSm5QcbSek3qIzP8l3MmoMmu3oyqtAQixzcD
         GaVyIQQuHuxiEKLy+klUDVv/z1zMKbUj/AgbFA0ukC7frgityUimN8wTJwqxLdsBRlr3
         +vV5LMiPdyjPG05Y22jAcIPpDUSWhY0Jsj/3T8tZthwWoJ6AHj28ks0GaZk8oNhM1zE0
         vFe/CqWQnt/U8IA7G4CgZU6S3ceqQbSQWAk7rCV/X1QAc1QTqBDeFXzc3KuqiQk24QFd
         P6fQ==
X-Forwarded-Encrypted: i=1; AKwUvByUBvibKrdeyYjUrJS8Z/c+VcVParq8aHN/fFK8QfQl4gSnn6hf/TKV5Ts29rWwrJomhKd67ydkD4Gq9bs=@vger.kernel.org
X-Gm-Message-State: AFuF++mOJPtnxYR9E2spo2ZItvbYlWXFCNeujIo3TaFEY8VCPfRQyun7
	XvfFBc7yFLYn3QXHJKHlqG647Ffgs2Guxr6j8s2MqTWla6R28n2QpXoN
X-Gm-Gg: AYBFou3o3jkp51amLqQyroeXpk9k+xrjzGgAnuJD/EEkMOzvOOoJddcy3MGUKYCr7IV
	M3D8OZVdgPklvivfUfRT7IN4goTIGA7csr2w9AR2qorZCgUMCsZnqLJctRaPR1YshgCkSCkGc6f
	r5n1bkICPOYdpAviNu5VWAJ0B665FYKvbIyC+vff9Xgym4YEo2YK3r+8cUMkz11701Ssm2Yz2wK
	AwukikKjo7HxQ6zBBnTTtYZ4OcUP8wumuIGuzKX8U0vKS4SG9nv4+tM5Zh/I2sCB/JV4kw/EdbQ
	0zzyzbKgWDya7UH17I3RsEXRNkwPeJKiF5XsRJktRUKkdkZYWP6vbzVssl8+R06TLSGatKkmBYu
	f62eEikqyU0KxIqHNCK5vHPEjCfOkheGsu7S+VXK5U+5CCwBxPH+7UmeZ2+nQHLA7XrRAK+eftb
	gVU4gA8kR4f9f+09C1hQrkYxXy1igN5N+1j0VA+K921YABUjqmTa73afCs094CHc/hucj21lD8L
	lUdXC6jyLSUjBrUTTR0YIH+j1zpeQFZ+N98zxxjHgYD8iX3L+G9V2iK6XxEcVstWwBIsiwevmeJ
	fVBFigpYhCmW+sLS41VZXZme4wMPo05gnY2GQjQP6J56rdVL
X-Received: by 2002:a17:902:d2c8:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2dd8e3f5a13mr89519665ad.14.1789597950982;
        Wed, 16 Sep 2026 15:32:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm10744788eec.8.2026.09.16.15.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:32:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 net-next] net: fec_mpc52xx: remove dead resource size check
Date: Wed, 16 Sep 2026 15:32:28 -0700
Message-ID: <20260916223228.271815-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check bails out if the FEC register resource is smaller than
sizeof(struct mpc52xx_fec), but every in-tree device tree describes
the FEC node as a 0x400 byte region, which is exactly the size of the
struct, so the condition can never be true.

The error message also points at mpc52xx_devices.c, which was removed
in 2008 by commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
include/asm-ppc").

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: instead of fixing format, remove the dead check.
 drivers/net/ethernet/freescale/fec_mpc52xx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index 90379c26f300..dcf378a02835 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -834,13 +834,6 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 		pr_err("Error while parsing device node resource\n");
 		goto err_netdev;
 	}
-	if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
-		pr_err("invalid resource size (%lx < %x), check mpc52xx_devices.c\n",
-		       (unsigned long)resource_size(&mem),
-		       sizeof(struct mpc52xx_fec));
-		rv = -EINVAL;
-		goto err_netdev;
-	}
 
 	if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
 				DRIVER_NAME)) {
-- 
2.55.0

