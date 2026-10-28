Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224594;
	b=XcJcGs67WX767Ituymzo6zgyvfKf1MR5ThcuArf9CeSFJ1YwF71ngiSLJcQYHEY5ta7V
	 zfZbAS1zAVioO4teY5KOnpaW5x6yjp2VSno+iSn1prXhO3q1RYUL6S7JcCAzOkBx0zAbV
	 VZ45pdGversBJidsscle7z+80sMuhJKrtJcbN9p6EEytL1JUnonJsTrQy52TdiYtdv+Na
	 22EGrwtqfPlw0soOv0gAQV4pwcnMjZ2tndbMEdxQ0Ifu+vKSFPb1sOh7K3PY4lQ5ZzcMM
	 zrxQq/IZvgU12cGPq8ApFAt6rFK+pHzpIgg0jOTnQKpj1MD9/jVBYm2XtsKwTjO3yBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
	b=UriD2gZTB2dWFHL7TSqqUBtfgQ+CHp8Ez3W8biPWi1inaEvx5o1NciazK6hlg04NHCIc
	 w4DO7KdjD+jMEPWMNwYZOE7mY2pnqeqgV6AJBqnAk65wURYHW4y7oBAt68Wq3NIjeJqa3
	 v6dwHRuahLJtyhYr87ayCLrsZ1WXZCOM/W6w3qheGH7qfdm5J2FSznYRKbVDI8Ojde7mn
	 GCwCwbDu1Zjn1pB+O2J2PemrHqIvpXrLxkZH2XYQyjt83F3fnbc7mcprj8DSvpl0UCDlT
	 FDSeOsSIhX5qM2h2GDN9YBANZ4HilpJHhB/UAAZPRfvJ1o3J3tlfs8aSDd6xmOdQQvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xp7CFEYr;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57B60A2615
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD57B60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xp7CFEYr
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso2100285eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224592; x=1793829392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
        b=Xp7CFEYry8zuhbzaG+VuLUZQwM+bu+2OS4a950fHkY59ltQUcCT6yF2qkUrNASG+od
         3HqylUdsKt9v8ocpODaaMm9a0j78iu2LZxOd8ZsYg894XLuALJMF7fsDtE5ffm43t2ZH
         Mme4DtNqEjgoKmHGnmenomB2ATSEmqTbDmoYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224592; x=1793829392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
        b=oUlDWoH/8RY49FSIL4dy67AqeoKFbqNknWrUQx5X4z0khxVdmdRFFxjx3yJZYdoxIM
         vXLWGY4GK2x7DjQ3LIEsc9X3+2HxUtNYisuSJzSgq1tcxxRYizfaC/UjZoM3j0auNICW
         5OFRT4vIajkrDHBl8Yp81kZI0WTq9wDq2zkyf8IHhkhDc8mtNeMOcPH7S7J/QQQVFld8
         n2rXLsBwclQabD2M6dIJYs6aaUUpybfxSRmt9yes/y9ovnUvh9BxDzxEy7qXs5Qhd7SF
         bPxmQTddT1ZO5PiAYHBdV8IZOm5fwBBstPKI1wWruxkysTFkwOI2weN9uOPxs/iTwDr9
         /OMg==
X-Forwarded-Encrypted: i=1; AKwUvByEw4lbss9s2YpGzOEh+RRBjyoyWSU8H+SY4Lp71L1kzqLPSfpaqNpiKNWGkr7D0IfUPF312p4VJ2uRfPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYfMNf7ysbKsA1BgkcWQP7yNqxAkQvy0zcUA15/41OUDMEfPZ4
	Y33V97Iq7kpmI7FUr64cu8XDkOPk2D5NF6WVJaUn0AALPa86LqtU8lSSIYD6IH8NPA==
X-Gm-Gg: AYBFou3SMm27onnQcuPkXhH4Y5W2uX21cgZp6cVczXOYaoy1a7NUS98xjulsFvIRjq/
	zSype93+4kWmoHukm4E1mWAU2NNztfQ+LLX+sgC6WhD056Qbk8/ShzJ0hYA1VpOVXh0VKSiCEKO
	zMjIBTk2aF3ukS6zR7/8aFPtpJVqUpy1wT2PtVOe5NSQxBEMGcQaRJVEEigg/Wi6E8xfR/rh4PJ
	5hT0eMBhHiwJ7+TAlttXsavIlxOYzJqQ0dgVpZsUqvB/NUXAFKrJeuD+GPPaOToFLvR+paMdXk2
	e6HDW0oIZjGt3xRMagWtH7xVw8+CepUSeIM7w1Z9N/mQHVzmeXfXhhdMF0UO4Ypa5CPvEzs/aOi
	0dXAtGvbRdYZKKh6QGeLbq61xbOdhbPR0QXL/2NbmV7DknCvzNT3EIKjCLKx7g16HhSs6Xsnvlz
	XDbaktND6yrjkLcBCShi1kvHJJp2VjWT9PAHliO9iqqOJk2vMn07f/271ngUPY1A1R52yeBb/Vo
	4QVZG1hCTusxQU4RZdn5BEvtxCR2Dy+AmTz9IVtMSitu7SmUWW7K4kVOV++1FadwT8yMCUSoKNQ
	oykQeHWG2UruGVwV627gbLuHkzykRWmvVfvXXTonEK+ISMcpCbEObZx6BIPaRfssnLcUxJQGx0v
	Co2bUiQJf4oHw
X-Received: by 2002:a05:7301:1925:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a20469b48mr6733231eec.37.1793224591770;
        Wed, 28 Oct 2026 14:56:31 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
Date: Wed, 28 Oct 2026 14:46:51 -0700
Message-ID: <20261028215600.1713475-3-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
properties, and memory reservation entries without manual offset loops
or `-FDT_ERR_NOTFOUND` sentinel handling:

- `subnodes(nodeoffset)`: yields the offset of each direct child subnode
  of `nodeoffset`.
- `properties(nodeoffset)`: yields a `Property` object for each property
  of `nodeoffset`.
- `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
  all entries in the memory reservation block.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch adding FdtRo.subnodes(), FdtRo.properties(), and
  FdtRo.get_mem_rsv_list()

 pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 18 +++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 46f28f67290d..0db7110b4a38 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -201,6 +201,23 @@ class FdtRo(object):
         """
         return check_err(fdt_next_subnode(self._fdt, nodeoffset), quiet)
 
+    def subnodes(self, nodeoffset):
+        """Iterate over the subnodes of a node
+
+        Args:
+            nodeoffset: Offset of parent node to check
+
+        Yields:
+            Node offset of each direct subnode in order
+
+        Raises:
+            FdtException on error (e.g. invalid nodeoffset)
+        """
+        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
+        while soff >= 0:
+            yield soff
+            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)
+
     def magic(self):
         """Return the magic word from the header
 
@@ -302,6 +319,17 @@ class FdtRo(object):
         check_err(val[0], quiet)
         return val[1:]
 
+    def get_mem_rsv_list(self):
+        """Return a list of all memory reserve-map records
+
+        Returns:
+            List of (address, size) tuples for each memory reserve-map record
+        """
+        return [
+            tuple(self.get_mem_rsv(i))
+            for i in range(self.num_mem_rsv())
+        ]
+
     def address_cells(self, nodeoffset, quiet=()):
         """Return the number of address cells used by a node's children
 
@@ -434,6 +462,23 @@ class FdtRo(object):
             return pdata[1]
         return Property(pdata[0], pdata[1])
 
+    def properties(self, nodeoffset):
+        """Iterate over the properties of a node
+
+        Args:
+            nodeoffset: Offset of node to check
+
+        Yields:
+            Property object for each property on @nodeoffset in order
+
+        Raises:
+            FdtException on error (e.g. invalid nodeoffset)
+        """
+        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
+        while poff >= 0:
+            yield self.get_property_by_offset(poff)
+            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
+
     def getprop(self, nodeoffset, prop_name, quiet=()):
         """Get a property from a node
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 1b65961491bf..2a0509c7802e 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
             node_list.append(self.fdt.get_name(node))
             node = self.fdt.next_subnode(node, QUIET_NOTFOUND)
         self.assertEqual(node_list, ['subnode@1', 'subnode@2'])
+        self.assertEqual(
+            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
+            ['subnode@1', 'subnode@2'],
+        )
+        leaf = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
+
+    def testPropertiesIterator(self):
+        """Check that we can iterate through properties of a node"""
+        node = self.fdt.path_offset('/subnode@1')
+        props = list(self.fdt.properties(node))
+        self.assertEqual([p.name for p in props],
+                         ['compatible', 'reg', 'prop-int'])
+        self.assertEqual(props[0], b'subnode1\0')
+        leaf = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEqual(list(self.fdt.properties(leaf)), [])
 
     def testFirstNextSubnodeOffsetExceptions(self):
         """Check except handling for first/next subnode functions"""
@@ -410,6 +426,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual([ 0xdeadbeef00000000, 0x100000],
                           self.fdt.get_mem_rsv(0))
         self.assertEqual([123456789, 0o10000], self.fdt.get_mem_rsv(1))
+        self.assertEqual([(0xdeadbeef00000000, 0x100000), (123456789, 0o10000)],
+                         self.fdt.get_mem_rsv_list())
 
     def testAddDelReserveMap(self):
         """Test that we can add to and remove from the memory reserve map"""
-- 
2.56.0.313.g2479322e68-goog

