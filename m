Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819154;
	b=N+SHpq6+07xmLSqU+DmAUhc24UMjmpGTU9nBew461VXwL0ajiOT7fE9/krLQ9pab4/UE
	 lisFGAnEqQw1HajN8Iuniikn2rgnAFSZtcF589auSoyFCgU2f7Uuo9upJgaDbDdSIrZSj
	 SkKB0cBnAWSFDHjpbELXeY25052tFtaZraINtt2WBpew7D3K3FuYOavEPS/1+qzhIBd4D
	 /YlMF3kS5BVfNyf2EGRsxVlar7ak+E2k/N1EXZ0Rvgx49Du8mpXouvzQ1TnrK1Vsj4qgc
	 53rHq9/ZWSy1NtL2PQVfilhOSGOrLOr3XM+oahNASdcX4atY/AAnfCc8HJ35Fnli66w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
	b=4o0oK9ZkS0G//YSb1+cH1q9aLnACD5rsU8gu06yDS3P0xqtBerWPWTR+w0ahAUpQeNqX
	 PsPvGVplyIzYGHLIuzpyt4eXDOzvybgdu5/UiWFmrZhyBZi7NOTab7AD57t+gBWPn5tuN
	 WPOEiPjQOlcgN7rQoNQqKJ+grJqQW9L0jGIv7K9GJzSRRfqD9aAahviXQsoPJXv7aRI8m
	 Q5830ZlN82iIewiaB4KBChI4+wCBLs3/Fub36ca6gsX+Wp/9MdwXkYcLEOcdNFalrCPqg
	 iavHk31/YcbcIYBMUqgOZk/6GkhhyQ7vis02BQcVFBTpBPCgSLbGseBg8hknHYRM0FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xvPSQxzd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF024606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF024606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xvPSQxzd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so9975335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792819152; x=1793423952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
        b=xvPSQxzd5ymsOXziOKyIaZczaTaacysS7ToUNQA/NVwpAY9aHEBCXP2Nk8zwzDxfDi
         1EDTET4K/+UTawG78DMSzs20t9jWL9R8jWXrqoknKKxVgEj87rH7cqT15O4F5Omlz9Zu
         p2J5R5GGtfWseH8ISJBB4CWCBzsrayJMiKAH7l9yEHRrPViXuJu7YKwPyBk/uLOn/X8r
         HwYnjEtIz8Uhr9yyz6E3kHAyOxB+DxgKyRqQ4xCFcd00YPTdW7hIq5gPyEhGPBmCy+0Y
         L2PtR6LMi7BwX8WkiJ6/rtD96C7lacrEebvpfzUc1ekFVyd3cROL/DfUmLIvh+WxTVO+
         5XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819152; x=1793423952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
        b=u5RQ4WLFUSofOP6HWyYsXoWJYJ4f2Z9ybBaCskdPUzXWNmKDeOBGnxC6RV9D83VAfG
         oR3C3BPKkb81eRaWbVtdFn3fYus6UASYmMQEViK2Nn8GtaHpQeTYaIn3MceXwlY6se/O
         qO2KR4OdqSvUY1k6NtWxff2YhFVu6pEIrZ6y0cFbms+sGzKyBjISzzziOvdwEIIJXaCD
         j6Fq03/s3CQe5iACfzzuUlnLYkhyOmBCQJXOcku6P5gTuNtYuJ8wYiceCRsp3A7tBE9g
         eFzqLkznzX/oiIOxZldqI3T9iDosfX0PGwTDvs1Blp6YvkPm/DpwKTIF1R9Pbd3xgkCI
         ZkCw==
X-Forwarded-Encrypted: i=1; AKwUvByUvLhl4HaUWdB6nPlUOhs0bwMwRc+/XK+3K1nDeZn+BkwKEckhBBDOV6Day9c/2FF9U3J2uMiS5CrKcSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIWoW0Aihoin9det/PmKMLPSSMIv1QSa98h9Sjkb38sZnC1QBC
	geUUYf1ZyQopPPJaTycaxLZOLfjpa/yd4bahRttxAPiwxLlrbefaN8HBscQ5n0ER8bEPQBYXLU7
	jhL/vxP0=
X-Gm-Gg: AYBFou24YlVLPtpvMHOmWpD9AV8l+gRvmtrdVUorFTGOtIjZNCgZvaL4GCbxRVD7NeU
	riED328SPMgJu5waEVBUNSuLpTL51ocHUcDgb0zxQ+YnB+eNAC4kB52WONh4BP29b2+xzzVwyHS
	a4WsBsDqHEvqM43gj9LpNAL4Hrj5at511gQJFtRMNwrA5voLOdQK2PWSB4L/tdAGoA2uGDqHo5U
	5uxuwOiaRln85R6pCNuAXFTAXYnVUle5J4HFOsfDKXLs2JKwwSB8Cbw2GfOEe6EIanl0UWGU1dF
	Fij6dqLY7bofvlc1MTKjvI2+RGK7MFP6/2Npw011PCJs46E8rXA6w6UUtTS5IQEKOp2O2zi6xaC
	pV3hw9Itjgyj8FmHlnFUUv2EWsK3Gk2HfNIh5vj70H8qMt0xfz329bPf3cl8pkcEXJhTYkEJahQ
	dQSK4oryNdeULoaRWuO/00l3PKFJV5FIM59wMAzHQBdhJrwkPSLc/yWV+iHnscWY9LYAwBkAs2S
	oKGmW1F26mekc0K4y/d+KrMto+3m7bdzUDbBVYo6Sd4bg8czFUXKQiKJpnp5aw6POyJlkzsN/4A
	iy/Re7DeWSPb9Y0y1RvvqD3e5AFXlDCHPA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a35aca186amr13037915e9.18.1792819152402;
        Fri, 23 Oct 2026 22:19:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm35997685e9.1.2026.10.23.22.19.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:19:12 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-phy@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] phy: ingenic: Don't disable the supply in exit
Date: Sat, 24 Oct 2026 07:17:56 +0200
Message-ID: <20261024051756.79342-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The supply is enabled in power_on() and disabled in power_off(); exit()
disabling it again unbalances it. dwc2 powers its PHY off before exiting
it, which warns at every probe on an Ingenic X1600:

  WARNING: ... _regulator_disable
  ...
  ingenic_usb_phy_exit
  phy_exit
  dwc2_lowlevel_hw_disable
  dwc2_driver_probe

Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Tested on v7.3 on a HiBy R1 (X1600), whose PHY supply is a dummy
regulator: without this the warning above came at every probe, with it
there is none and USB still enumerates at high speed. Build-tested with
W=1 on phy next.

 drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c b/drivers/phy/ingenic/phy-ingenic-usb.c
index 7e62d46850fd..d8e5ef302b74 100644
--- a/drivers/phy/ingenic/phy-ingenic-usb.c
+++ b/drivers/phy/ingenic/phy-ingenic-usb.c
@@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
 	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
-	regulator_disable(priv->vcc_supply);
 
 	return 0;
 }

base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
-- 
2.39.5

