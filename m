Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A04908A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585570; cv=none; b=sKpDU7pRw5sJ2p8oYTrh7v4KqRMBZlwMBy6au7A+yPPSVNuX142e2O3uGYYrgLVpbgb9uY3Khnhmy4amt/h2/I7IxXJnQ134taZPkR8oq1XfF4dH65wKYEUSv5sYllMSScPZ1AFdmkLrV9pPNsEEuAhzM1xsABQq4SsC6xGldd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585570; c=relaxed/simple;
	bh=u/zd0myX8mv+Y8U0lDQDsMe7IrP62u/XbVzvWt8G+2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUWv4KNkfgh48MDdDyNS46TKd9brKrYA9afeRcsl75WMh7C0qRquPshGWv1Qk+6s69gvtOE6yp1SmTbqkci0WbMG7+1X5cZAjnNuRrdMboP9JjZ9BXiRrIeyael71U0GeGAMAvwAwtqOBPx2+eHQuEl2J7r1axvBAenNv5PCkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JuLjzPnt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JuLjzPnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B40A1F000FF;
	Wed, 16 Sep 2026 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789585554;
	bh=51DEZFNlawbVB9QJebnyg9pSEJ/EBgReKvMbeWbIlf0=;
	h=From:To:Cc:Subject:Date;
	b=JuLjzPnt0BEfLoBe5x9uV2Hq81pIQ5F+0XFwYd3qccTo8IOvlUzHVevKv3jOXxPMl
	 +lUSCkLOLyV3Ioj9rKPG/FbF4fTtNm9vgznCffHgYtxTRswEbt5CqgztxUYHorWTWu
	 VvyQB7de+UBBE+4dVXX+/rwlXT5CVeaYFrYrhjfA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cmllamas@google.com
Cc: tkjos@android.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] binder: Fix up Kconfig dependancy due to removal of .c code
Date: Wed, 16 Sep 2026 20:03:54 +0100
Message-ID: <2026091653-dividend-outing-857d@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3568; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=u/zd0myX8mv+Y8U0lDQDsMe7IrP62u/XbVzvWt8G+2s=; b=owGbwMvMwCRo6H6F97bub03G02pJDFmrXkh+Vzju78Jw5NOvjtNFC/iVDQ5NePfVK7nKZUvoI dX8LcVnOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAil9IZFvS/Wsu2M+HCmkOK xUu2h07cfLXWQI9hwZ6oM1uniT3ob+Jjn/S9c6lp8x6X/QA=
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
index dc19d21037af..5bc644cf5e0c 100644
--- a/drivers/android/Makefile
+++ b/drivers/android/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y += -I$(src)			# needed for trace events
 
-obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder/
+obj-$(CONFIG_ANDROID_BINDER_IPC_RUST_RUST)	+= binder/
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

