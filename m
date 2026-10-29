Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309129;
	b=aTM5pY5QRoHaunIFMIlrGr2g7GeBFn9kMzdeVDcB6VTi/QZkj3BVe2POgvsSWRmWP4gK
	 XIRBDxusVJon/TdkDotJP0eLjT3CFoYbFAYf2WqJ4KwcuPuR2Ep2PCQK71PEbHbfmmGtL
	 sU3DfBhSiak/5nFD7BHMACCM7eCeVxwlGmVMuPdtyL86CFSnSonVN486sqZZz6OzoRV1V
	 1TvjXEDf+BqFtGNW8KszoLqo9elQrSw8GWD4OMC67FvkgKKRDyGfECAL0al4ic48L8e0q
	 VlyBkU7N71mjZZCpt5Z3Xqu2+mBqHu8mEpSzaNM2wA9EH+Nm/m5g22e4LkmkTCAg93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=qJ55S2rMLwsQED1taC7FQgyjuhr1tUxjuWBZN3aXBBSeef/X42kcrtIkCdwtGxA40D6f
	 bouebBQWDrL1Yxuv68od7nzYqDgUd1fhrptZ5+qFxQQc6TwbsdDy+Iah+V3UjXiEAP3DM
	 yq+uFAElQZVMgZMLUkGLDiqe8sMhAoHLoumWo+0ebANOQtwTEhMiRxOdWdnc5uexTfuiw
	 gpVKQMo6pkG/Z4HQDt551NkM+G2enKITlT/FCUF1kmiAQcy3EVGY/m2CPtEJ11lKDayjQ
	 fc5cv2XYsw/iNYz+g1o2+2DW/PXcQIOjucBL/Tqxlyco/ruFvxsxKWP3gbKM3+x8dVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SYZDi6rA;
	arc=none smtp.remote-ip=74.125.224.99
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C6606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5C6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SYZDi6rA
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-679e86015e2so1373160d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309128; x=1793913928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=I9df7tQRqEwfvYoW1cgfu8KTK3IbvldffmJ0+Kzj03u7bOvoNS2hlHslpyN1vKQQ3f
         ylqQ1yxxbZd6CZT3GXAgx/FmBj2TbLjUml8P1gjWZIETlguL7ESI0kleI2qNd0oc8qv3
         IfCKaXHSo6n+5ScmVRFZKH47JH4EhXegQgcppUkR5zK52Re4vzNmVO+GLyTCsTGPEPHC
         vPFS+5mIrv8yo4L1MlFHFgXDlUphhmcetFJqHbaAipy6FtaG4SaZzTYvcp/HXMwgtQZw
         OCpTpiL9PYaekNZpRW8jtWoxO5L1ZuXhpZFYjMbACdx4wkQDZ7B15vknzW9I+CsWZn0X
         HFBg==
X-Gm-Message-State: AFq9FYJ0HBdIo3W5ivXw61GldO2UdViMHtAwJUubBbq7QW9ZRlBi8CFA
	ONj0BxdN5xsRSkLIvVZmSy6opRKBoAGPg8MnpXoZ4B7NMmEwAV4EpO+UPP4CtH1MNOrYnDu5Zts
	lJH05+zh6Fh4o1SKAKuX4Mtbmjp3b7okPXP8TYPRxfqAgwZ67jUhvAwdHTl1UI7Pv4Meop+tRpZ
	cuqeNtys73qa48Z4r/RXeHeizR6H06z8M+ANKAR7UsPEnSyt//vbts+HRqVCIIa6Y92jaQbI+IS
	X1sdISBOeZPk+BacwuPOXNmiMI=
X-Gm-Gg: AYBFou0giNWp8XDMA4MgBdM3pGfv4h91rRbgpDvhdjEi+RqsXd/oPrBdeA67oWUXFng
	q7j2Pazb///1bbs7qA/Hp0w1DwKYkUPmwigX5K55tUzSZwzK5ymTWEqhP7IoKvBgaLcPZu3ZAON
	A/J4LlNHTe92hU3PBT1l7fP+3U1cULPMGJbCKr7+7ldhdyOCl/lGYLtINxopE8S53Rvhv79CFLP
	iFTiaPKHjcwxZWmecxKCAKG/VpXC9EGmm5g48ToyJWDH9C/OpnOiV1J71RqktTaQuNBhSLv7ssf
	TEfeeHi35PA1LNkz9QMYlfdv6jdHJU4DA8V0Yym/kjml/v/rBn0q5XMioVX0eb/I2vrbBObgl3d
	ZP8JQfW/6n509ZSOV9tBEgaVm3tydLSaJ7F7bGVbxyTrb2zQGFQdkXiHm+r52ELAPwm3IgIYPhh
	OLkkRln3Krc+CVkRC0GkdbIm9ab/OpsgIZYs0cvMkU
X-Received: by 2002:a05:690e:e85:b0:67a:553d:c06f with SMTP id 956f58d0204a3-67a8d611a7bmr2414430d50.44.1793309127835;
        Thu, 29 Oct 2026 14:25:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67ba3963523sm5644d50.21.2026.10.29.14.25.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c938148eeso2353646d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309127; x=1793913927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=SYZDi6rATPJq8Zao52OYuJ6jxtqhnjs9qWKUQL3KRTs6AUtSiwJwrxjaXaM83bCBOx
         Cf3esCbw/lNiR7wzHgulnZUSc6iCsQSYKqPk4UQWM0Lz79C+8FBuYnfCdU+jq85bkyfH
         dySV1zu2AVk+7ojehfNw+sPmXsXWFB6ejNXgs=
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500846d6.17.1793309126892;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500336d6.17.1793309126431;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
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
Subject: [PATCH v4 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Thu, 29 Oct 2026 14:25:08 -0700
Message-ID: <20261029212513.4126083-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

