Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AF2D8399
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685862; cv=none; b=L8gr/S+V5hS9841QF/pbXoVhvow3DNFpFAQIAGGphWnfufzPLKVjRmes8ZkSLK3iARM9GltCUcglQN6YhN6r6cLt2SffF5+RyjMOoY1ujngzy+BrhMa08i+HMje7XWburgwI+GlUAoMX7NkJoCKgfDb4y63NWtdqhGqhUb9fXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685862; c=relaxed/simple;
	bh=WcCJlwSA3btDf9zO1HtS1m+8cJ2w5amxQpSDo3C0mLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPjKFVLQh2Qr50jTKwQ5inYBcocfXTriFzS5rbk5wIl3FYC7Oul7Bci6UZtw3PDl9D37W4r0/8hAvQEICJHHlFQA56PRbd3KKpDhK+oVqlgKyYwcX3sKbBQQ7ZXS5cUt/HeiMEVUeIhyyJ1RPVI1AYdQZcVng1kLWv58O9HnF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEg3jr1P; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEg3jr1P"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so1152590eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791685860; x=1792290660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeQGirEn+YCBV6LJ0ciQufE8mK409lev8vu7BUT/DZI=;
        b=LEg3jr1PxkRYw152wl+a3HcqZIHSKVFiaGtTwuuBMYjLeVHSdVetItxP/40Ef9r/VV
         Jfu0M7C1JNDweLHrFdY3LNM1ttuRShjK/u35xbIpu8YMW3sBZ7dGg/bViLqr00uMoLTi
         dMyGB+WgLEi/VF+wWWToTyLyd+BEbHsmsi9uL0NxfUsF4cliSUtMub1+1/8+ZHs1k58E
         AuTk2aqA5cCP2D7dSNhxyKzuuXUPWh2OywQR2vM0cY8hY4jdMp6uQnUTuKJnAkOozD0T
         AIs2ItbO84aKGmEGfzE3F4ttXMO9ueTzsgTy+p+kNBkxcBntDMb28g9GAWtGc8sONMiU
         4C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685860; x=1792290660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeQGirEn+YCBV6LJ0ciQufE8mK409lev8vu7BUT/DZI=;
        b=HHtIOvBvYNiOwkywXHIOf3H7GP6W1qKfkqc1/vqxhpPZXwL7gl5ilN2M8lmifYRbj+
         MmULAayD46FzgoOMS9UWDrzhyYtr1VIF05no/VrgNKb579aNxNZTaBm9empZYtbd7BSx
         7C/aYuA1pnEHP4hSUHEKrlhGDjD8gPzc23Lp+becBBQL+efNYnCq/VA1RlgLVeHwtsXK
         wl8PKA0TkMudWZB2ZYbwFSJ6eKIrIVz2qfgyg39WxudyEzGrBPZA974jnqa+SYDA7vcd
         9ZVsNUNYNn9itfL1BH4O+hNhOmpxV5Zw3riDgFoPrscKXz7mdFJnx2T+qGyrkn7749UK
         PXAA==
X-Forwarded-Encrypted: i=1; AKwUvByIDF6YBi9EyhZzR6wJd21fNTUHk/YTjKgH1biHfE2MLmU6UT8dcTORVvmWnvjrHo9fkZZGPAT9S5avFq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWXY2HH699p54382buSZ+GtCCy0LShJ5DqSofLhYokgiuvChM
	uIL8bwj9BLedaibuxu1vHoYZhCkQzPylMdrKU68g5ewOiqzlq+PnWaN9
X-Gm-Gg: AYBFou3ueaW0arqH52tNNALT54H5nHkOvzucoBNXRnDYAGjZ7zrpHiyEbNkD2r8ATfp
	MTybNFXB+8FDjWifta/gKIQliTaqzu0l8ekihdvW1AfuYHmzskb3GNgvdvR/fGVbw75QLlFaSdx
	hGTMmvgvJrFJBAFQESuv7Sc9jO4kNPx4j4sleYYERjAK/Szd52SWvxrkwMzsXZYnbVGCmevkr4m
	f+FM2vDtyIO5uyCZkl8lKz8FX7I9svAxwgbblg28+MPPF0xieW70R7E1F2RShph0C1ezQ0M4FW4
	2xqSrHd0jIv9UQJwJhHP0IOK4l00HtFEwdb/YbBLWPVGOCBzpxUtwOUInmr6cfdXjS5vFxn+Kq0
	RXzbwlUfZRuznAakfCVYxFIm0sXYzoRV9DoqskcqtRHHyd+pi/RJxM6jybA6xrTe70Pmwj+trKv
	Sxcw3TxaqTfiplJlSUioZIraBm9e4R3l10R0B37bySvaftpe4xXK6Wgvuql6uDY914WxwiXGXMX
	tpSOc+uMmm7Z8lixD6IUDAlgk+2uSq9utJLXO+KPJkyhBk1GKit7FkfXNcBiTkOCTNaSPtsFwkt
	6PnVzCUfnODc/5AmB1p25uU+OkMq/5HZQ8Imv99MNoq5VNAliJHCfPaqxMZ/llUGtmusmFg/FZ8
	K3HzZOqSSoIxfe24cDYbdCb5mhAhLRd3au4PMdxlvns2siCYXjA+WtySApz84XAI4fV0fk6eg7n
	q6gCLpZ32suCEiD4LTcuJ3gOO2+WwX83lLRGUrOA==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr12684601eec.19.1791685860088;
        Sat, 10 Oct 2026 19:31:00 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-c00c-b850-3c50-660a-7c51-9da0.dynamic-ip6.hinet.net. [2001:b011:c00c:b850:3c50:660a:7c51:9da0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm20357265eec.25.2026.10.10.19.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:30:59 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] scripts/gdb: Fix radix tree lookup pointer handling
Date: Sun, 11 Oct 2026 10:30:43 +0800
Message-ID: <20261011023044.1722-2-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261011023044.1722-1-ue081723@gmail.com>
References: <20261010141712.2db4491436e30110ccb5a25e@linux-foundation.org>
 <20261011023044.1722-1-ue081723@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lookup() casts each slot to a pointer to a node pointer and then
dereferences it. Since the slot already contains an entry pointer,
this reads the entry's contents as another pointer instead of
returning the entry itself. Internal entries also keep their tag
bits when descending, so multi-level trees are read from the wrong
address and $lx_radix_tree_lookup() fails with a memory error.

Sibling, retry and zero entries carry the same internal tag but are
small integers rather than node pointers, so the tag alone must not
decide whether to descend. A page cache populated with large folios
has a sibling entry in every slot but the first of each folio.

Walk the tree the way xas_load() does: descend only through entries
that xa_is_node() would accept, follow sibling entries to the
canonical slot of a multi-index entry, and treat retry and zero
entries like empty slots since they hold no data. Remove the explicit
shift counter, as traversal now follows the entry type.

Fixes: b7235d6bb516 ("scripts/gdb: add a Radix Tree Parser")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Changes in v2:
- Handle XArray sibling, retry and zero entries, which carry the
  internal tag but are not node pointers. v1 passed them to
  entry_to_node() and the next node['shift'] read raised a GDB
  MemoryError (reported by Sashiko). Added is_node(), is_sibling()
  and sibling_offset() helpers modelled on xa_is_node(),
  xa_is_sibling() and xa_to_sibling().
- Sent as patch 1/2 of a series with git send-email.

Tested with GDB 17.1 against standalone GCC-built C fixtures using the
xarray/xa_node field layout, with XA_CHUNK_SHIFT=4 and 6. These are
synthetic debugger fixtures, not a booted kernel or a kernel core dump.

The fixtures cover empty/direct roots, one- to three-level trees,
zero-filled payloads, value entries, absent/out-of-range indices,
struct/pointer roots, the GDB convenience function, and multi-index
entries with sibling entries both in a leaf node and at the root level
of a two-level tree, plus retry and zero entries. Before this patch 26
of the 38 checks fail for each chunk size (wrong value, missed slot or
MemoryError); the v1 patch fails the 7 sibling/retry/zero checks with
a MemoryError; with this patch all 38 pass for both chunk sizes.

The lx-radix-tree iterator in the same file has not been changed.

 scripts/gdb/linux/radixtree.py | 66 ++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/scripts/gdb/linux/radixtree.py b/scripts/gdb/linux/radixtree.py
index bc2954e45c32..8ce9936dfa50 100644
--- a/scripts/gdb/linux/radixtree.py
+++ b/scripts/gdb/linux/radixtree.py
@@ -27,6 +27,24 @@ def entry_to_node(node):
     indirect_ptr = node.cast(long_type) & ~constants.LX_RADIX_TREE_INTERNAL_NODE
     return indirect_ptr.cast(radix_tree_node_type.get_type().pointer())
 
+def is_node(entry):
+    # Like xa_is_node(): internal entries below 4096 are sibling, retry
+    # or zero entries rather than pointers to a struct xa_node.
+    ulong_type = utils.get_ulong_type()
+    return is_internal_node(entry) and entry.cast(ulong_type) > 4096
+
+def is_sibling(entry):
+    # Like xa_is_sibling(): a multi-index entry occupies several slots,
+    # and all but the first hold a sibling entry that encodes the offset
+    # of the first one.
+    ulong_type = utils.get_ulong_type()
+    return is_internal_node(entry) and entry.cast(ulong_type) < \
+        xa_mk_internal(constants.LX_RADIX_TREE_MAP_SIZE - 1)
+
+def sibling_offset(entry):
+    ulong_type = utils.get_ulong_type()
+    return int(entry.cast(ulong_type)) >> 2
+
 def node_maxindex(node):
     return (constants.LX_RADIX_TREE_MAP_SIZE << node['shift']) - 1
 
@@ -40,39 +58,35 @@ def resolve_root(root):
 
 def lookup(root, index):
     root = resolve_root(root)
-    node = root['xa_head']
-    if node == 0:
-        return None
+    entry = root['xa_head']
 
-    if not (is_internal_node(node)):
-        if (index > 0):
+    if is_node(entry):
+        node = entry_to_node(entry)
+        if index > node_maxindex(node):
             return None
-        return node
 
-    node = entry_to_node(node)
-    maxindex = node_maxindex(node)
-
-    if (index > maxindex):
-        return None
-
-    shift = node['shift'] + constants.LX_RADIX_TREE_MAP_SHIFT
-
-    while True:
-        offset = (index >> node['shift']) & constants.LX_RADIX_TREE_MAP_MASK
-        slot = node['slots'][offset]
+        # Walk down the tree like xas_load() does.
+        while True:
+            offset = (index >> node['shift']) & constants.LX_RADIX_TREE_MAP_MASK
+            entry = node['slots'][offset]
 
-        if slot == 0:
-            return None
+            while is_sibling(entry):
+                entry = node['slots'][sibling_offset(entry)]
+                if node['shift'] and is_node(entry):
+                    # xas_descend() turns this into a retry entry.
+                    return None
 
-        node = slot.cast(node.type.pointer()).dereference()
-        if node == 0:
-            return None
+            if not is_node(entry) or node['shift'] == 0:
+                break
+            node = entry_to_node(entry)
+    elif index > 0:
+        return None
 
-        shift -= constants.LX_RADIX_TREE_MAP_SHIFT
-        if (shift <= 0):
-            break
+    # Empty slots and retry or zero entries hold no data.
+    if entry == 0 or is_internal_node(entry):
+        return None
 
-    return node
+    return entry
 
 def descend(parent, index):
     offset = (index >> int(parent["shift"])) & constants.LX_RADIX_TREE_MAP_MASK
-- 
2.53.0

