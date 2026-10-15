Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60D38330C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082787; cv=none; b=uur5GqHW8++F5R+8fMj/7adiHmCVRnHvoSIN2PVtFVT1iBrX7P8nu1fgUBEeY5z6QZEFJarzd3afciUGrUpCu1z22WrotA9QADLxRLSlz4/QZpJIxhWwoU3rGwNRCcSCZwznsAgZXTpmULTjKQjlQ55cTw9uNZaHxWjadYSgzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082787; c=relaxed/simple;
	bh=e8AVypFcDpfdqFKE+7LYw0E3D2q4xn1i6UyrrzKEcsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+AerrpyktrA5bwDTlmegOKKfZXZ9lE82AgoWXFyJ1jtaxQ5kkMQcTaAWYvkovPvjP0ti57SQJX0dGW/YH1dJOC0W2PKth5Jw0hXEr2Olh3TJHkrkrzXlxpRGJpQeb5wLRIw93w8CG4M3xzSgXGGdndq3Jx3sd8eydALTqdzqPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E54S7zeW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E54S7zeW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4887dbe4f2dso555071f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082776; x=1792687576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzeUoH4s3R1vjJ6KljgBZ8kapLArpobGIe88CwWkAgM=;
        b=E54S7zeWXEg84RvSAk3CujpXeA544CpbGqTgiwxcTgnRV9JJg4bArgQX42ZifVvQMK
         2zbaP0mFzKRXb/F7Ut82Rbc8LUNdmIsHVdezcnnjy4u1vjwvv24iMuCTrgjwV0f79wYK
         i7Lv+R2AJKMYuM4/Chp3Qmt2AuozyzxaRtjt9wY/VasmOUgEeilrYyfZ4IRCm1oXTf5L
         dAjdm1pdoZP7/EpCkgWD/h/a0N4SvwbiNvr6u9apsiTYOx+UIMjoC16lWu6IzqWsQTST
         RL66+6V6a0OkHeCF+mwTX0dWOvhse03Bpm/YfVU2Zhm1sczTA/paFixs6F1pHy8v641i
         +rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082776; x=1792687576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzeUoH4s3R1vjJ6KljgBZ8kapLArpobGIe88CwWkAgM=;
        b=g6k7BdUH7+TWIElAFJsGUX1DLTlnrErVvxu2WyUy7VezJX7xy8iWvn7pYQSWspXQXC
         EvcjbXGl93PvtyrkoUbJA+A5obcaMtzunbp9Lce2Kq0nxdnbxC1HhfuClD0Qj1GA+ugQ
         fjTCGMzJgwq5UYW/pSi0JwRl1x+EyxiwvkgYjAJvXuJwOaxvT8goDH0VTc/a+I63Ztns
         T8fPJnAqphGXNagvMa1yb0mvbstZrScEZ+TGZWTa/PV4jGoM5PuLVhxtIOlIwo76DCYy
         GWrSK0ApAkJzPtGkxsz8DfuSal0BHm9Z0xCULbLljCKP8qyCKNhqQzua5VWpHazs5wj7
         RRPA==
X-Forwarded-Encrypted: i=1; AKwUvBxPGrjfQhPVcI5i+Yts+G80dqt39C4/3U/rQTzzSBQbNqTX8zgMKOwxrNgXPwEaNAmzJ7ifeECgLRIZgxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuj9OsiRaq0MScvmRxtjrvyU31S9a7FIokp7EYIK73HftwilJr
	DTbH+vNg8TgBzjVuhuZMbDXcrSpY+AEA3a/G965noQYzE68GXWFu6UNw
X-Gm-Gg: AYBFou2lk+tiYjIAzjHkHJjTfq48AZk8rHKT6KCTtsWZ4KJGhnXpMruuNiE32QiUszE
	VznwNHEdabZGq8MxB4mz20AKqi7VFT3Y3eSoU4FaGcXwnSC/4cIXWIvbuv/hyDCh3Qny2gpeYmC
	vpWGopyCDat4D+bE3gxu/O+rc4Du5HgAf43BlRzJfi9ESsWgGAHsimTkld4SoERs6WEmbCEgSWW
	vbU5C9nPgmZNZ/9VwpQWmXv2ReUEQJ7EXzDRMeFYDuXKXWCcleB7J0WVdfGU8hikBhLVB6bl4Us
	c7kdCSTzPcBbvVpO+GkEP531idm6s2GGrPHk/dS+DzMWtwZGpnQ2OpXb9SLRaXIOsaezxj6rQgz
	WjyPtIxMmNJmesgRo0B1DGSQ6CTfll5iqI5OFKVBvE/xG1adIaLul6vKWl7SqnkGyVS2t7KocRX
	MxFV7IKjegpLev9Sp/gEl9sVNOY0uPgPU+LLC7gFdjACHGZFX7JMUeVic6XlXNL6pf6ikl5w8Kk
	DqUDP3t5B55gyDzZJBKuhrtBMZn9oY=
X-Received: by 2002:adf:e00a:0:10b0:487:8ba:8b4c with SMTP id ffacd0b85a97d-48dba79fbf3mr27881997f8f.1.1792082775368;
        Thu, 15 Oct 2026 09:46:15 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.74.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm19110712f8f.54.2026.10.15.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:46:14 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
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
	emmaonana18@gmail.com
Subject: [PATCH v3 1/2] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
Date: Thu, 15 Oct 2026 17:44:47 +0100
Message-ID: <20261015164524.14066-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015164524.14066-1-emmaonana18@gmail.com>
References: <8733u7t8xq.fsf@trenco.lwn.net>
 <20261015164524.14066-1-emmaonana18@gmail.com>
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
TRACE_EVENT() and list them explicitly at the call site in
process_proto_function().

Add a regression test for the gpu_power_status declaration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 18 +++++++++++++++++-
 tools/unittests/test_kdoc_parser.py  | 28 ++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 80d4245acd17..a65bda3e81b9 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1545,6 +1545,22 @@ class KernelDoc:
         if r.search(proto):
             tracepointname = r.group(1)
 
+        r = KernRe(r'TRACE_EVENT_FN\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_FN_COND\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_CONDITION\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_SYSCALL\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
         r = KernRe(r'DEFINE_SINGLE_EVENT\((.*?),')
         if r.search(proto):
             tracepointname = r.group(1)
@@ -1604,7 +1620,7 @@ class KernelDoc:
                 self.entry.prototype = self.syscall_munge(ln,
                                                           self.entry.prototype)
             else:
-                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
                 if r.search(self.entry.prototype):
                     self.entry.prototype = self.tracepoint_munge(ln,
                                                                  self.entry.prototype)
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

