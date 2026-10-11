Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472733C5DC5;
	Sun, 11 Oct 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695102; cv=none; b=FBx+izpWqTkPqU3dihbL882MHyjq24eU2CdY9xUug0WVuTF8J+NdqOhMm0IkHq8mg7AlK573ld8wsWSPXkbRd9IJU/zUpBSYzM9kGesxsw+sxX48ZZOb6uLCOQHuOy2Op5El/r9Ho51++3ijiGz7lEXfJq3KGNgSzsB1b7/Mqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695102; c=relaxed/simple;
	bh=+a0n4w+LofBMe/pyvGPZyomvxpA6ma3lvgLt+Cbarqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z01qTn4+TLVlMwMka7EjTq801WZBBUnrEIvcaCF8G2Gh03w9IzN3I5CzmrF2O4e+l6IdsEe0CpegrQMLWUN2zMJmEhFI3l/hLvtDlXrMYS34kJFCyKUWKKAnKJDrrtIzfy0PKYAAYZd5dRkFobC+gwGpaxsmT3/mcYwzIulnlPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=s3SNbf2R; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="s3SNbf2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695101; x=1823231101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=78qnAnGyDvvPOnTyWwcMa+LgWBdYnwsR79KL8RR9tg4=;
  b=s3SNbf2RCB4s3xbzqWhSjQJdgPaJFvGeFnOdxOCh9znYN7hbeYbdZx7Y
   6dl8G2qsJDyr8k/AStLQFchggZysLpm4egVPiFcCa2k22x1565BFLc6HH
   oKoK4iEZ87ukS0eS9d3g86+6Mf8gdvYcGsXMn0VixSLnw8BOqdPrnYNoT
   R6W/X7McgVfyBEHkZxNaLTd9BccKLj/yrSK6ZWghf9bfmrCeNjPmfc0D2
   jIFuAD9KtwABGU14dsj+1NZxRyAGAHoWzLw7OeT860r1emBvNKk5TKg9F
   qEE5VJ8frwe9BCOAORLEAt2UZLxh/0tLoWRfJiMZvSOYZhW8D3xbPjvIG
   A==;
X-CSE-ConnectionGUID: 4QlRnhFvRYqps11t3y8VoA==
X-CSE-MsgGUID: 9LIMQPQYQcCxJNR+ZetiKA==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30980309"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:04:58 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:25515]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.68:2525] with esmtp (Farcaster)
 id bf542f8a-394d-43fe-b6e0-7b108803ad19; Sun, 11 Oct 2026 05:04:58 +0000 (UTC)
X-Farcaster-Flow-ID: bf542f8a-394d-43fe-b6e0-7b108803ad19
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:04:58 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:04:56 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/9] irqchip/al-fic: use %pe to print init error
Date: Sun, 11 Oct 2026 05:04:41 +0000
Message-ID: <20261011050449.41903-3-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

al_fic_init_dt() logs PTR_ERR(fic) with %lu when al_fic_wire_init()
fails. PTR_ERR() returns a signed long, so printing it with an
unsigned format specifier turns a negative error code into a large
positive value, making it harder to read.

Pass fic to %pe directly instead of unwrapping it with PTR_ERR()
first. %pe accepts the ERR_PTR-encoded pointer itself and prints a
symbolic error name (e.g. -EINVAL) when one is known, falling back
to the plain decimal value otherwise.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v5: new patch.

 drivers/irqchip/irq-al-fic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 35581332b40e..41f7a8390328 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -258,9 +258,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
-		       PTR_ERR(fic));
+		pr_err("%s: fail to initialize irqchip (%pe)\n",
+		       node->name, fic);
 		ret = PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
-- 
2.47.3

