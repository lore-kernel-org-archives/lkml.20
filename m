Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862426;
	b=SfCU/QlyqLRNir0POA7oGFr5G9sIP8V9RI184pzeQHEPgpQneodGFvJHege0OmySXBG9
	 1Q1bXaGvd+81t46c8z9WaZylrr0r2aOZkj3gvB+O6r/iBppmNH4Jcev+Kg0nB42MfXlH0
	 aCU8/J7a/o+038Duf6+Q4ZpV0Mk8Ia6pWhpkDwq3BRZ7gcMFR54IUTx2EULfYcN7ajHjl
	 ONIv1zbrK8wT/ymPUJEDH4OqutqJRpxS0diMoqM/ULvpbsudAtx/kC8yLqap1L6b0mXDF
	 dlC+bN4q7Cj4Wq6XD3FDcdESAQbVQFhsT6NxXIc5NTl0Ch1WRMUyUSSptsDGrj6mATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
	b=4r1FuForPgCooR3QfXKgUY0IG1214/NdrnWsZzrgXNCdo2/gsDkT6lYm0WbDgYDaBJi4
	 fgs7Yh4P8OsyqPvXEPK21hR42QhFFEssWGo2rr3h6xlmwmQR8osNlQfEhLDj+DQOCSgZw
	 VdUWxsDqvA8m4Vdt4hWu8Uqm1OrOTFcvJtBDLgAW7XNWfryXiFQbVB3cRKuUNPo2o3m2Q
	 2Lk0lbV1LnuB8ifOba2sNtHhlk9EDfsAGQ+7OKsb//GbJSHZUyUTuCVHt/5XVgOgf4BhV
	 kZiA6jYkMov/hIr6NNX1yn/bvBLRYx8YruL2QlLGMwYXlHg1ICA0HjszY5TqVR5+x0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE25606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE25606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8051782c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862425; x=1795467225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=Wy3lwnyDZ6zg6JvnqVw+Q/KYJREuy2Q3beiqnUTSYCrndQpeCc8rH221h4OKOy2ROo
         Pdg2opaFsrwFCCzWU6FuOLum2O/Pjbn8L5vFnhCK8eMS87eJlGHP47DcwyPy1EMJa77/
         9TXaubiHuLlXfwDME7+tGH2EVSAU5IQ/NowgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862425; x=1795467225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=PBLv2NM08KVtNx/T+b6BA8yYDjejV/d7BZ0zW6jSGb4EpcA6AeiY9iXknU8obgAWbq
         W5pycRM1h8r9lE+wmZETYkx45uiOZMyqoyAu6WJytu17OlNQiU409YP3WcH+OyhFeIGH
         Pg00fAVuiZrVKOuzH71tOtEGd4d4gDenpkb7YwEtTn90L0bolsXwobDseZSaAe7hzSCy
         dZdNuqJ0m/lGAIAmEbT6LFf7UBlIF0SFYe6ueQ0PRUMpNZwa0DXwZ+L6A3AtrcJEPrUt
         LXvhMxJSFsi5aJ1egu6sZ4Aw4Y56Q54utHclajw9AWYIffqTKvo5yEckABiQnkto+tZI
         dJNg==
X-Forwarded-Encrypted: i=1; AL+hErGBuCvTCO9JicvDvfvU2btInJIeTjRZrWuJc8lBjl745kttIM8j4vsctjPEdDc5vc2IR9WDzrIkC1Zijls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NI8O+u9PvMDdrVtgNvZQxcTAAoBjuVu++hKc5RG0jG1PkaF/L
	XtjvPFsrQGycCD1wYUSk7yRJ3oX+ogmicpxqSPMN1ChwlUybCyfYOCkFh0T1+RRdMA==
X-Gm-Gg: AZFdTZcp+rQq4VntMLWbKuEzD1VO/5iDuH1UVqPggHLKXjVe8UbPfSCl+wUj/zuo4DI
	t+uF2cZYToGTfSdxx8JI90kgXUbihuLhP0ApwhcN6OWwVwU1+rFZP61H6mp5pvIjBcX+1xxhJ/s
	+VuW0dNrtK0PYCGhULzbelwP/vriMVDl2PN6eZAbVyx3NujlyTyrHGRoPu7RPu5z2+4SI7FSlBT
	PqetbYq8lmAl7/YtBveBhDeHWqB4XKq85uDGUzV/h34evR5jCUq/+K3j2+UDFKrIO5lyZZTOeH2
	1OJgB4YsqKbwpJYuvBIR8Vm3vXWh0eV2tb6d7p2JxI/AWIJq+/lLwppl5VC6lWIAUPoW+6rcR8s
	Yart0OgIS0aBOqzEOdL+tStQFr/knAac8pZP7GqPGY3RJPoj7z9rTErk/Xzdgc7gKQTH8VuadwE
	M91dNjD90X73fBaM5IHAl3B+nzoFPinQOF/MPdlR3s8Rtp/0Avkcld5izVQ258NB57Wzl98o066
	/q+tfHY4+k6BXn0PyCj1rDdSbUBgiOS8sqDSMGgI2mJwaXrJcaN9dSMh0pLZLuE+yLx/ZH/3M71
	xf25T0Iwf0fZ9LKHhqYOfBoO2/8nHhtQSCHsZ4yTQ/ZioSjIO3VBufPfzOm6xYAEH86it3DQlSS
	47DSL8GrLl3OOyA==
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr12079365eec.32.1794862424700;
        Mon, 16 Nov 2026 12:53:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:42 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 04/14] pylibfdt: Add Property.from_*() creation methods
Date: Mon, 16 Nov 2026 12:53:01 -0800
Message-ID: <20261116205320.1621386-5-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`libfdt.Property` provides `as_*()` methods (`as_cell`, `as_uint32`,
`as_int32`, `as_uint64`, `as_int64`, `as_list`, `as_uint32_list`,
`as_int32_list`, `as_uint64_list`, `as_int64_list`, `as_str`, and
`as_stringlist`) to decode typed values from a `Property`, but lacks the
corresponding creation methods to construct a `Property` from typed
values.

Add `from_*()` classmethods mirroring each `as_*()` method so callers
(such as `DeviceTree` users) can construct typed `Property` instances
directly without duplicating encoding helpers on `DeviceTree`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding Property.from_*() creation classmethods so
  DeviceTree does not need its own get_*/set_* wrapper methods (David
  Gibson)

 pylibfdt/libfdt.i       | 56 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 49 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 68f22e316ece..ff9210d123cb 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -962,6 +962,62 @@ class Property(bytes):
         parts = self[:-1].split(b'\x00')
         return list(map(lambda x: x.decode('utf-8'), parts))
 
+    @classmethod
+    def from_cell(cls, name, fmt, val):
+        return cls(name, struct.pack('>' + fmt, val))
+
+    @classmethod
+    def from_uint32(cls, name, val):
+        return cls.from_cell(name, 'L', val)
+
+    @classmethod
+    def from_int32(cls, name, val):
+        return cls.from_cell(name, 'l', val)
+
+    @classmethod
+    def from_uint64(cls, name, val):
+        return cls.from_cell(name, 'Q', val)
+
+    @classmethod
+    def from_int64(cls, name, val):
+        return cls.from_cell(name, 'q', val)
+
+    @classmethod
+    def from_list(cls, name, fmt, vals):
+        vals = list(vals)
+        return cls(name, struct.pack(f'>{len(vals)}{fmt}', *vals))
+
+    @classmethod
+    def from_uint32_list(cls, name, vals):
+        return cls.from_list(name, 'L', vals)
+
+    @classmethod
+    def from_int32_list(cls, name, vals):
+        return cls.from_list(name, 'l', vals)
+
+    @classmethod
+    def from_uint64_list(cls, name, vals):
+        return cls.from_list(name, 'Q', vals)
+
+    @classmethod
+    def from_int64_list(cls, name, vals):
+        return cls.from_list(name, 'q', vals)
+
+    @classmethod
+    def from_str(cls, name, val):
+        """Unicode is supported by encoding to UTF-8"""
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, val.encode('utf-8') + b'\x00')
+
+    @classmethod
+    def from_stringlist(cls, name, vals):
+        """Unicode is supported by encoding to UTF-8"""
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, b''.join(v.encode('utf-8') + b'\x00' for v in vals))
+
 
 class FdtSw(FdtRo):
     """Software interface to create a device tree from scratch
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 26915a015ccb..e2f9c6d5afe4 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -414,6 +414,16 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(9223372036854775807,
                           self.get_prop("prop-uint64").as_uint64())
         self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
+        self.assertEqual(self.get_prop("prop-hex32"),
+                          libfdt.Property.from_uint32("prop-hex32", 0xdeadbeef))
+        self.assertEqual(self.get_prop("prop-int32"),
+                          libfdt.Property.from_int32("prop-int32", -2))
+        self.assertEqual(
+            self.get_prop("prop-uint64"),
+            libfdt.Property.from_uint64("prop-uint64", 9223372036854775807),
+        )
+        self.assertEqual(self.get_prop("prop-int64"),
+                          libfdt.Property.from_int64("prop-int64", -2))
 
     def testGetIntListProperties(self):
         """Test that we can access properties as integer lists"""
@@ -425,6 +435,28 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.get_prop("prop-int64-array").as_int64_list())
         self.assertEqual([0x100000000, 0x1],
                          self.get_prop("prop-uint64-array").as_uint64_list())
+        self.assertEqual(
+            self.get_prop("prop-int32-array"),
+            libfdt.Property.from_int32_list("prop-int32-array", [128, -16, -2]),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint32-array"),
+            libfdt.Property.from_uint32_list(
+                "prop-uint32-array", [0x1, 0x98765432, 0xdeadbeef]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-int64-array"),
+            libfdt.Property.from_int64_list(
+                "prop-int64-array", [0x100000000, -2]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint64-array"),
+            libfdt.Property.from_uint64_list(
+                "prop-uint64-array", [0x100000000, 0x1]
+            ),
+        )
 
     def testGetStringlistProperties(self):
         """Test that we can access properties as string list"""
@@ -434,6 +466,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
         self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        self.assertEqual(
+            self.fdt.getprop(node, "compatible"),
+            libfdt.Property.from_stringlist(
+                "compatible", ["subsubnode1", "subsubnode"]
+            ),
+        )
+        self.assertEqual(
+            b'', libfdt.Property.from_stringlist("empty", [])
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_stringlist("bad", ["embedded\x00nul"])
         with self.assertRaises(ValueError) as e:
             libfdt.Property('bad', b'no-nul').as_stringlist()
         self.assertIn('lacks nul termination', str(e.exception))
@@ -552,6 +595,12 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.fdt.setprop_str(node, prop, TEST_STRING_3)
         self.assertEqual(TEST_STRING_3,
                           self.fdt.getprop(node, prop).as_str())
+        self.assertEqual(
+            self.fdt.getprop(node, prop),
+            libfdt.Property.from_str(prop, TEST_STRING_3),
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_str(prop, 'embedded\x00nul')
 
     def testHasProp(self):
         """Test that we can check if a node has a property"""
-- 
2.56.0.679.gc527c65306-goog

