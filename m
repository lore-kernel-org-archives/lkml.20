Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6F384CCB;
	Tue,  8 Sep 2026 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849220; cv=none; b=FqYnejFKMAjJIF6aGD7XqKwfaR6PZRlHFoayAAZ/K9/MEPpRbu8KpIyRjVAUq3K0xvSJ9ArIgNNkipAGYPnAzQDSR3+6KtxgtGal5kUf/2+3M5UwYX+Sb0bQAaQ7d+enB5lCxV0sPLlBMnQ/wZK+kxcRN1grxjp+MWVoiHSo7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849220; c=relaxed/simple;
	bh=eeZHAc6JvYv71v6f9F61tJrGXk9OvWAasb1iINuuATg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxezSQnOAkR1wOh+Kyyno0q8ytEFfRuRZ0PDiEtyz0q82gi845SP53brIOEkG1vjvSPnfUIDQOJ+x6qCAuE+2lLN4nz/pWVIalQkYVoayDiiL/TqnxPC9GstxnlgQPhPijQtIWwOZrEcket0Vli7VeyDTzyU7JHz+ge5iDYf+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D1iDm4R/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D1iDm4R/"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77A9CC31;
	Tue,  8 Sep 2026 08:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849121;
	bh=eeZHAc6JvYv71v6f9F61tJrGXk9OvWAasb1iINuuATg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D1iDm4R/z3mQn90WLS9Csz5wWaRdzWxbgljBqCXeLfLOflBIlH02bvzkJeeHXLmUq
	 lmsgniy3CwjrqifUOV+HNEhokQ3YcgAncYegTGYatm1nlK1YZC7F6kIGvHcM/0zdCa
	 vo0lORFZBZfGfamYP32mzKDwa95d6g1dsYW4a3aA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:05 +0300
Subject: [PATCH v7 01/11] media: rcar-vin: Fix comment related to stride
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-1-c406a2c2930f@ideasonboard.com>
References: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
In-Reply-To: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eeZHAc6JvYv71v6f9F61tJrGXk9OvWAasb1iINuuATg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w69l0E5AR4XBP9QXXWjtUnMmYCnnyJxk0ob
 tbYbHGV0HiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sOgAKCRD6PaqMvJYe
 9eNsD/9bY+yVDv/3JTEl5NEEkZ8VUimJL14yAcmdMsAjwRy74I28atQD/ZMKF2Kr60g9q+ljGDV
 lKWkzR5vv2zCcGeavR5cGLBikavR8UrxbCycoxJzKly4KzZ7SDGTvFd1dHSMmBH+GZQa27cFWcf
 kIesVWsgy2Lwiw66v1UU8USCwniG3j6kK089J4vcOwCc1vUdR07yZSlWRdk9UH+7OGsbEkm4Z9a
 wAX3JSk/dE4CS0qg2jbxETnEu7V5qzPHRXQXsJuqwuNAVc6IyVsJ1O1uXqhcSp+I7RxlnNcBMgE
 WGTIZMJtBQGNTTLda9IsJYq9lSGCFjUZwzsJQJ4CWjn4y07PJR1FlHivDu3Z2ZMb+eCMOPy1pJY
 GH6JyIAIcF5ZsgTSeb1DpNvBXr4eSwcljFxaZzPizu3ZnRn2VKcKMrnIXv3aYNFIy02G9AZ92aN
 6EKbVfnVyc/24iH8gwl3FgWPVAS0slc01Cb37PVWNPNxj2sVenT6vzNKUwSiAHP2ZymfxqnaJV8
 N+P/aKQxc5/csjpS5F1CsKssVoS7fZM7ps+o2RjvYZJHwlDbVPs4WJXsPJsjzW9azT6LOXaLEV2
 f/XPbNAzqpPZFq4QNPjrQvaZ9hbfZ+tg9HVgc/t/AGykn+0B8y4ifpTdLb1MZYcD7lnh7kQZdEV
 qF6fX7V7Pw2307A==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The comment says the stride has to be aligned to 16 bytes, but it should
be 16 pixels, as VNIS_REG register is in pixels.

Fixes: 40c6da8a9c0f ("media: renesas: vin: Fix RAW8 (again)")
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 73cda0e2d45a..5e515d16c164 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -678,7 +678,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 
 	/*
 	 * VNIS_REG has four lowest bits always 0, i.e. the stride has to be
-	 * aligned to 16 bytes. This is done in rvin_format_bytesperline().
+	 * aligned to 16 pixels. This is done in rvin_format_bytesperline().
 	 */
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);

-- 
2.43.0

