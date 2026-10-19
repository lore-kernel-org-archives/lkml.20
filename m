Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422996;
	b=aUWrpR0Sdj7bEBz1mSMiJdJcvJRzaNLAEkc2/bNGXnc+GmVqyqfWp0rKSO0/ng6NEcb3
	 CjfhM72wx1ndXcFEAgt+ut0jVM9Ao6OZHAXV9rHlOeG7hu19hnkEz8Rq9ITWARdkOY1qq
	 YQIozYHpUkbepZvEAIr3bC7DfBrrMj/hSjHONvhasSkq0YdRBBu0wwWtBZrID62byioCm
	 7teBb/du9NnfOsZntNLeAUtExEp9osXSOAHNKGFm14V/RQYESdkdtNhcpnAU2HRGJYaJH
	 hrDX57EJCwhy8VuWvfMoogNwBCnSLg0SNBWeAbbml8vQ2oneeKatCYH3fCvAl5pftuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+DBCI31bhKDwomwannOKXJ2BAoZ/eNLbG1ndmkLh8bg=;
	b=Z4KjKxvh7WRSQwaizTCkV0osBnZ1QUAO2wK2+9baId+LPtO06Lu7FKAXSsk4e0LY+owG
	 bAu8rF8NMR/OYAwaoWtUOl0HyaeLsqcH6JA04TPa1lhqgLTFSSbHQjL4gBg+h4Vy50KkA
	 EMRDrbn5VbGiUpnBM75HqXN0TrOy+Zo3srRHrwyBClOYoDbfvHwT1UjpDNrYIiUfCPBph
	 XNabcecizPCdjkpL8jbP/iQRpReAN7sgfXpclseOceLxn68S+5unFWXtp9tMPrTLYcd40
	 354EhAzeGXAbBFfhinxwC9AFv/qRrw0SfDQb/sozTyNVSKzE/Igr9vVFA6uLBwjCr9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU9hdYvT;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525B609F0FE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A525B609F0FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU9hdYvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422995; x=1823958995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KIahimgBGMusWDp05aIb4AGG/FeJUJ5XSWAUxOshACI=;
  b=jU9hdYvTIHiCu+JunUbK75kQOoODxkJmylGyLQztWyd3tyybtEAEkzUL
   R1tvsxosL4emTEzu/FpOgAorF0ZAtnEYG+7xHotRRzAPy3Nt6XykHcGFU
   GJxQsjkyrdYmf4F7uSnRY/NqKceFnItD6Rd4DVdjKykaN6Rg5ir/E9N9v
   nPSL0Sv6P795p5XSBRYHufsWC98TxAc4KJZWW9d8n6WA4akIRY0lh/TYC
   rOknZDBVkgG9/nXlGz5fkHG+P6lobs3pgkCCyaHK9shky8f7BxHUwwxJQ
   FfjF4fN/bAX7wCLdi8VHXmfgHhUAgAv4xuagATOfse6yQHPvovz0EyQpm
   w==;
X-CSE-ConnectionGUID: pYJ5bQBNQBGdrFtSgjwO9A==
X-CSE-MsgGUID: 4q1Hyt0zQG+WQSpB4Gi7Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1014877"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1014877"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:16:35 -0700
X-CSE-ConnectionGUID: bTHgNwCwSHOuPuU/VkiTJA==
X-CSE-MsgGUID: 3kp3kPOPQX6deDzzNiFyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4343673"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:16:35 -0700
Received: from ray2.intel.com (unknown [10.125.111.15])
	by smtp.ostc.intel.com (Postfix) with ESMTP id F16996393;
	Mon, 19 Oct 2026 08:16:34 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/microcode for 7.4-rc1
Date: Mon, 19 Oct 2026 08:16:34 -0700
Message-ID: <20261019151634.1857472-1-dave.hansen@linux.intel.com>
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

Please pull a x86/microcode change for 7.4-rc1. This one simply brings
the "old microcode" list up to the May 2026 release. This continues
the policy of intentionally lagging Intel's releases by roughly six
months, so when the kernel complains, it it for _really_ old
microcode.

--

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_microcode_for_7.4-rc1

for you to fetch changes up to cf086537af4e3b04f6012dae3766a51ed1afc61c:

  x86/microcode/intel: Refresh old_microcode defines with the May 2026 release (2026-09-28 15:39:05 -0700)

----------------------------------------------------------------
 - Refresh old_microcode defines with the May 2026 release

----------------------------------------------------------------
Sohil Mehta (1):
      x86/microcode/intel: Refresh old_microcode defines with the May 2026 release

 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h | 91 ++++++++++++------------
 1 file changed, 47 insertions(+), 44 deletions(-)
