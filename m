Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5565304C6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169503; cv=none; b=U6ghRZv91oT1/vL6OwWzPZaT3mgt+D4odMvK7iCpoGsb6hDIF9oOorpgJSBYze3vWILNSSuyN++PnHHyboq0ODLD2bMwtkBYWeNtQpSjJgJj7TAK1/JLlo4nwkTrKo0Q/JiJMjZtUezQ4KalH2SL/PHBXBf/y2rl4AdDbsZkaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169503; c=relaxed/simple;
	bh=VAeffurB1LEC7MePWxGtJFLS0+Wo9Bw4rm++iGLvDsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAN1WhJqKcxlnNp5IF18lZ8oUdjmB7o06xaQ2qnLxgjJIBt1iLttbO/sPPq5tIFef+lO/tB257XjWwY5huG3Z2K1pZlYaU3g8kQAS3XuWxzc94DoQ+HxCYsAL60UWOXbFQc5nQtByUhFYWnw3wXXA7E5uh1WWOgyOyOYpSylX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCkcnDnv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCkcnDnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790169501; x=1821705501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VAeffurB1LEC7MePWxGtJFLS0+Wo9Bw4rm++iGLvDsA=;
  b=RCkcnDnvZLIZ3VfjrgtkmdNd5CYePrWcREmkIoTo6aITWJBoIN38l0uX
   JcipGXDH/ccjL58s68W65SfKkq0VN3KU2jOE719goifc/+Af11adYzVJc
   Qm5tujea48X/ebyW5PntpzO8n6aYPzWMdA3yjekMfdVeMyOiwu/QX+qiV
   hVb6vIQ7iU9ylvZJ5qE4gPxoFuK8zwkU/ZHgVKI40R/D8VzEZBjYWm2vx
   gf4L3Az4yBxpx5TI/8C6meOexpsh6z4nihCpcwcDFWD+xaoEjThhJIwSi
   BiI5Yy1sRuBQxJrO3IJdF2wvTPjvR7P0M/mYJ570fh16o45ogHLlzxDnW
   Q==;
X-CSE-ConnectionGUID: aHg/qptPThOAMKzcc/VxmA==
X-CSE-MsgGUID: 0vvrX+C5Qa27T4cboaReWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90979643"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90979643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:18:19 -0700
X-CSE-ConnectionGUID: YONggUCYQsylg7bfmOoSYg==
X-CSE-MsgGUID: SD4dEv2nTdyKwSGYtLnrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272784454"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:18:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maciej Grochowski <Maciej.Grochowski@sony.com>,
	Nikolas Joshua Britton <nbritton@exabit.io>,
	Geramy Loveless <gloveless@jqluv.com>,
	Eric Auger <eauger@redhat.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/5] resource: Mark free space assigned
Date: Wed, 23 Sep 2026 16:17:51 +0300
Message-ID: <20260923131757.7792-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923131757.7792-1-ilpo.jarvinen@linux.intel.com>
References: <20260923131757.7792-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Free space ranges are (part of) assigned ranges. Since new resources
have IORESOURCE_UNSET, the flag gets copied also to full_avail.flags,
which hampers printing them with %pR.

Clear IORESOURCE_UNSET for the free space indicator resource.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 kernel/resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/resource.c b/kernel/resource.c
index e60539a55541..17e7fccd859c 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -731,6 +731,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 	resource_alignf alignf = constraint->alignf;
 
 	full_avail.start = root->start;
+	full_avail.flags &= ~IORESOURCE_UNSET;
 	/*
 	 * Skip past an allocated resource that starts at 0, since the assignment
 	 * of this->start - 1 to full_avail->end below would cause an underflow.
-- 
2.47.3

