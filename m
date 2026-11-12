Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459258;
	b=FIPcmHWgWmXdud7Bg6VAtoGJ9X8hEf8z94JoMUp1DVDjlt12yGpsaERNdtkPTCAa2XO/
	 gciPeHnBaPmXipgtofok110uR5aQ3pU1VmmzoJlqwmqaqJgyVqS/Un2W0a9fVGBaDqGY/
	 KX/3nTvg+prrReAptQrqVrY+obyLLhFFLsiOirZBHPftxXg7266V+Bkm6xlC4nBTfrpIE
	 2OfDs/ey7ZYsOFTUwjSJe7eKIBj4n7bdbpcAJJWRd76Tjp5tWAsyw0C3kmyBMKSLigbmW
	 hg41iNwsQAHxR4IFtzaF8kMgXNTuhstSKvAFOBiCqS81kVdtU4/1W7iQzkez61jzT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
	b=Iff08gwaH9/Ud6X8aU0leTQbF8+NbUDaqfkg+97pOEY7oQXeXTvCfi9OVN+TV5XtprBo
	 4XzUQacOqW6kJDRqVNd8L3tEQlX6khA4mVl2fLv8r1oYhbTLQtpdDucimEhbm7gJVUgVZ
	 b23Ap+2iOim9uEVE/DvY77X4quFRyc48O2QnKrxOWf7Y2Oe0avKH/nLt87peBzQon4pdv
	 kS8e4m/k7RVQDU2Shrcq21mNnZJqBE6rR2fIVY8xNiQBKBvYg3DBbMse8wwiRVmgavDaQ
	 S8j1SrBdGHmD9p+zeNLmIClwF1PYfBRvojsmY5wRYi0rgGuBRURp/8j2NUhahYh1D/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPFScD85;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D22A606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D22A606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPFScD85
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5852639eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459256; x=1795064056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
        b=iPFScD85PsZv8LHT/PgflVmuoG/DMPT5VMLPWwT8NoTJoj2D1nrdo6K+5giU12Y+Jn
         EYPIWlhKwMVOkUUvxfPaS5XXCQ5BanFutYroYJT7n+2P9P7v+MFGieudv/HWEyrOG07c
         JJbkZKBDMaMki3FvX33T+VsikkkJcrtStKrgzo+UkBm0iZ5g/lV44kyiBjQUQuRh/vXE
         JfQC8KU/Atp+8K2Pjz09TqedwadUXnTpDEi/pIE9deYQJwKVKyNIZEeRql6/usv39tHd
         +RqtQLZoq84sT2k/CutAFpI1CKJcYlp4E7X/8tk6IN/cE0Z1TpVF9MIXNHXUA+Jnjib8
         3Rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459256; x=1795064056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
        b=Mt4uwNlB8P3F5OM+W5JW/jzxDTpqQ1lPy9LFEb8K9JV/GrEpbr/xcj089CA7i1tcAb
         UpyIvGJfULFDwtROwDzRwwj3yCgHo/Phb2VTtyR9yC2/0ZImL8JwPqbdH05GOo95fwsN
         9rGxFJ8IGibtc1XUkWX9PgBnzliRtrlvMJoSrHvsMmPv0ImMGIW0BHfE8ViXYKnjocGT
         Ydxtz96G5PSMVqAPFYsNSdv4M2y+gf7kPyjqbt36H7ctLgc2YqA9AwknEVdvK0jQztq4
         sdBaNvNrR5VHaJBjSHneOQykkfvS1pcYkbToRHsDNkBSR0Jt6N4m4B1Y2nvd4h73CUrJ
         fdMg==
X-Forwarded-Encrypted: i=1; AL+hErFpy6mUVTbJJwEO5avwgEV2cY+t9WlLshtmosi3waKdWXYnTVd9nzfN9FJVJQIjESZn9opaE/wjlUkmNhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92hWv8oyfPWUDFKz9DrzOCTUAbZ74zJ8ZqTdScdjx/hJ/UBYS3
	vn4dcto47YMjLyW/qdI9Jd0ctp5CAMMzwSnJyQA1p9c2WAsRF4EKWCPG
X-Gm-Gg: AYBFou2U6aJyay+bRC2PI9t3lkLvoKEEcxDT1vKvcBDbOnHCPYxR2IFNoo6oWRRlkoq
	XrfbsamoLEKj2tJLtHOEy/Nf1xvTt+pxU0IqAu1t3z9C1n6kHnfvIehOQsy8RzqrFA9xRbrxV0b
	juzmh/rKf8qYjNPHxa6ML2xWtgm+Kzxx24lqTtWBV+1b8rHSOMiEULU2WNn2CTktTaKhr2kMhrm
	LXy1dSdprlRZZtmCYbQMcVo2so8RC553sWssxDralPpPuu6Fbp4C9yZSuO3vzqPAogWbzyTnku1
	p9NrD9HeWliw8MqM6uiXn+tQBcYwWYxXKLXD/1QoClRw12ysn2iL9JO4ia7wMX6XYrdCDsqWVCl
	cna/UFdKIn6ju8/tDW/uaNsOd1i8Y9qjCv/UoJj7svPXgSYAvYn05qM+L7g24/+QPCFY+vhLM3P
	9psF1y9tDNWeQB1bjZp0uHH+x81BlFNSKhqkC3LPrMfq23oRT0GX5u99ZXRVeJRHeK4b6lOdyHj
	rknLmbYHP93w3U5tMp5KQxLgnOh/t+IuHS7HeffKnqhnY2t21ZSZzreMUQJz7+wQmrBApkXOvvF
	jykOIE64MF2BhdaIp3FsS3FzGgbsTA==
X-Received: by 2002:a05:7300:e9db:10b0:377:2fb9:9296 with SMTP id 5a478bee46e88-3772fb9c7afmr3183946eec.8.1794459256200;
        Wed, 11 Nov 2026 20:54:16 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:54:09 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 10/12] net: phy: smsc: wait for LAN83C183 power-down recovery
Date: Wed, 11 Nov 2026 20:52:52 -0800
Message-ID: <20261112045301.3669532-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

The LAN83C183 uses the generic PHY driver, which returns immediately
after clearing BMCR_PDOWN. Section 1.11 of the datasheet allows 500 ms
before normal operation is restored. Starting the Au1000 MAC before the
MII clocks recover can hang the MTX-1 when reopening its interface.

Add a LAN83C183 driver entry and resume callback. Wait for recovery only
when BMCR_PDOWN was actually cleared, and propagate MDIO errors without
waiting. Resuming an already awake PHY does not incur the delay.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/Kconfig |  2 +-
 drivers/net/phy/smsc.c  | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 30e9d22c8d1a..10466b2574eb 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -421,7 +421,7 @@ config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
 	help
-	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
+	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
 
 config STE10XP
 	tristate "STMicroelectronics STe10Xp PHYs"
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 48487149c225..c3b51afd4b1e 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
@@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(smsc_phy_probe);
 
+static int lan83c183_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
+	if (ret < 0)
+		return ret;
+
+	/* The PHY needs up to 500 ms to restore operation after power-down. */
+	if (ret)
+		msleep(500);
+
+	return 0;
+}
+
 static struct phy_driver smsc_phy_driver[] = {
 {
+	.phy_id		= 0x0016f840,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "SMSC LAN83C183",
+
+	.get_features	= genphy_read_abilities,
+	.suspend	= genphy_suspend,
+	.resume		= lan83c183_resume,
+	.set_loopback	= genphy_loopback,
+}, {
 	.phy_id		= 0x0007c0a0, /* OUI=0x00800f, Model#=0x0a */
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "SMSC LAN83C185",
@@ -887,6 +912,7 @@ MODULE_AUTHOR("Herbert Valerio Riedel");
 MODULE_LICENSE("GPL");
 
 static const struct mdio_device_id __maybe_unused smsc_tbl[] = {
+	{ 0x0016f840, 0xfffffff0 },
 	{ 0x0007c0a0, 0xfffffff0 },
 	{ 0x0007c0b0, 0xfffffff0 },
 	{ 0x0007c0c0, 0xfffffff0 },
-- 
2.53.0

