Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A646C4D0;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931472; cv=none; b=TPIR0v0nVuFlBYDJTVvIqg3qHuwGCdphI1plSVs33qtVIqmHfWxvJxtJQ6lsy2jY53k2rF3qMuePq84cTJTKoRD/ztMPfCDzHAXutCizbWlcw9j8FaIDMLX/DW9qO/VONDG9lV7LrCjY0uuO6A0ls4W1rNeAaVxcnoGxK8Y9hrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931472; c=relaxed/simple;
	bh=HjcE3IBoLkTxMkp9l6/U0Pf8TKNClsLy0vcIjp1SRWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSStKHLp1vCkk82IecxZXSpeqggiqdFWjTzOgm4N7kT1pNNlaBQoNqRBaSErfVuwGX+EF3BFrt8M3EIbEcicl1NrwXQapLhD1bVAHKN+3JHhISYE9UILcjDhQnpkpKPdwJD7W23I5sGWmF7QvGCOgaHPl7BK5no44hTjk6foAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVtbYKsA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVtbYKsA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CE93C4AF17;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790931472;
	bh=HjcE3IBoLkTxMkp9l6/U0Pf8TKNClsLy0vcIjp1SRWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tVtbYKsAX2rVoRKO4wQcBwX305lSX/wPApAxMDEtfjyP584om4Trr3Yw9ZmlAZ52O
	 m2boUN9dUcHgFRaQGl02p2Ds9B+vKQwnuXvLyDYlyzXaOlu68el5QzFLWNb1vFOiHH
	 BbWgBZY+ExXgZ9cJwYSGnWtp4ovqnRm1xQGDa4gw+8YMf+m4ueH+GnxKmmB5H+ZsCy
	 JmFHJl6sTz2TILTRWe8aqUmhr+nyHxgL+oumnSJkXmQmmCkp/HcdgVQXnjBMWUseKp
	 hc+3qJBd7nPEeZA87/U7cBR48LNEkZ6yNje4ELcH3GWWU4DRRuAf+4T9ux/cTrcSC1
	 3b6am1gdxEj4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A179CA5FD9;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
From: Maurizio Casciano via B4 Relay <devnull+mauriziocasciano7.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:57:42 +0200
Subject: [PATCH v10 04/15] media: ov2740: Add OVTI2740 ACPI ID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-submission-media-yogabook-v10-b4-final-v10-4-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790931470; l=781;
 i=mauriziocasciano7@gmail.com; s=yogabook-kernel-20261002;
 h=from:subject:message-id;
 bh=WYtfemeHuy7ef9ZiV3s5KTsq9He8+bmbcT7l4tlNMts=;
 b=pzvrP6PeVLEpVqg46VxncSMpX7JAENHr6I5/Hrcl+6pA/i9zyYxb7Wxk0uAGyjQP+qMiZbbEc
 ZyeXddrz5vKA5RvLSzbQ9cNDKC/fhOsNzXGUW8cN/Izlzo0vgg4LSud
X-Developer-Key: i=mauriziocasciano7@gmail.com; a=ed25519;
 pk=ODC2oSPBqt7ukC3AEDZNS7LIE21D8ke8TEHoNlxniNM=
X-Endpoint-Received: by B4 Relay for
 mauriziocasciano7@gmail.com/yogabook-kernel-20261002 with auth_id=1099
X-Original-From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reply-To: mauriziocasciano7@gmail.com

From: Maurizio Casciano <mauriziocasciano7@gmail.com>

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 64a85735c1b8..830f5857d73f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);

-- 
2.53.0


