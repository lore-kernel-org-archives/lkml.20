Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AE83815D9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245241; cv=none; b=bHATelq5pioWClTH2d5hn1nyEjYjzjRa5QRDa2xyExt5oiyimUwjKA6z3oYpfbreZm22GK5EiSZxkxPMIhuEJZepFDHScfPLg/48tacxOYKnfjh3IXwAalrYscFGClOLdjc0OhZ7t1jBw6A9r/JYB2BcbO15Dq/+1UgoULfKVEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245241; c=relaxed/simple;
	bh=Qyd32ozs865AsDGgO8gTGmCSNz1p2jzD/NBdRdtQZz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m0ufxtP0Np5JFyzWkHciqexK7Py0oy1NWEyt445lCvB8v+7eJQTwUgDSnfTv8VOzvKLpNZawKTx6WHF5Bf1KdZl5jgzO/hzVsSLMkkzknbdE2iaKnRMEE2O4R6so/bm7iNd6NZN5dr1yKRc7ExLLZJt0EkuNf1nWkcrbdYTeGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l23T3lpE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l23T3lpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5391F00A3D;
	Tue,  1 Sep 2026 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788245240;
	bh=wciAHNYYaw6mM9+hj6NJYlz5HwgYmGPn6PE5KjNS/qM=;
	h=From:To:Cc:Subject:Date;
	b=l23T3lpEn97ptqJAJaFy+l1Ls/zyO9x2g5DqcRQ+bqzQxGTJvRRwUskEjM88xC+Tg
	 zZPvNd77P3A5k7kHjM32X4IwzyFsDvjXUdmwxiu/lM0eRoQ3TVp/TSkBmP8BisSsdM
	 VEaWsn1/YJmeA+DMllzVdoJq6ZutUMSCwN04gRwjyglKtuZlARW89s+M5Ah88EVgFe
	 ySQDM2BIWuuXHH4jlK2/DEmx8JGs/kNdY6MYdKTDbrYbSwsQNjBHSGlf8PmVaQTLTj
	 xeoY5776MZcevVarwwQ4SRDCK1eMXllKxNQyome3+RAaTdbzwy2l7utAFgHZgUawvK
	 FyfFPfwAuLtbA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH] irqdomain: Delete irq_domain_add_linear()
Date: Tue,  1 Sep 2026 08:47:14 +0200
Message-ID: <20260901064716.253399-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

7.3-rc1 is free of calls to irq_domain_add_linear(), so it can be
deleted at last.

I used Gemini to update zh_CN/core-api/irq/irq-domain.rst too. Hopefully
the result is correct -- I really cannot read/write Chinese ("CHINESE
DOCUMENTATION" maintainers CCed).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Assisted-by: LLM (Gemini) # zh_CN
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../zh_CN/core-api/irq/irq-domain.rst          |  4 +---
 include/linux/irqdomain.h                      | 18 ------------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
index aaefeda0e164..5ce16d2e6a0e 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -90,9 +90,7 @@ irq_domain映射的类型
 映射的优点是固定时间查找IRQ号，而且irq_descs只分配给在用的IRQ。 缺点是该表
 必须尽可能大的hwirq号。
 
-irq_domain_add_linear()和irq_domain_create_linear()在功能上是等价的，
-除了第一个参数不同--前者接受一个Open Firmware特定的 'struct device_node' 而
-后者接受一个更通用的抽象 'struct fwnode_handle' 。
+irq_domain_create_linear() 接受一个通用的抽象 struct fwnode_handle 作为第一个参数。
 
 大多数驱动应该使用线性映射
 
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 73c25d40846c..3ba75a4ed3da 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -752,24 +752,6 @@ static inline void msi_device_domain_free_wired(struct irq_domain *domain, unsig
 }
 #endif
 
-static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_node,
-						       unsigned int size,
-						       const struct irq_domain_ops *ops,
-						       void *host_data)
-{
-	struct irq_domain_info info = {
-		.fwnode		= of_fwnode_handle(of_node),
-		.size		= size,
-		.hwirq_max	= size,
-		.ops		= ops,
-		.host_data	= host_data,
-	};
-	struct irq_domain *d;
-
-	d = irq_domain_instantiate(&info);
-	return IS_ERR(d) ? NULL : d;
-}
-
 #else /* CONFIG_IRQ_DOMAIN */
 static inline void irq_dispose_mapping(unsigned int virq) { }
 static inline struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
-- 
2.55.0

