Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FD3803C7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791417420; cv=none; b=kSnUOFa06cyxTa5aKcL7X4YwtNsjjE1/27npnxepwXw5w+4ZhLypMTzA074Z77SD3UApz9S8xsdsQ1yL2yi+Ncdb4THnz1RoxqZZSZdBoSJHAaD8GflIYQbjQnxXKml+4vKFMWBw9b2mEL67X+hFtf/0bZnn6EU/6NCcOe4grzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791417420; c=relaxed/simple;
	bh=wTGQazFubLCqxbPldR9hbYLyDpFfXFskPDhC+8cX3/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmM7G+YpFyM2kfQ3+IqbGNKT4QCploO2IfHS+F5OXv3HQrKpS16y2Nk/4d9fmdIQPsB4qpsmPeutkdwZ0Rbca2dlkChEstkRMplKGHEnaOr8CaZsUyUZlGYu8jBjLee2gVpRVcNS1hSECeRFTRkWlGCu24WVnpBJdZsHNXd0EaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DRnDyd3R; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DRnDyd3R"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5DFCE40E0481;
	Wed,  7 Oct 2026 23:56:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rE-gsLgWQXQA; Wed,  7 Oct 2026 23:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791417403; bh=OTGkaKjdC3+t7UGrsk86HX6T2bTRGbBM62FdwZNwnjs=;
	h=Date:From:To:Cc:Subject:From;
	b=DRnDyd3RtO5JZnP0rDZKCy6uBY9ZSUzlGf14l8WtKHhfkPFXwTeiekWf5cvyBdAec
	 BAsIdlf/iIMDejNmkVtkDcgSIg69RPdxn3ElP89JFO9nE2UTbcc4zXcgmSUfIpBCm5
	 xUybtaAsHQpGax4TVBdUXtN4m8GuPXcYi+2n6P94G/FuKE/dLMI5LbTwvEdzIy4jHQ
	 MoO6HRaQjDJpqXQRFyL5CFW3pAYt8FRiVbci2KmzK559k9w/yGCkTaWswJO1dPygRa
	 FLDVQvew1CpuofIOGm3dhOqRzsavHky47uppeZD3LDC+ivwAvscBLRR+oAwqdLPOp2
	 P8bwmZpBjNAvBNzoMHO+4Q4sXGZ2ySw7sSLEtjZDjIGBVcZcOiHgCDhcMGGlxg2t6E
	 btPF+lQh2YtNAkGBUpZQdtk5gFjLi8DO3GTm9xxKq1JWD/js/GfOHAoCtVzx3PQQ4j
	 HVv0RZ0xu6hxoZmqBraejb6veHwbn2WjU3Vqkm36jqzBQLppN5sVxoPRV7dngrOkxy
	 1RpNyOMgFnPHG7spRnaFhFHA+iCLRvdGlP2QErJBNXtPLznQyq6rB6cpi8DXLMO2TG
	 sXaYaEeyzQrh7q2eqNMznsC+z7oEvP5zLWfEoCpFyQqJ5k11uowZY6Zm8knZfsSU9A
	 0/E2DzVwkrK5E3vQ4WGoU6o0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3714C40E01B4;
	Wed,  7 Oct 2026 23:56:38 +0000 (UTC)
Date: Wed, 7 Oct 2026 16:56:35 -0700
From: "Borislav Petkov (AMD)" <bp@alien8.de>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] mfd: ls2kbmc: Fix stop_machine() function's retvals
Message-ID: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

see below.

It is totally untested because I don't have the hardware but the issue should
be clear.

Maybe the retvals should be tweaked, to denote even better what fails in
the function when it happens.

Thx.

---
stop_machine() takes a function to run @fn of type cpu_stop_fn_t as its
first parameter, which returns an int. That int is either 0 on a success
or non-zero on failure.

The ls2k_bmc_recover_pci_data() function returns "false" instead to
denote a failure, presumably, which gets promoted to a 0.

Add proper negative return values to denote the different failures
encountered.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/mfd/ls2k-bmc-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe..306e444a592a 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -268,18 +268,18 @@ static int ls2k_bmc_recover_pci_data(void *data)
 	}
 
 	if (i == 0)
-		return false;
+		return -ETIMEDOUT;
 
 	ls2k_bmc_restore_bridge_pci_data(parent, ddata);
 
 	/* Check if PCI-E is connected */
 	if (!ls2k_bmc_pcie_is_connected(parent, ddata))
-		return false;
+		return -EINVAL;
 
 	/* Waiting for U-Boot and DDR ready */
 	mdelay(LS2K_BMC_RESET_WAIT_TIME);
 	if (!ls2k_bmc_bar0_addr_is_set(parent))
-		return false;
+		return -EINVAL;
 
 	/* Restore LS2K BMC PCI-E config data */
 	pci_write_config_dword(pdev, PCI_COMMAND, ddata->bmc_pci_data.pci_command);
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
