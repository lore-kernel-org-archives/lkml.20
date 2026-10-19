Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424081;
	b=2T0JAqj8ebYJP0m/hm1BzQil26j0gUlZmRQQS4TQ+Rt7uv7Z/rZpQw+hxY2A1YWJ2E1+
	 72TYT4EEfZHTX6VC6T9bW/wjo7Qlp6elcGU8/vKoMbbkOG/Kkt+NRYuQk3K3Y4MOzFKmy
	 fCKwuASLeCpASxHZvQekz3TyxFQMDR03fVPzMbuMwZdbQ/2c8998k+a42hKs/MaRNyDWs
	 x0pINRiA30wgL3AScsTpQrZYt1030qFQhEhHoCk+uCe2Ze6hAMIuD/tXaanWAniksi+NM
	 6QwS9Nw9E5Sh+SsIR+glVXCrsSCPWsrKZRUSdmlfxSmsp9+/F0NlRp0JBpeRM1ASBEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ol5KfRbE0V7ARBDfrVK6WqnyQtx7i9RhSPG6UytwSUo=;
	b=NSWz3YS5/wwLt83ukqRYhiU87cpsmu8tIm3I6HDT3EpROme6COn1VjhyOaoy0z8fIvZo
	 /Mz7eXhwumvsVJfZau/vbF72aifAgNijMSPthQJye9YVUi8UcMnR9X9m+3JQ8wv6zXDb8
	 GSzQ+Qtdbd58/SosujcwRumiGWHGe1PWtLK2RwhomlPveIDsjcd5QSNmGnjoPWvEFddkb
	 TMIQhKv10km5vTa1eqkAN4JCK0xPRTdES0uq5DTx7CXC8+JjIaFhPK+VBlBz0V2rDfffF
	 TBkt/FZHchb1YemOrAPcoC5IDlGBgu8ahMbi2n/OVUOJ+u4mGybnGO6ypA6rce0BX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lE60bAzs;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAD606C16D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FAD606C16D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lE60bAzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792424080; x=1823960080;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vRkJE7srJOwkAN+Ze8OSeE7zFU73F4wk4XyUrxD6UJE=;
  b=lE60bAzsRjrUV6GXTweeJKbxrSbRHR+vYuQTLUlad5zPEdJ5HFA909z8
   5eHGyO37ZBdJEqN5Vh3pYdhKNG2+RIDy9i6qCVDDg9Y+UCUHZGCvUT6sp
   or0BI+ty0QgT5HjF0TKQGSLW/XJ1IqDumhRbRvvKP9NMV7XDf9N55Knve
   5M2njzqVOHaQj6B8FgNMvkoRJs2w7Vz/jEuiAKXuev6ECn0453MmaQWlz
   KviixFWqMwCLIkALkNb+PCH+rSBfNOOQ5CyKFmxWJMfxXjth1LVFsF7dK
   G25yvm1PBKnqpeU2spXkG9NGTuloLtOKjFCHXUsi5yMITV6llmvuGKQ4d
   A==;
X-CSE-ConnectionGUID: tuD9h9NsR6CS9FlX8TEeiw==
X-CSE-MsgGUID: gStdzQULS2u43PfpzYptnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="995617"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="995617"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:34:39 -0700
X-CSE-ConnectionGUID: W7UH4C35QVCMBktlwDNQrg==
X-CSE-MsgGUID: lR7b/tn/TXa9ySiRgpBKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4397680"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:34:40 -0700
Received: from ray2.intel.com (unknown [10.125.111.15])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 4019C6393;
	Mon, 19 Oct 2026 08:34:39 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/misc for 7.4-rc1
Date: Mon, 19 Oct 2026 08:34:37 -0700
Message-ID: <20261019153437.1871645-1-dave.hansen@linux.intel.com>
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

Please pull a single x86/misc change for 7.4-rc1. The "itmt" scheduler
tweaks are getting disabled if debugfs is not available.

Allow initialization to proceed even in the face of debugfs failures.

--

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_misc_for_7.4-rc1

for you to fetch changes up to 4a673a0026b95030ee727f1f8578c46a42107011:

  x86/itmt: Don't make ITMT enablement depend on debugfs (2026-09-02 14:01:08 -0700)

----------------------------------------------------------------
 * Don't make ITMT enablement depend on debugfs

----------------------------------------------------------------
Mario Limonciello (1):
      x86/itmt: Don't make ITMT enablement depend on debugfs

 arch/x86/kernel/itmt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
