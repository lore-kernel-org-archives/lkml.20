Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0D360ED0;
	Fri, 28 Aug 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931016; cv=none; b=BuGzH6omyQ40eocLGnUTB/PY0c5kQngoMFFgBmBf1a3puluFrk+wc+bCN2/hBNjN7yOOkbCrvbr647CTwV7uflHmVUsMrFG8BR9f5LDQvQo7RPwMFgm6oNzoJGSI0ocwljrK6v8OVrT9hnejZ6rUgF5yGuibQyLC1p2qFKj9c5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931016; c=relaxed/simple;
	bh=HpecKzAkGcpxLpmYZHTcW/XUvoZtgeFLIan1qLdyY6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWF7jZP0VzRbGlJ9n9f+mmwJ6AiNMwlPF49o6eVZS6K5mj9WWxQYFlWoip6OwnzNjMf8+4qezxuh5n6tbCDQkS8GFTU7Sfl2FEL00IE4RGGIYC4+rvwSATCoisMVKE4GCMjnHjdBqD2jf4n5xjczT93M1q2RLoEnj9CL28e7O9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly6NkzK6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly6NkzK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787931014; x=1819467014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HpecKzAkGcpxLpmYZHTcW/XUvoZtgeFLIan1qLdyY6k=;
  b=ly6NkzK63Y4tU2kX7k7SY52+7890fFIaxa79XH+FWRdwh7sEcw+sz7Xl
   f4hQClBO6IfX4Y4WU6X0HznVxnomnyYzL/vzCe7zbwgZ0qtZ1wVeg2jg1
   1w12Cu88XGL0mK14WHo5vkGSSPphFKkutfrJbn/9/HoxfoHKjmnXc8D71
   4nPJCp48BB+7nSNKH1344UvVrwQXkbP5npY9L8HM9ZIWWR7H/8Nkco12F
   nf5pzQ3SB5VFWEuMq5tMj9QV1YsxYnfn+UjxX1HCdV+VAWlkw0U3TYHcC
   4UkemIJqWPoGk/LU3aJfXHiZmOWm6vZcW87KTCeSQUIgbcTB4s/g6uwTc
   g==;
X-CSE-ConnectionGUID: R1v+mYt5TwOnd7qTdTpJcA==
X-CSE-MsgGUID: 0mwFsRHjTmy+KxweUSJJSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99104577"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99104577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:09 -0700
X-CSE-ConnectionGUID: XCpVCHpzQjiu2R2q0n5h7w==
X-CSE-MsgGUID: KXSngloCQxC6rC7Xu4fs7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291682269"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.223.138])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:09 -0700
From: Tony Luck <tony.luck@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 0/7] EDAC/intel-bff: Driver to reset bitfix filters
Date: Fri, 28 Aug 2026 08:29:55 -0700
Message-ID: <20260828153002.10290-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Intel CPUs implement a "bitfix filter" to suppress reporting of the
same corrected errors repeatedly in the case where aging silicon
develops stuck bits.

But when systems run for weeks, or months, the filters may become clogged
with transient errors.

When the filter is full (indicated by a "yellow" signature in a machine
check bank) clear the filter. This may make space for additional hard
errors.

Save a time stamp when clearing a filter. Log with "WARN" severity if
the filter overflows quickly (in tem minutes or less).

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
Changes since v1: https://lore.kernel.org/all/20260825181526.13203-1-tony.luck@intel.com/

Boris:
	Change from a platform driver to an EDAC driver to avoid
	spreading RAS code into yet another corner of the source tree.

Ilpo:
	Use <linux/bitfield.h> macros FIELD_GET() and FIELD_PREP() for
	bit wrangling.
	Did NOT add comma to last initializer for dmr_mcbanks[]. The
	list is complete, this CPU model won't add extra banks that
	support the bitfix filter.

Sashiko: https://sashiko.dev/#/patchset/20260825181526.13203-1-tony.luck%40intel.com
	Ignored complaint about lost #GP faults. The driver
	checks that the feature is enumerated, so #GP can't happen.
	Ignored complaint about overwriting bits 63:1 in the reset
	MSRs. Only bit 0 is defined in these MSRs.
	Applied suggestion to save bank number in upper 32 bits of bff_id.
	a/IS_ERR()/xa_is_err()/ for check of return from xa_store()

Miscellaneous:
	Added entry in MAINTAINERS file
	Applied some cleanup suggestions from internal AI review.

Qiuxu Zhuo (1):
  cacheinfo: Export get_cpu_cacheinfo_id() for loadable modules

Tony Luck (6):
  x86/mce: Add enumeration for Intel bitfix filter reset
  EDAC/intel-bff: Add stub Intel bitfix filter driver
  EDAC/intel-bff: Add Diamond Rapids support
  EDAC/intel-bff: Reset bitfix filter when it overflows
  EDAC/intel-bff: Compute unique ID for overflowed filter
  EDAC/intel-bff: Report frequent filter overflows

 include/linux/cacheinfo.h        |  12 +-
 arch/x86/include/asm/mce.h       |   5 +
 arch/x86/include/asm/msr-index.h |   2 +
 drivers/base/cacheinfo.c         |  17 ++
 drivers/edac/intel-bff.c         | 295 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   6 +
 drivers/edac/Kconfig             |  13 ++
 drivers/edac/Makefile            |   2 +
 8 files changed, 341 insertions(+), 11 deletions(-)
 create mode 100644 drivers/edac/intel-bff.c


base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.55.0

