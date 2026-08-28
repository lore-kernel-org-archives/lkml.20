Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B073EBF23
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906958; cv=none; b=g9K2cZe7TJLESxEshbde3tDu5dKFqq44tmpYsQfwo2cv06jt3o+tfEgzZkzhg1HsipArVS4J+PCl3XSVZ2dBrXxLZkEoVz1fjwaOIL90Dnd+M89x2TLQWCXbJ1akAdu05xGzK9cL6VG2vpOvLHZxDHU40qzA6RG3r1NStLdHPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906958; c=relaxed/simple;
	bh=lPNnRoOrhzhsS+FymvpE5fLXDzV/1DBvokGgYqkBEjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiqYb6Y0bF+2ce3pLjFHXxbeKexhjYVA4Pb+8Kxz3XaZcG5FiVPblXIN9/oOxF/YehEbZ3iKL6ZVvwpCX1ikrKz6MR9Wm/VfpUCZ5N1Dha19RZ8O99KPAtlihOvTJVZwbFOqJm8Bu9ZfqxsXQT0IZklMf9KBVC3vqKOjcnkb5wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGW9AHuH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGW9AHuH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8548db7428aso621381b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906952; x=1788511752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ic1yrNDonznjqguqtqXp54bWq7NGxRiJhvS56iX+0A=;
        b=qGW9AHuHn6Xmpau7YO58tNosBoXEjEslpXliqkbFBNhLmz6sIUGXe6Wpr9Un6aUzlK
         yikOkE0QWnVOByx7SP02QKSHNRDdbxYHOWdbcHBoEpGg9zi2oRSP/hSslEBlsJMcPHRn
         RlnjTcIYvy4ntpr+4DOnE6iJopF6eWtPZexDSZm1PKD2iek3eOOi99DEp+ON3/CfhOr5
         3kbLeAuSBzTJyOIhzwAisSf3ehRgKNyBm0UZa+u2IIBWeqEc18GG2Jx8CXVdF5bJOavR
         aUMFk/k+Go12ca43SHOrD2kz0GdJVHiwTBeEqQjSzlCSxEgIqtXp6NhIygNZoBzLNYWq
         DMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906952; x=1788511752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ic1yrNDonznjqguqtqXp54bWq7NGxRiJhvS56iX+0A=;
        b=rodpu/25w35sPVttK8H0QOtchxrDf0w5Eju1c2n3J3k5UoYMr6TklHLivtnpVaaaDj
         Ft8Sjwl8IP0UawRYY214KrQ42IyvB8zzDmCNsSuK6V2gsY+xdD/gqNWvwcviV6ILNB0G
         pSkA6kHGE8eQsQgiVOzk8OdYk223JjDty3KMBxa7xNPkNw5YiNv2gAFcGo2ivx91ryo1
         jM9qxey3TS9ef8Fd1NjZB6Dx1hCrG6czCWvG1jKO8O0VooaVb9XOKi/rrZ1dImW4yJlH
         rSNpc4rOnhka9gAgxzA92fW2uFkSoEqlQPLk1PB5bK+NhE/OyUTHNPGn9iKqMWhBQJYp
         bzSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVXmnYhKNb3tLzI8jRbE97M77mYVwNM59kZsmyiOk6PLyQ7Rf2nRF5qalaW7ZCmy1fPyBxeCPJszN1pvo=@vger.kernel.org
X-Gm-Message-State: AFuF++le6tRIvcNogvKDGilvuxAYMXtks1lnsLxqf+3udBzQFjN20As8
	Zr8ragA6xmk1w27PtZYJ9PGT13fgS66yAWY7lMbAyP0zKLSad6EMxuJn
X-Gm-Gg: AR+sD12iqOSh6acNKWKw6tsk8d4LkYcYAEY4X+GoCiB+aRsqXZEImf1jD2zPrudc73m
	K2dAH5Y15ZeF5pJP70/ZUFeDN/TnAIg+88pt6yF/CHfvruWUNm9Wm82L2Z6q7zxStu6OT9fbtv9
	6zNR/ndLZfyWcH3gIjwHhpXnsHGvbsWr00ELcIBrfktV0TV02s7DYQBV+1NdYKXCrsmISl0SUsC
	CS5m339Kr7CN1/80byeIf1J7Ip4PqVyAT31RRaoP5cTk3f8UMgTwZ78eUj1HQG1xYkTolttjGwb
	gZKs77XjYMmf/ZaoS1Jz6EKyfNAOziUcPerbB8XSmPssA1Xn0eUdBaUm3qm5f6edW5aansldNa7
	uhN8hZfKxAmvd/udSABFWQAvbdqIW/lVGbVJCgoOK2PXzqh4cB1fctQQk60AIfA+8xRcviLt0s9
	tW2rXIN3NC2xdENIqTU4ovC5Pflm+V5Asa+aGYNcg6THCQ0uErQ1xoJHgs0js=
X-Received: by 2002:a05:6a20:6a1f:b0:3d1:4225:9bb with SMTP id adf61e73a8af0-3d265a41ee0mr9048295637.2.1787906952498;
        Fri, 28 Aug 2026 01:49:12 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm3899310eec.8.2026.08.28.01.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:12 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/9] crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
Date: Fri, 28 Aug 2026 16:48:48 +0800
Message-ID: <20260828084900.1496839-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If writing to the configfs group happens concurrently during
kexec_file_load syscall, it may lead to the following issues,
  - buffer overflow if dm-crypt keys are added after allocation
  - stale total_keys if dm-crypt keys are removed during iteration
  - keys_header will not be freed if config/crash_dm_crypt_key/reuse is
    set true

So hold config_keys_subsys.su_mutex for the entire sequence during the
kexec_file_load syscall to ensure a consistent snapshot. To have serial
access to config/crash_dm_crypt_key/reuse, use the kexec lock as we also
need to access kexec_crash_image serially.

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 4335b6cb1fc4..026c7de4ad85 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -7,6 +7,7 @@
 #include <linux/configfs.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
+#include "kexec_internal.h"
 
 #define KEY_NUM_MAX 128	/* maximum dm crypt keys */
 #define KEY_SIZE_MAX 256	/* maximum dm crypt key size */
@@ -296,14 +297,20 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 	bool val;
 	int r;
 
+	if (!kexec_trylock()) {
+		r = -EBUSY;
+		goto unlock;
+	}
+
+	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		kexec_dprintk(
 			"dm-crypt keys haven't be saved to crash-reserved memory\n");
-		return -EINVAL;
+		goto unlock;
 	}
 
 	if (kstrtobool(page, &val) || !val)
-		return -EINVAL;
+		goto unlock;
 
 	if (is_dm_key_reused) {
 		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
@@ -311,12 +318,15 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 		r = get_keys_from_kdump_reserved_memory();
 		if (r) {
 			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
-			return r;
+			goto unlock;
 		}
 		is_dm_key_reused = true;
 	}
 
-	return count;
+	r = count;
+unlock:
+	kexec_unlock();
+	return r;
 }
 
 CONFIGFS_ATTR(config_keys_, reuse);
@@ -421,6 +431,8 @@ static int build_keys_header(void)
 	return 0;
 }
 
+static bool mutex_acquired;
+
 int crash_load_dm_crypt_keys(struct kimage *image)
 {
 	struct kexec_buf kbuf = {
@@ -432,6 +444,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	};
 	int r = 0;
 
+	mutex_lock(&config_keys_subsys.su_mutex);
+	mutex_acquired = true;
+
 	if (key_count <= 0) {
 		kexec_dprintk("No dm-crypt keys\n");
 		return 0;
@@ -481,6 +496,11 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 		kfree_sensitive(keys_header);
 		keys_header = NULL;
 	}
+
+	if (mutex_acquired) {
+		mutex_unlock(&config_keys_subsys.su_mutex);
+		mutex_acquired = false;
+	}
 }
 
 static int __init configfs_dmcrypt_keys_init(void)
-- 
2.55.0

