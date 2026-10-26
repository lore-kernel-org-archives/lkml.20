Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042286;
	b=rtQ3axdFpphaop745pP3B5BMoDJHIwpQLqb9OJp/uw0JTYQo0LhAxDkz28Go9qQhl3nr
	 HuUPJDPOiNfhwxEvdYO1p7HULyAcFauPhi1EYgvX8nTLpG9sjwfNFsNG8ovWKXDAJZjcS
	 UsWa18GBHIEm15uxb/Cd+2xmaPlo8xLlx5T9x6OY6BcjUu9PhWxin6WjOlzj7N1BIJt9w
	 jj10qPCCfZvXlpF+vh/p6Omc4gTPUSUWSLBnstPvp6Qr+dZLUI4C10KXWkvgUMwvhJMqt
	 akjg/zv4HZDSivneuEgsZIKULE3qtUNy+GVrgfjGW5juQtN+SLMi227+rUNe+FtjapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042286;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=ExPir7y5A9IoVLf0UeO4yFd+1YdSxjmo3l/jZjlCPFeHG3mPW0YVhiWtAtSaLprPB6nI
	 mfgAYtVq7vNecLeUIKhhHYlacbL3Cg0LvHRWyN9GqHL/I/yI8RlQ2C4uo0cIwnUQbBEPa
	 YF/JUvUOokSogDU6G4Kx+kuSDy/XXtbbX5jkGAyvBaPXAPLiOOIUfRkcm9LZA+3k9D9mf
	 SJ9dbU2A09OqgNivlPMQxw7MB2lS5Nswvc1YrrQD81FlDE4SdmmHuouRsddrcD6HhoaKk
	 f7LQYryIK91OkWp1hh2sWiHotyfc2h0kOgdP5EdwDTip0q//m/9lPyzvdcgwBxWTjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Sza3ARwz;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C71606A332
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C71606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Sza3ARwz
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so1047708137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042285; x=1793647085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=10A/U9SO8OCPSY2qyzzETHmABqsTkqljCEg1zj86c9Mxh4SIXGvOC5d+ImVAs7vgdT
         iWZvDtMXJBvY78yKMadcMa9TFvA/gkpKm89AU17Vu3nzQtlU+ZgACZvACzFFgAlhSn4O
         2lCqevZV5NMqKbbyJUQ59pCbNkQGybUeuVHpO4M6RtaoilPOUKg9YxpfalC9FD4iM3tw
         d4/4Ma4Y8BpNn0QR36XyIxwdHEtfJd0jVsKoEcLr/8igEGVhD6SZifQB2G2AQD2BGs+g
         b2qIzjjHFFOVH2gRNaBqQD/WZwk8d31yVex7lUYdAPFoCLwUPLkloPF2SiHt5ZtGRDhX
         oHrg==
X-Gm-Message-State: AFq9FYJytAp/w8+1NYmZD/XXsGpbWyQP3VjiDP5o8eedD5BftvAlCDEa
	BfsjuzQduZ/YM8ig/vYRFxl/tYlGHTNArihzsivwiR90ipZK0HdxrZE5Xd4GUP0nvD8P5uIWNoq
	Nq37iWGtCNMdNwOAPzaxn4G319mY2V3IHj5ZJB7i1H+MG33zW2Mlq19pV0d/kJlI2MT8PRT3jkZ
	yQJgJXSvkXIPIFaPrNcXTROtTQKBrUdl1rSAgK9ag4JTj62HTarLkprjAKVj8EzvXUii/oVZYbQ
	x9h+n53ViI0mZ99bc3znt3CpN8=
X-Gm-Gg: AYBFou3z3Cx7DdOEfY+oJF7z4eUe7GL4C1UuUx19Dy3dku7FrYwmm18cuzKXzcSU+30
	KxwmGNl4IdNciOmYJwyxfpWajRkIc6Ne0mz0aBF6q8xaeZI4V5aLVzRqJSL2OXAb267wrNW6xZ7
	GPXmkJJ6kWxPdOwDsiJLBEVwOF8VNWAtbiGjA/EpbsK8C/gzAcLo9Q8HWAagvW6pqIgm27hJ1+4
	siFq0TWfvBm+oqu0WZZlQSK4Rk6sp9+rC4ffpPe6mmmzhGHo32am8mBHrhac8ZNSXOtDwoW4Vck
	h9SAK8Lw440j/WO00U6MQY3fYMBsbi6DZ/K731LYomfWTecUTVaRwaxSiTBw+z/23el+4Gvb32h
	rESX+qTI+mk/MowCXsqJc8N7yBoBr8zooY8rxyKInz7Y+KfVwb9/0C/lkh2ZDoKwO1hqfB59KyV
	MGhlwfySwqqvBJtJcD+TaH+5c/+77Br5kE/TsQFnML
X-Received: by 2002:a05:6102:b10:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7ce5cd41424mr2311290137.20.1793042285366;
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7cea3ccc4bbsm1125137.16.2026.10.26.12.18.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so87079976d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042285; x=1793647085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=Sza3ARwz/FoybdfoLdugEciq9efCUu2KQbzRgPcUXyGvjQmXEhBPy9Hdx2etuA66j1
         7wP59urS3PvzliPAHDImir29XAX0d1qddw/7/mEyuEsLJ+O5teF3mvqw8QKHMiGfGsAa
         kzQCui8ZhKI/cyTPjjekLUiiQpwApnaRjbTYw=
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119686576d6.17.1793042284623;
        Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119685776d6.17.1793042283921;
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
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
Subject: [PATCH v3 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 12:16:13 -0700
Message-ID: <20261026191618.3178830-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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

