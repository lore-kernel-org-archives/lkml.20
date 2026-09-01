Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF23A16A1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246296; cv=none; b=Xs7mIaqTVUk9xKxMdfzE8gsrNJYh9jwlfOAjL0nO/kAQZKPwo8BsSCkYy9XvnhUvHv6RESvkuxBJIvjt1sZt4j5zHUfDokPDjKIHoz8nkgBzMAPhdM2vT6vcHJpp9kSqlGR7BkYdwSD2Mr0OKKJCxROejZ1b57kvoE2cBRK5LwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246296; c=relaxed/simple;
	bh=ey0G1X9tOwJNDFI9ncTYyCaKALRWJF8gnxAlcVfAHdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hOqVI88QSXsUau1NNuOVn8/7K7Uj/hvzTEuyvo0Bc1AYtCLEsV15S1F0Kc8SNnv9/OkL9H7tDQMc8PMklI5J8nw+jRaBeZhkSXH6a/KgHKFBhvRgxsrVEv/Fcbk6WiKxkubOjJdri3+otbdvavA1E69VUAe7s1caIzOC9vIXSf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc2nZPcA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc2nZPcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C4D1F000E9;
	Tue,  1 Sep 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788246294;
	bh=Dj9L8nra2wlXiqh+4Le5gpOg2EgGvJF4Ts7nBLLHjvM=;
	h=From:To:Cc:Subject:Date;
	b=Rc2nZPcAEViCXpdiXCBowQypECYNb4aXEaDy35QUPp2hGTk02Xlay2koaJwvXYxfc
	 l8+SYtuuAkYUci57onVoJdnplxe7Ng+2sQKre/QZIDXHPepH7DrPnuqyBqEjA57dKj
	 vyLkdYydfC+Q04Jdam2gRg3JHl6mzAH7L3XwG74SRxdYjpgqtL8DkFKomMWfPbEvCJ
	 zMfPCngK5GM8Sv5klgYmyXvEtPCjUSOjbWII18yRYL/QxII8yaC3DnnY2Lr78Fcefy
	 oN0VU8YOJ0ODABkCRCs6mgRUbi055h3ty52hX6KNIgt17ljkVOSfUf8gkpcNVJi2IY
	 E5qt3OsuTDvGA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2] irqdomain: Delete irq_domain_add_linear()
Date: Tue,  1 Sep 2026 09:04:48 +0200
Message-ID: <20260901070450.255507-1-jirislaby@kernel.org>
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

According to Dongliang Mu, the paragraph in the Chinese docs is now
obsolete. So drop it completely.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>

---
[v2] drop the whole paragraph (Dongliang Mu)
---
 .../zh_CN/core-api/irq/irq-domain.rst          |  4 ----
 include/linux/irqdomain.h                      | 18 ------------------
 2 files changed, 22 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
index aaefeda0e164..7317cf5355c9 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -90,10 +90,6 @@ irq_domain映射的类型
 映射的优点是固定时间查找IRQ号，而且irq_descs只分配给在用的IRQ。 缺点是该表
 必须尽可能大的hwirq号。
 
-irq_domain_add_linear()和irq_domain_create_linear()在功能上是等价的，
-除了第一个参数不同--前者接受一个Open Firmware特定的 'struct device_node' 而
-后者接受一个更通用的抽象 'struct fwnode_handle' 。
-
 大多数驱动应该使用线性映射
 
 树状映射
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

