Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95E308F26
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145759; cv=none; b=ECwYuA2qLY1Erjr75/v3MfbX9Ocn965B1N7Qu+qa+Xj5ChukR1wBqPTnqrd8Pq9r03GcsSA/FuKhCRn8ByQ3KzEDgKDt4IReg3JFRH74iyBHZ3Rho4ufUwnn8z5Zd0kEoSWMbNpVar8mIy1Pi+ujiZtWHsuAH1uouxWGXNDctaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145759; c=relaxed/simple;
	bh=bNn6W0QjRSWOxBws1GGEMFUGRDn0pkAQ2ybEm6NsQa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBoFYVxSselk7T8yXLrHXPp38J+QyIb/n+JGrClZZ1ODnBZkgrl8zROpCE8cnhMNxqrIkR7+T1NLd6aHT6hZzta39E6La5z+EXRRxNy6rNle4e4QIfAc0h82EFFG9MvpDnVVY2JOsUYcLgQonwq8GhzfvieGNYaXnd8ua1Y66oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HYxyKsgu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HYxyKsgu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NWvQJuqSPHF8KCZzanHrbmAUYIDC8tUyn91hJD3luIM=; b=HYxyKsgujE/DGZ3xuMsthpndz1
	qPwAyTy1k2n9s3xG75QOhKz3Bzl4Um9iIxR25wQWjT45K29UyHXLOm1vrDq6BKGe8XfYLrXtOG5Zn
	EqEudfukPfgnFjNVfxdzm22X/POMoXGKzyfmWZj2QFgbC5QnyFqTLssT9qM7OlmYupu0QSkuE5G6N
	NIOlslUr1YFCUCEKwoyKEcLXuA9EZEbvc8/tNr/zr0as7vv1nzvNb4LTg7qtSZU2wgvJw0PS30suE
	JuH0WoJn0tRNHGFoS4qn6hTvRuyALWdiuFShBI9u7m4TqsMKnEgDRfCPrY+EdAaELFOdSHfkVWYng
	ifYMaIgA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sOX-00000008O3C-0TdK;
	Mon, 31 Aug 2026 03:09:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4] coresight: coresight.h: add '*' to kernel-doc lines
Date: Sun, 30 Aug 2026 20:09:12 -0700
Message-ID: <20260831030912.3399089-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
a beginning '*' in them, so fix these lines.

Also convert struct coresight_trace_id_map to kernel-doc format to
remove another warning.

Warning: include/linux/coresight.h:173 bad line:
  connected to @src_port. NULL until the device is created
Warning: include/linux/coresight.h:177 bad line:
  needs to be filtered.
Warning: include/linux/coresight.h:236 This comment starts with '/**',
  but isn't a kernel-doc comment.

Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: rebase & resend
v3: rebase & resend
v4: rebase & resend; add Andrew to Cc: list

Cc: James Clark <james.clark@arm.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/coresight.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260828.orig/include/linux/coresight.h
+++ linux-next-20260828/include/linux/coresight.h
@@ -177,11 +177,11 @@ struct coresight_desc {
  * @dest_port:	destination's input port number @src_port is connected to.
  * @dest_fwnode: destination component's fwnode handle.
  * @dest_dev:	a @coresight_device representation of the component
-		connected to @src_port. NULL until the device is created
+ *		connected to @src_port. NULL until the device is created
  * @link: Representation of the connection as a sysfs link.
  * @filter_src_fwnode: filter source component's fwnode handle.
  * @filter_src_dev: a @coresight_device representation of the component that
-		needs to be filtered.
+ *		needs to be filtered.
  *
  * The full connection structure looks like this, where in_conns store
  * references to same connection as the source device's out_conns.
@@ -234,7 +234,7 @@ struct coresight_sysfs_link {
 #define CORESIGHT_TRACE_IDS_MAX 128
 
 /**
- * Trace ID map.
+ * struct coresight_trace_id_map - Trace ID map.
  *
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as
