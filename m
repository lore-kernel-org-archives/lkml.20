Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380038552C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268279; cv=none; b=FcbATak8VWyBmm1f5tZtcWHW5CwYF+tmEPaWyXYCSo0bFiulxNbzHpmxCz26MxSKlrBFjMpPIaAiGc850SM6Y/kpcGZWC0zEnAInZOIQs0SUM2JiDEWSJqvqwSBVhDLh7g1eC9AQqWtVwCb+LVQxAHG7R/7aEpW3QgdZJcd01lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268279; c=relaxed/simple;
	bh=Ns7zFaDtf/DasGG2gm2CtgaYSRNqoJ4PIDqGCIPEQpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0v7zgYHyYq731TxBh6MHrFXRkRVBeZ9Q4op6GPbtpVkOFfzr0Xf/0YVNk8f5S1VeDxgkcyqWOqURKXGxK5vBaHEUQAmBPeDm9ns3K5UkT7qnmBnQOwW9JuaOu+uI4ysAzrtdujf/jQRb9t4wqhcB0cmkAKvGqBKzfzqt7Zh5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSvKaR3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSvKaR3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC0B1F000E9;
	Tue,  1 Sep 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268277;
	bh=F2ThhmNqFT6d/2eLiPpP/gK+PRLYH4r04puKywqLfY0=;
	h=From:To:Cc:Subject:Date;
	b=oSvKaR3xoB9LvPIV35iJwT9IhRKeKzauTXOfOloiOBgfmX+kHT/bOFdcrEiPgnE8S
	 4+M9AlG1IOrhmseabRqG59clmk3FcTabaHyVTz3P+TUadWBl0IK9dlX5okAmYSbowo
	 C9fta4mHrYXudGpGuwmzimw/HsFtxK4OiuIlV7Gbz5eKMz56M9OgAaw7VeTRxc4ayR
	 y+lWMQGcXbCh7ajSaDC1t3kmXgXEzfIufc5mCy5HCS5cP1m0O4Ih60ILJbtekqVbpJ
	 22GWR+rVX0GK9IkI+ko44S/lU1sURkPigZuAhEVyEtC8MUqCwE8//KP63eXb4drRg+
	 Fky1FynFTl6og==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Nat Gurumoorthy <natg@google.com>,
	Carol L Soto <csoto@nvidia.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: [PATCH] firmware: arm_ffa: Tear down driver during shutdown
Date: Tue,  1 Sep 2026 14:11:12 +0100
Message-ID: <20260901131112.3437516-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform core invokes a driver's shutdown callback, rather than its
remove callback, while preparing devices for a normal kexec. Without a
shutdown callback, the FF-A driver leaves notifications, partition devices,
and the RX/TX mapping active before the replacement kernel is booted.

Use ffa_remove() for shutdown so the existing cleanup runs before a normal
kexec and other orderly system shutdowns.

Reported-by: Nat Gurumoorthy <natg@google.com>
Closes: https://lore.kernel.org/all/20260729162731.1383875-1-natg@google.com/
Reported-by: Carol L Soto <csoto@nvidia.com>
Closes: https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com
Reported-by: Maxi Saparov <masaparov@coreweave.com>
Closes: https://lore.kernel.org/all/20260826222337.73480-1-maxi.saparov@gmail.com
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0121bd0a7e01..7f42ffe79f22 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2271,6 +2271,7 @@ static void ffa_remove(struct platform_device *pdev)
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_remove,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},
-- 
2.43.0

