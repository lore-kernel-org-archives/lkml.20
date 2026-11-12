Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468080;
	b=EW3vvmFlHRiYDN5WzwDq8iqslNgvbBIOEeqFh1og/Q9EPDblwDhJqly0N3qZuVOH2p80
	 wPk1yPQmg3R1+VuuG5euU+y5XkXSLWE6vJQIgyxyTWIycgzqj15RQULX3FSY9K/nV1c/q
	 YUU3nM4iOXKYUk1V+pXxUkfWFWqhxNuI0I1coFOmBH82hYeNEEmmQxq/a7vyiOuwhCkrD
	 RHw45aUlBaywnV+ZyhrOezT7jXQKE875ZN57xqct4T7DK5WhwNJ2/Ol1Lbs/7oDugT1HP
	 ZM3QCXpmLw51P0tpE6UDeUMBGt/yE9ywN0J8EJhTkeaYhft8vIZx2m/G+d55RIXTepA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468080;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TEUWz1A3U7Gqq+WaX4VsmRoLtlgH2qcUgQmLzoqAAcQ=;
	b=Y/Os95jVk7MVIZcCA6EFLgt4p9xu+F4yy7PmuSuZzcN5UEG4CispW7P68H9ujcMA5FJH
	 /K6ZeNU+vCpn9M1/gCBeRUxHZ3Xfk1h1hxVWUyFQ7Tr5xj25v8YEoXPq9EWTkad9mkVlD
	 +fUl0Q8kNgy2e554SbyxbSl231227p848IBaqlUiqcR9ymvX6dQM3DcKI6Ofkp3wXPD9d
	 9sZjNV99KgxeLbYuEkdCwyp/cS9d3p7RrvZ7AwanwDCHBwMfl1+iCKQpjsDjYirBvTDMD
	 6U8U5Ljn3uvR0Q/Am1cWO8zzWAm8uHQxbTyhnGxWzYTwK2EaymA+nfwLTE+X9JBovuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RqmpCobu;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5B606A31C;
	Thu, 12 Nov 2026 07:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RqmpCobu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468080; x=1826004080;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ffOSj0lMPrdwDBPVlKKcfnCz+pLJiVA7EIx5B5l99cw=;
  b=RqmpCobubLTKtenkA2iK/ho+hZo/eijIXnv+j70TjwqacPUkRI+VeTqO
   bWjp+Jq7uIFEBUkp38InT63xufPiObxVkwxl5wwzewPgYSksmnd/PyMAK
   NyksAOHyvA9/ai8jqYXfuQcBLiFGbaGyOJIuBTAEHdkm5GXIEaiZhZptJ
   YE75lO1aiGnewgAPEw/2cGAj49jbt7jRk8MJi7khCjGkV0nY9+E4QiMjB
   89P4xal89J4bBt4BRZWJdUG1jJ+UW6M56maWMuxpDbmm8Tcxr9UzcZqao
   odDjbZvSyRt9NEyJ1ooxuH6wWYpDV9UbhSzeMa8NY6pYUZkqk/0dUD/8I
   Q==;
X-CSE-ConnectionGUID: DmXDHZTbQRmNx7HeKgNQQw==
X-CSE-MsgGUID: cQYxFuZWRAm65/p9gxy3uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142242"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142242"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:19 -0800
X-CSE-ConnectionGUID: BM8296x5TIa5P6y7b/ep6w==
X-CSE-MsgGUID: T2maWs3gQ+6nRpP28SJ4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318057"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 0/5] soundwire: Fix bandwidth leak in multi-link aggregation failure
Date: Thu, 12 Nov 2026 15:21:00 +0800
Message-ID: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
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
is selected, so the lane assignment matches the restored lane_used_bandwidth.

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
 drivers/soundwire/stream.c                    | 25 ++++--
 include/linux/soundwire/sdw.h                 | 13 +--
 6 files changed, 92 insertions(+), 36 deletions(-)

-- 
2.43.0

