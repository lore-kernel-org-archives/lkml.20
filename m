Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224597;
	b=ZgziY/kuHV3f4/FX5pLPZrmnJs0mZajl/uOlX+UvrwyjtPxAxJxjraRq0QZ9dzmL05Ti
	 9xII2nbPAJQSK3nCd5wTPhGRcX+KhIJRqQYD2enNA89xM3ffD5mHczNyezWGkkOYu9HTA
	 QcLDNvPWOyAMgKvMdfl6W9ImSFZ1y4/rJY4xXxL6/nMRT8XxcwBl302BuO0q3lLr/0y7w
	 EJIv5/0IUXPyVLcfWEjrO4hSqM0MR0BgDIVRcPaVFdyjXdXeE6BEtXJ8RY3Ar0skJxmPL
	 Yju2xvzYH57qAOlWo9XVA8Nl27BH0RwUhvo7qqDsFTc0UMd+Aei/Kfz+M4fIj4TAsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
	b=HCM9o40bcIatKLOoAXyH7+z3XUQMNFPfomH/x7lmFGeymiOvAsXrK1RDvmzMkuXpCIz9
	 Jhp5whcwNRNB8x1MkgTedOPkfUPCG28uRApcj0VXwuc8KqV/q6fum1l1bvDElBOPi5I5X
	 tF8zTlDPE34Fev4lR2X8bJ0z3fq98ryU3wpftMdVnx2ykqxv+ujoce1F8mrH1BwR5UcVV
	 GL3sJHOIXF+zsYVj5vCH9WDHFuOcih63/dMoLhLLlU2rgFIcQQpBCYFWV3F86WFhWUu02
	 e8m2hvXbO189Uw2FoaX4QXd1S5AyJewq2PBq4ebVzfP39gDdThCSzDizaujiIqJ+G7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ivtdJ4rZ;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22560A2638
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D22560A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ivtdJ4rZ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-369f33df08eso2755014eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224596; x=1793829396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
        b=ivtdJ4rZr4dfQ2s9Ibo+4/l8uRFNhFiYrI+7GFNKCeucZXc6S+2AFQpKaZeDvNGPOx
         iKji4CeYJS8aqAlj13P/1IuWko7mlKMIsHXD5Je1d1+ZTKzDru4v43/N/n78WviRWCmA
         LrP8ei//GGqj3zZJT0/UBnp+SeTvKQEbxzp5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224596; x=1793829396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
        b=qy4/xKyxvDqDJcmokjjF25Ekx60KXgzK/8sJJmqeMANm1FQzZwQBR+3b7ZWOhkdWq2
         NOiduZbwASywG4XjFVcWPUfPPHVmq1FjmG07JJcLCE/03GYB2ScBbO/4M0A/TTDSrMvD
         chznICBPmmoupQ3Yg2T6sKHmH056/8qgE71OED++BAGlBEnC61gxojaEwyElDL6+tEmx
         k71uXL+9j9Ehp0qIrLxWvKvvInGZQz9/dS5ToDNofVPPBMTluhZIsw0BdnoxxnN/g1T3
         xl8RgQWj/SaiGIDpiQWPt4r2ADE4Ze8YNOr4QEBe6qiKT6jxyV6iwdDJkdYgmGBXmOk1
         oFUA==
X-Forwarded-Encrypted: i=1; AKwUvBwlD9e7qH9K3JyF+zDQimGuqaglFeOLZ6anoEaLOQ54hLilbgY75A0Unv3tLLjAy3CdqlY+zLAZDN4k4/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN4JNGgOsiO7Y8w6z4+nwfnWLt86HnZL3jCP1Q3s0eC33T7Zxd
	Z8KlX0RTSLlLDddO2L+jo9/CuV9YU2e+V51ehaA+f7+j0On3xeuGesaBz1j16ihxnQ==
X-Gm-Gg: AYBFou1X175M9Heev94GfkbHrneRDhrBHXOZc7CzP7J8vb0s1zNs0pAfuywSvJAAGlm
	UsfZEDcc5DNPA+9oYXtil9xR5seF2YRTniIrS9cbNZGe9N7qfDsLyvi9/7ILsoTrqqhmweh/LF5
	CGP45REV7YzHA933wc4aBTkw9JdpjcMM/+3iYVboq6JMuIu6awOL//W/VtqarfVETHigARn4UzM
	oTZWOW+4kAvw0BT7N3kG1es1fwhNbZN9NaRRZnBC9H0WrBqtEs4HXdRsiwj/N5IKZrHD1fnMRSy
	AcYYcUACg0/jLTgRkiVi2A5eOSm5Wjlj3zY69zyxlHdDyrdS4r7cS4K/qfOT3mB7Hmw4EjdVwPp
	7du2E227Uv++De4AhdfZju0X7rytywkfAILyGcek7f8ZUL6kPTq6C8QcmlanBtvMNogtr2TZy/+
	ozXh8krzKfzEPhZaphM1YshFfipJgOu6F9IuUFao8C/mvpqw4xu3xtKzyO2AV1Y+ApFvjzrcQWY
	O+n/wFLEdhjnhNuESxRi/0MQnaecz/kCBYuh81cge07TvIBv/p4ykEPJPpYSaR2xyz+s4tZJxsV
	X1g1vwcuAhOjahErc4+kNapirvYxPrB9jNsNPtJ0XMFmOclb4vcIViddbXwbIFEhx5/phcNykPP
	P3P42BX+9V+FlGvuJ3bP4CAE5Wo/GWo9EHQ==
X-Received: by 2002:a05:7300:680e:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36a1fd4cbecmr4361952eec.0.1793224595280;
        Wed, 28 Oct 2026 14:56:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:33 -0700 (PDT)
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
Subject: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
Date: Wed, 28 Oct 2026 14:46:52 -0700
Message-ID: <20261028215600.1713475-4-dianders@chromium.org>
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

Add `NodeTree`, an in-memory live tree representation of a devicetree
node and its subtree, to `pylibfdt`:

- `NodeTree.unflatten(fdt, offset=0)` builds a `NodeTree` hierarchy from
  an `FdtRo` instance.
- `NodeTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
  `NodeTree` back into a packed FDT blob via `FdtSw`.
- `get_node()`, `create_path()`, and `walk()` provide path lookup,
  intermediate node creation, and pre-order traversal.
- `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
  `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
  provide typed property access and mutation (updating
  `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
  properties raise `ValueError` or return `[]` rather than
  `IndexError`).

Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
unflatten/flatten round-tripping and helper methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split NodeTree live tree representation out of fdtfactor into
  pylibfdt (David Gibson)

 pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++-
 tests/pylibfdt_tests.py |  54 +++++++++
 2 files changed, 315 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0db7110b4a38..f511c61746e3 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -929,7 +929,7 @@ class Property(bytearray):
 
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
-        if self[-1] != 0:
+        if not self or self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         if 0 in self[:-1]:
             raise ValueError('Property contains embedded nul characters')
@@ -937,6 +937,8 @@ class Property(bytearray):
 
     def as_stringlist(self):
         """Unicode is supported by decoding from UTF-8"""
+        if not self:
+            return []
         if self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         parts = self[:-1].split(b'\x00')
@@ -1210,6 +1212,264 @@ class NodeAdder():
 
     def __exit__(self, type, value, traceback):
         self._fdt.end_node()
+
+
+class NodeTree:
+    """In-memory live tree representation of a devicetree node and its subtree.
+
+    Attributes:
+        props: Dict mapping property name (str) to raw property value (bytes).
+        children: Dict mapping child node name (str) to child NodeTree.
+    """
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+
+    @classmethod
+    def unflatten(cls, fdt, offset=0):
+        """Unflatten an FdtRo subtree starting at `offset` into a NodeTree.
+
+        Args:
+            fdt: An `FdtRo` (or `Fdt`) instance.
+            offset: Starting node offset (default 0 for the root node).
+
+        Returns:
+            A `NodeTree` representing the node at `offset` and its descendants.
+        """
+        node = cls()
+        for prop in fdt.properties(offset):
+            node.props[prop.name] = bytes(prop)
+        for suboff in fdt.subnodes(offset):
+            node.children[fdt.get_name(suboff)] = cls.unflatten(fdt, suboff)
+        return node
+
+    def _flatten_subtree(self, sw, name):
+        """Recursively write this NodeTree and its children into an FdtSw.
+
+        Args:
+            sw: An `FdtSw` sequential-write instance.
+            name: Node name for this subtree (empty string `''` for root).
+        """
+        with sw.add_node(name):
+            for prop_name, val in self.props.items():
+                sw.property(prop_name, bytes(val))
+            for child_name, child_node in self.children.items():
+                child_node._flatten_subtree(sw, child_name)
+
+    def flatten(self, mem_rsv=(), boot_cpuid_phys=0):
+        """Serialize this root NodeTree into a packed FDT byte string.
+
+        Args:
+            mem_rsv: Iterable of (address, size) tuples for the FDT memory
+                reservation block.
+            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+
+        Returns:
+            Serialized FDT blob as `bytes`.
+        """
+        sw = FdtSw()
+        for addr, size in mem_rsv:
+            sw.add_reservemap_entry(addr, size)
+        sw.finish_reservemap()
+        self._flatten_subtree(sw, '')
+        fdt = sw.as_fdt()
+        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
+        fdt.pack()
+        return bytes(fdt.as_bytearray())
+
+    def get_node(self, path):
+        """Look up a descendant NodeTree by path without modifying the tree.
+
+        Follows the slash-separated node names in `path` starting from `self`
+        (leading, trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically, and `''` or
+        `'/'` returns `self`). If any component along `path` is not present in
+        `children`, returns `None`.
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `NodeTree` at `path`, or `None` if not found.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            node = node.children.get(part)
+            if node is None:
+                return None
+        return node
+
+    def create_path(self, path):
+        """Return the descendant NodeTree at `path`, creating missing nodes.
+
+        Looks up a child or deeper descendant `NodeTree` by following the
+        slash-separated node names in `path` starting from `self` (leading,
+        trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If any
+        node along `path` does not exist yet in `children`, a new empty
+        `NodeTree` is created for it automatically (similar to `mkdir -p`).
+        Passing `''` or `'/'` returns `self`.
+
+        Example:
+            root = NodeTree()
+            # Automatically creates root.children['soc'] and
+            # root.children['soc'].children['i2c@4000'], and returns the
+            # 'i2c@4000' NodeTree.
+            i2c = root.create_path('/soc/i2c@4000')
+            i2c.set_str('status', 'okay')
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `NodeTree` instance at `path`.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            if part not in node.children:
+                node.children[part] = type(self)()
+            node = node.children[part]
+        return node
+
+    def walk(self, path=''):
+        """Yield `(path, node)` pairs for this subtree in pre-order.
+
+        Args:
+            path: Path prefix for `self` (defaults to `''` for the root node,
+                producing paths like `''`, `'/soc'`, `'/soc/i2c@4000'`).
+
+        Yields:
+            Tuple of `(path, node)` for `self` followed recursively by each
+            descendant `NodeTree`.
+        """
+        prefix = path.rstrip('/')
+        yield path, self
+        for name, child in self.children.items():
+            yield from child.walk(f'{prefix}/{name}')
+
+    def get_str(self, name):
+        """Return property `name` decoded as a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Decoded string value (without the trailing NUL byte).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property value is not a single NUL-terminated
+                UTF-8 string.
+        """
+        return Property(name, self.props[name]).as_str()
+
+    def set_str(self, name, val):
+        """Set property `name` to a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: String value to encode as UTF-8 with a trailing NUL byte.
+
+        Raises:
+            ValueError: If `val` contains embedded NUL characters.
+        """
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        self.props[name] = val.encode('utf-8') + b'\x00'
+
+    def get_stringlist(self, name):
+        """Return property `name` decoded as a list of NUL-separated strings.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of decoded UTF-8 strings (`[]` if the property is empty).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If a non-empty property lacks NUL termination.
+        """
+        return Property(name, self.props[name]).as_stringlist()
+
+    def set_stringlist(self, name, vals):
+        """Set property `name` to a NUL-separated list of UTF-8 strings.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Iterable of strings to encode as NUL-terminated UTF-8.
+
+        Raises:
+            ValueError: If any string in `vals` contains embedded NUL
+                characters.
+        """
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        self.props[name] = b''.join(v.encode('utf-8') + b'\x00' for v in vals)
+
+    def get_u32(self, name):
+        """Return property `name` decoded as a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Integer value of the 32-bit cell.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not 4 bytes.
+        """
+        raw = self.props[name]
+        if len(raw) != 4:
+            raise ValueError(f'Property {name!r} length {len(raw)} != 4')
+        return Property(name, raw).as_uint32()
+
+    def set_u32(self, name, val):
+        """Set property `name` to a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: Unsigned 32-bit integer value.
+        """
+        self.props[name] = struct.pack('>I', val)
+
+    def get_u32_list(self, name):
+        """Return property `name` decoded as a list of big-endian uint32 cells.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of 32-bit unsigned integers.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not a multiple of 4 bytes.
+        """
+        raw = self.props[name]
+        if len(raw) % 4 != 0:
+            raise ValueError(
+                f'Property {name!r} length {len(raw)} is not a multiple of 4'
+            )
+        return Property(name, raw).as_uint32_list()
+
+    def set_u32_list(self, name, vals):
+        """Set property `name` to a sequence of big-endian uint32 cells.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Sequence of unsigned 32-bit integer values.
+        """
+        self.props[name] = struct.pack(f'>{len(vals)}I', *vals)
 %}
 
 %rename(fdt_property) fdt_property_func;
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 2a0509c7802e..569eb698a86f 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -697,6 +697,60 @@ class PyLibfdtRoTests(unittest.TestCase):
         self.assertEqual(b'this is a placeholder string\0string2\0',
                          self.fdt.getprop(node, 'placeholder'))
 
+    def testNodeTreeRoundTrip(self):
+        """Test unflattening and flattening a tree via NodeTree"""
+        tree = libfdt.NodeTree.unflatten(self.fdt)
+        rsvmap = self.fdt.get_mem_rsv_list()
+        cpuid = self.fdt.boot_cpuid_phys()
+        blob = tree.flatten(rsvmap, cpuid)
+
+        fdt2 = libfdt.FdtRo(blob)
+        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
+        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
+
+        tree2 = libfdt.NodeTree.unflatten(fdt2)
+        nodes1 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree.walk()]
+        nodes2 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree2.walk()]
+        self.assertEqual(nodes1, nodes2)
+
+    def testNodeTreeHelpers(self):
+        """Test NodeTree navigation and typed property helpers"""
+        root = libfdt.NodeTree()
+        self.assertIs(root, root.get_node(''))
+        self.assertIs(root, root.get_node('/'))
+        self.assertIsNone(root.get_node('/soc/i2c@4000'))
+
+        i2c = root.create_path('/soc/i2c@4000')
+        self.assertIs(i2c, root.get_node('/soc/i2c@4000'))
+        self.assertIs(i2c, root.get_node('soc/i2c@4000'))
+        self.assertEqual(['', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk()])
+        self.assertEqual(['/', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk('/')])
+
+        i2c.set_str('status', 'okay')
+        self.assertEqual('okay', i2c.get_str('status'))
+        with self.assertRaises(ValueError):
+            i2c.set_str('status', 'ok\x00ay')
+
+        i2c.set_stringlist('compatible', ['vendor,i2c', 'generic,i2c'])
+        self.assertEqual(['vendor,i2c', 'generic,i2c'],
+                         i2c.get_stringlist('compatible'))
+        with self.assertRaises(ValueError):
+            i2c.set_stringlist('compatible', ['vendor\x00,i2c'])
+        i2c.set_stringlist('empty-list', [])
+        self.assertEqual([], i2c.get_stringlist('empty-list'))
+        with self.assertRaises(ValueError):
+            i2c.get_str('empty-list')
+
+        i2c.set_u32('#address-cells', 1)
+        self.assertEqual(1, i2c.get_u32('#address-cells'))
+
+        i2c.set_u32_list('reg', [0x4000, 0x100])
+        self.assertEqual([0x4000, 0x100], i2c.get_u32_list('reg'))
+
 
 if __name__ == "__main__":
     unittest.main()
-- 
2.56.0.313.g2479322e68-goog

