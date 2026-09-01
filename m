Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C543CEC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232404; cv=none; b=b/j8N+Rh3bSK+Vfov9ZBg71qso5CPRDsIHZQWQxZ4IJuYMPFwnlzVsoBnCt9NpUrBhCEFWhmdI6butRVqqw9p9xvdT5OptcJGBkBfVNXwskdPBpkzJharWkTy87bCBkOgYsyWtxQpI4/vcBJ3bSaMYWW5aj1zZFBxQb7CueRV30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232404; c=relaxed/simple;
	bh=vzP2y24how2k5GqsBVu45wjx4OYWghN6TbUbEftSVhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acce+gXwKrkrFzRlsL39pAsidRAyrqhucXRlLuHHKH6g71u/AqxrjVnss4LI4VTOJODSywabjG+v4wcAO9NUGNARDYd5UQ+pRETnVxltlKJY904zWuZ6dDp4K8KHq2KPGmzy/zTMD52JPM5YqvoEWLmhueJ/Z1Aht7+iIeoJT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeGGIqpP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeGGIqpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTc935LDNPx7nXKta8GUS/LwnjuaroaKOzKm4nVuj4M=;
	b=EeGGIqpPP3hM+H8EB9ZEMV8Za2C6XuZGqu8cdbUS19/pi/nxAI8Lra1NF8OKRRb1fpdAPE
	0k/5oX2kIyoNhEF5zs7hROkVIZaIrzybmRbK0nJlg/dRmzTIXMQQxJBdxcyiPrIFgSTJUS
	J60jbLx0eBbN8WfbuoQttb/B1+yHCpA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-OThTEAxzMc6Qm6uhOHF8eA-1; Mon,
 31 Aug 2026 23:13:17 -0400
X-MC-Unique: OThTEAxzMc6Qm6uhOHF8eA-1
X-Mimecast-MFC-AGG-ID: OThTEAxzMc6Qm6uhOHF8eA_1788232394
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2265D1944CC3;
	Tue,  1 Sep 2026 03:13:14 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52AC618005BC;
	Tue,  1 Sep 2026 03:13:10 +0000 (UTC)
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
Subject: [PATCH v7 08/14] s390: move has_transparent_hugepage() out of THP guard
Date: Mon, 31 Aug 2026 23:12:12 -0400
Message-ID: <dc0b0e69402619ac23d7271d64b0d84a77a5379a.1788232334.git.luizcap@redhat.com>
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

A future commit will introduce a kernel API to allow for checking if the
CPU supports PMD-sized pages. This API will be based on the
has_transparent_hugepage() implementation but will be orthogonal to THP
and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.

Move its definition out of the THP guard.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 arch/s390/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index e882663a58e7..5aa8f621df04 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1825,13 +1825,13 @@ static inline int pmd_trans_huge(pmd_t pmd)
 {
 	return pmd_leaf(pmd);
 }
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #define has_transparent_hugepage has_transparent_hugepage
 static inline int has_transparent_hugepage(void)
 {
 	return cpu_has_edat1() ? 1 : 0;
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
 static inline bool pte_user_accessible_page(struct mm_struct *mm, unsigned long addr, pte_t pte)
-- 
2.55.0

