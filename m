Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F55335A5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869035; cv=none; b=tptoG9klDzLHwjpfu/1vdnEjYb+EqUcd5ZglJt/YMGUffLdr9Y4BU2Jn9wjS1fqm7Lsv9cuuCKCckpotnhoqQD/+FUu2AQbRBWORDchJwqBAor5qlv2ZbEiJbfisByfK4DNB+P9NnmlTRgzSOwGXo3CfbkOMO4qYmnGpVykqN5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869035; c=relaxed/simple;
	bh=qExtoH4DxAKYg2NEpWN2pLnmFbV2eKsziD3oZ/VnUk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFd3hdeUI/ZFKbRYFgfPxG0cx6WmrqDWchROjO4+WbP6gNO+rEEkJBHtv8UgHCm/WlM69W7Q19UHne6fLGEFTdioi1On/+l9sRhDFa02ejKF1AcFLtl0o1vt7xpAP/ctnVp2t1Qtgc3DShWpRpGc5IJgo2YoQTvOKT/C13lZpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RytTrp66; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RytTrp66"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b9320423cso51325455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788869028; x=1789473828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPIDmw2XzGEgiwQZ4y7rbDSaWhFnhGlig2TC9EBp00g=;
        b=RytTrp66RYESyMlG3ZMuafCA/Wkg3YruMFYVBjPpv8+2g37L0/hMueKe8O1R6jZGQt
         K8/LxQnkx4O6+tkjIc+G3QM2CwFXIrLg5KHoA2TbOMYv62kwbu7n/ChVEUUm8W3r2wbJ
         wDsThrGrVnUSXUiSsem2S81RTkBWOkMX5SGcStMEHHGJ90imFiaKnltayyeqMW3M5lXQ
         Uyvya9XW1qtq4pCXaaDrQraVGCbzCRe4XihxRXguVqRLCU+4n0ZS8uHdRdbz6FebEZPZ
         N6sciddiGn7AWEsIwY5beEtPZoR86owdXUXJnhneXkhagKl9oWBHBOv6v2klujQvnNoA
         /Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869028; x=1789473828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPIDmw2XzGEgiwQZ4y7rbDSaWhFnhGlig2TC9EBp00g=;
        b=WvYP+qUF0oUd/W0YhLn2kDGrwSXPta9bHPucIG8OMmICA+ByjlFZhQodbcKN1Us4DR
         4RvHzWCF31zTOgcwzM2GcX47+P6HtT3skv4fL6N7glCCnejju0M3Oog1btJ3onfxbjpd
         7w0JKjNSAoCoZvbZf58A4F3Pk+ikyublvspnEFGG+Mx2YlGebRzj+V+xBrCZFJYdVKE5
         TjwG7hcLTTcVKSVIYGn0Pq8eMObh0BdI5PBv2MReSm/e+8gqQdBc+PZUR80ls79ZPaeC
         v+OckR/xlnsstZ4UrREGc/3DvziZp4a52FwoLLSRQ+mKwKIhQAD+vCMyTlK2SVwwPigN
         KBpA==
X-Forwarded-Encrypted: i=1; AKwUvBw4a23YEgqiRMJRLZl++2XJ1Uey7/spn2pNRT3uUAEXufLgsoTNqEZ+6ibMC1XGHLcZJBrUExvPx2ab7Z0=@vger.kernel.org
X-Gm-Message-State: AFuF++lkcS8fEIRBMmaIWysnUpe7xSpdtM7Y4cq1InGwnqgXpOH7/c2V
	XrbodisEM4tDWu+7D+8R5CqeeyEGAnarqNHAWdBGGy+qvmYrlE3Xm3KO+/xhGzFY4Vs=
X-Gm-Gg: AYBFou3qTjAfRZQwyYnPmPGKmGD49Prt4z1muoXv9Q/PBRt4+4TiA+17twvAXmuBTYg
	BE6lrxA8hugcC9fnxAggDBANJ2PoOzcozmvbhDdbdstw2djbr1vUWEntgGSqpDoDTgHYBnqZTQw
	SgdXgsme1pkTEwKXzHUy8XizMVOhgQ4Ug7/G6+HPYNGWmVECntwQpqIcu5YqkAWfm68nkeRVYDh
	TOXzMRO2bfkLklX575sRqb/440m7jSKOvcSlBDh/I6Ynzhw0JuDR9cDSiwHHZjNDsxY/SczdkME
	A5nCHGZCDhQ7cfKStlsLkhUjn1173tiv6ZNtON9Y/tnxU2FJJa9x0ZcJh8CXS9MlTuJvbGFinkn
	dptvuLV9PQ4tsNdYhq7cXG3282vPs3mLnVvv6xFvQ9cHSN6TSZ1ivKESZi8Wrjn/2kINbfwjcvp
	uBDuYfNu+lAZVhfm2PV+JZYiUhgQuHBbXg4ITl3//cYjAXbNAAWwg=
X-Received: by 2002:a05:600c:4f89:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49cf7f32d0amr442300865e9.0.1788869027560;
        Tue, 08 Sep 2026 05:03:47 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm468299665e9.1.2026.09.08.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:03:46 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>,
	jpoimboe@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com
Cc: jikos@kernel.org,
	live-patching@vger.kernel.org,
	shuah@kernel.org,
	song@kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 1/5] livepatch: Fail object initialization on duplicate patched function
Date: Tue,  8 Sep 2026 14:03:21 +0200
Message-ID: <20260908120325.299649-2-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908120325.299649-1-pmladek@suse.com>
References: <20260908120325.299649-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harry Hsu <x90613@gmail.com>

Several symbols can share one address:

  ffffffff8ed7fef0 t __do_sys_fork
  ffffffff8ed7fef0 T __ia32_sys_fork
  ffffffff8ed7fef0 T __x64_sys_fork

klp_find_ops() looks the ops up by func->old_func, i.e. by address, so
two klp_funcs of the same livepatch naming two of these symbols resolve
to the same klp_ops and are both pushed onto one ops->func_stack.

This breaks the assumption that a single livepatch contributes at most
one entry to any func_stack.  klp_ftrace_handler() picks the entry at
the top of the stack, but when both entries belong to the same livepatch
there is nothing that says which of them should be used in the PATCHED
state, and the UNPATCHED state has to end up at the original function
either way.  klp_check_stack_func() cannot tell them apart either: it
asks whether the preceding entry is the original function or another
livepatch's replacement, and an aliased sibling is neither.

Patching two aliases of one function from a single livepatch was never
meaningful, so fail object initialization in klp_init_object_loaded()
rather than leave the redirection undefined.

Fixes: 3c33f5b99d68 ("livepatch: support for repatching a function")
Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Harry Hsu <x90613@gmail.com>
---
 kernel/livepatch/core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index a240d1144e89..a6762cbe74b7 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -863,7 +863,7 @@ static void klp_clear_object_relocs(struct klp_patch *patch,
 static int klp_init_object_loaded(struct klp_patch *patch,
 				  struct klp_object *obj)
 {
-	struct klp_func *func;
+	struct klp_func *func, *prev_func;
 	int ret;
 
 	if (klp_is_module(obj)) {
@@ -885,6 +885,21 @@ static int klp_init_object_loaded(struct klp_patch *patch,
 		if (ret)
 			return ret;
 
+		/*
+		 * Aliased symbols share one address, so they would resolve to
+		 * the same klp_ops and stack up on a single ops->func_stack,
+		 * leaving the redirection ambiguous.
+		 */
+		klp_for_each_func(obj, prev_func) {
+			if (prev_func == func)
+				break;
+			if (prev_func->old_func == func->old_func) {
+				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
+				       prev_func->old_name, func->old_name);
+				return -EINVAL;
+			}
+		}
+
 		ret = kallsyms_lookup_size_offset((unsigned long)func->old_func,
 						  &func->old_size, NULL);
 		if (!ret) {
-- 
2.55.0

