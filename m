Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E30A47FAE5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961493; cv=none; b=ZmBDYIj+WOkfs/+yqiZnfaoNC0ekHmtulVexW3+OuK9scIb5qQO9dEN2mn73RXH93u5FViu3RfrylLCRb1Z5MooSC3D4595rwrAd4r3FbrweqwOluSO4uWjhb3G6rp43RjWk0ECLEFBh0C2Ac7DZkGDLe6CxjNWrwFArczsx898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961493; c=relaxed/simple;
	bh=O5KAl1QIwFpmtS13iXGYwnjfmOpnWs/eRpvfDXQ+vk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB9PJBW69Ytbe9SnbWKgAKnLmT2d7mgA1ikVJXkek06qq9DixTxU4IGfda8nCgwAX8p6xMmqoG9n30QQBCBMUCXv+sIvvl9T3c1y+AcvO1LVJ8iXFLuGn9OVfodiQ+Ovq3yRTjre4M46/yoy360VKj9WQtjxUl3Gm0rTEJW1hc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ra8dCi7Z; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ra8dCi7Z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O5KAl1QIwFpmtS13iXGYwnjfmOpnWs/eRpvfDXQ+vk8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791961487; v=1; x=1792566287;
 b=ra8dCi7ZPYrlpf0ZGT4M6s5BessyG3EMwJRSkca4FneIyRVZH5d6TFsDNwjy7SGBb7VreTEK
 yJTOCu31a4IsrxUCxqKqsqga19xqjmLQhSxl3ighoXU0C6qry6KRzvUrv2hRqI7PKViob04Zz+U
 WnfLmCErPkKr4gA3r/BsiZjY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1490cbe7552e56db;
	Wed, 14 Oct 2026 07:04:47 +0000
X-Mizu-Trace-ID: 1490cbe7552e56db
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 14 Oct 2026 15:04:30 +0800
Subject: [PATCH 3/3] tools/mm: add VMA flags decoding and name display to
 show_page_info.py
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-show_page_info-v1-3-7a68aee0114a@linux.dev>
References: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
In-Reply-To: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

From: Ye Liu <liuye@kylinos.cn>

Add support for decoding VMA flags into human-readable format and
displaying VMA names. This provides more detailed information about
the virtual memory area containing the page.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 tools/mm/show_page_info.py | 54 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
index 1fbef3889e91..9dc65b4d2b29 100644
--- a/tools/mm/show_page_info.py
+++ b/tools/mm/show_page_info.py
@@ -7,10 +7,11 @@ import sys
 from drgn import Object, FaultError, PlatformFlags, cast
 from drgn.helpers.linux import find_task, follow_page, page_size
 from drgn.helpers.linux.mm import (
-    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_find,
+    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_find, vma_name,
     PageSlab, PageCompound, PageHead, PageTail, compound_head, compound_order, compound_nr
 )
 from drgn.helpers.linux.cgroup import cgroup_name, cgroup_path
+from drgn.helpers.common.format import decode_flags
 
 DESC = """
 This is a drgn script to show the page state.
@@ -75,6 +76,52 @@ def get_memcg_info(page):
     except Exception as e:
         return "unknown", f"Unexpected error: {e}"
 
+def format_vma_flags(flags: int) -> str:
+    """
+    Format VMA flags into a human-readable string.
+
+    :param flags: The VMA flags as an integer.
+    :return: A string representation of the flags.
+    """
+    # VM flags from include/uapi/linux/mm.h
+    # Since Linux 6.19 (commit 2b6a3f061f11), VMA flag bit numbers are defined
+    # in an anonymous enum. For older kernels, we hard-code them.
+    VM_FLAGS = [
+        ("READ", 0x00000001),
+        ("WRITE", 0x00000002),
+        ("EXEC", 0x00000004),
+        ("SHARED", 0x00000008),
+        ("MAYREAD", 0x00000010),
+        ("MAYWRITE", 0x00000020),
+        ("MAYEXEC", 0x00000040),
+        ("MAYSHARE", 0x00000080),
+        ("GROWSDOWN", 0x00000100),
+        ("UFFD_MISSING", 0x00000200),
+        ("PFNMAP", 0x00000400),
+        ("DENYWRITE", 0x00000800),
+        ("EXECUTABLE", 0x00001000),
+        ("LOCKED", 0x00002000),
+        ("IO", 0x00004000),
+        ("SEQ_READ", 0x00008000),
+        ("RAND_READ", 0x00010000),
+        ("DONTCOPY", 0x00020000),
+        ("DONTEXPAND", 0x00040000),
+        ("LOCKONFAULT", 0x00080000),
+        ("ACCOUNT", 0x00100000),
+        ("NORESERVE", 0x00200000),
+        ("HUGETLB", 0x00400000),
+        ("SYNC", 0x00800000),
+        ("ARCH_1", 0x01000000),
+        ("WIPEONFORK", 0x02000000),
+        ("DONTDUMP", 0x04000000),
+        ("SOFTDIRTY", 0x08000000),
+        ("MIXEDMAP", 0x10000000),
+        ("HUGEPAGE", 0x20000000),
+        ("NOHUGEPAGE", 0x40000000),
+        ("MERGEABLE", 0x80000000),
+    ]
+    return decode_flags(flags, VM_FLAGS, bit_numbers=False)
+
 def show_page_state(page, addr, mm, pid, task):
     """Display detailed information about a page."""
     try:
@@ -106,10 +153,15 @@ def show_page_state(page, addr, mm, pid, task):
             fields["Page VMA"] = hex(vma.value_())
             fields["VMA Start"] = hex(vma.vm_start.value_())
             fields["VMA End"] = hex(vma.vm_end.value_())
+            vma_flags_hex = hex(vma.vm_flags.value_())
+            vma_flags_readable = format_vma_flags(vma.vm_flags.value_())
+            fields["VMA Flags"] = f"{vma_flags_hex} ({vma_flags_readable})"
+            fields["VMA Name"] = vma_name(vma).decode()
         except FaultError as e:
             fields["Page VMA"] = "Unavailable"
             fields["VMA Start"] = "Unavailable"
             fields["VMA End"] = "Unavailable"
+            fields["VMA Flags"] = "Unavailable"
             print(f"Error retrieving VMA information: {e}")
 
         # Calculate the maximum field name length for alignment

-- 
2.43.0

