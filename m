Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F0E396D28
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469634; cv=none; b=pvkJZCVbtk0aBuXtO/yagoC0UMO+NaZc5z7C4vBo6co0cxlFlLXEemx/ewDmYMNtf1E0LlvxwiYcdkkOSrN8vn6OOK8XUGGITh1QFZv6cKX1gZkvGNCfk3h6awQrfI1H5mB5mqIXyVQIZVJ0bm1ZKApNG5LQbl8mz2p8UVPu930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469634; c=relaxed/simple;
	bh=hnOcYXmh5LhX3pi9rEvfebreY5Ug5jrveF7e2aFcLPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGjeisuw2BT0DGJlrfw/x04WjHm1MsbqmCED0C955sKyHtEgPOlwaTnt1RnwaJlax1J9X/UFBg39ir0G3jH4M/xbXVpTe0fceNgYvUsiBUF/AbS6vH+O3QXv3VW28oc7FO5bo9J4tsqCsFDyrmgCc8jm+RsKYLCdpYZp15Esje8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3j61rCX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3j61rCX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so28377705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469630; x=1792074430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YS63s2McwxMm+pKW8R+B1o0zb20mvAwoCWQOqk3C4/k=;
        b=C3j61rCXK1RRSwPAY2ofnpIb/Jq6sP20nt8/MmC5JZvyiGu+k4AiIy0u94+SpVaRRh
         4yrgU6s+nfcsx1kVQxKMTE+43zgOUrFm6owpk1XLk7PrYz8mZ15P3Dk+MhtbiyQd5/Q+
         OpKBGMY7vp89wFf+QKoKcZ0ii0spdoQf+KheVjiEAyEJTahosNoYuOC3Nt8w9wftY2ig
         WoMDv/QfGGxtQfy00x25MFTW6un0wpX3oHbIlEj7JigTxWwLiCh64VOJtmPjutUjT14E
         oI239kZUFMRIxs4csB10gzPg1gN87m4JrR42EeDmunn26gIuHz2vk4XWFwxdnmUcq1eK
         H+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469630; x=1792074430;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YS63s2McwxMm+pKW8R+B1o0zb20mvAwoCWQOqk3C4/k=;
        b=ZboDJwVQGT3qqS/kNb/iekqXyYTVqQLg5MHIrYb7SjdZ4nE6rLdjxxiU0y5hKaYfmi
         gcaV41ZJUZGEbuddfIsXFuQNR4ETqwvD1KmP0BKD8x8hovV6vnm5uF9TOy57kUme7weF
         fW7GPsZLxD+d6sgTo5dq/m/gWwPPD7lAXFmmUVk/Y73rPr4sAIGrP4uVdvEkThMXdQdE
         aVVcu6jayLJg4nBbwEb2P9nN3IksW6qXM2FNVlWp1y9BB0lkX/mPXbWxJM4OVO0ghOhX
         D0mMZ0WegVAV1gI2qtlxnIyOyRhGN47dDdhqOyNX5sXy3dsNSY/RJ9KQNs0j/6c/XLgA
         ZQoA==
X-Forwarded-Encrypted: i=1; AKwUvBxP4zm6S3z2Kymwss080nFMTn1WCYMmNWRSS34vQfuEsxaDm8uOp8Rayvzb3PTnI5co1GMerdk3xvLqt84=@vger.kernel.org
X-Gm-Message-State: AFuF++kb+/IAJ06omFIfz1zpSWm+X0CY5iNnYe6DrxFAEpaBle7ordnS
	tnaZMcyCQRMmzlDOE+pwMklqRC/SeIDlUrESBOZjncJhVO9F2/DDvuwA
X-Gm-Gg: AYBFou33SOAmv2jHMxf6wbCH4RfmQtZnUeGxPmyZc+3CGcRYa03RTmmhUM35mZyQtJy
	QSctaK9qXuwPXUVVDoxtGV18x328Z0iylLxEF9XRhCbUdEPvPRtR1tN6wxR2ILbTblwoMnH15oP
	dIFoYz49DutZD3+F8UvJrX0XajAXoAe0QQ3jU3f4CwtcgsRSgX/iEJ1dO074lnDPb+JS6XbPwpZ
	GXVScr+D+7PFe3qMsJoFRu8Y410RAHYnCzdnhylOH0RhXa9PQ+Dr5c+gAoZibDrad/tAagEK5bN
	xnajr7AYINNYiGCV16nHL7kLA3PebAmMhAIXyF/rSOklnqS6FYo+pgW76RzCRo5Tbmuutw4SvFm
	L+icsQS6Wn2e9acAQskYnzcTjRGojvOB1QwncB+XhqKbCrvSoSilKauTeuKFdndfPQdNXgi9pCf
	7dhpeLTN9qMuisbwkdD6lvjwr70LCwrRLj4g9bKvLT8j8ANioz7An93WPsyMNRIthCPXqp1riP4
	X7OLYWnmmK8CZq+YcaXXbU=
X-Received: by 2002:a05:600c:1551:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a18043cac2mr101930475e9.22.1791469629879;
        Thu, 08 Oct 2026 07:27:09 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843bd060sm92830635e9.14.2026.10.08.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:09 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/27] selftests/landlock: Assert helper results that are used afterwards
Date: Thu,  8 Oct 2026 16:25:40 +0200
Message-ID: <20261008142604.39107-13-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some helpers check a result with EXPECT_*() and then use it:
cap_get_proc() in _init_caps() and _change_cap(), and
landlock_create_ruleset() in drop_access_rights(), create_domain() and
create_fs_domain().  On failure they pass NULL or -1 to the next calls,
which then fail with misleading messages.

Use ASSERT_*() for these checks, as create_scoped_domain() already does.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h                   | 6 +++---
 tools/testing/selftests/landlock/ptrace_test.c              | 2 +-
 .../testing/selftests/landlock/scoped_abstract_unix_test.c  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index e195c0f48eb3..e1aa0ec02c96 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -53,7 +53,7 @@ static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
 		EXPECT_EQ(0, cap_set_secbits(noroot));
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_clear(cap_p));
 	if (!drop_all) {
 		EXPECT_NE(-1, cap_set_flag(cap_p, CAP_PERMITTED,
@@ -89,7 +89,7 @@ static void _change_cap(struct __test_metadata *const _metadata,
 	cap_t cap_p;
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_set_flag(cap_p, flag, 1, &cap, value));
 	EXPECT_NE(-1, cap_set_proc(cap_p))
 	{
@@ -214,7 +214,7 @@ drop_access_rights(struct __test_metadata *const _metadata,
 
 	ruleset_fd =
 		landlock_create_ruleset(ruleset_attr, sizeof(*ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index 10371c1830ad..b951889cd6ca 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -37,7 +37,7 @@ static void create_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5e8224623780..55a1599819c8 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -40,7 +40,7 @@ static void create_fs_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
-- 
2.56.0

