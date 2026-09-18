Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D0397352
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695997; cv=none; b=YPd9vSHebN56y0fAcyxNUMlDWkDMTWqlRYAHnRwVJ92llgC2+J+jx9yd8D4x0mxugKo/qb+13hJiyk4uS4OrFDaeu5/3mdx+l4ywyTFRMk7gSX5XBQd+G3Q0XyC5xkYgmPTTYnoXCIXcsdll///Jp7jVBrFnEb1XNTbGPWXQqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695997; c=relaxed/simple;
	bh=IWo8K8Ath75VoPrVg1XoiMwhI4xLfgFkKOpsccJJuWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u25MkSrDmyRW+F77zF10NYBw5coIx9sGOMVz/1A6HG2f0K1kXXIKf7NzELD8JfdFbBizXK8MmUv0+pqO0PQRiOvuMVVa/MoW0Fhg9DzOFNiL+9f9U+dG6egDxwfpGYv5UBRhYIUfDyf8X/16ePRDLzDq+GspCTXDt2P37hoEQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmhpMrN2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmhpMrN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789695987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5VGhony2GlXcldX4fKODtBEKHSnENc20be4cbUK9lc=;
	b=RmhpMrN2OengJUnp5KKpxLc6b7+Z4GwbeYqO26gcUpPorNzRJawaOddwS2/ObkYnh1H2d7
	9yG0iSnCfySITy1U9yV4EuiCYka52ZAXON7y2l5WXW68Lxv+N45cwODCSnft5n3/plnYbK
	gzXXzyciF6Nmi+c/XEsidMLHi3z1mQY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-_lSHthIDPy2okUaTYnaKsg-1; Thu,
 17 Sep 2026 21:46:25 -0400
X-MC-Unique: _lSHthIDPy2okUaTYnaKsg-1
X-Mimecast-MFC-AGG-ID: _lSHthIDPy2okUaTYnaKsg_1789695981
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94E7A195F142;
	Fri, 18 Sep 2026 01:46:21 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DBC3018004D2;
	Fri, 18 Sep 2026 01:46:17 +0000 (UTC)
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
Subject: [PATCH v8 04/14] drivers: dax: use pgtable_has_pmd_leaves()
Date: Thu, 17 Sep 2026 21:45:25 -0400
Message-ID: <700b622814a2b294083f9066631f655cf61c3070.1789695931.git.luizcap@redhat.com>
In-Reply-To: <cover.1789695931.git.luizcap@redhat.com>
References: <cover.1789695931.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

