Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C53B0AF5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696034; cv=none; b=fHxxvizU3F7RUUZTc57JWMmDSA8adkk7piS9dAkClrrJ9lWUr0/B/Dc3SCAMAR0kvoQZ3KdWLJIsgRxlxXfEqqiC+7FuQvekTuzyUhhB5h+333xe6SnzmYzQOsv/emUd6kQCFbyREhcYSIc0JfXGiRnHhR2Hp7gxf5U3xr2SG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696034; c=relaxed/simple;
	bh=6NGF+72oRrxsj+T5MAPFjuRbTYNd1OWx/cv3AIx+k1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4X2pcpEcx7MCnj09wpmpdfsSJGSAwEBRsDPMRkiGDsXmBKDBHKRkOUJkC4Olziu4lngm/hgaAtHHOqSLir/b/qczf/rYbzwdITVNtuwM8fpRiObTLkqR8CpLUWgtxYu6Ia7ij0vf5BIlQWhyFjGiHvpT7hXMl1K8hCXDTnXXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aPyeJiNs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aPyeJiNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789696018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrTuOGC0ZZQ6xfwNevyROwK/DQ0EXDFg6sIlh7G6Yxk=;
	b=aPyeJiNsGcjLOY5UIXEUdbrttzuFgNQh/mP8Eci4cWlvP2WygJ6CjnLmPYCK1992F2x3My
	uC3yk2wAhT2xL1uR00HLN+Kc05ZJtXWmXTAOqpb5X1AiFcIfivn03PaqEEh/JqzlIYs010
	fiLfl9D5fI6ngBcofe2Ky3PgNCgG3sM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-8fUCrc4nMma3PteMWBX0ew-1; Thu,
 17 Sep 2026 21:46:53 -0400
X-MC-Unique: 8fUCrc4nMma3PteMWBX0ew-1
X-Mimecast-MFC-AGG-ID: 8fUCrc4nMma3PteMWBX0ew_1789696010
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 657EE187A5F1;
	Fri, 18 Sep 2026 01:46:50 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D2D13180034C;
	Fri, 18 Sep 2026 01:46:46 +0000 (UTC)
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
Subject: [PATCH v8 11/14] x86: move has_transparent_hugepage() out of THP guard
Date: Thu, 17 Sep 2026 21:45:32 -0400
Message-ID: <a9f96668979173500096b2df96a96cef84559bee.1789695931.git.luizcap@redhat.com>
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

A future commit will introduce a kernel API to allow for checking if the
CPU supports PMD-sized pages. This API will be based on the
has_transparent_hugepage() implementation but will be orthogonal to THP
and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.

Move its definition out of the THP guard.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d551120a7c88..f46c1b502eb1 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -306,12 +306,6 @@ static inline int pud_trans_huge(pud_t pud)
 }
 #endif
 
-#define has_transparent_hugepage has_transparent_hugepage
-static inline int has_transparent_hugepage(void)
-{
-	return boot_cpu_has(X86_FEATURE_PSE);
-}
-
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 static inline bool pmd_special(pmd_t pmd)
 {
@@ -337,6 +331,12 @@ static inline pud_t pud_mkspecial(pud_t pud)
 #endif	/* CONFIG_ARCH_SUPPORTS_PUD_PFNMAP */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define has_transparent_hugepage has_transparent_hugepage
+static inline int has_transparent_hugepage(void)
+{
+	return boot_cpu_has(X86_FEATURE_PSE);
+}
+
 static inline pte_t pte_set_flags(pte_t pte, pteval_t set)
 {
 	pteval_t v = native_pte_val(pte);
-- 
2.55.0

