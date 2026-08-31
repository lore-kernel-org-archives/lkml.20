Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540D3F58C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171179; cv=none; b=qHO5pOSxbzSNSihnKbedj+ZSvwAonvOS+J9fFSd1dlkAuNzM+Pi1PJ5PbDJaZNnvw4kogZUaKkkobkFRJv4q+4CLTOh1Epd//nu9MgFpRmFrx4kplLdVpvYkrM+n0CxhL8ljUtvZfW0Mxuhtlna6wWXJsW2eGW4oz0iwerCGxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171179; c=relaxed/simple;
	bh=8Ab5ghyQyT+IVeb5nykY+K7bhBbCpROTICzoj/2hZts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQvOvvrfU+9OEAtKYEzirm+MfELZITrxPEeX/vyo5LBSei2c+3VzYrhxfcgvqjvxZmFO8GayU84O2QARprW+o8JsE4SL6oRZ4IrTw8r9MvJ+LEeKAdtbqxPrIaMSQJ+htjBeMmWDUqA2NaJ+fj8sXRC1VhNEH/pitdnQL1JR7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Q8Bwpwip; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dnx5qWu2; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Q8Bwpwip";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dnx5qWu2"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id ADBB7EC0105;
	Mon, 31 Aug 2026 06:12:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 31 Aug 2026 06:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1788171176; x=1788257576; bh=JrW4EK68O3
	qkeAI/9IHeMspjkPi78CybFRpeJsdxiVM=; b=Q8BwpwipSn/KB+tQ6Ra33RSDPD
	0Gt32iRwDX3JTLdkQ4XsxpNOWC+4xcdM7Y0Np2eCR7506Yx+z17MFZ2VmugoFOle
	V22FQqyVkgl5Z6v5mNLtHIy+cQnECTgUEaDjvwUo3Nn3iakdQEQXDOYE/Rj/ju/2
	Jjk6tQVSDf/YyegXTjdV6EwYtIj+4f2taN296ntMAx1oWaJ+Wd6xF1O9++wdYJcG
	Ny3jkFmMj9uX606JbzIoAyWCi8VgzeSoY36jGzyDmGmKWLsjDMaPae7xrc0mZ8qK
	RGOsTurkc4T3UmD3ZsdNmsRLEgBjl57qcspjGEnEcKCtr3Ws2OUthYVIj81g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788171176; x=1788257576; bh=JrW4EK68O3qkeAI/9IHeMspjkPi78CybFRp
	eJsdxiVM=; b=dnx5qWu2TUnP+oP4o5l/HSZhvaamWfJ7s74TZxZZkLWQTOkIl8r
	6vvLeiumUeMkc6DyG1EPbQ3baoUX/3HAVJLxh2kmgJ/mA50Egy1LwdFv5/ybVhuS
	nMQiBKuz/mimXsnwtzlE7FDlBHfDJYX5YrXga+j0zMn++A8vl6b5Z8vEvH9sOkJ7
	G5BP6/5ZkvGnjXYQSruhJx9zNiQW8Yhv9zHZ/j3BvEYqY6ZBEDXB10kWW/KGwcAp
	LzrA4EHAXNE0bMCi7gnem0Zon/+eYQTSo2haVzw2cIfZH+AOm8ESydHMr05ImWLo
	DlHdFdKM8JDxU8QGXy6Vg+HpRzvJKqm+ywA==
X-ME-Sender: <xms:qFOVavkVyQ-eXYUFsGM3JJIAHn3X0ERJ_gQbmnrN0odt9rc9-hAT_w>
    <xme:qFOVagxawrk8YxMLcaYaIXqkdliIKCJJHYZscFD7DEsIYPKG1eo357d7F7GAWhSJs
    JMS9DXlLuwUQOBebGl1ajL1iZAKrKKi6IB-THkmFBKCCK41NSkjGFWR>
X-ME-Received: <xmr:qFOVatOcfQkHV9v0YQFS7hwNhCjV0zvW21Emw5pdW0017xWw4lzd2my34uqoVrKoA12oVHr2Rvru6eU0y1CzIHlsG1Q_c3lalkA84NQehu2H>
X-ME-Proxy-Cause: dmFkZTE/9QgyKXI3W+gHHwVYG8+Qyx9p+sGIaj1vgSaZeVUMIKY7UmiTkXiOn4HCS6zIVM
    KJZG+pGhKvmLqoWshibsj0qGts5ytlU8gebYOOszUSJv3n1NiSb7cpLILQP46J5WPDKvx7
    4GT06bv6qrQFfgDM+pXNYSJZC4yg7WxrWAZXDnM+otyQRw4EFZLmu+P0KNRVUqCtBUf5hu
    jXiLedLkyK9J6x+pk+U25EDEXyb3hjFw6jZgVC9LUzhH/5+uENOcs/z/CATbERpDc4bVmu
    7NEN5OA5prAtn0XhbKCZ1eq3rV7WuIeIeNT0IMk0jwLJdZsoqaO8vD93f6GSs+sQKahDhw
    hrEJtUiRbFhyoeGXB35a0SXHR/L7NbZmM2CdzZ52swMw9bZ8EHkDOH4xjXQS+LtBlOA3oH
    4//GAqwJYaiAYRYVub0XywwQa3HBwrCrVF6Q5hFoaaaXgxR3TjGhIM9SvxwwfV4h9s0Kon
    OVPKj5GK/BR4QZcauG7i9nBMDZXOb9WqZvzWE+dNvKr9MPnmC5rxZQg3Sfh3wbTw7wwdt/
    gmpgPK0jAJnOZtlWrIMVi/aHJ4nKFF/zIxav6OT5zOBNT0JKe+ciwgwV2je37AfzC9bUPx
    lcxSuJAC+4PsskUf/iaftH5k4loz42BI6kBgLfeSihT9QscLSxgdTYOIB3Cw
X-ME-Proxy: <xmx:qFOVakRDfQ8XH_gewobmvClr7Xny4BwAyexMzSA2QqDORi9yc0ZWVw>
    <xmx:qFOVarZuCfnD2GYu0klVrgDfNf2TZ9lVbQC34cYZGfAwExzUxsmSFQ>
    <xmx:qFOVah2fFRh2oD9oj-Sz0qBGIytY4xwXlb667quk5wAH-ixo8GTQhQ>
    <xmx:qFOVarXVYrfM2efnOJWmuSX4lE0PDVK4GMBYMnH10teT7FLjKXTtjg>
    <xmx:qFOVah5riLWuwiR561Ii3DGqNuuAGtDzjQ7Yx2MfC_ubS0W-8cmBm9uq>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 06:12:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: fix wrong git hash in code comment
Date: Mon, 31 Aug 2026 19:12:53 +0900
Message-ID: <20260831101253.1810143-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When refactoring device quirk code, the wrong git hash from my local
repository slipped into the common header.

Fixes: 5a43dc9f4ee0 ("firewire: core: detect device quirk when reading configuration ROM")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/linux/firewire.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index fd35a6570cd8..b41af502bd89 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -172,7 +172,7 @@ struct fw_attribute_group {
 };
 
 enum fw_device_quirk {
-	// See afa1282a35d3 ("firewire: core: check for 1394a compliant IRM, fix inaccessibility of Sony camcorder").
+	// See 10389536742c ("firewire: core: check for 1394a compliant IRM, fix inaccessibility of Sony camcorder").
 	FW_DEVICE_QUIRK_IRM_IS_1394_1995_ONLY = BIT(0),
 
 	// See a509e43ff338 ("firewire: core: fix unstable I/O with Canon camcorder").
-- 
2.53.0

