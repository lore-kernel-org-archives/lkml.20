Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143DB429CFB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453522; cv=none; b=cxonD9cwlPF08b+J7wx2ZLTbsYZBNeH7sYTK8zksoJLl9/+eo32AzxobuFW7VYh6d2aoEEIhR8ltp8f+FSZuWQnjBlfrS/KgT+7W/t4AcnLIN0VIj7Y4L5sRVmvM5ytSL4bjF1nJEL12/bDv1LxKmTkUkCAxYef1eFdf0Dy13vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453522; c=relaxed/simple;
	bh=++JdvzesNK/9QqXWbitrWqBYdphcQotoMlwNblNi+98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Znz6I4ZmSrd/bEsfYFQU5eBK9Yb5eCs4G27GFB76Lns3BLJe1mFSTGhPIP65YrgEPaylNSh0QnxXRoDByqaQwYV6wiCqXGHifnR/dUxu6EukmUB3nSYFeqAeI4f0rxztk1cl2Xv//NI5z1A7PNddvVsyqf+HbHoQvGBpVPvHYqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBoDaOM/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBoDaOM/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1275194a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453520; x=1792058320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0vJYlrtL72ZSu7n3ZwG4hDCVhRKYPTlVll3rkvqToY=;
        b=bBoDaOM/k2feXwz0Tqmv8Y54bymnAFB6PazzGmruIHRmdHh6qUNEwmfDhI5IDR3DKR
         MhXNB7CxAc+31F22DbGSSOrC8qo47DC9+Rps/zdogCV5pUnZpfMGBUVYXyxAMGJ5MMOM
         /JkvwUqN0dblnNIet8ylS7ShbuWGS9FztJqkeHE1eY2y3Cu7Jni/qKNaCI5rN+v5HZq3
         ZWY26cSzHRN4DmDDg8vBWybxIqw2YTRtC9kqc/u7wmdlhpOJ6Trws87ZQ7R1oWYff0rL
         /tsijxWdq5RonefojvxDggkF8lBfEOEtuhsX5xJUPgsy0JiC0JxD6uFxcBhScwJCFabB
         beqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453520; x=1792058320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0vJYlrtL72ZSu7n3ZwG4hDCVhRKYPTlVll3rkvqToY=;
        b=Omek3+iSEuNq7KPAV/Mm9Wf7Z7SSGGWAwf89HDM3Uop2+6RLR3IgBUvkb3SlHUDW/z
         BJZhhoplROIYBMvutGyxrEBnG09RLa6uviBVAwOKN6BHlxAlmS5KZCXaQUezNkU/xJe/
         aMt229ZfaJeg157keXymdPXLuFeBUYTuHhzSxK7eeYQz+EP+qAdOidlsT6vn7YBOfnjq
         wfFAmvCZetPWCKxViFzFw6iE7nDzQ50K9LfIRpF2C7V9vpQdeG57u58L2Rz3k/Fu3Pk5
         zSis9WAE3prh39dQt4t8Ms1jWgk6saPSarPIkiRri2/g+Dd95hmA+9IIR9yj+8uwH9Ug
         9FcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK6xFdqxG6VFrrwM9RiRGptRkVVY6X8h2HmMLgdDp8N1e3fP36ZFHgGnDWDjr4v4Susvo6Q5xkFcC8mBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLnh832rO+FRt99UIxByl1olIU+hp8FiELaX8K/JFHXlQH2pxD
	zifueb7vQToBdW9xkbppFmnpLJUdthbhB5QCYsswDxLQP35QgXFjg19w
X-Gm-Gg: AYBFou3uhHmMF5G4PUj5+QI/SGZmFTpSGBc9K7QEzoxt/VZtZb2xonAl8hyfrqAgg8h
	LliQgBF8YZ4sWbWgaICs+atRyGbm2M3vtGESBkctzJ90tiPusENdYpEwSp/jCwvPZJ4HNh8KaBT
	OTb/QGO6ze3OxSP4q7v50gqRb834onJRlcaTvTNOJKRHx7pZflU7u/KuiWF9uqIITiwvLK/twTG
	5ZwmhF5jGHoZPbRR1iNsERhw7RXLetdYMg6yfk3BIbtz8VZfFib0YCRZxH6+R1MqrKTiTvoHp/4
	/d69YoscZMYXHEZrFYwoxTmPtVQ4FENNobNtLD1EwOsEEN2bnyyfCdVHYkh1inZt9pDUfby0uvs
	u+N7AJnpkzkVuoIvPUsjeG0V3SbMLE/S4I/ldisjnlsTLbDHKVqVMmIqN0wYYQIDyen+ERq3PYd
	QYAXJl52rGwan1rp75wOMjRsIBaUVVibOyVClSHt2OZrNouhDyNfUcyVTX6DLFlCxnXDgCth0F1
	vCj0OGi17+yVInTqCgwEtOmPBIi3yt6z/BT9jqFLi6gFN2+zytd/qyx
X-Received: by 2002:a17:90b:1845:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-3a8a0a921b3mr3264978a91.15.1791453520241;
        Thu, 08 Oct 2026 02:58:40 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.58.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:58:39 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 0/9] livepatch: Add support for scoped atomic replace
Date: Thu,  8 Oct 2026 17:58:21 +0800
Message-ID: <20261008095830.26308-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomic replacement is currently all-or-nothing: a livepatch with
"replace" set either atomically replaces all previously installed
livepatches, or - with "replace" disabled - it replaces none. There
is no way to atomically replace only a selected set of livepatches
while keeping the rest running untouched.

We previously proposed a BPF+livepatch method to enable rapid
experimentation with new kernel features without interrupting production
workloads:

  https://lore.kernel.org/live-patching/20260402092607.96430-1-laoar.shao@gmail.com/

In the resulting discussion, Song and Petr suggested that it should be
possible to selectively replace or skip individual livepatches.

This patchset introduces a more flexible model using two new fields in
struct klp_patch:

- provides: an unsigned int id identifying the replacement scope of
  the livepatch. Livepatches that share the same provides id replace
  each other, so at most one livepatch of each provides id can be
  enabled at a time. By default (provides=0), every livepatch that
  does not declare an explicit provides id belongs to the same scope:
  loading a new provides=0 livepatch atomically replaces the
  previously enabled one.

- obsoletes: an optional array of unsigned int ids specifying
  additional provides ids to be replaced. This allows a new patch
  to explicitly obsolete patches from different scopes.

A new livepatch atomically replaces any existing livepatch that
satisfies either of the following conditions:

  1. it has the same provides id as the new patch,
  2. its provides id is listed in the new patch's obsoletes list.

A new livepatch that does not replace an existing one can coexist
with it. In this case, the two livepatches must not modify the same
function, or use the state with the same id. Any attempt to load an
incompatible livepatch will be rejected by the kernel.

Previously, setting 'replace' to 0 was the only way to keep
certain livepatches persistent on the system, forcing developers to
disable atomic replacement entirely. With the introduction of provides
and obsoletes, developers now have a selective option to keep specific
livepatches persistent while maintaining atomic replacement capabilities
elsewhere.

IMPORTANT:
- this design deprecates the traditional non-atomic-replace model.
- the behavior of replacing all non-atomic-replace livepatches with a
  single atomic-replace livepatch is also deprecated.

The new "provides" and "obsoletes" attributes are exposed through
sysfs and the kselftests cover the replacement and coexistence
semantics described above.

At present, KLP state, shadow variables, and callbacks are not
integrated with the new provides/obsoletes mechanism in this patchset.
Support for these features is deferred until Petr's klp-state-transfer
infrastructure is completed and merged:

  https://github.com/pmladek/linux/tree/klp-state-transfer-v1-iter12

It is based on livepatching tree's for-next branch.

Future work
===========

For backward compatibility with the old non-atomic-replace model, we
might consider adding a new "noreplace" flag. A livepatch with this
flag set would not replace any other livepatch, but it could still
be replaced by an atomic-replace livepatch. This would preserve the
behavior of the original non-atomic-replace model.

We can revisit this once a real use case for the non-atomic-replace
model emerges.

Changes
=======

v10->v11:
- check $HAS_PROVIDES_ATTR positively in #2 (Petr)
- document the conflict semantics in #5 (Petr)
- per the LPC discussion, drop the symmetric obsoletes semantics

v10: https://lore.kernel.org/live-patching/20260930030323.14396-1-laoar.shao@gmail.com/

v9->v10:
Various comments from Miroslav:
- rename skip() to skip_exit() and skip_test() to skip() in #2
- define CONFIG_KLP_HAS_PROVIDES in #2
- add a comment about the CONFIG_IKCONFIG_PROC fallback in #2
- adjust the order around `CONFIG_KLP_HAS_PROVIDES`
- update the comment above klp_add_nops() and
  klp_unpatch_replaced_patches()
- add verification step for `provides 0 coexists with provides 1` in #7

v9: https://lore.kernel.org/all/20260913024228.72317-1-laoar.shao@gmail.com/

v8->v9:
- extract the replace-related test scenarios into functions in patch #2
  (Song)
- make the state module parameters read-only to avoid a potential
  state leak if tampered with after load (sashiko-bot)
- verify that /proc/meminfo is no longer patched after the atomic
  replacement (sashiko-bot)
- unload the coexisting state livepatches in LIFO order so that the
  console_loglevel is properly restored (sashiko-bot)

v8: https://lore.kernel.org/all/20260909024324.16002-1-laoar.shao@gmail.com/

v7->v8:
- fix the commit log and documentation regarding `--obsoletes`
  (sashiko-bot)
- remove the `--obsoletes` validation requirement from klp-build (Josh)
- explicitly log the skip info for the deprecated `replace` attribute on
  the new kernel
- implement symmetric obsoletes (Petr)
- rename test module files for clarity (Petr)
- add CONFIG_KLP_HAS_PROVIDES (Petr)
- avoid duplicate test module source files (Petr)
- documentation and commit log improvement (Petr)
- add more selftests for provides/obsoletes (Petr)
- other code cleanups (Petr, Josh)

v7: https://lore.kernel.org/all/20260825114641.80452-1-laoar.shao@gmail.com/

v6->v7:
- rebase it to livepatching's for-next branch
- rename klp_patch_replaceable() to klp_patch_replaces() (Song)
- remove "[]" around --obsoletes (Song)

v6: https://lore.kernel.org/live-patching/20260607131659.29281-1-laoar.shao@gmail.com/

v5->v6:
- Check `--provides` argument in `klp-build (sashiko)
- Fix the 'replace' feature detection for OOT kernel builds (sashiko)
- Fix race condition in sysfs polling (sashiko)

v5: https://lore.kernel.org/live-patching/20260809091954.22930-1-laoar.shao@gmail.com

v4(RFC)->v5:
- Add selftests and Remove the RFC
- Fmprove klp_has_function_conflict() (Song)
- Fix a pre-exisiting bug
- Fix bugs reported by sashiko

v4 (RFC): https://lore.kernel.org/live-patching/20260804065010.44922-1-laoar.shao@gmail.com/

v3->v4(RFC):
- Allow a livepatch to replace livepatches with different provides IDs.
  Replace the single `replace_set` field with two separate fields,
  `provides` and `obsoletes`, for more flexible replacement semantics.
  (Petr, Joe)

v3: https://lore.kernel.org/live-patching/20260607131659.29281-1-laoar.shao@gmail.com/

v2->v3:
- Address the feedback from Sachiko AI
 - Fix the pre-existing NULL pointer dereference issue
 - Move klp_find_func into core.h
 - Don't deprecate stack_order completely

v2: https://lore.kernel.org/live-patching/20260529034542.68766-1-laoar.shao@gmail.com/

v1->v2:
- Incorporate feedback from Petr:
  - Initialize replace_set to 0 by default
  - Improve documentation
  - Enforce that livepatches in different replace_sets cannot use the same
    state->id.
  - Enforce that livepatches in different replace_sets cannot modify the
    same function.
  - Ensure consistent capitalization and naming usage of KLP_REPLACE_SET.
- Incorporate feedback from Sachiko AI:
  - Skip the klp_transition patch during klp_force_transition().

v1 (RFC): https://lore.kernel.org/live-patching/20260513143321.26185-1-laoar.shao@gmail.com/

Yafang Shao (9):
  selftests/livepatch: Clarify test module file names
  selftests/livepatch: Adapt atomic replace tests to provides/obsoletes
  livepatch: Make klp_find_func() non static
  livepatch: Call klp_init_patch_early() earlier
  livepatch: Implement provides and obsoletes for scoped atomic replace
  livepatch: Deprecate stack_order
  selftests/livepatch: Add provides/obsoletes test scenarios
  selftests/livepatch: Add state test for provides/obsoletes
  selftests/livepatch: Add function test for provides/obsoletes

 .../ABI/removed/sysfs-kernel-livepatch        |  16 +
 .../ABI/testing/sysfs-kernel-livepatch        |  27 +-
 .../livepatch/cumulative-patches.rst          |  91 ++-
 Documentation/livepatch/livepatch.rst         |  24 +-
 include/linux/livepatch.h                     |   8 +-
 kernel/livepatch/Kconfig                      |  14 +
 kernel/livepatch/core.c                       | 124 ++--
 kernel/livepatch/core.h                       |   2 +
 kernel/livepatch/state.c                      |  57 +-
 kernel/livepatch/transition.c                 |  15 +-
 scripts/livepatch/init.c                      |  19 +-
 scripts/livepatch/klp-build                   |  23 +-
 tools/testing/selftests/livepatch/Makefile    |   3 +-
 .../testing/selftests/livepatch/functions.sh  |  42 +-
 .../selftests/livepatch/test-callbacks.sh     |  43 +-
 .../selftests/livepatch/test-ftrace.sh        |   2 +-
 .../selftests/livepatch/test-kprobe.sh        |  14 +-
 .../selftests/livepatch/test-livepatch.sh     | 108 +--
 .../livepatch/test-provides-obsoletes.sh      | 656 ++++++++++++++++++
 .../selftests/livepatch/test-syscall.sh       |   2 +-
 .../testing/selftests/livepatch/test-sysfs.sh |   6 +-
 .../selftests/livepatch/test_modules/Makefile |   9 +-
 .../test_modules/test_klp_callbacks_demo2.c   |  12 +
 ...est_klp_kprobe.c => test_klp_cmdline_kp.c} |  10 +-
 ..._klp_livepatch.c => test_klp_cmdline_lp.c} |  21 +-
 ...atomic_replace.c => test_klp_meminfo_lp.c} |  32 +-
 .../test_modules/test_klp_meminfo_lp2.c       |   2 +
 .../livepatch/test_modules/test_klp_state.c   |  40 +-
 .../livepatch/test_modules/test_klp_state2.c  |  48 +-
 ...lp_syscall.c => test_klp_syscall_getpid.c} |   4 +-
 30 files changed, 1229 insertions(+), 245 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-livepatch
 create mode 100755 tools/testing/selftests/livepatch/test-provides-obsoletes.sh
 rename tools/testing/selftests/livepatch/test_modules/{test_klp_kprobe.c => test_klp_cmdline_kp.c} (78%)
 rename tools/testing/selftests/livepatch/test_modules/{test_klp_livepatch.c => test_klp_cmdline_lp.c} (66%)
 rename tools/testing/selftests/livepatch/test_modules/{test_klp_atomic_replace.c => test_klp_meminfo_lp.c} (57%)
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c
 rename tools/testing/selftests/livepatch/test_modules/{test_klp_syscall.c => test_klp_syscall_getpid.c} (95%)

-- 
2.52.0

