Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA13F23BE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906979; cv=none; b=IVkILuUoxjOOcM7YBJRrun6Hp5oRqjIUX2jbJo5LwKoaJJegwz9oMP6p4sWqZLDqILHEQGhsDeASFAOghYSqXWdLtVt6xArxhMT9Ge1v/3ahoA2SdjffLzOEuyZlBeb2oH49V4I6MZzCP9+F7EhvaDigIc3839ZwDq7nvaUjpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906979; c=relaxed/simple;
	bh=DXMWtmcBCd+/Lp87cx6/FN8kfAzoCwiY8pycos+b2I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7oX9TdRM12KHMz3nHSPjiTWgCpFzmcjNU74vlv8zBqv90Vp5TKL6c2D7iy7hKLMuISeBxVawbIVhJY0m7nxO3UF12IahLRMTSQHVvgTx94odYhL80oRt+k4csgs19i2IoXBwrm5V8QNINGZoFT7B/2AySk9bfVx1lfMWLuW7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzyID6JV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzyID6JV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so7366565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906975; x=1788511775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98FM7OwEdWtbjVwbuDejaA8Ps6Cp5ON7omxkAeCAgdk=;
        b=dzyID6JVc596ZoJTPAZ7MiuMcLWR87xzqrJ6crVG2ZV7QdBaR8WIGh9QzrJGRHDTKV
         yuFUWq6djRt6m8+Ix878xT3IimNBiOeySdFGgv0SlOBCIajx49l8rj03Ax/rra8Kyx2D
         xLeezeBf0Tp5J11WnjuTary1AiTTSfMBvZK/k6gk7DctwRhTGpHXoj+3mA3HTEREz+qx
         HyVOO/da+H7qmS8QGnckk73RS7P3FJ8E+BvjwQX/pN38TAypSGasf60Yc5Dm/CcnkVz7
         /dNCydBXBWzpWqlDVPQKHrkSBCUkl0dLjGCdz9zcqNsDT3D3svkCXhma4EHMoXw5wZuA
         ejhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906975; x=1788511775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98FM7OwEdWtbjVwbuDejaA8Ps6Cp5ON7omxkAeCAgdk=;
        b=r2krsisO+UJVpm5noKWika6W7BHGiUsh9l792DzUOfo0EafLgLNdlbAMh7ilJGPjEa
         BPsWgXQj9p8XfNXw9bkif7BR0B+o6NGU1ogfL8rIsSWOU3BIGYABlWPY6tplU0oc3/t8
         6Oyg1wjmNwxZpDAD2Ri7U0MwJjgpx1V0ufxX/a0l5ZYH9SoRRg9KUErpP2uwkJbemht5
         /VNLMJt/tzHeUd/aG3Q6UHIUDvX/KQ+b0IV03TkS2uirFNjqvM6nSsgQBhwSISJnK6qW
         RfEvFx51MTK0aWWktg9/ZUhIDtO7ErCU0RepT89OWVTO/DBunaKHjpViNDzEK9gmWII3
         t7AA==
X-Forwarded-Encrypted: i=1; AHgh+Rps51EBDJUjr9qvqJsSkLUrdVIcnAfmuveStqjrZpcPvA1O7ZMuB/GupxxC0fSy0evFeoCZU+usvMXDZTY=@vger.kernel.org
X-Gm-Message-State: AFuF++mpeG4/8KyYeBjJFc7bjiv4ZjZpkddZablLK7V52W2iV3eS07NP
	LBXkg6clxVw+PyGJDLqdgJ0RM56Oia9cSqLc4JY4N1KnlcM83xYFVEI4
X-Gm-Gg: AR+sD13iETKRyW756iRXUW0JaZAF00c7qHuMRdhYiff+41jRozrRIbLY+2OU7TaRCH/
	cikpcfcJDRu4uvhuF5c/kf+vrGo03LAaFxMQF24pZNaAzOOivakPf9AK7Q84EIFK6BV3WSqJuY5
	08CAvEYe/W3rHQTO+Gc2gIojSQ+/haZ3FG4vwpDuU2vKRxnHg0eNWIm4eimTMgjt38ZOy9QWFXX
	eF36xdJQHEjup5qb13a7cYsX+cvnGT7qIWlBG+6U2bJeaK9Ke2uzieSRor9Oqxll8NuxDxBT9au
	jhBIVbx7AZGFeN5X92+MFnlkqxrZNYwiEkEmob9s9MnJyhQrxqZGDfTHLH6FD0AT94HI95cToZE
	d3QmyG7IQL+dwZH1PdKj5AqoLD4egEmhpOP/7escLOaiV2lCx1lggeqrAk7MFn5jD8dkQLhAP+b
	zaDnCnw+lkZuFwi0YDuzsxUhQVH4Cy97MwaABQp5PlWa3ZOR5JJioNYgM2NXI=
X-Received: by 2002:a17:903:42cc:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d74e1386bcmr66616585ad.14.1787906974620;
        Fri, 28 Aug 2026 01:49:34 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm3763938eec.26.2026.08.28.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:34 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 8/9] crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Date: Fri, 28 Aug 2026 16:48:54 +0800
Message-ID: <20260828084900.1496839-9-coiby.xu@gmail.com>
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

If crash hotplug is supported, dm-crypt keys saved to reserved memory
will be taken care of automatically. Thus it doesn't make sense to use
configfs/crash_dm_crypt_key/reuse. Not reserving
image->dm_crypt_keys_addr makes it implicitly to disallow using this
API. Currently x86_64 and ppc64le have implemented crash hotplug
feature.

Also update the doc accordingly. Note two doc issues are fixed as well.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
 kernel/crash_dump_dm_crypt.c              | 13 +++++++++----
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..0bf2eb100a05 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
     # Add key #1's description
-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
 
     # how many keys do we have now?
     cat /sys/kernel/config/crash_dm_crypt_keys/count
@@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
-    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
-    # memory
-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
-
 2. Load the dump-capture kernel
 
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+For CPU/memory hot-plugging, you can reuse keys already saved to reserved
+memory before reloading the kdump image,
+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
+
+Note if crash hotplug is supported, this API is totally unnecessary thus will
+be disabled automatically.
+
 Contact
 =======
 
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index b7629174e4db..3aaa0f9c3117 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -324,7 +324,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 
 	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
-		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory or crash hotplug supported\n");
 		goto unlock;
 	}
 
@@ -519,9 +519,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 {
 	/*
-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
-	 * keys_header from being cleaned up during unloading when
-	 * is_dm_key_reused=true
+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
+	 * image will be reloaded. Prevent keys_header from being cleaned up during
+	 * unloading when is_dm_key_reused=true
 	 */
 	if (!is_dm_key_reused) {
 		kfree_sensitive(keys_header);
@@ -532,6 +532,11 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 		mutex_unlock(&config_keys_subsys.su_mutex);
 		mutex_acquired = false;
 	}
+
+#ifdef CONFIG_CRASH_HOTPLUG
+	if (image->hotplug_support)
+		image->dm_crypt_keys_addr = 0;
+#endif
 }
 
 static int __init configfs_dmcrypt_keys_init(void)
-- 
2.55.0

