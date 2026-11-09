Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203824;
	b=KSWUi4awWPpExqxcCP3v9JaKfFUE4wCfq5T9M+5hY2UY+1Su4e0shv+zBZxCx7xhBjL0
	 kRF9cZDXKZvmkBiAlf031UTtMfsvuFMHuTRSL7zld+4yGIXODHWh3LfjDUfoYRuN0FKLD
	 SlP+mUs/f/G/yr6ntw8657TFep85KWrVq66OfQfBDfAz8XHqCTBO67RgvSI0JTZXQd6vB
	 LwsXpPRyRdbTUeSMVWqIfO4WzXsqapigwVOLNLgfOPE8wKWc3t3c/GUSSJMjXUgfSGe5h
	 Pi+9H5x/2P7PMUab5QB+KEeerltJ/417xbCdtAV3GW2KKRE3+13I7Fgkyk3D8gfJSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203824;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=kSmmp9v6vncnhzFzbNk1b+BeLQB+Xppvc2OdJ7fK/aQ=;
	b=ehTUEAbdIY5qrxKJO5+jsazpqWlBjTsR+NbYKkNnUGCngngV/hsjMLGdXqBXtkbRZ8VH
	 GTP0yDYdNWCrJx4Jg9kT8D5jsi21AN8dhLqIkNEvLajqPE8C6GJ+KiebiVsGujhe9eUOJ
	 0ujswSW2TJlVkMp/or5FFV2GL9wRq5Vgyk0fuWhtti9GQFymyp8QHV3J+0vPzm1XQGKWl
	 cUBnjMoArDJFLuXIzAu33r9g8GyxQXUtnLeqHAnhjqISMCNZgD7RvXqHOpnK+B0n8xG1K
	 BQ4U9LNYto5Lud9Cfg1Mt4jJG8f4G8bh7JfdTjDio0YF+CcfQxFTmSOuhobkfc8n5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eOgSZahh;
	arc=none smtp.remote-ip=95.215.58.247
Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eOgSZahh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6e/jGgT3foSA9psEQl1VWtIINfD0s81p21YzwZ3MAHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203821; v=1; x=1794808621;
 b=eOgSZahhL8qRLlBdFP9/7i1YbvHANJI1JaTDTb5qp3U+QuHNpithOvoRiKxdtFjPok5Xru1u
 A+zMrlmHHZ16Qzx9JhML3P7rFf8/SGVfOt9OaQQlVHQyJQTEoq1ZroO1S8uNTvJiKv8d2LsA6/5
 CFunnw3glJaq0st58++AgS10=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d708437a31d01fe9;
	Mon, 09 Nov 2026 05:57:00 +0000
X-Mizu-Trace-ID: d708437a31d01fe9
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 12/19] mm, swap: let swapoff destroy xswap devices by name
Date: Mon,  9 Nov 2026 13:54:48 +0800
Message-ID: <20261109055455.536925-13-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

An xswap device has no backing file, so /proc/swaps shows a synthetic
name, xswap<id>, that file_open_name() cannot open. Teach swapoff to
fall back to xswap_destroy() when the name is exactly "xswap<digits>"
and the lookup failed with -ENOENT.

A real file or directory keeps precedence; other open errors are
returned unchanged, so a file that exists but cannot be opened is not
mistaken for an xswap device. The ABI documentation is updated, and
the destroy attribute remains the unambiguous teardown interface.

A well-formed name for an id that does not exist asks xswap_destroy()
for a device that is not there. It returns -ENODEV; map that to
-ENOENT so swapoff reports a missing name like it does for a missing
file.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 .../ABI/testing/sysfs-kernel-mm-xswap         | 11 +++-
 mm/swapfile.c                                 | 56 ++++++++++++++++++-
 2 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-xswap b/Documentation/ABI/testing/sysfs-kernel-mm-xswap
index 38eead0b1b31..f7e7f3e4d216 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-xswap
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-xswap
@@ -9,9 +9,14 @@ Description:	File-less swap devices backed by zswap.
 		for the lifetime of the device.
 
 		The name shown in /proc/swaps, xswap<id>, is synthetic and
-		is not a path.  It cannot be passed to swapoff(2), so
-		swapoff -a reports an error for these entries.  Use the
-		destroy attribute instead.
+		is not a path. swapoff(2) accepts it, so both "swapoff
+		xswap<id>" and swapoff -a tear the device down. A real
+		file or directory with that name takes precedence: if it
+		opens, it is looked up as a swap file and the synthetic
+		device is not used. Only a name that cannot be opened
+		because it does not exist, including a dangling symlink,
+		is treated as an xswap device. Use the destroy attribute
+		for an unambiguous teardown.
 
 		An xswap device requires zswap.  Disabling zswap at runtime
 		(enabled=0, or max_pool_percent=0) while xswap devices
diff --git a/mm/swapfile.c b/mm/swapfile.c
index cb53f9415de8..7b1d16226b7b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -34,6 +34,7 @@
 #include <linux/backing-dev.h>
 #include <linux/mutex.h>
 #include <linux/capability.h>
+#include <linux/ctype.h>
 #include <linux/syscalls.h>
 #include <linux/memcontrol.h>
 #include <linux/poll.h>
@@ -88,6 +89,7 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
 
 static int xswap_create(int prio);
 static int xswap_destroy(u64 id);
+static int xswap_destroy_by_name(const char *name);
 
 /* Stable device id, assigned at create and never reused. */
 static atomic64_t xswap_id_counter = ATOMIC64_INIT(0);
@@ -275,6 +277,11 @@ static void xswap_sysfs_init(void)
 static inline void xswap_sysfs_init(void)
 {
 }
+
+static inline int xswap_destroy_by_name(const char *name)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
@@ -3513,8 +3520,21 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	CLASS(filename, pathname)(specialfile);
 	victim = file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
-	if (IS_ERR(victim))
-		return PTR_ERR(victim);
+	if (IS_ERR(victim)) {
+		/*
+		 * An xswap device has no file, so /proc/swaps shows a name
+		 * that cannot be opened. Accept it here so swapoff -a works.
+		 * Only a missing name is taken for a device; a real file or
+		 * directory that failed for another reason must not match.
+		 */
+		if (PTR_ERR(victim) != -ENOENT)
+			return PTR_ERR(victim);
+
+		err = xswap_destroy_by_name(pathname->name);
+		if (err == -ENOENT)
+			return PTR_ERR(victim);
+		return err;
+	}
 
 	mapping = victim->f_mapping;
 	spin_lock(&swap_lock);
@@ -4504,6 +4524,38 @@ static int xswap_destroy(u64 id)
 
 	return __swapoff(p);
 }
+
+static int xswap_destroy_by_name(const char *name)
+{
+	const char *p;
+	char buf[24];
+	u64 id;
+	int err;
+
+	/* Strictly "xswap<digits>": no sign, no trailing newline. */
+	if (strncmp(name, "xswap", 5))
+		return -ENOENT;
+
+	p = name + 5;
+	if (!isdigit((unsigned char)*p))
+		return -ENOENT;
+	while (isdigit((unsigned char)*p))
+		p++;
+	if (*p)
+		return -ENOENT;
+
+	if (strscpy(buf, name + 5, sizeof(buf)) < 0)
+		return -ENOENT;
+
+	err = kstrtou64(buf, 10, &id);
+	if (err)
+		return -ENOENT;
+
+	err = xswap_destroy(id);
+	if (err == -ENODEV)
+		return -ENOENT;
+	return err;
+}
 #endif /* CONFIG_XSWAP */
 
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
-- 
2.54.0

