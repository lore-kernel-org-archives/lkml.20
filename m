Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725450;
	b=mtqwsLktW+ivoE8DHVpM5z8zowyyTfhWZMpNVlaRNwjLPKLC3pfFDJ8HawskLg7yZSRL
	 KgTU8by9nC78qoLqWyWwN/2xr+//pIGSRIEm4D9fOQaUfrWVuGlqf53ZO5LZg199v57r2
	 zMeAb/lvfiftnaZkMQSQ6gjtiZK7haeaPATF1Og/XxpPOYmpnuHCikCFQGfCG+pK6lV7W
	 pseS1KNHkvKQMsTzd9Z243kvWmMvheabg+inVwvswDHRdZqUoMziCZghHPI5AzWWxZlaX
	 OGPD5g33H3/S0tkaq6wS1w3bveTUgu6L61p5OANcBjXYe1S4bZN0LvpUUpcYBDY7STg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725450;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=b9+auSGcppcWBJt5SXqZ+rpU4e/kF1LrHal7/DP4er4=;
	b=CLBHUz7pWlzRCG4ajWqrOnpvXRKq9DPiG/DXfif1rWBbI3H9JTXL7Xl1R9teViIDEpsi
	 1THfGm88BL3pheP/SSwsU+3A0riHlAolFRN8YThzLe7tQZzXGpDW/9XSkO/dvE1+AR/fO
	 vWw442ByOvKDyjYMTK96mrc+0x6ccahSQk1XAMa8SIKBSeQnMQ9CkEOsK5D+Fh/KMQBpt
	 kttR8OiRcIZZ+PD6jwxXbFkWv7Wb05ErPG32zZ4zl/O8lTsrBsqrzQO3f7BGiimUUXZ9M
	 59GXRnKFp6bDHKRma4BTz/uKaXqcpPPp/sbAMa73YFYzjczyO6iLnoeXmdX8PcNPmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X8hK42/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281A606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8hK42/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8991F00919;
	Tue,  3 Nov 2026 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725450;
	bh=b9+auSGcppcWBJt5SXqZ+rpU4e/kF1LrHal7/DP4er4=;
	h=From:To:Cc:Subject:Date;
	b=X8hK42/kJSydfw5D7Z9vK6U/2atKWnn6X4aEuOK/xvwEg1InLj/BgvlmYhK87WZmD
	 Ry2aL84xe5bMxBFYEb8HdxPX//Fw72r7f0yekVfDigVlKcVm9pFkZShSYtyoJnPul0
	 r97OE/i5vU5D206Z7AWNU5YOYm15eOoXb8cYRV3BcR3XuKAGB+JXBjmRRlXFzmWF2s
	 JDbN+Wz9SnZ00Pzl7z5YxJlPDPb2xqsmH7fW9C6R03OTtEth5fhzD8M8JqtjID/ZCJ
	 WhDRUptZd0BQpW8cWqCvfr9FzqTD9zrADKpchRYLEkFJyILYfgi90JQvgJcmRH2HU5
	 zrvejDf+NsgQw==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/wii: Remove redundant 0x prefixes
Date: Tue,  3 Nov 2026 18:03:03 +0100
Message-ID: <20261103170305.455444-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244; i=blum@kernel.org; h=from:subject; bh=Yq4Pqu7vixPkoEgJnOzjdkuzWq7FRDjW3JsIaDihh6k=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvhE/q2kg4XPBd4bRR6XBW4s4Zb1zchB7veW3CFXHO9 rkMB6dlRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkVjwjw77m6/+FIhrdHBl7 lCqmz5D1W7D47EuWjussAnFPRUWZbjP8Tzwzr/LYW6uf05+8TTh3dH8pVxXTuctfFrEr8swS/F7 /lQ8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The %pa format specifier already includes the 0x prefix. Remove the
redundant prefixes to avoid printing 0x0x.

Fixes: 7b69600d4da0 ("powerpc/wii: fix resource printk format warnings")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/flipper-pic.c | 2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c    | 2 +-
 arch/powerpc/platforms/embedded6xx/wii.c         | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
index 91a8f0a7086e..e9c84793cc4d 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -145,7 +145,7 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
 	}
 	io_base = ioremap(res.start, resource_size(&res));
 
-	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
+	pr_info("controller at %pa mapped to 0x%p\n", &res.start, io_base);
 
 	__flipper_quiesce(io_base);
 
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index 1522a8bece29..a1bdb83fe51f 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -171,7 +171,7 @@ static struct irq_domain *__init hlwd_pic_init(struct device_node *np)
 		return NULL;
 	}
 
-	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
+	pr_info("controller at %pa mapped to 0x%p\n", &res.start, io_base);
 
 	__hlwd_quiesce(io_base);
 
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index e7eec328f121..928d082abf56 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -73,10 +73,8 @@ static void __iomem *__init wii_ioremap_hw_regs(char *name, char *compatible)
 	}
 
 	hw_regs = ioremap(res.start, resource_size(&res));
-	if (hw_regs) {
-		pr_info("%s at 0x%pa mapped to 0x%p\n", name,
-			&res.start, hw_regs);
-	}
+	if (hw_regs)
+		pr_info("%s at %pa mapped to 0x%p\n", name, &res.start, hw_regs);
 
 out_put:
 	of_node_put(np);
