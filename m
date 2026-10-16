Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E13D411A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183453; cv=none; b=pS5+N4P90GM+FkVJwTvm3juKVUjE9celNfBLPtw56uH9pGI9U2I93+2VvVVvLmIy3+wkOyt6/KyZv/pCptPK86zfkXLNgq28RoF6JSEG7IjTpcsviQo4V2VGzh9ZjjnqvDXMCqTEoEpXjaDm1BxhRAALqRHHQiWlJ7Y5d75U4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183453; c=relaxed/simple;
	bh=HkzCWUaXCSiZSlDOZOV2MoIIwhun+7kLsYQliY/CDLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dcsst9llqhU3pjhZx9YtkU7pz+Mb7oascC+edgDbI5Hl9kJQNecTBhbOkaLoyaSBf0HQrVcAf2l5NcKvvsR9WD4SWFpvfJgXOlJ0HA+IOl+wEdnnXK2gEqp3SqhE8xqP43vxiz0cQ85YLUplczXyOCNNeoKE4lqUtvg8XTa2Eeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBYSUEtu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBYSUEtu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so32671f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792183449; x=1792788249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haHwrcUAVioW0k4WW0rn4ICUkA35L0lW3cPQKSkeq6k=;
        b=sBYSUEtuE/hdsM8PG7CDinbQEyM6PxK89H/RDqpMGjozeKEGBYvKWMIw8hR4TCTMtV
         V1AkjQZ63Nbc1wC1RuNJRQxXms28Kh6S1mg+AHzLz/5eM6hCgdRtLVqPZj0L8kfllFoe
         9Xmr6Y5P3jhNJYolCgEVDPAGQd1aYeYibpEzF66KHIgDeJFI7Lp0hvchEP4Xx0E/MDU6
         lVjfBJEVeVN5xWcz1EXfA1Pk2aiAGTB3D2zAx4/kU01WJExPfzASyfjNFQFYlKXVnAKi
         fiBlRSSu2THG0EBxhbseiam0ZbkGQX4aFRHyAJO9DIiab6TWEv0NTkeu3s5rmdjW/c4b
         QJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183449; x=1792788249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=haHwrcUAVioW0k4WW0rn4ICUkA35L0lW3cPQKSkeq6k=;
        b=qb9/fvLL+RTCehgb881wiRCVJ9ouJJBm1OKZUM8HON7IH9VfweMkY60couVlhW5H2W
         HODMld5anoO9+0ldYrbtalj0uqK/iZnQFg1loXy5rtXFGh45/lhkG5BDd1rlpUtpjJ08
         OSBGpdQ3PBtZIVghJrS2G+j9xFgYtPRIyeoCR8tisUe9kjt9f9zHZEbbgICvUQzHRzdf
         FVGVgboO6mcwwdvpGtsnvZk8uMKHix23Akav1tmBYMU0Iz1FW7uhxZvlc6rSWc1ZO/dg
         5th5XIguYLyhNdqb2EEUBZOmFKV6x5rQBGUWUmFJw5lGYG7TEcy4fSJ2QANA85YsVBgl
         Zm6A==
X-Gm-Message-State: AFq9FYI1FxuzAFULXjnUI+bIeHv5fDAL/kk9D6sNHIx4tx0yYaAACois
	OWKuIIUcPx6gVh9faGk4srC1bEaHVFDrCvWqA8kHNy/mDFUSGXOcTamW
X-Gm-Gg: AYBFou1OkSvwrzi9reo8N5mApRkAX5P4CidsU2HCBUEpH516GR8L5zHsrs938eq6MT7
	ZTXy7HPddIbnJaqC64P7S/ZCU/pqHZ0wmPFbKRBdtWi2DOp4B1GN9qqH8yO5o23R7jRU1iY2xbd
	CN+FpS9JAbbZundUdnfeP46NsWNa4NNc/lCNnejNQG7OxxDl+/OGj9RRUBog/kel6rP4WalFm3A
	D4Sc0kD3i2AWSfxA3wHAdOhCvjrHXdDex3l9UdwXgSnqR6njlW5LoCZgPriL+0bpnkArs/a2es2
	ymXXsbT8qabfzNZI/pLuso4Ak1r5Ud3wArjdC8LTXXC5hpJZCLErFd9IQ1ECt+fleM+pqYc3g1k
	1bV0jqLtXVEzFYpgs6N77GlDTNJgTxYDql11VwHAmBVkuwvv5rn0YEzWAtxDBPP8E/uPqsZLYi3
	dM7UOaJ/uSJFc9mMC2Gv+tHKrrmM+D/H5hHBDDbD3YUT5mI2CiQjZVszFWq6PpADM297cPiiB6H
	gLUxLaTcUBeu4sSmSGZbmdXiDS6hjNSvOaW4R2t
X-Received: by 2002:a05:600c:8506:b0:4a1:c7f3:218e with SMTP id 5b1f17b1804b1-4a1d75dc193mr19946235e9.1.1792183449276;
        Fri, 16 Oct 2026 13:44:09 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.76.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm7502077f8f.32.2026.10.16.13.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:44:08 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
Date: Fri, 16 Oct 2026 21:43:35 +0100
Message-ID: <20261016204335.46241-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015190639.7b722dd7@foz.lan>
References: <20261015190639.7b722dd7@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc fails to parse tracepoint declarations that use
TRACE_EVENT_FN(), e.g. gpu_power_status:

  drivers/gpu/drm/panthor/panthor_trace.h:28 ... Unrecognized
  tracepoint format ...
  ... expecting prototype for gpu_power_status(). Prototype was for
  TRACE_EVENT_FN() instead

tracepoint_munge() only matches TRACE_EVENT(), so the macro name is
kept as the prototype and the TP_PROTO() arguments leak into the
parameter list as garbage.

Match TRACE_EVENT_FN(), TRACE_EVENT_FN_COND(),
TRACE_EVENT_CONDITION() and TRACE_EVENT_SYSCALL() the same way as
TRACE_EVENT()

Add a regression test for the gpu_power_status declaration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
Move tracepoint handling to xforms_lists, together with SYSCALL_DEFINE
as requested by Mauro.

Question for Mauro: is adding syscall_munge() and
tracepoint_munge() in apply() what you meant, or
did you want a pure CMatch? A pure CMatch looks
like it would need a tokenizer fix for nested
commas, so I'd prefer to keep it this way unless
you want the pure CMatch rework.

 tools/lib/python/kdoc/kdoc_parser.py  | 110 ++++++--------------------
 tools/lib/python/kdoc/xforms_lists.py | 109 +++++++++++++++++++++++++
 tools/unittests/test_kdoc_parser.py   |  28 +++++++
 3 files changed, 159 insertions(+), 88 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 80d4245acd17..a274e06b9f23 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1059,8 +1059,27 @@ class KernelDoc:
             #
             # Apply the initial transformations.
             #
+            # This also handles SYSCALL_DEFINE*() and TRACE_EVENT*()/
+            # DEFINE_EVENT*() via CTransforms (see xforms_lists.py).
+            #
             prototype = self.xforms.apply("func", prototype)
 
+            #
+            # Tracepoints are documented with their short name, e.g.
+            # gpu_power_status for trace_gpu_power_status().
+            # Accept the short name and store the full trace_ name.
+            #
+            r = KernRe(r'\btrace_(\w+)')
+            if r.search(prototype):
+                if self.entry.identifier == r.group(1):
+                    self.entry.identifier = f"trace_{self.entry.identifier}"
+
+
+            r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+            if r.search(prototype):
+                self.emit_msg(ln,
+                              f"Unrecognized tracepoint format:\n{prototype}\n")
+
         # Yes, this truly is vile.  We are looking for:
         # 1. Return type (may be nothing if we're looking at a macro)
         # 2. Function name
@@ -1493,82 +1512,6 @@ class KernelDoc:
             self.entry.add_text(doc_content.group(1))
         # else ... ??
 
-    def syscall_munge(self, ln, proto):         # pylint: disable=W0613
-        """
-        Handle syscall definitions.
-        """
-
-        is_void = False
-
-        # Strip newlines/CR's
-        proto = re.sub(r'[\r\n]+', ' ', proto)
-
-        # Check if it's a SYSCALL_DEFINE0
-        if 'SYSCALL_DEFINE0' in proto:
-            is_void = True
-
-        # Replace SYSCALL_DEFINE with correct return type & function name
-        proto = KernRe(r'SYSCALL_DEFINE.*\(').sub('long sys_', proto)
-
-        r = KernRe(r'long\s+(sys_.*?),')
-        if r.search(proto):
-            proto = KernRe(',').sub('(', proto, count=1)
-        elif is_void:
-            proto = KernRe(r'\)').sub('(void)', proto, count=1)
-
-        # Now delete all of the odd-numbered commas in the proto
-        # so that argument types & names don't have a comma between them
-        count = 0
-        length = len(proto)
-
-        if is_void:
-            length = 0  # skip the loop if is_void
-
-        for ix in range(length):
-            if proto[ix] == ',':
-                count += 1
-                if count % 2 == 1:
-                    proto = proto[:ix] + ' ' + proto[ix + 1:]
-
-        return proto
-
-    def tracepoint_munge(self, ln, proto):
-        """
-        Handle tracepoint definitions.
-        """
-
-        tracepointname = None
-        tracepointargs = None
-
-        # Match tracepoint name based on different patterns
-        r = KernRe(r'TRACE_EVENT\((.*?),')
-        if r.search(proto):
-            tracepointname = r.group(1)
-
-        r = KernRe(r'DEFINE_SINGLE_EVENT\((.*?),')
-        if r.search(proto):
-            tracepointname = r.group(1)
-
-        r = KernRe(r'DEFINE_EVENT\((.*?),(.*?),')
-        if r.search(proto):
-            tracepointname = r.group(2)
-
-        if tracepointname:
-            tracepointname = tracepointname.lstrip()
-
-        r = KernRe(r'TP_PROTO\((.*?)\)')
-        if r.search(proto):
-            tracepointargs = r.group(1)
-
-        if not tracepointname or not tracepointargs:
-            self.emit_msg(ln,
-                          f"Unrecognized tracepoint format:\n{proto}\n")
-        else:
-            proto = f"static inline void trace_{tracepointname}({tracepointargs})"
-            self.entry.identifier = f"trace_{self.entry.identifier}"
-
-        return proto
-
     def process_proto_function(self, ln, line, source):
         """Ancillary routine to process a function prototype."""
 
@@ -1598,18 +1541,9 @@ class KernelDoc:
             r = KernRe(r'^(\S+\s+)\(\s*\*(\S+)\)')
             self.entry.prototype = r.sub(r'\1\2', self.entry.prototype)
             #
-            # Handle special declaration syntaxes
-            #
-            if 'SYSCALL_DEFINE' in self.entry.prototype:
-                self.entry.prototype = self.syscall_munge(ln,
-                                                          self.entry.prototype)
-            else:
-                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
-                if r.search(self.entry.prototype):
-                    self.entry.prototype = self.tracepoint_munge(ln,
-                                                                 self.entry.prototype)
-            #
-            # ... and we're done
+            # ... and we're done. SYSCALL_DEFINE*() and TRACE_EVENT*()/
+            # DEFINE_EVENT*() are handled via xforms_lists.CTransforms
+            # inside dump_function().
             #
             self.dump_function(ln, self.entry.prototype, source)
             self.reset_state(ln)
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index 15f6f21c7a9e..aa82dc927ef1 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -17,6 +17,98 @@ class CTransforms:
     into something we can parse and generate kdoc for.
     """
 
+    @staticmethod
+    def syscall_munge(proto):
+        """
+        Handle syscall definitions.
+
+        Turns SYSCALL_DEFINE*() into a plain C prototype, e.g.::
+
+            SYSCALL_DEFINE3(setpriority, int, which, int, who, int, niceval)
+            -> long sys_setpriority(int which, int who, int niceval)
+        """
+
+        is_void = False
+
+        # Strip newlines/CR's
+        proto = re.sub(r'[\r\n]+', ' ', proto)
+
+        # Check if it's a SYSCALL_DEFINE0
+        if 'SYSCALL_DEFINE0' in proto:
+            is_void = True
+
+        # Replace SYSCALL_DEFINE with correct return type & function name
+        proto = KernRe(r'SYSCALL_DEFINE.*\(').sub('long sys_', proto)
+
+        r = KernRe(r'long\s+(sys_.*?),')
+        if r.search(proto):
+            proto = KernRe(',').sub('(', proto, count=1)
+        elif is_void:
+            proto = KernRe(r'\)').sub('(void)', proto, count=1)
+
+        # Now delete all of the odd-numbered commas in the proto
+        # so that argument types & names don't have a comma between them
+        count = 0
+        length = len(proto)
+
+        if is_void:
+            length = 0  # skip the loop if is_void
+
+        for ix in range(length):
+            if proto[ix] == ',':
+                count += 1
+                if count % 2 == 1:
+                    proto = proto[:ix] + ' ' + proto[ix + 1:]
+
+        return proto
+
+    @staticmethod
+    def tracepoint_munge(proto):
+        """
+        Handle tracepoint definitions.
+
+        Turns TRACE_EVENT*()/DEFINE_EVENT*() into a plain C prototype,
+        e.g.::
+
+            TRACE_EVENT_FN(gpu_power_status, TP_PROTO(...), ...)
+            -> static inline void trace_gpu_power_status(...)
+
+        Returns the original string if the tracepoint format is not
+        recognized, letting the caller emit a warning.
+        """
+
+        tracepointname = None
+        tracepointargs = None
+
+        # Match tracepoint name based on different patterns.
+        # NOTE: DEFINE_EVENT*() takes a template name first, so the
+        # event name is the second argument.
+        for pattern, group in [
+            (r'TRACE_EVENT\((.*?),', 1),
+            (r'TRACE_EVENT_FN\((.*?),', 1),
+            (r'TRACE_EVENT_FN_COND\((.*?),', 1),
+            (r'TRACE_EVENT_CONDITION\((.*?),', 1),
+            (r'TRACE_EVENT_SYSCALL\((.*?),', 1),
+            (r'DEFINE_SINGLE_EVENT\((.*?),', 1),
+            (r'DEFINE_EVENT\((.*?),(.*?),', 2),
+        ]:
+            r = KernRe(pattern)
+            if r.search(proto):
+                tracepointname = r.group(group)
+
+        if tracepointname:
+            tracepointname = tracepointname.lstrip()
+
+        r = KernRe(r'TP_PROTO\((.*?)\)')
+        if r.search(proto):
+            tracepointargs = r.group(1)
+
+        if not tracepointname or not tracepointargs:
+            return proto
+
+        return f"static inline void trace_{tracepointname}({tracepointargs})"
+
+
     #
     # NOTE:
     #      Due to performance reasons, place CMatch rules before KernRe,
@@ -147,6 +239,23 @@ class CTransforms:
         if xforms_type not in self.xforms:
             return source
 
+        #
+        # Handle special declaration syntaxes first, so that the
+        # declarative transforms below see plain C prototypes.
+        #
+        if xforms_type == "func":
+            source_str = str(source)
+            if 'SYSCALL_DEFINE' in source_str:
+                source_str = self.syscall_munge(source_str)
+                source = source_str
+            else:
+                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                if r.search(source_str):
+                    munged = self.tracepoint_munge(source_str)
+                    # tracepoint_munge() returns the input unchanged
+                    # when the format is not recognized.
+                    source = munged
+
         if isinstance(source, str):
             source = CTokenizer(source)
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 4baa78ca02b3..04dafae412e4 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -444,6 +444,34 @@ class TestContextLockStruct(GenerateKdocItem):
         self.assertEqual(entries[0].name, "debugfs_cancellation")
         self.assertEqual(entries[0].warnings, [])
 
+class TestTraceEventFn(GenerateKdocItem):
+    def test_trace_event_fn_declaration(self):
+        source = """
+            /**
+             * gpu_power_status - called when hardware turns on or off
+             * @dev: pointer to device
+             * @shader_bitmap: bitmap
+             */
+            TRACE_EVENT_FN(gpu_power_status,
+                TP_PROTO(const struct device *dev, u64 shader_bitmap),
+                TP_ARGS(dev, shader_bitmap),
+                TP_STRUCT__entry(__field(u64, shader_bitmap)),
+                TP_fast_assign(__entry->shader_bitmap = shader_bitmap;),
+                TP_printk("%s", __get_str(dev_name)),
+                my_register, my_unregister
+            );
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "trace_gpu_power_status")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

