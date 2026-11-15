Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751900;
	b=NxMRdr4CownkzHC8/jlCOMC96RpJ+O/MWa/1zo2Tj1c/T0KuU7QNeSJ+faTB7P4ozerV
	 eDAQ59OH2dcgw2SMTgD2y2L+kqADBO1OZvO9q0eeY3ds96lKI0lj/AKBD5DTu0RIRGtvl
	 d2zBylF3qLFE9g2+Cbafo7lx6gBA6AzASga0rmYKUDA3+EmzqrjBlrTIz9zeGEEl/IRKf
	 L81b6fHxVfCBxTZdgfgwfqmLOjp60Cp4BeeinetBtBDAdK2qsaf3zfBAj6leXNRRoQQf9
	 NxyZ/YpBoV62IFYZ3MNyhj5WV1kd6a0k4fHkKAmwpKebKr7Dac6zOdrJjMTYhAF1kdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751900;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=a8ettMTIMLv2Wh6ztg/2TP5SGbNIvkE4ulbl7gtN2Rk=;
	b=TrPHM0+9kSGJwToZMFuReOB2J3Vam4ZGjQBKg72ejNCAo7Cnjpq+Idl3eTTAKSRXEhKw
	 LLBwnPU4MXC4dAo0WyqF6C4VYfBBEnskzsv3O+mn8nQwf7HLsROmHnq2/S48xVPHGaa2t
	 4W2LA9YhEUfX12tfT6XlKK6WA8JVVD/Kk3eT6esVygbAjeDo9OIgIi3VR240I+bwtz8Tk
	 e74zgYPsxsZ3KYo/A7GSZd0qpraZDGmaNa4/W8Fx2LulqNTPctiB7OsqtGHMYfGJnsGbz
	 ApVXQIPCtVDrVhLL3BihACVJxcgTXLVJ2GKN6ZEXw40TjzKQoMtOyxlLVEy789F+7dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZCmnVXC;
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED28606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED28606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZCmnVXC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aPxa4y3+ppxmpAAuJ70W++p4hkmg2eJERKnjs9y4jWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751897; v=1; x=1795356697;
 b=NZCmnVXC7qxU1dw6OfZEl8mzxNY+bk1+Pzf9KIvRNb3qrU81NHXNTBwgl+SPUbXmO/H3k/JB
 AoR65PIvRjWMjH/YS84ZSTG7n7dYby+f4TN/sQDYpi+rHoXaoDBwInXpcj67GkEk8HrOP3vlqMN
 HV6X8opinCETepsMaLPSc0UI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b04229f9dcdc18d;
	Sun, 15 Nov 2026 14:11:37 +0000
X-Mizu-Trace-ID: 4b04229f9dcdc18d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/2] irqchip/imx-mu-msi: Fix MSI dispatch and probe error
 handling
Date: Sun, 15 Nov 2026 22:11:24 +0800
Message-Id: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3czcCt3cUt3c4kxdi2QTUyPjNEuDJMNkJaCGgqLUtMwKsGHRsbW
 1AKHbSYNcAAAA
X-Change-ID: 20261115-imx-mu-msi-8c4523f90b1c
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

Two small patches to fix bugs in the i.MX MU MSI controller driver.

Patch 1: Fix MSI dispatch through the parent domain.
Patch 2: Fix PM domain teardown on probe errors.

More information could be found in commit message of each patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      irqchip/imx-mu-msi: Fix MSI dispatch through the parent domain
      irqchip/imx-mu-msi: Fix PM domain teardown on probe errors

 drivers/irqchip/irq-imx-mu-msi.c | 70 ++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 28 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-imx-mu-msi-8c4523f90b1c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

