Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A436B903
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908636; cv=none; b=lDKMn3EEo7kXqlh7ySNaaAUOzs7JjQyOo7/sTrclRhWNtS+ByU9Uz3AYHXdjU2QoS5X8jTHei+82ejMbE0CqQ8lpZP8Wv3uTVF06c+S5yWlcedNUJO3CS8FV4UZd5zuTEuLm8skc+qVAZSyQAYUJL/iT2FPbnYJfMlospAiUsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908636; c=relaxed/simple;
	bh=oTB+e1X08lV0SCOXB2BBzFpAxhkD9I9qOApG+aWlKAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IR5VGqRbXEklaTsRd3az6OODQ3dsy4sDIReWCg6s0zvN1sOZf0yw3et4IVdJ+U5LC2G6KoC1vp+/+Q4Zi7pmyvy27nsKu8jZ1g920Xzqhpb1tU1X8yVR7qMdFNuTzX5rOl7jbvhjLsjL4wYPY7jHoJft/A5PmzG2FD7blcpI6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e3u2rm2K; arc=none smtp.client-ip=91.218.175.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e3u2rm2K"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oTB+e1X08lV0SCOXB2BBzFpAxhkD9I9qOApG+aWlKAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908633; v=1; x=1788513433;
 b=e3u2rm2KNEYlBjaYC6GeIoALLZWeJyL6rgW09mjYnLij/Bn8l7roh2sfvHVGNwuy9CEdLLUi
 ozgd2Ry4CZTUxzhs8JuDZI+mtt+LpSUJdvSVOfSc46qRWbwAjwhUbeV5keooM4niJ/9uMerMM8u
 tq2d78LRRkdxQhsheXPvpIX0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2c6528a9515d8e60;
	Fri, 28 Aug 2026 09:17:12 +0000
X-Mizu-Trace-ID: 2c6528a9515d8e60
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: brauner@kernel.org
Cc: jack@suse.cz,
	kees@kernel.org,
	cyphar@cyphar.com,
	containers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn,
	cui.tao@linux.dev
Subject: [PATCH 1/2] userns: remove dead key_put() on the create_user_ns() error path
Date: Fri, 28 Aug 2026 17:16:58 +0800
Message-ID: <20260828091659.358700-2-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091659.358700-1-cui.tao@linux.dev>
References: <20260828091659.358700-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

create_user_ns() jumps to fail_keyring when setup_userns_sysctls()
fails.  At that point ns was freshly allocated with
kmem_cache_zalloc() and ns->persistent_keyring_register is only ever
assigned later, lazily, from key_get_persistent()
(security/keys/persistent.c).  The key_put() therefore always
receives NULL.

Remove the dead call.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/user_namespace.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 0bed462e9b2a..e9e04ce167df 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -162,9 +162,6 @@ int create_user_ns(struct cred *new)
 	ns_tree_add(ns);
 	return 0;
 fail_keyring:
-#ifdef CONFIG_PERSISTENT_KEYRINGS
-	key_put(ns->persistent_keyring_register);
-#endif
 	ns_common_free(ns);
 fail_free:
 	kmem_cache_free(user_ns_cachep, ns);
-- 
2.43.0

