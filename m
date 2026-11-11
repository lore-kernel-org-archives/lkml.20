Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405017;
	b=b0QKX+dawihjOXx2gWYEsP73wPFuEpErZLtS/a06hEGNNfEiNQALsgf/QO8TdBqY6UXq
	 0wO7CNV7PMaP/A3nqy0zNNIJEEqXmMHdScNILxhTmTPB8e1dkJvIoRQmTvj70mRhVTLxm
	 cp+aERJa3L2tNYM7xgzRtZbad5+QnO5DQcOw5/oh+zOVRu67oJfdwfMtVv8Rxff2zfmo4
	 4SCnlyMDbTCslP1k86vw2zvD2iRWg4mvVGkYT/fKAGeBA4nWAUYt7RbR1eeFTYOfp0cmc
	 2CqZWzA8d6vgATRzmHJti4fvp68rUlomdRfcTm0w8CkCqsrjRKHB4jOwVbf7BAT84SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405017;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0dEIvMR9ye3DZwuK4JLPyFACNz54dPiV0jqTMeLE/iA=;
	b=RzwsYW454NiH+QYk8nQcSRyvgZr2nSs/QFMZGnK2rPGEgGZihWqgIG4kHkbYC62YzbIl
	 KfHXPfxY1QZqqu7G/YPNQYB7efz2E+8aR6LqtK3a3w8OcSZTps1lgY+7DgLfzrkwCAkgu
	 Rpo/dNLYdFkNOgOdE1PKk2O/+Z0Jtmcoe0ZGo3NK1IbSRCkfMlmJEUDOI6D9u3TZaCxn9
	 hwpTaNYcMWRL0egixkmY9R5ZsLwirx2mmBucE/bFKs4bS2u6Bkz8tI1AwGLoNAeSoLaS3
	 ucan44ggHDvVUdVxiL8rSSEOWfdiT6p/Q2WibTRQfVO6vme8SfxyEi6dvKe67rTCAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sPK5W8n5;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233A2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233A2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sPK5W8n5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405014; x=1825941014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0dEIvMR9ye3DZwuK4JLPyFACNz54dPiV0jqTMeLE/iA=;
  b=sPK5W8n5uq/u2jX+2Jl2G1/J0B4+3vJcWKJi+7hvU7gC1dkuJFj5XSOZ
   mX+3+QJcJBxtEeAW65IhdCdMinmohE6VosRs7CUFAF7rGyUNpQEwEx2BV
   Czmp0aW9Os7raQzf1yEVa8byKhFo2vGVWUGGJV0SisfO/YBux33ufPl+b
   sC/ZNlC2DdeBrGnLwlX4BYv1kqRm5foV7Rvkz8brdV4yp5ewrT46T6zIG
   vyf+UkqQqBTxB2A9GTLHRosO+04SKOUL3fdiSdQFHLU09QnWIwfbTg7Dl
   Ru8K7vBrHnjDnIvvzOF2vPVvsez7oIk5CiL2dTpvBb/MVTqOTfV//8YgP
   w==;
X-CSE-ConnectionGUID: Yhqu4oqhTJyJ26ooffOQnQ==
X-CSE-MsgGUID: VXnerylDQnO1ryu6nSbCXw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33618577"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:11 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:10684]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.250:2525] with esmtp (Farcaster)
 id e8d17eab-4e86-47cf-9e09-1019bd84813e; Wed, 11 Nov 2026 13:50:11 +0000 (UTC)
X-Farcaster-Flow-ID: e8d17eab-4e86-47cf-9e09-1019bd84813e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:11 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:10 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 00/19] nitro_enclaves: Fix enclave release, command retries and the CPU pool
Date: Wed, 11 Nov 2026 13:49:49 +0000
Message-ID: <cover.1794300000.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

While working with AI on the nitro_enclaves driver, it stumbled over a few
issues in the code. None of them are out of the ordinary, but they all fix
legit corner cases that are better to have fixed upstream.

While at it, I also realized that the MAINTAINERS file is outdated.
Alexandru Ciobotaru no longer works on Nitro Enclaves. I'm taking over
the maintainer role instead.

Alex

Alexander Graf (19):
  nitro_enclaves: Release the reference on a rejected region page
  nitro_enclaves: Split freeing the slot from freeing the enclave
  nitro_enclaves: Ignore the reply of a failed slot info command
  nitro_enclaves: Retry a command the device asks us to retry
  nitro_enclaves: Stop sending commands to a broken device
  nitro_enclaves: Set up the device state before requesting its
    interrupts
  nitro_enclaves: Wait for file operations before unbinding the PCI
    device
  nitro_enclaves: Let the region tracking arrays fall back to vmalloc
  nitro_enclaves: Do not return enclave threads to a replaced CPU pool
  nitro_enclaves: Do not report a torn down CPU pool as set
  nitro_enclaves: Keep the CPU pool when the new CPU list does not parse
  nitro_enclaves: Put the CPU pool back when the new CPU list is refused
  nitro_enclaves: Initialise the CPU pool mutex statically
  nitro_enclaves: Build the boot-time CPU pool once the CPUs are online
  nitro_enclaves: Set up the CPU pool under the CPU hotplug read lock
  nitro_enclaves: Let 32-bit processes use the ioctl interface
  nitro_enclaves: Index CPU pool cores by sibling mask
  nitro_enclaves: Time the wait for the device to turn off by the clock
  MAINTAINERS: Take over the Nitro Enclaves driver

 MAINTAINERS                               |   2 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 658 +++++++++++++++-------
 drivers/virt/nitro_enclaves/ne_misc_dev.h |  24 +-
 drivers/virt/nitro_enclaves/ne_pci_dev.c  | 236 +++++++-
 drivers/virt/nitro_enclaves/ne_pci_dev.h  |   4 +
 5 files changed, 688 insertions(+), 236 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.1

