Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFB337688
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576695; cv=none; b=Cdex275TyHh/NuiZmsSDT71LBec1LVk8FCMNiiG4E44YrynK3hmyq9LEPYXdAriEiEShlYY2CQUXFVehVdtUmN96HKrRs6ACkHrV0gnTUHc1uMeBMUjq+oNCNQ8PdmaHVl6Ehv6Kd/D6ChfK9YkBE10sBMPlmLeZ1c2A0t55sZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576695; c=relaxed/simple;
	bh=0oDNB+NNpmi/Ia5UjiAAkWEUmzFeJsRXTEAWNh6e61Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lN3cSSrVZO33z+SFKMhiiYt3/PDOTY4IIeAsNshX8cP1x2374YoZtgxI4GJBy90kVegI6GlEJgf5ITG1wOgEUIDbswHhBNwCxRdYpFullm0uUXTk/TFsS7rgvfaTztOYgZu7m7dC5wJ36gV3BsHStLKPbzzZUu18tpJkig2pq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZYXIZwx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZYXIZwx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b9320423cso18048635e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576691; x=1789181491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=MZYXIZwxo83oWGZmBhCE7jrDgqzAHjLHYUeJ4DYSrl6Djz/zts0RsT+68tVmOUH3zl
         rlQuk9KaOvxdZWWHUIzqiaUVhblYwptMIx1lj1QmgiQ8T+GgEOhFyOlEsPDQdYhmh8bH
         mp5ZsbQw6K/4Mzr+5GSx6qia9F9jwZCGUFOscIe04S7WK7VH7uP32iM8vPOZbc6LzpEC
         npjs+sBu3XV+v7uF045QkdrZ1u1Noj1AIafN95oQGHlcEqy8Eegixu3A8tlObLb61O8D
         TRheXGxsJRWAQ7PhyP5ZoEymvceVzIvY6jHb231772+6UoQZz7XT7htMCkjQ2RbhMYbD
         nfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576691; x=1789181491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=IiRZ/zobGOqpldItqGYF38quxbmDiZQzMMkDiTQOjre8p7MqOPMN9mFhyCo/o+oYPb
         WO4sb+CFPnS+ozsYjbnfmYSi3UZrlEXvafexkzDcm1lM7zlGVbcSDgD/CUUIP7HcDFYX
         5xdPyNWpbiAOuqT+D76RkZQbXZiSXwk0NthRtR3biikP/hFsFtZ3s+on6ErFIPxGBCqU
         poHzNaC7DgkoJDPP7UJEIAewWhGYfQz3Z4vPPXHluKZ6P/+um6b2/9ckOiPZFOlw721t
         MHAYFpvLcguYD2Mi14KDynV24eQNisOH4FwqNqQwYVqRdc4ZGq6BIHxfiy03cwu27Scq
         jv5A==
X-Forwarded-Encrypted: i=1; AKwUvBzz2KmQudpqDOgOAGKjaUIuGLG97KEMdNub6+J6QHjEX3/SheUsJ+UPZNHgWls6pkXeERTplXexJoWcYk0=@vger.kernel.org
X-Gm-Message-State: AFuF++nmLaCGHPZIkUbsvj8vnegbl53pB/iy4vPujkP+MJ0oC2rKxdJa
	ZXDj2WdItu0n4MyPEio4SsXFh+Wi+0+IfJ19+Q/zqXq1Pho6TAC1IXL1h8Q7AYAB
X-Gm-Gg: AYBFou3Up1T5ViZugDrN0V9FhdStcdyixpkRdZP+v2aSC3lqZFPOfW6BKPTYfWL4TAV
	YEQwRvAHArb7A2+6/U4eDH2S9StJ41WotLpnmUBgqAlt7FIEYVWJTJSCAupdy9bHzS1DMqr39s1
	+ljiqu7dkUqevPt/+wSJVXVYJUxv41haI8IhxiJyZW8eNFH/6yuDlOghSipyXMmSlfJIqjv1yu7
	0X1N3qt2ZWizHKtn4L4CQLVSZEHjFdrjPcpmXf/WO11Fs41HHtRdhb4hKmeXtwrDbpD3gTLTSC8
	4eQbUsBl7v0Ba6OUCkZni07h4HWs/13cAWyVYDJsgLQlHKHe0izlfGvlBOPpO/Ltx0bHDwdoLfN
	oB3n6OfyppIO1fJmZM3NDVCJ6dprAtdZzsptb6wSh3JW2NRuUC1RNaicAsgdwcf3XPDKU7k7Aav
	qpSvBVECmISX5HWwFciUZe3jr0BYwHagrTZkTbF6gWMle+aOJhxMilt5UfQ16xxsrqIDtCsJrS+
	Cu2ZbL9e0r3PCAlpCJwTE+0zeFrbcgEfx+esnfYJdmKBuGn3nN/O6F0Xsqh1SybGGqkRuGy89ty
	u9O8kXidNvCU3+3Gled2xP6CyILQdJNRJ1EDPbgyRtSKp/PzKx5t+609crDZ35jIZh8=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr197015325e9.16.1788576690772;
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm200740735e9.4.2026.09.04.19.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tim Bird <tim.bird@sony.com>,
	Harinder Singh <sharinder@google.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Daniel Latypov <dlatypov@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix cross-compiler prefix examples
Date: Sat,  5 Sep 2026 04:51:26 +0200
Message-Id: <20260905025126.83693-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GNU target-tuple prefixes shown in the CROSS_COMPILE examples are
missing their trailing dash.

Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
Fixes: 957063874c76 ("Documentation: kunit: Add CLI args for kunit_tool")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a3399f..9221acddf3fa8 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -189,10 +189,10 @@ via UML. To run tests on qemu, by default it requires two flags:
   Kbuild. As a reminder, this will be the prefix for the toolchain
   binaries such as GCC. For example:
 
-  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
+  - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a directory in our home directory called toolchains.
 
@@ -293,7 +293,7 @@ command line arguments:
   - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a specified path in our home directory called toolchains.
 
-- 
2.53.0

