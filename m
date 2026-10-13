Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9E52E042
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915805; cv=none; b=sYosppz5RBMzzXSHxbti0fGctonBfbRMKRzWvVGBIRrv4o1kUm5Sw1xFnTqd155HJ8BrJo0Ym60mWvkuMfuIp9zkxeDp9iCuAlH28tn966DoPCxAUeQjhYXtolbPt+JblMab+ATGQkXke3W78drHZ8S39c0/BkVp+PT2h64Yizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915805; c=relaxed/simple;
	bh=syyKXC0g93OkbOPXDXPjmhI4dP8vW7EsaZ6PTsbOY4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFuBk0nuQ2qh+QcdQGQlSyF1lTHa6vP4qdzrqNcPVlwsLEBuBirnAcPA+Wd55oqcv5LG3lF/cn+G+hqYA6tD33FxApOM072sNssg+bi09D+bpQhPNAs1GGw9CpajXqjVHg3gaWAz70doIfDPcAMvQjPWjtpg3jq7dAMmecI+DA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ikhphfy8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ikhphfy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD41F000FF;
	Tue, 13 Oct 2026 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915804;
	bh=nmGy787hIfAxSeDWweW95XIep+YWs+rUnLnvajzQdMM=;
	h=From:To:Cc:Subject:Date;
	b=Ikhphfy81093yiZpCnO1tpl4xb+BtbDqoqJEAILFk6h6Nm8d2yGXwIAZ4sS/Xdvq0
	 AeyEdqsO8eycD9DEluIWQgvWLQEB3Xdcq5vNHDcvZ+OPhL+DE4OwkPBmaX7aTG5C1O
	 nD28xuWxqs8OqFGnpxGSRirFl+xF+aeIcoaC78iQ9v4vN2zYTwQnoI549iYIgkFH4w
	 i6ikjJhLoocjQPWbWFLubgXO+NWWrqzp10l+HWUZDF0Ef4O+jphpLczRhEHU1CR97G
	 7IZo3c6qpTLJx5oy+8+5vFDgLw60YnaGn/6bUuKHzlAGj1BSN6MvDPSpF+aUQ7MFVj
	 J0Ykz8IyWOLzw==
From: Imre Kaloz <kaloz@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] w1: add a scheduling point to the slave search
Date: Tue, 13 Oct 2026 20:22:21 +0200
Message-ID: <20261013182221.11963-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sgi_w1 busy-waits through each time slot and has no triplet operation,
so one 64-bit search pass holds the CPU for more than 20 ms. Without
full preemption that delays every task woken meanwhile on a single CPU,
enough to underrun an audio ring while the bus is searched.

Call cond_resched() once per triplet.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/w1/w1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index c16946642789..6f6651e44c42 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -1055,6 +1055,9 @@ void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb
 				dev_dbg(&dev->dev, "Abort w1_search\n");
 				return;
 			}
+
+			/* Busy-waiting masters can hold the CPU for a whole pass */
+			cond_resched();
 		}
 		mutex_unlock(&dev->bus_mutex);
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

