Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507103AEF55
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634933; cv=none; b=Qqw5U2kjQ2dJRbBUHwt+HWXnoIpk5ir/KLLdcMrH9jRF3QMQgEGtttwjIhrfjMFec6BcqZmnBRSBFfg0cTUqjeiY4CpiR3cNf7Q6XZJkMY/fj1GAp6mZuoGgZSfELk6HHOuMR4CkmoTfsKE6442UEy9b8GvUN5Z04gnzyU0B9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634933; c=relaxed/simple;
	bh=HWBIF8EBTztB0WI2iZd922EeeUszHsPcYz+vLTpOJEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0TrdVf38cm84ApqR3I5TsuXzto3Yn0zbwE14DYzh67xziYAesD8rRtFFpAkiZM+2prXMEfguTSmUif+fJVhASQR6qR5O060JGQAy2s0HEYOfzTkdeg1mYJMv8L1ia7L5Jg1vwig2EmfQOLMeqa+LVxxibYQp0MNZXlFNrELBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OZrBzSla; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OZrBzSla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932B11F00898;
	Thu, 17 Sep 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789634924;
	bh=hVSwcKr8vGVgWVYtTyvsw0cJtRhNQQoxnAZNz9+yMvM=;
	h=From:To:Cc:Subject:Date;
	b=OZrBzSla7Mv2hDOxqNKXC7p31zoyk2Zp5gH6+PrmBvMOcg+NPEYMXKwlbT2xU+9Lj
	 7u2MezdJqIvzrCsA+LUyd6Z2wmYzYVH+otTHiU+2Z62xplX9Lnuoc+QtM1cPXZNuas
	 S88OY1Q5nsyCY84wsgVxi+YYPSNUr4fY/KsWva/k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cmllamas@google.com
Cc: tkjos@android.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] binder: Fix up Kconfig dependancy due to removal of .c code
Date: Thu, 17 Sep 2026 09:46:44 +0100
Message-ID: <2026091743-pony-prewar-735b@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4346; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=HWBIF8EBTztB0WI2iZd922EeeUszHsPcYz+vLTpOJEI=; b=owGbwMvMwCRo6H6F97bub03G02pJDFmrV3y2ifc+t5fFsWGN09qOKa6Gas0nJn+cf3KKzud5/ 0/ULgzy7ohlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJ7AlmmF84pSdl29L9p9bc XKT04NDdhF7uDTsZFqz8m2T2de33EzcCJI3c+CP33+N5IAMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

When the .c binder code was removed, building the kernel if the rust
binder code was enabled, will cause the binder to not be built at all as
the option changed from .c to .rs which is probably not what the
original build wanted.

Fix this up by renaming the option back to the _RUST version.  If in the
future, that suffix wants to be dropped, we can do so and then it will
be prompted for a choice again, but for this release cycle, it should
stay as-is.

Fixes: binder: rm -f binder.c
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3: fix up tracepoint build failure
v2: v2: Fix up "_RUST_RUST" problem in Kconfig option

 drivers/android/Kconfig                                      | 4 ++--
 drivers/android/Makefile                                     | 2 +-
 drivers/android/binder/Makefile                              | 2 +-
 rust/bindings/bindings_helper.h                              | 2 +-
 tools/testing/selftests/filesystems/binderfs/binderfs_test.c | 2 +-
 tools/testing/selftests/filesystems/binderfs/config          | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index 403e5f3eab5a..c920d52c0221 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 menu "Android"
 
-config ANDROID_BINDER_IPC
+config ANDROID_BINDER_IPC_RUST
 	bool "Android Binder IPC Driver"
 	depends on MMU
 	depends on NET
@@ -17,7 +17,7 @@ config ANDROID_BINDER_IPC
 
 config ANDROID_BINDER_DEVICES
 	string "Android Binder devices"
-	depends on ANDROID_BINDER_IPC
+	depends on ANDROID_BINDER_IPC_RUST
 	default "binder,hwbinder,vndbinder"
 	help
 	  Default value for the binder.devices parameter.
diff --git a/drivers/android/Makefile b/drivers/android/Makefile
index dc19d21037af..f83d39d16f6e 100644
--- a/drivers/android/Makefile
+++ b/drivers/android/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y += -I$(src)			# needed for trace events
 
-obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder/
+obj-$(CONFIG_ANDROID_BINDER_IPC_RUST)	+= binder/
diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
index 661f5cca8918..fe474628a94e 100644
--- a/drivers/android/binder/Makefile
+++ b/drivers/android/binder/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y += -I$(src)	# needed for trace events
 
-obj-$(CONFIG_ANDROID_BINDER_IPC) += binder.o
+obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += binder.o
 binder-y := \
 	rust_binder_main.o	\
 	rust_binderfs.o		\
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4485a55cb010..4b31aa7f432f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -166,7 +166,7 @@ const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEARED = GPU_BUDDY_CLEARED;
 const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DISABLE;
 #endif
 
-#if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC)
+#if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
 #endif
diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index 7310622098ff..cd82c89f558f 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -414,7 +414,7 @@ TEST(binderfs_stress)
 
 		ret = mount(NULL, binderfs_mntpt, "binder", 0, 0);
 		ASSERT_EQ(ret, 0) {
-			TH_LOG("%s - Failed to mount binderfs, check if CONFIG_ANDROID_BINDER_IPC is enabled in the running kernel",
+			TH_LOG("%s - Failed to mount binderfs, check if CONFIG_ANDROID_BINDER_IPC_RUST is enabled in the running kernel",
 				strerror(errno));
 		}
 
diff --git a/tools/testing/selftests/filesystems/binderfs/config b/tools/testing/selftests/filesystems/binderfs/config
index e0c1958a3675..80e4221c2d82 100644
--- a/tools/testing/selftests/filesystems/binderfs/config
+++ b/tools/testing/selftests/filesystems/binderfs/config
@@ -1 +1 @@
-CONFIG_ANDROID_BINDER_IPC=y
+CONFIG_ANDROID_BINDER_IPC_RUST=y
-- 
2.55.0

