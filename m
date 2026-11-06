Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977278;
	b=hbgAyRmF4j7C5JLdBJHjzZGhGule40n4AzUiWG7J/HaJvMCOYBpGE6G0POx6oiEg/6gB
	 WbhqKmxpPpAnqNBy1vaIlLHvoNp2c3h+wCJsR2+0ifV/4iBW0Ekbbszakd0X2D3kZ0ZJO
	 7yhS8UpaXf03hcXXiSJXXLZyh8fkTNOUXHH3tc3IEoufdKvdsuqGLUh54qEvCoNSNaeNP
	 wkjkkLfeZvV6XYIDLrWOpz6wjeH7Jz2BXvA9okorUwPJSqvubTUYjBTJV2hBrICoxfX2R
	 H6I0HvVj4fnWxJ3T7ecoydedHY8+3AFe2dAWS51roEcsjKu7ah7VYWDl8Ywe0WsSR+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mhQwmnf8HrttnxR0+Ej97RjKeJ9pmuRj6GhkgP1FRXA=;
	b=V8l1YRe9yYEE4geL98r03nk/5s3ubSkFDQvLNmkXec8l7wy62SS3qJT1t9E/tKACIgEb
	 CUknI71H59GIihWb9wLz0oxg590/NVHI6ubbD6ReE0mcOh5VlEF+AkdPYlAzOhR7fLftJ
	 bdNJkrfja5ziMwMeIJGtPUK6SwUoODYMupg7pbN2Ry39H+rYmOiZV5jFC65SEuUtD/TBo
	 ZqVvR8A7jEDqCF0LHXKTHbzqCQ8Xg0ITKxKS/v+HoWZHwsMj+xb2P5zL91rgZ5qib0cD5
	 u6rMxrNc+qxpbA6PcZYo2tQam3IfEDVAdOC0Qg0Z1FrufTnICdF+dOgaV90chjXk6uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Mo2g717s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA58606A32D;
	Fri,  6 Nov 2026 15:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA58606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Mo2g717s
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 61B5C2008B8;
	Fri, 06 Nov 2026 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhQwmnf8HrttnxR0+Ej97RjKeJ9pmuRj6GhkgP1FRXA=;
	b=Mo2g717sk+G9vX7lpycruMNoEpOwCsz4et8WKS1bbC4KbCyHUny/vwZ0feaGbd35Al5/N/
	AVFEd15qqCcmvN3BPncxkf3TgKkOe7KAZmN9JRN4qgVpLUmc1KbUAQezgij+p2hbfxgcPj
	B9ACLrmwSNdH7t+x+Q/zkT39uMH2zMATfI+1HwQGkFt6Yq2h3rzjC6bUt8QP2M7ToVg4yJ
	dciDWi4eDTYiu4hVWWE79JgM4KE10pylENUCYCT95At+o1RNMx8Vfz/Fo0l4dsGOgAM/Xy
	1CXN850cVE7f+TTnRI6ymcxWgwXpw2qimaNWsbSYTnvBtduMSikwL77MpwLexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhQwmnf8HrttnxR0+Ej97RjKeJ9pmuRj6GhkgP1FRXA=;
	b=A/Lj4EMgQiO9dcsgw6yszkt4cGqxI/rJ7GLX4XsHp1UiA/2ZCqzy/W+0G+X//fWf2WIAfH
	Z3KMMJL09JDiOfsAJBiZuw9Izh5MfF1VKWQzXlRfJexB3frykVewDa6vrIJ3UB6dhrpR/R
	vwyJmiFWgrwZBA6Z/rQ1MnX/RuHoLgcsmZgDI/sMp0kl2AB99qGSWfRNKr7+9NMGNdXeMZ
	z1m1XUYvvOhq0WVJqvh1lkYP6uQ0VYAd86jllfDd8pC88oJZYlGen3dc8IGB8fQhyZQX8M
	FrJtlug1LcUR9Gw0RDBdiJGXcxEomHgfzi57i7+J++fMgVJb98UGWT4B0CKPHA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793977274; a=rsa-sha256;
	cv=none;
	b=V7Bd+g4PDy9GoaWzRPj8noPnZHGXNuA7B7mwtpHMeRDsE2qqDMruvyuI0IXwr3/Uea3DG4
	BIhqhOQB5W9s7BcnJuG9w3d6mg9XKCd/pBR1zly+kQdW9uHzDFvL+DLWspKB7LaoLme7um
	M7NwvTOBFsKIr/eW+tKPbVC90E5nBBhDHrzqLvREoKkut25Qk4AJpiOI7ZJXfmG/r875DC
	fLYouh4Ko1iewZgGqD2F4EYmAx0jOyDRA5yWL+TOpgQxRlurjV1bbhc5M6D/2a0nziU5v4
	7hFO3RnXg5A+NR2D/mr1FfELec32KlfMpteC31CvOd3b9FwJbcyjnw2X4Gw/8Q==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPLRK-002v0X-0w;
	Fri, 06 Nov 2026 16:01:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:01:09 +0100
Subject: [PATCH 1/4] phy: qcom-qusb2: Do not request reset by index
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
Message-Id: <20261106-reset-deindex-phy-v1-1-6a9c9f428be8@pengutronix.de>
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
In-Reply-To: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

There is no need to request a single reset by index.
Use devm_reset_control_get_exclusive() to request the first and only
reset.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2e5fdb620cb2..6476ed0cb815 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1032,7 +1032,7 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(qphy->iface_clk))
 		return PTR_ERR(qphy->iface_clk);
 
-	qphy->phy_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
+	qphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(qphy->phy_reset)) {
 		dev_err(dev, "failed to get phy core reset\n");
 		return PTR_ERR(qphy->phy_reset);

-- 
2.47.3

