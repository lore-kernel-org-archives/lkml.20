Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5092C026C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410742; cv=pass; b=XnQpYMZC2r/mAL8OyMeEVov/BfnCVtmqfzPYbxW6aRp0TI1RDCm7LppxLhIJJywXE+KV3GBjaG1QZhbeIJ3gZFCc5tmGmiJtQdi0F04elxiz4XzhYHqoe5pD7VEL8hhDNA6kbkA8DpAPwr4tcmMXekiaX7VX/Clz+NGiLYwCtMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410742; c=relaxed/simple;
	bh=ivvlwYiwqsgw81opjHi8KclWqJnCdJinGW9odcbzfWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oNFzGQk8gBJblrWRSHScLr9+0WLyD0l2kNt+7C6ouRDbbqjY5rtHcxpmZOxZxKTol2s3wLeerz+FxzVIkmumYkQgI1hE7E9fcEimVDdTwSk/BUZqmfEIYkl/DdXmGtaG8CpLZeZdZ3McNgTSYAl/A0ZInWt4zr3aPuy5NmFcQN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=V5b8pW4j; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=VUrXJ8Qc; arc=pass smtp.client-ip=185.56.87.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="V5b8pW4j";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="VUrXJ8Qc"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791410740;
	 b=sZ0yV5Cx6oeZJFcqQ9hwyLvmpOXhAu1YpGM4AKzsLFeQ8V1dNviEHDNrnDdiG2eWxaJOInOk8S
	  tDkexnXxJuAcoJUU7a1GByqNrhZTgUDlpjFJn4EEas6o4eO9DwpW6boGmN5EHQif4Yji6eP3mB
	  Uzc7oV+/aMFeB/EeS9aE6y3nbO0PikurXIYpZumWLiTG4AWvCewtruMq5pqM/kHcKZSdF1OnXS
	  H+L2Ngu7RCyiAPnGOHfX5TeywdasN3cDIoNoyNT8AeEnnZzUsqMcp6TG0q1LLe6m6GJHzyYZe3
	  VdDhuK+8Sh6o9hDGUtcI4XwUpzTJ9JhPFWmnTPDrH79/6g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791410740;
	bh=ivvlwYiwqsgw81opjHi8KclWqJnCdJinGW9odcbzfWA=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=AtJR51xdpIYaUH3bAJsPrnKbBDTx2YOL+qCJ1TYEkBAb4yJQuHSDY6O/bOzLB2frik8zefNI2a
	  dJ9yKW3TKg7jhAdWj6paE6BdTIXf+2qktwd486/Q1qCFNX0TOr2IjgIjywLk0UR9PZ39XJu76q
	  SWwqVSg1dfN2hbEN4xHJmT/FkHSCXyQ+KSEHqRhp233JPz/EuQCqwO7tM40PKQjmiDsL+RR0DE
	  YQzfcQtMBcs1U64ubYoPm43pnoyBPW6IxzDKVMhsNnADUSlFhufCilBlXfIpfWKwttD0VlNIbH
	  moPmTonwr+2IR7kh1UYj62Z8DfAEqFJEvaKTYHj2L8acEw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=niAbfulvDzFUUmEPDa0SfhyEtOhhh3DXu9LRtOKqylI=; b=V5b8pW4j1FJG30uD5k8QaKZdKQ
	8pJNJT4iHNR0LQeu/JaWpW/BNjNL+6CS6tEI9Ax3XTBtUzWk5m5dOmB9+SvUUySYVx3TenxZwxHqq
	jog62HFrAh+t4qYchS4YibvdXgu4FlJA3LEEiqdLYFUFpVQavZFW6YaNTDKpXMpEqdlU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEZlZ-0000000BqiH-0mQN
	for linux-kernel@vger.kernel.org;
	Wed, 07 Oct 2026 22:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=niAbfulvDzFUUmEPDa0SfhyEtOhhh3DXu9LRtOKqylI=; b=VUrXJ8QcYHmaMTXenFVcSPsuaV
	barGD2EupIp6iZ4RBW7WnsP9Wkeu4pRFRRCmQ6lCJEkt0akqdJ0Wk0rAqI2ktLt7af/0XukcZNy7+
	SAreIgYkDB9oe6QegDH4PVT61NI3pzA2DBWsD9B2T7jCPefHmcDDsAzHtgs2eomxtW1U=;
Received: from [79.14.200.104] (port=62117 helo=[192.168.1.3])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEZlV-000000006zt-1pYZ;
	Wed, 07 Oct 2026 22:05:33 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 08 Oct 2026 00:05:21 +0200
Subject: [PATCH] dma: swiotlb: use KiB in restricted pool allocation log
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-swiotlb-size-print-v1-1-374493b5c5a6@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB2IA1r0KtKFiWM7pUTJxB8U7
 25sl9/ivQOUg7BCkx0QeBGV0ScUeQbu3fkXo/TJQIaqwpgH6ipj/FpU2RmnID5iXfdkaShL6wh
 SOAUeZPtN2+ffOtsPu3if4DwvVNYnuXYAAAA=
X-Change-ID: 20261007-swiotlb-size-print-99d2b2f55bc2
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=francesco@valla.it;
 h=from:subject:message-id; bh=ivvlwYiwqsgw81opjHi8KclWqJnCdJinGW9odcbzfWA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnHDqmvTo4o6mvaojHxfYHcFSftZOEgoRPSM5jURPn3f
 Vvgo+LVUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAEykYSojQ2P9arb++t5zKa+W
 6pXmPXhtaa+Y1qTRwCUYO0tq+te1DYwMj6c5WTkwPyid/eOg8e035VpMx6+sfCrWbKWXIxKl4Vj
 NCQA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f79d7764288f702b35423be15e1ae7f0
X-AntiAbuse: ID - f79d7764288f702b35423be15e1ae7f0
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xEZlZ-0000000BqiH-0mQN-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Update the allocation logs for restricted memory pools to use KiBs
instead of MiBs, to avoid truncation when the size of the memory area is
not a multiple of a MiB.

Without this modification, pools smaller than 1MiB are logged as 0MiB.

The same modification has already been performed for coherent memory
pools [1].

Link: https://lore.kernel.org/all/20260629223759.2637162-1-sharaienko@google.com/ [1]
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 kernel/dma/swiotlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index aa2f1c4588b9..3bfab8142f5b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -2083,8 +2083,8 @@ static int __init rmem_swiotlb_setup(unsigned long node,
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
 
-	pr_info("Reserved memory: created restricted DMA pool at %pa, size %ld MiB\n",
-		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	pr_info("Reserved memory: created restricted DMA pool at %pa, size %llu KiB\n",
+		&rmem->base, (unsigned long long)(rmem->size / SZ_1K));
 	return 0;
 }
 

---
base-commit: 7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
change-id: 20261007-swiotlb-size-print-99d2b2f55bc2

Best regards,
--  
Francesco Valla <francesco@valla.it>

