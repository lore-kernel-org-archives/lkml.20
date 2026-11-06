Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793977278;
	b=o4xyxjMptb3jca9Nt91uyCs6M0rE9jWxINcsOauMcmZyKPfsRxDU9Ek12pdig9wCuP09
	 6paSBVqcJtJvdE6nEXieEl7jCQN53VIeufcswrL6zWQSs4mCB6sz0MTnxsSF2pFKSZLqD
	 P0vr7RO1U45S8WWXJDbN66B+GjkWSWFajAqxyIcmilmE1oPM5hzi/m/lJr757HkYcydcS
	 cJbMlrwCSJrNrLsP5f3o1WvWDWaGj3Xr5ewdiX4hovxx/YjImEHAvNJPhhEBM9xIoou3W
	 Nxd4T/UIdJn/S8ojzeE102eCgkEwLYGB2dE5nzHzZ0mQRADk/bX2dVRTBHTinZcK2RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=jzk0d1TWFfOxDMgxi/ZA6QS+OfheQFEh9pNyPTGjVLQ=;
	b=BCIVdm+kwU6SIbgBM3NopAh3t06h8JEK5vTe9Hl7ECc6BtHxVqrxgTCQrecpsRQho9VT
	 pniFwuCQwT9o9Jgh3ZeRX2fIXH9OYhAMFb9JHvq/6zz4Vtx4L732jPgT8AJkb/Bz6+5Gf
	 +8hxNVQqyDSSFGsCHXpi6bUfgxMlOoIVhk+hG3DYAb7OjYcXvj7B57177IihuloW5RrSO
	 NodVV7tpA4zkddFhPtj1amb5iwb9t+9eB/4YIoytAuPMcN5VbUoohBifZQQ5Yu4eiXo78
	 4iCowTuEzCNaAoW1RoDP9dTd0HS2jaRx2nx67bXlMLrqm2rInM8EcGGPqsJyA8p3+Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=T0CXUeMz;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F972606A329;
	Fri,  6 Nov 2026 15:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F972606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=T0CXUeMz
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 74493200F2F;
	Fri, 06 Nov 2026 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzk0d1TWFfOxDMgxi/ZA6QS+OfheQFEh9pNyPTGjVLQ=;
	b=T0CXUeMzP2QYeuRjvsjuUJt+pVUrBzNLPhXpvmGHAgD+XQ1RVkRXphuCRNrR3puFn0t4W7
	W8FjeTUk3SAo0sVs5snxH3VDzLylMrsP7Tc3waIThQClVmp33DOR2a8duQvDG9cYxsHyBW
	GjQLrhF/PQGFUYfOgu7GkVlWGJIh8O677qnZGuuxqoFuFmO0f6Zo/7DlEXcyj2OIEGnNAB
	yPPUO5rD+NOb7ge4zfwIsox1B/VapTAzixwnxrw7A1kq1qbAmtLqKgPjk2AT35diwrhI57
	BBXSHODznpKe2guui62UhlYw7FwcOsGWuavwyOy02py3HQ7ONXgV3to6e3RVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzk0d1TWFfOxDMgxi/ZA6QS+OfheQFEh9pNyPTGjVLQ=;
	b=EdMuHwhlFsnDjqYtJlqoTtLOftIabz+LgG1xqWMAZN94d+myYAPwYHEDfStDC8OAR5LrZL
	dsjv+mJYpD0NwH+gzcxdXm7Y42Kb9BV2ouL0rbLSOwqrIz2ZLa18We24m5BC1Xa7UionFu
	Isi4mcpAe5mFXduIR9iF3mULaEkIux0AXT5GcwibIygVbVyuD6KSZWbAQ4Ah4qO2FuQDms
	YPSzyFtk/Ll0e2wv5ALY7/zm/kYpSKUdjgdsM5//sGorXaO29d1AteSeg4lFA9/oLnRNek
	sIFV+Rhof+cooiruOJnBnSgu1N8ogOIImGUZ44O369a8bfdzxxD6r0ftCFxYiw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793977274; a=rsa-sha256;
	cv=none;
	b=QbOMm10yIEPRYyBMO9JPJQvLxjDv/a135p1Gjs0IArhVHDXSaC7x4PfDw6w+/Noy9belfB
	L9BBa7rLXBwU13hOqeuB4zG0JYE6IbOA5DVvELBUE7vsPHkV1wDi2X+xgf6n6cjB6RLr8Z
	ZJPmrY3n7KLMbN3pY6UrTBrSBDVM0TTjgWKQ4XGNEWkyw20v6VcjNalMO4FfhKqdqCvbSV
	/O6dHDxtEsI7AwpYpxfzsxXNqjxYwJLj4jxvch9giPHMZ0JRb6qyY4d8Xiza+pNpUZJAcm
	tR/ovDuJ5LJvGN5DmbQ+mLdgzsm5aqqLDna94oDtHqi5z6H0+IyNVFSURtmQQQ==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPLRK-002v0X-1E;
	Fri, 06 Nov 2026 16:01:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:01:11 +0100
Subject: [PATCH 3/4] phy: qcom-qmp-pcie-msm8996: Do not request reset by
 index
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
Message-Id: <20261106-reset-deindex-phy-v1-3-6a9c9f428be8@pengutronix.de>
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
In-Reply-To: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

There is no need to request a single reset by index.
Use of_reset_control_get_exclusive() to request the first and only
reset.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index ed22b7a256ef..7c8ec7e2e5fd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -662,7 +662,7 @@ static int qmp_pcie_msm8996_create(struct device *dev, struct device_node *np, i
 				     "failed to get lane%d pipe clock\n", id);
 	}
 
-	qphy->lane_rst = of_reset_control_get_exclusive_by_index(np, 0);
+	qphy->lane_rst = of_reset_control_get_exclusive(np, NULL);
 	if (IS_ERR(qphy->lane_rst)) {
 		dev_err(dev, "failed to get lane%d reset\n", id);
 		return PTR_ERR(qphy->lane_rst);

-- 
2.47.3

