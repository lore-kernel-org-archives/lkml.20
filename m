Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8543CE6D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232417; cv=none; b=IWXUtAQf1riw32EZOlB7QdO9TIjN4fwuf4cwjQyCqgzkBwHKpAS4I1LNFKs0nYh/rqmO8jJe1OXLFG975U2bHH32+Tn0lgVz1wV/LxbOBqgA6qlA/GI11IO9tT1ZFSNGffg8hM6TXQdpz4yA+c0xOAkhfmOSmaqz3Q//dWbEKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232417; c=relaxed/simple;
	bh=I8WGTvPwl2HscdcJoioO7N/lpxfcyBoZaYt1p7RXZHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgMOI2ZBtdi1uVYKHXSx8kkIdcsoFVZGXI484nno3ERk6AxWDptg+P86WDiqacayxHu3PoVYMA2ESzk3AIQ7mblLvE33h6xOCi23f0EvgTEqhNFWrmLevzlViSiKQH7vQt3NaOnuqCRPlFC3cO7IluGwcq3lYS9N8nK5bhSkiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KnVKuh8M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KnVKuh8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIfvMfZyaWvl4SXEvl5wZrxucNW79v3GPJFsRYX4w4M=;
	b=KnVKuh8MOInTCpYSQmhGx04j/C+hQXgfVv8djuTmxmG7ej3LXm5+S/sMs4j0KPYMNYdx1+
	oD4V33VrP40x6u1BZ2TIGvsI9nl5djn14OlIpR1AKhz6A7VYZsYnjERs9EnsWoRP9EmP2J
	4tC6HpBZT/tQTMP9biIZ3KKTzUXp7ZI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-kyslgUdCMcmyuoL2_hzZ4A-1; Mon,
 31 Aug 2026 23:13:28 -0400
X-MC-Unique: kyslgUdCMcmyuoL2_hzZ4A-1
X-Mimecast-MFC-AGG-ID: kyslgUdCMcmyuoL2_hzZ4A_1788232405
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 178AD192E255;
	Tue,  1 Sep 2026 03:13:25 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9944518005B7;
	Tue,  1 Sep 2026 03:13:21 +0000 (UTC)
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
Subject: [PATCH v7 11/14] x86: move has_transparent_hugepage() out of THP guard
Date: Mon, 31 Aug 2026 23:12:15 -0400
Message-ID: <9f8cc58ebe0f8365952e2c528f547e1321e1a23d.1788232334.git.luizcap@redhat.com>
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
 arch/x86/include/asm/pgtable.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d5f4917c1edc..f207e5268918 100644
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

