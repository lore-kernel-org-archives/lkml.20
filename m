Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596245;
	b=jJDqBE/e+qjEQ2CRcWQK23Z3S/Nva10eD7WXl2Gl7k6iADytaMfvHHsvg1bMKgwbN7U6
	 mLFLKuCaSYDuph4IEcWJDun927fLywe0dh1cdzcsqe34akwKlP7wIferH35q6fWqqZX0L
	 ceJK8G7u4naLl1m2nN1Q2uiRUaRX0yh7oSJOPxRnckXDiLbR+DTv0/DxtLfE06TWfykg5
	 GRztgQVwUnUAHhRY8uUIa8AyaeXWE4sgEHFahNtWpZnP3iQlmtp7ksBjuWGL5zZK+e7hh
	 BSJJVw8gUCKOYL/cxskrUqpJE2KuayGvBSXtC/HzPizLtWbE1OwjNgvdLaG1YO+E7Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6z2IIANAK/q43/60wCSqFTZejveLr8Zsp4m5wY/kCvw=;
	b=1LgDdvfvPS63CJNyOdZQOuFC/iec9T6o9aQrxbUSSqSq4qjlkgU0KQb4r8uvLJx2YwTz
	 B7cJwX/DE+dHquHL3nBfNm+U5igKla6HWdh/zX6p4dFlvcUNZ35aluqcuz4cZ6Oj2PajI
	 hdLTrKJCR0GjeXm0SW6Dg4KW49gtZXcvUDdQicsUZsHDdXaS8VdB2cZrbXRryJyyYW/3d
	 bTQTotlp1vIBtRpwRHtCoymSmv8FIy5RJt9to2+eO8yltGmD3PyMCYjDs5bl7YsfkIo9P
	 RZEvR1dXRPK8N9cPosOrmHLEIvuqEG5GKTivvk5v2aBWCm2Wx+UaLa/zKAkNIE4953Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KDjsMdfo;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4F606F2CC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD4F606F2CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KDjsMdfo
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8196705e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596243; x=1795201043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z2IIANAK/q43/60wCSqFTZejveLr8Zsp4m5wY/kCvw=;
        b=KDjsMdfoJcmpbFhv9qJKY3pWYjMAVGT53zaPEdiK9gOnI08JzEVYpZmSCI/0HXO6En
         kCBmJ9VlqjsZeerCP51ZVtQE1LEA5x7bd3dCrqDIt74mqq9LS9RZ/NOF20sUJL0Y71I5
         chvDDthMDfDSzfIWUAuQ0AmncB0BFy2THIZZCXsWk0K1OxKkp9Cgn17UbDojuFOqr+F4
         ormaCmaujCo692yHTseuZEewMQIDaD2T2svo9sqLFqKrAQxlz88qr0kGyGxL45QCu2JK
         XreuaVZ94ZSH3/J58+8+6uegv8hUJrdJYTQkwd15Lf/vS3PAlIypTnt8U8TkycwcrNEJ
         ScHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596243; x=1795201043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6z2IIANAK/q43/60wCSqFTZejveLr8Zsp4m5wY/kCvw=;
        b=SDB+OqCYQp0civj0bXuDhSPHk/Imt4FR7jBI6iGZ0xLJaQbAzz67AZvwYi2MsOHnVR
         Jlx4tu67Wabp6XylmO/rOb4+S1q/r50Y+i8jAq0+3HSZ/i578WeYZn5K1PLJYeLXNPdq
         Mqo7lXO2aM48F8jtM9kXDrRF7A1JHVIc3HQq6Gmu4+gqpEAfI4WqOCY76gKVucgtc3Ar
         nOJG259JwDNnmBE/rKXoDnwix7NK4fm+K9yUqGOrORl9T1pWeD24kdWJtAyjQhsi1gGe
         3AahgiWAb71qvQFM68nv2MvNTQBOJUd9j9/wGIYKkdi2U4/DGPIaKpLls9TX6DCvvQBm
         uNbw==
X-Forwarded-Encrypted: i=1; AL+hErG89aSeW6FwqRMsnLcDdpRlTUL4UPQWtJ60ezjlsIKP0cw59YELfb3K6NDbDaaQdNBa64ACiarYLDUFfWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V1M//Kfh7CmiLbJlKEfs2N3WtN/KGQBmrj7EazzF7WDAqNnRc
	4ok9ztVRqEexs3YZX3679KTALiL10MeEpe0ZQc7KD7hNsS6xG8gx6og8i/02tOMt7Qs=
X-Gm-Gg: AYBFou2eX62a9UphXuyh62I1HcmkQSwG9lMddHzKFqHDrp32h2UTC/kjgSFpu8QDUFX
	LKH8Um3TdGCL2745CqzxyYd4MFGyGlyLMqbMxFtkUy0o3BtajuwcDBx7CaEskdDvERT6kIGej5w
	1TsFPVZVIqIz7LXzqjdf4hC1a1qqtnx9WpBgE7+hKNuvKkPqO54TSvGIzto5r62NSGJaz8w1dIF
	sLNq5U+faoEDtoaxPAq6kabMD7BkCRYNQoGVH8IYszpr+dC/M9cg/ZsEIvJ8sEnkihJqkoWNs5b
	bdb+MkfZJUkdLigxHKbBmbF+xDIwy3m0bVE1PY6uaUI0+46FsF+23SdkzS//1qTZD1OdZdBp9Ao
	Ez29LK/k3WFDi2yKjb5gC6ZkLve+Yx/63LHhe4MfE7idSUhlMv7urfOKry7HNrFA+D2PLgNexGM
	vAGywPhBF6ebNA7OiJf5H/giQuAuIQ9qhWfBa+Edqm3tc4GW49qtuOm8iuGLay1B0rnMlH73bPh
	HzjWpmjzvwIk1EDXPightYQ275ryGBptMMqUuGZDH01LFBm3vhtvn6Mbkt0XnCZu3wUY6foJQJG
	MX6YbuGZImXvZo0hdZx5aD1CpLdlJMnp4CHfpP1qDmxCjpcXpXA=
X-Received: by 2002:a05:600c:628c:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb55a6b67fmr78323595e9.14.1794596243301;
        Fri, 13 Nov 2026 10:57:23 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:21 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 10/10] scripts/gdb: Decode compressed stack depot frames
Date: Fri, 13 Nov 2026 18:57:02 +0000
Message-ID: <20261113185702.1332171-11-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

lx-stack_depot_lookup reads stack_record->entries directly and would
misread compressed frames as full-width addresses. Export
STACK_RECORD_COMPRESSED through constants.py.in and decompress frames
the same way as arch_stack_depot_frame_decompress() on x86-64 and
arm64.

Other architectures never compress frames (the generic hook rejects
compression), but the helper raises an error if it meets compressed
frames there.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 scripts/gdb/linux/constants.py.in |  5 +++++
 scripts/gdb/linux/stackdepot.py   | 23 +++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index dab8b80bed69..da6b39c3dc13 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -22,6 +22,7 @@
 #include <linux/radix-tree.h>
 #include <linux/maple_tree.h>
 #include <linux/slab.h>
+#include <linux/stackdepot.h>
 #include <linux/threads.h>
 #include <linux/vmalloc.h>
 
@@ -112,6 +113,10 @@ if IS_BUILTIN(CONFIG_PAGE_OWNER):
     LX_GDBPARSED(PAGE_EXT_OWNER)
     LX_GDBPARSED(PAGE_EXT_OWNER_ALLOCATED)
 
+/* linux/stackdepot.h */
+if IS_BUILTIN(CONFIG_STACKDEPOT):
+    LX_GDBPARSED(STACK_RECORD_COMPRESSED)
+
 /* linux/slab.h */
 LX_GDBPARSED(SLAB_RED_ZONE)
 LX_GDBPARSED(SLAB_POISON)
diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
index aaa18af25cd1..f689cacb3cb7 100644
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -20,6 +20,21 @@ def help():
     gdb.write("Unrecognized command\n")
     raise gdb.GdbError(t)
 
+def stack_record_entry(stack, i):
+    if not int(stack['flags']) & constants.LX_STACK_RECORD_COMPRESSED:
+        return int(stack['entries'][i])
+
+    # Mirror arch_stack_depot_frame_decompress().
+    payload = int(stack['compressed_entries'][i])
+    if utils.is_target_arch("x86-64"):
+        return 0xffffffff00000000 | payload
+    if utils.is_target_arch("aarch64"):
+        text = int(gdb.parse_and_eval("(unsigned long)_text"))
+        if payload & 0x80000000:
+            payload -= 1 << 32
+        return (text + payload) & 0xffffffffffffffff
+    raise gdb.GdbError("compressed stack depot frames are not supported on this architecture\n")
+
 def stack_depot_fetch(handle):
     global DEPOT_STACK_ALIGN
     global stack_record_type
@@ -40,7 +55,7 @@ def stack_depot_fetch(handle):
     pool_index = parts['pool_index_plus_1'] - 1
     if pool_index >= pools_num:
         gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (pool_index, pools_num, handle))
-        return gdb.Value(0), 0
+        return [], 0
 
     stack_pools = gdb.parse_and_eval('stack_pools')
 
@@ -48,10 +63,10 @@ def stack_depot_fetch(handle):
         pool = stack_pools[pool_index]
         stack = (pool + gdb.Value(offset).cast(utils.get_size_t_type())).cast(stack_record_type.get_type().pointer())
         size = int(stack['size'].cast(utils.get_ulong_type()))
-        return stack['entries'], size
+        return [stack_record_entry(stack, i) for i in range(size)], size
     except Exception as e:
         gdb.write("%s\n" % e)
-        return gdb.Value(0), 0
+        return [], 0
 
 def stack_depot_print(handle):
     if not constants.LX_CONFIG_STACKDEPOT:
@@ -61,7 +76,7 @@ def stack_depot_print(handle):
     if nr_entries > 0:
         for i in range(0, nr_entries):
             try:
-                gdb.execute("x /i 0x%x" % (int(entries[i])))
+                gdb.execute("x /i 0x%x" % entries[i])
             except Exception as e:
                 gdb.write("%s\n" % e)
 
-- 
2.43.0

