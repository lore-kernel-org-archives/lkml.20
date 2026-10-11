Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2553B8407;
	Sun, 11 Oct 2026 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695147; cv=none; b=GQxmYaPfvwgvgJIl2o/+Zbr5/xeYSRq5DnB3Po9dkErNHyK+UyR9fI+30x3DBVbn+w+3qJKlMRfyodgo90XH5XcQNso+Hh5jCMVh/946dzmXbChhKFmfoYgpjzyozpBiTtv9BBAXAOo8rJwyBgH+/7jhtV5yRbwkFUNIqdhzi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695147; c=relaxed/simple;
	bh=x437lW3WwGe5ciknIGbwrqurOmoK6qMMGV4hMFCXaNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwXG1PHBNKicoKkLfc5YKT/x5102G+MMq8HfCj4Joq4mfQilHb1tuK00RpwwWxFkfOTgsOcnN9WVcDGHhvPjACEvuDlKUXYQwYTKSWcQWo49lrRN2OCaQpPOsYuxuJdIH3QKNoXkS8ky4qSzbGXLxwFTLdxQVquopMc4QyQnoUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Bh9zWCMH; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Bh9zWCMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695146; x=1823231146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktvmvNtDwG3lE80fbxQbcm3aVlr1xDemoF+nF9zacc8=;
  b=Bh9zWCMHMR6QJ+B7jzt34JiIY5GsmQD6rlpsVm29EzdEEiPw7+GrvsiX
   dzTFgPyIvjpBlsLSFEJbLN1X3sHzC7B6Qt56TOY0Mh5M95T0izp2LODd7
   2Ncq+ns6rAL1+1M0n7Q2/FYX9v7TkrnMFUkLQIYcv80ZlH53O7ZGeKZnx
   c1oCScsQTz9+aOdflXwLYYaLFK8G2vX4wL9ArrNbAxzm8S/6Le0RQTG06
   WYXaxz7xUS/0Pww7w5utPQal4cMAoeNmJiKFmB23NxDuPZ9i1koQw0klh
   jp/El5NSh5Syz92Co0iGWdVO+WtdCy/0vdn+eA2CROHlxkbphR7cz3s+m
   A==;
X-CSE-ConnectionGUID: 89wSUGLYSEKFPfEXuZqcDw==
X-CSE-MsgGUID: dSMe0hwUTpSYVZ0/ZxdN2A==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30755448"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:42 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:1743]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.116:2525] with esmtp (Farcaster)
 id fb2e62ad-41b0-42bb-96b4-e827459abadc; Sun, 11 Oct 2026 05:05:42 +0000 (UTC)
X-Farcaster-Flow-ID: fb2e62ad-41b0-42bb-96b4-e827459abadc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:42 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:05:40 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 8/9] irqchip/al-fic: add support for FIC v3
Date: Sun, 11 Oct 2026 05:04:47 +0000
Message-ID: <20261011050449.41903-9-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v3 reports version id 2 in the control register version field. It
exposes the same info/error/fatal groups as v2, so add the version to
enum al_fic_version; the existing "version_id > V1" handling masks the
error and fatal groups at init as for v2.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v5: no change.

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
index 1d524b6aba42..13a945a1d312 100644
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

