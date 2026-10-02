Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F252E888C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908508; cv=none; b=d97H9Lm5x/Rkdy32wWvGLaUWrQptONrHTDPvBR5V60I1a0xSh4F+BeKj/3zUaGbvg+KSe8Sg67YEakWUyFxFTUCgLYrHnZUQhwqaVJ9HPFNGpAr3ifyLuJCTkvNQQB30tbpzFFkC3Vr5PgsbQh6fHcLtQHhj6PEagPjd61ZrCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908508; c=relaxed/simple;
	bh=SXO+SobDH6cVcgzb3z/5p2jgvfKdpafjqM7lqmZB1AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0ybWLBsNkuhwrIWMdzhE/C9glU5DynpSc9IROxOyQp75nr+eXJS58mFHpjGeap8gGEqHTeHH3HqWsN3XliyGkuaO5CGZNg97OvrpQ+5qeGB1NZL3QPPpzZLXZPTKwtiPKYcOJab1kblu3twO3POqs3dbamfW49Wa/maURgBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxH7ySt0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxH7ySt0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbc3db5fbso3460925e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 19:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790908505; x=1791513305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rnR4B1VLG/A6C9Ykh3FwKXCJ1NovidmATqbVT+/lH0=;
        b=hxH7ySt0oHHAGg2seCsaFX6ofPyBlVmu/rAX9Or3NzUdFCAx9srE/zGg0KSz/Xrj+F
         GD+BbWmxwMxAgq3D8o/KqVpyEPAohJ7JnqLFOB1cm90iJJJv40dUjmT0cFHyjgsv1kcm
         Q5Okd02OEGZMYs0dYtqJaSKpo5gG0cxHvh8UOrl0ZW6xGHv9i91haidy/edG+BZTDrxO
         vJQZw+jp+uiO8TShkOjFYpfOP82hjoSpj/RyFbRmszr7dBOodUQAORVDj0xue+y2KCo7
         NVU9pm7Ju/6VZxBBNyFfEv8U8BmpA/cr81tVxituKzRMF2RwuIg1Ll+yS8Y2eZDYpgPB
         cviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790908505; x=1791513305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rnR4B1VLG/A6C9Ykh3FwKXCJ1NovidmATqbVT+/lH0=;
        b=TUCQRJR851NuqD8zsUFBnanal+iOeW1hhOsauygDk1spyjqRzewdvhsvgAR5nLwoU7
         rIk4DJ2g6QI3XbMlzZrQzWkIFHKk6Sh2j7tHJ1A8h/JdIuXRYKOeGyom6A2AYMVOGX7D
         gBAll8MFAj6iCCTrsXeIPgeewRRRnMfmBW6smaFNV6Ahmhl+AA6yjcDU1n928ASiYsQd
         6hwbBzC4CQU62CZPoZx0OZxhy4HUFZF/F1NxoiSp5QbsPm3AzfKIJLwwY9SXkjKYTAfM
         xGd7x6yYXgqGLDpeMNL8oPbjprL1YGcf0U6ICLFJBfyoOB3CeQsTcNU8dJHIq064Tt3v
         5e7w==
X-Forwarded-Encrypted: i=1; AKwUvByoEipXyv/lSDcyeWUBhTyyjkcJNN9eR7/OkWef3ac/+zGjnTreeuqY5IjItoK/pYwxvZbdaaILZ98jI0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mYAnqf/FAhL2zKr9jdKPsA7ORcJTXNbq2YNpH30IYaQz0sw1tL
	NOBDV80IEf+Vli34Yq+Krl7B0YFgcC7p47OWQUalYLs2rpB0Ps2FIQkM
X-Gm-Gg: AYBFou3JYfnZU+1KwhYHlt2rEufQt+B9dXfvO486GFbg32J7vEf8ph8zRge9MRbksHv
	6/aVdeH/zJ3u6Tf+7KwVvYhh+IWdBQtH9YAshoLzRgN1fknTZ8dWNwB4XJPSOOya3NXhLyrL2sC
	Iv1udZo28KiBfAmPOk4c9Yu0s4tV17C1ARfSMPMrdUqndrJKBA4Ky3ZJtzzoclyAwaOabfdS8E6
	X73Dt6oLQlTbjyt3uQHDfLAoFyluyqyyzaZ1Jw86Zq69c/aPy7DokgBhwsMLDmPYsGS9YUrK07f
	t9zvBgjAVUR7kAIw46X8GYUfreXVR23WrsnO7GWwPSukQH8FDPI6xH924Oq4O8Hb8ahDhC0rNgT
	oBVT5qAkQ75VWk9c8qtZqHxogYlnjwTDWAlBceUemli4qC8WO1bbSbpApC4oqlf+dQN1IdP4+nW
	hbTuVrQymGdHt9/2T9osp+XbgdvQzCdXt7urLc2FHcvd3SAIhNFO/tEhHDucASgOs5EMY7EfuiF
	Od8t6nqcHeeYJqq0uw9nA==
X-Received: by 2002:a05:600c:6217:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a027452677mr24180105e9.0.1790908504828;
        Thu, 01 Oct 2026 19:35:04 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03043fae5sm16283935e9.0.2026.10.01.19.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:35:04 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
Date: Fri,  2 Oct 2026 03:34:56 +0100
Message-ID: <20261002023456.19470-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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
index d9ad1ddc87dd..28c325665c17 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1542,6 +1542,22 @@ class KernelDoc:
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
@@ -1601,7 +1617,7 @@ class KernelDoc:
                 self.entry.prototype = self.syscall_munge(ln,
                                                           self.entry.prototype)
             else:
-                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
                 if r.search(self.entry.prototype):
                     self.entry.prototype = self.tracepoint_munge(ln,
                                                                  self.entry.prototype)
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..398e11a8737e 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,34 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
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

