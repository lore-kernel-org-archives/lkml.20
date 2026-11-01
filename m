Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570615;
	b=JSOr31JAZyjJS1t26Uz/5+u/Eak4+LStxQHLC0MB4Ll3VVsHz21j8XBI5fTQ4uvg9I/G
	 XQ/SQwDzg5dF/frX2At98ok+PI0HQK8whEzn9D64++H3A45tnR2EhAKjjTq61mssCZl/3
	 Hio3AVyvyx2KdY/qQz4tYvW+G9pTT1e5BIwkbGWOWhCuJf6CnNEmG+D7BxAtimf5hWEsU
	 cf7FYaDrTawg/Q+blQK36jpLfMS/zz3+NSNrNI8CPk1KzZSJgIMZXKOsPgFwHBCDmK8QN
	 sZtjW1rmjbey1mULHL6JsMTqKDev1JYwzbQBWbewNS7ZMwXIqsGuq4Bp+EbEW0ZRwoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
	b=Q3Mu9YycyP+E9SdU5sk2WrcArQSugNTzWLQvCpvsUtAvYcnpwlx3fscI8ghoHViqpdwx
	 LCuWjB6KoqsXdUFctpQTEPNktcLD+vq8JT49DzRRP80AAhaD20H6BFxBoz1RKqB75n4vv
	 qrSnEcpywOzSrZYHuaAQ68CzB5/V1ZPkwdQIMqoHMQIdJnJAqSGbzIYJM2cVDM3q94S3c
	 ANoBWN+eaM9ZiSVPJnsR+VjHzQ2uGvhQ7hCsWb/YJ9zSij8ez4y+bGKvLxq+PtsPLbJM1
	 r7bI+oKMdQtpWcWxrJWYPugQouuLkOcrotlYdY4uqK5+o+s7nPSR/XH8x0z/BjEg5Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B25606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B25606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1927329c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570613; x=1794175413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=MdKAWEDCcS2gf1aRPpXCuW2HhP+CsyqoTGCTIGDlElskl4MjosxEVfaCeln5bv1GMx
         ebAzMmoCLSUTM/8nCT8ij7Qy4duhScepSEtgdWoKzbOs7NpE99HDAm6GxzDduWjku8Kz
         mud45lC8v+zl9yZwQaHIU9pS28fM/WGDTRa98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570613; x=1794175413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=Xs0En8gvvd0g7SH3QckHsJYUh5fjAsR7ApVgXifh4Q69SJl6jp0cfGjv5RDgrrnNQm
         on7wSX+qccQrqIhKiURc53WxpTRaJVZ/5J5OECnytoo76aP+CmqIL3xXkHPnygLjuz8e
         VUjinJVdrL5zAvMVOxjMDt378899QFrSzbXASlETYwEFXuV+lgqHbr9R4SdaI9RIjSTO
         cUCeGRPbTwXBi/9xJNG2+rxtRrYI/pUHT8mhFpHyChOjX93th4ZVMXyQT35eLg6yMhde
         51PUTmVbeOlwU8322brLkUu27NU2jUexZpUDx0TL9G+7nvvx+LBCICiOJ0/dPiPscVzN
         YPWA==
X-Forwarded-Encrypted: i=1; AKwUvBxXArM5TdzpyT5DtBMLJKXzsCn00IdtKbSavrVA0TrE64Nmc0F+JEXTcAG2GHDOUKooOvTwByttBCuDZC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvw+5Brav8BIQ5skFW6JzZm2z5QHTdoa8KMIvet+kOuQM8lPEH
	DTVKEVlKOqszxH4VXT/w8PGrq4po4U479Nmu3jbqinct11289DSFIqgI1h01OJGKxhVGfXxa/+Y
	/bcxW9u2R
X-Gm-Gg: AYBFou2ToAMcfaFAWZh3VhVEAjC7pBeaDO384tYwYAphCfU4e05YcPZAm5ITQ9l39yI
	FsJxbRsOEZbAubdu9YM5T8hdBnSkKJa4+xtzrmMKNwGfBdATDmUW6YMC4qm9a3wQvmJbUjIp5uL
	PMfH8saO1kSiccTvxT+Rj1oLXMeAQSxaQJrUjyZVwKPBM4FF5efN2tr6Uahu+OBFWzEHpSC60pb
	CHxSY6k6VBDN7DFThnYvgdTjwVQWIp6s0k0d3+E8MFDfkY34VWqap04UHa0lAWOno87KVV+4VKV
	DXVJ0hILx8ZxiOQKuoW9L6HOpkViPaFTULRRjWCZ6XhZ+SLZCIQg2KcKP7E0uSgDEVLxWVd1vtq
	jShoL9/wHI+tdhCds8zpy5ydA+zUk4d3/wJ3r+qa00HsNvtH5AyIRU+gQ+hgyiMURU7eSyI0APG
	R875CK6eRGSggaAgA50EQCFUr7QgOcpdyg8wZXbZWtzEGvfM2dViMVjd/NuNlD581n/AwxvmSuW
	30tFfp7WDgL7sTcLaY40XhHhzVoS5VVgKTHs7lxzkTOTFFHSzZk9k3NFpgi3Z4zvYoZnT7P4IgV
	c9//3w3SJmIjUoZ5C/0qPYbBDjkJFQDyLAATFaqb7NBVS9mZzFealsdTrrwiGYGSIzKzsihePU7
	4urc4rACuk5yRMw==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr15587123c88.24.1793570613180;
        Sun, 01 Nov 2026 14:03:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:28 -0800 (PST)
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
Subject: [PATCH v3 03/15] pylibfdt: Clarify iterator docstrings and test negative offsets
Date: Sun,  1 Nov 2026 14:01:10 -0800
Message-ID: <20261101220224.1436242-4-dianders@chromium.org>
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

Follow-up improvements to commit 6b0371afc532 ("pylibfdt: Add
subnode/property iterators and get_mem_rsv_list()"):

- Document in `FdtRo.subnodes()` and `FdtRo.properties()` that the
  device tree must not be modified while iterating, as node or property
  offsets may shift.
- Remove the inaccurate `Raises:` section from `FdtRo.subnodes()`, as
  `fdt_first_subnode()` and `fdt_next_subnode()` map all negative
  returns from `fdt_next_node()` to `-FDT_ERR_NOTFOUND` (which
  `subnodes()` quiets).
- Add a test case in `tests/pylibfdt_tests.py` verifying that passing a
  negative offset (`-1`) to `properties()` raises `FdtException` with
  `-libfdt.BADOFFSET`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New follow-up patch for already-applied commit 6b0371afc532
  ("pylibfdt: Add subnode/property iterators and get_mem_rsv_list()")
  clarifying iterator docstrings and testing negative offsets (Simon
  Glass, David Gibson)

 pylibfdt/libfdt.i       | 9 ++++++---
 tests/pylibfdt_tests.py | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0db7110b4a38..5c8859b37df3 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -204,14 +204,14 @@ class FdtRo(object):
     def subnodes(self, nodeoffset):
         """Iterate over the subnodes of a node
 
+        The device tree must not be modified while iterating, as node offsets
+        may shift.
+
         Args:
             nodeoffset: Offset of parent node to check
 
         Yields:
             Node offset of each direct subnode in order
-
-        Raises:
-            FdtException on error (e.g. invalid nodeoffset)
         """
         soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
         while soff >= 0:
@@ -465,6 +465,9 @@ class FdtRo(object):
     def properties(self, nodeoffset):
         """Iterate over the properties of a node
 
+        The device tree must not be modified while iterating, as property
+        offsets may shift.
+
         Args:
             nodeoffset: Offset of node to check
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 2a0509c7802e..93408745c575 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -171,6 +171,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
             self.fdt.first_property_offset(node)
         self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
 
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
+
     def testGetName(self):
         """Check that we can get the name of a node"""
         self.assertEqual(self.fdt.get_name(0), '')
-- 
2.56.0.317.g454f8302e1-goog

