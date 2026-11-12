Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453202;
	b=VL8goODzdKN719J3kGmznPNKKaOXFjC10yTwcmKKK/quHSlwJsOLe1RblN0/OWLtGQO4
	 TcUhlJB3E9XFAVuHvmnakoXu1HkUvhPcotfjwtVXMmYiVFk6UiUYnx3ZlGGYn60F5zg0D
	 p86Ncd0OMj0tFMbrMargS4cmToicowQmqPq2iWfRk55pop/G8/V1ntJeHCwaD22Zkf43o
	 DcfHwreOJtFKLLaWY/mWCcqUH/ehu5vDflsk+pL5ulROWvxGLJpXpMqSlAoiTW0ZXlK0U
	 364S0xwMTkjRPMFcIKpYJ2cHglfFrpenThlFB9ApQ3VHjTDHNO3Rf4u3ZBlZkM0xwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=JUogQn/BAmhleQtwWRRnNTBjM0tCYwYemH8LUz+qbt4=;
	b=ZEUbWioqf7JZ8KW1/kWoy3jYpNvLLmdrbrD7n5oi0hZitdrJaodGv5AXxfrlM6X621ZK
	 FaTmkYdlM7xjQg9BbvgVNywnOi+8ofZxVtnKYQZ1EV8Se3OHBb8QKPPc00+i0MkpW+Z1t
	 eNs1AlB3OvCB0jLz3VWsgvwP7ZamdSBmA/KS5zZ/Fy6V1wiI3hgO380uqPtxldaim4oXY
	 UvRfr949ga2Uka151KHmcAduqMwHSspUX0b0nSvJPQpKP1yqjx0k2wClbiyuX+ETGeF1a
	 7MaolZ4y/IDiSe14m7M3Amoj1HbgvQej27zpfaoe/klK3s9iRy29OZpJ/xf96Ijba2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IucemCCT;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B51606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IucemCCT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453202; x=1825989202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JUogQn/BAmhleQtwWRRnNTBjM0tCYwYemH8LUz+qbt4=;
  b=IucemCCTv+p/orkhyuDEp/FH7IlqOSvfv8C2rkHdO6C0vA1ENjkob1ua
   PoFZLEUj4OmbW8Wz665IZzVcfadikCBW6vUGH9+8YSvcbElgqD3fNMQh+
   f49hYn964xKq4yWumkKqL0anmYgXXPhWl7Lkc6GsCP0xOUEG9xCey3iyR
   KEo56JJzfwgPwzF/l6Sf77dCP31BK8wcx36Itc86FYVVAbBUUR1mOmZgZ
   HNHWtw4xDfZ1jfm6lBq9Fd7H/n90A2u5CrKKLNmZPndRmjxccHrsaQsMh
   WuXuCPZc40IVH5+FmeYLwkEU+6ndv1CsEWFiWadsmfz//b8FJ6NoLNxbS
   g==;
X-CSE-ConnectionGUID: AI13IQ2ZQ7WsDp5G9DpvPA==
X-CSE-MsgGUID: 9U2ELaH+R+qU4aQhMNpkOA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33777135"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:13:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:23536]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id a3bdc8c7-cdae-4c42-82cf-ecc576a2ae8e; Thu, 12 Nov 2026 03:13:19 +0000 (UTC)
X-Farcaster-Flow-ID: a3bdc8c7-cdae-4c42-82cf-ecc576a2ae8e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:13:19 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:13:18 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 19/19] MAINTAINERS: Take over the Nitro Enclaves driver
Date: Thu, 12 Nov 2026 03:07:15 +0000
Message-ID: <d4f58e7ee5ff15e5a01181860d07057f77f3b109.1794393487.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Alexandru Ciobotaru has moved on from Nitro Enclaves, so the driver needs
a new maintainer. I take it over.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..20e4a56a197ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19834,7 +19834,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
 F:	arch/nios2/
 
 NITRO ENCLAVES (NE)
-M:	Alexandru Ciobotaru <alcioa@amazon.com>
+M:	Alexander Graf <graf@amazon.com>
 R:	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-- 
2.47.1

