Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1172263F44;
	Mon, 28 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593016; cv=none; b=Wy3zW6GXXkdYhmCUSSomTvYAOY1cuao7+iKMC3AzVpzc3nB0KWO9inarBtQAirRUsL/xKJiHY0GJ8+TVkzHCMhPd11Wv42HmTe6Cm0AXSLOgWO9Xd4iy2L21fJMGaBNBjYWT+cJ1tLmMgLw4FwsHY0zmK4r1QBauG3YQ/t5lZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593016; c=relaxed/simple;
	bh=DPnhtLXN/5smggjhp1MjWW3eTTSr2ixtkhB5+Mg3HaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcETBzdpH1K2JBnSrXOQ6En00eulVstqqcvoBr3luICnIc8A6HeWpDSgoH+3TnR4rIl/Bsy3jX/amacfX2JFGkk9+IpA7L81QsRl/zU3aTK9WxuHV4r2J9kqK7ZibUua32UYw8j/QTKmzgK0hGs23U5XtbiHmNIkQYafZmCeAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1iCxmfT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1iCxmfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790593014; x=1822129014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DPnhtLXN/5smggjhp1MjWW3eTTSr2ixtkhB5+Mg3HaU=;
  b=H1iCxmfTypWhrJUcJgYT0yi+JrbKHLBMghMPdqJr1uW10gr0ShwiNMbc
   NLoJj4f/5sGa6g14Oka10JzFP21KX+wc6rIIue9670FvBAjjyrLSNz2IG
   etyJOtwpGagGoVj09QY4bP5awKe9kHgVBl4hefbR5IlZ/7IDWI5ehM9Db
   u2a3b+2PVQ4y0fILxbWD0Vg29GH99XSmkRA48YPENNwBLSr/X1TJ8NIgY
   RXIAECloBjy68swPAnhY8+i66R9yCLxgML53g0jrQZhpNBahnI7KRp7u7
   vdGXuM61bhPRnqPfwRCllkhWYTXwhU2bZPwcQT88XAh6sIDhZQK9Bp7br
   g==;
X-CSE-ConnectionGUID: ukk4Tsl4SxCHx4X0dS74lg==
X-CSE-MsgGUID: 3/zgcRX+Qumikx0BMu06og==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101857543"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101857543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:53 -0700
X-CSE-ConnectionGUID: sKZh0mGrTnC+lhXOdV4zrw==
X-CSE-MsgGUID: 3doCJi3AQMK9etRypVwi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274559667"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: dmi-quirks: Disable ghost devices
Date: Mon, 28 Sep 2026 18:56:38 +0800
Message-ID: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable ghost devices on Lenovo Yoga 7 Pro and Lenovo Yoga Slim 7.
The first patch is a RESEND patch and the other one is a new patch.

Bard Liao (2):
  soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
  soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7

 drivers/soundwire/dmi-quirks.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.43.0

