Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203815;
	b=Q3ZQGDZ45JLSYHLUqyErQMbDq58gm4fSn4LzOspl/NmYGRW9vqg17DkGvq77trgqU9zC
	 6S4V8dE3Hs29fhngmqBTyJPe2mceSh2auNSE5mzGhu18eSE+RqCAO7uZJ+qWB6XYGD+L9
	 tNGq2C2+E9RPVTldPgpPtPjyWqQw+7NxIEss/L6Q+f5rJInSCZYo2lki/BJxKHNM/PS4T
	 ukmejoCdlqroHfqNtP91PVgL1P/z2jotihuu4VG/J08LaQJQp0nxcbM/1ETP3iqRoxDpk
	 Ys61Ly5/TLMp7UcvYUxUdZuf2DmiFQh7CW6q29tMU7Z/cj2AZNL4qeTEP+ZfUUqt1sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203815;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=k5ITN//LPFqp0ZHi5BiMZ3TdldQm7dw4fN0sp0t3nnI=;
	b=xOgWbgEBgwH1ucboEDKI4o9HoG8UrBzP8Xe0BqC7fCccQLQ3ZKSXsDnh4iNGk0Sr/V35
	 v4zs4mUQkecngizw90S9cgChdSw3ykmXuPrACip6oy0LzC+eHRNhmOe+lYkSA6Ed4lQfO
	 HOmJyhfxggoI9sqNG7Ltt/kWez0FmZN93OCgisKpY/UXzuHzNsh14NFvdCxRiv1w3eKgI
	 Yy84ifI7Perbp7O3M+KH+z6fJK/phIRmfeO6Pl/N9bHdcO3MlmkBuuiDI7Rdzz7exwj2s
	 Y2V8y75RLthVj1p1H48zo5B8l+WVl+rh+hzia0+8ZrAzHN4jFmhAs0x/2h5SDNBMjTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C97qM9km;
	arc=none smtp.remote-ip=91.218.175.186
Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE7606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACE7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C97qM9km
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U+AEFg6hgKrg63ESuSGaXNv0t15O3WVBZkSpGKs849o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203812; v=1; x=1794808612;
 b=C97qM9kmQE8c+t/QZul7iNOfH86vCkou63QmKsKHX/NhLs6XsW18eF48v49uhx69LsgUWtIa
 QJcVuJ9soM4FHNig+xHiya5//R0YU0Ad8fxPVktcJWlxs+tQh2efTZcI88qjirgPK85kqQKVsYf
 wKFEvdkhv6FlbuQ8g3khKvTQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 30f76fd69c558bf5;
	Mon, 09 Nov 2026 05:56:52 +0000
X-Mizu-Trace-ID: 30f76fd69c558bf5
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
Subject: [PATCH v5 11/19] mm, swap: add CONFIG_XSWAP_DEFAULT_MAX
Date: Mon,  9 Nov 2026 13:54:47 +0800
Message-ID: <20261109055455.536925-12-baoquan.he@linux.dev>
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

Add a build-time default for the size of a new xswap device. The value
can be a percentage of RAM, a size in bytes, or "max". "max" means the
largest size the device can address. xswap.max= on the command line
overrides this default.

The build-time default is clamped to the device limit. An explicit
xswap.max= that is too large is refused.

If the build-time default cannot be parsed, or is a byte size below one
cluster, use 200% instead. A percentage default can still be below one
cluster after RAM is known. In that case, device creation fails.

Document the sysfs ABI, the stable id, and the synthetic /proc/swaps
name.  Also document that zswap must stay enabled while xswap devices
exist.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 .../ABI/testing/sysfs-kernel-mm-xswap         | 38 +++++++++++++++++++
 .../admin-guide/kernel-parameters.txt         |  3 +-
 Documentation/admin-guide/mm/zswap.rst        |  9 +++++
 MAINTAINERS                                   |  1 +
 mm/Kconfig                                    | 11 ++++++
 mm/swapfile.c                                 | 22 +++++++++--
 6 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-mm-xswap

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-xswap b/Documentation/ABI/testing/sysfs-kernel-mm-xswap
new file mode 100644
index 000000000000..38eead0b1b31
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-xswap
@@ -0,0 +1,38 @@
+What:		/sys/kernel/mm/xswap/
+Date:		October 2026
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	File-less swap devices backed by zswap.
+
+		An xswap device has no backing file.  Its slots are backed
+		by the zswap pool, and the device size is set at boot with
+		xswap.max= or CONFIG_XSWAP_DEFAULT_MAX.  The size is fixed
+		for the lifetime of the device.
+
+		The name shown in /proc/swaps, xswap<id>, is synthetic and
+		is not a path.  It cannot be passed to swapoff(2), so
+		swapoff -a reports an error for these entries.  Use the
+		destroy attribute instead.
+
+		An xswap device requires zswap.  Disabling zswap at runtime
+		(enabled=0, or max_pool_percent=0) while xswap devices
+		exist leaves them without backing: existing entries can
+		still be read, but new pages cannot be stored.  Destroy the
+		xswap devices before disabling zswap.
+
+What:		/sys/kernel/mm/xswap/create
+Date:		October 2026
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Create an xswap device.
+
+		Write an optional priority (0..32767), or write nothing for
+		the default priority.  The write fails if zswap is disabled
+		or if the configured size is smaller than one cluster.
+
+What:		/sys/kernel/mm/xswap/destroy
+Date:		October 2026
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Destroy an xswap device.
+
+		Write the device's stable id.  The id is the number after
+		"xswap" in /proc/swaps, for example 1 for xswap1.  It is
+		not a swap type and is never reused.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e92a1b9062a6..6e2d2747a26f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8743,5 +8743,6 @@ Kernel parameters
 			Maximum size of a new xswap device. The value is a
 			size in bytes with an optional KMGTPE suffix, a
 			percentage of RAM, or "max" for the largest size
-			the device can address.
+			the device can address. The default is set by
+			CONFIG_XSWAP_DEFAULT_MAX.
 			Format: <size>[KMGTPE] | <percent>% | max
diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index 2464425c783d..886b50ca90b1 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -136,3 +136,12 @@ selected.
 A debugfs interface is provided for various statistic about pool size, number
 of pages stored, same-value filled pages and various counters for the reasons
 pages are rejected.
+
+xswap devices
+-------------
+
+An xswap device is a file-less swap device backed by zswap.  While such a
+device exists, do not disable zswap at runtime (``enabled=0``) or set
+``max_pool_percent`` to 0.  The device would have no backing: pages already
+in zswap can still be read, but new pages cannot be stored.  Destroy the
+xswap devices first.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf24eee20bb..66078761b746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17910,6 +17910,7 @@ R:	Youngjun Park <youngjun.park@lge.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-mm-swap
+F:	Documentation/ABI/testing/sysfs-kernel-mm-xswap
 F:	Documentation/mm/swap-table.rst
 F:	include/linux/swap.h
 F:	include/linux/swap_ops.h
diff --git a/mm/Kconfig b/mm/Kconfig
index 9bdb905a66ef..902e3b1a6e35 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -131,6 +131,17 @@ config XSWAP
 	  array is backed by a sparse vmalloc area that is mapped lazily
 	  in chunks, avoiding static pre-allocation overhead.
 
+config XSWAP_DEFAULT_MAX
+	string "Default maximum size of a new xswap device"
+	depends on XSWAP
+	default "200%"
+	help
+	  The maximum size of a newly created xswap device. It accepts a
+	  percentage of RAM (for example "200%"), a size (for example "2T"),
+	  or "max" for the largest size the device can address.
+
+	  xswap.max= on the kernel command line overrides this value.
+
 config ZSMALLOC
 	tristate
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 498fbf6df1cd..cb53f9415de8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -161,9 +161,12 @@ static bool xswap_size_max;
 static bool xswap_size_set;	/* xswap.max= was given */
 
 /*
- * Parse "200%", "2T" or "max".  @str is not modified.
+ * Parse "200%", "2T" or "max". @str is not modified. @cmdline tells an
+ * explicit xswap.max= from the build-time default, which is clamped
+ * instead of refused when it is too large.
  */
-static int __init xswap_parse_size(const char *str, const char *what)
+static int __init xswap_parse_size(const char *str, const char *what,
+				   bool cmdline)
 {
 	const char *pct;
 	char buf[16];
@@ -192,12 +195,16 @@ static int __init xswap_parse_size(const char *str, const char *what)
 		bytes = memparse(str, &end);
 		if (*end || bytes < PAGE_SIZE)
 			goto bad;
+		/* A default below one cluster would fail every create. */
+		if (!cmdline && bytes < (unsigned long)SWAPFILE_CLUSTER * PAGE_SIZE)
+			goto bad;
 		xswap_size_bytes = bytes;
 		xswap_size_pct = 0;
 		xswap_size_max = false;
 	}
 
-	xswap_size_set = true;
+	if (cmdline)
+		xswap_size_set = true;
 	return 0;
 bad:
 	pr_err("xswap: bad %s=%s\n", what, str);
@@ -206,7 +213,7 @@ static int __init xswap_parse_size(const char *str, const char *what)
 
 static int __init xswap_max_setup(char *str)
 {
-	xswap_parse_size(str, "xswap.max");
+	xswap_parse_size(str, "xswap.max", true);
 	return 1;
 }
 __setup("xswap.max=", xswap_max_setup);
@@ -4830,6 +4837,13 @@ static int __init swapfile_init(void)
 {
 	swapfile_maximum_size = arch_max_swapfile_size();
 
+#ifdef CONFIG_XSWAP
+	/* xswap.max= on the command line overrides the build-time default. */
+	if (!xswap_size_set)
+		xswap_parse_size(CONFIG_XSWAP_DEFAULT_MAX,
+				 "CONFIG_XSWAP_DEFAULT_MAX", false);
+#endif
+
 	/*
 	 * Once a cluster is freed, it's swap table content is read
 	 * only, and all swap cache readers (swap_cache_*) verifies
-- 
2.54.0

