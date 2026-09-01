Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2319C54E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306196; cv=none; b=PBdxOAGq/vwZZoUGQKJorfOiu7MHyJFsMN/xO1Ham2hdOG18rHINU/WkdRc7O+FdHt4SSF6CqN/feIrfzqYuR0rAxC0c6n/fQ5p2AFvOnAbmev3Ulb4+d5WlPiPFNeqAfs32Zrx7E/jhL6bLGnSQQ3NBuF7H/259LQ97sf/WZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306196; c=relaxed/simple;
	bh=hi0m6YLIQCYVgMeaQ0dok0IwboXRHu9ThpRpMuaw4ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDlNCi5aP057D4ynai7hizGxvXdrONibIkzdxU9CgKQHTHRFjEQfv+5JIl3rf+lvXhALJk1xU7wSC+tVHckI7QQWc/9wbvl5Bsm87hUt0enDiJUs0P9SrDbdbE0JOHb0ZIQa8TBgGN1sKSow/tjXffEVUvyuxWRc359geeLmc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf4nbkIp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf4nbkIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306194; x=1819842194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hi0m6YLIQCYVgMeaQ0dok0IwboXRHu9ThpRpMuaw4ZU=;
  b=cf4nbkIpuunRFwSM1k8I34Q6zaADFTq1cI3PcO5KhsFOH8+a64+0lizw
   PEaoDor2xJ/uj/hz/3VPG9MpbpAftXrFDR4sjjUUsji0TUnfQcTziyJb8
   Z9RJFhBlhx/QFxdNAJJN0SlLmn5gCWp0IWijX0NmxZsxGA5JZvpwSgcIh
   PTtNFvO5YRMI/xrGvYPHNE8zw7iil3w/SzqhbljOoSMV0MnK/UX5Fm/2h
   Ce9TueS52/O15acYsyhdFPGZxM+ejrCxTKAaGxbl67gXj+XiUDvFJar4V
   D6IxG+z3rgYIfylnqshCSxg16JG3I1u5OEiq3uqfiZSb/YdwTdcrt134g
   g==;
X-CSE-ConnectionGUID: 69zppg5nTRW03NlNy+fj9w==
X-CSE-MsgGUID: i/4RnYw9TAqRH0RugncrLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891858"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891858"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:13 -0700
X-CSE-ConnectionGUID: 1apJfABRRAG8wcB+ptLMRg==
X-CSE-MsgGUID: BihLDKjeQeexS5T4GUexaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469869"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:13 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH 0/8] x86/microcode: Address GNR errata and follow-up
Date: Tue,  1 Sep 2026 23:16:25 +0000
Message-ID: <20260901231634.714144-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear x86 maintainers,

We recently found a couple of microcode loading issues [1]. This series
addresses them from both short-term and long-term perspectives.

It would be much appreciated if the short-term, one-off fix (patch1)
could be sorted out first to allow backporting.

== Issue Summary ==

As background, the minimum revision check was introduced by commit
cf5ab01c8703 ("x86/microcode/intel: Add a minimum required revision for
late loading"). It was originally intended to address changes visible to
software at runtime, and has therefore been limited to the late loading
path.

The two errata are essentially about dependencies between microcode
revisions:

 1 GNR98 involves a dependency on an older revision 0x1000405, which
   contains internal changes required by subsequent revisions. Since this
   is not an OS-visible change, the dependency applies to both early and
   late loading. The minimum revision check only applies to late loading.

 2 GNR101 describes an incorrect minimum revision value in revision
   0x1000423, in spite of the same dependency on 0x1000405. The
   late-loading minimum revision check does not prevent 0x1000423 from
   being loaded directly on an older revision.

== Short-term Remedy ==

There are therefore gaps in both boot-time and runtime loading. The
one-off short-term fix is to reject the problematic loading cases on both
paths.

With this change, systems running an older revision need to update
firmware. See `FIT Microcode Update` in [2]. There may be other ways to
deploy the required update more efficiently, but those are outside the
scope of this kernel patch series.

== Long-term Direction ==

The issues above also raise a couple of questions for the longer term.

 1 How can we address microcode dependencies during early loading?

   The minimum revision information can serve as a more general revision
   dependency check, rather than being limited to runtime changes. The
   series applies the minimum revision checker for early loading
   (patch5-6).

 2 Can we do better for late loading?

   Looking at Intel microcode releases [3], the repository traditionally
   provides the latest blob. When updating from an older revision, admins
   may need to retrieve prerequisite older revisions from the git
   history. This can be inefficient and error-prone.

   Intel will now concatenate prerequisite older blobs with the latest
   blob together into a multi-blob image. The kernel, however, currently
   selects the highest loadable revision, or at best one prerequisite
   when the minimum revision check is enforced. Admins may need to
   trigger multiple loads manually.

   Instead the kernel loader can facilitate iterative loading to apply
   the available blobs incrementally. There are some possible ways to
   implement this.

   One is to rely on the minimum revision check and select the highest
   revision whose prerequisite has been loaded already. Another is to
   load the blobs sequentially according to the order in the image.

   Both approaches have drawbacks: the former depends on the minimum
   revision information being correct, while the latter is sensitive to
   blob ordering.

   The approach here selects the lowest loadable revision on each
   iteration, so that the blobs to be applied incrementally (patch7-8).

== Patch Set ==

The series started as a single patch to block the problematic loading
cases. It was then expanded to address the underlying gaps in early and
late loading, with some fixes along the way.

  Part1, patch1: One-off fix to reject the errata loading cases
  Part2, patch2-4: Preparatory fixes
  Part3, patch5-6: Early loading: apply minimum revision check
  Part4, patch7-8: Late loading: support iterative loading

== Tests ==

Andrew helped providing useful scripts to concatenate blobs from the
repository [3] into a test image. Thanks! I could grab one production
system and test changed paths with the concatenated test image.

The patch set is available in this repository:
 git://github.com/intel-staging/microcode.git gnr-errata-followup-v1

Thanks,
Chang

[1] https://edc.intel.com/content/www/jp/ja/design/products-and-solutions/processors-and-chipsets/birch-stream/xeon-6900-6700-6500-series-processors-with-p-cores-specification-update/016US/errata-summary-table/

   GNR98. MCE When Early OS Microcode Update to MCU 0x1000405 Release or Later
   Problem: The 0x1000405 microcode release introduced changes to the
   inter-microcode communication interface that are incompatible with
   prior versions.

   GNR101. Incorrect Minimum Runtime Microcode Update Revision in 0x1000423 Release
   Problem: The 0x1000423 microcode release does not correctly set the
   Minimum Runtime Microcode Update Revision, document number 783834, ID
   in the microcode header to reference the 0x1000405 release.

[2] Microcode Update Guidance
    https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/microcode-update-guidance.html

[3] https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files.git

Chang S. Bae (8):
  x86/microcode/intel: Reject problematic loading on GNR systems
  x86/microcode: Solidify base_rev= option parsing
  x86/microcode: Accept a boolean for force_minrev parameter
  x86/microcode: Mark early_data __initdata
  x86/microcode: Decouple minimum revision check from late loading
  x86/microcode/intel: Apply minimum revision check to early loading
  x86/microcode: Introduce iterative late loading
  x86/microcode/intel: Select the lowest loadable revision for iterative
    loading

 .../admin-guide/kernel-parameters.txt         |  11 +-
 arch/x86/Kconfig                              |  31 +++--
 arch/x86/kernel/cpu/microcode/amd.c           |  11 +-
 arch/x86/kernel/cpu/microcode/core.c          |  86 ++++++++++++--
 arch/x86/kernel/cpu/microcode/intel.c         | 110 ++++++++++++++----
 arch/x86/kernel/cpu/microcode/internal.h      |   2 +
 6 files changed, 202 insertions(+), 49 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

