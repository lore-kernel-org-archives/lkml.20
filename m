Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972397;
	b=NO9P+5SqkfKnE2YK/MfH/p/zRlXOd947tCfTE5Jzp79ptmD/DVjpGE5vlHay1mMzPTSx
	 hu3Yy5AluUKwgL+ZQTNTqCHO8GsHH/hQfSUomQf9pDCHT7iAuleJwybJFzk0kgTUuLaEU
	 UJks3yiHzjPNztNcV6E+BsKucuX/dttzfrvL69qaiJh08NAW3xSCb5Cz+M11vuaVZsrf8
	 fEu06HrDVuH+Uu+zctz/AF0p4czya0w7DaKQX7q7ulunJjsXKVi0YBWyOrCHNhpe9z15d
	 eVA1SRF8LUGlWTJ0cDsVk3PJyoDi+P9qR2lR2GutX4P24L1lvFKxpISZ8hFIaYu05lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972397;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=R8LTPnB0bmzSzQWOaG3qHm4ach4XDFSjGPHv33JlVx0=;
	b=Vg7j9C39aMAefIL5aKlH5hkoRQA5fIE6B7sj+w8/BVhGzl1x8kPVa3GvW6nNuVNpBRce
	 bnjLQTgMKNZ+0rr+Sc4wKeVcjFfUWvTLCvKi51UoqpFmQe6i+L5TQQCJTn76GPCe+Ykmm
	 ehIxujOZG3iLLZMw+9CJhcqmdx2LNWKcDudOmiuZXVCtm1fCG7wQFPB90/o4vvhF++vnt
	 I++RyzQu+PtUDy1h6/GTtOOB/71mw6X1GOrx7qK3II1uzFj35luEZb2JiHELV4eeGDcOr
	 //GHp4kmNc9QgybCact04gRAYZHDv/n2CCzuV3998zw44XjdceVuTzIIV6Z+FGTt8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCrLCvnS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CEB606A329;
	Fri,  6 Nov 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCrLCvnS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B031F0089F;
	Fri,  6 Nov 2026 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972396;
	bh=R8LTPnB0bmzSzQWOaG3qHm4ach4XDFSjGPHv33JlVx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hCrLCvnSXdPzgDIyr/J+9SkvJDXVrW0fzmad4rOiZ/xpMekL9TiD1snDfiuwDBgU5
	 u8oDt0u4K2HgqT+2kjc/hMzoVib33R67q8JLdpvsaZt2rE5SM6nEVcUALzi+7zKkD+
	 pkvuf7Q7YAWmZDFKuIr11pjQduf2S3/Wt+dDRepqUFNNpqmdyczDY1A9yKzOvNdAeV
	 PKV5J+ZIw+4EaBOUIfonWwIBKkbkiIKXXhgfrkWr2XWtL68Ecr5mXXTC+wlkvEXA7d
	 ejOLw6InJPzOHuwrvqCRFR8HFnbdvKIRKyimw1KUK37gGFtKKvIHMjb51Vgx7llrV+
	 4minbdf1l+Tlg==
From: Joshua Crofts <crofts@kernel.org>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: musb: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri,  6 Nov 2026 13:39:32 +0000
Message-ID: <20261106133933.1577-3-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106133933.1577-1-crofts@kernel.org>
References: <20261106133933.1577-1-crofts@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/usb/musb/musb_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 73ac25f53698..28e59b53fd02 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2576,7 +2576,6 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	usb_phy_shutdown(musb->xceiv);
 
 err_usb_phy_init:
-	pm_runtime_dont_use_autosuspend(musb->controller);
 	pm_runtime_put_sync(musb->controller);
 	pm_runtime_disable(musb->controller);
 
@@ -2644,7 +2643,6 @@ static void musb_remove(struct platform_device *pdev)
 	spin_unlock_irqrestore(&musb->lock, flags);
 	musb_platform_exit(musb);
 
-	pm_runtime_dont_use_autosuspend(musb->controller);
 	pm_runtime_put_sync(musb->controller);
 	pm_runtime_disable(musb->controller);
 	musb_phy_callback = NULL;
-- 
2.47.3

