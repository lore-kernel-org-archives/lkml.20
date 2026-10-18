Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2138E12B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792317260; cv=none; b=aOfa17NRfw9ErGzRiKzQc8uAgEaS9UHhH11afWkh+xcYtImmgt2MBmAbURwtr8oqzehG+9yQyQhae6fln6rQwT7894soEP7nPNfHeEMU40wxVJyThvQHmgUJsgSafJTtNnT2lwYzlRLZxIwhi4VmATYhfy22BB4W/tiJuUwbGOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792317260; c=relaxed/simple;
	bh=qfHDw4OlyBXWqH6jJgbCQjx40820Wspx4sYMNor6jfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NRL+8D8wgVOfgwhYsjGjabatxftzPGvfwzY2hkEVmDGb5IGLN2g0EEr4Qau4BtHNVznO/NiKw7DU1XcAeYwv236/rrWKbMllimQtAQ4w8LLKKtL/BPbQyI4MbHakzSsv+ArRVbvb49F/1pT97ZrG5onX0M2iXzhzSPKM9hyjiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSJrioHb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSJrioHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6C51F000C4;
	Sun, 18 Oct 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792317258;
	bh=cD0itQWtmbgSrr2vsmC/xDg1ZtyPWR+jJN4ypcQ8fIA=;
	h=Date:From:To:Cc:Subject;
	b=BSJrioHb52/u249UMedvPkY2StR+utzOOHYrnaeujY+XHxg52uEv0D3RTiQUB6pLX
	 DTRJ11eosJWYkx4WMi9YoFx2YoOSQ4P3I7Mgeh86BiMbSusb5k+h64QvBnKlGl5oN7
	 2LOQLC4VBsPmiJrlla/BRYqG81ecDLu9AEjJm45tDa1cIIaYh+rMvo84sSzSmF2hiu
	 zUZLEqKAZeSX45CrDcoBBdrIAwkG2dQja3htvJWH3X87fO+Dwi5ZG2LGA2gK8TczLf
	 RJbRGZYBzJkMywE/Nfu2IeFTmuPyECAqQToBCkMB1QtXMMElfubg0ThKUkDvk4ZpEj
	 WomG5epnMrGvw==
Date: Sun, 18 Oct 2026 11:54:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joe Lawrence <joe.lawrence@redhat.com>
Subject: [GIT PULL] objtool updates for v7.4
Message-ID: <atSXRc5ML06RJY_z@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest objtool/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2026-10-18

for you to fetch changes up to 945537271df1e3680be9b32af7041ac20f1184fb:

Objtool updates:

 - Add unit test suite for objtool klp functionality and
   known failure modes (by Song Liu and Puranjay Mohan,
   with fixes by Joe Lawrence)

 Thanks,

	Ingo

------------------>
Joe Lawrence (2):
      objtool: Keep failing test workdirs by default
      objtool: Forward toolchain variables to the klp test runner

Puranjay Mohan (16):
      objtool: Add test harness for the klp subcommands
      objtool/klp: Add test for rejecting changed data
      objtool/klp: Add test for newly introduced data
      objtool/klp: Add test for newly introduced functions
      objtool/klp: Add test for static local correlation
      objtool/klp: Add test for cold function halves
      objtool/klp: Add test for special section extraction
      objtool/klp: Add test for selective special section extraction
      objtool/klp: Add test for jump table key relocations
      objtool/klp: Add test for rejecting module-owned static branch keys
      objtool/klp: Add test for rejecting module-owned static call keys
      objtool/klp: Add test for symids in discarded sections
      objtool/klp: Add test for rejecting references to init code/data
      objtool/klp: Add test for correlation across ThinLTO name mangling
      objtool/klp: Add test for objects without .modinfo
      objtool/klp: Add test for unchecksummed input

Song Liu (40):
      objtool/klp: Check the klp test environment once, before any test
      objtool/klp: Group the klp tests by architecture
      objtool/klp: Classify klp test outcomes
      objtool/klp: Build klp test fixtures through the harness
      objtool/klp: Grow the klp test harness vocabulary
      objtool/klp: Give each run one working directory, one per test inside it
      objtool/klp: Run the klp tests under set -u
      objtool/klp: Document the klp test harness
      objtool/klp: Add klp diff and post-link regression tests
      objtool/klp: Add test for klp reloc section naming in module objects
      objtool/klp: Add test for vmlinux relocs in a patched module
      objtool/klp: Add test for Module.symvers path normalization
      objtool/klp: Add test for the contents of the klp_funcs list
      objtool/klp: Add test for EXPORT_SYMBOL_FOR_MODULES references
      objtool/klp: Add test for new references to exported symbols
      objtool/klp: Add test for empty x86 alternative replacements
      objtool/klp: Add test for recorded checksum values
      objtool/klp: Add test for position-independent checksums
      objtool/klp: Add test for sympos in module objects
      objtool/klp: Add test for sympos resolved against a linked vmlinux
      objtool/klp: Add test for static locals which must not be correlated
      objtool/klp: Add test for __bug_table, __ex_table and __mcount_loc extraction
      objtool/klp: Add test for kCFI prefix symbols and traps
      objtool/klp: Add test for symbols whose linkage the patch changes
      objtool/klp: Test rejection of a file-local static branch key
      objtool/klp: Test a hand-built livepatch module's static call keys
      objtool/klp: Test text annotations on alternative replacements
      objtool/klp: Add test for data object checksums
      objtool/klp: Add test for symbols with no checksum entry of their own
      objtool/klp: Add test for a static branch introduced by the patch
      objtool/klp: Add test for tracepoint and pr_debug static branch keys
      objtool/klp: Add test for a static call introduced by the patch
      objtool/klp: Add test for instruction operand checksums
      objtool/klp: Add test for alternative replacement code in checksums
      objtool/klp: Add test for the alignment of cloned data sections
      objtool/klp: Add test for a patch which strips a data annotation
      objtool/klp: Add test for absolute and __ADDRESSABLE symbols
      objtool/klp: Add test for UBSAN metadata in an unchanged function
      objtool/klp: Add test for Clang switch jump tables
      objtool/klp: Add test for ThinLTO symbols sharing a demangled name


 tools/objtool/Documentation/klp-test-design.txt    | 286 +++++++
 tools/objtool/Documentation/klp-write-tests.txt    | 266 ++++++
 tools/objtool/Makefile                             |  15 +-
 .../tests/generic/fixtures/abs_and_addressable.c   |  44 +
 tools/objtool/tests/generic/fixtures/basic.c       |  20 +
 .../objtool/tests/generic/fixtures/changed_data.c  |  16 +
 .../objtool/tests/generic/fixtures/checksum_data.c | 116 +++
 .../objtool/tests/generic/fixtures/checksum_insn.c |  78 ++
 .../tests/generic/fixtures/checksum_position.c     |  42 +
 .../objtool/tests/generic/fixtures/checksum_skip.c |  47 ++
 .../objtool/tests/generic/fixtures/cold_function.c |  21 +
 .../objtool/tests/generic/fixtures/cross_module.c  |  25 +
 .../tests/generic/fixtures/data_alignment.c        |  29 +
 .../tests/generic/fixtures/function_removal.c      |  25 +
 .../tests/generic/fixtures/init_reference.c        |  17 +
 tools/objtool/tests/generic/fixtures/jump_label.c  |  76 ++
 tools/objtool/tests/generic/fixtures/klp_funcs.c   |  31 +
 .../tests/generic/fixtures/local_to_global.c       |  34 +
 tools/objtool/tests/generic/fixtures/new_data.c    |  23 +
 .../tests/generic/fixtures/new_export_ref.c        |  35 +
 .../objtool/tests/generic/fixtures/new_function.c  |  21 +
 tools/objtool/tests/generic/fixtures/no_modinfo.c  |  11 +
 .../tests/generic/fixtures/special_section.c       |  24 +
 .../generic/fixtures/special_section_shared.c      |  31 +
 tools/objtool/tests/generic/fixtures/static_call.c |  59 ++
 .../objtool/tests/generic/fixtures/static_local.c  |  17 +
 .../generic/fixtures/static_local_uncorrelated.c   |  41 +
 .../objtool/tests/generic/fixtures/switch_rodata.c |  31 +
 .../tests/generic/fixtures/symid_discarded.c       |  25 +
 tools/objtool/tests/generic/fixtures/sympos_dup.c  |  32 +
 .../tests/generic/fixtures/sympos_vmlinux.c        |  40 +
 .../tests/generic/fixtures/thinlto_ambiguity.c     |  57 ++
 .../objtool/tests/generic/fixtures/thinlto_local.c |  39 +
 tools/objtool/tests/generic/fixtures/ubsan_noise.c |  49 ++
 .../tests/generic/test-abs-and-addressable.sh      |  50 ++
 tools/objtool/tests/generic/test-basic.sh          |  17 +
 tools/objtool/tests/generic/test-changed-data.sh   |  18 +
 tools/objtool/tests/generic/test-checksum-data.sh  |  61 ++
 tools/objtool/tests/generic/test-checksum-debug.sh |  49 ++
 tools/objtool/tests/generic/test-checksum-insn.sh  |  49 ++
 .../tests/generic/test-checksum-position.sh        |  51 ++
 tools/objtool/tests/generic/test-checksum-skip.sh  |  81 ++
 tools/objtool/tests/generic/test-checksum-value.sh |  37 +
 tools/objtool/tests/generic/test-cold-function.sh  |  39 +
 tools/objtool/tests/generic/test-data-alignment.sh |  40 +
 .../generic/test-export-symbol-for-modules.sh      |  39 +
 .../objtool/tests/generic/test-function-removal.sh |  34 +
 tools/objtool/tests/generic/test-init-reference.sh |  29 +
 .../tests/generic/test-jump-label-exempt-keys.sh   |  51 ++
 tools/objtool/tests/generic/test-jump-label-key.sh |  44 +
 .../tests/generic/test-jump-label-module-key.sh    |  22 +
 .../generic/test-jump-label-module-static-key.sh   |  45 +
 .../tests/generic/test-jump-label-new-key.sh       |  51 ++
 .../tests/generic/test-klp-funcs-content.sh        |  45 +
 .../tests/generic/test-local-to-global-flip.sh     |  63 ++
 .../objtool/tests/generic/test-local-vs-export.sh  |  32 +
 .../objtool/tests/generic/test-missing-checksum.sh |  18 +
 .../objtool/tests/generic/test-missing-modinfo.sh  |  16 +
 .../tests/generic/test-modname-normalize.sh        |  26 +
 tools/objtool/tests/generic/test-module-object.sh  |  31 +
 .../tests/generic/test-module-vmlinux-reloc.sh     |  40 +
 tools/objtool/tests/generic/test-new-data.sh       |  27 +
 tools/objtool/tests/generic/test-new-export-ref.sh |  46 ++
 tools/objtool/tests/generic/test-new-function.sh   |  16 +
 tools/objtool/tests/generic/test-post-link.sh      |  42 +
 .../tests/generic/test-special-section-shared.sh   |  26 +
 .../objtool/tests/generic/test-special-section.sh  |  20 +
 .../generic/test-static-call-annotate-stripped.sh  |  42 +
 .../tests/generic/test-static-call-module-key.sh   |  36 +
 .../objtool/tests/generic/test-static-call-new.sh  |  45 +
 .../generic/test-static-local-uncorrelated.sh      |  41 +
 tools/objtool/tests/generic/test-static-local.sh   |  24 +
 tools/objtool/tests/generic/test-switch-rodata.sh  |  53 ++
 .../objtool/tests/generic/test-symid-discarded.sh  |  44 +
 tools/objtool/tests/generic/test-sympos-vmlinux.sh |  57 ++
 tools/objtool/tests/generic/test-sympos.sh         |  51 ++
 .../tests/generic/test-symvers-parse-error.sh      |  23 +
 .../tests/generic/test-thinlto-ambiguity.sh        |  77 ++
 tools/objtool/tests/generic/test-thinlto-local.sh  |  48 ++
 tools/objtool/tests/generic/test-ubsan-noise.sh    |  48 ++
 tools/objtool/tests/lib.sh                         | 911 +++++++++++++++++++++
 tools/objtool/tests/run-tests.sh                   | 239 ++++++
 tools/objtool/tests/x86/fixtures/alt_annotate.c    |  57 ++
 tools/objtool/tests/x86/fixtures/checksum_alt.c    |  66 ++
 .../objtool/tests/x86/fixtures/empty_alternative.c |  77 ++
 tools/objtool/tests/x86/fixtures/kcfi.c            |  39 +
 .../objtool/tests/x86/fixtures/special_sections.c  |  77 ++
 .../tests/x86/fixtures/static_call_no_key.c        |  32 +
 tools/objtool/tests/x86/test-alt-annotation.sh     |  38 +
 tools/objtool/tests/x86/test-checksum-alt.sh       |  45 +
 tools/objtool/tests/x86/test-empty-alternative.sh  |  31 +
 tools/objtool/tests/x86/test-kcfi.sh               |  39 +
 .../tests/x86/test-manual-klp-static-call.sh       |  40 +
 tools/objtool/tests/x86/test-special-sections.sh   |  42 +
 94 files changed, 5299 insertions(+), 1 deletion(-)
 create mode 100644 tools/objtool/Documentation/klp-test-design.txt
 create mode 100644 tools/objtool/Documentation/klp-write-tests.txt
 create mode 100644 tools/objtool/tests/generic/fixtures/abs_and_addressable.c
 create mode 100644 tools/objtool/tests/generic/fixtures/basic.c
 create mode 100644 tools/objtool/tests/generic/fixtures/changed_data.c
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_data.c
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_insn.c
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_position.c
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_skip.c
 create mode 100644 tools/objtool/tests/generic/fixtures/cold_function.c
 create mode 100644 tools/objtool/tests/generic/fixtures/cross_module.c
 create mode 100644 tools/objtool/tests/generic/fixtures/data_alignment.c
 create mode 100644 tools/objtool/tests/generic/fixtures/function_removal.c
 create mode 100644 tools/objtool/tests/generic/fixtures/init_reference.c
 create mode 100644 tools/objtool/tests/generic/fixtures/jump_label.c
 create mode 100644 tools/objtool/tests/generic/fixtures/klp_funcs.c
 create mode 100644 tools/objtool/tests/generic/fixtures/local_to_global.c
 create mode 100644 tools/objtool/tests/generic/fixtures/new_data.c
 create mode 100644 tools/objtool/tests/generic/fixtures/new_export_ref.c
 create mode 100644 tools/objtool/tests/generic/fixtures/new_function.c
 create mode 100644 tools/objtool/tests/generic/fixtures/no_modinfo.c
 create mode 100644 tools/objtool/tests/generic/fixtures/special_section.c
 create mode 100644 tools/objtool/tests/generic/fixtures/special_section_shared.c
 create mode 100644 tools/objtool/tests/generic/fixtures/static_call.c
 create mode 100644 tools/objtool/tests/generic/fixtures/static_local.c
 create mode 100644 tools/objtool/tests/generic/fixtures/static_local_uncorrelated.c
 create mode 100644 tools/objtool/tests/generic/fixtures/switch_rodata.c
 create mode 100644 tools/objtool/tests/generic/fixtures/symid_discarded.c
 create mode 100644 tools/objtool/tests/generic/fixtures/sympos_dup.c
 create mode 100644 tools/objtool/tests/generic/fixtures/sympos_vmlinux.c
 create mode 100644 tools/objtool/tests/generic/fixtures/thinlto_ambiguity.c
 create mode 100644 tools/objtool/tests/generic/fixtures/thinlto_local.c
 create mode 100644 tools/objtool/tests/generic/fixtures/ubsan_noise.c
 create mode 100755 tools/objtool/tests/generic/test-abs-and-addressable.sh
 create mode 100755 tools/objtool/tests/generic/test-basic.sh
 create mode 100755 tools/objtool/tests/generic/test-changed-data.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-data.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-debug.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-insn.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-position.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-skip.sh
 create mode 100755 tools/objtool/tests/generic/test-checksum-value.sh
 create mode 100755 tools/objtool/tests/generic/test-cold-function.sh
 create mode 100755 tools/objtool/tests/generic/test-data-alignment.sh
 create mode 100755 tools/objtool/tests/generic/test-export-symbol-for-modules.sh
 create mode 100755 tools/objtool/tests/generic/test-function-removal.sh
 create mode 100755 tools/objtool/tests/generic/test-init-reference.sh
 create mode 100755 tools/objtool/tests/generic/test-jump-label-exempt-keys.sh
 create mode 100755 tools/objtool/tests/generic/test-jump-label-key.sh
 create mode 100755 tools/objtool/tests/generic/test-jump-label-module-key.sh
 create mode 100755 tools/objtool/tests/generic/test-jump-label-module-static-key.sh
 create mode 100755 tools/objtool/tests/generic/test-jump-label-new-key.sh
 create mode 100755 tools/objtool/tests/generic/test-klp-funcs-content.sh
 create mode 100755 tools/objtool/tests/generic/test-local-to-global-flip.sh
 create mode 100755 tools/objtool/tests/generic/test-local-vs-export.sh
 create mode 100755 tools/objtool/tests/generic/test-missing-checksum.sh
 create mode 100755 tools/objtool/tests/generic/test-missing-modinfo.sh
 create mode 100755 tools/objtool/tests/generic/test-modname-normalize.sh
 create mode 100755 tools/objtool/tests/generic/test-module-object.sh
 create mode 100755 tools/objtool/tests/generic/test-module-vmlinux-reloc.sh
 create mode 100755 tools/objtool/tests/generic/test-new-data.sh
 create mode 100755 tools/objtool/tests/generic/test-new-export-ref.sh
 create mode 100755 tools/objtool/tests/generic/test-new-function.sh
 create mode 100755 tools/objtool/tests/generic/test-post-link.sh
 create mode 100755 tools/objtool/tests/generic/test-special-section-shared.sh
 create mode 100755 tools/objtool/tests/generic/test-special-section.sh
 create mode 100755 tools/objtool/tests/generic/test-static-call-annotate-stripped.sh
 create mode 100755 tools/objtool/tests/generic/test-static-call-module-key.sh
 create mode 100755 tools/objtool/tests/generic/test-static-call-new.sh
 create mode 100755 tools/objtool/tests/generic/test-static-local-uncorrelated.sh
 create mode 100755 tools/objtool/tests/generic/test-static-local.sh
 create mode 100755 tools/objtool/tests/generic/test-switch-rodata.sh
 create mode 100755 tools/objtool/tests/generic/test-symid-discarded.sh
 create mode 100755 tools/objtool/tests/generic/test-sympos-vmlinux.sh
 create mode 100755 tools/objtool/tests/generic/test-sympos.sh
 create mode 100755 tools/objtool/tests/generic/test-symvers-parse-error.sh
 create mode 100755 tools/objtool/tests/generic/test-thinlto-ambiguity.sh
 create mode 100755 tools/objtool/tests/generic/test-thinlto-local.sh
 create mode 100755 tools/objtool/tests/generic/test-ubsan-noise.sh
 create mode 100644 tools/objtool/tests/lib.sh
 create mode 100755 tools/objtool/tests/run-tests.sh
 create mode 100644 tools/objtool/tests/x86/fixtures/alt_annotate.c
 create mode 100644 tools/objtool/tests/x86/fixtures/checksum_alt.c
 create mode 100644 tools/objtool/tests/x86/fixtures/empty_alternative.c
 create mode 100644 tools/objtool/tests/x86/fixtures/kcfi.c
 create mode 100644 tools/objtool/tests/x86/fixtures/special_sections.c
 create mode 100644 tools/objtool/tests/x86/fixtures/static_call_no_key.c
 create mode 100755 tools/objtool/tests/x86/test-alt-annotation.sh
 create mode 100755 tools/objtool/tests/x86/test-checksum-alt.sh
 create mode 100755 tools/objtool/tests/x86/test-empty-alternative.sh
 create mode 100755 tools/objtool/tests/x86/test-kcfi.sh
 create mode 100755 tools/objtool/tests/x86/test-manual-klp-static-call.sh
 create mode 100755 tools/objtool/tests/x86/test-special-sections.sh
