Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140337;
	b=BIJKLmKRCSNTOjQQV90u8fGK7uTYw+YE7MMsRIwGxhUPCvDfSkBqxf76iJS/Km5hsSSl
	 2ivNb0REqD/Al9qQlzF2k0YcbPY2albkdPgW2t4Hl7O22UPlnR037HQ3A9AqUsAgP/my3
	 JWnx4twYDrOjzuaTSmN/W6RcP84waE1NI6a/TYCjcVYJbvbR5xVs3Q5gIeKUOnyKyiBIn
	 03pwtvm7Y+/MgfwDq2GBoL08tt9UvALu3zfHiTkptmma5TPTPA0cMhMZmXAH+ezlkDovm
	 n5yixt8rIv6iW2zT+BWNPzyH4laarVwSsGnkMdL3jQjvlfGyJe2Xnw4zU5aMa5MnKcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
	b=pGMo18fI2jLcWmY9TeO/LNEG+wPcJcWkbfxJvCWH/PN4En74onyxN+CxxlSj52Jaamdj
	 OnykU7iIBNsDCWtnjhS190etDcn93dQO+3ziZg9zjcc3nVfbngwOEfPFjIf7koFGBP8yy
	 qGpcnAVEWrAFFTfF6NScNwojWHLdRjbztCWzY78sQB0YO2q68m5warflb1i31f1eh2a2G
	 187kDEmysWF3IxVLN3l80j8OYYhCHXWFf8qB2FnXeNduDA1stTetla7S797uOzHwyK+8c
	 pYL8J/pDBXVUd2J+eG1/h3Gjpss1URJi033KTQYZXxXix9zCA6i34q985C3fl8AbS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQrJ57+l;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B64606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B64606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQrJ57+l
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so756744c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140336; x=1793745136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
        b=JQrJ57+lHenhwTyAjh7P9W6trOV22I4mZb5s2ncXIuMNkkMWYLbCU8m58HXWcDia6W
         f0KbQt+6vvaFA1BEKH/r1JBnCDuVIdm5AgXJtuzcqI9EzW9aUiBmeLGlMWIRWCMZE93z
         Kljf+4rLzdnP9glTyVIdLRm6ZtLp4ykQKrnlnn2WaJDxrRpweSxOJ9sRj3HRlC6BLcCv
         z4FHjU+4nCy9eHCGrcZ21wm+s9xZR9mgmUF13PQHLCCPSVAkG1ZvfIHclBVyNN1ciJjM
         G8CbKTY5PlddnniD/3WW32CQDm24zBRVdyX4xEivOqT7Tapvg7nUxC/0bP8YqqPdnVQh
         nFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140336; x=1793745136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4BQktSMRlYHvWF/4DH3ceG+qWnGiYhdIgnI5VmkEx0=;
        b=XdYSlUTz/WCsqgYQLf3ypizs7l76ftvgh5U3iQ7T4hMMCrUi0fwooiPBqF/47Yh1om
         wMczJ6styg4DIC2leU/yKxEYb+xIkNDp90FFGzmEhrzR0Zz6b6YQN/xaklxyRL+rtJfN
         2xVfKEbb0WyopqnuFOkSD2R5b9F/ST974mOi7uZ9Uv/QRdbmZnKRRTCEA8PVsOZDkOVl
         dLMsmG1zbkdPCoVoNTlVxawav6abWSvNoIAPEyhw7qNq0HFYNNOsikpLIOVZ8WSznaSM
         SlTf6opiyctz68zdF/vE1eBh9TIbN1HtfFo6L82jKF8tlqU2QYZ4w0nWFLl1Tb5JutBT
         OLLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXySudOEHKZFKBY7LpmNkdbavcKPHqtTy8PtKL/uqx5AXA27vrNpWN12SJenOAcAKHpAoSx8iEgyTdMzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFTNBn/YLjHRWH2x/6qtspYUkDJcWC72Xn5HzYf1YWPQ+2Q6w8
	oGlrqV2EjROqgKcNu+iV8IUf547g55w4wL3Z6Jnl6ODEq4oZX51f9c4q
X-Gm-Gg: AYBFou3QsWLh3ZuOfJVPzWNXD1yd5gEGIeLFsX2Mupcqe6k5DAfiRtinQ2Kp41HNF3o
	STNMdVTv3b3KX+FuZMByEoW6kqNeBYpJtjV86VndrHBkGFrO5nexRGxVIwYQUAl9LFKOVu9uIcE
	+BD7Tqjq1BUHjCeKVIx53pxJ2DcFMmL26rI5Q5fjagL1soKFr9oMk0o429TqjodojKBfY4etIuo
	rnXDKDsLfYSpaQJfwty0pm9Dn5jJqDDvrF8nMtFEWqcblV5D6xY1a/m37S269Cc700pOGFbvPtB
	gxxgq9XgY3yJYDxrEBbD21soo+iMkpRVRwykUo3JamB3AUWcdBzdJVH4q4uheIOfuCpCMv65Mpz
	4BHU0+c+27tcQA12Ejfl8Je3c1dXjHU6yr80195clIdO8vUcdurgE/4H6J8ctt7go7oycRAl+Pp
	9ITKcSh2iwu71skJjbB4x3fzwbPimxlp2SHr5aYBxNhZRnRKuSa1iT0ouFFzB7mx7IREuHsGnOq
	BplzrJ+mDrm3888k/HpAHyqgUuoxyq3m8jejsXv553o9FTleGEM4DrDjpuYA5EsyAET+tlPIecu
	T+5FWA==
X-Received: by 2002:a05:701b:4651:20b0:180:15be:1f9c with SMTP id a92af1059eb24-1a6cd499691mr736339c88.30.1793140335703;
        Tue, 27 Oct 2026 15:32:15 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:14 -0700 (PDT)
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
Subject: [PATCH net 11/11] net: phy: smsc: wait for LAN83C183 power-down recovery
Date: Tue, 27 Oct 2026 15:31:40 -0700
Message-ID: <20261027223140.3774570-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

