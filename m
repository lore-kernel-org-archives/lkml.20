Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760772;
	b=vsaCOgmOTmeRn2+d2ozMLtwPayyasADK9EwRs9Jfge479w/YY85Gp7UW9sdonzu/4meG
	 jXs5NaRX0Q3tmVSbSgZSsffrIcjZJt9wz0FFF7eUjOroVplH87PXP7TXJoYWQ/ydNwu7T
	 uWQkREDQLYCxZW1qtpM4Yt0r5/yuvwfl3Vt9dyHJW2A+8m2TtjbKSxKK0HfSx7qWEHtcQ
	 msyz91uGdEyeJAvukCVEbEpd6LvIvs/16heRXVTEMkQreVm7HUkgGin9hW8hCWTrKtEuR
	 vFRPH5TxtkthXjXYEqGto0tka0ey+hs2A2SdtEeEgdfcBF8RRuoh/F+wWG4wlHEsOfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jBIekiO+tRXvuI9quCRBdtVxapNGOTwl1bJb5qI3FRc=;
	b=BeHFxDt6y23BP3qB4HbyvB7wvaJJRT8teDvXNuVooPvz/DEXpwvJy/19OO6R9mmspQPa
	 8u8DcnU0ypTuOQpXp/tAf3lbJuq0GH+PWa4PN3KCxB7Ltr2b8lFPCsi5079xABRzY8L+F
	 H5cT0dFWBoX3VrvJwh6Tr3VohX/Z8axvNp3gpsVKFvC12WKofB+meUT35iow9/tGFZidA
	 mRD7u//1o3A55Yf7FWqF+oWDPruYE4rP2aSwnBgFB9z3/HS4bLVd0yUUuBikBgOCZR5kB
	 sYozSF+q3zZGsJRWE8qS49oLF5AM4iXMvdutuS9Dd/QdQwuaGclA4dmuQTE/4keXSqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTRniXkA;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E0606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F15E0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTRniXkA
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dc1508191so134069f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760770; x=1793365570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBIekiO+tRXvuI9quCRBdtVxapNGOTwl1bJb5qI3FRc=;
        b=YTRniXkADXfMdkHZ0t4J21gfS7qiltWNiRl5xQHGEZooeGSF8Q4S6fnn/oAbhulpMF
         JcFH2LFZXQWsrisj9r570SCWsZeIWHaGH3OwaT1dvL454JjFDulqd5U+Qn2lJfxy6zuG
         PdTcyH/zZKVKqvNnK9lALNRYa756/5rzdvS8w4EXEoAkApgwo6VGCihfl4mV9tAAQ1HC
         EyKU5dwLzLaMJhmt8UDo2ZJObPJVvdPvbWNfSMKoVf/6rYgN/qfRbD9bKXUP/rAG/1ZA
         oWEdtw5RZ/y7jCw7nZj9Ng0CAErYpL2Co2dWJXqEAv/UtnyScQJ4VAj9pc8pazIGnY6o
         Q00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760770; x=1793365570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBIekiO+tRXvuI9quCRBdtVxapNGOTwl1bJb5qI3FRc=;
        b=pzmiDt3K2Qz9HYZ89hByOZ6QAQbXN1V7Ys4p1t1SzyDCp6p4FGVVHmWSUZmLMzQ0Cb
         2NjnVNxdix07YWIbQH4VCfiqZ6ui4KD/NYohRN4prm3sMt6OkmRTb6jbVVvzC/tsJV4Y
         XaMNPZa6fMqLjXGvugh7aSOxf8UEMl3dWFtcjyE1YWgE5/hLrmgQL3oODXaXrXpMrNyV
         Ge3BPWT4fZsjn7s2rhUIyMeK1SSEomY2R6elgmPv2svqp/XUuRZVlEz8RKbBpt5OHMvK
         8s625NAVG/OS1lFLZ8+XQRxcFCI1GV40KtXhi2IvFr7NIcNBxnQyZshlkq0haVIZEMcE
         V1FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVOpQHqc33kQPZMAps4Ub2k8ivtNfMPdOdnXVqJq6Hg3h+M76oV5vERwXY4KHRu8JvrSsH1YU8EnFk6oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1B7qmAWyB3lavKKpDdA5eFjGZiI76EVKlKEW9xdy6oTEjwaJR
	YqpY1WgQZw57hhzKzeUyfn5jVhFacrs+Q89yueil4wm3/wnHTHuqb7lI
X-Gm-Gg: AYBFou0xAo/PJf4y5dt2Gx1TJ77zoqnsQ+n4Rj0o+CEc2V6uHzERym1PSFWqAUg1ReF
	rQVfTc+A2ysIMVsdcQcmnTpDjR7DkI1VexNikJ8dV8UlyCP08fwbR+GjNiWDHpKMaCHetgN388U
	InDdolY8wgVdq1DK7MHO+m8cKCXMItszQpSc53rU5KFllSq3r7pOGr36eDJITPnAJMw0VhxBHjk
	0rWldf3JkPAR6Lxd/h7I3Ws0qp8rxZZOM4dY4db9Uv2/IM7/e6u9FNbqdUZdf2yQK5m7CjORenN
	+tDL26YsxQY6vn8w9ofFphrow9VHd1fCIStTyJdWyZ21GbRw1S+FgzVNNAD7CE9zoXtx1R5uhJr
	kgowfKqarkQaZd0KUgYP6efA+IP/noxPFYONo7ob9Afo2dA/gvUmCvI4x4wTvTBY5lft3jfhulO
	Eb8NV+y4qzW1qBkA/CC4NrtUyWMLIyo5b2KIPM52EsusK7NSPKuHBzU8UQ1lbDs57zG3v4q3pzA
	W2RD5781LzzgUDb9MR7y5KaEV+D2wQoo4N6NnVjgjrp/UoqDRWDdpAMVoKmBzr+Wvwh7+3a7SCO
	GNZB
X-Received: by 2002:a05:6000:2903:b0:48a:f5c5:d077 with SMTP id ffacd0b85a97d-48e38557d49mr3407667f8f.2.1792760770071;
        Fri, 23 Oct 2026 06:06:10 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38061c7dsm4658755f8f.54.2026.10.23.06.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:06:09 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v2 2/2] docs: kdoc: handle TRACE_EVENT_FN() with CMatch
Date: Fri, 23 Oct 2026 14:04:15 +0100
Message-ID: <20261023130444.26270-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023130444.26270-1-emmaonana18@gmail.com>
References: <20261016231148.7b5a88ef@foz.lan>
 <20261023130444.26270-1-emmaonana18@gmail.com>
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

kernel-doc fails to parse tracepoint declarations that use TRACE_EVENT_FN(), e.g. gpu_power_status:

  ... Unrecognized tracepoint format ...

  ... expecting prototype for gpu_power_status(). Prototype was for TRACE_EVENT_FN() instead

Convert SYSCALL_DEFINE0() through SYSCALL_DEFINE6(), the TRACE_EVENT() and DEFINE_EVENT() families,
DEFINE_SINGLE_EVENT(), and TP_PROTO() to CMatch transformations.
Add a CMatch back-reference form that trims whitespace around selected macro arguments,
and retain nested commas within arguments.

Add regression tests for TRACE_EVENT_FN() and SYSCALL_DEFINE0/3().

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/c_lex.py        | 19 ++++++
 tools/lib/python/kdoc/kdoc_parser.py  | 94 ++-------------------------
 tools/lib/python/kdoc/xforms_lists.py | 39 +++++++++++
 tools/unittests/test_kdoc_parser.py   | 56 ++++++++++++++++
 4 files changed, 120 insertions(+), 88 deletions(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index 532e2c5a815e..4adc1b211b54 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -338,6 +338,11 @@ class CTokenArgs:
 
             sub_str = KernRe(r'(\\\d+)[+]').sub(r"\1", sub_str)
 
+        self.trim_groups = set()
+        for match in KernRe(r'\\(\d+)-').finditer(sub_str):
+            self.trim_groups.add(int(match.group(1)))
+        sub_str = KernRe(r'(\\\d+)-').sub(r"\1", sub_str)
+
         self.sub_str = sub_str
         self.sub_tokeninzer = CTokenizer(sub_str)
 
@@ -448,8 +453,22 @@ class CTokenArgs:
         if pos < self.max_group:
             log.error(fr"{self.sub_str} groups are up to {pos} instead of {self.max_group}")
 
+        groups_list = [self._trim_group(group) if i in self.trim_groups else group
+                       for i, group in enumerate(groups_list)]
+
         return level, groups_list
 
+    @staticmethod
+    def _trim_group(tokens):
+        """Return macro argument tokens without surrounding whitespace."""
+        start = 0
+        end = len(tokens)
+        while start < end and tokens[start].kind == CToken.SPACE:
+            start += 1
+        while end > start and tokens[end - 1].kind == CToken.SPACE:
+            end -= 1
+        return tokens[start:end]
+
     def tokens(self, new_tokenizer):
         level, groups = self.groups(new_tokenizer)
 
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 80d4245acd17..5057a131117b 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1493,82 +1493,6 @@ class KernelDoc:
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
 
@@ -1597,18 +1521,12 @@ class KernelDoc:
             #
             r = KernRe(r'^(\S+\s+)\(\s*\*(\S+)\)')
             self.entry.prototype = r.sub(r'\1\2', self.entry.prototype)
-            #
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
+            # Tracepoint documentation uses the short event name, while its
+            # generated function has the trace_ prefix. The declaration itself
+            # is normalized by CTransforms in dump_function().
+            if self.xforms.is_tracepoint(self.entry.prototype):
+                self.entry.identifier = f"trace_{self.entry.identifier}"
+
             # ... and we're done
             #
             self.dump_function(ln, self.entry.prototype, source)
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index 15f6f21c7a9e..315b54feff33 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -17,6 +17,13 @@ class CTransforms:
     into something we can parse and generate kdoc for.
     """
 
+    tracepoint_pattern = (
+        r"(?:TRACE_EVENT(?:_FN(?:_COND)?|_CONDITION|_SYSCALL)?|"
+        r"DEFINE_EVENT(?:_FN|_PRINT|_CONDITION|_NOP|_WRITABLE)?|"
+        r"DEFINE_SINGLE_EVENT)"
+    )
+    tracepoint_match = CMatch(tracepoint_pattern)
+
     #
     # NOTE:
     #      Due to performance reasons, place CMatch rules before KernRe,
@@ -108,6 +115,32 @@ class CTransforms:
         (CMatch("STATIC_IFN_KUNIT"), ""),
         (CMatch("INLINE_IFN_KUNIT"), ""),
 
+        # Turn syscall declaration macros into ordinary function prototypes.
+        (CMatch("SYSCALL_DEFINE0"), r"long sys_\1( void )"),
+        (CMatch("SYSCALL_DEFINE1"), r"long sys_\1(\2- \3-)"),
+        (CMatch("SYSCALL_DEFINE2"), r"long sys_\1(\2- \3-, \4- \5-)"),
+        (CMatch("SYSCALL_DEFINE3"),
+         r"long sys_\1(\2- \3-, \4- \5-, \6- \7-)"),
+        (CMatch("SYSCALL_DEFINE4"),
+         r"long sys_\1(\2- \3-, \4- \5-, \6- \7-, \8- \9-)"),
+        (CMatch("SYSCALL_DEFINE5"),
+         r"long sys_\1(\2- \3-, \4- \5-, \6- \7-, \8- \9-, "
+         r"\10- \11-)"),
+        (CMatch("SYSCALL_DEFINE6"),
+         r"long sys_\1(\2- \3-, \4- \5-, \6- \7-, \8- \9-, "
+         r"\10- \11-, \12- \13-)"),
+
+        # Tracepoint documentation uses the event name, while the generated
+        # function has the trace_ prefix. The proto argument is unwrapped
+        # separately below.
+        (CMatch(r"TRACE_EVENT(?:_FN(?:_COND)?|_CONDITION|_SYSCALL)?"),
+         r"static inline void trace_\1-(\2-)"),
+        (CMatch(r"DEFINE_EVENT(?:_FN|_PRINT|_CONDITION|_NOP|_WRITABLE)?"),
+         r"static inline void trace_\2-(\3-)"),
+        (CMatch("DEFINE_SINGLE_EVENT"),
+         r"static inline void trace_\1-(\2-)"),
+        (CMatch("TP_PROTO"), r"\0"),
+
         #
         # HACK: this is similar to process_export() hack. It is meant to
         # drop _noproof from function name. See for instance:
@@ -159,3 +192,9 @@ class CTransforms:
 
             source = search.sub(subst, source)
         return str(source)
+
+    @classmethod
+    def is_tracepoint(cls, source):
+        """Return whether source starts with a supported tracepoint macro."""
+
+        return any(cls.tracepoint_match.search(source))
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 4baa78ca02b3..1702f912c897 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -444,6 +444,62 @@ class TestContextLockStruct(GenerateKdocItem):
         self.assertEqual(entries[0].name, "debugfs_cancellation")
         self.assertEqual(entries[0].warnings, [])
 
+
+class TestSpecialFunctionMacros(GenerateKdocItem):
+    def _parse(self, source):
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            return kernel_doc.parse_kdoc()[1]
+
+    def test_trace_event_fn(self):
+        entries = self._parse("""
+            /**
+             * gpu_power_status - called when hardware turns on or off
+             * @dev: pointer to device
+             * @shader_bitmap: bitmap
+             *
+             * Description of the tracepoint.
+             */
+            TRACE_EVENT_FN(gpu_power_status, TP_PROTO(const struct device *dev, u64 shader_bitmap), TP_ARGS(dev, shader_bitmap), TP_STRUCT__entry(__field(u64, shader_bitmap)), TP_fast_assign(__entry->shader_bitmap = shader_bitmap;), TP_printk("%s", __get_str(dev_name)), my_register, my_unregister);
+        """)
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "trace_gpu_power_status")
+        self.assertEqual(entries[0].warnings, [])
+
+    def test_syscall_define_zero(self):
+        entries = self._parse("""
+            /**
+             * sys_demo - demo syscall
+             *
+             * Return: zero
+             */
+            SYSCALL_DEFINE0(demo);
+        """)
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "sys_demo")
+        self.assertEqual(entries[0].warnings, [])
+
+    def test_syscall_define_three(self):
+        entries = self._parse("""
+            /**
+             * sys_demo - demo syscall
+             * @one: first value
+             * @two: second value
+             * @three: third value
+             *
+             * Return: zero
+             */
+            SYSCALL_DEFINE3(demo, int, one, long, two, unsigned int, three);
+        """)
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "sys_demo")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

