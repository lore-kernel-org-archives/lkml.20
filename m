Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00249431E68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545085; cv=none; b=UEwt9VqH4PBinCPTdUstOuZNRV4vz+WGlSqE2g43hcUAr9x8ihAmDRB0492P9K0IwhNVcuMMUe+lIzKTltViLrNPMVSWkiwzfeaSo2MlU2lsW8z5sl/iuXbiLAfXurNyiU4wTV1tHYi6P/cStt3qVmhf8jctVl7H3b0kNHcVrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545085; c=relaxed/simple;
	bh=qbaiVgf+FPhg9ry/RsD0C9yh5wWMVw6jOEGioOdbWqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaA8A/Z4Uhg95CtTuVS88VHxKbPfU7pxqRIbJvmwZaHSiyrjoDIHbAQ4y/9jlopYgl6mtWjOCn1ubGtbqlXTs4rHi8gCTALbMzyGD/mftKJ8SaZOnp/EmStkdarE1cT3+i/NFwmI0FfGhiY+LFRAKryavrdjKJsenKX6ZVqhoK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=sddbpjbj; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="sddbpjbj"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qbaiVgf+FPhg9ry/RsD0C9yh5wWMVw6jOEGioOdbWqE=;
	b=sddbpjbjTNkjPD/h8yl9ZQPRMx1qGtmVtYzjSTlbG9GUdtNlf7wSR04H/9HDlfabW49JpmWWL
	SxWWAlxZGpOoWXj/LRqnoH38KB9Rx4FVm4iFd4q0OvCRSDzDx54x618c//99vBUeUAHU3YZFm+W
	l7DQ1gZUNSjXZ5iisFguYfA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hl9lj02K6zRhQs;
	Wed, 16 Sep 2026 15:40:17 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AF4D4057F;
	Wed, 16 Sep 2026 15:51:13 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 16 Sep
 2026 15:51:12 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <phillip@squashfs.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<ranhongyun1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: Re: [PATCH 0/2] lockd: fix two bugs on nlmclnt_find_lockowner() failure path
Date: Wed, 16 Sep 2026 15:43:31 +0800
Message-ID: <20260916074331.513900-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8875193b-e30e-4dc3-8222-714300768cd0@squashfs.org.uk>
References: <8875193b-e30e-4dc3-8222-714300768cd0@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr200001.china.huawei.com (7.185.36.96)

Friendly ping.
