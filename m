Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493163;
	b=nrbIpFQg3bdkLey2vei7QsCnL2nB9E0lJeKxleqeGDXUttfg96a0WqsoU8OEkVXjGcN4
	 d54CBNf3pHouvgsuYt1jHq7ZarORKdoI+X8YwTK6oB6bzHkspLXkcEvRBnE23/5YPTA7B
	 kGWxAzZpSHfIwxSZO6NR/td1jV/xLJ9AcDVQBNC/1D3Lx5xxmg3os+bB4cWCYjUPMHVHU
	 v4vtsSDN9L0WBbSLKKv0IkGaqjYQoyxBTtR0ZCtXLGnlaXrjlV9JjJJnJ0ANRl2Dr6YOY
	 yXPGkqx5FPACGjjz9ylQkqUJmXdXbtSmerEieBC7a/YUUrJGZwirHbZ9sG6I20nvmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493163;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/FY3F28bdICr6Wxi8tHBURhlleNmZUu29i8v10jYa5M=;
	b=PxpU8X7zN65R81qzgNuMxq0q9G0v9LYL5vMRzXJDIkFV7OPjqNBXTF0PzzJ128dSmnZD
	 YXcRZdPWcPMTy1Dv6mXNsOXccdrXc7utwZh33nB2xMqjUtX4/PC2mPw2OIdHdVtjutjnk
	 f+7V+ciCvDpZpR0kLvyPYJS0ToMatTzl21SPUC8iG7uNDmd907wKs82ryzCIuXWaNOnji
	 hMwjKCZUzTV9QghnE5x2WSd+Rknrc148jCdmQ9uMdt6u+83jA/GX5Rd6cnVft3QXUn11T
	 JWk3tfiN3Ot6H4UggXXEJ7nhF5tgxdKMO1OCgjqn6aq4UuU/81U96iHjKuMfDQT/EZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxnkJ3RF;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D3606F907;
	Thu, 12 Nov 2026 14:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0D3606F907
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxnkJ3RF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493163; x=1826029163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BloERTgkH+RFiAqSCRMLy1Orq3vnOC9oFQVilFuX+Qk=;
  b=OxnkJ3RFmrpNr/CExoKFcCwVx+bZLt/MZWXDn3WltSaUmb4Jup5Z4XuG
   TDIVbKlHfcSeZsBMwVE+LMfS/bIrG8eCPtNlUjpC+mT9I7h0320Oe0st9
   1aRGViwlp6OWkSv2XlpBU3AuN31DfOaZAL8YwUYaCG3z9kQc7jEsbk3CF
   DlOad8s1ShUQWcJCLDvWlOesFIgOjgE7u24KaTYq1zJNN2rlzO9waMr+h
   lP6GnFAZJT1lSnzqRXqkYF2wQguTv6zkhDYo/4rDRZ061XFDdnvCvISrE
   /1L55GCv5fWUd09lKrvCMyRiIi7frLD/4QQA7pHStgvDPCUqzGAYPBXi/
   w==;
X-CSE-ConnectionGUID: pqqtJ+NkSa+FIaqRwJHxmA==
X-CSE-MsgGUID: fb1ebY4aTOWUAPGqsr4b5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377802"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377802"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:22 -0800
X-CSE-ConnectionGUID: 9kuq3aEgRa6f68EBbLh2lQ==
X-CSE-MsgGUID: oypZvLhNTauZc3gghy86ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668743"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 0/5] soundwire: Fix bandwidth leak in multi-link aggregation failure
Date: Thu, 12 Nov 2026 22:19:00 +0800
Message-ID: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing code only copies the params from the first link to the
bus params, but it doesn't copy the bandwidth from the other links.
This can lead to a bandwidth leak when multi-link aggregation fails.
Fix this by saving a snapshot of each bus's parameters before making
any modifications.

Changes in v3:
- Add Fixes and Cc stable tags to "Select the correct runtime for lane
  allocation".
- Fix bandwidth leak in multi-link aggregation failure:
  - Reset the lanes of the stream in the rollback path so they match
    the restored lane_used_bandwidth. This is skipped when the
    parameters were not updated.
  - Keep curr_bank and next_bank when restoring the snapshot, as the
    register bank may already have been switched when the failure
    happens.
  - Update the commit message accordingly.

Changes in v2:
- Fix lane and rate group handling in the generic bandwidth allocation
  that the rollback depends on:
  - Pass the prepare/deprepare context to compute_params().
  - Select the runtime of the stream being prepared for lane allocation
    instead of the first runtime on the bus, which could be an already
    running stream.
  - Include the current stream in the group and port computation when
    it is prepared again from the DEPREPARED state.
- Reset the lane of the stream being prepared to 0 when no multi-lane
  is selected, so the lane assignment matches the restored
  lane_used_bandwidth.

Bard Liao (4):
  soundwire: move lane bandwidth into bus params
  soundwire: Pass prepare context to parameter computation
  soundwire: Select the correct runtime for lane allocation
  soundwire: Include the current stream when preparing again

David Lin (1):
  soundwire: stream: Fix bandwidth leak in multi-link aggregation
    failure

 drivers/soundwire/amd_manager.c               |  3 +-
 drivers/soundwire/bus.h                       |  3 +
 .../soundwire/generic_bandwidth_allocation.c  | 81 ++++++++++++++-----
 drivers/soundwire/qcom.c                      |  3 +-
 drivers/soundwire/stream.c                    | 48 +++++++++--
 include/linux/soundwire/sdw.h                 | 13 +--
 6 files changed, 115 insertions(+), 36 deletions(-)

-- 
2.43.0

