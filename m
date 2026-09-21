Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6A2D238F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955996; cv=none; b=UIHL21rH0J11kVgOnebBXkD/ne5PiBPTjEgDw8pgm4R3x/lfRqMA9jaZHa7voAn/1CPpw5KN0g8HJVMYJjMTaeO8mcPDQGeCuHxYvYl+swqtxmgJ0muONz9cSANMGE8nLyboRl0n5AX9Q7Ksucd3PVWrr324JNSra4gpnoa3BSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955996; c=relaxed/simple;
	bh=kW5bVQRCoqrI5ZVf1ECPBcmjU5MFYED1PQS4A/dkRFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G74bFaOy5EkiyWzjaeK6oNN+2pllahqKz3MD4hFghM+jxaaQlljyluzTKv+R6wf4pltDXdsseM16alX1H+HioRBVYunsSTIvpNBDyP5FbbsNqwlbhoFuZCQs4p7mnMBR9fGyMxoFsudJLYgEOa4sqs7Q74kAOVhai4B+zMKp6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQG0VbOw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQG0VbOw"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso21335385ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955995; x=1790560795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5asLPp18b/l+0s1qeYWjIfvnNcbJX0h5CaYuSOAhSt0=;
        b=KQG0VbOwaJODsTx8ep2xVGKUlfPzJHjod3p5oWevHxM9G+IhMQHQFTtVoGWEP+QMXy
         RdYBrm1CyWVhfSoU/f+zNGC1V/Mt1rgoioDFQXvf4BFFb2MYbvJB+AXXy2p9SG19QjWy
         CWkYMy0pGO/7IaWaXtR/I6Islxno2tOJOI1TWswE/FfgbayG2JlFDbqKR7PfVJ3GvxcR
         vdYnY+G9gHVPJ3468KuKgG900uXuqr32I2+2ZD2VmQo2oB65T1J0aDk/5B0gmAYpNg4X
         v/igLOaA3LBG59DMFzAMltSNrpOre6+kxFjhO/reRvzMcIZ3IhRINKvLapTjzQxCE2uj
         k2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955995; x=1790560795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5asLPp18b/l+0s1qeYWjIfvnNcbJX0h5CaYuSOAhSt0=;
        b=x4aLWFy4Bh5FfgCubZNlWZ32tV0ROHNcTOhmbLOuGGrt4C1ZPux0PLpEBcKoD41Skl
         V1Dr734NJvcU/iQtrVyFbiSSWxnII4yoO6cIrey2iM/MwEy2/PeRIXbjt9HqdYMgDdOD
         /zeB2dyWJ6X9eyyp3Nt+MuEm087kE2VDjLbLckTWZS04b1D8pEYvm+gZDkty6He68L37
         op/rEbO3GAd2kfAHkbvt8qpMlGVv31cwBqjbJcm2Oh9LlAsRZ3LK+rgahYMKGQeBHHbz
         RBKJIo0v/eqO1ohm+agyqwPZh/VcyxbyFdZf/XCu9V0DteZfKvBrHabT+PWGh1uHzmf9
         r+1A==
X-Forwarded-Encrypted: i=1; AKwUvByDW+puLBTfd42geXH1HIVNp9CC6TMiK/6oCpHhsBzEX3n+Nwfczor8e8m2vL7fbRwXWxfU5YNwJvKJeZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nNopTcXIHFcJvVUwu0rHPUT9+v9yV1BlU0oMaAR8KGcHxPfJi3
	LX2dLKJ+1N7mD4M3lCvUn74nx5729ORboGqrZ+j52po9HS3FSDzTP4CU
X-Gm-Gg: AYBFou0mG2LMwCOsoWH3TyS0zA6DkdSpWELoBXtQq8RScSDOSYTMz3Z8BgAzl79F2Bt
	dE6wAz86HBZXdvE+tpqkK8CzsWJTzBiqdwXwsElNaJqj15i7B4xbc6tJQj5WgUcrThOy1CP/TP1
	HjhvkVM0MOkPT8MMri6dvvvHb4oERftxFw+S5S3CxGTJZyL/Ottdbtw7WjIgyXUO7GAF1hu8fQo
	lPN331hsw6jB44lp46vSqz6ZnPS0Ei2vxZaDIXhMCj7lxQebS5/psfIN8ASo5d/c2jkgceyWoLS
	u/P9vATDCqgXSWhykxC+yF/pDcCA3Ft17qqJgezjl+R//NocbNcnmRz1OE0Ol4VJ3tU+MMZO94p
	nD4Qm2eDG4bzw5N9nk0E2B/+5rPCD/tAPMchAXsoqOmnp28aEgIvhfIN90SyrQ4GEV6Rvc044En
	WilCttLgUO7BscW3XWfVgrKRrXyXq8HmCD70rpLj/a5RQBH4nFPHTN3kgM7njExT8AdW/5ATykd
	M14DYpsghZkFY9zUvinC4nydn08peGpA5uDu0CHqw+R6tny1B+weqfKVCKtA/zyiTtC5VnMd1yJ
	TgBjzaGutmnEBBj8z0YazIWcqQwWX7SavtYmJz46Pj0lWko0YHX6F0/zOyY=
X-Received: by 2002:a17:903:2acc:b0:2dd:c100:b2c4 with SMTP id d9443c01a7336-2ddc100b34amr85692785ad.47.1789955994727;
        Sun, 20 Sep 2026 18:59:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df46c0dad9sm7458995ad.29.2026.09.20.18.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:59:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
Date: Sun, 20 Sep 2026 18:59:52 -0700
Message-ID: <20260921015952.1047410-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UTMI pad configuration was kept in a heap-allocated void * member of
struct tegra_usb_phy, even though the driver is the only user of the
field.  Embed the struct directly in the phy state to drop the
allocation and the void pointer indirection.  The config is
zero-initialized when the phy struct is allocated, so no extra init
is needed.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 15 ++++-----------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 00443a7beaeb..12abc99bdf89 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -392,7 +392,7 @@ static int utmip_pad_close(struct tegra_usb_phy *phy)
 
 static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->pad_regs;
 	u32 val;
 	int err;
@@ -549,7 +549,7 @@ static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
 
 static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
 	int err;
@@ -888,7 +888,7 @@ static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 value)
 
 static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
 	int err = 0;
@@ -1324,7 +1324,7 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
 static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 			  struct platform_device *pdev)
 {
-	struct tegra_utmip_config *config;
+	struct tegra_utmip_config *config = &tegra_phy->config;
 	struct resource *res;
 	int err;
 
@@ -1345,13 +1345,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 		return -ENOMEM;
 	}
 
-	tegra_phy->config = devm_kzalloc(&pdev->dev, sizeof(*config),
-					 GFP_KERNEL);
-	if (!tegra_phy->config)
-		return -ENOMEM;
-
-	config = tegra_phy->config;
-
 	err = read_utmi_param(pdev, "nvidia,hssync-start-delay",
 			      &config->hssync_start_delay);
 	if (err)
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de..953ba9f06c2a 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -76,7 +76,6 @@ struct tegra_usb_phy {
 	struct regulator *vbus;
 	struct regmap *pmc_regmap;
 	enum usb_dr_mode mode;
-	void *config;
 	const struct tegra_phy_soc_config *soc_config;
 	struct usb_phy *ulpi;
 	struct usb_phy u_phy;
@@ -87,6 +86,7 @@ struct tegra_usb_phy {
 	bool wakeup_enabled;
 	bool pad_wakeup;
 	bool powered_on;
+	struct tegra_utmip_config config;
 };
 
 #endif /* __TEGRA_USB_PHY_H */
-- 
2.55.0

