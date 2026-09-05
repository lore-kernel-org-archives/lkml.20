Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C45374178
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585470; cv=none; b=lG89LhMovdIFsT6XpzWXyXHfAhBXYJumV9g7nK8jvmkSC6bKYZ2hB/Gt/7ME5G3XvtFvKLPqMSGGQ8iSgVvUN4F+1BAnBQGnHMTwfWneyd4ALl0qFahvcrlQg7giDyfzK/0tLkDVjycumDFmoF5gbKlXXNc7DP3uSc/N5+wIvuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585470; c=relaxed/simple;
	bh=9cESAQnKS1GvNLQYlN2dyJ8BiT0g66cuhPX4uVynMRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7sSwDbIHJJv3LUOTEmAhiREMXCf99KMPos+2DZkjbEp3x2qNwFPrGYaFM2508L3ti/Vc+0ikTV/4viHUcNNd/Eb2thIfKFzKnjjHuUMGtYpeA9y/OJRYgWikZzLPRSE0iWVsPZPn/bmZlpEaPW1wTgy3zcGwFu0RGNU2JUNJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckvLWazP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckvLWazP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so924833f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585466; x=1789190266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCaSkOIbas1sDw8YO8X3FHEghul9wX61PC7BjPNNw68=;
        b=ckvLWazPCyGRsnbiwv6t9mjgGTFaee50Bb542sGbZ2Mm0LedNdVHrLSocFa/5ztogs
         pYYuX5+FdpkRmP/xyYZI9Y5whSi7fpEqIgWn7nNn0dXU82ejqSdoLZdGvUDCJx24hBjL
         WoNv/hIL3gq2gmhCYDms9ytfymAclAnY0AhID99cNFHbX4ikIbBksAp+6p87QZkKQNgU
         /ewyP5Lx7cVwkga8XeQWZ92bkBz+yPSLvGe/GZeuxr8LmorYK0sxfxsppDU9yuxBjsmh
         U0MDNeuoga6wdKqkwCTmG/kS9I3EHJKFC6ZFGsNJV5c6D0l1whsP/6W7DFYwPbL1lynN
         kBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585466; x=1789190266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCaSkOIbas1sDw8YO8X3FHEghul9wX61PC7BjPNNw68=;
        b=TRenbo4jyku8rDyjtGokMiQv70xH73MtKScHyBN/zvuibwIotR/Z/+OARB/azowg6w
         sKB9qX/GuommhAVt25mCKKI+SvTFwaBQ4jbCWJo0y4SLHXmdkfGsCuMRdssvgy2yxIUV
         kTyfJq1eP66h9/E3sgedfkA6FO52GB8NvwmxpWz2sHZP49ucpLu32Rnwac/FVqBfLowm
         uH4m8XqGpLHMojj7FfnRf55PQDp2cwHUwWBhk7C2WiPCF0CN5cUDBDyldAEzaddeF49Z
         TDdpz3NhQRdF1cYnuJvJRVTau4K/yvcpFu17Xa/FOC+vGvNdNLUTm/UaI7Iv/mIITsIz
         AXkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv5EyAW/GFgivzXzNPuDIZmCM/8x2K8F7URNSJxI/CEaML1Zf4dtMbIXllIuR9RbpnyCq0NloJ1SdsG8o=@vger.kernel.org
X-Gm-Message-State: AFuF++mFADYHlLJwvh3DuJBfBLh/35XRadpIh1guORb7hla0V9MkmYTh
	leVZ6R3inKAXCYk2d66xhQYBfkkeNzMmOqLOLKgF3KQYkSVnQCTqz8ci
X-Gm-Gg: AYBFou3E+7IVGnOJX4h938dU5yg8xVkXC1mDBCS4I8KUIFYSxbBXNNqMxHtyORBOK1w
	nPiT8N9HvA85B16pfovpdwykRCdveOh03TpSqdb34q5LMBGr+z+4OejFsfg6t4ROvOVEQygz0la
	6YG02mnPjpAHhhL6QRQE2gcY/7tdHLUcAWASuFA9ncI8atjXY6y2I1JhWaR/CWb09AfVtrCmEKw
	zqBNF/Gn+rGao8W6ydfR4b3AMGvNVx4U1LzAcP2RQcAa3jDiUSeUu+H4zprn3sJe1+ZLlDxRi6d
	WKS3a+rk7m+hMd/ggcQGZuoLalqulxlZGy9Z7tUj99Z27zXj8l0xbGllB3E4oFRcH8RvGdYS55B
	BcHpriQ9lRncM33rIXCGWEsyTCk63vOXvgg0zbVYsgMHcTnyfQrBlc2RbnaX1j7WzJrkIMUek0H
	7TtC6ZzteCJ0sfEyiMF7jCRPGghF0bfnRHf7PH3xxS/CVENvJpGL6hwBMk6kGOkFhT0A5GJrp9m
	ui3e1RL0TpF1t9e2/jTqyeYVYvyOycmZJ3YH3hSFaHOEhp9EGTR2/qjsXROdIOWysFj9xhuvMLO
	ViQMRU+s8LARSmv0caaeMf2e5ymN5n3X/iUbEJy0HjfhqA8lszR3YBlsXuvipCKgeoY=
X-Received: by 2002:a05:6000:4604:b0:485:8f9c:2875 with SMTP id ffacd0b85a97d-4858f9c28fdmr2642911f8f.12.1788585465881;
        Fri, 04 Sep 2026 22:17:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm9329547f8f.2.2026.09.04.22.17.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 22:17:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfs: Restore selective debug mask handling
Date: Sat,  5 Sep 2026 07:17:38 +0200
Message-Id: <20260905051738.11317-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netfs debug macros test only whether netfs_debug is nonzero.
Consequently, selecting one debug point enables every entry, exit and
general debug message.

Documentation/filesystems/caching/fscache.rst and the NETFS_DEBUG
Kconfig help still describe /sys/module/netfs/parameters/debug as a
bitmask of per-stream function entry, exit and general debugging
points, and the fscache_*.c files still define FSCACHE_DEBUG_LEVEL,
but nothing has decoded either since the mask handling was dropped
when FS-Cache was folded into netfs.

Restore the per-level and per-point mask decoding.  Files that do not
define FSCACHE_DEBUG_LEVEL, which includes the netfs core, fall under
the cache management stream, the same default the FS-Cache macros had.

Fixes: 915cd30cdea8 ("netfs, fscache: Combine fscache with netfs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 fs/netfs/internal.h | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 420ee7b26580f..425c73b7e77b4 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -468,6 +468,32 @@ void fscache_create_volume(struct fscache_volume *volume, bool wait);
 #define kleave(FMT, ...) dbgprintk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
 #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
 
+#define FSCACHE_DEBUG_CACHE	0
+#define FSCACHE_DEBUG_COOKIE	1
+#define FSCACHE_DEBUG_OBJECT	2
+#define FSCACHE_DEBUG_OPERATION	3
+
+#define FSCACHE_POINT_ENTER	1
+#define FSCACHE_POINT_LEAVE	2
+#define FSCACHE_POINT_DEBUG	4
+
+#ifndef FSCACHE_DEBUG_LEVEL
+#define FSCACHE_DEBUG_LEVEL CACHE
+#endif
+
+/*
+ * Determine whether a particular optional debugging point should be logged.
+ * Three levels of indirection are needed to expand FSCACHE_DEBUG_LEVEL before
+ * joining it with its prefix.
+ */
+#define ____do_kdebug(LEVEL, POINT) \
+	unlikely(netfs_debug & \
+		 (FSCACHE_POINT_##POINT << (FSCACHE_DEBUG_ ## LEVEL * 3)))
+#define ___do_kdebug(LEVEL, POINT) \
+	____do_kdebug(LEVEL, POINT)
+#define __do_kdebug(POINT) \
+	___do_kdebug(FSCACHE_DEBUG_LEVEL, POINT)
+
 #ifdef __KDEBUG
 #define _enter(FMT, ...) kenter(FMT, ##__VA_ARGS__)
 #define _leave(FMT, ...) kleave(FMT, ##__VA_ARGS__)
@@ -476,19 +502,19 @@ void fscache_create_volume(struct fscache_volume *volume, bool wait);
 #elif defined(CONFIG_NETFS_DEBUG)
 #define _enter(FMT, ...)			\
 do {						\
-	if (netfs_debug)			\
+	if (__do_kdebug(ENTER))			\
 		kenter(FMT, ##__VA_ARGS__);	\
 } while (0)
 
 #define _leave(FMT, ...)			\
 do {						\
-	if (netfs_debug)			\
+	if (__do_kdebug(LEAVE))			\
 		kleave(FMT, ##__VA_ARGS__);	\
 } while (0)
 
 #define _debug(FMT, ...)			\
 do {						\
-	if (netfs_debug)			\
+	if (__do_kdebug(DEBUG))			\
 		kdebug(FMT, ##__VA_ARGS__);	\
 } while (0)
 
-- 
2.53.0

