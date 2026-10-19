Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424744;
	b=Ky7jNLznkUmWX7Z3zvGeX6LkEEuefNSl5cattA2u94vMXBc8eWfTeqeak6jZoJpYW8wm
	 0m1m/lhP7IJlHTDEK1SSm5tw6jOA5s2Qeg7MTDRMxAqXFhV+14A60KvG4ID5Ko7/oHdDg
	 bKxeeGXLoLUBVMWDI2ukPQeXNEXg3KHGYld+WUimoplP+3bDGdZ1r43jWjWHWF+fR+SIu
	 TfR5Qe52V7ByFKZMnhuYyQQZRt8qNmN9KRiQ3U+ogIMLF2lnCDu77bW0P85qs4MU9rYwp
	 EJ6oMro4pXPgmgtO5hzZOp+Qf+dybUDvd40EGxYfVESYKjuIyXWyDWKPToqwMCiO38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424744;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ojO37mcPghaZpt3rZ9e8dLhHf7oGwqDhUXXnWSr+oU=;
	b=WBUAvekvNep9b3bqHnsowgoG22i8izoFdnczKiFxGnCtwfOdxxb+jdLZU9AAuhZSzKjc
	 enA8AmuInGq4FvHneEmj3RU1hnoUvhH1yXNSkTvpMpmQx2o2H/QVb2u2h4LtvGUp5qnSh
	 NnABVDcZfZQYhH/TNkVnrRMWIbIytjDJOp+T6a+jB+EaZ+dySXC0nphT19woFDFPA6HBn
	 N6/XYjjYG++ckmwwfpu2kN1oh6L0ibnGM0RgzE6gnG1C2mBohcC/PxLxlijcd0bn1wJY4
	 gZ47F1t0hJIfuE/zAkSTaTf+sHdYzY9F7IFWaeNTXYZzCX62lGr+0CiyyU6oURtQSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfRihME6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEB606C16E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BEB606C16E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfRihME6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792424745; x=1823960745;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OCGhdFUYzRvFQmCtywaVdSe26oU/CW65MQ8p+UoZFrk=;
  b=XfRihME6jtArOZAjZkIYxsOC7LOsG0YMwUkBIvrqYbpf40WDOHvpFHqL
   KphukxXVZekgbkkKYiip8oVv2PZRHAMhp0/kpP6pya0+cGVOkSkEmRv+g
   hEFvbIkUHB3frjCwYJQIZfKKW4HlTK/waN3HD3Yhuxjh/PSJCNUMhq0vD
   PDZkTqmQ0LcNa7E3PVk4kZoqlCT+0Vi+JF/dsHvbvWdbBVgX7XYNcCCmA
   4tozCZqm1mrDRkSGGQuWcZUi4zemGnOu75Y5AVJgfW/3WlqH2OusuW0K6
   V9nm4CEsqaOBpiN/6cpYIyZKnq+/k5GkY3e6bj1amISAqoHyUBOt+5Jxo
   g==;
X-CSE-ConnectionGUID: FBgZK33wTZaFoZQknNMqwg==
X-CSE-MsgGUID: y9l0eKHZTQGD4HHoMfpdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="994489"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="994489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:45:32 -0700
X-CSE-ConnectionGUID: u122x5h8Qq+FT7l5TKb1yw==
X-CSE-MsgGUID: N+Zmws5yRfu9dOEnVpQ2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2566306"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:45:31 -0700
Received: from ray2.intel.com (unknown [10.125.111.15])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 43EF16393;
	Mon, 19 Oct 2026 08:45:31 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/mm for 7.4-rc1
Date: Mon, 19 Oct 2026 08:45:29 -0700
Message-ID: <20261019154529.1878897-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi Linus,

Please pull some x86/mm changes for 7.4-rc1. The __add_pages() and
pgd_clear() ones are pretty mundane.

But the W^X ones are worth calling out. Effectively, the checks that
were supposed to be looking out for Write+Exec permission mappings
were busted. This fixes them, so we should all be on the lookout for
new warnings, both false positives and real ones.

--

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_mm_for_7.4-rc1

for you to fetch changes up to d92b5ac5aeba1ffc734576e30a5bca882722de76:

  x86/mm: Fix spurious warning on __add_pages() failure (2026-10-01 05:04:44 -0700)

----------------------------------------------------------------
 - Fix void/int conditional in pgd_clear()
 - Fix spurious warning on __add_pages() failure
 - Make W^X detection actually work

----------------------------------------------------------------
Jose A. Perez de Azpillaga (1):
      x86/mm: Fix void/int conditional in pgd_clear()

Lance Yang (1):
      x86/mm: Fix spurious warning on __add_pages() failure

Mike Rapoport (Microsoft) (2):
      x86/mm/pat: Fix effective RW computation in lookup_address_in_pgd_attr()
      x86/mm/pat: Use pr_warn() for early W^X warnings

 arch/x86/include/asm/pgtable.h |  6 +++++-
 arch/x86/mm/init_64.c          |  3 ++-
 arch/x86/mm/pat/set_memory.c   | 23 +++++++++++++++++++----
 3 files changed, 26 insertions(+), 6 deletions(-)
