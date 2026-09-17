Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA3F439F7C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634193; cv=none; b=ejdH/0AvbVKiRAmiL8jF/pqhvhWbEpxoErd8DxtTqnG+TceB0IVNpPco5g/+BSBS7qmgc5NqxV88BWty5ynumIDXG7aVVfw1ijpPrEwV31Nirj3gmzuzS5vsb1568Fs9vV/FuL10BxiplSx6tdiOhBZL+nOZIqChUL+vvpAuqdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634193; c=relaxed/simple;
	bh=z4GA6U2YHgkODGVI6X0tv9KlPQw3EoQLOuSi3vpR6wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXSsVc3fKV1BmOHMXjA6le2VpQ0yoODRA2B3wyiJVoB9htPfTcyMZwsd59nE+HsdqPa7ztPLqHNkxncEXE1MDe0f1VunVzOfWxDnlbr8OZjmB7HR7cGouQjw62IkzPjRm4aOvtwXE9+gk9Rbo1/TwcqimUdzUeGbUyLQiwUJqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZsStLhyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZsStLhyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706E31F000FF;
	Thu, 17 Sep 2026 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789634179;
	bh=6tt8ooUC4qwD81am6RpayzVZyABrT9XuF5VVEzzFin8=;
	h=From:To:Cc:Subject:Date;
	b=ZsStLhyFU+R08q4g7z7KdDHsIwmVtW9k7dVyNQ4f7AbCLaEUyf+KybejrK2NfYZ14
	 L/D8lxiIUPvv8uhJByC72d16GmOKKhJ3SMwL9NachmZ/NkCgFN8YblwrIt07nQVqP2
	 LsCjmoVOaB5go7jDbMrTe7oa/35cSVwP88NbUsIg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cmllamas@google.com
Cc: tkjos@android.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] binder: Fix up Kconfig dependancy due to removal of .c code
Date: Thu, 17 Sep 2026 09:34:20 +0100
Message-ID: <2026091719-irregular-corral-5d59@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=z4GA6U2YHgkODGVI6X0tv9KlPQw3EoQLOuSi3vpR6wk=; b=owGbwMvMwCRo6H6F97bub03G02pJDFmrl3HzWppurHpScVNiplDDdbnXXj3nfoQm5Pbx/HWZy rv94fbIjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjI5VUMc4WVN5WbWPhqXbhv GhMqclZG5/WHKIZ5+i2P2zbJnr/W5ijIzxqzUHbnWf6tAA==
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
v2: Fix up "_RUST_RUST" problem in Kconfig option

 drivers/android/Kconfig                                      | 4 ++--
 drivers/android/Makefile                                     | 2 +-
 drivers/android/binder/Makefile                              | 2 +-
 tools/testing/selftests/filesystems/binderfs/binderfs_test.c | 2 +-
 tools/testing/selftests/filesystems/binderfs/config          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

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

