Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D313C3F7C;
	Thu,  8 Oct 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450113; cv=none; b=iYgDWGSEtvyBWSWUqBs337swzn7Wtr7NXSC51P+I9GT/gzp487TgfFvHzFTdvOc0E9g9zI5bkpXx6Xg4IuIcYuYGXGVr7ns5jPfimfZtleRkFyN+zsHDa/SrstGLnqlSUnWcC/ISSzZdQorHzkTrCkDV6/HtPiHOIZcUQMmCUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450113; c=relaxed/simple;
	bh=QPf/OWJ4mhNjnop2NVXUbZobSa+FCW44hyJKadAFsa8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcLhUi0GzpNwB+YGQsPnmgOVMdDqCHf4tCLIQHtRy8+s2SrGkjjyoTbZLd+cAd9STuZHkP87mQhR/9rjndzxcl3x67oAK8mykv75Nydbzi1o6/RJuq9oApC5ScEVlz29s4M8iongAWNmu2XYfYUtdesQDPjlZEjXBGf3PM9gf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=oo68v+ni; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="oo68v+ni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791450112; x=1822986112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xzPlpGlDRERWyny5VxCzBqQmX1oK6LXYHDa0Az0WZlk=;
  b=oo68v+nijqWSB0YwYFFOq3KakdiDs9e71x5aVLQV7x5Q2gVZvu0afHB6
   gWt+7bDaHRioTcrXxQruji94NYQUktX+dRXQ6MFrnwa0gW38LeL08fEIi
   GnajNYKqGDM8JfKl8MxPG1EDr1Yj+ozXHUfChETW4kc3A+8PvgsIEJiav
   PNTh6Mpl+UMZOYSpwU7zlqPFYTn9M/LezRrXyh4W0UuRqQP9wVCAl8wlG
   E1/sz7Z0JrI5In3WwQsTrvHwh5t6A5IYrHWcsTXUCpk8gtnDF0KqhxGy+
   oVWDBSuSiNQWmz/ryV9M7ymF+CaCiM7kHLiwjWPp2Xa/tJvJZrU8MIKvK
   w==;
X-CSE-ConnectionGUID: jvGMhaPIRA2tirqFG6oMfQ==
X-CSE-MsgGUID: 4QJ7pY8MQvG2S1c62u4qSw==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="30623929"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:01:52 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:31938]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.115:2525] with esmtp (Farcaster)
 id b9d030f2-b8d6-453f-a87d-71adbc40c951; Thu, 8 Oct 2026 09:01:51 +0000 (UTC)
X-Farcaster-Flow-ID: b9d030f2-b8d6-453f-a87d-71adbc40c951
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 8 Oct 2026 09:01:51 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 8 Oct 2026
 09:01:50 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 7/8] irqchip/al-fic: add support for FIC v3
Date: Thu, 8 Oct 2026 09:00:57 +0000
Message-ID: <20261008090058.38591-8-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008090058.38591-1-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v3 reports version id 2 in the control register version field. It
exposes the same info/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v4: reduced to the enum addition. The comment hunk this patch carried
    reworded the gc_flags comment in al_fic_register(), which patch 6 no
    longer adds, so there is nothing left to reword. The commit message
    paragraph about the v2 mask_cache workaround not applying to v3 goes
    with it. The enum addition itself is unchanged, so Reviewed-by: Radu
    Rendec is retained.

v3: no change. Added Reviewed-by: Radu Rendec.

v2: the "erratum fixed from v3 onwards" code comment moved here (where
    AL_FIC_VERSION_V3 is introduced) from the FIC v2 patch, so the claim
    that v3 keeps the register-seeded mask_cache has its code in the same
    commit.

 drivers/irqchip/irq-al-fic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d5671b9624db..141d9d492d43 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -44,6 +44,7 @@ enum al_fic_state {
 enum al_fic_version {
 	AL_FIC_VERSION_V1,
 	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
 };
 
 enum al_fic_id {
-- 
2.47.3

