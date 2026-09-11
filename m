Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175DC46E006
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126154; cv=none; b=WpUz3Ey6lXP24ht02qO1wv4pfzOwo2FZI+DCzUpCjhXSxZBem/beUeVrPN3Tw6cYUspfRdrmf8+3X96mnixmEGwVExR7SVRm888zyJc0dkmT03TIETfaePTFi2fkvrvRNsg34MNhblqtEQ1DIwjYgCmkcWhPq9Dp8h6Ro1+dg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126154; c=relaxed/simple;
	bh=5qqz5Ehwu6orTjRfaUUeZb45gjomqVQWglbQmOijWb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SoIbxJ/iSVfkuPZ2Uw8ibASFTQe3dtRtEnLIJNA6xJMgJGtnRl5KvkwXktML6A45J/7z0kq0lHs9xwGORsir+VmK8wrUYK4uy16i2OaWDIQhkm0bAAWEHd3AHGPEGP0eyG8OcDmzUP4NCpqwzDxUesnUb3TIq7HB6WmbxBjmTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2f0gqDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2f0gqDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF971F0089A;
	Fri, 11 Sep 2026 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789126131;
	bh=nsSRp8PdyK7jqxwyqAHoe3K2myVb/dPcJ1AFVgoBhm4=;
	h=From:Date:Subject:To:Cc;
	b=A2f0gqDW7IjntqtLnmWTY9FTZt2kpRTwAR81OQ0+X5rLtkU/oM3woCD8mBXpKl22g
	 FxYe3TsxS68ynHwnCCJsl1bwPDgBbcj3b1Txifi+2tin8nkRKoyJzvInE1BZQaJEX1
	 SfEvjpltcAkNn5xhvf+Rc0Gw+3IiqappNVYNQ4vVHGBz9KbXFSFUbvXeKjGQTNnKQe
	 oQ8qUrbxCW07kqROwNWcZveAksa3yuRMFG/yhKpWZZTaXd6Lv/XEL9aASh6XtvTLuq
	 biMrXtbaqD7QwD7g67lAzMIJsCVJbU2WmOQf4Qz7SKN0f6wro+FrvrrGb/qQcA7fJ7
	 xshTLjIDUbIHA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Fri, 11 Sep 2026 14:28:43 +0300
Subject: [PATCH v2] x86/mm/pat: use pr_warn() for early W^X warnings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-fixes-verify-rwx-v2-1-e2cde39b6693@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O0RKCIBBFf6XhORSRUeyp/2h8AFuVSnQWMh3Hf
 w+sx7N7z93diAM04MjltBGE2Tgz2gD8fCJNr2wH1NwDE854waqM0dYs4OgcrHal+FkoE0KKTJe
 FyiUJ2oRwZIJ1q3/s3voBjY89MaGVA6pR2aaPI2+mdJFFOgxx2RvnR1yPh+YslvxvM8kqXuYsE
 SwwlzSjOE3++gS08EpG7Ei97/sXW54AzNIAAAA=
X-Change-ID: 20260910-fixes-verify-rwx-044841b76a38
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Ingo Molnar <mingo@redhat.com>, 
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Nathan Chancellor reports the following warning:

  CPA detected W^X violation: 8000000000000123 -> 0000000000000123 range: 0xffffffffc0400000 - 0xffffffffc0400fff PFN 100e00
  WARNING: arch/x86/mm/pat/set_memory.c:722 at __change_page_attr_set_clr+0xde7/0x1290, CPU#0: swapper/0/0
  Modules linked in:
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1-debug-00006-g453e78594434 #1 PREEMPT(full)  2950d432dd3910251071a66f3134fe0875432786
  Hardware name: ASUS System Product Name/PRIME Z590M-PLUS, BIOS 1801 12/26/2022
  RIP: 0010:__change_page_attr_set_clr+0xdff/0x1290
  Code: 80 7c 24 42 00 0f 85 3a 04 00 00 48 8d 3d 19 8d 79 02 49 89 d9 4c 89 e1 4c 89 d2 4c 89 f6 4d 8d 84 24 ff 0f 00 00 4c 89 14 24 <67> 48 0f b9 3a 4c 8b 14 24 48 8b 0d 81 44 bf 01 41 f6 c2 01
  RSP: 0000:ffffffff87003c60 EFLAGS: 00010246
  RAX: 0000000000000002 RBX: 0000000000100e00 RCX: ffffffffc0400000
  RDX: 0000000000000123 RSI: 8000000000000123 RDI: ffffffff872e50c0
  RBP: 8000000100e00123 R08: ffffffffc0400fff R09: 0000000000100e00
  R10: 0000000000000123 R11: 0000000000000001 R12: ffffffffc0400000
  R13: 0000000100e00123 R14: 8000000000000123 R15: ffffffff87003d58
  FS:  0000000000000000(0000) GS:ffff8ad1777a7000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: ffff8ad0a4201000 CR3: 00000007e3022001 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   ? _vm_unmap_aliases+0x219/0x280
   change_page_attr_set_clr+0x161/0x250
   ? events_sysfs_show+0x5d/0x80
   set_memory_x+0x39/0x50
   apply_retpolines+0x656/0x6d0
   ? events_sysfs_show+0x5d/0x80
   ? events_sysfs_show+0x6c/0x80
   ? events_sysfs_show+0x62/0x80
   alternative_instructions+0x3c/0xd0
   arch_cpu_finalize_init+0x130/0x190
   start_kernel+0x97d/0xa10
   x86_64_start_reservations+0x24/0x30
   x86_64_start_kernel+0xda/0xe0
   common_startup_64+0x13e/0x151
   </TASK>
  ---[ end trace 0000000000000000 ]---

The warning appears because commit 038176c21617f ("x86/mm/pat: fix
effective RW computation in lookup_address_in_pgd_attr()") fixed the
effective RW checked by verify_rwx() and it exposed that pages used for ITS
trampolines temporarily have RWX permissions.

The permissions are updated in its_fini_core() after all the ITS
trampolines are generated, but since verify_rwx() detects invalid
transitions, it warns when its_alloc() makes RW memory executable.

At the time of alternatives patching the entire kernel text is mapped
RWX, so the warning is bogus anyway.

Since the verification of the entire page table with debug_checkwx() has to
be enabled explicitly in the kernel configuration, retain the warning even
if it's bogus, but make it scream less loudly: use pr_warn_once() rather
than WARN_ONCE().

The warning can be removed once debug_checkwx() becomes unconditional for
configurations with CONFIG_STRICT_KERNEL_RWX set.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20260905044253.GA3816371@ax162
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
Changes in v2:
- Use pr_warn_once() for early violations instad if skipping them
  entirely

Link to v1: https://lore.kernel.org/all/20260908092730.4002628-1-rppt@kernel.org/
---
 arch/x86/mm/pat/set_memory.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b3060000da8d1..a4f7fe69e6922 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -697,6 +697,21 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 		return new;
 
 	end = start + npg * PAGE_SIZE - 1;
+
+	/*
+	 * If the kernel text is still RWX, gently complain, this could be a
+	 * false positive.
+	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
+	 * the warning can be removed completely.
+	 */
+	if (!kernel_set_to_readonly) {
+		pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
+		  (unsigned long long)pgprot_val(old),
+		  (unsigned long long)pgprot_val(new),
+		  start, end, pfn);
+		return new;
+	}
+
 	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
 		  (unsigned long long)pgprot_val(old),
 		  (unsigned long long)pgprot_val(new),

---
base-commit: ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482
change-id: 20260910-fixes-verify-rwx-044841b76a38

--
Sincerely yours,
Mike.

