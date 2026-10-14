Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE06566C65
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000842; cv=none; b=f5eocY/nuS84XKGF9AqR8myKF4mRLIwnVUijzreFAWlBYwNTd1cErsKiK+9av8pMG7gp1/uErzDpruC7uSncacdQuKxbAG/p7SzDOWC339SKQeBCuJjYK92kI92gpbEG4h9GDLQyBqUVPHfjZ2fkEh/CuVcqfHXbq/GtI3oJTWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000842; c=relaxed/simple;
	bh=vkrPbBm0d9KjKSoNYuBucqWjztXWGA6rs4WzzZ2Wmxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GOOyEYQJZSxif4HguEm8TRC1ynkDrn9fTEUgYi41njWWlaad7DZbY0NISZX+yqh/LvPr7IwcZnt44KZccNMjT1UPltqSWG/mRwM5hLAdu8j65sz2NOtHM7wELy3Mcxzc2uJcrkvUxCWzy41r3ENi48j5fsSE+6+t/zxHXwQ+zIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejYg5pPY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejYg5pPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792000839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DfB5QWrNUYxdsCQms7N1/QrCDrv5Ygk6GjC0+BP5JUM=;
	b=ejYg5pPYSva7zmv+G0Up71ctdxnlqY5R1UzK98ZPytpn+BIuVAZcPwekG9euYzm508vuMk
	HGNHb/MjAs8ud/5YdAuqLNuG4n2mh391hyQnVUivlpbE2NcqaL9GCctBEbpJ50uh/o8a/b
	IBcicMBLdBB/iwpLwcUFVTHJI76dF+U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-2pVkUzkBMtCo2E-XOKNc8w-1; Wed,
 14 Oct 2026 18:00:37 +0000
X-MC-Unique: 2pVkUzkBMtCo2E-XOKNc8w-1
X-Mimecast-MFC-AGG-ID: 2pVkUzkBMtCo2E-XOKNc8w_1792000836
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49E7C1955F78;
	Wed, 14 Oct 2026 18:00:36 +0000 (UTC)
Received: from dechen-thinkpadp1gen3.rht.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B96DB7C6;
	Wed, 14 Oct 2026 18:00:34 +0000 (UTC)
From: Dennis Chen <dechen@redhat.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	x86@kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Dennis Chen <dechen@redhat.com>
Subject: [PATCH] lkdtm: Make UNSET_SMEP built-in-only and unexport native_write_cr4()
Date: Wed, 14 Oct 2026 13:58:59 -0400
Message-ID: <20261014175859.30863-1-dechen@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

native_write_cr4 should not be exported to modules. Commit 21953ee5013d
("x86/cpu: Export native_write_cr4() only when CONFIG_LKTDM=m")
restricted the export somewhat, but native_write_cr4() is still exposed
to all GPL-compatible modules when CONFIG_LKDTM=m.

UNSET_SMEP is the only module user of native_write_cr4(). Restrict
the test to CONFIG_LKDTM=y and remove the export. When LKDTM is
built as a module, report XFAIL for UNSET_SMEP.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Link: https://lore.kernel.org/all/20200420090102.GB24518@infradead.org/
Signed-off-by: Dennis Chen <dechen@redhat.com>
---
 arch/x86/kernel/cpu/common.c | 3 ---
 drivers/misc/lkdtm/bugs.c    | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c7352827f491..7c1b9e045d5f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -490,9 +490,6 @@ void __no_profile native_write_cr4(unsigned long val)
 			  bits_changed);
 	}
 }
-#if IS_MODULE(CONFIG_LKDTM)
-EXPORT_SYMBOL_GPL(native_write_cr4);
-#endif
 
 void cr4_update_irqsoff(unsigned long set, unsigned long clear)
 {
diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..d82c47fb9f03 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -676,7 +676,7 @@ static void lkdtm_STACK_GUARD_PAGE_TRAILING(void)
 
 static void lkdtm_UNSET_SMEP(void)
 {
-#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML)
+#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML) && IS_BUILTIN(CONFIG_LKDTM)
 #define MOV_CR4_DEPTH	64
 	void (*direct_write_cr4)(unsigned long val);
 	unsigned char *insn;
@@ -737,7 +737,7 @@ static void lkdtm_UNSET_SMEP(void)
 		native_write_cr4(cr4);
 	}
 #else
-	pr_err("XFAIL: this test is x86_64-only\n");
+	pr_err("XFAIL: this test is x86_64-only and requires CONFIG_LKDTM=y\n");
 #endif
 }
 
-- 
2.56.0

