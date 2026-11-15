Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751906;
	b=3vuGErrfEiXajQ/YH0+jy+cf3u2DNkhmScmv30Ag0r/lip+Vxmh4YtPXH9gpIuQ2dkLb
	 P25if2FIcBDM/iArJ7siEwv/GniIrGb9A5ZpgLptSRnB6We87ueSAnXnns7l0yB7JaW5P
	 MkPRODSBGfyAu+VXdJtSdq7oEPlY/MGynApG8ZdnnOj+nVXULq/8onn+00+zLrFndJXZv
	 QtBcZkgazmVPzHaKpNudLt1MacTFvpcF0G6behIhCcyfZv9Jnwvx/Vejl4ySjenE29dZF
	 wnkQHQluCeXTFOaxT2v1tROgSHFzkCdY0XWw6KSQK9mICgYgRLzTGi+CfoI0j4xLmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751906;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=fX4x/DwPozKPTud5FkAAKQrO1M5Mc9gEHPAUZrZ+dhU=;
	b=L2ShiRzu0IYWIOigYap68ZquZnITOGY0OFcQ3yDb2vHmv9MIefU880K26xD9BmdNfI07
	 8Ax/idwYnEQqWl0wcVTRjvJsMRZ+b16JgMMVedjBPm6qua2jAhC8C82ERgZf5ik/yaezJ
	 cZUURoOVLbbdK1QsNMg1GHEh0GWX9JG6Wij7gwMAVWwyc4DhZmVRbcWrraGAqERF2Y59E
	 dbVWlbS66oZ9i9PGUPtm0x2Mh72T81J4VobN6QW/FofmioucqqAODBnqHoJDdYsjkFC67
	 xLUsYWMQdjkkIIfAT0WIPe7Zx+dIpbwMgkFbEWx5sdFxPl8KElsJeOB0WnVTlADvSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HMFtC04U;
	arc=none smtp.remote-ip=95.215.58.95
Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB592606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB592606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HMFtC04U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dYZVjHUUnYJbCP3BEmxFNbYbsLJb5S56W4DO//XaLI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751903; v=1; x=1795356703;
 b=HMFtC04Uf+2QnwCff9CM65z7x9EnmQ/4oIK+o6iTNwJK4zdPaDuvygZ2NIP3ED2jFy8M28p5
 BpxKBDDT87szR2FwqdETrrPmtk7mUs++bEt1HCjSuzPCOwB3kb7rAlwYNk6c6xG9gIiEtbpFSfp
 v0A/J8LEdGQEUf2lzH8m1eLM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 616e2252748b30ee;
	Sun, 15 Nov 2026 14:11:43 +0000
X-Mizu-Trace-ID: 616e2252748b30ee
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sun, 15 Nov 2026 22:11:25 +0800
Subject: [PATCH 1/2] irqchip/imx-mu-msi: Fix MSI dispatch through the
 parent domain
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
In-Reply-To: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Since commit 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
the driver creates the MSI parent (nexus) domain in
imx_mu_msi_domains_init(), but never stores it in msi_data->msi_domain.
The chained interrupt handler therefore calls generic_handle_domain_irq()
with a NULL domain, which resolves the hardware interrupt against
irq_default_domain instead of the MU domain. Depending on the platform
this dispatches an unrelated interrupt or drops the MSI completely.

Save the nexus domain so that the handler resolves MU channel numbers
through the domain whose reverse map was populated when the MSI was
allocated.

Fixes: 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-mu-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 6d7baeeb2bc8..c42ea0797624 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -238,6 +238,7 @@ static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *d
 		return -ENOMEM;
 	}
 	parent->dev = parent->pm_dev = dev;
+	msi_data->msi_domain = parent;
 	return 0;
 }
 

-- 
2.56.0

