Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794113554;
	b=dkf+eh7ZRPdWUgPrBgAeGHFbe/zO0eCIE/z+lGkOa09wJlTcyEQNAV28P0rJKHf4mIw/
	 W+esVEWQbFerq6qk06XuRNP+SEhNFT9Mi4eib0Zrvb35ehsSqYAdQ3B9egd4DGn4h2xzo
	 ep3RMOQocrLvB0d+s0cdASn6/bPbLKYTme/ygz4zyciiaZlDiYGshJroewBMlqjpvLJlE
	 UlagaEhGNComm36Qk/ya0hcUfcjWKHWOwMzE/8Z/+O4J43GSssoVhf7f0FpnFxELLH6U7
	 fofSeW+v3sECot40589QtilYVzprn4GkygI3+WbpHUuDsAYZ7/ehXWV3k1+sKA7tKUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794113554;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=2dQBG9InMagHP0mqEPXt9dfx1YydVwdimm3JgTpzy48=;
	b=t3InhZfpxC3ThwtNv++KrBTbknxhch8tcmr7AoUjeZTbHDmZ31TynR0fSuqeHAv5P1yk
	 br/7yAsKXd0qrkgaqqKO3x1dywj4QDOe5O6s9heWAU1MgIQ0CF3yLi71D5+wQ5xNEGyHM
	 Jg13QRingHr4Y/jWkj9ALJ4GhJBZFc5rf8kWw4aGNZA97qViIr7rWpUIuzHRb18X23lti
	 bjHTEPISHRSj+BpFFWrbULKOpmxEVBvpRUQfJbhIbDTH4nS2nq/fqch+zxPfUIN9rmg4R
	 08Syuyf8DcXNYQ8TZOJMGg7wvcbnbCqkgGSgj8uqBPGoLurDx6ZHmO/5SvbQqVwGq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=OlfpHa0P;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C5606A31C;
	Sun,  8 Nov 2026 04:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF7C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=OlfpHa0P
Received: by chaosmail.tech (Postfix) id 7015D1CA4AC;
	Sat, 07 Nov 2026 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dQBG9InMagHP0mqEPXt9dfx1YydVwdimm3JgTpzy48=;
	b=OlfpHa0PRSlBZLyoMBe9tnwDxHD8ojrn//tcG4wa/Am8wm+FsQcrKvOndzKecdCVqujcgU
	n5Cw2Q8muDcxkmwjYtG7y4Wgbmojdc6yRzsq0pIyqEPCJJo4Kb7RIzt90F+XGxcgFneG3O
	PBwoFPYZYYdo4IwMTgMmB7E2R5zoWzA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:27 +0100
Subject: [PATCH v11 5/6] spmi: apple: lock around FIFOs
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
Message-Id: <20261107-t603x-spmi-v11-5-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=d3g+GWSt/AwZqBYJkjfa+jLDq3xqOV8n8h3KEqKdYZ8=;
 b=fAnuOCbRphwdfJfXSN1CepEzsKQadhW5fSYoXoX9dgEFUH9IkSn6VG1OtqZzn25cldaa1G0cg
 mfs/wrogzKdCUJ/16Jv4DMIlQT+CNTA27v9AYZK6/zjMRnLhP6aLZwC
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 9843dc871d6c..fabccd25aa0d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -39,6 +40,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 	bool prev_fail;
 };
 
@@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
 		spmi->prev_fail = false;
@@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.56.0

