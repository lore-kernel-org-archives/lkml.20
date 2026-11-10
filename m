Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303508;
	b=XYELYrul1b9ak+9GzeaAErkDtJbgXMAV/zcHfRE5mYF//8TeCAmJLC5EgWn9n2vCY8CQ
	 0Xp4WrOAy34jGwVodK/4BiJS2fo/OSQEAE1CGPTxS7HS1osd7wOcarR9RQxKq4Es+BS7N
	 GxsczbtsFhXJQBehbpIAidZm/otF7a/7P1VbWq5Z9iWOcY6Jmfb9NK+oErXU4H9FSe+0K
	 cXWHnwGEYp6/99y5/VQcSKpyiCfnt0yuJe1Te/E4rccOZ+z/FbWQL8W04QDIf8QHnz4tG
	 qPeezNCVIkHJ6YWFOnkMXILWZsGOZPafuHq/sQ7fWTlgEXUza0TRtRlO8rSq8PHSOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=06Ulj6NkCviQUwZyv/2qREw+wPFZbw4i2H/2PgdA2hQ=;
	b=IS8vu4d934TGn17COO+d3RsETMHOsRUAu86y9TcChXr/t7HSaWOtkxKSKphJs+LSea8i
	 CkPM7TA/CZvAKatJIBBcPGh6IXF0ZSVea3eK+4dkrOeenBY4lXeHRZdRpKzAS8+uoSytq
	 T/KywGQkFrfsm6sdjpTw6Gt5QyuPfe8Y+1UuQBo1IyiqW2geAQhviYTBXV91V5PBFMxJX
	 OZLv60cxVsx0lLti81LwPOw0Z2B2DvQMsPKP/qzXBPSJmJ2QEUpuyIxBLjFTMGVqHeEdB
	 gIsGOOH8vnfEMD1OousBTPdI4yBulX2iaIqfddBzagtuISV9HoqmuA0uH0fLbgLU4tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzfnmqON;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E0606A99D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3E0606A99D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzfnmqON
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303507; x=1825839507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vSIburH/eRmSgUJQS3jc+S7IkjN724pv+ZMk2byW2r8=;
  b=lzfnmqONjvhODYaGI8pLc5ydKSf9B51+EFobn/ks6LSOnvz48nVMFhmU
   TwovXfgcEUBfL8dNGUakMxy+JOI/nvrNibqylKgYMTlh4jiGS7z0W4a4w
   kI8awP0MCwS+JpgUnnTMS+zL3L1yKdxEiFpkZRMKrM+X5aMqvJwShuUxe
   f6VeD/aTcJMlWcgq9wZnahKeChqNrhcvomj0Y+Vea+zqpcVapxXroOyeq
   mhWz7ekdGirUSXMlZdtBVPPNIeyL5dqx68/Qkf2vY3/UvZHkrgjGuhPDK
   J+Gk70V7DUw0ER3/zPDGxZsWWpMEHzBjmfDNlqMmYN3sy1xJ9sigHDiod
   A==;
X-CSE-ConnectionGUID: UZ/tseY4TruUjeEu1xYf/Q==
X-CSE-MsgGUID: 47kBjtDeQDK/7NSgdO6awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961815"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: iS0YaAfdS72TurVb28PtgQ==
X-CSE-MsgGUID: JvO0gIIcSnK+bxTVmfT0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975224"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2E494A1; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] regmap: Drop duplicate ret assignment
Date: Tue, 10 Nov 2026 10:37:02 +0100
Message-ID: <20261110093820.454682-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
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

In a one case the ret is assigned at the top of a certain function and
gets reassigned in all cases after that, making the initial assignment
useless. Drop that assignment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 1855b5fc76da..b729226e9e3d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1608,8 +1608,8 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 	unsigned long flags;
 	void *work_val;
 	void *buf;
-	int ret = -ENOTSUPP;
 	size_t len;
+	int ret;
 	int i;
 
 	/* Check for unwritable or noinc registers in range
-- 
2.50.1

