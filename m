Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026349;
	b=IttfmdeltNe6rMlSjom2fZpm13wAOHTZr2coCE4zn6Jn7mIDtfbwNTZAVCwacUHhKSnC
	 /YS5CTSlBclPWqJ1139o0kg+lurBLLLjq2pJAAMM/SFoKlTWK9B3EaUraju2VDRMBEWdO
	 CCQJjgIpGWBc9Yb7WcZ5jlMNRtQsXgIMOjIrZ6zdARgB9k34Iwhieo7nNVSScXyrj8mVJ
	 TJ16pTUc/i61Foryw0Qz/rqVwLjDQ/75kAqvn6YS+FAqZpn2OudEr6x9KpRqsRtI1ekav
	 jA1yicgO5/pnerGz7LnzE/rt7lnUI+SCBkaPT987dwJ9rOcnzi/3zSEaVf6DdDP1zVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026349;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cv0VxHhTny8J4XmKYzPRXUOqIwTJEJt0iAEV/wdLzc4=;
	b=xGvCFm7KFw1iBfoq6DVSTKPHy+VSINdJhjf7oEKxSx6uPzkquHR4qyk/DjcGMuuYv3ZZ
	 tthh63ZJhN+T0J4AaMSXUQbZYtmZK/c4za7zdGxncDyn/hI+M/j/Hu+A2aRxJ6cbnQc61
	 WM/Btt0Ig8ZPULTps7XrS6abuHlPyjpLhXG3hCbd2444TBx3jCdKJHAd1rVTrXQAEYj7n
	 AzPyhxEoZ+nktUeI+hmcTwgPFBbht4a2gxLHC9LpVJCzGql+qkXXwQvtdVHRRFzmC1XJr
	 IOyWoeGkVMsuREJTnCTw6GU82PqdIhGEj3G4wG7c9s8DyN2lXjIjFaYwYOWR/CD8k8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SRt8H1wh;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE38606A31A;
	Mon, 26 Oct 2026 14:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SRt8H1wh
Received: from pb-laptop.local (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C804268;
	Mon, 26 Oct 2026 15:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793026215;
	bh=F24vLkZdqnL8HGQ2BfFFS5zq5oFxzvZFLVwv5e21VQo=;
	h=From:To:Cc:Subject:Date:From;
	b=SRt8H1whImcMY64Qd1dOYjeFOd5Z4i98jsxxRqFNThID34HhLP8kHAIXdvf8q2s9/
	 z5USdgtHIkK93LGgJAn7ia8MrzVSWQa0xtviURfgHUHjjpajiHDMHz/fe8Gap/LCA9
	 VrITed1TT6nkx2cpUAFrcEqAjm2kwHblPMMxXcpI=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [RFC PATCH v1] media: rppx1: hist: Adjust configured LAST_MEAS_LINE
Date: Mon, 26 Oct 2026 15:52:23 +0100
Message-ID: <20261026145223.729289-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `LAST_MEAS_LINE` parameter determines at the end of which line the
interrupt is generated. The documentation states that it is usually
configured to the last line of the measurement window.

Currently it is programmed such that there is a margin of 2 lines after
the last measured line. This is more than what is required by the
documentation. So change it to the documentation suggested value.

Note, that this is in contrast to the "exm" module, where the last line
needs a margin of two lines on account of the division that is carried
out when calculating the average.

Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---

While this has worked in my testing, I'm sending this as an RFC because I'm
not sure if this is maybe a copy-paste issue from the "exm" module or if
someone has noticed scenarios where reality contradicts the documentation.

---
 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index 8fe8cbbc85df7..af82f31e4c86c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -128,7 +128,7 @@ static int rppx1_hist_fill_params(struct rpp_module *mod,
 	 * Set last measurement line for ready interrupt. Ignore the value
 	 * from the parameters as it is only useful for fast-channel switching.
 	 */
-	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size - 1);
 
 	/* Set measurement window weights. */
 	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
-- 
2.56.0

