Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008755;
	b=IfBE2pQq3HaYdft6E75vVjhuee0fJvSHVgVyPjNSxhgEvJ2YwdNugJFrY7ZDB36GSA1k
	 BuxuRWKKjF5R1pVZSo6l+oT1ezGR4/NKOrf393DhNQwJw4/uKv4KqSDgBcweom+gEYA2L
	 cVHNw2woeiwEWZXn/XWw1e5JJouefDexHKk4Gn8fNOO/kkoYO1a4P3s3b3VABR2WJNAMs
	 DBp66/33slZAJlADWRJPdImWwBJCwKjvE5k1HLoaq4SB1sE5kfiaDx5XHLtw+KtgjPoc5
	 JjwL8X7YT8oTeimFobj/w9ZNMgfJxwo45Z4FXHjcyZpegOkV4qmk9bvbo5JUdNrNPWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
	b=sTkv82NuOt0mxxGb6wdNDtTEGWm2PwJ1Gk07h+RZGL1m2K2UZ4Jcen+cSTU8NX1vfFvN
	 8Dte7nj/t4JWimuZmKADjmS1LTC9vZ4Klpo+gysytxM3PwhSmJ+QTJkThEc0hdhudTrK2
	 AwrJ4mnz/IH737hBHncqA46bkrX+6X+nJFT9hpFT3UXn4lup9D2X9DVy4NcRPOWKQEmrc
	 LSBdW8LXFmVRpYC34eJcAzxT89p5IfSj9IEMQlLpdIr7WW2F7tPdB+nxUvkMP5K6UWiiC
	 kuEMW7qzLaFosrh8zUlsefGLVX9wWjDfm5ZsWtyvJ9pz60s0/uDWynbbKoaw0MRio6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgmCNSc0;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C3606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgmCNSc0
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e985106c0cso9005445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008755; x=1794613555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=LgmCNSc0ZP7OCBFSx1oQ7UrzGDI/kgVRawRPNOAcNFCk2o1h9JTdAiwth7Ae/vJDRR
         ZQ3Hgzw92KMNVOWX2hNDXisE3FWQkxo6hx8x9GuL86uOXuIHc1BKOKEqWg0j1OvmVKUn
         elW5r6p0bo93EGTZnZtC4eMQ1P40c+EKh0Z25lVytxMdvQ78Bm5yDW2XOoZxkvnYLe88
         oCztE+GYfpoAVd2y4imyuV8j7ilNO6KarcGGW4Cq1+qOKZ+z/TFydemQgvyI3gCDRkoz
         isPj2dHoP3eALDL/S3XGyUsit3Itexrww8et+k/uAWx4KXAkLXXTbLUIZFTGAEfMHVWJ
         2bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008755; x=1794613555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=YLP7DUFsrAyQYP+ZMGuHbNya4yGAx7RbIAoXIUvr077RAfwTtmVufg0KD1dMr7shQQ
         8HUFLvjS7TEjRw3QsDmxtyvUIHFCeLx9olPMaDPNAionaleYD0vr/Atf7WS6LyNBmqil
         vXTrKfyxEPCSJMnfX0sr3gU4bAJjAh7Xq1ZRh1OlHM6AkCwMVK0vBlCYU9/1+rxTdeR7
         v72dnKzD3Tt/yp9Bfyv2RsTlwh2DSDqVjtZJKGVIZorIUYA8DG5Dt9Iou0WFMkQKFTIk
         PoGV41VuE1451aZ3v+NLu2i1pvgodVFSifh/KXInuhqSvuKMLfZ4EZ8yGuv5P1i/OXOv
         qiHg==
X-Forwarded-Encrypted: i=1; AL+hErGU0BjJMI+QRMGEdiBZr0G+WhCDNp4wZ27uG8DkMVafOb3spcDS0wcWuYhZ7SgJ7aWAfNglWmR/wASCDAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yfMM7+GQDzwD98uIeZuVzQC3LVdPP0Uf+RXBmHDiE2aDo7Mji
	PerCDwRZp8krFPsgBeVmuKITxBMY7NgGuJ/KkKRAICi0BR1IviLU/VdW
X-Gm-Gg: AYBFou0QyeR0DrAcJ9IiQwavUICXbwPoa68jCiYX4q+/cS/g9c0kLmOFQWHPPxe4DG1
	nL6BUuaRtaTkKxG0OyuDiIsYAXDlcPsJ+A0Ez0sh3a5sN+RGCEysaTHHgCpVB4jd0hFs7YmmzCx
	qCWgvcRGbxixPOgZNBzc8jgEQT5aIukIwsZURm2p4ZXudJw0tDu52NFOjn7eyRbeQxHqPj31rmN
	jelTahou3KKjivYH4LVBzNuz+J1FE/QBTXKiZ06AcHUjN2B3Cb9CHKN653ZRYKyYEEQHETEdAlo
	cgW5o4TJMWmGuwL9AbJ89RfTfQt8U8w0UMH6XgdjO1/rs1WL0YAbvmYDRJDdSHMeELZNijmKJd3
	G2kw0sEOE8opPMy9kUzRK2BCQhUFt6aK09EZr16yBLo1xr2IYIKnF4BYjyVNIJOniidAI3qEXCX
	Mj6RzkDvqc/Xlk/5bbU+GYJOvr/vxIW6EXsZAXsJ/tPQETmtQN3Ma4QxKwLya6xjT9uk20AbNcx
	vxbHrJVqa3Ars9q04rgV/x9E7wykI3jQsm6eDeF7m33V1wkcvqK3inOc02+HxHA3yXVXGJOrPSr
	2sfx/QmueDuMVA7AHYgS4KhSPccJY/EjxGr6PphqOA==
X-Received: by 2002:a17:90a:e708:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b0db6d3fc1mr3846365a91.27.1794008754637;
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm796145a91.4.2026.11.06.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: perf: Fix the userspace counter example link
Date: Fri,  6 Nov 2026 23:45:51 +0000
Message-ID: <20261106234551.1474417-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but the file does not exist: no file of that name is in
tools/perf/arch/arm64/tests/, and no commit in the history leading to
this base has added one.

The userspace register access described in this section is covered by
the "User space counter reading of instructions" and "User space
counter reading of cycles" cases in tools/perf/tests/mmap-basic.c.
That file is the only in-tree userspace test that walks the core PMUs,
pins the test task to each PMU's CPUs, and selects the PMU by its type
number when the kernel accepts the extended type.

perf test -v user runs the four cases in that file; the two reading
cases ask for user access through config1.

Point the text and the link target at that file.

make htmldocs does not fetch external links, so a plain documentation
build does not report it, but make linkcheckdocs does.  I checked that
the old link target returns 404 and the new one returns 200.  No kernel
was built.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/perf.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..236cb5da425a 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -140,9 +140,9 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
+Have a look at `tools/perf/tests/mmap-basic.c`_ for an example. The two
+'User space counter reading' tests in it can be run using the perf tool to
+check that the access to the registers works correctly from userspace:
 
 .. code-block:: sh
 
@@ -160,8 +160,8 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
+.. _tools/perf/tests/mmap-basic.c:
+   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/tests/mmap-basic.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

