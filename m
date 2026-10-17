Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AAF3AAF67
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206023; cv=none; b=LLuVCFLKgLuFpPejPRZiYBUaa/KLDrwd+FOY8LrX0lMKX3EoORR/ZNJH06yW5hiMEhwiJDYXFE8xb6VYTaYn75WBWr56yYRpP5VDmqXRAHVDAZE4sYX3+yhaqBAAn/L4HPJ0ledq2ZC3pzgx7/71A3hzWkeNU8wXdrYkSLetXy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206023; c=relaxed/simple;
	bh=jCC6ab41skgLb0cxJd1pnHPhJfxTxprmPUo+gGC848Y=;
	h=Date:Message-ID:From:To:Cc:Subject; b=cQnRxtAk+H89qjFipclUrFDzed4DuP8yadc2D40p9FATKSglae9foOCRpY3kEqHnWDWW3EIPMSPAqwIehu8f2vvOYIEdvPsjB3pDw+bd3UllfvBOqKDzSSoWYbenz+riNbG9zbnNrnCpV29Z3kCUkmURf3Dul8UK61+hww4EV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=e+S9ns2+; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="e+S9ns2+"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91bb5795792so5433856d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792206012; x=1792810812; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrxhfZ+QmZki79F0++sY9fiUJbLb6IXyxjTdrcANp3E=;
        b=e+S9ns2+0PoMo7VYuo2xsSakPjFtifh55pkLs1zeD5JsRD/fdjaKVzJB/77TuCaG7Y
         IXuNrAvf/P0LlRiUQY0c4NFlrpUT2oNfDX0OsIadsrTScdfJiYjh1z+qleR0oDDWtdeM
         aHNzz+cGF0gnZcotGh+AfNctym2RODUsTl4U8OUnFoypiYMAthEayAfJeWrCcidF7+i8
         hd4rhr938eISH76PoN2Mu+WMbJ24K6dFxZT4KFi7w56GN2lq3g1EPp4FsE+OetwhgiU9
         /D2MgCOjA64mVR3Xh+IbDvBluWFXprfcGPj6AX0jXhM6xBv4v5Dem4mMQDK5umwjLBAi
         pJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206012; x=1792810812;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MrxhfZ+QmZki79F0++sY9fiUJbLb6IXyxjTdrcANp3E=;
        b=aIjBCj0Pc8jN5n73me4AOj0k0pljp6yY4f3DueEZCoI3nVpmdAHPyzfEORwyiIph65
         LXp6uoIBbPoDgAD4CHT92+e8+1NEz1Ok8HOXL6vEDPUdDbBQ4RZ8VplZ67hHEeswHQKL
         tyfzhcE7nLCgXlDzLCK1XGAQHMVAYTZ1L0Y4GcemaLlOe75D0zj9Htolzo8ZO+WFpXDi
         yEW+m4Np8YL8glxyL8NGowWZgfK55UTNXy1FFpffOulcPUMzcO4WMWoQx4cTfn062K2F
         2dBDJmHhaT6BF09cupLHUvlpQUOLzp7xeyncLPPUOQ0ijRFcJE7/RxNQ9vQ4lgBtK5b7
         GUkw==
X-Forwarded-Encrypted: i=1; AKwUvBwged3M3IVdK1UGlfx4DAt2g7XP5J0ewnO4hLJKl+j9x02WOiSrt0qSTuQ5p5tfbD5XKcosVm1uUVE0T0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEO3L0iIi864jo4lBjAs6XNd3aiiA9479MZXQwWkU9d5DJuNA7
	2C8lGe2F6m4SaX4UcqPBmlZ4gOEKQEMx7LRhVklxEvpqfQO7IPrfp1MlkxKBPMfVBQ==
X-Gm-Gg: AYBFou0aowcoviaoJ9y4sZmEif8Htt1Jv8+7fgYNQ/fCebpP2R9HzgBFt43Jz9VoLmI
	RgoIT0G9ROz9qvdfDYR+ShRyIbqvpgOdcHz7BWihvKFhnjxoDNMPRky5pZpG0uFWgD/F8GvA7yI
	5QvvxhmFP/kHO7Ws3wl+jdcHkSPoeF24WTlB3EmkaSbfqfCENSL4v12P3XpbpiWTxjMNBRruJp5
	tDzB8FXA54i2vB6tdL9uvDlWgcgQyD0AF/izkyIFgNRMOp4zZNdhQP/995Knei4iTQFkgAJlXgM
	M7X1HF9wdCyPQsvwbj2D7YP81mZzXSTfJFAs9f9gfFh6h6p6GCWyWaPvhgeEycsIdJ4MeHfZzxr
	0+0kRdm0DlL873q0LDjtdMJuAB3vt/4aMyNakT3EhrkmoHGSsY0gvlkO/4lyNKtYvwkKRFaNoas
	HN1r5IBru3UmpFPGglOCCO4ZjJmZLyHJiwQ7HCdweypD829ql2O9s6CwoAWNeal0OkGFEw/SvhT
	S2fqXETuGJ2uusmUojGxJfLSma2St+e+Lx3aVmLQU4tpcXASB0uvNF9IxeXKrxkJp0STTSDufj+
	jtLXWwk1eg==
X-Received: by 2002:a05:620a:4045:b0:93e:c12c:9dc8 with SMTP id af79cd13be357-93f29dc6f38mr318508585a.72.1792206011516;
        Fri, 16 Oct 2026 20:00:11 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1b882asm359713685a.42.2026.10.16.20.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:00:10 -0700 (PDT)
Date: Fri, 16 Oct 2026 23:00:10 -0400
Message-ID: <bf59b601a40b9955ee8922c5593eeaf0@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] lsm/lsm-pr-20261016
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Sixteen LSM framework patches for the Linux v7.4 merge window:

- Add LSM hooks, object blobs, and audit records for namespaces

Add the necessary bits to enable LSMs to enforce access controls on the
management of various kernel namespaces.  While this pull request does
not contain any in-tree users of these hooks, the Landlock pull request
for Linux v7.4 will include Landlock support and the next merge window
will likely include SELinux support as well.  Considering the development
behind these hooks, I expect that BPF LSM developers will also be making
use of the namespace hooks, if they haven't already.

- Update the inode LSM hooks to include mount idmaps

This allows LSMs to incorporate the mount ID mapping into their access
control decisions.  While there are no current in-tree users of this,
it was requested by those developing BPF LSM programs and this pull
request includes a BPF LSM selftest.

- Preserve the full 32-bit ioctl command in LSM audit records

Previously only the low 16 bits were logged, ignoring the direction and
size information in the upper 16 bits.  The pull request also includes
a Landlock based selftest to verify the full 32-bit ioctl value.

- Ensure we don't call security_backing_file_free() multiple times

Thankfully we don't have a problem with the current code base, but we
want to fix this behavior now before it becomes a problem.

- Clarify that only the current task may access current->cred

The current code is a bit misleading around safely accessing the cred
field in a task struct.  Through comment and code corrections, this pull
request clarifies that only the task itself may access its cred field.

- Add SLAB_NO_MERGE to the credential object cache

Harden the credential cache by ensuring credential objects live on
dedicated slab pages.

- Make use of safe memory zero'ing in the LSM Rust bindings

- Update the docs for the current behavior of /sys/kernel/security/lsm

- Update the docs for CONFIG_LSM and the "lsm=" command line option

- Remove unnecessary code 

Paul

--
The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
    tags/lsm-pr-20261016

for you to fetch changes up to 881f19c2ffbc73f351b257e09c71e6059939b770:

  lsm: remove redundant NULL check in security_init()
    (2026-09-29 21:47:20 -0400)

----------------------------------------------------------------
lsm/stable-7.4 PR 20261016
----------------------------------------------------------------

Benno Lossin (1):
      rust: lsm: replace `core::mem::zeroed` with `pin_init::zeroed`

Cai Xinchen (2):
      lsm: delete duplicate assignment in lsm_prepare()
      lsm: don't call security_backing_file_free() multiple times

Christian Brauner (2):
      ns: Free anonymous mount namespaces via ns_common_free()
      lsm: add LSM blob and hooks for namespaces

Daan De Meyer (2):
      lsm: expose mount idmaps to inode hooks
      selftests/bpf: verify mount idmaps reach inode hooks

Jann Horn (1):
      cred: clarify that task_struct::cred is only for the current task

Lincoln Wallace (2):
      doc: describe CONFIG_LSM and lsm= as the selection mechanism
      doc: fix LSM ordering description for /sys/kernel/security/lsm

Mickaël Salaün (3):
      lsm: add LSM_AUDIT_DATA_NS for namespace audit records
      lsm: Preserve full ioctl commands in audit records
      selftests/landlock: Check full ioctl commands in audit records

Mohammed EL Kadiri (1):
      cred: prevent slab cache merging for cred_jar

Paul Moore (1):
      lsm: update the BUILD_BUG_ON() in audit_log_lsm_data()

Sang-Heon Jeon (1):
      lsm: remove redundant NULL check in security_init()

 Documentation/admin-guide/LSM/index.rst           |   20 -
 fs/cachefiles/security.c                          |    4 
 fs/namei.c                                        |   18 -
 fs/namespace.c                                    |    3 
 include/linux/cred.h                              |   17 -
 include/linux/lsm_audit.h                         |    7 
 include/linux/lsm_hook_defs.h                     |   26 -
 include/linux/lsm_hooks.h                         |    1 
 include/linux/ns/ns_common_types.h                |    3 
 include/linux/sched.h                             |    8 
 include/linux/security.h                          |   78 +++-
 include/uapi/linux/nsfs.h                         |    1 
 init/init_task.c                                  |    2 
 kernel/auditsc.c                                  |    5 
 kernel/cred.c                                     |    5 
 kernel/nscommon.c                                 |   17 -
 kernel/nsproxy.c                                  |    6 
 rust/kernel/security.rs                           |    3 
 security/lsm_audit.c                              |    8 
 security/lsm_init.c                               |    9 
 security/security.c                               |  115 +++++-
 security/selinux/hooks.c                          |   25 -
 security/smack/smack_lsm.c                        |    9 
 tools/testing/selftests/bpf/prog_tests/test_lsm.c |  231 ++++++++++++++
 tools/testing/selftests/bpf/progs/lsm.c           |   79 ++++
 tools/testing/selftests/landlock/fs_test.c        |   10 
 26 files changed, 599 insertions(+), 111 deletions(-)

--
paul-moore.com
