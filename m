Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049603;
	b=2hHHsFp/aRRbbsJqSipmm3JgfnDzb8cLBvxrIVT4DOwCuWB6hB1rUPxOD2P6Kq7YYhEW
	 2RrFMjd5nKEJTMpB/NKiNaQp+3orozS5gPhwSrXTGthOeepK/RW5B5k2mNtkgBFJYoCzU
	 KZH6+PhJwKTtP0xSX3J0cYv+fgsNBN7kygY70yBOyF6QNJjqpvFrEYYZilo56SbrqZVT5
	 oCOewd2A5/6HTVBZRuKNZXXx0jYGeO3rqTH6cRpgCb1qkNK1elxk7mdCpGd+TIfj/2NRB
	 IVbylVeE41QkgtfcAeJBJdQIo/fNHCu53Ww98ALboXeCdiqqh912dWWEJZSIHW/vdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049603;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1+v5nmLjrqJBR/PKUpOfoPQLnK6X3HxkEctw6U+drJo=;
	b=wLLMWTStVK69kjzpDXLVe0ZPFMacQ4SXuA0yh59bf4qDChoT9Xw092Dx/k9JjwHm7/g/
	 AnLHSfFiUgLD3kirlN3SGXvWjSIUx4NZnqFcSi/nGI8vH7i13mCIBjrte3euiwsEvhPzc
	 xiJo7AelQG+INxnT0GHqandc0SwGmvC4HEJ6YHkW60oVt7D1c15GLqoaZfdLcqACDaFDS
	 GE9lUaHJZ6JorGrDbkrsXxDHTEnl35I+UKFLgURFPw3KNad9aohGfcW/DOtsXkrT1eQJs
	 VvgLTSLwZ7xM8B+Rp0RbeAn0lAJaDhRLs/vPBdaUHGzgIjyhPYHD+RutGA+2I7JF/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wq5T4S30;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856EC606A331;
	Sat,  7 Nov 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wq5T4S30
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B291F008A3;
	Sat,  7 Nov 2026 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049603;
	bh=1+v5nmLjrqJBR/PKUpOfoPQLnK6X3HxkEctw6U+drJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wq5T4S30UpSpwvuQh59bxL1zJAmSuXQEmxl/ArVLuVzGbDYwVCaYxvE0lsEJxdFMO
	 e4DCDQYn9KqtrBQiu6NRgol4R3kpKHtthsmmWNXPeyrm9kua5jdendRxZpjv8r8L5w
	 xEDhqs53nSVi/mD6tPDvMXGftMSoW/4FkbBfoQWTw4hN70IZJ/Fy+ADtkHEXfPMHX8
	 nglMAg48AksO2XWeq0EzjVAQmvC0mBbXFQPvqefBBB43MG/deLdi2brOiThnZZnNdm
	 nUhKmMpEYvXvCtSLlgQvtBAs3YMsjia8eOY5SGQMnQQ0fTP7SfzGUPHN3Cj4CrYGQ6
	 Z2bqdT+2Zgyvw==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 07 Nov 2026 12:06:24 +0100
Subject: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
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
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=1105;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=DDMIc1uwvysu3qnTyaeJadMRtcejbCASy1Da3RnYRNI=;
 b=xxWBeUmpR2bTiZvd10FdNRBOHwBqxXMhhjxi1zRW0jEmsCeaDiVFFWFiTO+9cj3/2yb/e5LbI
 NHekPi79kcuDSgzglKMLESiOhUgIT5c0tdw3V7Z4zPqNH0i3gBQ7HzY
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e700392f0801..9b845b2955be 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
@@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
 
 	i3c_master_unregister(&master->base);
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.56.0

