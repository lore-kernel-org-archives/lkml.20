Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862433;
	b=J1QKLgJbZHdw8S3CUzjxeyKRhszH/JUF+8N8s/uj4AMYrmY9DWRCdv0Ex2lc+Te+VLc1
	 VPLaN/4RusWi+VXJpAWbqThM5Fref4C2oMfBzbLqqnBCITZcOLfKmHKbZwW8Ia9Hxygxn
	 xusp6CPQoA/S61A1d23RSgRBrLDQGAX0pcspiveNfkEz3edTj04Z9daVcaj5nduKordgw
	 y+C8t5vRKihhWsgnU2Y+QcmxDnGkCiCO2CG47aa9Gv6t//lATHhTKyDx/K23TbuM7Kiw2
	 ciwwosfTidPIXS95WxYjxwJZb5o5CWfjeDWUO7iRXurVSodmxlWt+rBuepIwxUbtCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
	b=zQpwp88VSmx4wZ66kDLSIuqOtkX2o0vsA0OmU9C0w0+TLgy1+c+PptBUhx4uJk9QqTTn
	 kr3QubrrlSCemQq83S5ZgBbglnP5LzzSGAGAbmcAQCJXetbzrsXRF+u+E/FFrrNXOJ5rp
	 bvZdQEGO8D8w6YqaBIAjj5PYxB0yEAa8Km63laYb/GPEJ9Xf/BKliooOIDcxjVlLvBIkg
	 kmzd7dY1Chzc+ACOeupTiy9GhyoL+QCNolDrdi0XU0/rWBUOrhlzkRC8e+0CfZjJeOxBk
	 wj5n7RaMmMlqw2JMvg51+m/81DDIIjYYBOKDcPSnASr1IoFpUnUKvIwHrhvkvPxLT4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE1606A88B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFE1606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6397586eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862432; x=1795467232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=WJdIBema9Fy0VVb2yMJm4K2vvVv1owxU35L0eJP8xf4aP6rtPSqyG9uFfIavMdPzli
         wpiqVTFcecByqRNwNTHoVoPvmW2xsCFgmJpreSvaxrIDlGlmLDSsRNcQdLKFRi+rnJvB
         b2gk2YPIZerYWu0J/quwLqJD0nVi6rREk6HfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862432; x=1795467232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=SyI1PTaT3a9AMMGmcVXkLvlq/jOz/dgvy2qjgsxqRcnUbHNCrDhWyF91YpmLOtZ4gq
         wcaIuB+8RXxpmve7jVhgd016YZAFHQ5WClU6lVo7QQwm7fK6vOd8zjHmeqdRiF0BxrIM
         bEToMgTmBsS+l4i6LZOxw7houjv/velobCgzPerpnbDY6AB+0A7ZtqMwCvn7n58S6Jbw
         mQiQD7drjIvBIwP8FpDf1TWMlg01gX37YsD1ILN7zh9kXhLbPIBCVcmb0vMlyCDGywK0
         dfT4DdmDjH2GoLk3n8dgB/cPQpsji3gDx1bel74bIt2o0GrYmhrQYuef5cvwgOV00DeW
         0A4w==
X-Forwarded-Encrypted: i=1; AL+hErEZjarM6UJNR3T6eOciQ8zVB1ir60IgubycFP0rvMZVSDt8Me6WIRe/aogc/MobQ9bHEl1t5OvdUOKOqlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ulyP6ZthximZGbAI/W7XY4CuxUUDw2JFapBa5/UsItpATxT6D
	6VZ9m0jx63Pek3fBaEHgedGzsRrEyELB34lZKxmJNr4q4g3xPH61ybiJ2Q2E+c4uIQ==
X-Gm-Gg: AZFdTZcjplxsdzq/s9i9wegbDvyqXsmF2IWKHRG+GlHc0hJkV7FD/WT2GH9nhgu9kOV
	iUIjOVZ6AFJcCZtqhnLUXkMXO4lj/ZzQuukbSWq9G4ysvFY066idJSDQxFmkUr7aOAFbQoHjQmh
	aCLMQEnFPMagfK3/R/yALYQR0Lrs7T4vSl0UEjcgMO0ETyUKLuD1S3IrEsnOLk6ghmzzO3uggsj
	OxCMJS8pW5Xu8mOpXFlMCCIr+2MbjwC5nCElK6xN4TkuqsDrNto3/X4iMEdzHqrmN8MtmvJmeHZ
	iZqXNyEV/ZS/bwx0P4zJBQ6dyOcnyHadlkDhEK5g5mGgz9QZUjCYpMj3bX31GCrdk0dzYmkQLT/
	LwKax/lEgdERKF8TcffQkhCC2WBpxpXy2/IQMwIChEfFKkiEkV0BUeiQSmV4rWnLXiFsZ313nwh
	A8BNLYj8EN3MDM8WTKkVwcrtZeh49MmjcCr9XmfW+56CRIsmfIVO6Yu1f2yHdJvSU+sNTrHOAQc
	lOXMeF+mB0VhvI19KbGJZIg8s3JG0NgFkEvWLmtSjy/dAjs5ds4mFivwyAytG5Vtj9oVEIUlPOr
	Xo3F9sCBMnPAJ8Rztr84Uhz7ECacX2NWAgFeLk7JkNfQxr6BaJGEkxbMjb/DfZPsPQzjhgNIPiO
	Uzq1AqjlVJsagSS7pIVwszd+9D6CvVGmrnE0=
X-Received: by 2002:a05:693c:2a0a:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-37965daa77cmr10150232eec.8.1794862431716;
        Mon, 16 Nov 2026 12:53:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:50 -0800 (PST)
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
Subject: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
Date: Mon, 16 Nov 2026 12:53:03 -0800
Message-ID: <20261116205320.1621386-7-dianders@chromium.org>
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

Iterating over a node's properties via `FdtRo.properties()` currently
crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
(`first_property_offset()`, `get_property_by_offset()`, and
`next_property_offset()`, along with their Python `check_err()` and
`check_err_null()` wrappers). When walking every property across large
device trees from Python, those per-property SWIG round-trips dominate
runtime.

Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
backing `FdtRo.properties()` so all `Property` objects for a node are
collected in a single C call per node, interning property name strings
via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.

On one stress test (walking all ~573k nodes and ~2.06M properties across
438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
~1.8x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up FdtRo.properties() with a C helper

 pylibfdt/libfdt.i       | 64 ++++++++++++++++++++++++++++++++++++++---
 tests/pylibfdt_tests.py |  3 ++
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index e4a9357d278a..333a25f27946 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
     return fdt_property(fdt, name, val, len);
 }
 
+static PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                          PyObject *prop_cls)
+{
+    PyObject *list = PyList_New(0);
+    int poff;
+
+    if (!list)
+        return NULL;
+
+    poff = fdt_first_property_offset(fdt, nodeoffset);
+    while (poff >= 0) {
+        const char *pname;
+        int len;
+        const void *val = fdt_getprop_by_offset(fdt, poff, &pname, &len);
+        PyObject *name_obj, *val_obj, *prop_obj;
+        int rc;
+
+        if (!val) {
+            Py_DECREF(list);
+            return PyLong_FromLong(len);
+        }
+        name_obj = PyUnicode_InternFromString(pname);
+        if (!name_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        val_obj = PyBytes_FromStringAndSize((const char *)val, len);
+        if (!val_obj) {
+            Py_DECREF(name_obj);
+            Py_DECREF(list);
+            return NULL;
+        }
+        prop_obj = PyObject_CallFunctionObjArgs(prop_cls, name_obj, val_obj,
+                                                NULL);
+        Py_DECREF(name_obj);
+        Py_DECREF(val_obj);
+        if (!prop_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        rc = PyList_Append(list, prop_obj);
+        Py_DECREF(prop_obj);
+        if (rc < 0) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        poff = fdt_next_property_offset(fdt, poff);
+    }
+    if (poff != -FDT_ERR_NOTFOUND) {
+        Py_DECREF(list);
+        return PyLong_FromLong(poff);
+    }
+    return list;
+}
+
 %}
 
 %pythoncode %{
@@ -477,10 +532,9 @@ class FdtRo(object):
         Raises:
             FdtException on error (e.g. invalid nodeoffset)
         """
-        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
-        while poff >= 0:
-            yield self.get_property_by_offset(poff)
-            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
+        return iter(check_err(
+            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
+        ))
 
     def getprop(self, nodeoffset, prop_name, quiet=()):
         """Get a property from a node
@@ -1420,5 +1474,7 @@ int fdt_property_cell(void *fdt, const char *name, uint32_t val);
   * function and a struct, which confuses SWIG.
  */
 int fdt_property_stub(void *fdt, const char *name, const void *val, int len);
+PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                   PyObject *prop_cls);
 
 %include <libfdt.h>
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index e2f9c6d5afe4..9c0104bfbabb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(props[0], b'subnode1\0')
         leaf = self.fdt.path_offset('/subnode@1/ss1')
         self.assertEqual(list(self.fdt.properties(leaf)), [])
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
 
     def testFirstNextSubnodeOffsetExceptions(self):
         """Check except handling for first/next subnode functions"""
-- 
2.56.0.679.gc527c65306-goog

