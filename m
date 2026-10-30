Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349239;
	b=MdWuysK+oCbEfiiqdrtm/LIGjdt31+FHtDW8kXnGLzTAETBVEnPvmcsBAnfM7XlHpi6+
	 6csSnKtFf1WM0WerxB08vN5Nm7cOhrPK2HAu8pyoDAIUYB0cVd4upJHVENFchD1P20AEL
	 uBYuruj/wp7FrO5No4syqSBn7cLr6dafBhJNxoX/eVXUp+R232sEBZpn/prL6ZhfSCdKn
	 kuut1/BTzR5EtgNIMLqYuD79435N4lmggYnUAedcqbbZGQ1QVlDN1TFphSF+LTPXPCg2P
	 cSpc772XysYE/+jcpzdm8+U/zBo5a/g5BxXVQisJZw6xPyJ8LxADiEDLvAzwcFHM1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=;
	b=TGUL6P91wqz3NV4pWmBS9/D3KDVXDersZfp38JXS2R13x9DlpMuHTULqnrfSjd3UHsUm
	 7uq7j9/ew4hExG/EKjz3Vt379QJLjgAce+5HuvRcNFsRGparmjr9hmr+F7OGwe/gf0VOu
	 /hKxXjY8AZW/6JXn7EPyQca48TUVoUgoFaOV4a5U3qXbiFbDVdNp5CReoEXZGK+xb+pHe
	 JCHNEshH+YPVxqcc8dpCT7aJBDb2oCUfhIj5hznchlJTHHtlSR8AhqFYGB9/xKua+qBqW
	 AP5pfYSM1L1V7FEzyEVscsFoudsfxtmCfv4TQTD18kwaXjDbpm8DvbtWoG4Zxb4bP+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9+37NTp;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF90606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF90606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9+37NTp
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso322546a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349238; x=1793954038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=;
        b=v9+37NTpncjz5uNRKBSmEC6F5DmnHYno7bYlIXbKI6whONJ3cXJ/qmiz9n2pl4359u
         tZxZgMBmayuaB8epP2qsBSh0EveeyJMuGPRoejdGPN16bcyomVO08mpm1FUwLLetV0rL
         xStpIV1mp+8hpY/UcJk51WC8yiF6UExbuVO8ht/2QWvBg8uZrWESD1wpmUzWSBqk4NP8
         Ag5IjIlG2BouAE1ONfvM8ohLSVYUpSscjlO2O2GVpxuamF9rd9mvJrH9PEOMe+YL9U0x
         hz1pwjs9u5FObeUYOnoZTG4TX57pdO6jgDNHlhjSBz00Gj7RBEDnAWBas7vug+pZsFnp
         0Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349238; x=1793954038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=;
        b=VIgwUP5nk19zodxgA3o0G0egHu11ICiHKXVRKbFqmvqJBm6sgc8GCF5LuSCfceR/6v
         s9BlI0ZK153/nFodcd00yl5jrlCM5zMAo4NjSIh992yc/9X5O3GNYe4NPHPDISkBSQ/d
         gVlgZj8alfIxNP8ET55Dv0etJCdA3xqomtqYs4fuKCsmkhCCWaBAC/TJFvKk5thokdwP
         uuM96GX083F2DiD6AJzfEwoIH37TOppdYfQXNRNxDDRHs9zt5hPWYoAs+zeR3gJgYOuY
         QeaLArFDe0Cyj8jJP4cOLf4sa2H/rM9BvD4kFCMxDem/lihCrUqk2MdlkfDOEBlYMxrF
         GdLg==
X-Forwarded-Encrypted: i=1; AKwUvBw7hfnqGlTVlUsztEH5hGA1T55HsNSpUgfmsvvSYRBl9X8jD2x/KcrRGQVbo6vJkpMG0obpicnQGpdg0rA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJq8+OkBOSJWa+QeAFE8zYjZ11/40VvjD98h9+braLHpD0un33
	y1RS17gzUU7J1WG8FajhGapPNKspqma/KihBWTUEkWhLg88yFPsc6elf
X-Gm-Gg: AYBFou2Ng2y/nr5IuTaXRAB8WTRQ9VMNjtbG7fhiEJjBuA2BnvZG1CQ7DJLz7VUU6pz
	9J7SBRwKJJXEoUjZKjnBaU/JlkVJDavlZauM8Qxcrv//c04FrZ0OOz+wiN+O2LIknNApEy6/bau
	EMhIDJMS2o2epAmzeJUc26lj4H5MDJOQS+0mKZ85Z8l879cVO0NZxDy6AbYaoc4IsZxQ5CajxzD
	OmPWayiV9/crF+AJ4ymzCtWUo+JEx4ekT4oYVUG3OjyybcWaHTuliYkdfF0sJLWwJz+udG5fTB3
	PN/AEPk13x+ClCUoExwsCEqIsHOZXmmRN4r5liXL7TrgVPZb940uVEBTCc9Ttqe43FMU9l2IcaQ
	xIImTQkmsdP4TzE+R8zvj0mrbPFfpCRlYQAtplgLHe/uLk/jbmk3pJwdmHESCYkqfkHg2j4aCIc
	zFXQ+kQrr+INDSBCAlrSnuXz1QvWV0XSJ4O1FfcVEOaPZtz7eIkC656phb9NnAXp6GdTFmzNy3E
	bboivcVwEv0hzUsFs1WXW03dKhpz3l0qI+uOJsRYSl4N09FfIPpdmvX94fuwbD4bn9IbWbReHxm
	m+oWJX/isKVD/6XWiVj3614UMzThkM+AY2jD7bcqanNL+V4RADUfjXKa2H9dxbbnpCClriLpDxq
	6TDTSH2KKRLASWlgWsl69TJ1nuJXudcDqQHREXN84PGuVe19Yc2s+cqp6VH0dxRj7FqYfM2MuKU
	tOwTyGGxTDU2dE2A1awP5gmN0N6nAfZ5UJCyw=
X-Received: by 2002:a17:90b:2f0f:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3ae8974a292mr952529a91.22.1793349238418;
        Fri, 30 Oct 2026 01:33:58 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm1490961a91.1.2026.10.30.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:33:57 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Fri, 30 Oct 2026 16:33:51 +0800
Message-ID: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
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

KVM/arm64 has no P: entry in MAINTAINERS, so nothing tells a contributor
that the kvmarm tree is used for integration only, or what the
maintainers expect patches to be based on.  Marc Zyngier said a profile
would help.

Add one covering the trees, the base for patches, the submit checklist,
key cycle dates and review cadence, and point the KVM/arm64 entry at it.

Link: https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
Link: https://lore.kernel.org/all/87tsnb2dtq.wl-maz@kernel.org/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Changes since the RFC
(https://lore.kernel.org/all/20260925085621.562448-1-matthias.goergens@gmail.com/):

- Point at the MAINTAINERS entry instead of naming maintainers and lists.
- Describe master, topic branches and shared branches; drop the open
  questions, which the RFC's Sashiko review had also flagged.
- Base: prefer -rc1 to -rc3, not kvmarm/next; leave conflicts visible.
- Subject lines: capital letter after the prefixes.
- Architecture references: prefer rule identifiers; drop the comparison
  with KVM x86.
- Testing: selftests usually at the end of the series, reproducible
  performance measurements, tests encouraged rather than required for NV.
- Key cycle dates: no new features after -rc6; how fixes are sent.
- Review cadence: stability of commit IDs; answering bot reviews.
- Posted as a new thread, with the documentation maintainers and lists
  on Cc.

Steffen, Marc asked you for a short addition on KVM/arm64 on s390 for
the Trees section.  I've left it out and can add it as a follow-up.

Oliver, thanks for inviting an updated patch.  Corrections are welcome.

 .../process/maintainer-kvm-arm64.rst          | 181 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/process/maintainer-kvm-arm64.rst

diff --git a/Documentation/process/maintainer-kvm-arm64.rst b/Documentation/process/maintainer-kvm-arm64.rst
new file mode 100644
index 0000000..3b0bb56
--- /dev/null
+++ b/Documentation/process/maintainer-kvm-arm64.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+KVM/arm64
+=========
+
+This document describes how KVM/arm64 (``arch/arm64/kvm/`` and the other
+files listed under "KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" in
+MAINTAINERS) is maintained.  It supplements
+Documentation/process/submitting-patches.rst.
+
+Overview
+--------
+
+The maintainers, reviewers and mailing lists for KVM/arm64 are listed in its
+MAINTAINERS entry.
+
+Trees
+~~~~~
+
+The KVM/arm64 tree is::
+
+  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
+
+This tree is used for integration only: no development happens in it, and
+most patches should not be based on it (see `Base for patches`_).  Its
+branches are:
+
+``next``
+  Changes queued for the next merge window.  linux-next merges this branch.
+
+``fixes``
+  Fixes for the release currently in its -rc phase.  linux-next merges this
+  branch too.
+
+``master``
+  Follows the -rc tags in Linus Torvalds' tree.
+
+Changes leave the tree as signed tags, which are pulled into the main KVM tree
+(``git://git.kernel.org/pub/scm/virt/kvm/kvm.git``) and from there reach Linus
+Torvalds.
+
+Topic branches are managed by the maintainers in their private trees, and only
+the result of integrating them is pushed out.  The exception is shared
+branches, which are published when necessary.  Where a series also touches
+code maintained elsewhere, most often the arm64 architecture code, the
+maintainers may set up a shared stable branch, based on an -rc tag, that both
+trees merge.  Say in the cover letter which parts of a series touch other
+subsystems.
+
+Base for patches
+~~~~~~~~~~~~~~~~
+
+Base your patches on a tag published in Linus Torvalds' tree, preferably -rc1
+to -rc3.  If you rely on something merged later, for example a fix merged in
+-rc4, say why in the cover letter.  Patches based on linux-next are
+discouraged.
+
+Do not base patches on ``kvmarm/next`` either: it is rebuilt regularly, so a
+commit on it is generally the wrong base.  If your series conflicts with work
+queued there, leave the conflict for the maintainers to see, as it is a sign
+that something needs a closer look.  A proposed resolution is welcome.  The
+exception is a series that strictly continues one that has already been
+queued.
+
+If your series depends on something else that is not yet in mainline, such as
+another series under review, say so in the cover letter and name exactly what
+it applies on top of.
+
+Use ``git format-patch --base`` so that the base commit is recorded in the
+patches.
+
+Submit Checklist Addendum
+-------------------------
+
+Recipients and threading
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Send the whole series to all of the maintainers and reviewers listed for
+KVM/arm64, not a selection of them.  Post each new version as a new thread,
+not as a reply to the previous version, with a cover letter for anything
+longer than a single patch.
+
+Subject lines
+~~~~~~~~~~~~~
+
+Changes to KVM/arm64 use the ``KVM: arm64:`` prefix, often followed by a
+sub-topic such as ``nv:`` or ``vgic:``.  Selftest changes use ``KVM: arm64:
+selftests:`` or ``KVM: selftests:``.
+``git log --oneline`` on the files you touch shows what is in use.  The text
+after the prefixes starts with a capital letter, for example ``KVM: arm64: nv:
+Fix life cycle of the nested_mmus array``.
+
+Architecture references
+~~~~~~~~~~~~~~~~~~~~~~~
+
+KVM/arm64 code tracks the Arm Architecture Reference Manual (the "Arm ARM",
+document DDI0487) closely.  Where a change depends on architected behaviour,
+explain why the change is needed and cite the Arm ARM in the commit message
+or in a comment.  Where the rule has an identifier, such as ``R_QXXPC``, quote
+that: identifiers stay the same across revisions of the document, while
+section numbers do not.  Otherwise give the revision along with the section,
+for example ``DDI0487L.a D24.2.70``.  The same applies to other architecture
+documents.
+
+Testing
+~~~~~~~
+
+Say in the cover letter how the series was tested: which tests, and on which
+hardware or model.  The KVM selftests (``tools/testing/selftests/kvm/``) and
+kvm-unit-tests are the usual test suites.  Put selftest changes in patches of
+their own, separate from the KVM changes and usually at the end of the series.
+
+KVM/arm64 can run in several modes, which are described under
+``kvm-arm.mode=`` in Documentation/admin-guide/kernel-parameters.txt.  Test
+the modes your change can affect.
+
+If a patch aims to improve performance, describe exactly how you measured it,
+in enough detail for others to reproduce the results.  Measurements made on a
+software model such as QEMU or the Arm FVP say nothing about performance on
+hardware.
+
+New tests are encouraged, particularly for nested virtualisation, where
+coverage is poor.  Depending on the change, selftests may not be enough; the
+maintainers may ask for testing with a VMM, for example.
+
+Userspace API
+~~~~~~~~~~~~~
+
+Document changes to the userspace API, usually in
+Documentation/virt/kvm/api.rst or in the files under
+Documentation/virt/kvm/devices/ and Documentation/virt/kvm/arm/.
+
+Fixes
+~~~~~
+
+Add a ``Fixes:`` tag for bug fixes.  If the fix should go to stable kernels,
+add ``Cc: stable@vger.kernel.org``; the maintainers may add it when applying
+if the bug calls for it.
+
+Key Cycle Dates
+---------------
+
+Changes for the next merge window are queued on ``next``.  New features are
+usually not merged once -rc6 has been published; from then on, only fixes are
+queued.  This is not a hard rule, but posting a feature just before -rc6
+guarantees nothing.
+
+Fixes for the current release are queued on ``fixes`` and sent upstream at
+intervals that depend on how severe the bugs are.  There is no cut-off for
+fixes, but the maintainers may defer a low-priority fix to the next merge
+window.
+
+Review Cadence
+--------------
+
+Unless the maintainers ask for a new version sooner, allow at least a week
+between versions of a series, and only post a new version once there has
+been enough review to justify it.  Posting more often delays review rather
+than speeding it up.
+
+Pinging a series that has had no response is fine.
+
+Answer reviews from bots such as Sashiko as you would any other review, even
+if only to say that a finding is wrong.  Pre-existing problems that a bot
+points out, and that are unrelated to the series, need not be fixed in its
+initial posting.
+
+Applied patches are normally acknowledged in reply to the posting, naming the
+branch (``next`` or ``fixes``) and the commits.  The maintainers try not to
+change the commit IDs of applied patches, but the IDs of merge commits almost
+always change.
+
+Minor problems are often fixed up by the maintainers when applying; if they
+say "no need to resend", don't.
+
+Security issues
+---------------
+
+Bugs that let a guest attack its host, or a nested guest attack its guest
+hypervisor, should be reported as described in
+Documentation/process/security-bugs.rst.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a162e9..183bf34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14596,7 +14596,9 @@ R:	Zenghui Yu <yuzenghui@huawei.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	kvmarm@lists.linux.dev
 S:	Maintained
+P:	Documentation/process/maintainer-kvm-arm64.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
+F:	Documentation/process/maintainer-kvm-arm64.rst
 F:	Documentation/virt/kvm/arm/
 F:	Documentation/virt/kvm/devices/arm*
 F:	arch/arm64/include/asm/kvm*

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

