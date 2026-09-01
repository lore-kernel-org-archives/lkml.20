Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5052D9484;
	Tue,  1 Sep 2026 03:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231809; cv=none; b=Q2wpKtb4IGeP/k3NjBRNwLJn+elskJmJkH6V705y01dlG33OufIkkJOjrfKqV1VzMSEzJTmwhkmZHQhROwIEuvlHN5OMA6B4jwOvwjQfM/T3ly7/ARnsWHgZNkOGqjg2cjJoExShOIXu1H4GIIrXSdA5XqLexfplwcW7RtA7YN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231809; c=relaxed/simple;
	bh=7hOKgSc7OBhDCCtt1l/cMiHEQp/E4TG8CaEkZHnFT0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tAOmxWk4pwfEPgShQe7kQDBsXBzJv769NfF+WtSxZPnG941+zWTIB7EpPJUnp4dqt97dmYcCqYxqDdHJct8OdfVW8URXzlkDB+DYfUxfQ8dkyBsxRgkO6+tnTIQ0SsGnNEMIyMLq0lD9fm8iZ2iGL/Y6bZwN7tUtsdLZRBUjE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbi9JQi9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbi9JQi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788231809; x=1819767809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7hOKgSc7OBhDCCtt1l/cMiHEQp/E4TG8CaEkZHnFT0o=;
  b=dbi9JQi9M4p0biZhJt6KH7zYGk8/drqGc0UlOLd4Ey6NtVOnbLv5jLOE
   PNnP0Fhaluyzk66AzuFamGOoXjIDF+o8x0f50zmgKyesaMIAgj3silXyb
   39kvGrBj4DnvSnsLczNt+kmnZh07zghGUzD088Y5zL2rEMtPEo7lGUY4B
   VVuHsvAUZpcmByUrL5JrHjRuBMbHF7cO25ncKjSTU4EqYO1XoLZFpjjfk
   V6nriaEKDsPJy3z1G+19YiEqgAhLENzZCQJU/mvak2XUe1Ply6hCEl+vd
   a7CUWSJbbznEQBwBPWr/6Ad+pa2UR7oYSr4ycn6k8aemHXC6+4F8oT/2S
   w==;
X-CSE-ConnectionGUID: pzkkX93ETBuS0llatlMZmg==
X-CSE-MsgGUID: gft1zBfLQh+PGPlJIa6kEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87785649"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87785649"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:28 -0700
X-CSE-ConnectionGUID: NIGc9hV2QOKoFHnM5CAxDg==
X-CSE-MsgGUID: eUXr/QqhTzSeza3wLYTibA==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 3/3] soundwire: Intel: stop sdw clock in system suspend
Date: Tue,  1 Sep 2026 11:03:11 +0800
Message-ID: <20260901030311.232823-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
References: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Perform clock stop with proper mode so that the Peripherals can enter
the deserved power state. And keep the bus unwakeable because there is
no need to wake up the bus in system suspend.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 77e09e0e9953..dfff44a30c7c 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -670,7 +670,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
 		return 0;
 	}
 
-	ret = sdw_intel_stop_bus(sdw, false, false);
+	/* Perform clock stop with proper mode and keep the bus unwakeable in system suspend. */
+	ret = sdw_intel_stop_bus(sdw, true, false);
 	if (ret < 0) {
 		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
 		return ret;
-- 
2.43.0

