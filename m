Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793977278;
	b=h5UFBrkiZRDEhpx9+p+oWnKoQMMoYKUvxfP478w1D2N2hlM6H6xW2dM2KnCpl+kCSoT4
	 4NiLRijdu4a4g2iUszeZIuL663D1eO2FlXCpmM0fyO9mhQDNqMC2HJc0s+VeP7d8QgVRA
	 Y6PBGyr7jYhmY1naOE6i4bfmMS8JuFJL2RK5Iv5b42CwnjBLzvd/glPqO4aqcigHNrriQ
	 AAHLLfdibNjoRfOCq5enclbJl1lGJUzk51LOwjc4CnqdgRtekBZAlxf0ql2mePj3UtJFz
	 ShSbgF4JPdzY+GFbwySQ0+1gj8d3l0bjEiz2tzyqtRVgideNMtSUxbuPycqjdv0hv/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZWuGgqxAtKH+EtPZvSAXFitmEXgOStbgXJxX9R5SGY4=;
	b=Nb10h04s5TxOPOnPcATseDHwdBfCbbRu+RZj9DXw6HZS4JH9yJemvdh4FFkKI1bzVw3D
	 +Altv4G4cho/oSYEGLx9HbYF+0fDBM+wq9LaAI2eRvO9JmUMrEVoBHLv0si81lsRhLHgC
	 RQutMzYj0P3TZSbuTI/RJqJvpHNEuLEMMGvvzncpUP8viHs6ZsMs6DnzF0LAGZrnuWIEf
	 FbGcKk6K+VbmjtGykAV1xflFn4soVlBhvnZzVjKZwmXIYNU0XngCDPqBy0LMQ+xVCALf5
	 PIxWaRt+iOBH78s0g2jlatTDX9VOiGT0YNvbZWSnyJYoYE8oQzM23EI55+3TadVc9hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Fmoh+HBL;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F993606A32C;
	Fri,  6 Nov 2026 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F993606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Fmoh+HBL
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7EB4D201771;
	Fri, 06 Nov 2026 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWuGgqxAtKH+EtPZvSAXFitmEXgOStbgXJxX9R5SGY4=;
	b=Fmoh+HBLLhwMur6fdXEBliRwQdfzfL0nw5rGfRc1mViCIY+QIXse8xzGGDmItYN8+YlflU
	E9ICPRI+xFM5nQ6XHDp0Ux8R37A51RfP29a4tt8XizNDN/ch2LXikVZ5qR0QVH3yzzUtsz
	oG10dM+9L3N5OYv9i5uIoHo+8H+JQkFo03j1mRaD81xsWn4Rpvnfid/WnK8/fa7ofrscKd
	Zl6LYWV3bVCMDMo8907jDMesGcxa3BTG3MmiLJKfk+wK3cc8+yGUKsfnr3/Yy+OiYjSS8F
	uXxBDxRLCcEY1e5XUZj8vGbEAIQGClxrtdnPR6qsBdM0nxUHZRx7f867NY3PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWuGgqxAtKH+EtPZvSAXFitmEXgOStbgXJxX9R5SGY4=;
	b=Y2R3+WoT8ml3DtFu5KeTptw4kgb6loxWi1S/4PNN9C5fc2qvEWY0sWQSlmt1eN7y1i8iFn
	YcAn7Scpwdpe3wURMztbjqfrmmd48I2F7X3yAlO0nw8PPbr0mGzdTwafta1+uVFv/5766b
	MOBFRuyFenuWkUAW7RXdsyYx24tIx9Gz/fRCcIMieqAwR6CdY0mKGTRDrAU4qhUMhkqV8X
	mG4shi05BE35UUxb8mE/Ea/ZiNvlaBxJlH03jhVnUjeTnk0OXypBig+sFTe29KonlzWWMZ
	cS3uNLVKTVyySjFvHwKd2Y3l7QwGUsTq9FSDjV/JGn41zDDLf2nMHXybIS25Xw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793977274; a=rsa-sha256;
	cv=none;
	b=en+3GzgC+p3FC6IQrHOBk/yXXiBopdNSw9Ddc3lONaXGl3ryGJF74LYIaDmGWwZkjSuv/t
	g0TjNE0giyV0EhYLlN/yb2qfUBjgmX5q4Wz2wLUyIQQ+mEn+Cd52CwdPX5qaf2yGwPUtPI
	UY9+gOjUZ4cnTv11B7AOUJoLW492EMGtlPV64ZvwFL8SsUN1LQq3eJGne61Kcpv5HVkrdE
	jBdzhbHPtLN1xbn1n55tk/6d+f8Wa78Q8Tol1a13HB372wTRND10bPVx+6+ZQvs9TqL6Rv
	ES7kgXr41cWcbMUG6cSWFNPXoDz5VeQFqSPPIiPIobCsyXiSifteG6CPumUX9A==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPLRK-002v0X-1O;
	Fri, 06 Nov 2026 16:01:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:01:12 +0100
Subject: [PATCH 4/4] phy: qualcomm: qcom-m31: Do not request reset by index
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
Message-Id: <20261106-reset-deindex-phy-v1-4-6a9c9f428be8@pengutronix.de>
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
 drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 168ea980fda0..b38c3f40b85f 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -284,7 +284,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(qphy->base))
 		return PTR_ERR(qphy->base);
 
-	qphy->reset = devm_reset_control_get_exclusive_by_index(dev, 0);
+	qphy->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(qphy->reset))
 		return PTR_ERR(qphy->reset);
 

-- 
2.47.3

