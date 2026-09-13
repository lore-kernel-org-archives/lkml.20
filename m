Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEE282F1B;
	Sun, 13 Sep 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308768; cv=none; b=RPo3W0yyQYJSP/Io1wODuZ2SxIKswfDIWMuiPXnlu346BJsADDeKG7FgpSn4nHVPRFFf6fvvQx+ZT2E60bJGK5VVptk1kJ97jyO93lz997tVjp/v7Iyniqwk+bZvsVHDJue6Ha71EkiXjEdiMWdqLnXeJNh7F9RdOBUU6QBdOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308768; c=relaxed/simple;
	bh=6EIGGfWud1mR0HfR34kYUPSFNAdl1KclS3hGfxGyoqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXlat6EhNw06n7YwV0c0a4kgn0Er/Bvuk6h5dAufGSwS7hkX3tiiQhdIBf0vRD7obiPoEzUY080qdtS9sDL8jlL47LRdy9W2Kk5RNncWqZQMXkafto1QODFeEBAp9tZkBWbSL7TgDU9sDT/LFtreDU9BTAHO7bPnTUtgRFARCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=INuWC7CP; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=INuWC7CP; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="INuWC7CP";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="INuWC7CP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789308757; bh=6EIGGfWud1mR0HfR34kYUPSFNAdl1KclS3hGfxGyoqk=;
	h=From:To:Cc:Subject:Date:From;
	b=INuWC7CPrvqN10sT+OpNJ69e5W6dDWlG7m5qkEcegMUhxjscS8pWZz+qQ4hhaA7g0
	 JsPei9W5hx98/pwHO6mXWqQ4g8tqP4GnG82EYOGNxb121nhQ03+GCjEfTQbjVFtrSk
	 eCaBVh/ff6xBgKV75PLoZNoj8bW3cp4JPbhkw2JN0m9IEUgKfAtOt3mK9BkGGKndZy
	 3NclU159hgK0xd1GNuKoyFXJ1pcj7HO4PZfXfVpPWzRLgRhuenAP+xhAue2y8ITDFK
	 ozt0EP2XHLSlm8bWoBbkqJcn39sZF082CPjN15Rsg4hYiIhnqNBZH96bRmDzSFVNTV
	 jl3VLtWaHtbZQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id E71AA40AD3; Sun, 13 Sep 2026 15:12:37 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789308757; bh=6EIGGfWud1mR0HfR34kYUPSFNAdl1KclS3hGfxGyoqk=;
	h=From:To:Cc:Subject:Date:From;
	b=INuWC7CPrvqN10sT+OpNJ69e5W6dDWlG7m5qkEcegMUhxjscS8pWZz+qQ4hhaA7g0
	 JsPei9W5hx98/pwHO6mXWqQ4g8tqP4GnG82EYOGNxb121nhQ03+GCjEfTQbjVFtrSk
	 eCaBVh/ff6xBgKV75PLoZNoj8bW3cp4JPbhkw2JN0m9IEUgKfAtOt3mK9BkGGKndZy
	 3NclU159hgK0xd1GNuKoyFXJ1pcj7HO4PZfXfVpPWzRLgRhuenAP+xhAue2y8ITDFK
	 ozt0EP2XHLSlm8bWoBbkqJcn39sZF082CPjN15Rsg4hYiIhnqNBZH96bRmDzSFVNTV
	 jl3VLtWaHtbZQ==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 1749640ACE;
	Sun, 13 Sep 2026 15:12:37 +0100 (BST)
From: Sean Young <sean@mess.org>
To: parisc-linux@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Sean Young <sean@mess.org>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: unwind: Replace open-coded binary search with bsearch()
Date: Sun, 13 Sep 2026 15:12:27 +0100
Message-ID: <20260913141228.176399-1-sean@mess.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a bug in the binary search where hi can underflow. If
addr is less than the first entry, then "hi = mid - 1" will underflow
to ULONG_MAX. Then we have an out-of-bounds read.

Replace the open-coded binary search with bsearch().

Issue found by an LLM.

Signed-off-by: Sean Young <sean@mess.org>
---
 arch/parisc/kernel/unwind.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 32103a270a8e..fab9ae22191a 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/bsearch.h>
 #include <linux/sched/task_stack.h>
 
 #include <linux/uaccess.h>
@@ -49,27 +50,23 @@ static DEFINE_SPINLOCK(unwind_lock);
 static struct unwind_table kernel_unwind_table __ro_after_init;
 static LIST_HEAD(unwind_tables);
 
-static inline const struct unwind_table_entry *
-find_unwind_entry_in_table(const struct unwind_table *table, unsigned long addr)
+static int cmp_unwind_entry(const void *key, const void *elt)
 {
-	const struct unwind_table_entry *e = NULL;
-	unsigned long lo, hi, mid;
+	unsigned long addr = (unsigned long)key;
+	const struct unwind_table_entry *e = elt;
 
-	lo = 0; 
-	hi = table->length - 1; 
-	
-	while (lo <= hi) {
-		mid = (hi - lo) / 2 + lo;
-		e = &table->table[mid];
-		if (addr < e->region_start)
-			hi = mid - 1;
-		else if (addr > e->region_end)
-			lo = mid + 1;
-		else
-			return e;
-	}
+	if (addr < e->region_start)
+		return -1;
+	if (addr > e->region_end)
+		return 1;
+	return 0;
+}
 
-	return NULL;
+static inline const struct unwind_table_entry *
+find_unwind_entry_in_table(const struct unwind_table *table, unsigned long addr)
+{
+	return bsearch((void *)addr, table->table, table->length,
+		       sizeof(*table->table), cmp_unwind_entry);
 }
 
 static const struct unwind_table_entry *
-- 
2.55.0

