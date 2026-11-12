Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453003;
	b=er8v1Cluk4gmlbLQfn+kJ0fqIFZsq7YV3M1QWwA0OWxx6wr8cBICPkoNKvrj+QOsCZY7
	 GCjGo+Qq8um4/adtqVLG/zhSNDMaSju8C/zwRCWqhoYDAJmjJCeLAqdnEC4xf/zMayWEO
	 /5yg+MkQp0xejGnZ5x9lkKDbsn3Lc3xtek21VixJsDJiKQNClFkEPpLZ87XrDeXye8a4W
	 OgpbzNk7wNa8PRa2V+pkvFftJ0+FQdJa3JeTntOAr6rMxW30acVfb4qILeJml1xChav/9
	 QjqWeqs4L03uRYOiecYwcOg5na4Ih8nFSNbmkAncMlHu27pyq35cA16GSC5jtQMMl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yIwtCIPmNWRG2L34FW5u+h3d0vxkMjQG/rgpBDVG0tE=;
	b=g2wz4b3NGhFh+104daj44DcTMM+Z/mIIQeDrN0SGwdil6YHBfn3uumy2GV0QxILKiMd5
	 WWz7W6bAgW7FOawJwrl7G8JAhSwy/33YZZW4g5iUtCgZ5P8U5fTVzAB4HnwchOfGmVdL5
	 Is61uf0lGKS+VdsCnBUaHfm6vlbyp7bcxCMp2FKbGEinpU768JJfgDO8u7ViXQz7khW0H
	 9/WUG0KgjvyECD29XtkcbDX2aGvtSyfMV0G7yRz52MW9TgtOQZkuTi0DJRTmPqemkLhXF
	 mfR0y0egsWuQWt2VL2Tw95p117OWBz3q7jsAqFok109webqgtaRjsiNq396jMCjf3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DzblQSjv;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D722606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D722606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DzblQSjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453003; x=1825989003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIwtCIPmNWRG2L34FW5u+h3d0vxkMjQG/rgpBDVG0tE=;
  b=DzblQSjvsFswugPtPVDdMO6yW/sQhHStOefCels9zlyi1F0T5kulp135
   RpkVrxyxIvHlaTu49WCW8MlSD2mnfobWKRUkH5Saxo3sp8eWN0qPAwil0
   WldCQ/z08cdE/bfsaM+cV7dKNRQqdqMTuly54v042NjNJjx0c3qRxNrsp
   ni1CzUoigksREG/EbwQ9JXngAnn7RSq1eXwglE30H5motsnaXUoljwR/b
   kDbzouPkBSBCv17Mt86TPkMBjW3SayykzFPDMc4VYtImjCXT5YwdqmU5D
   YfNhjLNoIQPK5wtGQ9svSnZeZhwRLCA0RyDNSEmRIi+KLxzblkv0a2o0x
   w==;
X-CSE-ConnectionGUID: TR8Hxys/SbGHzJ/S9TIQFQ==
X-CSE-MsgGUID: mk04Xn6kRvWzBXDi/u7CtA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33547064"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:10:02 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:3028]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.250:2525] with esmtp (Farcaster)
 id ad508032-bac3-41e5-8f44-92a8e469715c; Thu, 12 Nov 2026 03:10:02 +0000 (UTC)
X-Farcaster-Flow-ID: ad508032-bac3-41e5-8f44-92a8e469715c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:10:02 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:10:00 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 13/19] nitro_enclaves: Initialise the CPU pool mutex statically
Date: Thu, 12 Nov 2026 03:07:09 +0000
Message-ID: <8d84cea3f7611caf47a797e65b4171a3acdf0c81.1794393487.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The ne_cpus setter can run before ne_init(), when the parameter is given
at boot or to modprobe, and then takes ne_cpu_pool.mutex before
mutex_init() ran on it. Initialise the mutex in its definition instead.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 70d740d64ee17..44a4432be8164 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -125,7 +125,9 @@ struct ne_cpu_pool {
 	int		numa_node;
 };
 
-static struct ne_cpu_pool ne_cpu_pool;
+static struct ne_cpu_pool ne_cpu_pool = {
+	.mutex = __MUTEX_INITIALIZER(ne_cpu_pool.mutex),
+};
 
 /**
  * struct ne_phys_contig_mem_regions - Contiguous physical memory regions.
@@ -1902,8 +1904,6 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 static int __init ne_init(void)
 {
-	mutex_init(&ne_cpu_pool.mutex);
-
 	return pci_register_driver(&ne_pci_driver);
 }
 
-- 
2.47.1

