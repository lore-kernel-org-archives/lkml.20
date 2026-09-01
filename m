Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC929408
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232389; cv=none; b=djSLvdlxfpSI6e6E+6jIC7I5x824T634hO3UEBEIhaqMeaCkbhgiy+Mflwu24Spn2NgVkjuvyBOKJDTR9e9UTl1tdqJu9qPWqCl4gOv8X1t6hF5RJR4pxFtg8jNvDMi7kcJOBrR1rAs5Eena76tX6+8ildERQZ49MQX12FxElUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232389; c=relaxed/simple;
	bh=IWo8K8Ath75VoPrVg1XoiMwhI4xLfgFkKOpsccJJuWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay0ggvzJWzT3kOFnT+973Puzh3IW0ZkWOMz/qERN+QMcfmhJCNQ8qdtCbwAAFsAQJAsPBzlmGwMsZGZMRuTVi+FzzjP+nPYci78ajr821rYbx35oJ09jiaRTxoP4G7wbJb96H17+s84BqhEhSGpQGxpumiPDXTaT2vy9y4o2SuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQTOVxiA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQTOVxiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5VGhony2GlXcldX4fKODtBEKHSnENc20be4cbUK9lc=;
	b=NQTOVxiAGifnrV0XIQBtJeGBvO30JFKaElqUo/gwIPYNk566arNtvnRMrjvQDK8ilmTGxU
	/b50qpo9FGgLw8YZYRHZq1aqykB711vrWBqpe+hfHXGes/iSaC0h5r0hndtZJ6S/eItVp0
	geAwsteninRtvK4UdS1Qwh3JjNt33co=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-mDrP8zVkNGum5w-rbgaU_g-1; Mon,
 31 Aug 2026 23:13:02 -0400
X-MC-Unique: mDrP8zVkNGum5w-rbgaU_g-1
X-Mimecast-MFC-AGG-ID: mDrP8zVkNGum5w-rbgaU_g_1788232378
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CC8919792E3;
	Tue,  1 Sep 2026 03:12:57 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C14CE18005B8;
	Tue,  1 Sep 2026 03:12:53 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev
Cc: corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: [PATCH v7 04/14] drivers: dax: use pgtable_has_pmd_leaves()
Date: Mon, 31 Aug 2026 23:12:08 -0400
Message-ID: <bfa653ca6aae4765a026437c5bb231ff839c0586.1788232334.git.luizcap@redhat.com>
In-Reply-To: <cover.1788232334.git.luizcap@redhat.com>
References: <cover.1788232334.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

dax_align_valid() uses has_transparent_hugepage() to check if PMD-sized
pages are supported, use pgtable_has_pmd_leaves() instead.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 drivers/dax/dax-private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 607a53a91f58..18a6295aa766 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -121,7 +121,7 @@ static inline bool dax_align_valid(unsigned long align)
 {
 	if (align == PUD_SIZE && IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD))
 		return true;
-	if (align == PMD_SIZE && has_transparent_hugepage())
+	if (align == PMD_SIZE && pgtable_has_pmd_leaves())
 		return true;
 	if (align == PAGE_SIZE)
 		return true;
-- 
2.55.0

