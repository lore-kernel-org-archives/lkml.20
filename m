Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362608;
	b=sXA6O4dNqJrgfIrp7U4OZ/GWLsXBsFPkCbiZXUtuWWKT032s71s5B42Gcg5i46ZV6yUj
	 EhmZUceWo7Fcy1Djpgkb5nqjsuKZ68IWmDRIosRRF0yILKBhnpF+R4FGWq0rBAfr3LVtZ
	 OdFmgko/kv1nGKvI6FNICtNf+iENYNrjWAemUX/MaltBP+IPZkmMkVtx0Ebc8yTUNE/oD
	 QXwJlawYShjw4rjO3DixtFpFE6CsepzF1sH0KxeWNxvVO3opMgUhUT0z04pPvZ0FBWIkJ
	 YusQ8H1jYMm04gAcfJIzEL/bz9NITpruzhDfiUPNHtVNBbjMmv8fEEqBN4jh7Ubx1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=401n+ZrTzD2Uf9jF8wRJmI5BgTpaeQ35V3fMgzsFnx8=;
	b=cs9jDWFZhot4rH/8p62ULZpMjh4ZggC5FgOT5y6UU4OjBh5jw+kNI6NdRCfXHS3A8OgM
	 MqkI1v0JnnEexpN5YC7x5hf+UsZfyPFiD9GgPHyDo2/hMIAhc8D5VidToWHibhBYqC/8G
	 iGL7ZnRM/li8zrWVvtyPiIo4NX7iLY4qeJOa/5y53uRyItVR7h+g7anBPpmO9+RSRkBAl
	 fiGYj2gQYVtxzOPGHYWBdNq/mJh6LHGkyMtFPiyI/6Soookv91DsFqj1TJxMUdnaTBT1e
	 auo7VT40wBaKz4JceKWERH9XAmazbfD7TXgV+vu8dw1Jf0nXsHXiCclDpk8xqV/F19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JivvvA3G;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64108606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64108606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JivvvA3G
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso789154b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793362608; x=1793967408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=401n+ZrTzD2Uf9jF8wRJmI5BgTpaeQ35V3fMgzsFnx8=;
        b=JivvvA3G7Ttaj5BpIEgT/nHfrKnLVfGrFerx33hz2KxeaSi0r6tnn4facUBmz1kV49
         f++UvC2TYyX3R7uDE/xRxjV3UJ7SoIxHyu9SLCHYCKEdJzfuSJ9W8tcQRdkoxOEjdU6C
         4npNV1fGQegj/ExwOdN0RZuoyOGSdSp1s0p/suUx/3nmBMPMIRlLeuevBSGJuORWMghF
         AwaId4un8aVWKK2NuGjXP7iiW9YwWqvqjKc/OtHCdrQL1OZAyKkbh4vU832EtUbU+Riz
         P6IPY7wpdGOl4Xk27mjMAUDYtPho3okr990vSYLOkxIJZl/VFTVw+PQqkmRSEnxIUhH7
         bMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362608; x=1793967408;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=401n+ZrTzD2Uf9jF8wRJmI5BgTpaeQ35V3fMgzsFnx8=;
        b=cfShu8OAoYP1LW0UbwTXCG6XLWwccH8FfMFwQrJchivrY3143BljbX3vYdWmZNbu93
         hIRc52ampGAAbQ26t+irAiEm5UWCfJQb4+i0DnJtkw1cdmMkv3DYavbMHWoIjbzQnlcK
         UMECNpuj0pPCA0VMnn3+0tqkzDVMJhGvJSywGF/viFlAv2QjNpOL3HxWpAky3fqot+9U
         gcC4bVXic8cMhWzKt5NRyAOPwV8xJkWcq8Xf9tttb6LC6izFucmBdtPwweOO3Tha9R4R
         t1mT1IRhgzs+4MN7gUxLbd2RRx1hQSZVrknAM/Vq3YD7OdMLecWnQ0k+H8pftwXS3prA
         V4Cw==
X-Gm-Message-State: AFq9FYKIpyVpJ97zO8BN4zplXIBVrEFj5yT7Uz0M9reFtDesRWwCTj1T
	zU6qpGQzLI7wXBfYJYulCGCVHtgjPQsPy0G+foXJmp7T5ev+b5UYV8ERdGOpwpmBgryjuODDy1s
	CGVLljqn3/JZ37vDkajfjnA==
X-Received: from pffh8-n1.prod.google.com ([2002:a05:6a00:c248:10b0:889:4fa3:fafc])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:17a4:b0:89a:5:92c8 with SMTP id d2e1a72fcca58-8a9bfde72eamr1964748b3a.51.1793362607469;
 Fri, 30 Oct 2026 05:16:47 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:16:33 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030121633.258612-1-jenhaochen@google.com>
Subject: [PATCH] zstd: Build with -O3 and use shift mask on arm64
From: Jenhao Chen <jenhaochen@google.com>
To: Nick Terrell <terrelln@fb.com>
Cc: linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, 
	Martin Liu <liumartin@google.com>, Ben Wei <benwei@google.com>, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

Upstream user-space zstd builds with -O3 by default, and lib/lz4/Makefile
already sets ccflags-y += -O3. However, lib/zstd/Makefile compiles at
-O2, and BIT_getMiddleBits() only enables the branchless shift-and-mask
path on x86_64, falling back to a BIT_mask[] lookup table load on arm64.

Add ccflags-y += -O3 to lib/zstd/Makefile and enable the shift-and-mask
path in BIT_getMiddleBits() on __aarch64__. On arm64, this reduces zstd
CPU cycles by ~7% and improves decompression throughput by 12-23%.

Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 lib/zstd/Makefile           | 2 ++
 lib/zstd/common/bitstream.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/zstd/Makefile b/lib/zstd/Makefile
index be218b5e0ed59..900922ab5b94a 100644
--- a/lib/zstd/Makefile
+++ b/lib/zstd/Makefile
@@ -12,6 +12,8 @@ obj-$(CONFIG_ZSTD_COMPRESS) += zstd_compress.o
 obj-$(CONFIG_ZSTD_DECOMPRESS) += zstd_decompress.o
 obj-$(CONFIG_ZSTD_COMMON) += zstd_common.o
 
+ccflags-y += -O3
+
 zstd_compress-y := \
 		zstd_compress_module.o \
 		compress/fse_compress.o \
diff --git a/lib/zstd/common/bitstream.h b/lib/zstd/common/bitstream.h
index 86439da0eea76..01e69ab7053b4 100644
--- a/lib/zstd/common/bitstream.h
+++ b/lib/zstd/common/bitstream.h
@@ -299,7 +299,7 @@ FORCE_INLINE_TEMPLATE BitContainerType BIT_getMiddleBits(BitContainerType bitCon
      * such cpus old (pre-Haswell, 2013) and their performance is not of that
      * importance.
      */
-#if defined(__x86_64__) || defined(_M_X64)
+#if defined(__x86_64__) || defined(_M_X64) || defined(__aarch64__)
     return (bitContainer >> (start & regMask)) & ((((U64)1) << nbBits) - 1);
 #else
     return (bitContainer >> (start & regMask)) & BIT_mask[nbBits];
-- 
2.56.0.317.g454f8302e1-goog

