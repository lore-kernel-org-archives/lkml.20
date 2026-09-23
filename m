Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62F52F274
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169494; cv=none; b=Xusjozw1gD0dtg4e3/V48Y+M9jYraZduQT86PkgoDWXeowWnmLu9ys5rR+qVaSXFi2Xz2qXrI/TFKsT8vR39Xhs1RosLDmiro4MPQz7tci/ctj131JEwVuSPm2RziaJo3qlEOyq82X/cQ76aS83261JSJrNrgfXZptfT3G1RTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169494; c=relaxed/simple;
	bh=pAXeYM6lwvoGSivvF87fwvmUngRb5vjvFBt/KIqlz30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qIpQswqmmRtUn+zNa0CIWTgfbSojaQYfHYlfRAf7/f+aj3ngpoNVjjAkWixYlNCtJM9F2/q2uVEl+OXblPcy3UisXcimmeNdnnRM8/tg+TpoNPfa2Sm+11SkY4kl33aNiyD3Ve5BdawfZtJSeHcoIWVFezZY1CUXuINfMILGWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWNV/Dr1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWNV/Dr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790169492; x=1821705492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pAXeYM6lwvoGSivvF87fwvmUngRb5vjvFBt/KIqlz30=;
  b=MWNV/Dr1N+WlH638l+rmscaFVIOdOMqfioBXYyl6SWAqk6esZPSjI31+
   AuH5vgo/h+4NpM7/JBb0SveptxoKJurm5pWqhVdPxDAqm1T0UuEf0Ef8w
   PyKM385t1OWdISTV0eHD+lyvG4cdbAHmFSX/2NPlihvFqWSO0o4A2r1x7
   425Z8Bod6kiXbpK2sQ6MFBy9sP8a7xAItx5m20/re2/0qSxJxh6m2RsJ3
   nTWdVcBQDV+ycTbnlYQqemtSIF5vZ1uB7FEiURqG2zGDrHodqHJ88+VFc
   5MEgyz/IiatntMznaBF6CfQdddCE23MCcKcPV3fEI45JZB+/tIUt2MNRw
   Q==;
X-CSE-ConnectionGUID: vbWZ4G8VSf+r61Yoc8OMLA==
X-CSE-MsgGUID: +RaxmGLtQm2FpmcZdNobYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93363219"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93363219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:18:11 -0700
X-CSE-ConnectionGUID: vkb59chrQ4+T75JwpBJxDA==
X-CSE-MsgGUID: Cp2ll2JlQNugspE8dWADsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270120591"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:18:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maciej Grochowski <Maciej.Grochowski@sony.com>,
	Nikolas Joshua Britton <nbritton@exabit.io>,
	Geramy Loveless <gloveless@jqluv.com>,
	Eric Auger <eauger@redhat.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/5] PCI: Resource placement algorithm fixes
Date: Wed, 23 Sep 2026 16:17:50 +0300
Message-ID: <20260923131757.7792-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series generalizes resource placement algorithm. The commit
9036bd0efcb6 ("PCI: Align head space better") special cased one
composite resource remainder case to fix a regression (in a long chain
of regression fixes). Unfortunately, it introduced another regression
(or a few, to be more accurate).

Instead of building more special tricks, generalize the PCI resource
placement algorithm so it returns placements that gives better chances
for the greedy assignment algorithm to find suitable space for
subsequent assignments.
 
In short words, the new approach tries to find a placement for the
current resource that blocks as little of the free space range as
possible, considering both alignment and continuous free span of the
remaining free space.

In addition, the series corrects composite resource sizing to account
for gaps that have to be added due to alignment constaints and
remainder space not fully connecting (filling space all the way to
the bridge window align).

More detailed explanations in the patches themselves.

Unfortunately, this also causes yet another regression due to shuffling
resources around, even if the resulting arrangement seems just as valid
as any other (see the workaround quirk in the patch 5 for more details).

Ilpo Järvinen (5):
  resource: Mark free space assigned
  PCI: Fix nesting windows with remainder at the left edge
  PCI: Place resources to either edge of the window
  PCI: Fix composite resource sizing
  PCI/quirks: Avoid certain BAR 0 address with igb

 drivers/pci/pci.h       |   4 +
 drivers/pci/quirks.c    |  56 +++++++++++
 drivers/pci/setup-bus.c |  83 ++++++++++++++--
 drivers/pci/setup-res.c | 207 +++++++++++++++++++++++++++++++++++-----
 kernel/resource.c       |   1 +
 5 files changed, 322 insertions(+), 29 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.3

