Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E93CBE66;
	Sun, 27 Sep 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496456; cv=none; b=hVP4G3gAxUrwEK2og3W+DcEEtkK0FX+W5+sO0JCS+rM8Pmsqe6+s8RdlsT7fs04rjX3ZolcQsnoE9ZT4vgMg0SO7cHn/onpw9Ir9zPknTo/ghUWPfDwiZOY1Wti14TB1VdfFarNTNZiwMykJdKUQPCnEx8xaIZUnSMaUIVNKy04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496456; c=relaxed/simple;
	bh=dKgqLuDaHmlsiZj3QfsGcxf4YOF1QJrl2+jtVpvwzFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMMbLKAlQKOWZmcR79/m0qaZhxWNpnE781wpYNnz9SpDuRVAopkn7jX7jSbPvNmapT7Q4dOp6xlq+g9GJjObr+7N0iLc8eO+0wI8rNfnpPgorP7OAWrTgV1b1qrt5lxhNGB3FuOnYDEFmPZnd9nXfeyMIFWdU1ddTMZaXm0j2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jwaryZ76; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jwaryZ76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496455; x=1822032455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0tQEUgNpE8FLe+0RMYz2Qrtd0PO3l0DJSMBZ2xN4Dfs=;
  b=jwaryZ76ZwnTpe8DVYmDou15lw7NffBgXYx57c56brq+/ABTK7pDgzOT
   f6l7DPto7gB2Zd3y+pF7gkQx+KEtxqlrjC2VAiopfD+Em3y3jxVuUJZTu
   Oiz45ayqqZU1OkmY7i+ywhFk0R6CBfuzrFvb34wnHMhNlyxperZoEPft/
   hFGLCVQ15xQ+SCvy3MXVlTKSWoSe4NJArfmbjrvKYkcrr0mBG0ULOSTRN
   QJybRR1cMVdI7tKervsVV3KFw3cCiQJzTw/wvjp29PkpW0vy0J5URQ8Q8
   VqiZdiYJRGFED/uixriPCO7FPA1KdTEfhdSqHsfEJXWLFHWoMxF2xLXT7
   w==;
X-CSE-ConnectionGUID: ydQNovLeQPy98QPb9Ln+Eg==
X-CSE-MsgGUID: V0TmAaeWQR2knLQDUB5J5A==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29538984"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:07:34 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:26749]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.1:2525] with esmtp (Farcaster)
 id 00b09512-27b2-46f6-b3fa-71851fce6108; Sun, 27 Sep 2026 08:07:34 +0000 (UTC)
X-Farcaster-Flow-ID: 00b09512-27b2-46f6-b3fa-71851fce6108
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:07:34 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:07:32 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/8] irqchip/al-fic: add support for FIC v3
Date: Sun, 27 Sep 2026 08:06:36 +0000
Message-ID: <20260927080637.27285-8-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927080637.27285-1-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v3 reports version id 2 in the control register version field. It
exposes the same info/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Unlike v2, the v3 error and fatal mask registers read back correctly, so
v3 does not need the v2 mask_cache workaround: the workaround is gated on
AL_FIC_VERSION_V2 and v3 keeps the register-seeded mask_cache.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: the "erratum fixed from v3 onwards" code comment moved here (where
    AL_FIC_VERSION_V3 is introduced) from the FIC v2 patch, so the claim
    that v3 keeps the register-seeded mask_cache has its code in the same
    commit.

 drivers/irqchip/irq-al-fic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 35e366b4da30..322e41ffa2fa 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -44,6 +44,7 @@ enum al_fic_state {
 enum al_fic_version {
 	AL_FIC_VERSION_V1,
 	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
 };
 
 enum al_fic_id {
@@ -177,8 +178,8 @@ static int al_fic_register(struct device_node *node,
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

