Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570628;
	b=MRQl1aTu4eVelgf5iAT/+l8OMxXpRyUnRR3OS0wvlti91THeqmN7eXDtT3AXMc2JLo+a
	 ykxJDHJXwkaRiRjiuh1zs9jrIiBqUFPqdM8F1Hzz/hUhplh9EravPUHmjtXIGTxS1WGLj
	 rFwwKSQkl6JIDF2aSQnyvGUT7spv0h9czZbzf+fE1cMW/eVQLUZmrcLZifAJj5G2qD+d6
	 rGcxO7joohYoi88F0czJsWu8PO7kvlQnTUoo2YiDgQ1biABt5X5DVQZ81HYvYPOX3MKVL
	 KiCT2chHd/1echgvmxXgm7XZi8lXcFyJqTxd3VmdeYHhW9FViBlk8UhC59uWA6B3MHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
	b=GdHQrgwj+o474uuE3gkwp46f9lW7TcItjF2KwmthvXD+VzHJRO4pi7SoibSykjNQhAkz
	 l1hdk+n1s6blpo3K4eiy4DDV2H7n6qupEZ5ABQl6CfgPHXkdKWPytgfgQylBRLtUvBr2R
	 ALdZ7YFZb2gGzz/FM8akhcxZ+yL+4rkL4yOQHHDqCgsf1fIs7dzs+RSGY6vuqqbWATZXD
	 83OTm2AGsOBu0jtbIGOd2gOjCj4+tVCHHS0gQizt9S6qKHnniBRS0spJARgqCPzpn7ee4
	 RTXct50zWKx4FR3v608MVMeA6I+IOzC9uMEDOuFMTc4rujUmKz6kxw5u6LxU70YowHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WoE18Z6c;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAF5606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FAF5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WoE18Z6c
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so4051160eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570628; x=1794175428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=WoE18Z6c+/xgRgl2yQ6EzvQtQPJpXsFgK8eXRNL/5kN2kj7F2sVZt99P/n5wPllgal
         9kdtr/WOeqd1NYXA34Anjq//dAGL8q7bzH6YINQKbwCumA12JrK5w4ToXdi4tbNeIdfD
         Qx87N3IscLV2421GCrHZe1a5J7NEJ+PdgTL2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570628; x=1794175428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=RRpJ3Gk9P8ho86IcgdEveKqMhRTo5rpspOAnVR0QjUbbhF5Z1gwMb6q573AhlAZdCc
         kFIM3I4+aFUmbSnCjH/1yp6183aNW5Cfwd5GxMZMdA+YsU30f6QoMU5g+pE28Vbboh5K
         9GzuNrFeTGBGvgwC43cCQoKNDTlaobaZ55fnWdkRsSY7OBDrOQE4QEaDDyTAI05C+cZq
         B5kVa+AFm7csDudrrUMvOl1LdL4ucXC++2aGZRA3c/oQOGPEOWRcbpXTQ00QTutKUpv0
         KrDn+5Mfu7jsRe17VEcQ6ejK3wJuU0hPf+rt5abfa7S3h4E21LTFhqGUUUhjeipI9mj6
         OBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgg8WQU/YzdoeJmeptMj/tpwfx/muFTsxmxqfCavusnUr8Af6eA/OQOo/RDSwlUT6XLLUkEVVoiXl8Sc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9n4jPbOaawYGlJKTcPTG62Q3T6yDhZghYKktXLKBlr7IBsBwl
	G8n35KhIUdIwa3EzrgwTW9GcBEP0YPBpk4b9XPt8RiSXQXYJ0DmxeOQaulVmmNkT1Q==
X-Gm-Gg: AYBFou0yDsCw3pqejoRSEkRtfDIbFSBAa+aSWhCKkQd/E/QIMV1+PpCsx7oDP/8oQf5
	5QvxnxcWenMHf0uNnLJ1a01qH8vTYsx1yqu+f6TgN15VF11WrdVlwjXQvKN2S5aId152xYECG2/
	RFMeg+KRkOQm3BPVEeGtI+rn85lNTCoqlIx3etGwrwd7tVYVitu0nzVNq06irAjI+i2dfe/fOLc
	g6ZrasL+j+olOm8puZIDzi8ZUHVBZ2eMNsdDXDfo/TqJENjkouNbqYev+p5KgUczG1F2appamw5
	BxsPw3k07kU2s6g/5XUliyEsG3r8FmT9dckwBIC2umt344hiLD1FJzwvCVK7tLF+y8CVc1qivKH
	DrEosBPH0dfW9o3L4qK1LmipgzYoVKPYsM7hHPTD5oO0M/94P9fmiOi/0TULCtNJlf+kVRhK4g6
	1tlC44/p4sZ4iSQqv5heJWG22cTzw+RqnifXFbdA3PkqerbDQcMMIOLVoku2Cyq60/2t7Hjwluk
	5hbryEdEoXIYMaI7oJJ6ZMa++fv7SQ15YBB/dGToVGOWthnfzVGgwBkux/qcmhMEeJ8PMwT9l0h
	yZ+RsFMvdQbsg01DYDUqc6Ktdy/iW41zcs314Gr7iCVPqkCV4/GHob0EO9VQvwRdntY8ttn5C0D
	tw1ESfmnogKbYmQ==
X-Received: by 2002:a05:7022:1588:b0:1a3:d292:f696 with SMTP id a92af1059eb24-1a949f6c426mr17161036c88.16.1793570627439;
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 06/15] pylibfdt: Support copy.copy() and copy.deepcopy() on Property
Date: Sun,  1 Nov 2026 14:01:13 -0800
Message-ID: <20261101220224.1436242-7-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

`libfdt.Property` subclasses `bytearray` and has a two-argument
`__init__(self, name, value)` constructor. Because `bytearray`'s default
copy/reduce protocol passes only the raw byte buffer to the constructor
(and does not copy instance attributes), calling `copy.copy()` or
`copy.deepcopy()` on a `Property` fails with `TypeError:
Property.__init__() missing 1 required positional argument: 'value'`.

Implement `__copy__()` and `__deepcopy__()` on `Property` so shallow and
deep copies preserve both `name` and the byte contents, and add a unit
test in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch in v3 to support copying Property instances in DeviceTree
  (Simon Glass)

 pylibfdt/libfdt.i       | 6 ++++++
 tests/pylibfdt_tests.py | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 51db9535bd39..fa5f499ed96d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -908,6 +908,12 @@ class Property(bytearray):
         bytearray.__init__(self, value)
         self.name = name
 
+    def __copy__(self):
+        return type(self)(self.name, self)
+
+    def __deepcopy__(self, memo):
+        return type(self)(self.name, self)
+
     def as_cell(self, fmt):
         return struct.unpack('>' + fmt, self)[0]
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 18730965bd02..ae46b29a8f5c 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -4,6 +4,7 @@
 # Written by Simon Glass <sjg@chromium.org>
 #
 
+import copy
 import struct
 import sys
 import types
@@ -192,6 +193,11 @@ class PyLibfdtBasicTests(unittest.TestCase):
         prop = self.fdt.get_property_by_offset(poffset)
         self.assertEqual(prop.name, 'compatible')
         self.assertEqual(prop, b'test_tree1\0')
+        for copied in (copy.copy(prop), copy.deepcopy(prop)):
+            self.assertIsInstance(copied, libfdt.Property)
+            self.assertIsNot(copied, prop)
+            self.assertEqual(copied.name, 'compatible')
+            self.assertEqual(copied, b'test_tree1\0')
 
         with self.assertRaises(FdtException) as e:
             self.fdt.get_property_by_offset(-2)
-- 
2.56.0.317.g454f8302e1-goog

