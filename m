Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039373;
	b=UUehkDDxlkpXnmfu1JSgP6QRfsJ47XmLFf2u8GJo+Db/OqhktFjI3x/6XvhF8jTunQI7
	 d/nDNtVtOfE0H0CInHkGxyaWxyfTMzn3ZlwQ9PfQVUSIKbuuejfm5pmOkkbO/7gMZX2MR
	 rkw7tN5RdJuZ+Vu12rdttcU+gZHzfUR4tbyAPsM0T83UlV9mFlW0xkaNcGAQbEWfQ8xkN
	 78TzFrV2JbQQPEGO9c2lnQRZbJHAQ7HoeK1FCJR/rsOZ6x6PEVSbWa2ILrC1GyrPTiT6C
	 viC2daGIUx/Ah4JmSmvV8Zr+rFxys6xClVkItUlts2tq68ls94XI1ZEmtAWzcTQ3GhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=WrduQ2uoNekvAq2D7k81lSPRRgKBnqGZd2xml3ikDaVE2YqCe34seNZjTGvu53pgSDfv
	 fZuaCuaPBQW51LuMT5Ra9ITqrb0n58beBsOzOY/84ZW/UdnlEbZ4hG0xbZ6n5rJNkHi/4
	 7fpA5dVV9OgG+0B+Vain+0XbcEGv++Q5aWOn3i23UuJrApfhxUTyJ1QRYW+fKODVUBvOu
	 TR9GAvGfwdKTfCX1F2RPZ4/SXU++KYUxGqL7m2i3mtDpn20KUI63qhkYmI9reOVgoQYL5
	 AKdOF+sXK4i3ESNIo+7K+52Rq9w5pFc03Z28K7/5FBo+gX9D/J5XaU6TezWur/X7Ufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrdJqHUm;
	arc=none smtp.remote-ip=209.85.219.98
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D5606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrdJqHUm
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-9196d8543cbso33047286d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039367; x=1793644167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=i65A18T3o7HsxFCMt51CSUpOyG+VZlrGt8RkxEhksaZkjoeF62n7onlg5OiEZHEjEv
         cuyqcIRU0ZuCLyEM6K3edd7FFVfA0pPhYTgWo62MuoavQIAUBjMKzfKmjQhHnzWRsTer
         ZzkFYxMx2LOUq6Xg4hgI/2o6yajXnOFDmiTvKjkFfM+0dHxxWZUYojSQbgRgK8cdLB86
         7UrYSRWdkl/zMU6jd6iN7+OvnC/+MOYftN6Tuul+zWYeYWt98hmpW2ieX8MPxCM1YlZV
         pfDKg6l7CIgKNoscVKsXyEVrMQ1fCzYQWdemHSSjcd/Fcz8EPhEBUNmFES/5T+FIYyvm
         Pkvg==
X-Gm-Message-State: AFq9FYIOAoJtMY1fch0SvdkvUuGHpX9VmMVucEEJ9pG3MHC9tUWMnImj
	SWDhvGn4Dw713MfOSIWPnlWH0rZG8Pi78nLoKZAJZ/Xftu7Vu3Yu5FxPt4sXbtyC3ziJTm4kgjO
	otragql2d302zoHMQtow8Of3BLDX8MHOHs0/cV+xL02GCtJVmVDfu7wSpHYTqw4kdbzYPzDQsZC
	FwFo6oLPURcD2AUgPJZtBC3iSUMWOAH6UzZZSSxFy4HPIpLOGALnlxyXrqXu3QkQdMrGBvag+ZP
	1Gqt5BvzbPxAtFLZC+Ze5alpPU=
X-Gm-Gg: AYBFou2H1F12OpU2USmo0UiUdPIHd2W/FpaHlmQjlpaCjXm8m85cPsxs8b5flP7bE3M
	hyHmT15I1nIY3O0dbv/gYfis0ZDvkua4TNUkQDQYGv3fhnKE7vsR9j6d7Gx/5UN52/eGJ/tGGcB
	wZuiHwgEGp1rDT33vcucralixVuoNZQhYd4VNJvVlUxo6nyGzGKu6gFjRWD3vBGXi/Cj+cFJyfC
	D3PwE6LzPhCpNvN+z3IPPjOE41ji3pwGvN8NFjXMgTpzamvjEyELE5uSOb5/YD+/nEyt+AQjkHt
	ZPwdc8Onx318CS5lMlwegT0ow7ffvyE+buX9WXJ/7amBe6OLer6SDidUA/K49bdNVr96dYvMMFO
	4bW06VGFMaq0qreconu5NpAg5yQG5aiKQz8W/H4aDtt5PqMeGwT7M1kkKctMrOEk9c6T6xqR3PV
	UwgH+StqsdCDNRufX1Y5c55iox0nlxyM3WIP/eigAGyzs=
X-Received: by 2002:a05:6214:27e5:b0:91b:99b9:59d8 with SMTP id 6a1803df08f44-91c48e7fbdbmr132180396d6.58.1793039366756;
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c47c8c412sm709116d6.45.2026.10.26.11.29.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so2392702eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039365; x=1793644165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=NrdJqHUm350MLdrMsPBipFdOudEhxlwhjdFscE+PcsUJ7vtNvqiU5npnzYfdWYJl0v
         XKoZa/oL0QkAitD9k45Y+zVS/LQTGS2gmxxiLRSpwoQMqrWq9i7OOASCjITO6LrnrJ6/
         6TAqbM+rcWIVordiufiCxWgdWjD5+6cdXfcBc=
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303481eec.7.1793039365423;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303426eec.7.1793039364706;
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 11:28:51 -0700
Message-ID: <20261026182856.3168686-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus has one PCB register aperture for both SATA ports. Its
per-port OOB settings use separate banks, while the PLL registers are
shared.

The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
stride. NSP previously passed the shared base directly to the helpers.
For port 1, the new stride moves the bank selector from 0x1804033c to
0x1804133c in the AHCI register window, outside the PHY resource, and
prevents the second PHY from being initialized correctly.

Exclude NSP from the per-port aperture offset in both read and write
helpers, preserving its existing bank selection.

Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..b5fb9dff1ae9 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
 	void __iomem *pcb_base = priv->phy_base;
 	u32 tmp;
 
+	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
@@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
 
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
-- 
2.53.0

