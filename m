Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927507;
	b=yVaOxueYJP68nq1htDXiyabhHyzfbNYvjpNo01ekeZDUdqRPe+G9dAKXcUjchQNPKAYS
	 MyoiiT3fPKiyP7HJJk1dLXTEBnwpIQB3NsLVlxUwpy7I/4b4rMaVlmCpUeYJEoFUk3GMr
	 XTUjTlTaryzFAFOy9BblqKvQDg75FWQf+QezsxNgeH2ivlZrRqcZB1+WxHz3CJCKFRLQu
	 dsLTf3HQN5vb6sXbaUEDomDE/FxMpec6aT9D+v0nQJw9I0D8azsyC3/HVfxaon8F/wpKm
	 TCt7RNfxEUUiloT8Blz2tyQopLnlF/fy2WhbYgENhzNici3tghBZZ/zXNqEUO9v7vHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
	b=RKX1nOK1U1BpnH0sacB6sSQLKDS2n0ISDYFVcOBNF/L/cvF3NwhZsFM4kJlFHmuyK2Im
	 3MN1e6YBeoM4+1FuRte0a81sWGhJmK3M7jhqu3mYw3gyjenLFnHf732D7aK06+rIlD0OS
	 emJ2j9bZWq8BSZPPXrNS4ZjXvpS+oHyhdNpvV968MWxz+uzKAZNMxewUHdyUwDviF1J8K
	 MNRHXNVtDQad6eSB67rvFHa3uqUDK4iL6bblcwIsXxz5iVxHdlvf+IS6XGbxm3fjR1Q5G
	 2NGc6eeiDi7CuxZPN8EPFMGQd7su1VuIGp0b7QK4G321R1vvkvr1xFGvCk+k95iHzBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MOtiv3i;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C582606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C582606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MOtiv3i
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so49851b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927506; x=1794532306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
        b=0MOtiv3iWf1QtxQ83Olzu/LfTVDWge2dFioij/uMULXw9z5lD7Ft8X12QL/aYDmGor
         bmLe06Jpn+jMEtvSso8hzII+9S+h8GWNIAOk4bBOU7CWdj4GEKUi/2/uP41v7pp7xJ8Z
         m4jh8bAQZ48LQp4PFLMLXEb38lOCdkTLhEieDuFXHFzfjfgS8/TDPgcTJdg+FMcC067e
         WKwTfJvXMZtbyB/j5Kr2MLZP5rGWJ3NSdMszHSa7o1+yFfqaGAtqL7DaX4TkmoOlGIBf
         EoVhs0lAvp6dcL/j665WjkuKoQ4Kp0ebKR1wvJveGxIar1zAfHf6mgnDf0jPerB4yWV2
         /AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927506; x=1794532306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZL5lqTjC1Jgati4iALvSiAWsRwqBkhnaBmu9SndnLg=;
        b=aoArUevtZox9o1VW086EGKXCaFr6sIgHNtlwygAbJmgD1RkJI23rVR8uqCpfFFrzQd
         8xPN9sK34lW+3jasBUsg2BKOkSWbeN92/Wqc/queLoZ8sIRfS3z8cPaZ1c6Z5vS9ztke
         0TUbJPf3F6FMYKjrWkGcZxQoEafClPeLyd6FfEvGcu+RGRx87s6d7k4Nr7iHRdpCbRDx
         uMMi27Miylx4RHi1HO4cmDe1XJAtOCiFvdc2sPY3mNik5ijsVAZ/Z1KveGGBEk4B9wyU
         qkNqzPw26mzD4Uv1/jjFtHZkTAk00dOXSYtKiSm2oTnw24UgKJ4EJ9GFhbyQOZr3NTv+
         yEEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn3o9OZvnyiskrLcCinvaAAspD0IK23mb8t2VZwgNRCh1PRrCe8tsk1xq3biAoRV3wjJ+LLtaEL9BjkmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93HikLIGobc/Q89SLDksVzA7c8hShaUL6T2nqV1GorTA9N0hah
	X4Iz43AvcUsMJNs1CRXwQCtez4mhs7Jlo1oJg6MXMc7DezJBqx9kipkH
X-Gm-Gg: AYBFou25DmEjh1WyJ3W+UcnndQfSHxi8mHt3lAtZjr/X1Dla/64acl3Wb2BphOD2vsQ
	WYb1+ApjfBNdS1xbJMt93jniuR7nN1b4PObqbOxmDjuSg/lQTk+qz5S5PB43EDwLcwa7vRIBjVa
	rPQqeg0x5GAlwAGFtO5BrT67lVS+ACnzGGO1etf/uENOyvGAsJ4EpxBbVKYRwvXh2evxzY+aX5A
	v+vYFLdzIgDXW+UxiiD64YSZqHbJvHHlOsbP2jkLDgJLckcKP1RC8mzylxIWIhszv0BNppcPjsa
	kPvKHWMj9kU956jvAe/6eAyruN/0g07wRiTN0b0Ib4bcl9Th8EHnH8PpZEp1pSTFqtQRQiW8yO4
	AgNBupC1wQWHUsMrXJ28qrYHVElfFz2pU80wI+GvvYnEBdEZGOUC1vK5fKnemr40/jn1METH7VH
	By4oxrWgxeW4cJswevqWx3p327odbTTwvidsVP3sPNVgm11LwLf26OXL1t5XMU3szAc+ujX/UPc
	+T94jQz3kWel+qXk4JvSI4bHfBVQMxveJ91xTxtZ7YGgOyeZs7RTOrBDCWVQe13moFSoYosHTRh
	S9a6/5qNH0BIpM70p6zd7oSyEMvXkoogU2z0n/W0Ci76dpaBnAaky645jyVmZDHJwgHJj+fAVVl
	lXF6uiGrcjTVH+a6ymunXJQvOVY1EuQVDU6s13IuSTJV4WpEQyt1R2HpPUPGnTSDsro3qi1hq8m
	XIhA==
X-Received: by 2002:a05:6372:a746:b0:3e1:d13f:5fa9 with SMTP id adf61e73a8af0-3ebb2adb8d8mr1125325637.73.1793927505756;
        Thu, 05 Nov 2026 17:11:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a78837sm58427a12.23.2026.11.05.17.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:11:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: ath79-usb: fix the suspend override reset name
Date: Thu,  5 Nov 2026 17:11:42 -0800
Message-ID: <20261106011142.516478-1-rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

The driver gets the suspend override reset as "usb-suspend-override",
but the binding and both device trees that use it call it
"suspend-override". The reset is optional, so the lookup silently comes
back empty and the suspend override has never been used.

This is the same binding update that commit 827cb0323928 ("phy:
ath79-usb: Fix the main reset name to match the DT binding") followed
for the main reset. Follow it for the suspend override as well.

Fixes: cd3bf368aa7a ("phy: Add a driver for the ATH79 USB phy")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 09a77e556ece..8e9565846b2f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -74,7 +74,7 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reset);
 
 	priv->no_suspend_override = devm_reset_control_get_optional(
-		&pdev->dev, "usb-suspend-override");
+		&pdev->dev, "suspend-override");
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
-- 
2.56.0

