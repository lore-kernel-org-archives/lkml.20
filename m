Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B64B1274
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823299; cv=none; b=LUEB0wLmptfKcSKb1uldMr+BvxM91OlKlb0tZOf0ztteQ3BwAtcZ8oKW7o8jkOIGYb5dZgNhVCru4HqNeG4rWNOfZe/v3kH9YJn8/v5WUu2p/ZZ9AwlXvE3Ral/0cBi5T59VfDlT30xVttdXTBk6/NgdqlboBGB1zWWh8E1y5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823299; c=relaxed/simple;
	bh=1Af5qGSHk/lmzRdmBAknNPc9D4sSlXAW+JIWfMOJcCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7B8Cvu2yH+me1f3oxKBQzAO0dVUwiNdhdqkiTxkyt6TxzcgVy4QKwlDv2gzYtONIje44l1PPsoKuRJsbmErLcitBKQnbKDjGifq/685ATi/lhis3Vi4H28bf8WzqfhP9a+ldw1pHPgh+4asbLBt5jX0ZnEC3VJxTeAPJq7kyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wj7chU6B; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wj7chU6B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=E70SnJAManO1sUwN8DIROhAuulLlMuRgGTHj2PBQWaU=; b=wj7chU6BVqljgcUk8U37IkGQ5C
	o82wbK4k4IrB1lLleRDN8ytnMKBgzEjFfEVpcPOXD2F9toPhsc+km2eRYVF/JnXMmnVL3ZK83i6E7
	ysXed8FYlI+vK37+zlMpRpsBvSqcl98tzvRurS0YF3oXy9R6GkJbsLAOSfnVZc7B5CloeZprzkrdm
	gMFB7gNwN8P5zXJON0V+A2JfH1Hw5u7m10o/h0yvQd0fGajKlEs0RQnmyNZelcpfPAWpabHS0qs4z
	dgna2jfCzArjsWYlVz0m+URtMJH17umWxgnHDvXLldxARYrz39IhJauoA7NKdj3tPs4hRzJGH8JmS
	BbbRjNeQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ5g-0000000Azc7-0ze4;
	Mon, 12 Oct 2026 16:41:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon, 12 Oct 2026 09:41:30 -0700
Message-ID: <20261012164130.671708-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
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
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
v2: rebase & resend
v3: rebase & resend
v4: rebase & resend; add Andrew to Cc: list
v5: rebase & resend

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

--- linext-2026-1007.orig/include/linux/coresight.h
+++ linext-2026-1007/include/linux/coresight.h
@@ -179,11 +179,11 @@ struct coresight_desc {
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
@@ -236,7 +236,7 @@ struct coresight_sysfs_link {
 #define CORESIGHT_TRACE_IDS_MAX 128
 
 /**
- * Trace ID map.
+ * struct coresight_trace_id_map - Trace ID map.
  *
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as
