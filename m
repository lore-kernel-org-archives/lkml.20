Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813D47ECD7;
	Mon,  5 Oct 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199556; cv=none; b=J/3AfprxXBc8JwQojSXCiju5lYZTYQtDif4ZQgzraS6EK3O4lqHxbvvlbFuyGIrCZMwpB8F/tqNDB3bsAQ8dL886cba+dICYcI8trmLMYgQAUFLIkogF2E5LSWz4bv/xGUkLA6ZXwQmjuaFEk7kUPFEk3wjbLsdjZ34GSDhSZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199556; c=relaxed/simple;
	bh=axh579dCA+drYGGp2kHql9LVatY/RVmsqXpryRhzAn8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBDaXF/k2PrIgINgl6gEvCD70QyntZHj9aLyC4n/Uwy8pufCFy4L3SSIbLTl4GyY0405934ZNI+KeEer6aYJfeR5Gyp4Ztn5C642f9p7ctuv8/SKlw1zEcjZB6o8gsfye57ATkHhC1gfwl91B5c5eq8RdLHUP3ZC8o0NR+BDkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=VaySD9z7; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="VaySD9z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199554; x=1822735554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/1fsSJgNw8ThQrA5JEU0jJ1SlXaH8UwRSyAskcMHXeY=;
  b=VaySD9z773pIDul27GpEVnLQRpQroSOQmDYr3iJRboXJGD+YWgusGbCd
   fRGXDPWTAnvVV9BkIiUf1ez51gIRHxubA8tasWmAj6tkIjGua29A1izdz
   MZ6SCqlT3ZRins5kHWuyA2r/4NGYWrVYcZXt7LHDSbBXUDLkmGTNOImVw
   l16Uzf025JY1sRhoY5PV9oPoAHSrDKUGA9rxPxy5l0bvXzp8vixMQv0xc
   xHVK6PRoCYn/L5I1z/5heD33iv8mcS03ySqxU/LytQVJtbfo7UjzQcpwZ
   5jkvMWCiAVPU5Tp5EdKSwE+U/tW7thslj81pqPxSb/EB047/Y2BrkVofp
   Q==;
X-CSE-ConnectionGUID: w8w8DfkuRW2mNMNONoVPLg==
X-CSE-MsgGUID: 4nYs/MDvQnKCwwnuL3vJSA==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30463105"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:51 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:13911]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.96:2525] with esmtp (Farcaster)
 id 303f93d0-1b04-4d16-9fa3-c368f3993d4a; Mon, 5 Oct 2026 11:25:50 +0000 (UTC)
X-Farcaster-Flow-ID: 303f93d0-1b04-4d16-9fa3-c368f3993d4a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:50 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:48 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/8] irqchip/al-fic: add support for FIC v3
Date: Mon, 5 Oct 2026 11:24:57 +0000
Message-ID: <20261005112458.22291-8-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005112458.22291-1-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v3 reports version id 2 in the control register version field. It
exposes the same info/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Unlike v2, the v3 error and fatal mask registers read back correctly, so
v3 does not need the v2 mask_cache workaround: the workaround is gated on
AL_FIC_VERSION_V2 and v3 keeps the register-seeded mask_cache.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v3: no change. Added Reviewed-by: Radu Rendec.

v2: the "erratum fixed from v3 onwards" code comment moved here (where
    AL_FIC_VERSION_V3 is introduced) from the FIC v2 patch, so the claim
    that v3 keeps the register-seeded mask_cache has its code in the same
    commit.

 drivers/irqchip/irq-al-fic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 68948d5464d4..84cb14615d56 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -44,6 +44,7 @@ enum al_fic_state {
 enum al_fic_version {
 	AL_FIC_VERSION_V1,
 	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
 };
 
 enum al_fic_id {
@@ -174,8 +175,8 @@ static int al_fic_register(struct device_node *node,
 	 * register. Suppress the seeding there and set mask_cache below to
 	 * match what al_fic_wire_init() programmed.
 	 *
-	 * The info mask register is not affected, so the info output keeps the
-	 * register-seeded mask_cache.
+	 * The info mask register is not affected, and the erratum is fixed
+	 * from v3 onwards, so those paths keep the register-seeded mask_cache.
 	 */
 	if (version == AL_FIC_VERSION_V2 &&
 	    (fic_id == AL_FIC_ID_ERROR || fic_id == AL_FIC_ID_FATAL))
-- 
2.47.3

