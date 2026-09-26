Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251AC28033B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424695; cv=none; b=fKzDXkdGu5BIryvMuFFXqr112OIHmJ9AE1je+XHgematXZADUy+OXyPiUAiE+aG8lXL0TeIeCwyifvYGxphdafEAG7rCLF3uhGtSCHfWduXMHBoexc+dr2vYjqKArfz/Xj2I4/0Y++bgTVeNMBQ6tiX2rzWg4uahKNlT1tyJf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424695; c=relaxed/simple;
	bh=LPLjbx8I8Er+Ls1rTGy3VE3lTFlXqKXn4zGM+1+2f5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2tNicX4HoyRph8MBYRL0FUUd3/LggBb9QKl9TCGhPSlj0s19eTRK9JAzC2/vzVMBqX95cKva2q62HDABHicoSCa5D2ijCVz4kV9DV0TJnP0f52qH7dP5QDBSpdv89CBR4qCITKpaeppAfyu8+Psw+RAackDgP3gRnfP+n34Fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+sk5qJu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+sk5qJu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso7191635ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790424693; x=1791029493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UCqXVsEit/5UgovE1bO5G5/xS9YReJJK497aNTHOdc=;
        b=i+sk5qJuLG66S6nC7xXOHVYHkaQcO2NQAeSz1VZTONJ3UQt6ZysaNEEXJE+eQh133M
         aaNgb2hYkvXviU2eRFwu9a5xr5GmBJ6okAQezikfO1BSBEatxs4JPzAk0zTBSt5W6BN7
         it/GMfUEaDEohznpgf/TeSSRNBBNNM/uG857LEFdWhKv+hW8GY36yqjP1SsZMsvmHCuJ
         Rskejsv299DEj6XULGd9E6GddrpOMY/yNVewt7aPINVfl2Uo9JK4S7CoowxOJqXfqb42
         QYo6xA+5bLQ9XZN3wCAVtb8iG6bWzO+a1GFv6mw6wqXotn8cUq3qtw+IXk828Ouy5E0u
         GjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790424693; x=1791029493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UCqXVsEit/5UgovE1bO5G5/xS9YReJJK497aNTHOdc=;
        b=hUYzduKTLK9nIULxhDZRp8YDu9C6QVeYs/1yQEgifgfDjIL71eyWbOjj8oW3g6N9iA
         iJPPfCWBVem53R2QO9DS8nTmTiUYcs/S/IML0HFwLaWC0JtsILZYowDQK5bANdVKl1JU
         meMC9Vp2+Vs5eKjkK5vTfToUREzrB4HuKms3c/UsjujE7ahwYsJWC92xVAmD51qixHvD
         5kFhrSi/VobwsB8nxx1B+GBRdvy9IzlyiJeYyXvlsYdtzNDvmGiRAQKLyH+BWLF5TzXW
         6LwI8SL6PjNGRDNavrzjHla64olM+bUkfudiAXADItEIge80iUd8dEHnW9XucScCAYh9
         5MOw==
X-Forwarded-Encrypted: i=1; AKwUvByKQxNIEH1M4BcszENltpcFq+gqb4NkQcJCtE4nfRfAuyD+vvb95RuEggJvBRDGukoubsdiJ6tqHG/OLAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMfK6XVQHmmiUAY/7Cqm0+KwUtA1u8L2sCXPmQolY9XNNZuDBa
	ueYQvcQskuJI3dKRMOmsx9eJ2cMpF8orXoiMyKSkK+YgH9XT/EdYl0o8
X-Gm-Gg: AYBFou1RH8BLPnLfok43VANlAa9zmf7JDsPWqZKFPtz/1IkUb1M/ssh+bkawULpxzJR
	zHeGNwftIy8TkxE3w5uumIgdGvdE9kl1ix006WJg26wRx458ThCxU9S0FI4cZSFhHu9OCglHGsx
	adnpi8nEMeEqvFcDgAN5F3RA972MclX6ve9i3fMI4RN70a/piHF++OONdLJXcuJRG6ecqrw3ghR
	k/6qszReOzQJX84uuzLtq+QRZxGHmrU/+BhdxvF1ngfhUOahUSUSboZQrFwo4tt9H8KAzT91HVN
	QmcMqPLO8kuEObGLos/xvdx7FLCFtbkzADy/Qvc9dB+M8QKimiOaX9BMGNdr2rR0eCbIQQVU7hJ
	Cpuy1iSEJWAvW8qZbwGpvqyMlDtRH1G9VKD6o7S0uvFe00h4DPNcn6DsdmGEMRIEvaRgIuHLg4z
	bs4gtZXRQASg7AF54X9LWN8GFJRsFG4tdBURIsMARsydlgzdiTQpvnIH1jLK0I+5vAteB3xX98t
	A2WHNOP6nFz6xmi0h6IbpBtwNqCWsjvp1jaSNKpVbRT
X-Received: by 2002:a17:903:22c4:b0:2df:8ef0:4597 with SMTP id d9443c01a7336-2df8ef04654mr43600025ad.42.1790424693330;
        Sat, 26 Sep 2026 05:11:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:208b:3411:14ea:51a9:50f2:5786])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfe98sm21709715ad.22.2026.09.26.05.11.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 05:11:31 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rounak Das <rounakdas2025@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup
Date: Sat, 26 Sep 2026 17:38:46 +0530
Message-ID: <20260926120846.35716-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under altr_portb_setup() and socfpga_init_sdmmc_ecc(),
of_find_compatible_node() was being used to look up the sdmmc-ecc
node. This node wasn't being dropped using of_node_put().

altr_portb_setup() did not drop its reference under its success path
or on any error path.

socfpga_init_sdmmc_ecc() did an early return thereby skipping the
common exit label and thus leaking the reference.

Add the missing of_node_put() calls in altr_portb_setup(), and route
socfpga_init_sdmmc_ecc()'s success path through the common exit label.

Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
Fixes: 788586efd116 ("EDAC/altera: Initialize peripheral FIFOs in probe()")
Cc: stable@vger.kernel.org # 6.18+
Closes: https://sashiko.dev/#/patchset/20260708091135.94114-1-rounakdas2025%40gmail.com
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
v3:
 - Rebase on top of Dinh's "Address sashiko reviews part 1" series (Dinh).
 - Limit stable backport to 6.18+.
v2: https://lore.kernel.org/all/20260717131720.19038-1-rounakdas2025@gmail.com/
v1: https://lore.kernel.org/all/20260717102549.13309-1-rounakdas2025@gmail.com/
---
 drivers/edac/altera_edac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4c20fb926160..bb95dab847b3 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1506,6 +1506,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	dci = edac_device_alloc_ctl_info(sizeof(*altdev), ecc_name, 1,
 					 ecc_name, 1, 0, edac_idx);
 	if (!dci) {
+		of_node_put(np);
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate PortB EDAC device\n",
 			    ecc_name);
@@ -1518,6 +1519,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
 	if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL)) {
 		edac_device_free_ctl_info(dci);
+		of_node_put(np);
 		return -ENOMEM;
 	}
 
@@ -1584,6 +1586,8 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		rc = -ENOMEM;
 		goto err_release_group_1;
 	}
+	of_node_put(np);
+
 	altr_create_edacdev_dbgfs(dci, prv);
 
 	list_add(&altdev->next, &altdev->edac->a10_ecc_devices);
@@ -1600,6 +1604,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	 */
 	devres_release_group(device->edac->dev, altr_portb_setup);
 	edac_device_free_ctl_info(dci);
+	of_node_put(np);
 	edac_printk(KERN_ERR, EDAC_DEVICE,
 		    "%s:Error setting up EDAC device: %d\n", ecc_name, rc);
 	return rc;
@@ -1627,7 +1632,7 @@ static int socfpga_init_sdmmc_ecc(struct altr_edac_device_dev *device)
 		goto exit;
 
 	/* Setup portB */
-	return altr_portb_setup(device);
+	rc = altr_portb_setup(device);
 
 exit:
 	of_node_put(child);

base-commit: eef3b67f9c6782127163b631c9043011a68016e2
-- 
2.54.0 (Apple Git-157)

