Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A125C3F1050
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231187; cv=none; b=KWWuVTPoBpd1+yk7efUceHBVFXSI2Vjt1/8I3StxkuVfFFcrYjskr3cpONvBEqtWTkawG3HoDnaAjuXQx4u5NlRXdMbA2UBBNFa1mAEWeFAbr5t0KZk4YBOCWA+iwE6qRms1Yd160hT/mPIpuaCLsqqqZWaDlC5TktVEvkejmXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231187; c=relaxed/simple;
	bh=K3czw+Pm3u8YBznyo7GM+qnsA1+mmADFH4Hosora57A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RNXiFPbK0bpB4pccRqj4pL7tMHtJrZ5ChLl6weWbHgg0iVfGyEf2kTrncjsYTgqzCcq3W9O/U+0eMflfupDZZ0wLPXGuz9lsIQPcGLhjYBbmisiVq/kn5zSVpakrwCvEcsgFgRJJXwO281pKOtmkg5kVsI7GYVhQgZEEynEfbGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mk03NpFv; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mk03NpFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231186; x=1821767186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=01Q3i/YUkQttGs5Lc3YhupzzN1Z5EhFOHvRPlQxyWWg=;
  b=mk03NpFvImueEk/+TXSY6LZHn89sE665eE/0R6wHYcX0S/11PxcwvVpU
   djtVhj69Xd1K2kxhojvyRQFIk6Uow0pK6E8UTU9R30wqB92wXiUKJVD2U
   VoDl5I9rUw7xsLksLgIx2Iy2OmOsB3IXiqC+iSG8Jf8kztHpspaQrMIqM
   zmhbAU2Rgler9Kna1KCLKoIAfjkmlWvlHHycsa1sf8IPWlCPmz73WJ6ci
   FZp/xC9fTqFgMGNVXvoizd9MpSOwqhCbr+YYvxc23UfYE5/VsSLQuJk2p
   2TaD17wYqzU9vkSrvsM3p/PJlQ1tH75aMDde2FRWFi/2AladZozP5FHFV
   Q==;
X-CSE-ConnectionGUID: h/1DQDB1Qh+iwMe2KnvKHA==
X-CSE-MsgGUID: UsMLiw37TXmTm8niIGkU7A==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29299721"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:26:24 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:6620]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.104:2525] with esmtp (Farcaster)
 id 38de796d-62a3-4e1c-9adb-40b63875aaf7; Thu, 24 Sep 2026 06:26:24 +0000 (UTC)
X-Farcaster-Flow-ID: 38de796d-62a3-4e1c-9adb-40b63875aaf7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:26:23 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:26:22 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Eliav Farber <farbere@amazon.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] irqchip/al-fic: add support for FIC v3
Date: Thu, 24 Sep 2026 06:26:17 +0000
Message-ID: <20260924062618.42365-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062311.37308-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC001.ant.amazon.com (10.13.139.213) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v3 reports version id 2 in the control register version field. It
exposes the same legacy/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Unlike v2, the v3 error and fatal mask registers read back correctly, so
v3 does not need the v2 mask_cache workaround: the workaround is gated on
AL_FIC_VERSION_V2 and v3 keeps the register-seeded mask_cache.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-al-fic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 90a64350be63..d9f5d8d8a4ba 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -39,6 +39,7 @@ enum al_fic_state {
 enum al_fic_version {
 	AL_FIC_VERSION_V1,
 	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
 };
 
 enum al_fic_id {
-- 
2.47.3

