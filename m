Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CFD41E6D6;
	Mon, 14 Sep 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378498; cv=none; b=s7BGV9bFd0IpZpKN5anShLx3MUQGVj3S7NVhn3jQiwZG302UaZyDpsNZFBC/DP7mt4PwhA3XlVnbdNJj3w/O+J30hhv63ViEfGMSKLdzI0/8S3ufP2TyDJEd6U0ktzTJKDnu3Wh9K8LYJ2hrn7sFjpg2vBmsRVVSAAu93CkvgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378498; c=relaxed/simple;
	bh=I0/YcWacnfBTryVuJqe6e5KjjUML5m9WWY0xez8S3bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xek99Ic3shU2rZlO+U6ewnN1nYcKSA77MMyvGrl99u5gJVSySU02BFCk0o+zvcRgkNnrsDt5IxWVKO9gtHQzCfUxo7gf9VEeHCUcrKKWhpqCGE1SeDcwLXDS5HiKED2cAeNC2Ld9HNhWAhgX9eWi0Z+bqV55LAwQn0XecM54/UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1QMiUft; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1QMiUft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789378496; x=1820914496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I0/YcWacnfBTryVuJqe6e5KjjUML5m9WWY0xez8S3bM=;
  b=O1QMiUfteaPI5w+sQGqLK2xJx3D/d+DBHy/dDg/G6oPUZrxWqDA6LwuC
   zbhNmhWF7jEs1TXcxdZTdod0FX/wowVdK/oF3+rvLhX3QAeICsK7+aNPV
   HDfveQafdxkenLsxyM9ZEWTtScuFRlXn7wRp7cY/CnZGGcD8WjSUtPgnF
   AoO3ZqXxaDQsaC325c+YmeNE7o62+cAFzv82LArG8j0srzf6yK6btcI9n
   ZL++W73a6OApsiZc8uOl7VZKOJfBizwsOybAXZqcABcHW42tG8h5N0VsH
   JtBPuXohPIX0k2H5u+zoIs0xYbcDCk+43Bxpvjzjke0YLIJr6XhTbmtkY
   g==;
X-CSE-ConnectionGUID: GWbP2lHFSSqWpStGcGBxTA==
X-CSE-MsgGUID: 6wy7YuKrQPCksWtrz7O2EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89604400"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89604400"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:34:56 -0700
X-CSE-ConnectionGUID: T+lUrQ0QQY2SY/1WHvNoPQ==
X-CSE-MsgGUID: qIHd5XIPSMGH0sqW6AeteA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="266381043"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:34:53 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Manuel Knitza <manuel.knitza@googlemail.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: cvs: Get the wake IRQ without claiming the GPIO
Date: Mon, 14 Sep 2026 17:34:34 +0800
Message-ID: <20260914093434.639537-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914075354.38975-1-manuel.knitza@googlemail.com>
References: <20260914075354.38975-1-manuel.knitza@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 09:50:43 +0200, Manuel Knitza wrote:
> Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Thanks for testing! The link I gave predates v2, which
carries the same code, so the tag landed one thread too
early ;)

https://lore.kernel.org/r/20260913133017.624919-1-junjie.cao@intel.com

Would you mind resending it there so it gets picked up
with v2?
