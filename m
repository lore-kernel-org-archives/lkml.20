Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338872C3757
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788701503; cv=none; b=pjcIZuGmUG+3JvBAosI76N27x6NErM8fVgDj9rkuZU9DzJK5kIdzy2cGYXDT+iHjHWWy+MdnCxqMuWz8Z+mmDj/+Xdrf9drqMuQrmi7FlkKbDGsoPScFAWHoINmkVxfDjwxjy8k1oL17c/jKLwIhvVe/x659Tx0z28oN96z/950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788701503; c=relaxed/simple;
	bh=XV9/Gau1ScfFSIySp4WW7NMKBztrqxSBrSAXGTOY170=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gKS+nyFB9H6k52ijq73mnkxtNK0OrQXTn3sZn6ly6aHPUyBiC4dV3DfLEl7wNeMekNX7ToWgkvVOgm6GJumGCNQZo0jEgEo//jAjvulw+wzXJXhswD/ad1OzsJU0Jy+4owMrlH2TXb7+JHNgapoGgswG43kauGsWsU2oaic8BBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3PtJWkX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3PtJWkX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso26250535ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788701501; x=1789306301; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9tYnhpE7QdeEZNd+tgaIJOLzvVhdJ+mADYDf3k6L6f8=;
        b=R3PtJWkXF0qqaFViDXgXamNPdK+mIP8L9zO3g5y5wXGIM/OxF27syKtLpnXRbrKl9Z
         fFeFb0GCzOFRr0TyBPSk/DovwlKtuXQGkDdp3TTaJ4m7HpVaPCiGqjBJHXTfNovED4dQ
         +1kVo3UOvCYaE56IGMQEr1aeatlQPN6Tosg2ONVEFNE8KW4sHo688HCDJetsYNqqU/AC
         tBir/n1DrjPlF1Z6w5IQB0Wnm3HZPlMPUNppl7JV2QrUjGC5tP1tgC8i1fuA0RVl+qTf
         Reb+B4y2eipZ9VmN+kxwm1In2AU8ulVlRonOsegoLo4d92VDR5syf3L+l/7pi6n9FqE4
         YOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788701501; x=1789306301;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9tYnhpE7QdeEZNd+tgaIJOLzvVhdJ+mADYDf3k6L6f8=;
        b=bW2aZuJ18SoqWhNDnzGsvGuLTRLuCa2KDY62vAAT9htsTKhPZ1VComiaqhk3WFNedl
         BGusnTBehsl3ZQZAhRk8eQOTmigBO6SYOclflvlKB0i3Yf5vcaLAH4/cSu1Z1RiqE7k6
         XLuuAvgrS20kShKc/b1ZexGF4K7iNcjMeCLO8o5XhJhWSQQ4+cNdFWrJadk6A7Tr56PQ
         9hNctViqo2R139x2a1aANIdUfJmgmjwordNIyiUfGYEDq0E2S/UEP7B5Z9n+amx3l2Zh
         xO2zYpYXPwAeip7oP51nvgY1XR26MI8+JeGhde5rSdjZD/HYm4rT/VG0iEwEixHlxx7M
         4EQw==
X-Forwarded-Encrypted: i=1; AKwUvBxoy2Ws6Rp91mX+Vu6yU2ia+tcKfyJ8sOtSzFdfPUvFhUNVdaWPyhjuwk9B3/kwJvR7uhHpExWENIKsUVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nXafPKmHrT5hKmrmQHIOE2ACTi/sQH5DEH3QE0JDxRZwZBUDvD
	O+UraAAAr3b4RaPxngpSVwYWZWFVdy8+5baZQescp8iZgr4WJYAQT7bd
X-Gm-Gg: AYBFou2FzeyCIV6boLNWB37G+ctucC66gVXAZPK457atPrVcS1QmtafIB29E10FbR09
	2lGJ8L+zHUA92gv3se92q6EzW5HwzANMc5Q9Y2S6PLJxmhclqVLGBqCqoVPxHEd1pHXBtAX/Jfd
	r4BxSh40LrZmWzHr8er1NeZ+2I8+KCPnO3/4su5M+FK4RwWE/S7DMq17Mis88jnyTNR7v9AayaT
	lYCvqUSTm1RJrfvBpcFBc9ch05gq0kqp6UJFtYrMd4K4Vwq1zfiRAhMciFnW46HKEB4LDyU5UzS
	k2E7Wum/gmGxqvGcXURRG07xOlQLldGo0Nt3gdPTLEkWvQLMtKJHV7aQ7VDfqODPY2/gAUYbu6X
	iHuY0BTkmLLKzui55N+gPQOPrAwGVH5TeikTOgKwd7CtIx5ch2NAaauR6mU1ChcGqWn+GzCugtW
	2e8hCLil9LhlDbhi6Jv+Cy7NwwfuVrL8kE8qF+VsHxXS7f2kEnzfNfJPXxy5gx+BZNuqj0cokNn
	yTaIvAgaOwCR67vYFUpLkxaJxU2aufn5H1kmk+SZ4ZpCQuxxACfPbKk
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr27559871a91.19.1788701501355;
        Sun, 06 Sep 2026 06:31:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm15084306a91.1.2026.09.06.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:31:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 21:30:31 +0800
Subject: [PATCH] phy: ingenic: fix unbalanced regulator disable in exit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5AMBAE0F+RPWtSGo36FXHQWqxDSReRNP5dc
 XyTmYnAGAgZmixCwJOYVp9Q5Bm4ufcTChqSoZSllkZqQSnz5ARWVa20MkbZEVJ7CzjS9T213W8
 +7IJuf+dw3w8IF5PcawAAAA==
X-Change-ID: 20260906-ingenic-e558363993bf
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?=E6=BC=86=E9=B9=8F=E6=8C=AF_=28Qi_Pengzhen=29?= <aric.pzqi@ingenic.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788701499; l=1089;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XV9/Gau1ScfFSIySp4WW7NMKBztrqxSBrSAXGTOY170=;
 b=fKwMjYR6GxaoT1Tx9EEILzy4qERnxsMXe/8MWE+hh4JcIIFIYXcLmhhtn7WV3LRmWw4913Hro
 jBaj1e6Z1WKCsbOxmt66L8I8/QBFQ4hxv19AxFx/C19EO43UR3YN3Ip
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

exit() and power_off() both disable vcc_supply, so the regulator
gets disabled twice for every power cycle, causing an unbalanced
disable WARN.

Drop the regulator_disable() call from the exit callback and leave
the regulator to the power_on/power_off pair.

Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
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

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260906-ingenic-e558363993bf

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

