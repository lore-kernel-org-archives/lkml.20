Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270A27FB1C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914258; cv=none; b=I/0sBQkaOTjhX4A7msAHRvDylc3xjiwxz1gVLbi9BsK/bLZDamGE33dWQDJT2jiBkT6SxdwrCw8l6io0UI0JApwFG898evxk83ak1y+cUGoo+JPeafTLFG2Gs/c1tCRXJqt+T53rfUk3xY77dhBBeCYTxzpvUy6E6DTLy/QJllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914258; c=relaxed/simple;
	bh=3PEuNiB5MDESVtB2h0N+0V9HHFN4v+XIjMbFe/5RYl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvZw6bkYPwz2OLnjUrbrPwvIIhSLkCEyFsvx107sWBwNiSwdDvhWgkw8pJmRfPsRiHigPYhaFpMSeOWLwnJMA5bm/ED7INZRCJeNxhegesl9dKhJk7jj1VB9eGa+8YGzMC33+ymqEvUeX0Hi+GedMQ4+Nms6z58vFwRfpQup2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKCbAlyT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKCbAlyT"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so516416b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914256; x=1789519056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TFcwUhsFdNQuYy+bl3DAKp/OsoqgqJhUqWoiXjUvvE=;
        b=KKCbAlyTMjPl3ZYg58ViUX996tK07vGlBbhC9R1IG0oo4XH6AjUF1KeVy87h5AeHcd
         PoF+1u394nfnyfMB8N+WuCRI7b4GVEeR9ENZnJrD57oGWwq2zqQwqEmEZxmynjqfqbLV
         5WBrqC8rzZMjwdBIbpyZIl/KlxSL6BZixbkkTzSetBXHfanyqkQl6p2cg4X3Hu4AEGiX
         /DbgAJ9VatYU5J0Fmt0oWRqHAQIkhNAjzpBKwJfaa3J3U1L2kEfwBBfkKU1QpZkb4AgQ
         0ZF3KfQcuHZRLLjewvBZpY/FxAWCYKFdRryidDzBkMXJcmxqQHesxOknlfjS9jcPJ52l
         uNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914256; x=1789519056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TFcwUhsFdNQuYy+bl3DAKp/OsoqgqJhUqWoiXjUvvE=;
        b=FtjQIhFraGbgwbDu3KKurO5olNZPQs/TRBDS/Sdf1omzWumESsRflSW2Se8fk/J9Vq
         InQBsqjZB0QJV6aamtXXVm31lk95II6WSw4TlGEE+yPUg1xSiYAE1JROhF9Ww6+RnPXL
         L+eDA3N+Hn9sr5MGcYoFf8MzmDMS2MNXEvNJvOIcEwDOhKt5O5/3nW2aixs++pnxnhnt
         RzcKIn3ZNsodzGeT3eRijdi0c90/slE97yNDcNDhKb5HyUekgi3Ahuu2c4Z35dsIuz2M
         En42S/L6a9Y7nk+3zAENG3vqG/0wSe1ooiIZNv0XkMpghSDK8Ds/kc6Jo3Jjs5wHJNvH
         tzDg==
X-Forwarded-Encrypted: i=1; AKwUvByGB4xz4CowwJ0nj3hC7eEywY+JATkVW1xm3MmrldOGJ8MX/eGuvyg6K7wAWGWwU2BYT3bAtHi4GDKOB1U=@vger.kernel.org
X-Gm-Message-State: AFuF++k0vY0BURLoKlsOXdzqVu/yAwSaVGhStFY3sLlBkT2B44piizoS
	63YRY5K5PSTM11LPHtZY6SJqQ/FgF/EDM/mILTk9sjZGMeEvlc+1WMyM
X-Gm-Gg: AYBFou24pcA5IcnWhUt3ftbmqJAhdKcxp6v7E1yy7A9+wH/YAvCP5hasHVBQDZnloxi
	4mW/C/cBT63HlDFYe2oWUOhX8ZAXAFCCnUVhxq0GxGCya26hlW7FhFqwlkJ47RrVidjThybt+eK
	1aUabLOp5G62P4H/2mUrsvZSl0PdGzRPC+3rV5XpC/VNxWoYsm230fuIucC/x3MjvcF83evnC0H
	f0MI+kYzw6CHMrv9726eaygINODlWEhlWmHYQJpvdDcGB1SctF+ccYudjGnykNhn1p9o79Drxdm
	egSECURE45YQnZpITkn0D2lf8MZ/SztV0W36r4GM1yyKsCM6M6qDoAPARW0ZvPst4VYxjQO+5Rh
	zdBgwGC0VxNkd8gAedBHpFCqksA3BdUtwp4ojl3JbfC4JpunvshbhlaSIP58Evtx1WPIMP10jph
	br9vas6TaTTS6xbqW2W36cXSKZ4c/Jk/PRu5CaRYFhSlapdojR30AHnzPqVYPxSg==
X-Received: by 2002:a05:6a20:5491:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3dabb0a70a9mr3781304637.10.1788914255795;
        Tue, 08 Sep 2026 17:37:35 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554ad478sm6231339a12.31.2026.09.08.17.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:34 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 8/9] crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Date: Wed,  9 Sep 2026 08:36:50 +0800
Message-ID: <20260909003657.1570544-9-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
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
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
 kernel/crash_dump_dm_crypt.c              | 12 ++++++++----
 2 files changed, 18 insertions(+), 10 deletions(-)

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
index bc70fbb79e0f..666c1f0c9e3b 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -324,7 +324,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 
 	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
-		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory or crash hotplug supported\n");
 		goto unlock;
 	}
 
@@ -522,14 +522,18 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 void crash_dm_crypt_cleanup(struct kimage *image)
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
 		keys_header = NULL;
 	}
+#ifdef CONFIG_CRASH_HOTPLUG
+	if (image->hotplug_support)
+		image->dm_crypt_keys_addr = 0;
+#endif
 }
 
 static int __init configfs_dmcrypt_keys_init(void)
-- 
2.55.0

