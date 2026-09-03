Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B53F4DCA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430751; cv=none; b=O/UJrXpOMX2wvNlTRM0YQt9hhYwz3ZfXNXPmJlFwdwcmOzLPXfTngDBESdJNNVBthR/txETE7QQzIDh3r5NA7XQfDBT8eq8DUVb+xCjtQy5BnWb+GapwJ10fI5uf+RRzH2fW7Ad7JgfpehKxxPnPxe2K2VfCnt/1xEb4juGYxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430751; c=relaxed/simple;
	bh=yxEvLgeO6a234EkG6hRn5dBYg7psMeXo/zcDkO3QmOw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LY9m5kIv5RZkWi3QJJ/WL9DYLkuch1/lhQ3DaVhyAQiPbQj+1eJRtT/n/6WSBSS9px4EYi4rnFiWFrVHXtQSp3AzyM4/qKyW8Xr+wzS59VukOm2CHtEMoU9l9cKKtnEheXGh+o4hpidjL/Rpt0JaHBfdoERJps36Ufg9oVyrZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZSXaBLSz; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZSXaBLSz"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso14958615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788430735; x=1789035535; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx0TtCbif7K35p3AIaJIf+dt4oCHY15FJPpSmftqgMg=;
        b=ZSXaBLSzyB2Mzc34gN9A3xi1Ie+VIGc38y7YtKXM2GKS5+srtgYaCDZU0uGA+keW9R
         QDLnqNRaZ7j63x6mlZYNfmllMJfI0FqelqnPG+Ae73nFhL8s7/cqEteO9S2rDg/ASemw
         btiMzTjt4tIqfRm+9c8LSnyTOSNB+ncSQedhdaOTNWUwYvAyC2h9bTt1HVj4R3hxZ0vL
         bSTt5y8/eTi/WZH3FEsa++bf+xwSKBsRISGWAN8nV2C2N3NHAKKhIoGSKJpR8t2IBWXq
         0jCfOEUh85NL+dB2SihCOLVwE7DT9SiP35wBXc4wIn7yDtzXZ9wfDtadgEo+1GH7JHup
         6Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430735; x=1789035535;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lx0TtCbif7K35p3AIaJIf+dt4oCHY15FJPpSmftqgMg=;
        b=PpXhWC0okeEXSqBi9p04QAv5+BYd7jw2yNAt7PH70S5qyQU1COff2htXDAkR3bEY4v
         0gAEBns2/6SHoDqj+OlPTsrdemcgbYfkRDTmZ1cT4dW4UYZbQ3bkqvzFFO51dus1GR7Q
         lzGQ/FTR2esn/MFOCpmzOH2Eo23rd4hUJfonYzy3k2d5P26/H1idTwqOGKQZ7CykfuS5
         AA+zd/YBLLvvO9a9yloZUSwxo7jpTrKzfm694omv5k3+ViH6trLvi0vjG9qxPXrw0oiA
         c7/T2T+WRhwKrBNl+HD6LzbB8/Vyabim0hoZBkr+CDDckHos1fZuSjCVjuATzQc/Pai2
         i5VQ==
X-Gm-Message-State: AFuF++m1k+ErlNnrhyv05G3E/0vj/CKpxqZ0yFBI5APjKL08KxmtYpdt
	LePRFgCbY5U+YyTkDKX5YRMSij/inBeVA3jr7u1KDgjP+1hREDuQ0iLQT+MO9klvvqU4voZNQyv
	VUQ==
X-Received: from wmby2.prod.google.com ([2002:a05:600c:c042:b0:499:b692:b246])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5489:b0:499:4e47:eaf2
 with SMTP id 5b1f17b1804b1-49ce58092a6mr171429625e9.6.1788430734709; Thu, 03
 Sep 2026 03:18:54 -0700 (PDT)
Date: Thu,  3 Sep 2026 10:16:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260903101843.3462767-1-elver@google.com>
Subject: [PATCH] once_lite: Simplify condition handling and fix context analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Jan Kara <jack@suse.cz>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, Theodore Tso <tytso@mit.edu>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When WARN_ON_ONCE() wraps a conditional lock acquisition (such as
down_write_trylock()) on architectures relying on DO_ONCE_LITE_IF()
(e.g. arm), Clang's context analysis (Thread Safety Analysis) failed
with a false positive:

  fs/ext2/xattr.c:825:6: error: rw_semaphore 'EXT2_I().xattr_sem' is not held on every path through here [-Werror,-Wthread-safety-analysis]
    825 |         if (WARN_ON_ONCE(!down_write_trylock(&EXT2_I(inode)->xattr_sem)))
        |             ^

This happens because DO_ONCE_LITE_IF() branches on __ONCE_LITE_IF()'s
return value (__ret_once), creating an intermediate branch merge point
where the lock may or may not be held depending on whether the once-flag
(__already_done) was already set. Because the merge branch condition is
__ret_once rather than the trylock predicate (__ret_do_once), Clang
cannot reconcile the lockset at the branch merge points.

Fix it by refactoring __ONCE_LITE_IF() into an unconditional
__ONCE_LITE() primitive and redefining __ONCE_LITE_IF(condition) as:

  (unlikely(condition) && __ONCE_LITE())

This simplifies the implementation, short-circuits evaluation so that
__ONCE_LITE() is not called when the condition is false, and ensures
that DO_ONCE_LITE_IF() only enters __ONCE_LITE() when __ret_do_once is
true.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/all/20260903072759.GA1750084@ax162/
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/once_lite.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/once_lite.h b/include/linux/once_lite.h
index 236592c4eeb1..5e2b67039aaf 100644
--- a/include/linux/once_lite.h
+++ b/include/linux/once_lite.h
@@ -10,19 +10,21 @@
 #define DO_ONCE_LITE(func, ...)						\
 	DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
 
-#define __ONCE_LITE_IF(condition)					\
+#define __ONCE_LITE()							\
 	({								\
 		static bool __section(".data..once") __already_done;	\
-		bool __ret_cond = !!(condition);			\
 		bool __ret_once = false;				\
 									\
-		if (unlikely(__ret_cond) && unlikely(!__already_done)) {\
+		if (unlikely(!__already_done)) {			\
 			__already_done = true;				\
 			__ret_once = true;				\
 		}							\
 		unlikely(__ret_once);					\
 	})
 
+#define __ONCE_LITE_IF(condition)					\
+	(unlikely(condition) && __ONCE_LITE())
+
 #define DO_ONCE_LITE_IF(condition, func, ...)				\
 	({								\
 		bool __ret_do_once = !!(condition);			\
-- 
2.55.0.970.g62bdec98f9-goog

