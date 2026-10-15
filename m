Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D567306776;
	Thu, 15 Oct 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052454; cv=none; b=bw5pK2VJPPq5P1RTdvkkvRe3TIIGwyf4FDO5eKrA4RCdA0qTDY49tZRphxlYeJjbiYsk3B4q3DR/vomRSbQWXLpEhTWJaDo5VQU3GA9f2vm0YEUEetWf1IEW22RvPmzEFIpx7572/lp/J9xDTK2gCnixhpBV8QJ5TA/Xqu7zytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052454; c=relaxed/simple;
	bh=IDV7FULNOQqAHWeUJSJnk7sWj/SpUShAJqFjesEJ1+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8zteevLOlgH2hqld+4cBetKgLq2pHblJUfnEdbMAXPlPw/5PP1KLGoQ2HcYNtF35BQuXEo+dU2XrWgCMNfCtClo2kDvzptcHxAWYkgmgPrITFQlPEZu7iUVWCSPZSzT/xRSyQ7h40NmQEm6RxFioKUBLfBeGR9QtjAsZcVc1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2i0JKzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2i0JKzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCA71F000C4;
	Thu, 15 Oct 2026 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052452;
	bh=6bBRqVPfu4/8wamOq3/siJIb6epSz31x2A+7rsSjhdM=;
	h=From:Subject:Date:To:Cc;
	b=W2i0JKzUFkQs2wKKYOSkjZwpFSdsTmZO+jQfuKkWEQwuwmsoeBBCnH4/W2SmGCYiu
	 32jwppO2wKolSD42H4wEuLFhKmg2swLglqP/7pZtWl/G2zNyYNCVDTzV0jrGDJr8UI
	 H04HB3vyP+RLd1Rzo3BVpxn0raZ8KUdf/4FPt7b0RHAQlICAfot6dExUqd2RHXdGua
	 Gg6cFpAsFenHppoX6qnvFRbh3sdGalBPsYyW4usE+oKoUO7d2I1BLiUGtTl7u5ze4I
	 POQfqdUgE0G7UlpT1uUouupCDYhwFkMYDav/VIlMsZhLO2IiYepkLtWPcZQ4K3U6nL
	 B5pUV/mDn9/cw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/2] irqchip/gic-v5: Fix standalone IRSes OF driver probe
 and DT bindings
Date: Thu, 15 Oct 2026 10:20:24 +0200
Message-Id: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBBA0atIrVXSbZjgKmJBqTZl0aQLmUTcX
 WP5Fv8foByEFerkgMC7qMw+wqYJ0K/zI6MM0ZCZ7GuNzXEU2guUoOhnpGVTLKlwffdxVZUbiN0
 S2Mn/eTbta936iWm9R3CeF8khMGJ1AAAA
X-Change-ID: 20261014-gicv5-irs-no-cpus-8c5fba3f9940
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2

The GICv5 architecture allows IRSes to be designed as standalone, ie with
no CPU connection, to support system topologies where the IRS is separated
from CPUs.

Current OF code fails the IRS probe if "cpus" and "arm,iaffids" properties,
that define IRS<->CPU connections, are missing (which goes against the
current schema because they are "required"), which is not correct for
the aforementioned reasons.

DT schema for GICv5 must be updated in that "cpus" and "arm,iaffids"
properties are currently defined as "required" which is not correct
(unless there is a way to keep them "required" and empty) and must
be relaxed.

I do not think it is possible to keep "cpus" and "arm,iaffids" as
"required" and allow them to be empty lists - I would need DT
maintainers feedback on that to see what is best.

I did not mark patches for stable kernels because I would like to get
feedback on the DT binding changes first before sending any change that
is potentially ABI changing back to stable kernels (strictly speaking
I do not think the DT changes can actually break anything - the only
potential issue is DT files that do declare "cpus" and "arm,iaffids" as
empty list against the schema - if they do that they are already broken
and this patchset changes nothing in that respect).

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Lorenzo Pieralisi (2):
      dt-bindings: interrupt-controller: gicv5: Relax IRS properties constraints
      irqchip/gic-v5: Fix standalone IRSes OF probe

 .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
 drivers/irqchip/irq-gic-v5-irs.c                                 | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261014-gicv5-irs-no-cpus-8c5fba3f9940

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>

